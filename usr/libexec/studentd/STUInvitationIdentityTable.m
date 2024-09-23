@implementation STUInvitationIdentityTable

- (STUInvitationIdentityTable)initWithConfigurationManager:(id)a3
{
  id v4;
  void *v5;
  STUInvitationIdentityTable *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRKSystemInfo sharedSystemInfo](CRKSystemInfo, "sharedSystemInfo"));
  v6 = -[STUInvitationIdentityTable initWithPlatform:configurationManager:](self, "initWithPlatform:configurationManager:", objc_msgSend(v5, "platform"), v4);

  return v6;
}

- (STUInvitationIdentityTable)initWithPlatform:(unint64_t)a3 configurationManager:(id)a4
{
  id v7;
  STUInvitationIdentityTable *v8;
  STUInvitationIdentityTable *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *entriesByIPAddress;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STUInvitationIdentityTable;
  v8 = -[STUInvitationIdentityTable init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v8->_platform = a3;
    objc_storeStrong((id *)&v8->_configurationManager, a4);
    v10 = objc_opt_new(NSMutableDictionary);
    entriesByIPAddress = v9->_entriesByIPAddress;
    v9->_entriesByIPAddress = v10;

  }
  return v9;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTable entriesByIPAddress](self, "entriesByIPAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { entriesByIPAddress = %@ }>"), v3, self, v4));

  return v5;
}

- (id)identityForEndpoint:(id)a3 createIfDoesNotExist:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  STUInvitationIdentityTableEntry *v9;
  STUInvitationIdentityTableEntry *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTable entriesByIPAddress](self, "entriesByIPAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "IPAddress"));
  v9 = (STUInvitationIdentityTableEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  if (!v9 && v4)
  {
    v10 = [STUInvitationIdentityTableEntry alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTable makeIdentity](self, "makeIdentity"));
    v9 = -[STUInvitationIdentityTableEntry initWithIdentity:](v10, "initWithIdentity:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTable entriesByIPAddress](self, "entriesByIPAddress"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "IPAddress"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v13);

  }
  if (v4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTableEntry ports](v9, "ports"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v6, "port")));
    objc_msgSend(v14, "addObject:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTableEntry identity](v9, "identity"));

  return v16;
}

- (void)removeIdentityForEndpoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTable entriesByIPAddress](self, "entriesByIPAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "IPAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ports"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "port")));
    objc_msgSend(v7, "removeObject:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ports"));
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTable entriesByIPAddress](self, "entriesByIPAddress"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "IPAddress"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v12);

    }
  }

}

- (id)makeIdentity
{
  void *v3;

  if (-[STUInvitationIdentityTable isiOS](self, "isiOS"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTable globalIdentityiOSOnly](self, "globalIdentityiOSOnly"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTable makeIdentityUsingFactory](self, "makeIdentityUsingFactory"));
  return v3;
}

- (id)makeIdentityUsingFactory
{
  STUInvitationIdentityFactory *v3;
  void *v4;
  STUInvitationIdentityFactory *v5;
  void *v6;

  v3 = [STUInvitationIdentityFactory alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTable configurationManager](self, "configurationManager"));
  v5 = -[STUInvitationIdentityFactory initWithConfigurationManager:](v3, "initWithConfigurationManager:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityFactory makeInvitationIdentity](v5, "makeInvitationIdentity"));
  return v6;
}

- (CRKIdentity)globalIdentityiOSOnly
{
  CRKIdentity *globalIdentityiOSOnly;
  CRKIdentity *v5;
  CRKIdentity *v6;
  void *v8;

  if (!-[STUInvitationIdentityTable isiOS](self, "isiOS"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUInvitationIdentityTable.m"), 94, CFSTR("The global identity should only be used on iOS"));

  }
  globalIdentityiOSOnly = self->_globalIdentityiOSOnly;
  if (!globalIdentityiOSOnly)
  {
    v5 = (CRKIdentity *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityTable makeIdentityUsingFactory](self, "makeIdentityUsingFactory"));
    v6 = self->_globalIdentityiOSOnly;
    self->_globalIdentityiOSOnly = v5;

    globalIdentityiOSOnly = self->_globalIdentityiOSOnly;
  }
  return globalIdentityiOSOnly;
}

- (BOOL)isiOS
{
  return (id)-[STUInvitationIdentityTable platform](self, "platform") == (id)1;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (STUConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (NSMutableDictionary)entriesByIPAddress
{
  return self->_entriesByIPAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entriesByIPAddress, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_globalIdentityiOSOnly, 0);
}

@end
