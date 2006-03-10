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
// and
//       Institute for Software Integrated Systems
//       Vanderbilt University
//       Nashville, TN
//       USA
//       http://www.isis.vanderbilt.edu/
//
// Information about TAO is available at:
//     http://www.cs.wustl.edu/~schmidt/TAO.html

// TAO_IDL - Generated from
// be\be_codegen.cpp:291


#include "tao/IORTable/IORTable.h"
#include "tao/CDR.h"
#include "ace/OS_NS_string.h"

#if defined (__BORLANDC__)
#pragma option -w-rvl -w-rch -w-ccc -w-aus -w-sig
#endif /* __BORLANDC__ */

// TAO_IDL - Generated from
// be\be_visitor_arg_traits.cpp:69

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

// Arg traits specializations.
namespace TAO
{
}


// TAO_IDL - Generated from 
// be\be_visitor_exception/exception_cs.cpp:63

IORTable::AlreadyBound::AlreadyBound (void)
  : CORBA::UserException (
        "IDL:IORTable/AlreadyBound:1.0",
        "AlreadyBound"
      )
{
}

IORTable::AlreadyBound::~AlreadyBound (void)
{
}

IORTable::AlreadyBound::AlreadyBound (const ::IORTable::AlreadyBound &_tao_excp)
  : CORBA::UserException (
        _tao_excp._rep_id (),
        _tao_excp._name ()
      )
{
}

IORTable::AlreadyBound&
IORTable::AlreadyBound::operator= (const ::IORTable::AlreadyBound &_tao_excp)
{
  this->ACE_NESTED_CLASS (CORBA, UserException)::operator= (_tao_excp);
  return *this;
}

IORTable::AlreadyBound *
IORTable::AlreadyBound::_downcast (CORBA::Exception *_tao_excp)
{
  return dynamic_cast<AlreadyBound *> (_tao_excp);
}

const IORTable::AlreadyBound *
IORTable::AlreadyBound::_downcast (CORBA::Exception const *_tao_excp)
{
  return dynamic_cast<const AlreadyBound *> (_tao_excp);
}

CORBA::Exception *IORTable::AlreadyBound::_alloc (void)
{
  CORBA::Exception *retval = 0;
  ACE_NEW_RETURN (retval, ::IORTable::AlreadyBound, 0);
  return retval;
}

CORBA::Exception *
IORTable::AlreadyBound::_tao_duplicate (void) const
{
  CORBA::Exception *result = 0;
  ACE_NEW_RETURN (
      result,
      ::IORTable::AlreadyBound (*this),
      0
    );
  return result;
}

void IORTable::AlreadyBound::_raise (void) const
{
  TAO_RAISE (*this);
}

void IORTable::AlreadyBound::_tao_encode (
    TAO_OutputCDR &cdr
    ACE_ENV_ARG_DECL
  ) const
{
  if (cdr << *this)
    {
      return;
    }
  
  ACE_THROW (CORBA::MARSHAL ());
}

void IORTable::AlreadyBound::_tao_decode (
    TAO_InputCDR &cdr
    ACE_ENV_ARG_DECL
  )
{
  if (cdr >> *this)
    {
      return;
    }
  
  ACE_THROW (CORBA::MARSHAL ());
}



// TAO_IDL - Generated from 
// be\be_visitor_exception/exception_cs.cpp:63

IORTable::NotFound::NotFound (void)
  : CORBA::UserException (
        "IDL:IORTable/NotFound:1.0",
        "NotFound"
      )
{
}

IORTable::NotFound::~NotFound (void)
{
}

IORTable::NotFound::NotFound (const ::IORTable::NotFound &_tao_excp)
  : CORBA::UserException (
        _tao_excp._rep_id (),
        _tao_excp._name ()
      )
{
}

IORTable::NotFound&
IORTable::NotFound::operator= (const ::IORTable::NotFound &_tao_excp)
{
  this->ACE_NESTED_CLASS (CORBA, UserException)::operator= (_tao_excp);
  return *this;
}

IORTable::NotFound *
IORTable::NotFound::_downcast (CORBA::Exception *_tao_excp)
{
  return dynamic_cast<NotFound *> (_tao_excp);
}

