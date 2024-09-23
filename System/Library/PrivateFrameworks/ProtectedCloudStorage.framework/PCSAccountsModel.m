@implementation PCSAccountsModel

+ (id)defaultAccountsModel
{
  if (defaultAccountsModel_onceToken != -1)
    dispatch_once(&defaultAccountsModel_onceToken, &__block_literal_global_5);
  return (id)defaultAccountsModel_model;
}

void __40__PCSAccountsModel_defaultAccountsModel__block_invoke()
{
  void *v0;
  PCSAccountsModel *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1AF415520]();
  v1 = objc_alloc_init(PCSAccountsModel);
  v2 = (void *)defaultAccountsModel_model;
  defaultAccountsModel_model = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (PCSAccountsModel)init
{
  PCSAccountsModel *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v13.receiver = self;
  v13.super_class = (Class)PCSAccountsModel;
  v2 = -[PCSAccountsModel init](&v13, sel_init);
  if (v2)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v3 = (void *)getACAccountStoreClass_softClass;
    v22 = getACAccountStoreClass_softClass;
    if (!getACAccountStoreClass_softClass)
    {
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = (uint64_t)__getACAccountStoreClass_block_invoke;
      v17 = &unk_1E553DCC0;
      v18 = &v19;
      __getACAccountStoreClass_block_invoke((uint64_t)&v14);
      v3 = (void *)v20[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v19, 8);
    v14 = 0;
    v15 = (uint64_t)&v14;
    v16 = 0x2020000000;
    v5 = (id *)getACDAccountStoreDidChangeNotificationSymbolLoc_ptr;
    v17 = (void *)getACDAccountStoreDidChangeNotificationSymbolLoc_ptr;
    if (!getACDAccountStoreDidChangeNotificationSymbolLoc_ptr)
    {
      v6 = (void *)AccountsLibrary();
      v5 = (id *)dlsym(v6, "ACDAccountStoreDidChangeNotification");
      *(_QWORD *)(v15 + 24) = v5;
      getACDAccountStoreDidChangeNotificationSymbolLoc_ptr = (uint64_t)v5;
    }
    _Block_object_dispose(&v14, 8);
    if (!v5)
      -[PCSAccountsModel init].cold.1();
    v7 = *v5;
    objc_msgSend(v4, "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCSAccountsModel setStore:](v2, "setStore:", v8);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("PCSAccountQueue", v9);
    -[PCSAccountsModel setQueue:](v2, "setQueue:", v10);

    -[PCSAccountsModel setAccountsChanged:](v2, "setAccountsChanged:", 1);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__accountStoreDidChange_, v7, 0);

  }
  return v2;
}

- (void)_accountStoreDidChange:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _QWORD block[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v5 = (id *)getACAccountTypeIdentifierKeySymbolLoc_ptr;
  v19 = getACAccountTypeIdentifierKeySymbolLoc_ptr;
  if (!getACAccountTypeIdentifierKeySymbolLoc_ptr)
  {
    v6 = (void *)AccountsLibrary();
    v5 = (id *)dlsym(v6, "ACAccountTypeIdentifierKey");
    v17[3] = (uint64_t)v5;
    getACAccountTypeIdentifierKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v16, 8);
  if (!v5)
    -[PCSAccountsModel init].cold.1();
  v7 = *v5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v8 = (id *)getACAccountTypeIdentifierAppleAccountSymbolLoc_ptr;
  v19 = getACAccountTypeIdentifierAppleAccountSymbolLoc_ptr;
  if (!getACAccountTypeIdentifierAppleAccountSymbolLoc_ptr)
  {
    v9 = (void *)AccountsLibrary();
    v8 = (id *)dlsym(v9, "ACAccountTypeIdentifierAppleAccount");
    v17[3] = (uint64_t)v8;
    getACAccountTypeIdentifierAppleAccountSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v16, 8);
  if (!v8)
    -[PCSAccountsModel init].cold.1();
  v10 = *v8;
  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v10);

  if (v13)
  {
    -[PCSAccountsModel queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PCSAccountsModel__accountStoreDidChange___block_invoke;
    block[3] = &unk_1E553DF70;
    block[4] = self;
    dispatch_sync(v14, block);

  }
}

