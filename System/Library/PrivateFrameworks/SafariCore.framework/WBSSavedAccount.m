@implementation WBSSavedAccount

- (id)_initWithHighLevelDomain:(id)a3 passkeyRelyingPartyID:(id)a4 user:(id)a5 password:(id)a6 passkeyUserHandle:(id)a7 passkeyCredentialID:(id)a8 siteToProtectionSpaces:(id)a9 sitesToSidecars:(id)a10 serviceName:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  WBSSavedAccount *v25;
  WBSSavedAccount *v26;
  uint64_t v27;
  NSString *highLevelDomain;
  uint64_t v29;
  NSString *passkeyRelyingPartyID;
  uint64_t v31;
  NSString *user;
  NSString *v33;
  void *v34;
  uint64_t v35;
  NSString *password;
  uint64_t v37;
  NSString *passkeyUserHandle;
  uint64_t v39;
  NSString *passkeyCredentialID;
  uint64_t v41;
  NSMutableDictionary *passkeyCredentialSidecarsDictionary;
  uint64_t v43;
  NSMutableSet *sitesForWhichSelfIsDefault;
  uint64_t v45;
  NSString *serviceName;
  void *v47;
  uint64_t v48;
  NSString *customTitle;
  WBSSavedAccount *v50;
  id v52;
  void *v53;
  id v54;
  id v55;
  objc_super v56;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v55 = a9;
  v54 = a10;
  v23 = v17;
  v24 = a11;
  v56.receiver = self;
  v56.super_class = (Class)WBSSavedAccount;
  v25 = -[WBSSavedAccount init](&v56, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_lock._os_unfair_lock_opaque = 0;
    v53 = v23;
    v27 = objc_msgSend(v23, "copy");
    highLevelDomain = v26->_highLevelDomain;
    v26->_highLevelDomain = (NSString *)v27;

    v52 = v18;
    v29 = objc_msgSend(v18, "copy");
    passkeyRelyingPartyID = v26->_passkeyRelyingPartyID;
    v26->_passkeyRelyingPartyID = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    user = v26->_user;
    v26->_user = (NSString *)v31;

    v33 = v26->_user;
    +[WBSDontSaveMarker dontSaveMarker](WBSDontSaveMarker, "dontSaveMarker");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v26->_userIsNeverSaveMarker = -[NSString isEqualToString:](v33, "isEqualToString:", v34);

    v35 = objc_msgSend(v20, "copy");
    password = v26->_password;
    v26->_password = (NSString *)v35;

    v37 = objc_msgSend(v21, "copy");
    passkeyUserHandle = v26->_passkeyUserHandle;
    v26->_passkeyUserHandle = (NSString *)v37;

    v39 = objc_msgSend(v22, "copy");
    passkeyCredentialID = v26->_passkeyCredentialID;
    v26->_passkeyCredentialID = (NSString *)v39;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v41 = objc_claimAutoreleasedReturnValue();
    passkeyCredentialSidecarsDictionary = v26->_passkeyCredentialSidecarsDictionary;
    v26->_passkeyCredentialSidecarsDictionary = (NSMutableDictionary *)v41;

    objc_storeStrong((id *)&v26->_siteToProtectionSpaces, a9);
    objc_storeStrong((id *)&v26->_sitesToSidecars, a10);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v43 = objc_claimAutoreleasedReturnValue();
    sitesForWhichSelfIsDefault = v26->_sitesForWhichSelfIsDefault;
    v26->_sitesForWhichSelfIsDefault = (NSMutableSet *)v43;

    v45 = objc_msgSend(v24, "copy");
    serviceName = v26->_serviceName;
    v26->_serviceName = (NSString *)v45;

    -[WBSSavedAccount _firstSidecarForAnySiteOfType:inSitesToSidecars:passkeySidecars:](v26, "_firstSidecarForAnySiteOfType:inSitesToSidecars:passkeySidecars:", 0, v26->_sitesToSidecars, v26->_passkeyCredentialSidecarsDictionary);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v47, "customTitle");
      v48 = objc_claimAutoreleasedReturnValue();
      customTitle = v26->_customTitle;
      v26->_customTitle = (NSString *)v48;
    }
    else
    {
      customTitle = v26->_customTitle;
      v26->_customTitle = 0;
    }

    v50 = v26;
    v18 = v52;
    v23 = v53;
  }

  return v26;
}

- (id)_initWithHighLevelDomain:(id)a3 user:(id)a4 password:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = -[WBSSavedAccount _initWithHighLevelDomain:passkeyRelyingPartyID:user:password:passkeyUserHandle:passkeyCredentialID:siteToProtectionSpaces:sitesToSidecars:serviceName:](self, "_initWithHighLevelDomain:passkeyRelyingPartyID:user:password:passkeyUserHandle:passkeyCredentialID:siteToProtectionSpaces:sitesToSidecars:serviceName:", v11, 0, v10, v9, 0, 0, v12, v13, 0);

  if (v14)
    v15 = v14;

  return v14;
}

- (id)_initWithPasskeyRelyingPartyID:(id)a3 user:(id)a4 passkeyUserHandle:(id)a5 passkeyCredentialID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "safari_highLevelDomainForPasswordManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WBSSavedAccount _initWithHighLevelDomain:passkeyRelyingPartyID:user:password:passkeyUserHandle:passkeyCredentialID:siteToProtectionSpaces:sitesToSidecars:serviceName:](self, "_initWithHighLevelDomain:passkeyRelyingPartyID:user:password:passkeyUserHandle:passkeyCredentialID:siteToProtectionSpaces:sitesToSidecars:serviceName:", v14, v13, v12, 0, v11, v10, 0, 0, 0);

  if (v15)
    v16 = v15;

  return v15;
}

- (id)_initWithSignInWithAppleAccount:(id)a3
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  id *v10;

  v5 = a3;
  objc_msgSend(v5, "localizedAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSSavedAccount _initWithHighLevelDomain:passkeyRelyingPartyID:user:password:passkeyUserHandle:passkeyCredentialID:siteToProtectionSpaces:sitesToSidecars:serviceName:](self, "_initWithHighLevelDomain:passkeyRelyingPartyID:user:password:passkeyUserHandle:passkeyCredentialID:siteToProtectionSpaces:sitesToSidecars:serviceName:", 0, 0, 0, 0, 0, 0, 0, 0, v6);

  if (v7)
  {
    objc_storeStrong(v7 + 10, a3);
    objc_msgSend(v5, "shareInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
      objc_storeStrong(v7 + 21, v9);
    v10 = v7;

  }
  return v7;
}

- (void)setPassword:(id)a3
{
  NSString *v4;
  NSString *password;
  NSMutableDictionary *v6;
  NSMutableDictionary *siteToProtectionSpaces;
  NSMutableDictionary *v8;
  NSMutableDictionary *sitesToSidecars;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  password = self->_password;
  self->_password = v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  siteToProtectionSpaces = self->_siteToProtectionSpaces;
  self->_siteToProtectionSpaces = v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  sitesToSidecars = self->_sitesToSidecars;
  self->_sitesToSidecars = v8;

}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  -[WBSSavedAccount customTitle](self, "customTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = v5;
  if (v3)
  {
    -[WBSSavedAccount customTitle](self, "customTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; title = %@; highLevelDomain = %@; user = %@>"),
      v6,
      self,
      v7,
      self->_highLevelDomain,
      self->_user);
  }
  else
  {
    NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; highLevelDomain = %@; user = %@>"),
      v7,
      self,
      self->_highLevelDomain,
      self->_user,
      v10);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_addProtectionSpace:(id)a3 forSite:(id)a4 isDefaultCredentialForSite:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSString *user;
  NSMutableDictionary *siteToProtectionSpaces;
  void *v17;
  NSMutableArray *sites;
  int v19;
  void *v20;
  __int16 v21;
  NSString *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKey:](self->_siteToProtectionSpaces, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((objc_msgSend(v10, "containsObject:", v8) & 1) == 0)
    {
      objc_msgSend(v11, "addObject:", v8);
      if (!v5)
        goto LABEL_9;
      goto LABEL_8;
    }
    v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      objc_msgSend(v8, "host");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      user = self->_user;
      v19 = 138412546;
      v20 = v14;
      v21 = 2112;
      v22 = user;
      _os_log_impl(&dword_1B2621000, v13, OS_LOG_TYPE_INFO, "Attempted to add a duplicate protection space for %@ to saved account for %@", (uint8_t *)&v19, 0x16u);

      if (!v5)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else
  {
    siteToProtectionSpaces = self->_siteToProtectionSpaces;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](siteToProtectionSpaces, "setObject:forKey:", v17, v9);

    sites = self->_sites;
    self->_sites = 0;

  }
  if (v5)
LABEL_8:
    -[NSMutableSet addObject:](self->_sitesForWhichSelfIsDefault, "addObject:", v9);
LABEL_9:

}

- (NSDate)lastModifiedDate
{
  NSDate *v3;
  NSDate *v4;
  NSDate **p_earliestPasswordCredentialModificationDate;
  NSDate *earliestPasswordCredentialModificationDate;
  NSDate *v7;
  id *v8;

  if (-[WBSSavedAccount credentialTypes](self, "credentialTypes") == 4)
  {
    -[AKSignInWithAppleAccount creationDate](self->_signInWithAppleAccount, "creationDate");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  earliestPasswordCredentialModificationDate = self->_earliestPasswordCredentialModificationDate;
  p_earliestPasswordCredentialModificationDate = &self->_earliestPasswordCredentialModificationDate;
  v4 = earliestPasswordCredentialModificationDate;
  v7 = p_earliestPasswordCredentialModificationDate[20];
  if (!earliestPasswordCredentialModificationDate)
  {
LABEL_10:
    v3 = v7;
    return v3;
  }
  if (!v7)
  {
    v7 = v4;
    goto LABEL_10;
  }
  if (-[NSDate compare:](v7, "compare:") == NSOrderedDescending)
    v8 = (id *)(p_earliestPasswordCredentialModificationDate + 20);
  else
    v8 = (id *)p_earliestPasswordCredentialModificationDate;
  v3 = (NSDate *)*v8;
  return v3;
}

- (void)_addPasswordCredentialModificationDate:(id)a3
{
  id v5;
  NSDate **p_earliestPasswordCredentialModificationDate;
  NSDate *earliestPasswordCredentialModificationDate;
  BOOL v8;
  void *v9;
  id v10;

  v5 = a3;
  earliestPasswordCredentialModificationDate = self->_earliestPasswordCredentialModificationDate;
  p_earliestPasswordCredentialModificationDate = &self->_earliestPasswordCredentialModificationDate;
  v10 = v5;
  if (!earliestPasswordCredentialModificationDate || (v8 = objc_msgSend(v5, "compare:") == -1, v9 = v10, v8))
  {
    objc_storeStrong((id *)p_earliestPasswordCredentialModificationDate, a3);
    v9 = v10;
  }

}

- (void)_addPasswordCredentialCreationDate:(id)a3
{
  id v5;
  NSDate **p_earliestPasswordCredentialCreationDate;
  NSDate *earliestPasswordCredentialCreationDate;
  BOOL v8;
  void *v9;
  id v10;

  v5 = a3;
  earliestPasswordCredentialCreationDate = self->_earliestPasswordCredentialCreationDate;
  p_earliestPasswordCredentialCreationDate = &self->_earliestPasswordCredentialCreationDate;
  v10 = v5;
  if (!earliestPasswordCredentialCreationDate || (v8 = objc_msgSend(v5, "compare:") == -1, v9 = v10, v8))
  {
    objc_storeStrong((id *)p_earliestPasswordCredentialCreationDate, a3);
    v9 = v10;
  }

}

- (NSDate)creationDate
{
  NSDate *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSDate *earliestPasswordCredentialCreationDate;
  NSDate *creationDateForPasskey;
  NSDate *v9;

  if (-[WBSSavedAccount credentialTypes](self, "credentialTypes") == 4)
  {
    -[AKSignInWithAppleAccount creationDate](self->_signInWithAppleAccount, "creationDate");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = v3;
    return (NSDate *)v4;
  }
  if ((-[WBSSavedAccount credentialTypes](self, "credentialTypes") & 2) == 0)
  {
    v3 = self->_earliestPasswordCredentialCreationDate;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  earliestPasswordCredentialCreationDate = self->_earliestPasswordCredentialCreationDate;
  if (!earliestPasswordCredentialCreationDate)
    earliestPasswordCredentialCreationDate = (NSDate *)v5;
  if (self->_creationDateForPasskey)
    creationDateForPasskey = self->_creationDateForPasskey;
  else
    creationDateForPasskey = (NSDate *)v5;
  v9 = earliestPasswordCredentialCreationDate;
  -[NSDate earlierDate:](v9, "earlierDate:", creationDateForPasskey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSArray)totpGenerators
{
  void *v3;
  NSMutableDictionary *sitesToSidecars;
  id v5;
  void *v6;
  NSArray *v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sitesToSidecars = self->_sitesToSidecars;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__WBSSavedAccount_totpGenerators__block_invoke;
  v9[3] = &unk_1E649EC18;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sitesToSidecars, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = (NSArray *)v5;

  return v7;
}

void __33__WBSSavedAccount_totpGenerators__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  if (objc_msgSend(v4, "isSavedInSharedGroup"))
    v6 = &unk_1E64CE4C0;
  else
    v6 = &unk_1E64CE4D8;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "totpGenerator");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    v8 = v9;
  }

}

- (id)totpGeneratorForSite:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WBSSavedAccount _sidecarForSite:ofType:](self, "_sidecarForSite:ofType:", v4, -[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "totpGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setTOTPGenerator:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  WBSSavedAccount *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __36__WBSSavedAccount_setTOTPGenerator___block_invoke;
  v10 = &unk_1E649EC40;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = _Block_copy(&v7);
  -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v6, v7, v8, v9, v10, v11);
  -[WBSSavedAccount _updatePasskeySidecarsIfNecessaryWithBlock:](self, "_updatePasskeySidecarsIfNecessaryWithBlock:", v6);

}

void __36__WBSSavedAccount_setTOTPGenerator___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  int v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (a2 == 1)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "isSavedInSharedGroup");
    v6 = v9;
    if (!v8)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(v6, "setTotpGenerator:", *(_QWORD *)(a1 + 40));
    v6 = v9;
    goto LABEL_7;
  }
  v6 = v5;
  if (!a2)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "isSavedInSharedGroup");
    v6 = v9;
    if ((v7 & 1) == 0)
      goto LABEL_6;
  }
LABEL_7:

}

- (NSDate)lastRecentlyDeletedNotificationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("lastRecentlyDeletedNotificationDateDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WBSSavedAccount hash](self, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v7;
}

- (void)setLastRecentlyDeletedNotificationDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("lastRecentlyDeletedNotificationDateDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WBSSavedAccount hash](self, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v8);
  else
    objc_msgSend(v6, "removeObjectForKey:", v8);
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v6, CFSTR("lastRecentlyDeletedNotificationDateDictionary"));

}

