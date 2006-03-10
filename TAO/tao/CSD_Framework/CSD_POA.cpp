// $Id$

#include "tao/CSD_Framework/CSD_POA.h"
#include "tao/CSD_Framework/CSD_Strategy_Repository.h"
#include "tao/CSD_Framework/CSD_Strategy_Base.h"

#include "ace/Dynamic_Service.h"

ACE_RCSID (CSD_Framework,
           CSD_POA,
           "$Id$")

#if !defined (__ACE_INLINE__)
# include "tao/CSD_Framework/CSD_POA.inl"
#endif /* ! __ACE_INLINE__ */

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

// Implementation skeleton constructor
TAO_CSD_POA::TAO_CSD_POA (const String &name,
                   TAO_POA_Manager &poa_manager,
                   const TAO_POA_Policy_Set &policies,
                   TAO_Root_POA *parent,
                   ACE_Lock &lock,
                   TAO_SYNCH_MUTEX &thread_lock,
                   TAO_ORB_Core &orb_core,
                   TAO_Object_Adapter *object_adapter
                   ACE_ENV_ARG_DECL)
: TAO_Regular_POA (name,
                   poa_manager,
                   policies,
                   parent,
                   lock,
                   thread_lock,
                   orb_core,
                   object_adapter
                   ACE_ENV_ARG_PARAMETER)
{
  ACE_NEW_THROW_EX (this->sds_proxy_,
                    TAO::CSD::Strategy_Proxy (),
                    CORBA::NO_MEMORY ());
  ACE_CHECK;
}


// Implementation skeleton destructor
TAO_CSD_POA::~TAO_CSD_POA (void)
{
  delete this->sds_proxy_;
}

void TAO_CSD_POA::set_csd_strategy (
    ::CSD_Framework::Strategy_ptr strategy
    ACE_ENV_ARG_DECL
  )
  ACE_THROW_SPEC ((
    CORBA::SystemException
  ))
{
  if (CORBA::is_nil (strategy))
    {
      ACE_THROW (CORBA::BAD_PARAM ());
    }
  this->sds_proxy_->custom_strategy (strategy);
}

TAO_Root_POA *
TAO_CSD_POA::new_POA (const String &name,
                      TAO_POA_Manager &poa_manager,
                      const TAO_POA_Policy_Set &policies,
                      TAO_Root_POA *parent,
                      ACE_Lock &lock,
                      TAO_SYNCH_MUTEX &thread_lock,
                      TAO_ORB_Core &orb_core,
                      TAO_Object_Adapter *object_adapter
                      ACE_ENV_ARG_DECL)
{
  TAO_CSD_POA *poa = 0;

  ACE_NEW_THROW_EX (poa,
                    TAO_CSD_POA (name,
                             poa_manager,
                             policies,
                             parent,
                             lock,
                             thread_lock,
                             orb_core,
                             object_adapter
                             ACE_ENV_ARG_PARAMETER),
                    CORBA::NO_MEMORY ());
  ACE_CHECK_RETURN (0);

  TAO_CSD_Strategy_Repository *repo =
    ACE_Dynamic_Service<TAO_CSD_Strategy_Repository>::instance ("TAO_CSD_Strategy_Repository");


  CSD_Framework::Strategy_var strategy = repo->find (name);

  if (! CORBA::is_nil (strategy.in ()))
    {
      poa->set_csd_strategy (strategy.in () ACE_ENV_ARG_PARAMETER);
      ACE_CHECK_RETURN (0);
    }

  return poa;
}

void TAO_CSD_POA::poa_activated_hook ()
{
  this->sds_proxy_->poa_activated_event ();
}

void TAO_CSD_POA::poa_deactivated_hook ()
{
  this->sds_proxy_->poa_deactivated_event ();
}

void TAO_CSD_POA::servant_activated_hook (PortableServer::Servant servant, 
                               const PortableServer::ObjectId& oid
                               ACE_ENV_ARG_DECL)
{
  this->sds_proxy_->servant_activated_event (servant, oid ACE_ENV_ARG_PARAMETER);
  ACE_CHECK;
}

void TAO_CSD_POA::servant_deactivated_hook (PortableServer::Servant servant, 
                                 const PortableServer::ObjectId& oid
                                 ACE_ENV_ARG_DECL)
{
  this->sds_proxy_->servant_deactivated_event (servant, oid ACE_ENV_ARG_PARAMETER);
  ACE_CHECK;
}

TAO_END_VERSIONED_NAMESPACE_DECL
