@implementation SFSharedWebCredentialsDatabaseEntry

- (SFSharedWebCredentialsDatabaseEntry)initWithServiceDetails:(id)a3
{
  id v4;
  SFSharedWebCredentialsDatabaseEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *domain;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *appID;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  SFSharedWebCredentialsDatabaseEntry *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFSharedWebCredentialsDatabaseEntry;
  v5 = -[SFSharedWebCredentialsDatabaseEntry init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "serviceSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = (void *)objc_msgSend(v7, "copy");
      +[SFDomainAssociationUtilities domainByStrippingSubdomainWildcardPrefixIfNecessary:](SFDomainAssociationUtilities, "domainByStrippingSubdomainWildcardPrefixIfNecessary:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      domain = v5->_domain;
      v5->_domain = (NSString *)v10;

      objc_msgSend(v6, "applicationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = objc_msgSend(v12, "copy");
        appID = v5->_appID;
        v5->_appID = (NSString *)v14;

        objc_msgSend(v6, "serviceType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = v16;
          if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE8F738]) & 1) != 0)
          {
            v19 = 4;
          }
          else if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE8F748]) & 1) != 0)
          {
            v19 = 5;
          }
          else if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE8F768]) & 1) != 0)
          {
            v19 = 7;
          }
          else if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE8F758]) & 1) != 0)
          {
            v19 = 1;
          }
          else if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE8F760]) & 1) != 0)
          {
            v19 = 2;
          }
          else if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE8F750]) & 1) != 0)
          {
            v19 = 3;
          }
          else if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE8F740]))
          {
            v19 = 6;
          }
          else
          {
            v19 = 0;
          }

          v5->_service = v19;
          v5->_approved = objc_msgSend(v4, "isApproved");
          v20 = v5;
        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_initWithDomain:(id)a3 appID:(id)a4 service:(int64_t)a5 isApproved:(BOOL)a6
{
  id v10;
  id v11;
  SFSharedWebCredentialsDatabaseEntry *v12;
  void *v13;
  uint64_t v14;
  NSString *domain;
  uint64_t v16;
  NSString *appID;
  SFSharedWebCredentialsDatabaseEntry *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SFSharedWebCredentialsDatabaseEntry;
  v12 = -[SFSharedWebCredentialsDatabaseEntry init](&v20, sel_init);
  if (v12)
  {
    v13 = (void *)objc_msgSend(v10, "copy");
    +[SFDomainAssociationUtilities domainByStrippingSubdomainWildcardPrefixIfNecessary:](SFDomainAssociationUtilities, "domainByStrippingSubdomainWildcardPrefixIfNecessary:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    domain = v12->_domain;
    v12->_domain = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    appID = v12->_appID;
    v12->_appID = (NSString *)v16;

    v12->_service = a5;
    v12->_approved = a6;
    v18 = v12;
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *domain;
  NSString *appID;
  unint64_t v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  domain = self->_domain;
  appID = self->_appID;
  v7 = self->_service - 1;
  if (v7 > 6)
    v8 = CFSTR("Unknown");
  else
    v8 = (__CFString *)**((id **)&unk_24C9364D8 + v7);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; domain = %@; appID = %@; service = %@; isApproved = %d"),
    v4,
    self,
    domain,
    appID,
    v8,
    self->_approved);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)appID
{
  return self->_appID;
}

- (int64_t)service
{
  return self->_service;
}

- (BOOL)isApproved
{
  return self->_approved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