- (NSString)currentOneTimeCode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[WBSSavedAccount totpGenerators](self, "totpGenerators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "codeForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)credentialTypes
{
  int64_t v2;

  v2 = self->_password != 0;
  if (self->_passkeyCredentialID)
    v2 |= 2uLL;
  if (self->_signInWithAppleAccount)
    return v2 | 4;
  else
    return v2;
}

- (NSString)notesEntry
{
  NSMutableDictionary *sitesToSidecars;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  v16 = 0;
  sitesToSidecars = self->_sitesToSidecars;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__WBSSavedAccount_notesEntry__block_invoke;
  v10[3] = &unk_1E649EC68;
  v10[4] = self;
  v10[5] = &v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sitesToSidecars, "enumerateKeysAndObjectsUsingBlock:", v10);
  v4 = -[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup");
  v5 = (void *)v12[5];
  if (v4)
  {
    if (!v5)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", &unk_1E64CE4C0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "notesEntry");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (id)v7;

      goto LABEL_8;
    }
  }
  else if (!v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", &unk_1E64CE4D8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notesEntry");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v8 = v5;
LABEL_8:
  _Block_object_dispose(&v11, 8);

  return (NSString *)v8;
}

void __29__WBSSavedAccount_notesEntry__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  if (objc_msgSend(v6, "isSavedInSharedGroup"))
    v8 = &unk_1E64CE4C0;
  else
    v8 = &unk_1E64CE4D8;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "notesEntry");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v14;
  if (v14)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = v14;
    v13 = *(void **)(v11 + 40);
    v15 = v12;
    *(_QWORD *)(v11 + 40) = v12;

    *a4 = 1;
    v10 = v15;
  }

}

- (void)setNotesEntry:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  WBSSavedAccount *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __33__WBSSavedAccount_setNotesEntry___block_invoke;
  v10 = &unk_1E649EC40;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = _Block_copy(&v7);
  -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v6, v7, v8, v9, v10, v11);
  -[WBSSavedAccount _updatePasskeySidecarsIfNecessaryWithBlock:](self, "_updatePasskeySidecarsIfNecessaryWithBlock:", v6);

}

void __33__WBSSavedAccount_setNotesEntry___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  int v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (a2 == 1)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "isSavedInSharedGroup");
    v6 = v9;
    if (!v8)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(v6, "setNotesEntry:", *(_QWORD *)(a1 + 40));
    v6 = v9;
    goto LABEL_7;
  }
  v6 = v5;
  if (!a2)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "isSavedInSharedGroup");
    v6 = v9;
    if ((v7 & 1) == 0)
      goto LABEL_6;
  }
LABEL_7:

}

- (NSString)effectiveTitle
{
  void *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  -[WBSSavedAccount customTitle](self, "customTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[WBSSavedAccount customTitle](self, "customTitle");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_serviceName;
  }
  v5 = v4;

  if (-[NSString length](v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    -[WBSSavedAccount userVisibleDomain](self, "userVisibleDomain");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (NSString)effectiveTitleForSorting
{
  void *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  void *v7;

  -[WBSSavedAccount customTitle](self, "customTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[WBSSavedAccount customTitle](self, "customTitle");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_serviceName;
  }
  v5 = v4;

  if (-[NSString length](v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    -[WBSSavedAccount highLevelDomain](self, "highLevelDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_lp_userVisibleHost");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSString)customTitle
{
  BOOL v3;
  NSMutableDictionary *sitesToSidecars;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = -[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__14;
  v17 = __Block_byref_object_dispose__14;
  v18 = 0;
  sitesToSidecars = self->_sitesToSidecars;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__WBSSavedAccount_customTitle__block_invoke;
  v11[3] = &unk_1E649EC90;
  v12 = v3;
  v11[4] = &v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sitesToSidecars, "enumerateKeysAndObjectsUsingBlock:", v11);
  v5 = -[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup");
  v6 = (void *)v14[5];
  if (v5)
  {
    if (!v6)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", &unk_1E64CE4C0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "customTitle");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (id)v8;

      goto LABEL_8;
    }
  }
  else if (!v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", &unk_1E64CE4D8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customTitle");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v9 = v6;
LABEL_8:
  _Block_object_dispose(&v13, 8);

  return (NSString *)v9;
}

void __30__WBSSavedAccount_customTitle__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  if (*(_BYTE *)(a1 + 40))
    v7 = &unk_1E64CE4C0;
  else
    v7 = &unk_1E64CE4D8;
  objc_msgSend(a3, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customTitle");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v13;
  if (v13)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = v13;
    v12 = *(void **)(v10 + 40);
    v14 = v11;
    *(_QWORD *)(v10 + 40) = v11;

    *a4 = 1;
    v9 = v14;
  }

}

- (void)setCustomTitle:(id)a3 performSidecarUpdate:(BOOL)a4
{
  id v6;
  NSString *v7;
  NSString *customTitle;
  NSString *v9;
  NSString *v10;
  void *v11;
  _QWORD aBlock[5];

  v6 = a3;
  if ((WBSIsEqual(v6, self->_customTitle) & 1) != 0)
  {
    if (a4)
    {
      v7 = (NSString *)objc_msgSend(v6, "copy");
      customTitle = self->_customTitle;
      self->_customTitle = v7;

LABEL_7:
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__WBSSavedAccount_setCustomTitle_performSidecarUpdate___block_invoke;
      aBlock[3] = &unk_1E649ECB8;
      aBlock[4] = self;
      v11 = _Block_copy(aBlock);
      -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v11);
      -[WBSSavedAccount _updatePasskeySidecarsIfNecessaryWithBlock:](self, "_updatePasskeySidecarsIfNecessaryWithBlock:", v11);

    }
  }
  else if (!-[NSString isEqualToString:](self->_customTitle, "isEqualToString:", v6) || a4)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    v10 = self->_customTitle;
    self->_customTitle = v9;

    if (a4)
      goto LABEL_7;
  }

}

void __55__WBSSavedAccount_setCustomTitle_performSidecarUpdate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id v12;

  v5 = a3;
  v12 = v5;
  if (a2 == 1)
  {
    v10 = *(void **)(a1 + 32);
    v7 = a1 + 32;
    v11 = objc_msgSend(v10, "isSavedInSharedGroup");
    v6 = v12;
    if (!v11)
      goto LABEL_5;
    goto LABEL_4;
  }
  v6 = v5;
  if (!a2)
  {
    v8 = *(void **)(a1 + 32);
    v7 = a1 + 32;
    v9 = objc_msgSend(v8, "isSavedInSharedGroup");
    v6 = v12;
    if ((v9 & 1) == 0)
    {
LABEL_4:
      objc_msgSend(v6, "setCustomTitle:", *(_QWORD *)(*(_QWORD *)v7 + 72));
      v6 = v12;
    }
  }
LABEL_5:

}

- (id)lastUsedDateForContext:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[WBSSavedAccount credentialTypes](self, "credentialTypes");
  switch(v5)
  {
    case 3:
      -[WBSSavedAccount _firstSidecarForAnySiteOfType:](self, "_firstSidecarForAnySiteOfType:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", &unk_1E64CE4D8);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastUsedDateForContext:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastUsedDateForContext:", v4);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9 && v10)
      {
        objc_msgSend(v9, "laterDate:", v10);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v10)
          v14 = (void *)v10;
        else
          v14 = v9;
        v12 = v14;
      }
      v13 = v12;

      goto LABEL_16;
    case 2:
      -[NSMutableDictionary objectForKeyedSubscript:](self->_passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", &unk_1E64CE4D8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      -[WBSSavedAccount _firstSidecarForAnySiteOfType:](self, "_firstSidecarForAnySiteOfType:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = v6;
      objc_msgSend(v6, "lastUsedDateForContext:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (void)setLastUsedDate:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __46__WBSSavedAccount_setLastUsedDate_forContext___block_invoke;
  v14 = &unk_1E649EC40;
  v15 = v6;
  v16 = v7;
  v8 = v7;
  v9 = v6;
  v10 = _Block_copy(&v11);
  -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v10, v11, v12, v13, v14);
  -[WBSSavedAccount _updatePasskeySidecarsIfNecessaryWithBlock:](self, "_updatePasskeySidecarsIfNecessaryWithBlock:", v10);

}

void __46__WBSSavedAccount_setLastUsedDate_forContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!a2)
  {
    v6 = v5;
    objc_msgSend(v5, "setLastUsedDate:forContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v5 = v6;
  }

}

- (BOOL)isDefaultCredentialForFullyQualifiedHostname:(id)a3
{
  return -[NSMutableSet containsObject:](self->_sitesForWhichSelfIsDefault, "containsObject:", a3);
}

- (BOOL)canUserEditSavedAccount
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  char v8;

  -[WBSSavedAccount passkeyRelyingPartyID](self, "passkeyRelyingPartyID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("apple.com"));

  if ((v4 & 1) != 0)
    return 0;
  if (-[WBSSavedAccount isSavedInPersonalKeychain](self, "isSavedInPersonalKeychain"))
    return 1;
  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount sharedGroupID](self, "sharedGroupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "canCurrentUserEditSavedAccountsInGroupWithID:", v7);

  return v8;
}

- (BOOL)isCurrentUserOriginalContributor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;

  if (-[WBSSavedAccount isSavedInPersonalKeychain](self, "isSavedInPersonalKeychain"))
    return 1;
  -[WBSSavedAccount originalContributorParticipantID](self, "originalContributorParticipantID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccount isCurrentUserOriginalContributor].cold.1();
    return 1;
  }
  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUserParticipantID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WBSSavedAccount originalContributorParticipantID](self, "originalContributorParticipantID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)participantIDThatMovedSavedAccountToRecentlyDeleted
{
  void *v2;
  void *v3;

  -[WBSSavedAccount _firstSidecarForAnySiteOfType:](self, "_firstSidecarForAnySiteOfType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "participantIDForUserThatMovedSavedAccountToRecentlyDeleted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)markOriginalContributorParticipantID
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD aBlock[4];
  id v9;

  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUserParticipantID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__WBSSavedAccount_markOriginalContributorParticipantID__block_invoke;
    aBlock[3] = &unk_1E649ECB8;
    v9 = v4;
    v5 = _Block_copy(aBlock);
    -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v5);
    -[WBSSavedAccount _updatePasskeySidecarsIfNecessaryWithBlock:](self, "_updatePasskeySidecarsIfNecessaryWithBlock:", v5);

  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccount markOriginalContributorParticipantID].cold.1();
  }

  return v4 != 0;
}

void __55__WBSSavedAccount_markOriginalContributorParticipantID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (a2 == 1)
  {
    v6 = v5;
    objc_msgSend(v5, "setOriginalContributorParticipantID:", *(_QWORD *)(a1 + 32));
    v5 = v6;
  }

}

- (BOOL)markParticipantIDThatMovedSavedAccountToRecentlyDeleted
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD aBlock[4];
  id v9;

  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUserParticipantID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__WBSSavedAccount_markParticipantIDThatMovedSavedAccountToRecentlyDeleted__block_invoke;
    aBlock[3] = &unk_1E649ECB8;
    v9 = v4;
    v5 = _Block_copy(aBlock);
    -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v5);
    -[WBSSavedAccount _updatePasskeySidecarsIfNecessaryWithBlock:](self, "_updatePasskeySidecarsIfNecessaryWithBlock:", v5);

  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccount markOriginalContributorParticipantID].cold.1();
  }

  return v4 != 0;
}

void __74__WBSSavedAccount_markParticipantIDThatMovedSavedAccountToRecentlyDeleted__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (a2 == 1)
  {
    v6 = v5;
    objc_msgSend(v5, "setParticipantIDForUserThatMovedSavedAccountToRecentlyDeleted:", *(_QWORD *)(a1 + 32));
    v5 = v6;
  }

}

- (void)clearParticipantIDThatMovedSavedAccountToRecentlyDeleted
{
  -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", &__block_literal_global_51);
  -[WBSSavedAccount _updatePasskeySidecarsIfNecessaryWithBlock:](self, "_updatePasskeySidecarsIfNecessaryWithBlock:", &__block_literal_global_51);
}

void __75__WBSSavedAccount_clearParticipantIDThatMovedSavedAccountToRecentlyDeleted__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  if (a2 == 1)
  {
    v5 = v4;
    objc_msgSend(v4, "setParticipantIDForUserThatMovedSavedAccountToRecentlyDeleted:", 0);
    v4 = v5;
  }

}