const IORTable::NotFound *
IORTable::NotFound::_downcast (CORBA::Exception const *_tao_excp)
{
  return dynamic_cast<const NotFound *> (_tao_excp);
}

CORBA::Exception *IORTable::NotFound::_alloc (void)
{
  CORBA::Exception *retval = 0;
  ACE_NEW_RETURN (retval, ::IORTable::NotFound, 0);
  return retval;
}

CORBA::Exception *
IORTable::NotFound::_tao_duplicate (void) const
{
  CORBA::Exception *result = 0;
  ACE_NEW_RETURN (
      result,
      ::IORTable::NotFound (*this),
      0
    );
  return result;
}

void IORTable::NotFound::_raise (void) const
{
  TAO_RAISE (*this);
}

void IORTable::NotFound::_tao_encode (
    TAO_OutputCDR &cdr
    ACE_ENV_ARG_DECL
  ) const
{
  if (cdr << *this)
    {
      return;
    }
  
  ACE_THROW (CORBA::MARSHAL ());
}

void IORTable::NotFound::_tao_decode (
    TAO_InputCDR &cdr
    ACE_ENV_ARG_DECL
  )
{
  if (cdr >> *this)
    {
      return;
    }
  
  ACE_THROW (CORBA::MARSHAL ());
}



// TAO_IDL - Generated from
// be\be_visitor_interface/interface_cs.cpp:60

// Traits specializations for IORTable::Table.

IORTable::Table_ptr
TAO::Objref_Traits<IORTable::Table>::duplicate (
    IORTable::Table_ptr p
  )
{
  return IORTable::Table::_duplicate (p);
}

void
TAO::Objref_Traits<IORTable::Table>::release (
    IORTable::Table_ptr p
  )
{
  CORBA::release (p);
}

IORTable::Table_ptr
TAO::Objref_Traits<IORTable::Table>::nil (void)
{
  return IORTable::Table::_nil ();
}

CORBA::Boolean
TAO::Objref_Traits<IORTable::Table>::marshal (
    IORTable::Table_ptr p,
    TAO_OutputCDR & cdr
  )
{
  return CORBA::Object::marshal (p, cdr);
}

IORTable::Table::Table (void)
{}

IORTable::Table::~Table (void)
{}

IORTable::Table_ptr
IORTable::Table::_narrow (
    CORBA::Object_ptr _tao_objref
    ACE_ENV_ARG_DECL_NOT_USED
  )
{
  if (CORBA::is_nil (_tao_objref))
    {
      return Table::_nil ();
    }
  
  Table_ptr proxy =
    dynamic_cast<Table_ptr> (_tao_objref);
  
  return Table::_duplicate (proxy);
}

IORTable::Table_ptr
IORTable::Table::_unchecked_narrow (
    CORBA::Object_ptr _tao_objref
    ACE_ENV_ARG_DECL_NOT_USED
  )
{
  if (CORBA::is_nil (_tao_objref))
    {
      return Table::_nil ();
    }
  
  Table_ptr proxy =
    dynamic_cast<Table_ptr> (_tao_objref);
  
  return Table::_duplicate (proxy);
}

IORTable::Table_ptr
IORTable::Table::_duplicate (Table_ptr obj)
{
  if (! CORBA::is_nil (obj))
    {
      obj->_add_ref ();
    }
  
  return obj;
}

void
IORTable::Table::_tao_release (Table_ptr obj)
{
  CORBA::release (obj);
}

CORBA::Boolean
IORTable::Table::_is_a (
    const char *value
    ACE_ENV_ARG_DECL_NOT_USED
  )
{
  if (
      !ACE_OS::strcmp (
          value,
          "IDL:IORTable/Table:1.0"
        ) ||
      !ACE_OS::strcmp (
          value,
          "IDL:omg.org/CORBA/LocalObject:1.0"
        ) ||
      !ACE_OS::strcmp (
          value,
          "IDL:omg.org/CORBA/Object:1.0"
        )
    )
    {
      return true; // success using local knowledge
    }
  else
    {
      return false;
    }
}

const char* IORTable::Table::_interface_repository_id (void) const
{
  return "IDL:IORTable/Table:1.0";
}

