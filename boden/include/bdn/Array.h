#ifndef BDN_Array_H_
#define BDN_Array_H_

#include <vector>

#include <bdn/StdSequenceCollection.h>

namespace bdn
{

/** Implements an array of element the type indicated by the first template
    parameter. For example Array<int> is an array of integers.

    The Array class is derived from std::vector and is 100 % compatible with it.
    It can be used as a drop-in replacement.

    Array provides renamed aliases for some std::vector methods and types to ensure that
    they match the naming conventions used otherwise in the framework. The new
    names are also intended to make using the class more intuitive for newcomers that may not be familiar with
    the C++ standard library.

    Note that Array is also derived from bdn::Base, so it can be used with smart pointers (see bdn::P).
    
    Additionally, some utility and convenience functions have been added to Array that std::vector
    does not have to make commonly used functionality more convenient (like sorting, etc).

    Like the C++ standard library collections, one can specify an "allocator" type as an optional
    second template argument. This is used when special custom memory management is needed.
    If you do not need that then you should ignore the ALLOCATOR template argument and leave it at the default. 

*/
template<typename ELTYPE, class ALLOCATOR = std::allocator<ELTYPE> >
class Array : public StdSequenceCollection< std::vector<ELTYPE, ALLOCATOR> >
{
public:
    /** Creates an empty array.*/
    Array() noexcept( noexcept(ALLOCATOR()) )
     : StdSequenceCollection( ALLOCATOR() )
    {
    }

    /** Constructs an array that uses a specific allocator object.*/
    explicit Array( const ALLOCATOR& alloc ) noexcept
        : StdSequenceCollection(alloc)
    {
    }


    /** Initializes the array with \c count copies of \c el. 
    
        Optionally, one can also pass an allocator object for custom memory management.
    */
    Array( typename StdSequenceCollection::SizeType count, const ElementType& el, const ALLOCATOR& alloc = ALLOCATOR() )
        : StdSequenceCollection(count, el, alloc)
    {
    }


    /** Initializes the array with \c count default-constructed elements. 
    
        Optionally, one can also pass an allocator object for custom memory management.
    */
    explicit Array( typename StdSequenceCollection::SizeType count, const ALLOCATOR& alloc = ALLOCATOR() )
        : StdSequenceCollection(count, alloc)
    {
    }
    

    /** Initializes the array with copies of the elements from the iterator range [beginIt ... endIt) 

        Optionally, one can also pass an allocator object for custom memory management.
    */
    template< class InputIt >
    Array( InputIt beginIt, InputIt endIt, const ALLOCATOR& alloc = ALLOCATOR() )
        : StdSequenceCollection(beginIt, endIt, alloc)
    {
    }

    /** Initializes the Array with copies of the elements from the specified other array.*/
    Array( const Array& other )
        : StdSequenceCollection(other)
    {
    }


    /** Initializes the Array with copies of the elements from the specified std::vector object.*/
    Array( const std::vector<ELTYPE, ALLOCATOR>& other )
        : StdSequenceCollection(other)
    {
    }


    /** Initializes the Array with copies of the elements from the specified std::vector or Array object.
        
        The specified allocator object is used to initialize the array's internal allocator.
        */
    Array( const std::vector<ELTYPE, ALLOCATOR>& other, const ALLOCATOR& alloc )
        : StdSequenceCollection(other, alloc)
    {
    }

    /** Moves the data from the specified other array to this array. The other array is invalidated by this.*/
    Array( Array&& other ) noexcept
        : StdSequenceCollection( std::forward(other) )
    {
    }


    /** Moves the data from the specified other vector to this array. The other array is invalidated by this.*/
    Array( std::vector<ELTYPE, ALLOCATOR>&& other ) noexcept
        : StdSequenceCollection( std::forward(other) )
    {
    }


    /** Moves the data from the specified other array to this array. The other array is invalidated by this.
    
        The specified allocator object is used to initialize the array's internal allocator.
        */
    Array( Array&& other, const ALLOCATOR& alloc )
        : StdSequenceCollection( std::forward(other), alloc )
    {
    }


    /** Moves the data from the specified other vector to this array. The other array is invalidated by this.
    
        The specified allocator object is used to initialize the array's internal allocator.*/
    Array( std::vector<ELTYPE, ALLOCATOR>&& other, const ALLOCATOR& alloc )
        : StdSequenceCollection( std::forward(other), alloc )
    {
    }