- (NSString)originalContributorParticipantID
{
  void *v3;
  void *v4;
  void *v5;

  if (-[WBSSavedAccount credentialTypes](self, "credentialTypes") == 4)
  {
    -[WBSSavedAccount signInWithAppleAccount](self, "signInWithAppleAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shareInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "participantID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WBSSavedAccount _firstSidecarForAnySiteOfType:](self, "_firstSidecarForAnySiteOfType:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "originalContributorParticipantID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

- (BOOL)hasSidecarDataToConsiderForCredentialMerging
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[WBSSavedAccount totpGenerators](self, "totpGenerators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[WBSSavedAccount notesEntry](self, "notesEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v4 = 1;
    }
    else
    {
      -[WBSSavedAccount customTitle](self, "customTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        v4 = 1;
      }
      else
      {
        -[WBSSavedAccount originalContributorParticipantID](self, "originalContributorParticipantID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "length") != 0;

      }
    }

  }
  return v4;
}

- (BOOL)_canMergeWithSavedAccount:(id)a3 requiresDataCopying:(BOOL *)a4
{
  id v6;
  int64_t v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;

  v6 = a3;
  v7 = -[WBSSavedAccount credentialTypes](self, "credentialTypes");
  v8 = objc_msgSend(v6, "credentialTypes");
  if (v7 == 1 && v8 == 2 || v7 == 2 && v8 == 1)
  {
    if (-[WBSSavedAccount _isSidecarDataForCredentialMergingEqual:](self, "_isSidecarDataForCredentialMergingEqual:", v6))
    {
      *a4 = 0;
      v9 = 1;
    }
    else
    {
      v9 = -[WBSSavedAccount _isSidecarDataForCredentialMergingCompatible:](self, "_isSidecarDataForCredentialMergingCompatible:", v6);
      *a4 = v9;
    }
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccount _canMergeWithSavedAccount:requiresDataCopying:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isSidecarDataForCredentialMergingEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[WBSSavedAccount notesEntry](self, "notesEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notesEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (WBSIsEqual(v5, v6))
  {
    -[WBSSavedAccount customTitle](self, "customTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (WBSIsEqual(v7, v8))
    {
      -[WBSSavedAccount originalContributorParticipantID](self, "originalContributorParticipantID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "originalContributorParticipantID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = WBSIsEqual(v9, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_isSidecarDataForCredentialMergingCompatible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  char v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[WBSSavedAccount notesEntry](self, "notesEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notesEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
    v7 = objc_msgSend(v5, "isEqual:", v6);
  else
    v7 = 1;
  -[WBSSavedAccount customTitle](self, "customTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    v11 = v7;
    goto LABEL_14;
  }
  v10 = objc_msgSend(v9, "length");
  if (v10)
    v11 = 0;
  else
    v11 = v7;
  if (!v10 || ((v7 ^ 1) & 1) != 0)
  {
LABEL_14:
    if (!v11)
      goto LABEL_12;
LABEL_15:
    -[WBSSavedAccount originalContributorParticipantID](self, "originalContributorParticipantID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalContributorParticipantID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = WBSIsEqual(v13, v14);

    goto LABEL_16;
  }
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
    goto LABEL_15;
LABEL_12:
  v12 = 0;
LABEL_16:

  return v12;
}

- (NSString)uniqueIdentifierForPasswordManagerLegacy
{
  char v3;
  void *v4;
  void *v5;
  NSString *serviceName;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *user;
  void *v12;
  NSString *passkeyRelyingPartyID;
  NSString *passkeyCredentialID;
  NSString *sharedGroupID;
  NSString *v16;
  NSString *v17;
  const __CFString *customTitle;
  void *v19;
  uint64_t v21;

  if (-[WBSSavedAccount credentialTypes](self, "credentialTypes") != 4)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    user = self->_user;
    -[WBSSavedAccount protectionSpaces](self, "protectionSpaces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_430);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringWithFormat:", CFSTR("[ %@ ]"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    passkeyRelyingPartyID = self->_passkeyRelyingPartyID;
    passkeyCredentialID = self->_passkeyCredentialID;
    if (-[NSString length](self->_sharedGroupID, "length"))
      sharedGroupID = self->_sharedGroupID;
    else
      sharedGroupID = 0;
    customTitle = (const __CFString *)self->_customTitle;
    if (!customTitle)
      customTitle = &stru_1E64A2498;
    objc_msgSend(v10, "stringWithFormat:", CFSTR("user = %@; password_protectionSpaces = %@; passkey_rpid = %@; passkey_credentialID = %@; groupID = %@; customTitle = %@;"),
      user,
      v8,
      passkeyRelyingPartyID,
      passkeyCredentialID,
      sharedGroupID,
      customTitle);
    goto LABEL_15;
  }
  v3 = objc_opt_respondsToSelector();
  v4 = (void *)MEMORY[0x1E0CB3940];
  if ((v3 & 1) != 0)
  {
    -[AKSignInWithAppleAccount userID](self->_signInWithAppleAccount, "userID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    serviceName = self->_serviceName;
    -[AKSignInWithAppleAccount clientID](self->_signInWithAppleAccount, "clientID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignInWithAppleAccount privateEmail](self->_signInWithAppleAccount, "privateEmail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](self->_sharedGroupID, "length"))
      v9 = self->_sharedGroupID;
    else
      v9 = 0;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("user = %@; serviceName = %@; clientID = %@; privateEmail = %@; groupID = %@;"),
      v5,
      serviceName,
      v7,
      v8,
      v9,
      v21);
LABEL_15:
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  v16 = self->_serviceName;
  -[AKSignInWithAppleAccount clientID](self->_signInWithAppleAccount, "clientID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignInWithAppleAccount privateEmail](self->_signInWithAppleAccount, "privateEmail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_sharedGroupID, "length"))
    v17 = self->_sharedGroupID;
  else
    v17 = 0;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("serviceName = %@; clientID = %@; privateEmail = %@; groupID = %@;"),
    v16,
    v5,
    v7,
    v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return (NSString *)v19;
}

- (NSData)stableID
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NSString length](self->_user, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_user, CFSTR("userName"));
  -[WBSSavedAccount sites](self, "sites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[WBSSavedAccount sites](self, "sites");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sites"));

  }
  if (-[NSString length](self->_passkeyCredentialID, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_passkeyCredentialID, CFSTR("passkeyCredentialID"));
  if (-[NSString length](self->_passkeyRelyingPartyID, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_passkeyRelyingPartyID, CFSTR("passkeyRelyingPartyID"));
  if (-[NSString length](self->_sharedGroupID, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sharedGroupID, CFSTR("groupID"));
  -[AKSignInWithAppleAccount clientID](self->_signInWithAppleAccount, "clientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[AKSignInWithAppleAccount clientID](self->_signInWithAppleAccount, "clientID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("clientID"));

  }
  -[AKSignInWithAppleAccount userID](self->_signInWithAppleAccount, "userID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[AKSignInWithAppleAccount userID](self->_signInWithAppleAccount, "userID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("userID"));

  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 3, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v13;
}

- (BOOL)isAppleIDPasskey
{
  return self->_passkeyCredentialID
      && -[NSString isEqualToString:](self->_passkeyRelyingPartyID, "isEqualToString:", CFSTR("apple.com"));
}

- (BOOL)canBeExportedToPasswordsCSVFile
{
  return (-[WBSSavedAccount credentialTypes](self, "credentialTypes") & 1) != 0
      && !-[WBSSavedAccount userIsNeverSaveMarker](self, "userIsNeverSaveMarker")
      && -[WBSSavedAccount isCurrentUserOriginalContributor](self, "isCurrentUserOriginalContributor");
}

- (id)_firstSidecarForAnySiteOfType:(int64_t)a3
{
  return -[WBSSavedAccount _firstSidecarForAnySiteOfType:inSitesToSidecars:passkeySidecars:](self, "_firstSidecarForAnySiteOfType:inSitesToSidecars:passkeySidecars:", a3, self->_sitesToSidecars, self->_passkeyCredentialSidecarsDictionary);
}

- (id)_firstSidecarForAnySiteOfType:(int64_t)a3 inSitesToSidecars:(id)a4 passkeySidecars:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "allValues", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "objectForKeyedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = v15;

          goto LABEL_11;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v16;
}

- (id)_sidecarForSite:(id)a3 ofType:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sitesToSidecars, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasPasskeySidecars
{
  return -[NSMutableDictionary count](self->_passkeyCredentialSidecarsDictionary, "count") != 0;
}

- (id)_passkeySidecarOfType:(int64_t)a3
{
  NSMutableDictionary *passkeyCredentialSidecarsDictionary;
  void *v4;
  void *v5;

  passkeyCredentialSidecarsDictionary = self->_passkeyCredentialSidecarsDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_addPasskeySidecar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *customTitle;
  uint64_t v9;
  NSMutableDictionary *passkeyCredentialSidecarsDictionary;
  void *v11;
  NSObject *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "customTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (NSString *)objc_msgSend(v5, "copy");
      customTitle = self->_customTitle;
      self->_customTitle = v7;

    }
    v9 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 1;
LABEL_7:
    passkeyCredentialSidecarsDictionary = self->_passkeyCredentialSidecarsDictionary;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](passkeyCredentialSidecarsDictionary, "setObject:forKeyedSubscript:", v4, v11);

    goto LABEL_10;
  }
  v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[WBSSavedAccount _addPasskeySidecar:].cold.1(v12);
LABEL_10:

}

- (void)_mergePasskeySidecarsFromSavedAccount:(id)a3
{
  objc_storeStrong((id *)&self->_passkeyCredentialSidecarsDictionary, *((id *)a3 + 8));
}

- (BOOL)hasPasswordSidecars
{
  NSMutableDictionary *sitesToSidecars;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  sitesToSidecars = self->_sitesToSidecars;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__WBSSavedAccount_hasPasswordSidecars__block_invoke;
  v5[3] = &unk_1E649ED20;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sitesToSidecars, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__WBSSavedAccount_hasPasswordSidecars__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumeratePasswordSidecarsWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *sitesToSidecars;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sitesToSidecars = self->_sitesToSidecars;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__WBSSavedAccount_enumeratePasswordSidecarsWithBlock___block_invoke;
  v7[3] = &unk_1E649ED70;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sitesToSidecars, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __54__WBSSavedAccount_enumeratePasswordSidecarsWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__WBSSavedAccount_enumeratePasswordSidecarsWithBlock___block_invoke_2;
  v4[3] = &unk_1E649ED48;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __54__WBSSavedAccount_enumeratePasswordSidecarsWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, objc_msgSend(a2, "unsignedIntegerValue"), v7, a4);

}

- (void)enumeratePasskeySidecarsWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *passkeyCredentialSidecarsDictionary;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  passkeyCredentialSidecarsDictionary = self->_passkeyCredentialSidecarsDictionary;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__WBSSavedAccount_enumeratePasskeySidecarsWithBlock___block_invoke;
  v7[3] = &unk_1E649ED48;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](passkeyCredentialSidecarsDictionary, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __53__WBSSavedAccount_enumeratePasskeySidecarsWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, objc_msgSend(a2, "unsignedIntegerValue"), v7, a4);

}

- (NSArray)allPasswordSidecars
{
  void *v2;
  void *v3;

  -[WBSSavedAccount _allPasswordSidecarsAsMutableArray](self, "_allPasswordSidecarsAsMutableArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSMutableArray)_allPasswordSidecarsAsMutableArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_sitesToSidecars, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "allValues");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSMutableArray *)v3;
}

- (void)_addSidecar:(id)a3 forSite:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *customTitle;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sitesToSidecars, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sitesToSidecars, "setObject:forKeyedSubscript:", v8, v7);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, &unk_1E64CE4D8);
    objc_msgSend(v6, "customTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = (NSString *)objc_msgSend(v9, "copy");
      customTitle = self->_customTitle;
      self->_customTitle = v11;

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, &unk_1E64CE4C0);
    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[WBSSavedAccount _addSidecar:forSite:].cold.1((uint64_t)v7, v13);
    }
  }

}

- (id)_allSidecarsForSite:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sitesToSidecars, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

- (NSArray)allSidecars
{
  void *v3;
  NSMutableDictionary *passkeyCredentialSidecarsDictionary;
  void *v5;

  -[WBSSavedAccount _allPasswordSidecarsAsMutableArray](self, "_allPasswordSidecarsAsMutableArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  passkeyCredentialSidecarsDictionary = self->_passkeyCredentialSidecarsDictionary;
  if (passkeyCredentialSidecarsDictionary)
  {
    -[NSMutableDictionary allValues](passkeyCredentialSidecarsDictionary, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  return (NSArray *)v3;
}

- (void)_updatePasswordSidecarsIfNecessaryWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WBSSavedAccountSidecar *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  WBSSavedAccountSharedSidecar *v20;
  WBSSavedAccountSharedSidecar *v21;
  WBSSavedAccount *v22;
  id obj;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  WBSSavedAccount *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[WBSSavedAccount credentialTypes](self, "credentialTypes") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92C60], "safari_credentialWithUser:password:persistence:", self->_user, self->_password, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[WBSSavedAccount protectionSpaces](self, "protectionSpaces");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v24)
    {
      v7 = *(_QWORD *)v31;
      v22 = self;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v31 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v9, "host");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sitesToSidecars, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E64CE4D8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v13 = -[WBSSavedAccountSidecar initWithUser:protectionSpace:]([WBSSavedAccountSidecar alloc], "initWithUser:protectionSpace:", self->_user, v9);
            -[WBSSavedAccount _addSidecar:forSite:](self, "_addSidecar:forSite:", v13, v10);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_sitesToSidecars, "objectForKeyedSubscript:", v10);
            v14 = v7;
            v15 = v6;
            v16 = v5;
            v17 = v4;
            v18 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v18;
            v4 = v17;
            v5 = v16;
            v6 = v15;
            v7 = v14;
            self = v22;
          }
          if (-[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"))
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E64CE4C0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              v20 = [WBSSavedAccountSharedSidecar alloc];
              v21 = -[WBSSavedAccountSharedSidecar initWithUser:protectionSpace:dictionaryRepresentation:](v20, "initWithUser:protectionSpace:dictionaryRepresentation:", self->_user, v9, MEMORY[0x1E0C9AA70]);
              -[WBSSavedAccount _addSidecar:forSite:](self, "_addSidecar:forSite:", v21, v10);

            }
          }
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __63__WBSSavedAccount__updatePasswordSidecarsIfNecessaryWithBlock___block_invoke;
          v25[3] = &unk_1E649ED98;
          v29 = v4;
          v26 = v5;
          v27 = v6;
          v28 = self;
          objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v25);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v24);
    }

  }
}

void __63__WBSSavedAccount__updatePasswordSidecarsIfNecessaryWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v5, v11);
  if (v5 == 1)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v7 = v11;
    goto LABEL_7;
  }
  v7 = v11;
  if (!v5)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v7, "protectionSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v11, v9, v10, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168), objc_msgSend(*(id *)(a1 + 48), "isRecentlyDeleted"));

    v7 = v11;
  }

}

- (void)_updatePasskeySidecarsIfNecessaryWithBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WBSSavedAccountSidecar *v8;
  void *v9;
  WBSSavedAccountSharedSidecar *v10;
  WBSSavedAccountSharedSidecar *v11;
  NSMutableDictionary *passkeyCredentialSidecarsDictionary;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  WBSSavedAccount *v19;
  id v20;

  v15 = a3;
  if ((-[WBSSavedAccount credentialTypes](self, "credentialTypes") & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C92C60], "safari_credentialWithUser:password:persistence:", self->_passkeyUserHandle, &stru_1E64A2498, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92C70], "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", self->_passkeyRelyingPartyID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", &unk_1E64CE4D8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = -[WBSSavedAccountSidecar initWithUser:protectionSpace:]([WBSSavedAccountSidecar alloc], "initWithUser:protectionSpace:", self->_passkeyUserHandle, v6);
      -[WBSSavedAccount _addPasskeySidecar:](self, "_addPasskeySidecar:", v8);

    }
    if (-[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", &unk_1E64CE4C0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = [WBSSavedAccountSharedSidecar alloc];
        v11 = -[WBSSavedAccountSharedSidecar initWithUser:protectionSpace:dictionaryRepresentation:](v10, "initWithUser:protectionSpace:dictionaryRepresentation:", self->_passkeyUserHandle, v6, MEMORY[0x1E0C9AA70]);
        -[WBSSavedAccount _addPasskeySidecar:](self, "_addPasskeySidecar:", v11);

      }
    }
    passkeyCredentialSidecarsDictionary = self->_passkeyCredentialSidecarsDictionary;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__WBSSavedAccount__updatePasskeySidecarsIfNecessaryWithBlock___block_invoke;
    v16[3] = &unk_1E649ED98;
    v17 = v5;
    v18 = v4;
    v19 = self;
    v20 = v15;
    v13 = v4;
    v14 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](passkeyCredentialSidecarsDictionary, "enumerateKeysAndObjectsUsingBlock:", v16);

  }
}

void __62__WBSSavedAccount__updatePasskeySidecarsIfNecessaryWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v5, v11);
  if (v5 == 1)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v7 = v11;
    goto LABEL_7;
  }
  v7 = v11;
  if (!v5)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
LABEL_7:
    objc_msgSend(v7, "protectionSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v11, v9, v10, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168), objc_msgSend(*(id *)(a1 + 48), "isRecentlyDeleted"));

    v7 = v11;
  }

}

