// -*- C++ -*-
//
// $Id$

// ****  Code generated by the The ACE ORB (TAO) IDL Compiler ****
// TAO and the TAO IDL Compiler have been developed by:
//       Center for Distributed Object Computing
//       Washington University
//       St. Louis, MO
//       USA
//       http://www.cs.wustl.edu/~schmidt/doc-center.html
// and
//       Distributed Object Computing Laboratory
//       University of California at Irvine
//       Irvine, CA
//       USA
//       http://doc.ece.uci.edu/
//
// Information about TAO is available at:
//     http://www.cs.wustl.edu/~schmidt/TAO.html

ACE_INLINE
PortableInterceptor::ObjectReferenceFactory::ObjectReferenceFactory () // default constructor
{}

ACE_INLINE
PortableInterceptor::ObjectReferenceFactory::~ObjectReferenceFactory () // destructor
{}

ACE_INLINE const char* 
PortableInterceptor::ObjectReferenceFactory::_tao_obv_static_repository_id ()
{
  return "IDL:omg.org/PortableInterceptor/ObjectReferenceFactory:1.0";
}

ACE_INLINE
PortableInterceptor::ObjectReferenceTemplate::ObjectReferenceTemplate () // default constructor
{}

ACE_INLINE
PortableInterceptor::ObjectReferenceTemplate::~ObjectReferenceTemplate () // destructor
{}

ACE_INLINE const char* 
PortableInterceptor::ObjectReferenceTemplate::_tao_obv_static_repository_id ()
{
  return "IDL:omg.org/PortableInterceptor/ObjectReferenceTemplate:1.0";
}


#if !defined (TAO_USE_SEQUENCE_TEMPLATES)

#if !defined (__TAO_UNBOUNDED_VALUETYPE_SEQUENCE_PORTABLEINTERCEPTOR_OBJECTREFERENCETEMPLATESEQ_CI_)
#define __TAO_UNBOUNDED_VALUETYPE_SEQUENCE_PORTABLEINTERCEPTOR_OBJECTREFERENCETEMPLATESEQ_CI_

ACE_INLINE PortableInterceptor::ObjectReferenceTemplate **
PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::allocbuf (CORBA::ULong nelems)
{
  PortableInterceptor::ObjectReferenceTemplate **buf = 0;
  
  ACE_NEW_RETURN (buf, PortableInterceptor::ObjectReferenceTemplate*[nelems], 0);
  
  for (CORBA::ULong i = 0; i < nelems; i++)
    {
      buf[i] = 0;
    }
  
  return buf;
}

ACE_INLINE void 
PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::freebuf (PortableInterceptor::ObjectReferenceTemplate **buffer)
{
  if (buffer == 0)
    return;
  delete[] buffer;
}

ACE_INLINE
PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq (void)
{
}

ACE_INLINE
PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq (CORBA::ULong maximum)
  : TAO_Unbounded_Base_Sequence (maximum, _TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::allocbuf (maximum))
{
}

ACE_INLINE
PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq (CORBA::ULong maximum,
  CORBA::ULong length,
  PortableInterceptor::ObjectReferenceTemplate* *value,
  CORBA::Boolean release)
: TAO_Unbounded_Base_Sequence (maximum, length, value, release)
{
}

ACE_INLINE
PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq(const _TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq &rhs)
  : TAO_Unbounded_Base_Sequence (rhs)
{
  if (rhs.buffer_ != 0)
  {
    PortableInterceptor::ObjectReferenceTemplate **tmp1 = _TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::allocbuf (this->maximum_);
    PortableInterceptor::ObjectReferenceTemplate ** const tmp2 = ACE_reinterpret_cast (PortableInterceptor::ObjectReferenceTemplate ** ACE_CAST_CONST, rhs.buffer_);
    
    for (CORBA::ULong i = 0; i < rhs.length_; ++i)
      {
        if (tmp2[i] != 0)
          tmp2[i]->_add_ref ();
        tmp1[i] = tmp2 [i];
      }
    
    this->buffer_ = tmp1;
  }
  else
  {
    this->buffer_ = 0;
  }
}