    /** Initializes the array with the specified initializer list. This is called by the compiler
        when {...} initialization is used (see example below).

        Optionally, one can also pass an allocator object for custom memory management.

        Example:

        \code

        // initialize the array with these elements: 1, 13, 42
        Array<int> ar { 1, 13, 42 };

        \endcode
    */
    Array( std::initializer_list<ElementType> initList, const ALLOCATOR& alloc = ALLOCATOR() )
        : StdSequenceCollection( initList, alloc )
    {
    }


    /** Replaces the current contents of the array with copies of the elements from the specified other
        vector or Array.
        
        Returns a reference to this Array object.
        */
    Array& operator=( const std::vector<ELTYPE, ALLOCATOR>& other )
    {
        std::vector<ELTYPE, ALLOCATOR>::operator=( other );
        return *this;
    }


     /** Replaces the current contents of the array with copies of the elements from the specified
        initializer list. This is called by the compiler if a  "= {...} " statement is used. For example:

        \code
        Array<int> ar;

        ar = {1, 17, 42};
        \endcode

        Returns a reference to this Array object.
        */
    Array& operator=( std::initializer_list<ElementType> initList )
    {
        std::vector<ELTYPE, ALLOCATOR>::operator=(initList);
        return *this;
    }  




    /** Moves the data from the specified other Array object to this array, replacing any current contents in the process.
        The other Array object is invalidated by this operation.
        */
    Array& operator=( const Array&& other )
        noexcept( ALLOCATOR::propagate_on_container_move_assignment::value || ALLOCATOR::is_always_equal::value )
    {
        std::vector<ELTYPE, ALLOCATOR>::operator=( std::forward(other) );
        return *this;
    }
    

    /** Moves the data from the specified other Array object to this array, replacing any current contents in the process.
        The other Array object is invalidated by this operation.
        */
    Array& operator=( const std::vector<ELTYPE, ALLOCATOR>&& other )
        noexcept( ALLOCATOR::propagate_on_container_move_assignment::value || ALLOCATOR::is_always_equal::value )
    {
        std::vector<ELTYPE, ALLOCATOR>::operator=( std::forward(other) );
        return *this;
    }


    /** Returns a reference to the element at the specified zero-based index.

        The reference can be used to modify the element in-place.
    */
    ElementType& atIndex( SizeType index )
    {
        return StdSequenceCollectionType::at(index);
    }


    /** Const version of atIndex() -- returns a const reference to the element at the specified zero-based index.
    */
    const ElementType& atIndex( SizeType index ) const
    {
        return StdSequenceCollectionType::at(index);
    }


    /** [] operator that returns a reference to the element at the specified zero-based index.

        The reference can be used to modify the element in-place.

        Example:

        \code

        Array<int> ar = {7, 42, 117};

        int el = ar[1]; // el will be 42

        ar[1] = 23;     // the 42 element will be overwritten with the number 23

        \endcode
    */
    typename StdCollection::ElementType& operator[]( typename StdCollection::SizeType index )
    {
        return StdSequenceCollectionType::at(index);
    }


    /** Const version of operator[] -- returns a const reference to the element at the specified zero-based index.
    */
    const typename StdCollection::ElementType& operator[]( typename StdCollection::SizeType index ) const
    {
        return StdSequenceCollectionType::at(index);
    }

    
    /** Returns a pointer to the underlying raw array data.*/
    ElementType* data() noexcept
    {
        return StdSequenceCollectionType::data();
    }
    
    /** Const version of data() - returns a const pointer to the underlying raw array data.*/
    const ElementType* data() const noexcept
    {
        return StdSequenceCollectionType::data();
    }




    /** Prepares the array for a bigger insert operation. This is purely for optimization
        purposes and can be used to prevent intermediate re-allocations when a lot of elements are added.

        The function will ensure that the internal buffer can hold at least the specified
        total number of elements. This number of elements includes any current elements that the array may have.

        Note that the number of elements of the array is not modified by this function - it only optimizes 
        internal memory management.
    */
    void prepareForSize(SizeType size)
    {
        std::vector::reserve(size);
    }


    /** Returns the zero based index that corresponds to the specified iterator.*/
    SizeType iteratorToIndex( ConstIterator it ) const
    {
        return it-begin();
    }


    /** Returns an iterator to the element at the specified zero based index.
    
        If the index equals the size of the array then the end() iterator is returned.
    */
    Iterator indexToIterator( SizeType index )
    {
        return begin()+index;
    }

    
    /** Const version of indexToIterator() - returns an const iterator to the element
        at the specified zero based index.*/
    ConstIterator indexToIterator( SizeType index ) const
    {
        return begin()+index;
    }
    

};


}


#endif