- (BOOL)hasSidecarData
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v8;
  uint64_t v9;

  -[WBSSavedAccount totpGenerators](self, "totpGenerators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    goto LABEL_6;
  -[WBSSavedAccount hideWarningMarker](self, "hideWarningMarker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_6:
    v6 = 1;
    goto LABEL_7;
  }
  -[WBSSavedAccount notesEntry](self, "notesEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {

    goto LABEL_6;
  }
  -[WBSSavedAccount customTitle](self, "customTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
    return 1;
  -[WBSSavedAccount lastOneTimeShareDateForPasskey](self, "lastOneTimeShareDateForPasskey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 != 0;
LABEL_7:

  return v6;
}

- (void)_copySharablePasswordSidecarDataFromPersonalSidecarsToSharedSidecars
{
  NSMutableDictionary *sitesToSidecars;
  _QWORD v3[5];

  sitesToSidecars = self->_sitesToSidecars;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__WBSSavedAccount__copySharablePasswordSidecarDataFromPersonalSidecarsToSharedSidecars__block_invoke;
  v3[3] = &unk_1E649EDC0;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sitesToSidecars, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __87__WBSSavedAccount__copySharablePasswordSidecarDataFromPersonalSidecarsToSharedSidecars__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_copySharableDataFromPersonalSidecarToSharedSidecarInDictionary:");
}

- (void)_copySharablePasskeySidecarDataFromPersonalSidecarsToSharedSidecars
{
  -[WBSSavedAccount _copySharableDataFromPersonalSidecarToSharedSidecarInDictionary:](self, "_copySharableDataFromPersonalSidecarToSharedSidecarInDictionary:", self->_passkeyCredentialSidecarsDictionary);
}

- (void)_copySharableDataFromPersonalSidecarToSharedSidecarInDictionary:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  WBSSavedAccountSharedSidecar *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E64CE4D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E64CE4C0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && !v4)
  {
    v6 = -[WBSSavedAccountSharedSidecar initWithPersonalSidecar:]([WBSSavedAccountSharedSidecar alloc], "initWithPersonalSidecar:", v3);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, &unk_1E64CE4C0);

  }
}

- (void)_copySharablePasswordSidecarDataFromSharedSidecarsToPersonalSidecars
{
  NSMutableDictionary *sitesToSidecars;
  _QWORD v3[5];

  sitesToSidecars = self->_sitesToSidecars;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__WBSSavedAccount__copySharablePasswordSidecarDataFromSharedSidecarsToPersonalSidecars__block_invoke;
  v3[3] = &unk_1E649EDC0;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sitesToSidecars, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __87__WBSSavedAccount__copySharablePasswordSidecarDataFromSharedSidecarsToPersonalSidecars__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_copySharableDataFromSharedSidecarIntoPersonalSidecarInDictionary:");
}

- (void)_copySharablePasskeySidecarDataFromSharedSidecarsToPersonalSidecars
{
  -[WBSSavedAccount _copySharableDataFromSharedSidecarIntoPersonalSidecarInDictionary:](self, "_copySharableDataFromSharedSidecarIntoPersonalSidecarInDictionary:", self->_passkeyCredentialSidecarsDictionary);
}

- (void)_copySharableDataFromSharedSidecarIntoPersonalSidecarInDictionary:(id)a3
{
  WBSSavedAccountSidecar *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E64CE4D8);
  v3 = (WBSSavedAccountSidecar *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E64CE4C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v3)
    {
      -[WBSSavedAccountSidecar adoptSharableDataFromSharedSidecar:](v3, "adoptSharableDataFromSharedSidecar:", v4);
    }
    else
    {
      v3 = -[WBSSavedAccountSidecar initWithSharedSidecar:]([WBSSavedAccountSidecar alloc], "initWithSharedSidecar:", v4);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, &unk_1E64CE4D8);
    }
  }

}

- (void)_removeSharableDataFromPersonalPasswordSidecars
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_sitesToSidecars, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_62_0);
}

void __66__WBSSavedAccount__removeSharableDataFromPersonalPasswordSidecars__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1E64CE4D8);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeSharableData");

}

- (void)_removeSharableDataFromPersonalPasskeySidecars
{
  id v2;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", &unk_1E64CE4D8);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeSharableData");

}

- (void)_createSidecarsForProtectionSpaceIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WBSSavedAccountSidecar *v8;
  void *v9;
  void *v10;
  WBSSavedAccountSidecar *v11;
  void *v12;
  void *v13;
  WBSSavedAccountSharedSidecar *v14;
  void *v15;
  void *v16;
  WBSSavedAccountSharedSidecar *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sitesToSidecars, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C92C60], "safari_credentialWithUser:password:persistence:", self->_user, self->_password, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccount _firstSidecarForAnySiteOfType:](self, "_firstSidecarForAnySiteOfType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = [WBSSavedAccountSidecar alloc];
      objc_msgSend(v7, "user");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[WBSSavedAccountSidecar initWithUser:protectionSpace:dictionaryRepresentation:](v8, "initWithUser:protectionSpace:dictionaryRepresentation:", v9, v19, v10);

      objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v11, v6, v19, self->_sharedGroupID, self->_isRecentlyDeleted);

      -[WBSSavedAccount _addSidecar:forSite:](self, "_addSidecar:forSite:", v11, v4);
    }
    -[WBSSavedAccount _firstSidecarForAnySiteOfType:](self, "_firstSidecarForAnySiteOfType:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = [WBSSavedAccountSharedSidecar alloc];
      objc_msgSend(v13, "user");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[WBSSavedAccountSharedSidecar initWithUser:protectionSpace:dictionaryRepresentation:](v14, "initWithUser:protectionSpace:dictionaryRepresentation:", v15, v19, v16);

      objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v17, v6, v19, self->_sharedGroupID, self->_isRecentlyDeleted);

      -[WBSSavedAccount _addSidecar:forSite:](self, "_addSidecar:forSite:", v17, v4);
    }

  }
}

- (void)_writeFormerlySharedSavedAccountMarkerForCredentialTypes:(int64_t)a3
{
  int v3;
  int v5;
  char v6;
  uint64_t v7;
  WBSFormerlySharedSavedAccountMarker *v8;
  void *v9;
  void *v10;
  WBSFormerlySharedSavedAccountMarker *v11;
  WBSFormerlySharedSavedAccountMarker *v12;
  WBSFormerlySharedSavedAccountMarker *v13;
  void *v14;
  void *v15;
  WBSFormerlySharedSavedAccountMarker *v16;
  WBSFormerlySharedSavedAccountMarker *v17;
  _QWORD v18[4];
  WBSFormerlySharedSavedAccountMarker *v19;
  _QWORD v20[4];
  WBSFormerlySharedSavedAccountMarker *v21;

  v3 = a3;
  v5 = -[WBSSavedAccount credentialTypes](self, "credentialTypes");
  v6 = v5 & v3;
  v7 = MEMORY[0x1E0C809B0];
  if ((v5 & v3 & 1) != 0)
  {
    v8 = [WBSFormerlySharedSavedAccountMarker alloc];
    -[WBSSavedAccount password](self, "password");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccount sharedGroupName](self, "sharedGroupName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WBSFormerlySharedSavedAccountMarker initWithPasswordManagerCredentialIdentifier:nameOfGroupCredentialWasLastSharedIn:](v8, "initWithPasswordManagerCredentialIdentifier:nameOfGroupCredentialWasLastSharedIn:", v9, v10);

    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __76__WBSSavedAccount__writeFormerlySharedSavedAccountMarkerForCredentialTypes___block_invoke;
    v20[3] = &unk_1E649ECB8;
    v21 = v11;
    v12 = v11;
    -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v20);

  }
  if ((v6 & 2) != 0)
  {
    v13 = [WBSFormerlySharedSavedAccountMarker alloc];
    -[WBSSavedAccount passkeyCredentialID](self, "passkeyCredentialID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccount sharedGroupName](self, "sharedGroupName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WBSFormerlySharedSavedAccountMarker initWithPasswordManagerCredentialIdentifier:nameOfGroupCredentialWasLastSharedIn:](v13, "initWithPasswordManagerCredentialIdentifier:nameOfGroupCredentialWasLastSharedIn:", v14, v15);

    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __76__WBSSavedAccount__writeFormerlySharedSavedAccountMarkerForCredentialTypes___block_invoke_2;
    v18[3] = &unk_1E649ECB8;
    v19 = v16;
    v17 = v16;
    -[WBSSavedAccount _updatePasskeySidecarsIfNecessaryWithBlock:](self, "_updatePasskeySidecarsIfNecessaryWithBlock:", v18);

  }
}

void __76__WBSSavedAccount__writeFormerlySharedSavedAccountMarkerForCredentialTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!a2)
  {
    v6 = v5;
    objc_msgSend(v5, "setFormerlySharedSavedAccountMarker:", *(_QWORD *)(a1 + 32));
    v5 = v6;
  }

}

void __76__WBSSavedAccount__writeFormerlySharedSavedAccountMarkerForCredentialTypes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!a2)
  {
    v6 = v5;
    objc_msgSend(v5, "setFormerlySharedSavedAccountMarker:", *(_QWORD *)(a1 + 32));
    v5 = v6;
  }

}

- (void)_clearFormerlySharedSavedAccountMarkerForCredentialTypesIfNecessary:(int64_t)a3
{
  char v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  if ((a3 & 1) != 0)
  {
    -[WBSSavedAccount formerlySharedPasswordMarker](self, "formerlySharedPasswordMarker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

    if ((v3 & 2) == 0)
      goto LABEL_7;
  }
  else
  {
    v5 = 0;
    if ((a3 & 2) == 0)
      goto LABEL_7;
  }
  -[WBSSavedAccount formerlySharedPasskeyMarker](self, "formerlySharedPasskeyMarker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v5 | 2;
    goto LABEL_9;
  }
LABEL_7:
  if (!v5)
    return;
  v8 = 1;
LABEL_9:
  -[WBSSavedAccount _clearFormerlySharedSavedAccountMarkerForCredentialTypes:](self, "_clearFormerlySharedSavedAccountMarkerForCredentialTypes:", v8);
}

- (void)_clearFormerlySharedSavedAccountMarkerForCredentialTypes:(int64_t)a3
{
  char v3;

  v3 = a3;
  if ((a3 & 1) != 0)
    -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", &__block_literal_global_64_0);
  if ((v3 & 2) != 0)
    -[WBSSavedAccount _updatePasskeySidecarsIfNecessaryWithBlock:](self, "_updatePasskeySidecarsIfNecessaryWithBlock:", &__block_literal_global_64_0);
}

void __76__WBSSavedAccount__clearFormerlySharedSavedAccountMarkerForCredentialTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  if (!a2)
  {
    v5 = v4;
    objc_msgSend(v4, "setFormerlySharedSavedAccountMarker:", 0);
    v4 = v5;
  }

}

- (BOOL)_containsProtectionSpace:(id)a3
{
  id v4;
  NSMutableDictionary *siteToProtectionSpaces;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  siteToProtectionSpaces = self->_siteToProtectionSpaces;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__WBSSavedAccount__containsProtectionSpace___block_invoke;
  v8[3] = &unk_1E649EE48;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](siteToProtectionSpaces, "enumerateKeysAndObjectsUsingBlock:", v8);
  LOBYTE(siteToProtectionSpaces) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)siteToProtectionSpaces;
}

uint64_t __44__WBSSavedAccount__containsProtectionSpace___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_deleteCredentialForProtectionSpace:(id)a3 fromStorage:(id)a4 forGroupID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSString *user;
  _BOOL8 v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v14 = a3;
  objc_msgSend(v14, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  user = self->_user;
  v13 = -[WBSSavedAccount isRecentlyDeleted](self, "isRecentlyDeleted");
  if (v11)
    objc_msgSend(v9, "safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:", user, v14, v8, v13);
  else
    objc_msgSend(v9, "safari_deleteCredentialWithEmptyServerHostForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:", user, v14, v8, v13);

}

- (id)_movePasswordCredentialToNewSavedAccount
{
  id v3;

  v3 = -[WBSSavedAccount _copyPasswordCredentialToNewSavedAccount](self, "_copyPasswordCredentialToNewSavedAccount");
  -[WBSSavedAccount _removePasswordCredentialAndSidecars](self, "_removePasswordCredentialAndSidecars");
  return v3;
}

- (id)_copyPasswordCredentialToNewSavedAccount
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = -[WBSSavedAccount _initWithHighLevelDomain:user:password:]([WBSSavedAccount alloc], "_initWithHighLevelDomain:user:password:", self->_highLevelDomain, self->_user, self->_password);
  v4 = -[NSMutableArray mutableCopy](self->_sites, "mutableCopy");
  v5 = (void *)*((_QWORD *)v3 + 2);
  *((_QWORD *)v3 + 2) = v4;

  v6 = -[NSMutableDictionary mutableCopy](self->_siteToProtectionSpaces, "mutableCopy");
  v7 = (void *)*((_QWORD *)v3 + 3);
  *((_QWORD *)v3 + 3) = v6;

  v8 = -[NSMutableSet mutableCopy](self->_sitesForWhichSelfIsDefault, "mutableCopy");
  v9 = (void *)*((_QWORD *)v3 + 4);
  *((_QWORD *)v3 + 4) = v8;

  objc_storeStrong((id *)v3 + 5, self->_earliestPasswordCredentialModificationDate);
  objc_storeStrong((id *)v3 + 6, self->_earliestPasswordCredentialCreationDate);
  v10 = -[NSMutableDictionary mutableCopy](self->_sitesToSidecars, "mutableCopy");
  v11 = (void *)*((_QWORD *)v3 + 7);
  *((_QWORD *)v3 + 7) = v10;

  -[WBSSavedAccount sharedGroupID](self, "sharedGroupID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedGroupID:", v12);

  -[WBSSavedAccount sharedGroupName](self, "sharedGroupName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedGroupName:", v13);

  return v3;
}

- (id)_movePasskeyCredentialToNewSavedAccount
{
  id v3;

  v3 = -[WBSSavedAccount _copyPasskeyCredentialToNewSavedAccount](self, "_copyPasskeyCredentialToNewSavedAccount");
  -[WBSSavedAccount _removePasskeyCredentialAndSidecars](self, "_removePasskeyCredentialAndSidecars");
  return v3;
}

