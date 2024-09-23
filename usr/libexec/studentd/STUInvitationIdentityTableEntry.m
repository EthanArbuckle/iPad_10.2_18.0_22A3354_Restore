@implementation STUInvitationIdentityTableEntry

- (STUInvitationIdentityTableEntry)initWithIdentity:(id)a3
{
  id v5;
  STUInvitationIdentityTableEntry *v6;
  STUInvitationIdentityTableEntry *v7;
  NSMutableSet *v8;
  NSMutableSet *ports;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STUInvitationIdentityTableEntry;
  v6 = -[STUInvitationIdentityTableEntry init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identity, a3);
    v8 = objc_opt_new(NSMutableSet);
    ports = v7->_ports;
    v7->_ports = v8;

  }
  return v7;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTableEntry identity](self, "identity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTableEntry ports](self, "ports"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crk_stableDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { identity = %@, ports = %@}>"), v3, self, v4, v6));

  return v7;
}

- (CRKIdentity)identity
{
  return self->_identity;
}

- (NSMutableSet)ports
{
  return self->_ports;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ports, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
