@implementation WBSSavedAccountMatch

- (WBSSavedAccountMatch)initWithSavedAccount:(id)a3 protectionSpace:(id)a4 context:(id)a5 matchLevel:(int64_t)a6
{
  return -[WBSSavedAccountMatch initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:](self, "initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:", a3, a4, a5, a6, 0);
}

- (WBSSavedAccountMatch)initWithSavedAccount:(id)a3 protectionSpace:(id)a4 context:(id)a5 matchLevel:(int64_t)a6 autoFillPasskey:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WBSSavedAccountMatch *v17;
  WBSSavedAccountMatch *v18;
  uint64_t v19;
  NSURLProtectionSpace *protectionSpace;
  uint64_t v21;
  NSString *host;
  void *v23;
  uint64_t v24;
  NSString *v25;
  WBSSavedAccountMatch *v26;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)WBSSavedAccountMatch;
  v17 = -[WBSSavedAccountMatch init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_savedAccount, a3);
    v19 = objc_msgSend(v14, "copy");
    protectionSpace = v18->_protectionSpace;
    v18->_protectionSpace = (NSURLProtectionSpace *)v19;

    objc_storeStrong((id *)&v18->_context, a5);
    v18->_matchLevel = a6;
    objc_msgSend(v14, "host");
    v21 = objc_claimAutoreleasedReturnValue();
    host = v18->_host;
    v18->_host = (NSString *)v21;

    if (!v18->_host)
    {
      objc_msgSend(v16, "relyingPartyIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      v25 = v18->_host;
      v18->_host = (NSString *)v24;

    }
    objc_storeStrong((id *)&v18->_autoFillPasskey, a7);
    v26 = v18;
  }

  return v18;
}

- (NSString)user
{
  return -[WBSSavedAccount user](self->_savedAccount, "user");
}

- (id)userVisibleDomainForAutoFillWithPageURL:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C92C70], "safari_HTMLFormProtectionSpaceForURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount protectionSpaces](self->_savedAccount, "protectionSpaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
    objc_msgSend(v4, "safari_userVisibleSiteForProtectionSpace");
  else
    -[WBSSavedAccount userVisibleDomain](self->_savedAccount, "userVisibleDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)password
{
  return -[WBSSavedAccount password](self->_savedAccount, "password");
}

- (NSDate)creationDate
{
  return -[WBSSavedAccount creationDate](self->_savedAccount, "creationDate");
}

- (NSDate)lastUsedDateAffectingAutoFillSortOrder
{
  return (NSDate *)-[WBSSavedAccount lastUsedDateForContext:](self->_savedAccount, "lastUsedDateForContext:", self->_context);
}

- (NSString)customTitle
{
  return -[WBSSavedAccount customTitle](self->_savedAccount, "customTitle");
}

- (NSString)groupName
{
  return -[WBSSavedAccount sharedGroupName](self->_savedAccount, "sharedGroupName");
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  char v16;
  WBSSavedAccount *savedAccount;
  void *v19;

  v4 = a3;
  -[WBSSavedAccountMatch savedAccount](self, "savedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleIDPasskey");

  if ((v6 & 1) == 0)
  {
    -[WBSSavedAccountMatch lastUsedDateAffectingAutoFillSortOrder](self, "lastUsedDateAffectingAutoFillSortOrder");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastUsedDateAffectingAutoFillSortOrder");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend((id)v8, "compare:", v9) == -1)
        v7 = 1;
      else
        v7 = -1;
      goto LABEL_21;
    }
    if (v8)
      v7 = -1;
    else
      v7 = 1;
    if (v8 | v9)
      goto LABEL_21;
    v11 = -[WBSSavedAccount isDefaultCredentialForFullyQualifiedHostname:](self->_savedAccount, "isDefaultCredentialForFullyQualifiedHostname:", self->_host);
    objc_msgSend(v4, "savedAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isDefaultCredentialForFullyQualifiedHostname:", self->_host);

    if (v11 && !v13)
      goto LABEL_14;
    if ((v13 ^ 1 | v11) == 1)
    {
      v14 = -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes");
      objc_msgSend(v4, "savedAccount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "credentialTypes");

      if ((v14 & 2) != 0 && (v16 & 2) == 0)
      {
LABEL_14:
        v7 = -1;
LABEL_21:

        goto LABEL_22;
      }
      if ((v14 & 2) != 0 || (v16 & 2) == 0)
      {
        savedAccount = self->_savedAccount;
        objc_msgSend(v4, "savedAccount");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[WBSSavedAccount compare:](savedAccount, "compare:", v19);

        goto LABEL_21;
      }
    }
    v7 = 1;
    goto LABEL_21;
  }
  v7 = -1;
LABEL_22:

  return v7;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  WBSSavedAccount *savedAccount;
  NSURLProtectionSpace *protectionSpace;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  savedAccount = self->_savedAccount;
  protectionSpace = self->_protectionSpace;
  -[WBSAutoFillPasskey identifier](self->_autoFillPasskey, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; savedAccount = %@; protection space = %@; passkey identifier = %@>"),
    v5,
    self,
    savedAccount,
    protectionSpace,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)host
{
  return self->_host;
}

- (BOOL)hasUniqueHostAndUser
{
  return self->_hasUniqueHostAndUser;
}

- (void)setHasUniqueHostAndUser:(BOOL)a3
{
  self->_hasUniqueHostAndUser = a3;
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (WBSSavedAccountContext)context
{
  return self->_context;
}

- (int64_t)matchLevel
{
  return self->_matchLevel;
}

- (WBSAutoFillPasskey)autoFillPasskey
{
  return self->_autoFillPasskey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFillPasskey, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
  objc_storeStrong((id *)&self->_savedAccount, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