- (id)_copyPasskeyCredentialToNewSavedAccount
{
  WBSSavedAccount *v3;
  NSString *highLevelDomain;
  NSString *user;
  NSString *passkeyRelyingPartyID;
  NSString *passkeyUserHandle;
  NSString *passkeyCredentialID;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = [WBSSavedAccount alloc];
  highLevelDomain = self->_highLevelDomain;
  user = self->_user;
  passkeyRelyingPartyID = self->_passkeyRelyingPartyID;
  passkeyUserHandle = self->_passkeyUserHandle;
  passkeyCredentialID = self->_passkeyCredentialID;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WBSSavedAccount _initWithHighLevelDomain:passkeyRelyingPartyID:user:password:passkeyUserHandle:passkeyCredentialID:siteToProtectionSpaces:sitesToSidecars:serviceName:](v3, "_initWithHighLevelDomain:passkeyRelyingPartyID:user:password:passkeyUserHandle:passkeyCredentialID:siteToProtectionSpaces:sitesToSidecars:serviceName:", highLevelDomain, passkeyRelyingPartyID, user, 0, passkeyUserHandle, passkeyCredentialID, v9, v10, 0);

  -[WBSSavedAccount sharedGroupID](self, "sharedGroupID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSharedGroupID:", v12);

  -[WBSSavedAccount sharedGroupName](self, "sharedGroupName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSharedGroupName:", v13);

  v14 = -[NSMutableDictionary mutableCopy](self->_passkeyCredentialSidecarsDictionary, "mutableCopy");
  v15 = (void *)v11[8];
  v11[8] = v14;

  return v11;
}

- (void)_deleteCredentialTypes:(int64_t)a3
{
  char v3;
  int64_t v5;
  int64_t v6;

  v3 = a3;
  v5 = -[WBSSavedAccount credentialTypes](self, "credentialTypes");
  v6 = v5;
  if ((v3 & 1) != 0)
    -[WBSSavedAccount _deletePasswordCredentialsRemovingCachedCredentialData:](self, "_deletePasswordCredentialsRemovingCachedCredentialData:", v5 == 3);
  if ((v3 & 2) != 0)
    -[WBSSavedAccount _deletePasskeyCredentialRemovingCachedCredentialData:](self, "_deletePasskeyCredentialRemovingCachedCredentialData:", v6 == 3);
}

- (void)_deletePasswordCredentialsRemovingCachedCredentialData:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;

  v3 = a3;
  v5 = -[WBSSavedAccount credentialTypes](self, "credentialTypes");
  if (v5 != 4)
  {
    if (v5 == 3)
      -[WBSSavedAccount _deleteTOTPGeneratorIfNecessary](self, "_deleteTOTPGeneratorIfNecessary");
    if (-[WBSSavedAccount isSavedInPersonalKeychain](self, "isSavedInPersonalKeychain"))
      -[WBSSavedAccount _deletePasswordCredentialsInPersonalKeychain](self, "_deletePasswordCredentialsInPersonalKeychain");
    if (-[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"))
      -[WBSSavedAccount _deletePasswordCredentialsForGroupID:](self, "_deletePasswordCredentialsForGroupID:", self->_sharedGroupID);
    if (v3)
      -[WBSSavedAccount _removePasswordCredentialAndSidecars](self, "_removePasswordCredentialAndSidecars");
  }
}

- (void)_removePasswordCredentialAndSidecars
{
  NSMutableDictionary *v3;
  NSMutableDictionary *siteToProtectionSpaces;
  NSMutableSet *v5;
  NSMutableSet *sitesForWhichSelfIsDefault;
  NSMutableArray *sites;
  NSDate *earliestPasswordCredentialModificationDate;
  NSDate *earliestPasswordCredentialCreationDate;
  NSString *password;

  -[NSMutableDictionary removeAllObjects](self->_sitesToSidecars, "removeAllObjects");
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  siteToProtectionSpaces = self->_siteToProtectionSpaces;
  self->_siteToProtectionSpaces = v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  sitesForWhichSelfIsDefault = self->_sitesForWhichSelfIsDefault;
  self->_sitesForWhichSelfIsDefault = v5;

  sites = self->_sites;
  self->_sites = 0;

  earliestPasswordCredentialModificationDate = self->_earliestPasswordCredentialModificationDate;
  self->_earliestPasswordCredentialModificationDate = 0;

  earliestPasswordCredentialCreationDate = self->_earliestPasswordCredentialCreationDate;
  self->_earliestPasswordCredentialCreationDate = 0;

  password = self->_password;
  self->_password = 0;

}

- (void)_deletePasswordCredentialsForSite:(id)a3
{
  int64_t v4;
  NSString *password;
  id v6;

  v6 = a3;
  if (-[WBSSavedAccount isSavedInPersonalKeychain](self, "isSavedInPersonalKeychain"))
    -[WBSSavedAccount _deletePasswordCredentialsForSite:forGroupID:](self, "_deletePasswordCredentialsForSite:forGroupID:", v6, 0);
  if (-[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"))
    -[WBSSavedAccount _deletePasswordCredentialsForSite:forGroupID:](self, "_deletePasswordCredentialsForSite:forGroupID:", v6, self->_sharedGroupID);
  -[NSMutableDictionary removeObjectForKey:](self->_siteToProtectionSpaces, "removeObjectForKey:", v6);
  -[NSMutableDictionary removeObjectForKey:](self->_sitesToSidecars, "removeObjectForKey:", v6);
  -[NSMutableArray removeObject:](self->_sites, "removeObject:", v6);
  v4 = -[WBSSavedAccount credentialTypes](self, "credentialTypes");
  if (!-[NSMutableArray count](self->_sites, "count") && v4 == 3)
  {
    password = self->_password;
    self->_password = 0;

  }
}

- (void)_deletePasswordCredentialsForSite:(id)a3 forGroupID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary objectForKey:](self->_siteToProtectionSpaces, "objectForKey:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[WBSSavedAccount _deleteCredentialForProtectionSpace:fromStorage:forGroupID:](self, "_deleteCredentialForProtectionSpace:fromStorage:forGroupID:", v14, v8, v7);
        -[WBSSavedAccount _deleteSidecarForProtectionSpace:fromStorage:forGroupID:](self, "_deleteSidecarForProtectionSpace:fromStorage:forGroupID:", v14, v8, v7);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)_deletePasswordCredentialsInPersonalKeychain
{
  -[WBSSavedAccount _deletePasswordCredentialsForGroupID:](self, "_deletePasswordCredentialsForGroupID:", 0);
}

- (void)_deletePasswordCredentialsForGroupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  WBSSavedAccount *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[WBSSavedAccount protectionSpaces](self, "protectionSpaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        -[WBSSavedAccount _deleteCredentialForProtectionSpace:fromStorage:forGroupID:](self, "_deleteCredentialForProtectionSpace:fromStorage:forGroupID:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10++), v5, v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__WBSSavedAccount__deletePasswordCredentialsForGroupID___block_invoke;
  v14[3] = &unk_1E649D2E8;
  v15 = v11;
  v16 = v4;
  v17 = self;
  v12 = v4;
  v13 = v11;
  -[WBSSavedAccount enumeratePasswordSidecarsWithBlock:](self, "enumeratePasswordSidecarsWithBlock:", v14);

}

void __56__WBSSavedAccount__deletePasswordCredentialsForGroupID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "user");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protectionSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", a2, v8, v7, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "isRecentlyDeleted"));
}

- (void)_deletePasskeyCredentialRemovingCachedCredentialData:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[WBSSavedAccount isSavedInPersonalKeychain](self, "isSavedInPersonalKeychain"))
    -[WBSSavedAccount _deletePasskeyCredentialForGroupID:](self, "_deletePasskeyCredentialForGroupID:", &stru_1E64A2498);
  if (-[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"))
    -[WBSSavedAccount _deletePasskeyCredentialForGroupID:](self, "_deletePasskeyCredentialForGroupID:", self->_sharedGroupID);
  if (v3)
    -[WBSSavedAccount _removePasskeyCredentialAndSidecars](self, "_removePasskeyCredentialAndSidecars");
}

- (void)_removePasskeyCredentialAndSidecars
{
  NSString *passkeyCredentialID;
  NSString *passkeyUserHandle;
  NSString *passkeyRelyingPartyID;
  NSDate *creationDateForPasskey;
  NSDate *lastModifiedDateForPasskey;
  NSDate *lastUsedDateForPasskey;

  passkeyCredentialID = self->_passkeyCredentialID;
  self->_passkeyCredentialID = 0;

  -[NSMutableDictionary removeAllObjects](self->_passkeyCredentialSidecarsDictionary, "removeAllObjects");
  passkeyUserHandle = self->_passkeyUserHandle;
  self->_passkeyUserHandle = 0;

  passkeyRelyingPartyID = self->_passkeyRelyingPartyID;
  self->_passkeyRelyingPartyID = 0;

  creationDateForPasskey = self->_creationDateForPasskey;
  self->_creationDateForPasskey = 0;

  lastModifiedDateForPasskey = self->_lastModifiedDateForPasskey;
  self->_lastModifiedDateForPasskey = 0;

  lastUsedDateForPasskey = self->_lastUsedDateForPasskey;
  self->_lastUsedDateForPasskey = 0;

}

- (void)_deleteSidecarForPasskeyCredentialForGroupID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  WBSSavedAccount *v10;

  v4 = a3;
  if (-[NSMutableDictionary count](self->_passkeyCredentialSidecarsDictionary, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__WBSSavedAccount__deleteSidecarForPasskeyCredentialForGroupID___block_invoke;
    v7[3] = &unk_1E649D2E8;
    v8 = v5;
    v9 = v4;
    v10 = self;
    v6 = v5;
    -[WBSSavedAccount enumeratePasskeySidecarsWithBlock:](self, "enumeratePasskeySidecarsWithBlock:", v7);

  }
}

void __64__WBSSavedAccount__deleteSidecarForPasskeyCredentialForGroupID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "user");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protectionSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", a2, v8, v7, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "isRecentlyDeleted"));
}

- (void)_deletePasskeyCredentialForGroupID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_passkeyCredentialID)
  {
    v4 = (void *)MEMORY[0x1E0C92C68];
    v6 = a3;
    objc_msgSend(v4, "sharedCredentialStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_deletePasskeyFromSavedAccount:groupID:", self, v6);

    -[WBSSavedAccount _deleteSidecarForPasskeyCredentialForGroupID:](self, "_deleteSidecarForPasskeyCredentialForGroupID:", v6);
  }
}

- (void)_deleteSidecarForProtectionSpace:(id)a3 fromStorage:(id)a4 forGroupID:(id)a5
{
  NSString *user;
  id v9;
  id v10;
  id v11;

  user = self->_user;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v10, "safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", 0, user, v11, v9, -[WBSSavedAccount isRecentlyDeleted](self, "isRecentlyDeleted"));

}