ACE_INLINE PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq &
PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::operator= (const _TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq &rhs)
{
  if (this == &rhs)
    return *this;
  
  if (this->release_)
  {
    PortableInterceptor::ObjectReferenceTemplate **tmp = ACE_reinterpret_cast (PortableInterceptor::ObjectReferenceTemplate **, this->buffer_);
    
    for (CORBA::ULong i = 0; i < this->length_; ++i)
    {
      if (tmp[i] != 0)
        tmp[i]->_remove_ref ();
      tmp[i] = 0;
    }
    if (this->maximum_ < rhs.maximum_)
    {
      _TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::freebuf (tmp);
      this->buffer_ = _TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::allocbuf (rhs.maximum_);
    }
  }
  else
    this->buffer_ = _TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::allocbuf (rhs.maximum_);
  
  TAO_Unbounded_Base_Sequence::operator= (rhs);
  
  PortableInterceptor::ObjectReferenceTemplate **tmp1 = ACE_reinterpret_cast (PortableInterceptor::ObjectReferenceTemplate **, this->buffer_);
  PortableInterceptor::ObjectReferenceTemplate ** const tmp2 = ACE_reinterpret_cast (PortableInterceptor::ObjectReferenceTemplate ** ACE_CAST_CONST, rhs.buffer_);
  
  for (CORBA::ULong i = 0; i < rhs.length_; ++i)
    {
      if (tmp2[i] != 0)
        tmp2[i]->_add_ref ();
      tmp1[i] = tmp2 [i];
    }
  
  return *this;
}

ACE_INLINE TAO_Valuetype_Manager<PortableInterceptor::ObjectReferenceTemplate,PortableInterceptor::ObjectReferenceTemplate_var>
PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::operator[] (CORBA::ULong index) const
// read-write accessor
{
  ACE_ASSERT (index < this->maximum_);
  PortableInterceptor::ObjectReferenceTemplate ** const tmp = ACE_reinterpret_cast (PortableInterceptor::ObjectReferenceTemplate ** ACE_CAST_CONST, this->buffer_);
  return TAO_Valuetype_Manager<PortableInterceptor::ObjectReferenceTemplate,PortableInterceptor::ObjectReferenceTemplate_var> (tmp + index, this->release_);
}

ACE_INLINE PortableInterceptor::ObjectReferenceTemplate* *
PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::get_buffer (CORBA::Boolean orphan)
{
  PortableInterceptor::ObjectReferenceTemplate **result = 0;
  if (orphan == 0)
  {
    // We retain ownership.
    if (this->buffer_ == 0)
    {
      result = _TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::allocbuf (this->maximum_);
      this->buffer_ = result;
      this->release_ = 1;
    }
    else
    {
      result = ACE_reinterpret_cast (PortableInterceptor::ObjectReferenceTemplate**, this->buffer_);
    }
  }
  else // if (orphan == 1)
  {
    if (this->release_ != 0)
    {
      // We set the state back to default and relinquish
      // ownership.
      result = ACE_reinterpret_cast(PortableInterceptor::ObjectReferenceTemplate**,this->buffer_);
      this->maximum_ = 0;
      this->length_ = 0;
      this->buffer_ = 0;
      this->release_ = 0;
    }
  }
  return result;
}

ACE_INLINE const PortableInterceptor::ObjectReferenceTemplate* *
PortableInterceptor::_TAO_Unbounded_Valuetype_Sequence_PortableInterceptor_ObjectReferenceTemplateSeq::get_buffer (void) const
{
  return ACE_reinterpret_cast(const PortableInterceptor::ObjectReferenceTemplate ** ACE_CAST_CONST, this->buffer_);
}


#endif /* end #if !defined */


#endif /* !TAO_USE_SEQUENCE_TEMPLATES */ 

#if !defined (_PORTABLEINTERCEPTOR_OBJECTREFERENCETEMPLATESEQ_CI_)
#define _PORTABLEINTERCEPTOR_OBJECTREFERENCETEMPLATESEQ_CI_

// *************************************************************
// Inline operations for class PortableInterceptor::ObjectReferenceTemplateSeq_var
// *************************************************************

ACE_INLINE
PortableInterceptor::ObjectReferenceTemplateSeq_var::ObjectReferenceTemplateSeq_var (void) // default constructor
  : ptr_ (0)
{}

ACE_INLINE
PortableInterceptor::ObjectReferenceTemplateSeq_var::ObjectReferenceTemplateSeq_var (ObjectReferenceTemplateSeq *p)
  : ptr_ (p)
{}

ACE_INLINE
PortableInterceptor::ObjectReferenceTemplateSeq_var::ObjectReferenceTemplateSeq_var (const ::PortableInterceptor::ObjectReferenceTemplateSeq_var &p) // copy constructor
{
  if (p.ptr_)
    ACE_NEW (this->ptr_, ::PortableInterceptor::ObjectReferenceTemplateSeq (*p.ptr_));
  else
    this->ptr_ = 0;
}