CORBA::Boolean
IORTable::Table::marshal (TAO_OutputCDR &)
{
  return false;
}

// TAO_IDL - Generated from
// be\be_visitor_interface/interface_cs.cpp:60

// Traits specializations for IORTable::Locator.

IORTable::Locator_ptr
TAO::Objref_Traits<IORTable::Locator>::duplicate (
    IORTable::Locator_ptr p
  )
{
  return IORTable::Locator::_duplicate (p);
}

void
TAO::Objref_Traits<IORTable::Locator>::release (
    IORTable::Locator_ptr p
  )
{
  CORBA::release (p);
}

IORTable::Locator_ptr
TAO::Objref_Traits<IORTable::Locator>::nil (void)
{
  return IORTable::Locator::_nil ();
}

CORBA::Boolean
TAO::Objref_Traits<IORTable::Locator>::marshal (
    IORTable::Locator_ptr p,
    TAO_OutputCDR & cdr
  )
{
  return CORBA::Object::marshal (p, cdr);
}

IORTable::Locator::Locator (void)
{}

IORTable::Locator::~Locator (void)
{}

IORTable::Locator_ptr
IORTable::Locator::_narrow (
    CORBA::Object_ptr _tao_objref
    ACE_ENV_ARG_DECL_NOT_USED
  )
{
  if (CORBA::is_nil (_tao_objref))
    {
      return Locator::_nil ();
    }
  
  Locator_ptr proxy =
    dynamic_cast<Locator_ptr> (_tao_objref);
  
  return Locator::_duplicate (proxy);
}

IORTable::Locator_ptr
IORTable::Locator::_unchecked_narrow (
    CORBA::Object_ptr _tao_objref
    ACE_ENV_ARG_DECL_NOT_USED
  )
{
  if (CORBA::is_nil (_tao_objref))
    {
      return Locator::_nil ();
    }
  
  Locator_ptr proxy =
    dynamic_cast<Locator_ptr> (_tao_objref);
  
  return Locator::_duplicate (proxy);
}

IORTable::Locator_ptr
IORTable::Locator::_duplicate (Locator_ptr obj)
{
  if (! CORBA::is_nil (obj))
    {
      obj->_add_ref ();
    }
  
  return obj;
}

void
IORTable::Locator::_tao_release (Locator_ptr obj)
{
  CORBA::release (obj);
}

CORBA::Boolean
IORTable::Locator::_is_a (
    const char *value
    ACE_ENV_ARG_DECL_NOT_USED
  )
{
  if (
      !ACE_OS::strcmp (
          value,
          "IDL:IORTable/Locator:1.0"
        ) ||
      !ACE_OS::strcmp (
          value,
          "IDL:omg.org/CORBA/LocalObject:1.0"
        ) ||
      !ACE_OS::strcmp (
          value,
          "IDL:omg.org/CORBA/Object:1.0"
        )
    )
    {
      return true; // success using local knowledge
    }
  else
    {
      return false;
    }
}

const char* IORTable::Locator::_interface_repository_id (void) const
{
  return "IDL:IORTable/Locator:1.0";
}

CORBA::Boolean
IORTable::Locator::marshal (TAO_OutputCDR &)
{
  return false;
}

// TAO_IDL - Generated from
// be\be_visitor_exception/cdr_op_cs.cpp:60

CORBA::Boolean operator<< (
    TAO_OutputCDR &strm,
    const IORTable::AlreadyBound &_tao_aggregate
  )
{
  // Marshal the repository ID.
  return (strm << _tao_aggregate._rep_id ());
}

CORBA::Boolean operator>> (
    TAO_InputCDR &,
    IORTable::AlreadyBound&
  )
{
  return true;
}

// TAO_IDL - Generated from
// be\be_visitor_exception/cdr_op_cs.cpp:60

CORBA::Boolean operator<< (
    TAO_OutputCDR &strm,
    const IORTable::NotFound &_tao_aggregate
  )
{
  // Marshal the repository ID.
  return (strm << _tao_aggregate._rep_id ());
}

CORBA::Boolean operator>> (
    TAO_InputCDR &,
    IORTable::NotFound&
  )
{
  return true;
}

TAO_END_VERSIONED_NAMESPACE_DECL