- (void)_deleteTOTPGeneratorIfNecessary
{
  void *v3;
  id v4;

  -[WBSSavedAccount totpGenerators](self, "totpGenerators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[WBSSavedAccount setTOTPGenerator:](self, "setTOTPGenerator:", 0);

}

- (NSArray)sites
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *sites;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sites = self->_sites;
  if (!sites)
  {
    -[NSMutableDictionary allKeys](self->_siteToProtectionSpaces, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
    v7 = self->_sites;
    self->_sites = v6;

    -[NSMutableArray sortUsingSelector:](self->_sites, "sortUsingSelector:", sel_localizedCompare_);
    sites = self->_sites;
  }
  v8 = (void *)-[NSMutableArray copy](sites, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v8;
}

- (NSArray)protectionSpaces
{
  id v3;
  NSMutableDictionary *siteToProtectionSpaces;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  siteToProtectionSpaces = self->_siteToProtectionSpaces;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__WBSSavedAccount_protectionSpaces__block_invoke;
  v7[3] = &unk_1E649EE70;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](siteToProtectionSpaces, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

uint64_t __35__WBSSavedAccount_protectionSpaces__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (int64_t)compare:(id)a3
{
  return -[WBSSavedAccount compare:byType:](self, "compare:byType:", a3, 0);
}

- (int64_t)compare:(id)a3 byType:(int64_t)a4
{
  id *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSComparisonResult v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (id *)a3;
  if (a4 == 1)
  {
    if (-[WBSSavedAccount hasValidWebsite](self, "hasValidWebsite"))
      -[WBSSavedAccount userVisibleDomain](self, "userVisibleDomain");
    else
      -[WBSSavedAccount effectiveTitleForSorting](self, "effectiveTitleForSorting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasValidWebsite") & 1) != 0)
    {
      objc_msgSend(v6, "userVisibleDomain");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    objc_msgSend(v6, "effectiveTitleForSorting");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v9 = (void *)v8;
    v10 = objc_msgSend(v7, "safari_localizedCompareSortingEmptyStringAndNumericPrefixToEnd:", v8);

    if (v10)
      goto LABEL_23;
    goto LABEL_11;
  }
  if (!a4)
  {
    -[WBSSavedAccount effectiveTitleForSorting](self, "effectiveTitleForSorting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_11:
  if (self->_userIsNeverSaveMarker)
  {
    if (!*((_BYTE *)v6 + 104))
    {
LABEL_22:
      v10 = NSOrderedAscending;
      goto LABEL_23;
    }
  }
  else if (*((_BYTE *)v6 + 104))
  {
LABEL_20:
    v10 = NSOrderedDescending;
    goto LABEL_23;
  }
  if (!-[NSString length](self->_user, "length") && objc_msgSend(v6[15], "length"))
    goto LABEL_20;
  if (!objc_msgSend(v6[15], "length") && -[NSString length](self->_user, "length"))
    goto LABEL_22;
  v10 = -[NSString localizedStandardCompare:](self->_user, "localizedStandardCompare:", v6[15]);
  if (v10 == NSOrderedSame)
  {
    -[WBSSavedAccount sites](self, "sites");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sites");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "localizedStandardCompare:", v14);

  }
LABEL_23:

  return v10;
}

- (BOOL)isDuplicateWithoutUserNameOfSavedAccount:(id)a3
{
  id v4;
  BOOL v5;
  NSString *password;
  void *v8;
  NSString *highLevelDomain;
  void *v10;

  v4 = a3;
  if (-[WBSSavedAccount isEqual:](self, "isEqual:", v4) || -[NSString length](self->_user, "length"))
  {
    v5 = 0;
  }
  else
  {
    password = self->_password;
    objc_msgSend(v4, "password");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](password, "isEqualToString:", v8))
    {
      highLevelDomain = self->_highLevelDomain;
      objc_msgSend(v4, "highLevelDomain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[NSString isEqualToString:](highLevelDomain, "isEqualToString:", v10);

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)isEqualForSuggestingDuplicatesCleanup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  char v32;

  v4 = a3;
  -[WBSSavedAccount highLevelDomain](self, "highLevelDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highLevelDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = WBSIsEqual(v5, v6);

  if (!v7)
    goto LABEL_10;
  -[WBSSavedAccount user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = WBSIsEqual(v8, v9);

  if (!v10)
    goto LABEL_10;
  v11 = -[WBSSavedAccount credentialTypes](self, "credentialTypes");
  if (v11 != objc_msgSend(v4, "credentialTypes"))
    goto LABEL_10;
  -[WBSSavedAccount password](self, "password");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "password");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = WBSIsEqual(v12, v13);

  if (!v14)
    goto LABEL_10;
  -[WBSSavedAccount passkeyRelyingPartyID](self, "passkeyRelyingPartyID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passkeyRelyingPartyID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = WBSIsEqual(v15, v16);

  if (!v17)
    goto LABEL_10;
  -[WBSSavedAccount passkeyCredentialID](self, "passkeyCredentialID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passkeyCredentialID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = WBSIsEqual(v18, v19);

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x1E0C99E60]);
    -[WBSSavedAccount totpGenerators](self, "totpGenerators");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithArray:", v22);

    v24 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v4, "totpGenerators");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithArray:", v25);

    if (WBSIsEqual(v23, v26)
      && (-[WBSSavedAccount notesEntry](self, "notesEntry"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "notesEntry"),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          v29 = WBSIsEqual(v27, v28),
          v28,
          v27,
          v29))
    {
      -[WBSSavedAccount customTitle](self, "customTitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "customTitle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = WBSIsEqual(v30, v31);

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
LABEL_10:
    v32 = 0;
  }

  return v32;
}

- (void)_setUser:(id)a3 password:(id)a4
{
  id v6;
  NSString *v7;
  NSString *v8;
  NSObject *v9;
  NSObject *v10;
  WBSPublicKeyCredentialIdentifier *v11;
  WBSPublicKeyCredentialIdentifier *v12;
  NSString *v13;
  NSString *user;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  NSString *v26;
  NSString *sharedGroupID;
  _BOOL8 v28;
  NSString *v29;
  NSMutableDictionary *sitesToSidecars;
  NSString *v31;
  NSString *password;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  void *v36;
  NSString *v37;
  void *v38;
  NSMutableDictionary *obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  _QWORD v44[4];
  id v45;
  WBSSavedAccount *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSString *)a4;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[WBSSavedAccount _setUser:password:].cold.2();
      v8 = self->_password;
    }
    v43 = objc_msgSend(v6, "isEqualToString:", self->_user);
    if (v43)
    {
      if (-[NSString isEqualToString:](v8, "isEqualToString:", self->_password))
        goto LABEL_44;
    }
    else if (self->_passkeyCredentialID)
    {
      if (-[WBSSavedAccount isSavedInPersonalKeychain](self, "isSavedInPersonalKeychain"))
      {
        v11 = -[WBSPublicKeyCredentialIdentifier initWithCredentialID:groupID:]([WBSPublicKeyCredentialIdentifier alloc], "initWithCredentialID:groupID:", self->_passkeyCredentialID, &stru_1E64A2498);
        +[WBSSavedAccountStore updateUserVisibleName:forPasskeyWithIdentifier:](WBSSavedAccountStore, "updateUserVisibleName:forPasskeyWithIdentifier:", v6, v11);

      }
      if (-[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"))
      {
        v12 = -[WBSPublicKeyCredentialIdentifier initWithCredentialID:groupID:]([WBSPublicKeyCredentialIdentifier alloc], "initWithCredentialID:groupID:", self->_passkeyCredentialID, self->_sharedGroupID);
        +[WBSSavedAccountStore updateUserVisibleName:forPasskeyWithIdentifier:](WBSSavedAccountStore, "updateUserVisibleName:forPasskeyWithIdentifier:", v6, v12);

      }
      if (-[WBSSavedAccount credentialTypes](self, "credentialTypes") == 2)
      {
        v13 = (NSString *)objc_msgSend(v6, "copy");
        user = self->_user;
        self->_user = v13;

        goto LABEL_44;
      }
    }
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v8;
    v38 = v6;
    objc_msgSend(MEMORY[0x1E0C92C60], "safari_credentialWithUser:password:persistence:", v6, v8, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = self->_siteToProtectionSpaces;
    v17 = v43;
    v41 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v41)
    {
      v40 = *(_QWORD *)v54;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v54 != v40)
            objc_enumerationMutation(obj);
          v42 = v18;
          v19 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v18);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_siteToProtectionSpaces, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v50 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
                if ((v17 & 1) == 0)
                {
                  if (-[WBSSavedAccount isSavedInPersonalKeychain](self, "isSavedInPersonalKeychain"))
                    objc_msgSend(v15, "safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:", self->_user, v25, &stru_1E64A2498, -[WBSSavedAccount isRecentlyDeleted](self, "isRecentlyDeleted"));
                  if (-[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"))
                  {
                    v26 = self->_user;
                    sharedGroupID = self->_sharedGroupID;
                    v28 = -[WBSSavedAccount isRecentlyDeleted](self, "isRecentlyDeleted");
                    v29 = sharedGroupID;
                    v17 = v43;
                    objc_msgSend(v15, "safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v26, v25, v29, v28);
                  }
                }
                if (-[WBSSavedAccount isSavedInPersonalKeychain](self, "isSavedInPersonalKeychain"))
                  objc_msgSend(v15, "safari_setCredential:forHTMLFormProtectionSpace:forGroupID:", v16, v25, &stru_1E64A2498);
                if (-[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"))
                  objc_msgSend(v15, "safari_setCredential:forHTMLFormProtectionSpace:forGroupID:", v16, v25, self->_sharedGroupID);
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            }
            while (v22);
          }

          v18 = v42 + 1;
        }
        while (v42 + 1 != v41);
        v41 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v41);
    }

    v6 = v38;
    if ((v17 & 1) == 0)
    {
      sitesToSidecars = self->_sitesToSidecars;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __37__WBSSavedAccount__setUser_password___block_invoke;
      v44[3] = &unk_1E649EEC0;
      v45 = v15;
      v46 = self;
      v47 = v38;
      v48 = v16;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sitesToSidecars, "enumerateKeysAndObjectsUsingBlock:", v44);

    }
    v8 = v37;
    v31 = (NSString *)-[NSString copy](v37, "copy");
    password = self->_password;
    self->_password = v31;

    v33 = (NSString *)objc_msgSend(v38, "copy");
    v34 = self->_user;
    self->_user = v33;

    v35 = self->_user;
    +[WBSDontSaveMarker dontSaveMarker](WBSDontSaveMarker, "dontSaveMarker");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    self->_userIsNeverSaveMarker = -[NSString isEqualToString:](v35, "isEqualToString:", v36);

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccount _setUser:password:].cold.1();
  }
LABEL_44:

}

void __37__WBSSavedAccount__setUser_password___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__WBSSavedAccount__setUser_password___block_invoke_2;
  v8[3] = &unk_1E649EE98;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = *(id *)(a1 + 56);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __37__WBSSavedAccount__setUser_password___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  objc_msgSend(v25, "protectionSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "credentialsForProtectionSpace:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 1)
  {
    v19 = *(void **)(a1 + 32);
    objc_msgSend(v8, "user");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", 1, v20, v6, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168), objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted"));

    objc_msgSend(v25, "setUser:", *(_QWORD *)(a1 + 48));
    v21 = *(_QWORD *)(a1 + 56);
    v23 = *(void **)(a1 + 32);
    v22 = *(_QWORD **)(a1 + 40);
    v24 = v22[21];
    v13 = objc_msgSend(v22, "isRecentlyDeleted");
    v14 = v23;
    v15 = v25;
    v16 = v21;
    v17 = v6;
    v18 = v24;
  }
  else
  {
    if (v5)
    {
      objc_msgSend(v25, "setUser:", *(_QWORD *)(a1 + 48));
      goto LABEL_7;
    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v8, "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", 0, v10, v6, 0, objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted"));

    objc_msgSend(v25, "setUser:", *(_QWORD *)(a1 + 48));
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(void **)(a1 + 32);
    v13 = objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted");
    v14 = v12;
    v15 = v25;
    v16 = v11;
    v17 = v6;
    v18 = 0;
  }
  objc_msgSend(v14, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v15, v16, v17, v18, v13);
LABEL_7:

}

- (void)_adoptSitesFromSavedAccount:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  NSMutableArray *sites;
  _QWORD v12[11];

  if (self != a3)
  {
    v12[9] = v3;
    v12[10] = v4;
    v7 = (void *)*((_QWORD *)a3 + 3);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__WBSSavedAccount__adoptSitesFromSavedAccount___block_invoke;
    v12[3] = &unk_1E649EE70;
    v12[4] = self;
    v8 = a3;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);
    v9 = (void *)*((_QWORD *)a3 + 3);
    *((_QWORD *)a3 + 3) = 0;

    v10 = (void *)v8[2];
    v8[2] = 0;

    sites = self->_sites;
    self->_sites = 0;

  }
}

void __47__WBSSavedAccount__adoptSitesFromSavedAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v7, v5);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v13, (_QWORD)v14) & 1) == 0)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (NSString)userVisibleDomain
{
  void *v3;
  __CFString *v4;
  uint64_t v5;

  if (!-[WBSSavedAccount hasValidWebsite](self, "hasValidWebsite"))
  {
    v4 = &stru_1E64A2498;
    return (NSString *)v4;
  }
  if (self->_shouldShowSpecificSubdomainForUserVisibleDomain)
    goto LABEL_6;
  if (setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_onceToken != -1)
    dispatch_once(&setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_onceToken, &__block_literal_global_438);
  if (objc_msgSend((id)setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_set, "containsObject:", self->_highLevelDomain))
  {
LABEL_6:
    -[WBSSavedAccount userVisibleSites](self, "userVisibleSites");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return (NSString *)v4;
    }

  }
  if ((-[WBSSavedAccount credentialTypes](self, "credentialTypes") & 1) != 0
    && -[WBSSavedAccount _allSitesHaveSameNonDefaultPort:](self, "_allSitesHaveSameNonDefaultPort:", 0))
  {
    -[WBSSavedAccount _highLevelDomainWithPortIncluded](self, "_highLevelDomainWithPortIncluded");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSString _lp_userVisibleHost](self->_highLevelDomain, "_lp_userVisibleHost");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (__CFString *)v5;
  return (NSString *)v4;
}

- (NSArray)userVisibleSites
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[WBSSavedAccount sites](self, "sites");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__WBSSavedAccount_userVisibleSites__block_invoke;
  v7[3] = &unk_1E649EEE8;
  v7[4] = self;
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

id __35__WBSSavedAccount_userVisibleSites__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_userVisibleSiteForProtectionSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)monogramCharacter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WBSSavedAccount customTitle](self, "customTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safari_monogramString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSString _lp_userVisibleHost](self->_highLevelDomain, "_lp_userVisibleHost");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_monogramString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSArray)additionalSites
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[WBSSavedAccount _firstSidecarForAnySiteOfType:](self, "_firstSidecarForAnySiteOfType:", -[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "additionalSites");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_77);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

uint64_t __34__WBSSavedAccount_additionalSites__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "site");
}

- (void)setAdditionalSites:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  WBSSavedAccountAdditionalSite *v14;
  id v15;
  void *v16;
  id obj;
  _QWORD aBlock[5];
  id v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSSavedAccount _firstSidecarForAnySiteOfType:](self, "_firstSidecarForAnySiteOfType:", -[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v5, "additionalSites");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __38__WBSSavedAccount_setAdditionalSites___block_invoke;
        v20[3] = &unk_1E649EF50;
        v20[4] = v11;
        objc_msgSend(v12, "safari_firstObjectPassingTest:", v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v6, "addObject:", v13);
        }
        else
        {
          v14 = -[WBSSavedAccountAdditionalSite initWithSite:]([WBSSavedAccountAdditionalSite alloc], "initWithSite:", v11);
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WBSSavedAccount_setAdditionalSites___block_invoke_2;
  aBlock[3] = &unk_1E649EC40;
  aBlock[4] = self;
  v19 = v6;
  v15 = v6;
  v16 = _Block_copy(aBlock);
  -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v16);
  -[WBSSavedAccount _updatePasskeySidecarsIfNecessaryWithBlock:](self, "_updatePasskeySidecarsIfNecessaryWithBlock:", v16);

}

uint64_t __38__WBSSavedAccount_setAdditionalSites___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "site");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __38__WBSSavedAccount_setAdditionalSites___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  int v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (a2 == 1)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "isSavedInSharedGroup");
    v6 = v9;
    if (!v8)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(v6, "setAdditionalSites:", *(_QWORD *)(a1 + 40));
    v6 = v9;
    goto LABEL_7;
  }
  v6 = v5;
  if (!a2)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "isSavedInSharedGroup");
    v6 = v9;
    if ((v7 & 1) == 0)
      goto LABEL_6;
  }
LABEL_7:

}

- (NSArray)protectionSpacesForAdditionalSites
{
  void *v2;
  void *v3;

  -[WBSSavedAccount additionalSites](self, "additionalSites");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_81);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __53__WBSSavedAccount_protectionSpacesForAdditionalSites__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  id v4;
  id v5;

  v4 = 0;
  v5 = 0;
  +[WBSSavedAccountStore getProtectionSpaceAndHighLevelDomainForUserTypedSite:protectionSpace:highLevelDomain:](WBSSavedAccountStore, "getProtectionSpaceAndHighLevelDomainForUserTypedSite:protectionSpace:highLevelDomain:", a2, &v5, &v4);
  v2 = v5;

  return v2;
}