ACE_INLINE
PortableInterceptor::ObjectReferenceTemplateSeq_var::~ObjectReferenceTemplateSeq_var (void) // destructor
{
  delete this->ptr_;
}

ACE_INLINE PortableInterceptor::ObjectReferenceTemplateSeq_var &
PortableInterceptor::ObjectReferenceTemplateSeq_var::operator= (ObjectReferenceTemplateSeq *p)
{
  delete this->ptr_;
  this->ptr_ = p;
  return *this;
}

ACE_INLINE ::PortableInterceptor::ObjectReferenceTemplateSeq_var &
PortableInterceptor::ObjectReferenceTemplateSeq_var::operator= (const ::PortableInterceptor::ObjectReferenceTemplateSeq_var &p)
{
  if (this != &p)
    {
      if (p.ptr_ == 0)
        {
          delete this->ptr_;
          this->ptr_ = 0;
        }
      else
        {
          ObjectReferenceTemplateSeq *deep_copy =
            new ObjectReferenceTemplateSeq (*p.ptr_);
          
          if (deep_copy != 0)
            {
              ObjectReferenceTemplateSeq *tmp = deep_copy;
              deep_copy = this->ptr_;
              this->ptr_ = tmp;
              delete deep_copy;
            }
        }
    }
  
  return *this;
}

ACE_INLINE const ::PortableInterceptor::ObjectReferenceTemplateSeq *
PortableInterceptor::ObjectReferenceTemplateSeq_var::operator-> (void) const
{
  return this->ptr_;
}

ACE_INLINE ::PortableInterceptor::ObjectReferenceTemplateSeq *
PortableInterceptor::ObjectReferenceTemplateSeq_var::operator-> (void)
{
  return this->ptr_;
}

ACE_INLINE 
PortableInterceptor::ObjectReferenceTemplateSeq_var::operator const ::PortableInterceptor::ObjectReferenceTemplateSeq &() const // cast
{
  return *this->ptr_;
}

ACE_INLINE 
PortableInterceptor::ObjectReferenceTemplateSeq_var::operator ::PortableInterceptor::ObjectReferenceTemplateSeq &() // cast 
{
  return *this->ptr_;
}

ACE_INLINE 
PortableInterceptor::ObjectReferenceTemplateSeq_var::operator ::PortableInterceptor::ObjectReferenceTemplateSeq &() const // cast 
{
  return *this->ptr_;
}

// variable-size types only
ACE_INLINE
PortableInterceptor::ObjectReferenceTemplateSeq_var::operator ::PortableInterceptor::ObjectReferenceTemplateSeq *&() // cast 
{
  return this->ptr_;
}

ACE_INLINE TAO_Valuetype_Manager<PortableInterceptor::ObjectReferenceTemplate, PortableInterceptor::ObjectReferenceTemplate_var>
PortableInterceptor::ObjectReferenceTemplateSeq_var::operator[] (CORBA::ULong index)
{
  return this->ptr_->operator[] (index);
}

ACE_INLINE const ::PortableInterceptor::ObjectReferenceTemplateSeq &
PortableInterceptor::ObjectReferenceTemplateSeq_var::in (void) const
{
  return *this->ptr_;
}

ACE_INLINE ::PortableInterceptor::ObjectReferenceTemplateSeq &
PortableInterceptor::ObjectReferenceTemplateSeq_var::inout (void)
{
  return *this->ptr_;
}

// mapping for variable size 
ACE_INLINE ::PortableInterceptor::ObjectReferenceTemplateSeq *&
PortableInterceptor::ObjectReferenceTemplateSeq_var::out (void)
{
  delete this->ptr_;
  this->ptr_ = 0;
  return this->ptr_;
}

ACE_INLINE ::PortableInterceptor::ObjectReferenceTemplateSeq *
PortableInterceptor::ObjectReferenceTemplateSeq_var::_retn (void)
{
  ::PortableInterceptor::ObjectReferenceTemplateSeq *tmp = this->ptr_;
  this->ptr_ = 0;
  return tmp;
}

ACE_INLINE ::PortableInterceptor::ObjectReferenceTemplateSeq *
PortableInterceptor::ObjectReferenceTemplateSeq_var::ptr (void) const
{
  return this->ptr_;
}

// *************************************************************
// Inline operations for class PortableInterceptor::ObjectReferenceTemplateSeq_out
// *************************************************************

ACE_INLINE
PortableInterceptor::ObjectReferenceTemplateSeq_out::ObjectReferenceTemplateSeq_out (ObjectReferenceTemplateSeq *&p)
  : ptr_ (p)
{
  this->ptr_ = 0;
}