uint64_t __43__PCSAccountsModel__accountStoreDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccountsChanged:", 1);
}

- (void)faultIfCurrentPersonaIsDataSeparated
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PCSAccountsModel used with active persona", v0, 2u);
}

- (NSString)username
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  if (PCSSupportsPersonaMultiuser())
  {
    +[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "username");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v16[5];
    v16[5] = v4;

    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "personaIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "aa_personID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "aa_altDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_fault_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "username invoked with current persona: %@, dsid: %@, altDSID: %@", buf, 0x20u);

    }
  }
  else
  {
    -[PCSAccountsModel faultIfCurrentPersonaIsDataSeparated](self, "faultIfCurrentPersonaIsDataSeparated");
    -[PCSAccountsModel queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __28__PCSAccountsModel_username__block_invoke;
    v14[3] = &unk_1E553DF98;
    v14[4] = self;
    v14[5] = &v15;
    dispatch_sync(v8, v14);

  }
  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (NSString *)v9;
}

void __28__PCSAccountsModel_username__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "update");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSString)dsid
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  if (PCSSupportsPersonaMultiuser())
  {
    +[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aa_personID");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v16[5];
    v16[5] = v4;

    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "personaIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "aa_personID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "aa_altDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_fault_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "dsid invoked with current persona: %@, dsid: %@, altDSID: %@", buf, 0x20u);

    }
  }
  else
  {
    -[PCSAccountsModel faultIfCurrentPersonaIsDataSeparated](self, "faultIfCurrentPersonaIsDataSeparated");
    -[PCSAccountsModel queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __24__PCSAccountsModel_dsid__block_invoke;
    v14[3] = &unk_1E553DF98;
    v14[4] = self;
    v14[5] = &v15;
    dispatch_sync(v8, v14);

  }
  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (NSString *)v9;
}

void __24__PCSAccountsModel_dsid__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "update");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (NSString)identifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  if (PCSSupportsPersonaMultiuser())
  {
    +[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v16[5];
    v16[5] = v4;

    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "personaIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "aa_personID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "aa_altDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_fault_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "identifier invoked with current persona: %@, dsid: %@, altDSID: %@", buf, 0x20u);

    }
  }
  else
  {
    -[PCSAccountsModel faultIfCurrentPersonaIsDataSeparated](self, "faultIfCurrentPersonaIsDataSeparated");
    -[PCSAccountsModel queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __30__PCSAccountsModel_identifier__block_invoke;
    v14[3] = &unk_1E553DF98;
    v14[4] = self;
    v14[5] = &v15;
    dispatch_sync(v8, v14);

  }
  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (NSString *)v9;
}