- (WBSPasswordWarningHideMarker)hideWarningMarker
{
  void *v2;
  void *v3;

  -[WBSSavedAccount _firstSidecarForAnySiteOfType:](self, "_firstSidecarForAnySiteOfType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "hideWarningMarker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (WBSPasswordWarningHideMarker *)v3;
}

- (BOOL)isOneTimeSharable
{
  void *v3;
  char v4;
  _BOOL4 v5;

  if (-[WBSSavedAccount userIsNeverSaveMarker](self, "userIsNeverSaveMarker")
    || (+[WBSPrimaryAppleAccountObserver sharedObserver](WBSPrimaryAppleAccountObserver, "sharedObserver"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isCurrentAppleIDManaged"),
        v3,
        (v4 & 1) != 0))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = -[WBSSavedAccount isCurrentUserOriginalContributor](self, "isCurrentUserOriginalContributor");
    if (v5)
      LOBYTE(v5) = (-[WBSSavedAccount credentialTypes](self, "credentialTypes") & 3) != 0;
  }
  return v5;
}

- (id)_exportPasskeyCredential
{
  void *v3;

  v3 = -[NSString length](self->_passkeyCredentialID, "length");
  if (v3)
  {
    +[WBSSavedAccountStore exportPasskeyCredentialWithID:](WBSSavedAccountStore, "exportPasskeyCredentialWithID:", self->_passkeyCredentialID);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSDate)lastOneTimeShareDateForPasskey
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_passkeyCredentialSidecarsDictionary, "objectForKeyedSubscript:", &unk_1E64CE4D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "lastOneTimeShareDateForPasskey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (BOOL)isSavedInPersonalKeychain
{
  return -[NSString length](self->_sharedGroupID, "length") == 0;
}

- (BOOL)isSavedInSharedGroup
{
  return !-[WBSSavedAccount isSavedInPersonalKeychain](self, "isSavedInPersonalKeychain");
}

- (BOOL)_allSitesHaveSameNonDefaultPort:(int64_t *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  char v7;
  _QWORD v9[5];

  -[WBSSavedAccount protectionSpaces](self, "protectionSpaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "port");
    v7 = 0;
    if (v6 && v6 != 80 && v6 != 443)
    {
      if (a3)
        *a3 = v6;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __51__WBSSavedAccount__allSitesHaveSameNonDefaultPort___block_invoke;
      v9[3] = &__block_descriptor_40_e30_B16__0__NSURLProtectionSpace_8l;
      v9[4] = v6;
      v7 = objc_msgSend(v4, "safari_allObjectsPassTest:", v9);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL __51__WBSSavedAccount__allSitesHaveSameNonDefaultPort___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "port") == *(_QWORD *)(a1 + 32);
}

- (id)_highLevelDomainWithPortIncluded
{
  NSMutableDictionary *siteToProtectionSpaces;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSString *highLevelDomain;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  siteToProtectionSpaces = self->_siteToProtectionSpaces;
  -[NSMutableArray firstObject](self->_sites, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](siteToProtectionSpaces, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0C92C70]);
  highLevelDomain = self->_highLevelDomain;
  v9 = objc_msgSend(v6, "port");
  objc_msgSend(v6, "protocol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "realm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authenticationMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithHost:port:protocol:realm:authenticationMethod:", highLevelDomain, v9, v10, v11, v12);

  objc_msgSend(v13, "safari_userVisibleSiteForProtectionSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (WBSFormerlySharedSavedAccountMarker)formerlySharedPasswordMarker
{
  return (WBSFormerlySharedSavedAccountMarker *)-[WBSSavedAccount _formerlySharedMarkerForCredentialType:](self, "_formerlySharedMarkerForCredentialType:", 1);
}

- (WBSFormerlySharedSavedAccountMarker)formerlySharedPasskeyMarker
{
  return (WBSFormerlySharedSavedAccountMarker *)-[WBSSavedAccount _formerlySharedMarkerForCredentialType:](self, "_formerlySharedMarkerForCredentialType:", 2);
}

- (id)_formerlySharedMarkerForCredentialType:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;

  if (-[WBSSavedAccount isSavedInSharedGroup](self, "isSavedInSharedGroup"))
  {
LABEL_2:
    v5 = 0;
  }
  else
  {
    v5 = 0;
    switch(a3)
    {
      case 1:
        -[WBSSavedAccount _firstSidecarForAnySiteOfType:](self, "_firstSidecarForAnySiteOfType:", 0);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 2:
        -[WBSSavedAccount _passkeySidecarOfType:](self, "_passkeySidecarOfType:", 0);
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
        v5 = (void *)v6;
        if (!v6)
          goto LABEL_8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_8;
        v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[WBSSavedAccount _formerlySharedMarkerForCredentialType:].cold.1(v12);

        goto LABEL_2;
      case 3:
        v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[WBSSavedAccount _formerlySharedMarkerForCredentialType:].cold.2();
        goto LABEL_2;
      case 4:
        return v5;
      default:
LABEL_8:
        objc_msgSend(v5, "formerlySharedSavedAccountMarker");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (!v7 || a3 == 4)
          goto LABEL_22;
        if (a3 == 2)
        {
          objc_msgSend(v7, "passwordManagerCredentialIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSSavedAccount passkeyCredentialID](self, "passkeyCredentialID");
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (a3 != 1)
            goto LABEL_21;
          objc_msgSend(v7, "passwordManagerCredentialIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSSavedAccount password](self, "password");
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v13 = (void *)v10;
        v14 = objc_msgSend(v9, "isEqual:", v10);

        if (v14)
        {
          v15 = v8;
          goto LABEL_23;
        }
LABEL_21:
        -[WBSSavedAccount _clearFormerlySharedSavedAccountMarkerForCredentialTypes:](self, "_clearFormerlySharedSavedAccountMarkerForCredentialTypes:", a3);
LABEL_22:
        v15 = 0;
LABEL_23:

        v5 = v15;
        break;
    }
  }
  return v5;
}

+ (void)enumerateRangesMatchingPatternWithTokenizer:(__CFStringTokenizer *)a3 string:(id)a4 pattern:(id)a5 matchingType:(int64_t)a6 withBlock:(id)a7
{
  __CFString *v11;
  id v12;
  void (**v13)(id, CFIndex, uint64_t, CFRange *);
  void *v14;
  void *v15;
  int v16;
  CFIndex v17;
  uint64_t v18;
  uint64_t v19;
  CFIndex v20;
  char v21;
  CFIndex CurrentSubTokens;
  CFIndex v23;
  CFIndex v24;
  CFIndex location;
  id v27;
  char v28;
  CFRange ranges[32];
  uint64_t v30;
  CFRange v31;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a4;
  v12 = a5;
  v13 = (void (**)(id, CFIndex, uint64_t, CFRange *))a7;
  objc_msgSend(v12, "safari_stringByTrimmingWhitespace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "length"))
    goto LABEL_24;
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", 0));

  v17 = -[__CFString length](v11, "length");
  v18 = objc_msgSend(v14, "length");
  v31.location = 0;
  v31.length = v17;
  CFStringTokenizerSetString(a3, v11, v31);
  v19 = -[__CFString rangeOfString:options:](v11, "rangeOfString:options:", v14, 1);
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_24;
  v20 = v19;
  if ((unint64_t)(a6 - 4) >= 0xFFFFFFFFFFFFFFFDLL)
    v16 = 0;
  v27 = v12;
  while (1)
  {
    if (!v16
      || (v21 = CFStringTokenizerGoToTokenAtIndex(a3, v20), CFStringTokenizerGetCurrentTokenRange(a3).location == v20))
    {
      LOBYTE(ranges[0].location) = 0;
      v13[2](v13, v20, v18, ranges);
      if (LOBYTE(ranges[0].location))
        goto LABEL_24;
      goto LABEL_9;
    }
    if ((v21 & 2) != 0)
      break;
LABEL_9:
    v20 = -[__CFString rangeOfString:options:range:](v11, "rangeOfString:options:range:", v14, 1, v20 + v18, v17 - (v20 + v18), v27);
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_24;
  }
  CurrentSubTokens = CFStringTokenizerGetCurrentSubTokens(a3, ranges, 32, 0);
  if (CurrentSubTokens < 1)
  {
LABEL_22:
    v12 = v27;
    goto LABEL_9;
  }
  v23 = CurrentSubTokens;
  v24 = 0;
  while (1)
  {
    while (1)
    {
      location = ranges[v24].location;
      if (location == v20)
        break;
      ++v24;
      if (location > v20 || v24 >= v23)
        goto LABEL_22;
    }
    v28 = 0;
    v13[2](v13, v20, v18, (CFRange *)&v28);
    if (v28)
      break;
    if (++v24 >= v23)
      goto LABEL_22;
  }
  v12 = v27;
LABEL_24:

}

+ (BOOL)stringMatchesPatternWithTokenizer:(__CFStringTokenizer *)a3 string:(id)a4 pattern:(id)a5 matchingType:(int64_t)a6
{
  id v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v10 = a4;
  v11 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__WBSSavedAccount_stringMatchesPatternWithTokenizer_string_pattern_matchingType___block_invoke;
  v13[3] = &unk_1E649EFD8;
  v13[4] = &v14;
  objc_msgSend(a1, "enumerateRangesMatchingPatternWithTokenizer:string:pattern:matchingType:withBlock:", a3, v10, v11, a6, v13);
  LOBYTE(a6) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return a6;
}

uint64_t __81__WBSSavedAccount_stringMatchesPatternWithTokenizer_string_pattern_matchingType___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)matchesUserTypedSearchPattern:(id)a3 associatedDomains:(id)a4
{
  return -[WBSSavedAccount _matchesSearchPattern:matchAgainstUser:associatedDomains:](self, "_matchesSearchPattern:matchAgainstUser:associatedDomains:", a3, 1, a4);
}

- (BOOL)matchesUserTypedSearchPattern:(id)a3
{
  return -[WBSSavedAccount _matchesSearchPattern:matchAgainstUser:associatedDomains:](self, "_matchesSearchPattern:matchAgainstUser:associatedDomains:", a3, 0, 0);
}

- (BOOL)matchesServiceNameHintString:(id)a3
{
  id v4;
  const __CFAllocator *v5;
  const __CFLocale *v6;
  CFStringTokenizerRef v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  CFRange v14;

  v4 = a3;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v14.location = 0;
  v14.length = 0;
  v7 = CFStringTokenizerCreate(v5, 0, v14, 0, v6);
  -[WBSSavedAccount highLevelDomain](self, "highLevelDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length")
    && (v9 = (void *)objc_opt_class(),
        -[WBSSavedAccount highLevelDomain](self, "highLevelDomain"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend(v9, "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v7, v10, v4, 1), v10, (_DWORD)v9))
  {
    CFRelease(v7);
    v11 = 1;
  }
  else
  {
    -[WBSSavedAccount customTitle](self, "customTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "length")
       && (objc_msgSend((id)objc_opt_class(), "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v7, v12, v4, 3) & 1) != 0;
    CFRelease(v7);

  }
  return v11;
}

- (BOOL)matchesDomain:(id)a3 associatedDomains:(id)a4
{
  return -[WBSSavedAccount _matchesSearchPattern:matchAgainstUser:associatedDomains:](self, "_matchesSearchPattern:matchAgainstUser:associatedDomains:", a3, 0, a4);
}

- (BOOL)_matchesSearchPattern:(id)a3 matchAgainstUser:(BOOL)a4 associatedDomains:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  const __CFAllocator *v10;
  const __CFLocale *v11;
  CFStringTokenizerRef v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL8 v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _QWORD v67[3];
  CFRange v68;

  v6 = a4;
  v67[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v68.location = 0;
  v68.length = 0;
  v12 = CFStringTokenizerCreate(v10, 0, v68, 0, v11);
  switch(-[WBSSavedAccount credentialTypes](self, "credentialTypes"))
  {
    case 1:
      -[WBSSavedAccount sites](self, "sites");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2:
      v67[0] = self->_passkeyRelyingPartyID;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v14 = (void *)v13;
      goto LABEL_7;
    case 3:
      -[WBSSavedAccount sites](self, "sites");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayByAddingObject:", self->_passkeyRelyingPartyID);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 4:
      if (objc_msgSend((id)objc_opt_class(), "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v12, self->_serviceName, v8, 4))
      {
        CFRelease(v12);
        v34 = 1;
      }
      else
      {
        -[AKSignInWithAppleAccount privateEmail](self->_signInWithAppleAccount, "privateEmail");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41
          && objc_msgSend((id)objc_opt_class(), "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v12, v41, v8, 0))
        {
          CFRelease(v12);
          v34 = 1;
        }
        else
        {
          -[AKSignInWithAppleAccount shareInfo](self->_signInWithAppleAccount, "shareInfo");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "participantName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = v43
             && (objc_msgSend((id)objc_opt_class(), "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v12, v43, v8, 0) & 1) != 0;
          CFRelease(v12);

        }
      }
      goto LABEL_57;
    default:
      v14 = 0;
LABEL_7:
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v17;
      }
      -[WBSSavedAccount additionalSites](self, "additionalSites");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19)
      {
        -[WBSSavedAccount additionalSites](self, "additionalSites");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v21;
      }
      objc_msgSend((id)objc_opt_class(), "searchPatternForWebsiteComparisonFromSearchPattern:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v23 = v14;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      if (!v24)
        goto LABEL_20;
      v25 = v24;
      v26 = *(_QWORD *)v63;
      v61 = v8;
      LODWORD(v59) = v6;
      break;
  }
  while (2)
  {
    v27 = v9;
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v63 != v26)
        objc_enumerationMutation(v23);
      v29 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
      if ((objc_msgSend((id)objc_opt_class(), "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v12, v29, v22, 1) & 1) == 0)
      {
        v30 = objc_opt_class();
        objc_msgSend(v29, "_lp_userVisibleHost");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v30) = objc_msgSend((id)v30, "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v12, v31, v22, 1);

        if ((v30 & 1) == 0)
          continue;
      }
      CFRelease(v12);

      v34 = 1;
      v9 = v27;
      v8 = v61;
      goto LABEL_56;
    }
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    v9 = v27;
    v8 = v61;
    v6 = v59;
    if (v25)
      continue;
    break;
  }
LABEL_20:

  if (!v6
    || (v32 = (void *)objc_opt_class(),
        -[WBSSavedAccount user](self, "user"),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v32) = objc_msgSend(v32, "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v12, v33, v8, 0), v33, !(_DWORD)v32))
  {
    -[WBSSavedAccount originalContributorParticipantID](self, "originalContributorParticipantID", v59);
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      v37 = -[WBSSavedAccount isCurrentUserOriginalContributor](self, "isCurrentUserOriginalContributor");

      if (!v37)
      {
        -[WBSSavedAccount originalContributorParticipantID](self, "originalContributorParticipantID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSavedAccount sharedGroupID](self, "sharedGroupID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBSSavedAccountStore _displayNameForOriginalContributorParticipantID:inGroupID:](WBSSavedAccountStore, "_displayNameForOriginalContributorParticipantID:inGroupID:", v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend((id)objc_opt_class(), "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v12, v40, v8, 0))
        {
          CFRelease(v12);

          goto LABEL_28;
        }

      }
    }
    objc_msgSend(v8, "safari_stringByTrimmingWhitespace");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccount notesEntry](self, "notesEntry");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "length");

    if (v46)
    {
      -[WBSSavedAccount notesEntry](self, "notesEntry");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v60 = v44;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsSeparatedByCharactersInSet:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(v49, "mutableCopy");

      v44 = v60;
      objc_msgSend(v50, "removeObject:", &stru_1E64A2498);
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR(" "));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)objc_opt_class(), "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v12, v51, v60, 2))
      {
        CFRelease(v12);

LABEL_52:
        v34 = 1;
LABEL_55:

        goto LABEL_56;
      }

    }
    -[WBSSavedAccount customTitle](self, "customTitle");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "length"))
    {
      v53 = (void *)objc_opt_class();
      -[WBSSavedAccount customTitle](self, "customTitle");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v53) = objc_msgSend(v53, "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v12, v54, v44, 3);

      if ((_DWORD)v53)
        goto LABEL_51;
    }
    else
    {

    }
    -[WBSSavedAccount serviceName](self, "serviceName");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v55, "length"))
    {
      v56 = (void *)objc_opt_class();
      -[WBSSavedAccount serviceName](self, "serviceName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v56) = objc_msgSend(v56, "stringMatchesPatternWithTokenizer:string:pattern:matchingType:", v12, v57, v44, 4);

      if ((_DWORD)v56)
      {
LABEL_51:
        CFRelease(v12);
        goto LABEL_52;
      }
    }
    else
    {

    }
    CFRelease(v12);
    v34 = 0;
    goto LABEL_55;
  }
  CFRelease(v12);
LABEL_28:
  v34 = 1;
LABEL_56:

LABEL_57:
  return v34;
}

+ (id)searchPatternForWebsiteComparisonFromSearchPattern:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringByRemovingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("plus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WBSSavedAccount *v4;
  void **v5;
  NSString *user;
  void *v7;
  NSString *password;
  void *v9;
  NSString *passkeyCredentialID;
  void *v11;
  NSString *passkeyRelyingPartyID;
  void *v13;
  NSString *sharedGroupID;
  void *v15;
  NSString *serviceName;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *highLevelDomain;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v4 = (WBSSavedAccount *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      user = self->_user;
      objc_msgSend(v5, "user");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual(user, v7))
      {
        password = self->_password;
        objc_msgSend(v5, "password");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual(password, v9))
        {
          passkeyCredentialID = self->_passkeyCredentialID;
          objc_msgSend(v5, "passkeyCredentialID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (WBSIsEqual(passkeyCredentialID, v11)
            && WBSIsEqual(self->_passkeyCredentialSidecarsDictionary, v5[8]))
          {
            passkeyRelyingPartyID = self->_passkeyRelyingPartyID;
            objc_msgSend(v5, "passkeyRelyingPartyID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (WBSIsEqual(passkeyRelyingPartyID, v13))
            {
              sharedGroupID = self->_sharedGroupID;
              objc_msgSend(v5, "sharedGroupID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (WBSIsEqual(sharedGroupID, v15))
              {
                serviceName = self->_serviceName;
                objc_msgSend(v5, "serviceName");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (WBSIsEqual(serviceName, v17))
                {
                  -[AKSignInWithAppleAccount clientID](self->_signInWithAppleAccount, "clientID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "signInWithAppleAccount");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "clientID");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = v18;
                  if (WBSIsEqual(v18, v42))
                  {
                    -[AKSignInWithAppleAccount userID](self->_signInWithAppleAccount, "userID");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "signInWithAppleAccount");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "userID");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = v19;
                    if (WBSIsEqual(v19, v38))
                    {
                      -[AKSignInWithAppleAccount shareInfo](self->_signInWithAppleAccount, "shareInfo");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "groupID");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "signInWithAppleAccount");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "shareInfo");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v34, "groupID");
                      v36 = v20;
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      if (WBSIsEqual(v20, v33))
                      {
                        highLevelDomain = self->_highLevelDomain;
                        objc_msgSend(v5, "highLevelDomain");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        if (WBSIsEqual(highLevelDomain, v32))
                        {
                          -[WBSSavedAccount protectionSpaces](self, "protectionSpaces");
                          v21 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v5, "protectionSpaces");
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          v31 = v21;
                          if (WBSIsEqual(v21, v29)
                            && WBSIsEqual(self->_sitesToSidecars, v5[7]))
                          {
                            -[WBSSavedAccount sites](self, "sites");
                            v22 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v5, "sites");
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            if (WBSIsEqual(v22, v28))
                            {
                              -[WBSSavedAccount lastModifiedDate](self, "lastModifiedDate");
                              v27 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v5, "lastModifiedDate");
                              v26 = (void *)objc_claimAutoreleasedReturnValue();
                              v23 = WBSIsEqual(v27, v26);

                            }
                            else
                            {
                              v23 = 0;
                            }

                          }
                          else
                          {
                            v23 = 0;
                          }
                          v24 = v41;

                        }
                        else
                        {
                          v23 = 0;
                          v24 = v41;
                        }

                      }
                      else
                      {
                        v23 = 0;
                        v24 = v41;
                      }

                    }
                    else
                    {
                      v23 = 0;
                      v24 = v41;
                    }

                  }
                  else
                  {
                    v23 = 0;
                    v24 = v41;
                  }

                }
                else
                {
                  v23 = 0;
                }

              }
              else
              {
                v23 = 0;
              }

            }
            else
            {
              v23 = 0;
            }

          }
          else
          {
            v23 = 0;
          }

        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (BOOL)isEqualForMovingSharedSavedAccountsBackToPersonalKeychainOnGroupExit:(id)a3
{
  void **v4;
  NSString *user;
  void *v6;
  NSString *password;
  void *v8;
  NSString *passkeyCredentialID;
  void *v10;
  NSString *passkeyRelyingPartyID;
  void *v12;
  NSString *highLevelDomain;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = (void **)a3;
  user = self->_user;
  objc_msgSend(v4, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](user, "isEqualToString:", v6))
  {
    password = self->_password;
    objc_msgSend(v4, "password");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (WBSIsEqual(password, v8))
    {
      passkeyCredentialID = self->_passkeyCredentialID;
      objc_msgSend(v4, "passkeyCredentialID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual(passkeyCredentialID, v10)
        && WBSIsEqual(self->_passkeyCredentialSidecarsDictionary, v4[8]))
      {
        passkeyRelyingPartyID = self->_passkeyRelyingPartyID;
        objc_msgSend(v4, "passkeyRelyingPartyID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual(passkeyRelyingPartyID, v12))
        {
          highLevelDomain = self->_highLevelDomain;
          objc_msgSend(v4, "highLevelDomain");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqualToString:](highLevelDomain, "isEqualToString:", v14))
          {
            -[WBSSavedAccount protectionSpaces](self, "protectionSpaces");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "protectionSpaces");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (WBSIsEqual(v15, v16))
            {
              -[WBSSavedAccount notesEntry](self, "notesEntry");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "notesEntry");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v17;
              if (WBSIsEqual(v17, v30))
              {
                -[WBSSavedAccount customTitle](self, "customTitle");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "customTitle");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v18;
                if (WBSIsEqual(v18, v28))
                {
                  -[WBSSavedAccount totpGenerators](self, "totpGenerators");
                  v19 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "totpGenerators");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = (void *)v19;
                  v21 = (void *)v19;
                  v22 = v20;
                  if (WBSIsEqual(v21, v20))
                  {
                    -[WBSSavedAccount sites](self, "sites");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "sites");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = WBSIsEqual(v26, v25);

                  }
                  else
                  {
                    v23 = 0;
                  }

                }
                else
                {
                  v23 = 0;
                }

              }
              else
              {
                v23 = 0;
              }

            }
            else
            {
              v23 = 0;
            }

          }
          else
          {
            v23 = 0;
          }

        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)shouldOverrideRecentlyDeletedSavedAccountWhenDeleted:(id)a3
{
  WBSSavedAccount *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;

  v4 = (WBSSavedAccount *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_5;
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allValues](self->_siteToProtectionSpaces, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allValues](v4->_siteToProtectionSpaces, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "intersectsSet:", v10);

    if (!-[NSString isEqualToString:](self->_user, "isEqualToString:", v4->_user))
      goto LABEL_5;
    if (self->_isRecentlyDeleted != v4->_isRecentlyDeleted)
      v12 = WBSIsEqual(self->_sharedGroupID, v4->_sharedGroupID) & v11;
    else
LABEL_5:
      LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v3 = -[NSString hash](self->_user, "hash");
  v4 = -[NSString hash](self->_password, "hash") ^ v3;
  v5 = -[NSString hash](self->_passkeyCredentialID, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableDictionary hash](self->_passkeyCredentialSidecarsDictionary, "hash");
  v7 = -[NSString hash](self->_passkeyRelyingPartyID, "hash");
  v8 = v7 ^ -[NSString hash](self->_highLevelDomain, "hash");
  -[WBSSavedAccount protectionSpaces](self, "protectionSpaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[WBSSavedAccount sites](self, "sites");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v12 ^ -[NSMutableDictionary hash](self->_sitesToSidecars, "hash");
  -[WBSSavedAccount lastModifiedDate](self, "lastModifiedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");

  return v10 ^ v15 ^ -[NSString hash](self->_sharedGroupID, "hash");
}

- (BOOL)hasProtectionSpace:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[WBSSavedAccount protectionSpaces](self, "protectionSpaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__WBSSavedAccount_hasProtectionSpace___block_invoke;
  v9[3] = &unk_1E649F000;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "safari_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __38__WBSSavedAccount_hasProtectionSpace___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToProtectionSpaceForPasswordManager:", *(_QWORD *)(a1 + 32));
}

- (BOOL)hasProtectionSpaceWithHighLevelDomainMatchingProtectionSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "safari_protectionSpaceByReplacingHostWithHighlevelDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount protectionSpaces](self, "protectionSpaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__WBSSavedAccount_hasProtectionSpaceWithHighLevelDomainMatchingProtectionSpace___block_invoke;
  v11[3] = &unk_1E649F028;
  v12 = v4;
  v13 = v5;
  v7 = v5;
  v8 = v4;
  v9 = objc_msgSend(v6, "safari_containsObjectPassingTest:", v11);

  return v9;
}

uint64_t __80__WBSSavedAccount_hasProtectionSpaceWithHighLevelDomainMatchingProtectionSpace___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "safari_protectionSpaceByReplacingHostWithHighlevelDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToProtectionSpaceForPasswordManager:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToProtectionSpaceForPasswordManager:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (NSURL)wellKnownChangePasswordURL
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  if (-[WBSSavedAccount _allSitesHaveSameNonDefaultPort:](self, "_allSitesHaveSameNonDefaultPort:", &v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%ld"), self->_highLevelDomain, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_bestURLForUserTypedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_wellKnownChangePasswordURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSString safari_bestURLForUserTypedString](self->_highLevelDomain, "safari_bestURLForUserTypedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_wellKnownChangePasswordURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v5;
}

- (NSString)sharedGroupName
{
  void *v3;
  void *v4;
  void *v5;

  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedGroupWithID:", self->_sharedGroupID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (AKSignInWithAppleAccount)signInWithAppleAccount
{
  return self->_signInWithAppleAccount;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (BOOL)_computeHasValidWebsite
{
  void *v3;
  BOOL result;

  result = -[WBSSavedAccount credentialTypes](self, "credentialTypes") != 4
        && (v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_highLevelDomain),
            v3,
            !v3)
        && -[NSString length](self->_highLevelDomain, "length") != 0;
  return result;
}

- (BOOL)hasValidWebsite
{
  int64_t hasValidWebsite;
  _BOOL4 v4;

  hasValidWebsite = self->_hasValidWebsite;
  if (!hasValidWebsite)
  {
    v4 = -[WBSSavedAccount _computeHasValidWebsite](self, "_computeHasValidWebsite");
    hasValidWebsite = 1;
    if (v4)
      hasValidWebsite = 2;
    self->_hasValidWebsite = hasValidWebsite;
  }
  return hasValidWebsite == 2;
}

- (NSString)highLevelDomain
{
  return self->_highLevelDomain;
}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)passkeyRelyingPartyID
{
  return self->_passkeyRelyingPartyID;
}

- (void)setPasskeyRelyingPartyID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)passkeyUserHandle
{
  return self->_passkeyUserHandle;
}

- (void)setPasskeyUserHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)passkeyCredentialID
{
  return self->_passkeyCredentialID;
}

- (void)setPasskeyCredentialID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setCustomTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)userIsNeverSaveMarker
{
  return self->_userIsNeverSaveMarker;
}

- (NSDate)lastUsedDateForPasskey
{
  return self->_lastUsedDateForPasskey;
}

- (void)setLastUsedDateForPasskey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)sharedGroupID
{
  return self->_sharedGroupID;
}

- (void)setSharedGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setSharedGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)hasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts
{
  return self->_hasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts;
}

- (void)setHasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts:(BOOL)a3
{
  self->_hasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts = a3;
}

- (BOOL)isRecentlyDeleted
{
  return self->_isRecentlyDeleted;
}

- (void)setIsRecentlyDeleted:(BOOL)a3
{
  self->_isRecentlyDeleted = a3;
}

- (void)setSignInWithAppleAccount:(id)a3
{
  objc_storeStrong((id *)&self->_signInWithAppleAccount, a3);
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)persistentIdentifiersForWarningManager
{
  return self->_persistentIdentifiersForWarningManager;
}

- (void)setPersistentIdentifiersForWarningManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistentIdentifiersForWarningManager, a3);
}