ACE_INLINE
PortableInterceptor::ObjectReferenceTemplateSeq_out::ObjectReferenceTemplateSeq_out (ObjectReferenceTemplateSeq_var &p) // constructor from _var
  : ptr_ (p.out ())
{
  delete this->ptr_;
  this->ptr_ = 0;
}

ACE_INLINE
PortableInterceptor::ObjectReferenceTemplateSeq_out::ObjectReferenceTemplateSeq_out (const ::PortableInterceptor::ObjectReferenceTemplateSeq_out &p) // copy constructor
  : ptr_ (ACE_const_cast (ObjectReferenceTemplateSeq_out&, p).ptr_)
{}

ACE_INLINE ::PortableInterceptor::ObjectReferenceTemplateSeq_out &
PortableInterceptor::ObjectReferenceTemplateSeq_out::operator= (const ::PortableInterceptor::ObjectReferenceTemplateSeq_out &p)
{
  this->ptr_ = ACE_const_cast (ObjectReferenceTemplateSeq_out&, p).ptr_;
  return *this;
}

ACE_INLINE ::PortableInterceptor::ObjectReferenceTemplateSeq_out &
PortableInterceptor::ObjectReferenceTemplateSeq_out::operator= (ObjectReferenceTemplateSeq *p)
{
  this->ptr_ = p;
  return *this;
}

ACE_INLINE 
PortableInterceptor::ObjectReferenceTemplateSeq_out::operator ::PortableInterceptor::ObjectReferenceTemplateSeq *&() // cast
{
  return this->ptr_;
}

ACE_INLINE ::PortableInterceptor::ObjectReferenceTemplateSeq *&
PortableInterceptor::ObjectReferenceTemplateSeq_out::ptr (void) // ptr
{
  return this->ptr_;
}

ACE_INLINE ::PortableInterceptor::ObjectReferenceTemplateSeq *
PortableInterceptor::ObjectReferenceTemplateSeq_out::operator-> (void)
{
  return this->ptr_;
}

ACE_INLINE TAO_Valuetype_Manager<PortableInterceptor::ObjectReferenceTemplate, PortableInterceptor::ObjectReferenceTemplate_var>
PortableInterceptor::ObjectReferenceTemplateSeq_out::operator[] (CORBA::ULong index)
{
  return this->ptr_->operator[] (index);
}


#endif /* end #if !defined */

#if defined (__ACE_INLINE__)
//@@ Boris: begin experimental
TAO_NAMESPACE CORBA
{
  TAO_NAMESPACE_STORAGE_CLASS void add_ref (PortableInterceptor::ObjectReferenceFactory *);
  TAO_NAMESPACE_STORAGE_CLASS void remove_ref (PortableInterceptor::ObjectReferenceFactory *);
}
TAO_NAMESPACE_CLOSE
//@@ Boris: end experimental
#endif /*__ACE_INLINE__*/
TAO_Export CORBA::Boolean operator<< (TAO_OutputCDR &, const PortableInterceptor::ObjectReferenceFactory *);
TAO_Export CORBA::Boolean operator>> (TAO_InputCDR &, PortableInterceptor::ObjectReferenceFactory *&);
#if defined (__ACE_INLINE__)
//@@ Boris: begin experimental
TAO_NAMESPACE CORBA
{
  TAO_NAMESPACE_STORAGE_CLASS void add_ref (PortableInterceptor::ObjectReferenceTemplate *);
  TAO_NAMESPACE_STORAGE_CLASS void remove_ref (PortableInterceptor::ObjectReferenceTemplate *);
}
TAO_NAMESPACE_CLOSE
//@@ Boris: end experimental
#endif /*__ACE_INLINE__*/
TAO_Export CORBA::Boolean operator<< (TAO_OutputCDR &, const PortableInterceptor::ObjectReferenceTemplate *);
TAO_Export CORBA::Boolean operator>> (TAO_InputCDR &, PortableInterceptor::ObjectReferenceTemplate *&);

#if !defined _TAO_CDR_OP_PortableInterceptor_ObjectReferenceTemplateSeq_I_
#define _TAO_CDR_OP_PortableInterceptor_ObjectReferenceTemplateSeq_I_

CORBA::Boolean TAO_Export operator<< (
    TAO_OutputCDR &,
    const PortableInterceptor::ObjectReferenceTemplateSeq &
  );
CORBA::Boolean TAO_Export operator>> (
    TAO_InputCDR &,
    PortableInterceptor::ObjectReferenceTemplateSeq &
  );

#endif /* _TAO_CDR_OP_PortableInterceptor_ObjectReferenceTemplateSeq_I_ */