void __30__PCSAccountsModel_identifier__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "update");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (NSString)lastError
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  if (PCSSupportsPersonaMultiuser())
  {
    +[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "personaIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "aa_personID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "aa_altDSID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_fault_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "lastError invoked with current persona: %@, dsid: %@, altDSID: %@", buf, 0x20u);

    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("lastError not set for current persona %@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v18[5];
    v18[5] = v8;

  }
  else
  {
    -[PCSAccountsModel faultIfCurrentPersonaIsDataSeparated](self, "faultIfCurrentPersonaIsDataSeparated");
    -[PCSAccountsModel queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__PCSAccountsModel_lastError__block_invoke;
    block[3] = &unk_1E553DFC0;
    block[4] = self;
    block[5] = &v17;
    dispatch_sync(v10, block);

  }
  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return (NSString *)v11;
}

void __29__PCSAccountsModel_lastError__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)update
{
  NSObject *v3;
  NSString *v4;
  NSString *username;
  NSString *dsid;
  NSString *identifier;
  NSString *lastError;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  __CFString *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  int v22;
  NSString *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PCSAccountsModel queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[PCSAccountsModel accountsChanged](self, "accountsChanged"))
  {
    v17 = 0;
    v4 = 0;
    goto LABEL_18;
  }
  -[PCSAccountsModel setAccountsChanged:](self, "setAccountsChanged:", 0);
  v4 = self->_dsid;
  username = self->_username;
  self->_username = 0;

  dsid = self->_dsid;
  self->_dsid = 0;

  identifier = self->_identifier;
  self->_identifier = 0;

  lastError = self->_lastError;
  self->_lastError = 0;

  -[PCSAccountsModel store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "aa_primaryAppleAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v17 = 0;
    v18 = CFSTR("No primary AppleAccount");
LABEL_11:
    v19 = self->_lastError;
    self->_lastError = &v18->isa;

    goto LABEL_12;
  }
  objc_msgSend(v10, "username");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = self->_username;
  self->_username = v11;

  objc_msgSend(v10, "aa_personID");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = self->_dsid;
  self->_dsid = v13;

  objc_msgSend(v10, "identifier");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = self->_identifier;
  self->_identifier = v15;

  if (!self->_username)
  {
    v18 = CFSTR("No username found on accounts");
LABEL_10:
    v17 = v10;
    goto LABEL_11;
  }
  if (!self->_dsid)
  {
    v18 = CFSTR("No dsid found on accounts");
    goto LABEL_10;
  }
  v17 = v10;
LABEL_12:
  v20 = self->_dsid;
  if (((v4 != 0) != (v20 != 0) || v4 && v20 && !-[NSString isEqualToString:](v20, "isEqualToString:", v4))
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v21 = self->_dsid;
    v22 = 138543618;
    v23 = v4;
    v24 = 2114;
    v25 = v21;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Switching from DSID %{public}@ to %{public}@", (uint8_t *)&v22, 0x16u);
  }
LABEL_18:

}

+ (BOOL)currentPersonaSupportsPrimaryAccount:(id *)a3
{
  void *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isDataSeparatedPersona");
  v7 = v6;
  if (a3 && v6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = kPCSErrorDomain;
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("Operation unsupported for non-primary persona");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 146, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7 ^ 1;
}

+ (id)accountForCurrentPersona
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[PCSAccountsModel defaultAccountsModel](PCSAccountsModel, "defaultAccountsModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isDataSeparatedPersona"))
  {
    objc_msgSend(v5, "userPersonaUniqueString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "aa_appleAccounts", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        objc_msgSend(v12, "personaIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v15 = v12;

      if (!v15)
        goto LABEL_15;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "using account for persona %@", buf, 0xCu);
      }
    }
    else
    {
LABEL_10:

LABEL_15:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[PCSAccountsModel accountForCurrentPersona].cold.1((uint64_t)v6);
      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(v3, "aa_primaryAppleAccount");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)altDSIDForDSID:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (!AppleAccountLibraryCore_frameworkLibrary)
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
  if (AppleAccountLibraryCore_frameworkLibrary)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v8 = 0;
  }
  else
  {
    +[PCSAccountsModel defaultAccountsModel](PCSAccountsModel, "defaultAccountsModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "aa_appleAccountWithPersonID:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aa_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)settingsKeyForKey:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (+[PCSAccountsModel currentPersonaSupportsPrimaryAccount:](PCSAccountsModel, "currentPersonaSupportsPrimaryAccount:", 0))
  {
    a4 = (id *)v5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("nextRegistrySync")) & 1) != 0)
  {
    a4 = (id *)CFSTR("nextRegistrySyncEnterprise");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("registrySyncIdentifier")) & 1) != 0)
  {
    a4 = (id *)CFSTR("registrySyncIdentifierEnterprise");
  }
  else if (a4)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = kPCSErrorDomain;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unrecognized key :%@"), v5, *MEMORY[0x1E0CB2D50]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 153, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (BOOL)accountsChanged
{
  return self->_accountsChanged;
}

- (void)setAccountsChanged:(BOOL)a3
{
  self->_accountsChanged = a3;
}

- (ACAccountStore)store
{
  return (ACAccountStore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)init
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  -[PCSAccountsModel faultIfCurrentPersonaIsDataSeparated].cold.1(v0);
}

- (uint64_t)update
{
  id v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no accounts found: %@", (uint8_t *)&v6, 0xCu);
  }
  objc_end_catch();
  return a3 & 1;
}

+ (void)accountForCurrentPersona
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unable to find account for persona %@", (uint8_t *)&v1, 0xCu);
}

@end