- (NSDate)creationDateForPasskey
{
  return self->_creationDateForPasskey;
}

- (void)setCreationDateForPasskey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDate)lastModifiedDateForPasskey
{
  return self->_lastModifiedDateForPasskey;
}

- (void)setLastModifiedDateForPasskey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDictionary)passkeyCredentialSidecarsDictionary
{
  return &self->_passkeyCredentialSidecarsDictionary->super;
}

- (void)setPasskeyCredentialSidecarsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)shouldShowSpecificSubdomainForUserVisibleDomain
{
  return self->_shouldShowSpecificSubdomainForUserVisibleDomain;
}

- (void)setShouldShowSpecificSubdomainForUserVisibleDomain:(BOOL)a3
{
  self->_shouldShowSpecificSubdomainForUserVisibleDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDateForPasskey, 0);
  objc_storeStrong((id *)&self->_creationDateForPasskey, 0);
  objc_storeStrong((id *)&self->_persistentIdentifiersForWarningManager, 0);
  objc_storeStrong((id *)&self->_sharedGroupName, 0);
  objc_storeStrong((id *)&self->_sharedGroupID, 0);
  objc_storeStrong((id *)&self->_lastUsedDateForPasskey, 0);
  objc_storeStrong((id *)&self->_passkeyCredentialID, 0);
  objc_storeStrong((id *)&self->_passkeyUserHandle, 0);
  objc_storeStrong((id *)&self->_passkeyRelyingPartyID, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_highLevelDomain, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_signInWithAppleAccount, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_passkeyCredentialSidecarsDictionary, 0);
  objc_storeStrong((id *)&self->_sitesToSidecars, 0);
  objc_storeStrong((id *)&self->_earliestPasswordCredentialCreationDate, 0);
  objc_storeStrong((id *)&self->_earliestPasswordCredentialModificationDate, 0);
  objc_storeStrong((id *)&self->_sitesForWhichSelfIsDefault, 0);
  objc_storeStrong((id *)&self->_siteToProtectionSpaces, 0);
  objc_storeStrong((id *)&self->_sites, 0);
}

- (void)isCurrentUserOriginalContributor
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Saved account does not have an original contributor ID, considering the original contributor as unknown.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)markOriginalContributorParticipantID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Could not set original contributor participant ID for saved account because current user participant ID is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_canMergeWithSavedAccount:requiresDataCopying:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Tried to merge invalid credential types.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_addPasskeySidecar:(void *)a1 .cold.1(void *a1)
{
  id v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  v2 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v4, v5, "Attempted to add a non-Sidecar object to the passkey Sidecar map. type:%{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)_addSidecar:(uint64_t)a1 forSite:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1B2621000, v3, OS_LOG_TYPE_ERROR, "Attempted to add a non-Sidecar object to the Sidecar map for site %@ type:%{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)_setUser:password:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "User not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setUser:password:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Refusing to set saved account password to nil; using current password instead",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_5();
}

- (void)_formerlySharedMarkerForCredentialType:(void *)a1 .cold.1(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v2, v3, "Expected personal sidecar to check formerly shared marker but received sidecar of type %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)_formerlySharedMarkerForCredentialType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Incorrectly passed WBSSavedAccountCredentialTypePasswordAndPasskey into method to retrieve formerly shared marker for a single credential type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
