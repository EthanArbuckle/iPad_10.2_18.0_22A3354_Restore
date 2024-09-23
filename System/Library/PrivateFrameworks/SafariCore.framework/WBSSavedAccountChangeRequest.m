@implementation WBSSavedAccountChangeRequest

- (void)setSavedAccount:(id)a3
{
  void *v5;
  NSString *v6;
  NSString *user;
  void *v8;
  NSString *v9;
  NSString *password;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *sites;
  void *v14;
  WBSTOTPGenerator *v15;
  WBSTOTPGenerator *totpGenerator;
  void *v17;
  NSString *v18;
  NSString *notesEntry;
  void *v20;
  NSString *v21;
  NSString *customTitle;
  void *v23;
  NSArray *v24;
  NSArray *additionalSites;
  id v26;

  v26 = a3;
  if ((WBSIsEqual(v26, self->_savedAccount) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_savedAccount, a3);
    objc_msgSend(v26, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    user = self->_user;
    self->_user = v6;

    objc_msgSend(v26, "password");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSString *)objc_msgSend(v8, "copy");
    password = self->_password;
    self->_password = v9;

    objc_msgSend(v26, "sites");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSMutableArray *)objc_msgSend(v11, "mutableCopy");
    sites = self->_sites;
    self->_sites = v12;

    objc_msgSend(v26, "totpGenerators");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (WBSTOTPGenerator *)objc_claimAutoreleasedReturnValue();
    totpGenerator = self->_totpGenerator;
    self->_totpGenerator = v15;

    objc_msgSend(v26, "notesEntry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (NSString *)objc_msgSend(v17, "copy");
    notesEntry = self->_notesEntry;
    self->_notesEntry = v18;

    objc_msgSend(v26, "customTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (NSString *)objc_msgSend(v20, "copy");
    customTitle = self->_customTitle;
    self->_customTitle = v21;

    objc_msgSend(v26, "additionalSites");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (NSArray *)objc_msgSend(v23, "copy");
    additionalSites = self->_additionalSites;
    self->_additionalSites = v24;

  }
}

- (NSArray)userVisibleSites
{
  return (NSArray *)-[NSMutableArray safari_mapObjectsUsingBlock:](self->_sites, "safari_mapObjectsUsingBlock:", &__block_literal_global_52);
}

id __48__WBSSavedAccountChangeRequest_userVisibleSites__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "_web_decodeHostName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

- (BOOL)hasChanges
{
  return -[WBSSavedAccountChangeRequest hasUserChange](self, "hasUserChange")
      || -[WBSSavedAccountChangeRequest hasPasswordChange](self, "hasPasswordChange")
      || -[WBSSavedAccountChangeRequest hasSitesChange](self, "hasSitesChange")
      || -[WBSSavedAccountChangeRequest hasTOTPGeneratorChange](self, "hasTOTPGeneratorChange")
      || -[WBSSavedAccountChangeRequest hasNotesEntryChange](self, "hasNotesEntryChange")
      || -[WBSSavedAccountChangeRequest hasCustomTitleChange](self, "hasCustomTitleChange")
      || -[WBSSavedAccountChangeRequest isAddingPasswordToAccountWithPasskey](self, "isAddingPasswordToAccountWithPasskey")|| -[WBSSavedAccountChangeRequest hasAdditionalSitesChange](self, "hasAdditionalSitesChange");
}

- (BOOL)hasUserChange
{
  NSString *user;
  void *v3;

  user = self->_user;
  -[WBSSavedAccount user](self->_savedAccount, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(user) = WBSIsEqual(user, v3) ^ 1;

  return (char)user;
}

- (BOOL)hasPasswordChange
{
  int v3;
  NSString *password;
  void *v5;

  if ((-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") & 1) != 0)
  {
    password = self->_password;
    -[WBSSavedAccount password](self->_savedAccount, "password");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = WBSIsEqual(password, v5) ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasSitesChange
{
  void *v3;
  uint64_t v4;
  NSMutableArray *sites;
  void *v6;
  int v7;

  if (-[NSMutableArray count](self->_sites, "count")
    || (-[WBSSavedAccount sites](self->_savedAccount, "sites"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    sites = self->_sites;
    -[WBSSavedAccount sites](self->_savedAccount, "sites");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WBSIsEqual(sites, v6) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)hasTOTPGeneratorChange
{
  WBSTOTPGenerator *totpGenerator;
  void *v3;
  void *v4;

  totpGenerator = self->_totpGenerator;
  -[WBSSavedAccount totpGenerators](self->_savedAccount, "totpGenerators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(totpGenerator) = WBSIsEqual(totpGenerator, v4) ^ 1;

  return (char)totpGenerator;
}

- (BOOL)hasNotesEntryChange
{
  NSString *notesEntry;
  void *v4;
  BOOL v5;
  void *v6;

  notesEntry = self->_notesEntry;
  -[WBSSavedAccount notesEntry](self->_savedAccount, "notesEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((WBSIsEqual(notesEntry, v4) & 1) != 0)
  {
    v5 = 0;
  }
  else if (-[NSString length](self->_notesEntry, "length"))
  {
    v5 = 1;
  }
  else
  {
    -[WBSSavedAccount notesEntry](self->_savedAccount, "notesEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "length") != 0;

  }
  return v5;
}

- (BOOL)hasCustomTitleChange
{
  NSString *customTitle;
  void *v4;
  BOOL v5;
  void *v6;

  customTitle = self->_customTitle;
  -[WBSSavedAccount customTitle](self->_savedAccount, "customTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((WBSIsEqual(customTitle, v4) & 1) != 0)
  {
    v5 = 0;
  }
  else if (-[NSString length](self->_customTitle, "length"))
  {
    v5 = 1;
  }
  else
  {
    -[WBSSavedAccount customTitle](self->_savedAccount, "customTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "length") != 0;

  }
  return v5;
}

- (BOOL)isAddingPasswordToAccountWithPasskey
{
  return -[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") == 2
      && -[NSString length](self->_password, "length") != 0;
}

- (NSArray)additionalSites
{
  return (NSArray *)-[NSArray safari_mapAndFilterObjectsUsingBlock:](self->_additionalSites, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_2_1);
}

id __47__WBSSavedAccountChangeRequest_additionalSites__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "safari_stringByTrimmingWhitespace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)hasAdditionalSitesChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;

  -[WBSSavedAccountChangeRequest additionalSites](self, "additionalSites");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

  }
  else
  {
    -[WBSSavedAccount additionalSites](self->_savedAccount, "additionalSites");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      LOBYTE(v8) = 0;
      return v8;
    }
  }
  -[WBSSavedAccountChangeRequest additionalSites](self, "additionalSites");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount additionalSites](self->_savedAccount, "additionalSites");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBSIsEqual(v6, v7) ^ 1;

  return v8;
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableArray)sites
{
  return self->_sites;
}

- (void)setSites:(id)a3
{
  objc_storeStrong((id *)&self->_sites, a3);
}

- (WBSTOTPGenerator)totpGenerator
{
  return self->_totpGenerator;
}

- (void)setTotpGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_totpGenerator, a3);
}

- (NSString)notesEntry
{
  return self->_notesEntry;
}

- (void)setNotesEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (void)setCustomTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setAdditionalSites:(id)a3
{
  objc_storeStrong((id *)&self->_additionalSites, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSites, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_notesEntry, 0);
  objc_storeStrong((id *)&self->_totpGenerator, 0);
  objc_storeStrong((id *)&self->_sites, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_savedAccount, 0);
}

@end
