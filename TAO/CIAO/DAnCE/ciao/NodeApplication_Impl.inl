/* -*- C++ -*- */
// $Id$

ACE_INLINE
CIAO::NodeApplication_Impl::
NodeApplication_Impl (CORBA::ORB_ptr o,
                      PortableServer::POA_ptr p)

  : orb_ (CORBA::ORB::_duplicate (o)),
    poa_ (PortableServer::POA::_duplicate (p)),
    container_ (0)

  // @@ (OO) The default size for an ACE_Hash_Map_Mapanger is quiet
  //         large.  The maximum size of an ACE_Hash_Map_Manager is
  //         also fixed, i.e. it does not grow dynamically on demand.
  //         Make sure the default size of home_map_ and
  //         component_map_ is appropriate for your needs.  You may
  //         also want to make the size configurable at compile-time,
  //         at least.
{
}
