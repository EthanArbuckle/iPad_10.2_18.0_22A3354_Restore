@implementation SSAccount

void __21__SSAccount_isActive__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isActive");

}

void __27__SSAccount_isLocalAccount__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "backingAccountIsLocalAccount:", v3);

}

+ (BOOL)backingAccountIsLocalAccount:(id)a3
{
  return objc_msgSend(a3, "ams_isLocalAccount");
}

- (BOOL)isActive
{
  SSAccount *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__SSAccount_isActive__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)hasBrokenDSID
{
  void *v3;
  void *v4;
  char v5;

  -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_1E481E6C0);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (NSNumber)uniqueIdentifier
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (-[SSAccount isLocalAccount](self, "isLocalAccount"))
    return (NSNumber *)&unk_1E481E6D8;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v13 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__SSAccount_uniqueIdentifier__block_invoke;
  v7[3] = &unk_1E47B8680;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v5, v7);

  SSAccountGetUniqueIdentifierFromValue((void *)v9[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v8, 8);

  return (NSNumber *)v6;
}

- (BOOL)isLocalAccount
{
  SSAccount *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__SSAccount_isLocalAccount__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SSAccount_accountPropertyForKey___block_invoke;
  block[3] = &unk_1E47B86D0;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)_backingAccount
{
  NSObject *v3;

  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_backingAccount;
}

- (OS_dispatch_queue)backingAccountAccessQueue
{
  return self->_backingAccountAccessQueue;
}

- (SSAccount)initWithBackingAccount:(id)a3
{
  id v5;
  SSAccount *v6;
  SSAccount *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *backingAccountAccessQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSAccount;
  v6 = -[SSAccount init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingAccount, a3);
    v8 = dispatch_queue_create("com.apple.StoreServices.SSAccount.backingAccountAccessQueue", MEMORY[0x1E0C80D50]);
    backingAccountAccessQueue = v7->_backingAccountAccessQueue;
    v7->_backingAccountAccessQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAccountAccessQueue, 0);
  objc_storeStrong((id *)&self->_bioToken, 0);
  objc_storeStrong((id *)&self->_backingAccount, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  _NSZone *v13;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SSAccount_copyWithZone___block_invoke;
  block[3] = &unk_1E47B9F28;
  block[4] = self;
  v13 = a3;
  v7 = v5;
  v12 = v7;
  dispatch_sync(v6, block);

  v8 = v12;
  v9 = v7;

  return v9;
}

- (SSAccount)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  SSAccount *v7;

  v3 = objc_alloc(MEMORY[0x1E0C8F298]);
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iTunesStoreAccountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithAccountType:", v5);
  v7 = -[SSAccount initWithBackingAccount:](self, "initWithBackingAccount:", v6);

  if (v7)
    -[SSAccount setActive:](v7, "setActive:", 0);
  return v7;
}

void __23__SSAccount_setActive___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");
  v4 = *(unsigned __int8 *)(a1 + 40);

  if (v4 != v3)
  {
    objc_msgSend(WeakRetained, "_backingAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActive:", *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)setActive:(BOOL)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SSAccount_setActive___block_invoke;
  block[3] = &unk_1E47BAAA0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_barrier_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __35__SSAccount_accountPropertyForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountPropertyForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)storeFrontIdentifier
{
  return (NSString *)-[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("storefrontID"));
}

uint64_t __26__SSAccount_copyWithZone___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBackingAccount:", *(_QWORD *)(a1 + 40));
}

void __29__SSAccount_uniqueIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ss_DSID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setBackingAccount:(id)a3
{
  ACAccount *v4;
  NSObject *v5;
  ACAccount *backingAccount;

  v4 = (ACAccount *)a3;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  backingAccount = self->_backingAccount;
  self->_backingAccount = v4;

}

void __26__SSAccount_copyWithZone___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyWithZone:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "backingAccountAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__SSAccount_copyWithZone___block_invoke_2;
  v6[3] = &unk_1E47B8768;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_barrier_async(v4, v6);

}

void __25__SSAccount_accountScope__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F180]);

}

- (NSDictionary)privacyAcknowledgement
{
  return (NSDictionary *)-[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("privacyAcknowledgement"));
}

- (int64_t)accountScope
{
  id v3;
  NSObject *v4;
  void *v5;
  int64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("scope"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __25__SSAccount_accountScope__block_invoke;
    v8[3] = &unk_1E47B8680;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v4, v8);

    if (*((_BYTE *)v10 + 24))
      v5 = &unk_1E481E6A8;
    else
      v5 = &unk_1E481E6C0;
    v3 = v5;
    _Block_object_dispose(&v9, 8);
  }
  v6 = objc_msgSend(v3, "integerValue");

  return v6;
}

- (int64_t)accountKind
{
  void *v2;
  int64_t v3;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)accountName
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__SSAccount_accountName__block_invoke;
  v6[3] = &unk_1E47B8680;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __24__SSAccount_accountName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)altDSID
{
  return (NSString *)-[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("altDSID"));
}

- (NSArray)automaticDownloadKinds
{
  void *v2;
  void *v3;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("automaticDownloadKinds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (int64_t)availableServiceTypes
{
  void *v2;
  int64_t v3;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("availableServiceTypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (ACAccount)backingAccount
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__SSAccount_backingAccount__block_invoke;
  v6[3] = &unk_1E47B8680;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ACAccount *)v4;
}

void __27__SSAccount_backingAccount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)creditsString
{
  return (NSString *)-[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("accountCredits"));
}

- (NSString)demoAccountRawPassword
{
  return 0;
}

- (BOOL)didFallbackToPassword
{
  SSAccount *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSAccount_didFallbackToPassword__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __34__SSAccount_didFallbackToPassword__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (BOOL)displayedServerPromptWithIdentifier:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((SSDebugShouldDisableServerPrompts() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_displayedServerPromptKeyWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "BOOLValue");

  }
  return v5;
}

- (BOOL)isDirty
{
  SSAccount *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__SSAccount_isDirty__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __20__SSAccount_isDirty__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDirty"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v4, "dirtyAccountProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(v4, "dirtyDataclassProperties");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count") != 0;

    }
  }

}

- (int64_t)enabledServiceTypes
{
  void *v2;
  int64_t v3;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("enabledServiceTypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)firstName
{
  return (NSString *)-[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("firstName"));
}

- (BOOL)isAuthenticated
{
  SSAccount *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__SSAccount_isAuthenticated__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __28__SSAccount_isAuthenticated__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isAuthenticated");

}

- (BOOL)isSocialEnabled
{
  return -[SSAccount enabledServiceTypes](self, "enabledServiceTypes") & 1;
}

- (id)lastAttemptDateForServerPromptWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_lastAttemptForServerPromptKeyWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (NSString)lastName
{
  return (NSString *)-[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("lastName"));
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[SSAccount firstName](self, "firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[SSAccount lastName](self, "lastName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v9 = 0;
      return (NSString *)v9;
    }
  }
  v5 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  -[SSAccount lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFamilyName:", v6);

  -[SSAccount firstName](self, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGivenName:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v8, "stringFromPersonNameComponents:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (int64_t)accountSource
{
  void *v2;
  int64_t v3;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("accountSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)freeDownloadsPasswordSetting
{
  void *v2;
  int64_t v3;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("freeDownloadsPasswordSetting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)isActiveLockerAccount
{
  void *v2;
  char v3;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("isActiveLockerAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isDemoAccount
{
  void *v2;
  char v3;

  -[SSAccount backingAccount](self, "backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ams_isDemoAccount");

  return v3;
}

- (BOOL)isDuplicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SSAccount backingAccount](self, "backingAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "_ss_isDuplicate:", v6);
  return (char)v4;
}

- (BOOL)isManagedAppleID
{
  void *v2;
  char v3;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("isManagedAppleID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isNewCustomer
{
  void *v2;
  char v3;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("isNewCustomer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)ITunesPassSerialNumber
{
  return (NSString *)-[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("iTunesPassSerialNumber"));
}

- (int64_t)paidPurchasesPasswordSetting
{
  void *v2;
  int64_t v3;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("paidPurchasesPasswordSetting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)passwordEquivalentToken
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__SSAccount_passwordEquivalentToken__block_invoke;
  v6[3] = &unk_1E47B8718;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __36__SSAccount_passwordEquivalentToken__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "credential");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialItemForKey:", *MEMORY[0x1E0C8F220]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSString)rawPassword
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__SSAccount_rawPassword__block_invoke;
  v6[3] = &unk_1E47B8718;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __24__SSAccount_rawPassword__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_rawPassword");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)secureToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[SSAccount backingAccount](self, "backingAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureTokenForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setPasswordEquivalentToken:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = SSIsInternalBuild();
  if (v4 && v5 && (objc_msgSend(v4, "hasSuffix:", CFSTR("PET")) & 1) == 0)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      -[SSAccount hashedDescription](self, "hashedDescription");
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, location, v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        free(v10);
        SSFileLog(v6, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);

      }
    }
    else
    {

    }
  }
  objc_initWeak(location, self);
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SSAccount_setPasswordEquivalentToken___block_invoke;
  block[3] = &unk_1E47BA0B8;
  objc_copyWeak(&v23, location);
  v22 = v4;
  v19 = v4;
  dispatch_barrier_async(v18, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

void __40__SSAccount_setPasswordEquivalentToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2B0]), "initWithPassword:", 0);
    objc_msgSend(v2, "setCredential:", v3);
  }
  v4 = *MEMORY[0x1E0C8F220];
  objc_msgSend(v3, "credentialItemForKey:", *MEMORY[0x1E0C8F220]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v6 & 1) == 0)
    objc_msgSend(v3, "setCredentialItem:forKey:", *(_QWORD *)(a1 + 32), v4);

}

- (void)setRawPassword:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = SSIsInternalBuild();
  if (v4 && v5 && objc_msgSend(v4, "hasSuffix:", CFSTR("PET")))
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      -[SSAccount hashedDescription](self, "hashedDescription");
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, location, v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        free(v10);
        SSFileLog(v6, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);

      }
    }
    else
    {

    }
  }
  objc_initWeak(location, self);
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SSAccount_setRawPassword___block_invoke;
  block[3] = &unk_1E47BA0B8;
  objc_copyWeak(&v23, location);
  v22 = v4;
  v19 = v4;
  dispatch_barrier_async(v18, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

void __28__SSAccount_setRawPassword___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2B0]), "initWithPassword:", 0);
    objc_msgSend(v2, "setCredential:", v3);
  }
  v4 = *MEMORY[0x1E0C8F258];
  objc_msgSend(v3, "credentialItemForKey:", *MEMORY[0x1E0C8F258]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v6 & 1) == 0)
    objc_msgSend(v3, "setCredentialItem:forKey:", *(_QWORD *)(a1 + 32), v4);

}

- (void)setAccountKind:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v4, CFSTR("kind"));

}

- (void)setAccountName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SSAccount_setAccountName___block_invoke;
  block[3] = &unk_1E47BA0B8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __28__SSAccount_setAccountName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "_backingAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUsername:", *(_QWORD *)(a1 + 32));

  }
}

- (void)setAccountScope:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v5, CFSTR("scope"));

  if (a3 == 1)
  {
    -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__SSAccount_setAccountScope___block_invoke;
    block[3] = &unk_1E47B8790;
    block[4] = self;
    dispatch_barrier_sync(v6, block);

  }
}

void __29__SSAccount_setAccountScope___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E0CFD7A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F180]);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountType:", v4);

}

- (void)setAccountSource:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v4, CFSTR("accountSource"));

}

- (void)setActiveLockerAccount:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v4, CFSTR("isActiveLockerAccount"));

}

- (void)setAltDSID:(id)a3
{
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", a3, CFSTR("altDSID"));
}

- (void)setAuthenticated:(BOOL)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SSAccount_setAuthenticated___block_invoke;
  block[3] = &unk_1E47BAAA0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_barrier_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __30__SSAccount_setAuthenticated___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");
  v4 = *(unsigned __int8 *)(a1 + 40);

  if (v4 != v3)
  {
    objc_msgSend(WeakRetained, "_backingAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAuthenticated:", *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)setAutomaticDownloadKinds:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v4, CFSTR("automaticDownloadKinds"));

}

- (void)setAvailableServiceTypes:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v4, CFSTR("availableServiceTypes"));

}

- (void)setCreditsString:(id)a3
{
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", a3, CFSTR("accountCredits"));
}

- (void)setDidFallbackToPassword:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SSAccount_setDidFallbackToPassword___block_invoke;
  v6[3] = &unk_1E47B9850;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

uint64_t __38__SSAccount_setDidFallbackToPassword___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setDisplayedServerPrompt:(BOOL)a3 withIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_displayedServerPromptKeyWithIdentifier:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v7, v8);

}

- (void)setEnabledServiceTypes:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v4, CFSTR("enabledServiceTypes"));

}

- (void)setFirstName:(id)a3
{
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", a3, CFSTR("firstName"));
}

- (void)setFreeDownloadsPasswordSetting:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v4, CFSTR("freeDownloadsPasswordSetting"));

}

- (void)setITunesPassSerialNumber:(id)a3
{
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", a3, CFSTR("iTunesPassSerialNumber"));
}

- (void)setLastAttemptDate:(id)a3 forServerPromptWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_lastAttemptForServerPromptKeyWithIdentifier:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v7, v8);
}

- (void)setLastName:(id)a3
{
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", a3, CFSTR("lastName"));
}

- (void)setManagedAppleID:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v4, CFSTR("isManagedAppleID"));

}

- (void)setNewCustomer:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v4, CFSTR("isNewCustomer"));

}

- (void)setPaidPurchasesPasswordSetting:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v4, CFSTR("paidPurchasesPasswordSetting"));

}

- (void)setSecureToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFAllocator *v21;
  __CFDictionary *Mutable;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  int v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  int v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  int v53;
  NSObject *v54;
  int v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __CFDictionary *v66;
  _BYTE *v67;
  uint64_t v68;
  id v69;
  _BYTE result[12];
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSAccount backingAccount](self, "backingAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v11 &= 2u;
    if (v11)
    {
      *(_DWORD *)result = 138543618;
      *(_QWORD *)&result[4] = objc_opt_class();
      v71 = 2112;
      v72 = v6;
      v13 = *(id *)&result[4];
      LODWORD(v68) = 22;
      v67 = result;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, result, v68);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v9, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v12);
    }

LABEL_13:
    v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v6);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], CFSTR("com.apple.itunesstored.token"));
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount secureToken](self, "secureToken");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      if ((objc_msgSend(v23, "isEqualToString:", v4) & 1) == 0)
      {
        v69 = v4;
        +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v26 = objc_msgSend(v25, "shouldLog", v67);
        if (objc_msgSend(v25, "shouldLogToDisk"))
          v27 = v26 | 2;
        else
          v27 = v26;
        objc_msgSend(v25, "OSLogObject");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          v29 = v27;
        else
          v29 = v27 & 2;
        if (v29)
        {
          v30 = (void *)objc_opt_class();
          *(_DWORD *)result = 138543362;
          *(_QWORD *)&result[4] = v30;
          v31 = v30;
          LODWORD(v68) = 12;
          v32 = (void *)_os_log_send_and_compose_impl();

          v4 = v69;
          if (!v32)
          {
LABEL_52:

            v66 = CFDictionaryCreateMutable(v21, 0, 0, 0);
            CFDictionaryAddValue(v66, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68B0]);
            CFDictionaryAddValue(v66, (const void *)*MEMORY[0x1E0CD70D8], v9);
            SecItemUpdate(Mutable, v66);
            CFRelease(v66);
            goto LABEL_53;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v32, 4, result, v68);
          v28 = objc_claimAutoreleasedReturnValue();
          free(v32);
          SSFileLog(v25, CFSTR("%@"), v33, v34, v35, v36, v37, v38, (uint64_t)v28);
        }
        else
        {
          v4 = v69;
        }

        goto LABEL_52;
      }
LABEL_53:
      CFRelease(Mutable);

      goto LABEL_54;
    }
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v52 = objc_msgSend(v51, "shouldLog", v67);
    if (objc_msgSend(v51, "shouldLogToDisk"))
      v53 = v52 | 2;
    else
      v53 = v52;
    objc_msgSend(v51, "OSLogObject");
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      v55 = v53;
    else
      v55 = v53 & 2;
    if (v55)
    {
      v56 = (void *)objc_opt_class();
      *(_DWORD *)result = 138543362;
      *(_QWORD *)&result[4] = v56;
      v57 = v4;
      v58 = v56;
      LODWORD(v68) = 12;
      v59 = (void *)_os_log_send_and_compose_impl();

      v4 = v57;
      if (!v59)
      {
LABEL_48:

        *(_QWORD *)result = 0;
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68B0]);
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v9);
        SecItemAdd(Mutable, (CFTypeRef *)result);
        goto LABEL_53;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v59, 4, result, v68);
      v54 = objc_claimAutoreleasedReturnValue();
      free(v59);
      SSFileLog(v51, CFSTR("%@"), v60, v61, v62, v63, v64, v65, (uint64_t)v54);
    }

    goto LABEL_48;
  }
  if (!v8)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v39 |= 2u;
  objc_msgSend(v9, "OSLogObject");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    v41 = v39;
  else
    v41 = v39 & 2;
  if (v41)
  {
    *(_DWORD *)result = 138543362;
    *(_QWORD *)&result[4] = objc_opt_class();
    v42 = *(id *)&result[4];
    LODWORD(v68) = 12;
    v43 = (void *)_os_log_send_and_compose_impl();

    if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4, result, v68);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      free(v43);
      SSFileLog(v9, CFSTR("%@"), v45, v46, v47, v48, v49, v50, (uint64_t)v44);

    }
  }
  else
  {

  }
LABEL_54:

}

- (void)setSocialEnabled:(BOOL)a3
{
  if (a3)
    -[SSAccount _addAccountPropertyBitmask:forKey:](self, "_addAccountPropertyBitmask:forKey:", 1, CFSTR("enabledServiceTypes"));
  else
    -[SSAccount _removeAccountPropertyBitmask:forKey:](self, "_removeAccountPropertyBitmask:forKey:", 1, CFSTR("enabledServiceTypes"));
}

- (void)setStoreFrontIdentifier:(id)a3
{
  -[SSAccount setStoreFrontIdentifier:forRequest:response:](self, "setStoreFrontIdentifier:forRequest:response:", a3, 0, 0);
}

- (void)setStoreFrontIdentifier:(id)a3 forRequest:(id)a4 response:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  int v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("storefrontID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && +[SSDevice deviceIsInternalBuild](SSDevice, "deviceIsInternalBuild")
    && !-[SSAccount isLocalAccount](self, "isLocalAccount"))
  {
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "_countryCodeFromStorefrontIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_countryCodeFromStorefrontIdentifier:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
      {
        +[SSLogConfig sharedAccountsStorefrontConfig](SSLogConfig, "sharedAccountsStorefrontConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v11 = objc_msgSend(v10, "shouldLog");
        if (objc_msgSend(v10, "shouldLogToDisk"))
          v12 = v11 | 2;
        else
          v12 = v11;
        objc_msgSend(v10, "OSLogObject");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          v14 = v12;
        else
          v14 = v12 & 2;
        if (v14)
        {
          v15 = (void *)objc_opt_class();
          v45 = v15;
          -[SSAccount hashedDescription](self, "hashedDescription");
          v44 = v9;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          SSHashIfNeeded(v7);
          v43 = v13;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          SSHashIfNeeded(v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[SSStackShot generateSymbolicatedStackShot](SSStackShot, "generateSymbolicatedStackShot");
          v46 = 138544386;
          v47 = v15;
          v48 = 2114;
          v49 = v42;
          v50 = 2114;
          v51 = v16;
          v52 = 2114;
          v53 = v17;
          v54 = 2114;
          v55 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v55;
          LODWORD(v41) = 52;
          v40 = &v46;
          v19 = (void *)_os_log_send_and_compose_impl();

          v9 = v44;
          if (!v19)
          {
LABEL_18:

            goto LABEL_30;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v46, v41);
          v13 = objc_claimAutoreleasedReturnValue();
          free(v19);
          SSFileLog(v10, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v13);
        }

        goto LABEL_18;
      }
    }
    else
    {
      +[SSLogConfig sharedAccountsStorefrontConfig](SSLogConfig, "sharedAccountsStorefrontConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v26 = objc_msgSend(v8, "shouldLog");
      if (objc_msgSend(v8, "shouldLogToDisk"))
        v27 = v26 | 2;
      else
        v27 = v26;
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        v28 = v27;
      else
        v28 = v27 & 2;
      if (v28)
      {
        v29 = (void *)objc_opt_class();
        v30 = v29;
        -[SSAccount hashedDescription](self, "hashedDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSStackShot generateSymbolicatedStackShot](SSStackShot, "generateSymbolicatedStackShot");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138543874;
        v47 = v29;
        v48 = 2114;
        v49 = v31;
        v50 = 2114;
        v51 = v32;
        LODWORD(v41) = 32;
        v40 = &v46;
        v33 = (void *)_os_log_send_and_compose_impl();

        if (!v33)
        {
LABEL_31:

          goto LABEL_32;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v33, 4, &v46, v41);
        v9 = objc_claimAutoreleasedReturnValue();
        free(v33);
        SSFileLog(v8, CFSTR("%@"), v34, v35, v36, v37, v38, v39, (uint64_t)v9);
      }
    }
LABEL_30:

    goto LABEL_31;
  }
LABEL_32:
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", v6, CFSTR("storefrontID"), v40);

}

- (void)setUniqueIdentifier:(id)a3
{
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", a3, CFSTR("dsid"));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSAccount *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__SSAccount_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(v4, v8);

  v6 = v5;
  return v6;
}

void __28__SSAccount_copyXPCEncoding__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_backingAccount");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v1, "0", v2);

}

- (SSAccount)initWithXPCEncoding:(id)a3
{
  id v5;
  void *v6;
  SSAccount *v7;
  uint64_t v8;
  uint64_t v9;
  ACAccount *backingAccount;
  void *v12;

  v5 = a3;
  v6 = v5;
  if (!v5 || MEMORY[0x1A85863E4](v5) != MEMORY[0x1E0C812F8])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSAccount.m"), 606, CFSTR("-[SSAccount initWithXPCEncoding:] provided with an invalid xpc_object_t object."));

  }
  v7 = -[SSAccount init](self, "init");
  if (v7)
  {
    v8 = objc_opt_class();
    v9 = SSXPCDictionaryCopyObjectWithClass(v6, "0", v8);
    backingAccount = v7->_backingAccount;
    v7->_backingAccount = (ACAccount *)v9;

  }
  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v16.receiver = self;
  v16.super_class = (Class)SSAccount;
  -[SSAccount description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SSAccount isLocalAccount](self, "isLocalAccount"))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR(" Local Account"));
  }
  else
  {
    -[SSAccount altDSID](self, "altDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount accountName](self, "accountName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount backingAccount](self, "backingAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SSAccount accountScope](self, "accountScope");
    if (-[SSAccount isActive](self, "isActive"))
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    if (-[SSAccount isAuthenticated](self, "isAuthenticated"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    objc_msgSend(v5, "appendFormat:", CFSTR(" altDSID = %@ | DSID = %@ | username = %@ | backingIdentifier = %@ | scope = %ld | active = %@ | authenticated = %@"), v15, v6, v7, v9, v10, v11, v12);

  }
  -[SSAccount storeFrontIdentifier](self, "storeFrontIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" | storefront = %@>"), v13);

  return (NSString *)v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_2;
  if (-[SSAccount isLocalAccount](self, "isLocalAccount") && (objc_msgSend(v4, "isLocalAccount") & 1) != 0)
  {
    v6 = 1;
    goto LABEL_3;
  }
  -[SSAccount altDSID](self, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    LODWORD(v9) = 0;
  }
  else
  {
    objc_msgSend(v4, "altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = v10 == 0;

  }
  -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12 ? 0 : v9;

  }
  -[SSAccount accountName](self, "accountName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    objc_msgSend(v4, "accountName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v9 ^ 1;
    if (v14)
      v15 = 1;
    if ((v15 & 1) == 0)
    {
      -[SSAccount backingAccount](self, "backingAccount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "backingAccount");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v17, "isEqualToString:", v19);

      goto LABEL_3;
    }
  }
  v20 = -[SSAccount accountScope](self, "accountScope");
  if (v20 != objc_msgSend(v4, "accountScope"))
    goto LABEL_2;
  -[SSAccount altDSID](self, "altDSID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 || (objc_msgSend(v4, "altDSID"), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SSAccount altDSID](self, "altDSID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "altDSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (v21)
    {

      if (!v24)
        goto LABEL_2;
    }
    else
    {

      if ((v24 & 1) == 0)
        goto LABEL_2;
    }
  }
  -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_35:
      -[SSAccount accountName](self, "accountName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29 || (objc_msgSend(v4, "accountName"), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SSAccount accountName](self, "accountName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accountName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqual:", v31) ^ 1;

        if (v29)
        {
LABEL_41:

          v6 = v32 ^ 1;
          goto LABEL_3;
        }
      }
      else
      {
        LOBYTE(v32) = 0;
      }

      goto LABEL_41;
    }
  }
  -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  if (!v25)
  {

    if ((v28 & 1) == 0)
      goto LABEL_2;
    goto LABEL_35;
  }

  if (v28)
    goto LABEL_35;
LABEL_2:
  v6 = 0;
LABEL_3:

  return v6;
}

- (void)acceptTermsAndConditions:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  SSMutableURLRequestProperties *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SSURLConnectionRequest *v14;
  SSAuthenticationContext *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v8, "setITunesStoreRequest:", 1);
  -[SSMutableURLRequestProperties setURLBagKey:](v8, "setURLBagKey:", CFSTR("terms-check"));
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v7, "currentVersionIdentifier");

  objc_msgSend(v10, "numberWithLongLong:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("accepted"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMutableURLRequestProperties setHTTPBody:](v8, "setHTTPBody:", v13);

  -[SSMutableURLRequestProperties setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("POST"));
  v14 = -[SSURLConnectionRequest initWithRequestProperties:]([SSURLConnectionRequest alloc], "initWithRequestProperties:", v8);
  v15 = -[SSAuthenticationContext initWithAccount:]([SSAuthenticationContext alloc], "initWithAccount:", self);
  -[SSURLConnectionRequest setAuthenticationContext:](v14, "setAuthenticationContext:", v15);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__SSAccount_acceptTermsAndConditions_withCompletionBlock___block_invoke;
  v17[3] = &unk_1E47BAAC8;
  v18 = v6;
  v16 = v6;
  -[SSURLConnectionRequest startWithConnectionResponseBlock:](v14, "startWithConnectionResponseBlock:", v17);

}

void __58__SSAccount_acceptTermsAndConditions_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  SSTermsAndConditions *v8;
  void *v9;
  SSTermsAndConditions *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      v8 = [SSTermsAndConditions alloc];
      objc_msgSend(v5, "bodyData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v6;
      v10 = -[SSTermsAndConditions initWithResponseData:error:](v8, "initWithResponseData:error:", v9, &v12);
      v11 = v12;

      v7 = *(_QWORD *)(a1 + 32);
      v6 = v11;
    }
    else
    {
      v10 = 0;
    }
    (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, -[SSTermsAndConditions isUserAccepted](v10, "isUserAccepted"), v6);

  }
}

- (id)eligibilityForService:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SSAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("eligibleServices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)getDownloadKindsEligibleForContentRestoreWithBlock:(id)a3
{
  id v4;
  SSURLBagContext *v5;
  void *v6;
  SSURLBag *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil completionBlock"));
  v5 = objc_alloc_init(SSURLBagContext);
  -[SSURLBagContext setBagType:](v5, "setBagType:", SSURLBagTypeForAccountScope(-[SSAccount accountScope](self, "accountScope")));
  -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSURLBagContext setUserIdentifier:](v5, "setUserIdentifier:", v6);

  v7 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SSAccount_getDownloadKindsEligibleForContentRestoreWithBlock___block_invoke;
  v9[3] = &unk_1E47BAAF0;
  v10 = v4;
  v8 = v4;
  -[SSURLBag loadValueForKey:completionBlock:](v7, "loadValueForKey:completionBlock:", CFSTR("p2-content-restore"), v9);

}

void __64__SSAccount_getDownloadKindsEligibleForContentRestoreWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v7, "objectForKey:", CFSTR("allowed-kinds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getEligibilityForService:(int64_t)a3 completionBlock:(id)a4
{
  id v5;
  SSVSubscriptionStatusRequest *v6;
  SSAuthenticationContext *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[3];
  char v13;

  v5 = a4;
  v6 = objc_alloc_init(SSVSubscriptionStatusRequest);
  -[SSVSubscriptionStatusRequest setCarrierBundleProvisioningStyle:](v6, "setCarrierBundleProvisioningStyle:", 0);
  v7 = -[SSAuthenticationContext initWithAccount:]([SSAuthenticationContext alloc], "initWithAccount:", self);
  -[SSVSubscriptionStatusRequest setAuthenticationContext:](v6, "setAuthenticationContext:", v7);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SSAccount_getEligibilityForService_completionBlock___block_invoke;
  v9[3] = &unk_1E47BAB18;
  v8 = v5;
  v10 = v8;
  v11 = v12;
  -[SSVSubscriptionStatusRequest startWithStatusResponseBlock:](v6, "startWithStatusResponseBlock:", v9);

  _Block_object_dispose(v12, 8);
}

void __54__SSAccount_getEligibilityForService_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a4;
  if (*(_QWORD *)(a1 + 32) && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (v10)
    {
      v7 = objc_msgSend(v10, "accountStatus");
      if (v7 == 2)
      {
        v8 = 0;
        goto LABEL_9;
      }
      if (v7 == 3)
      {
        v8 = 1;
LABEL_9:
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v8);
        goto LABEL_10;
      }
    }
    v9 = 0;
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
}

- (void)getPurchasedItemsForItems:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  SSAuthenticationContext *v21;
  SSXPCConnection *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  int v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v27 = 136446210;
      v28 = "-[SSAccount getPurchasedItemsForItems:completionBlock:]";
      LODWORD(v24) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v27, v24);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil completionBlock"));
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 67);
  SSXPCDictionarySetObject(v20, "2", v7);

  v21 = -[SSAuthenticationContext initWithAccount:]([SSAuthenticationContext alloc], "initWithAccount:", self);
  SSXPCDictionarySetObject(v20, "1", v21);
  v22 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __55__SSAccount_getPurchasedItemsForItems_completionBlock___block_invoke;
  v25[3] = &unk_1E47BAB40;
  v26 = v6;
  v23 = v6;
  -[SSXPCConnection sendMessage:withReply:](v22, "sendMessage:withReply:", v20, v25);

}

void __55__SSAccount_getPurchasedItemsForItems_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A85863E4](v3) != MEMORY[0x1E0C812F8])
  {
    v5 = 111;
LABEL_6:
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_7;
  }
  v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "2");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "initWithXPCEncoding:", v13);

  xpc_dictionary_get_value(v4, "1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  v7 = (unint64_t)SSXPCCreateNSArrayFromXPCEncodedArray(v14, v15);

LABEL_7:
  if (!(v6 | v7))
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SSAccount_getPurchasedItemsForItems_completionBlock___block_invoke_2;
  block[3] = &unk_1E47B8608;
  v9 = *(id *)(a1 + 32);
  v18 = (id)v6;
  v19 = v9;
  v17 = (id)v7;
  v10 = (id)v6;
  v11 = (id)v7;
  dispatch_async(v8, block);

}

uint64_t __55__SSAccount_getPurchasedItemsForItems_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getTermsAndConditionsWithBlock:(id)a3
{
  id v4;
  SSMutableURLRequestProperties *v5;
  SSURLConnectionRequest *v6;
  SSAuthenticationContext *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc_init(SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v5, "setITunesStoreRequest:", 1);
  -[SSMutableURLRequestProperties setURLBagKey:](v5, "setURLBagKey:", CFSTR("terms-check"));
  v6 = -[SSURLConnectionRequest initWithRequestProperties:]([SSURLConnectionRequest alloc], "initWithRequestProperties:", v5);
  v7 = -[SSAuthenticationContext initWithAccount:]([SSAuthenticationContext alloc], "initWithAccount:", self);
  -[SSURLConnectionRequest setAuthenticationContext:](v6, "setAuthenticationContext:", v7);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__SSAccount_getTermsAndConditionsWithBlock___block_invoke;
  v9[3] = &unk_1E47BAAC8;
  v10 = v4;
  v8 = v4;
  -[SSURLConnectionRequest startWithConnectionResponseBlock:](v6, "startWithConnectionResponseBlock:", v9);

}

void __44__SSAccount_getTermsAndConditionsWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  SSTermsAndConditions *v8;
  void *v9;
  SSTermsAndConditions *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      v8 = [SSTermsAndConditions alloc];
      objc_msgSend(v5, "bodyData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v6;
      v10 = -[SSTermsAndConditions initWithResponseData:error:](v8, "initWithResponseData:error:", v9, &v12);
      v11 = v12;

      v7 = *(_QWORD *)(a1 + 32);
      v6 = v11;
    }
    else
    {
      v10 = 0;
    }
    (*(void (**)(uint64_t, SSTermsAndConditions *, id))(v7 + 16))(v7, v10, v6);

  }
}

+ (int64_t)accountKindFromAuthenticationResponseDictionary:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "valueForKeyPath:", CFSTR("accountInfo.accountKind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "intValue") == 1;

  return v4;
}

+ (id)accountNameFromAuthenticationResponseDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "_valueForFirstAvailableKeyPath:inDictionary:", &unk_1E481E8E8, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)addAvailableServiceTypes:(int64_t)a3
{
  -[SSAccount _addAccountPropertyBitmask:forKey:](self, "_addAccountPropertyBitmask:forKey:", a3, CFSTR("availableServiceTypes"));
}

- (void)addEnabledServiceTypes:(int64_t)a3
{
  -[SSAccount _addAccountPropertyBitmask:forKey:](self, "_addAccountPropertyBitmask:forKey:", a3, CFSTR("enabledServiceTypes"));
}

+ (id)altDSIDFromAuthenticationResponseDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("altDsPersonId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (BOOL)backingAccountIsDemoAccount:(id)a3
{
  return objc_msgSend(a3, "ams_isDemoAccount");
}

+ (id)creditsStringFromAuthenticationResponseDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("creditDisplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)DSIDFromAuthenticationResponseDictionary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("dsPersonId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)firstNameFromAuthenticationResponseDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "valueForKeyPath:", CFSTR("accountInfo.address.firstName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)getITunesMatchStatusWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SSXPCConnection *v17;
  xpc_object_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v24 = 136446210;
      v25 = "-[SSAccount getITunesMatchStatusWithCompletionBlock:]";
      LODWORD(v21) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v24, v21);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v18 = SSXPCCreateMessageDictionary(130);
  -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v18, "1", v19);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__SSAccount_getITunesMatchStatusWithCompletionBlock___block_invoke;
  v22[3] = &unk_1E47BAB40;
  v23 = v4;
  v20 = v4;
  -[SSXPCConnection sendMessage:withReply:](v17, "sendMessage:withReply:", v18, v22);

}

void __53__SSAccount_getITunesMatchStatusWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int64_t int64;
  uint64_t v7;
  id v8;
  void *v9;
  xpc_object_t xdict;

  v3 = a2;
  xdict = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v4 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A85863E4](v3) != MEMORY[0x1E0C812F8])
  {
    v4 = 111;
LABEL_6:
    SSError((uint64_t)CFSTR("SSErrorDomain"), v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    int64 = 0;
    goto LABEL_7;
  }
  v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(xdict, "1");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v8, "initWithXPCEncoding:", v9);

  int64 = xpc_dictionary_get_int64(xdict, "0");
LABEL_7:
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, int64_t, void *))(v7 + 16))(v7, int64, v5);

}

- (void)getKeybagSyncDataWithType:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  xpc_object_t v19;
  void *v20;
  SSXPCConnection *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      v11 = v9;
    else
      v11 = v9 & 2;
    if (v11)
    {
      v26 = 136446210;
      v27 = "-[SSAccount getKeybagSyncDataWithType:completionHandler:]";
      LODWORD(v23) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v26, v23);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19 = SSXPCCreateMessageDictionary(139);
  xpc_dictionary_set_int64(v19, "1", a3);
  -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v19, "2", v20);

  v21 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__SSAccount_getKeybagSyncDataWithType_completionHandler___block_invoke;
  v24[3] = &unk_1E47BAB40;
  v25 = v6;
  v22 = v6;
  -[SSXPCConnection sendMessage:withReply:](v21, "sendMessage:withReply:", v19, v24);

}

void __57__SSAccount_getKeybagSyncDataWithType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t xdict;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    xdict = v3;
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v8 = 0;
    }
    else
    {
      v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(xdict, "2");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "initWithXPCEncoding:", v5);

      v7 = objc_opt_class();
      v8 = SSXPCDictionaryCopyObjectWithClass(xdict, "1", v7);
    }
    if (!(v8 | v6))
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = xdict;
  }

}

- (id)hashedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v21.receiver = self;
  v21.super_class = (Class)SSAccount;
  -[SSAccount description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SSAccount isLocalAccount](self, "isLocalAccount"))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR(" Local Account"));
  }
  else
  {
    -[SSAccount altDSID](self, "altDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded(v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount accountName](self, "accountName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount backingAccount](self, "backingAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SSAccount accountScope](self, "accountScope");
    if (-[SSAccount isActive](self, "isActive"))
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    if (-[SSAccount isAuthenticated](self, "isAuthenticated"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    objc_msgSend(v5, "appendFormat:", CFSTR(" altDSID = %@ | DSID = %@ | username = %@ | backingIdentifier = %@ | scope = %ld | active = %@ | authenticated = %@"), v17, v16, v7, v9, v10, v11, v12);

  }
  -[SSAccount storeFrontIdentifier](self, "storeFrontIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" | storefront = %@>"), v14);

  return v5;
}

+ (BOOL)isManagedAppleIDFromAuthenticationResponseDictionary:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isManagedStudent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)isNewCustomerFromAuthenticationResponseDictionary:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("newCustomer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (id)lastNameFromAuthenticationResponseDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "valueForKeyPath:", CFSTR("accountInfo.address.lastName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)removeAvailableServiceTypes:(int64_t)a3
{
  -[SSAccount _removeAccountPropertyBitmask:forKey:](self, "_removeAccountPropertyBitmask:forKey:", a3, CFSTR("availableServiceTypes"));
}

- (void)removeEnabledServiceTypes:(int64_t)a3
{
  -[SSAccount _removeAccountPropertyBitmask:forKey:](self, "_removeAccountPropertyBitmask:forKey:", a3, CFSTR("enabledServiceTypes"));
}

- (void)resetTransientData
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[SSAccount setAuthenticated:](self, "setAuthenticated:", 0);
  -[SSAccount setPasswordEquivalentToken:](self, "setPasswordEquivalentToken:", 0);
  -[SSAccount setRawPassword:](self, "setRawPassword:", 0);
  -[SSAccount setSecureToken:](self, "setSecureToken:", 0);
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v4 = objc_msgSend(v3, "saveAccount:verifyCredentials:error:", self, 0, &v21);
  v5 = v21;

  if ((v4 & 1) == 0)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      -[SSAccount hashedDescription](self, "hashedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v10;
      v24 = 2114;
      v25 = v12;
      v26 = 2114;
      v27 = v5;
      LODWORD(v20) = 32;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v22, v20);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v6, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v9);
    }

    goto LABEL_13;
  }
LABEL_14:

}

+ (id)secureTokenForIdentifier:(id)a3
{
  id v3;
  __CFDictionary *Mutable;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CFTypeRef result;
  int v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = objc_msgSend(v23, "shouldLog");
    if (objc_msgSend(v23, "shouldLogToDisk"))
      v25 = v24 | 2;
    else
      v25 = v24;
    objc_msgSend(v23, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      v25 &= 2u;
    if (v25)
    {
      v49 = 138543362;
      v50 = (id)objc_opt_class();
      v27 = v50;
      LODWORD(v47) = 12;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_27:

        v22 = 0;
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v28, 4, &v49, v47);
      v26 = objc_claimAutoreleasedReturnValue();
      free(v28);
      SSFileLog(v23, CFSTR("%@"), v29, v30, v31, v32, v33, v34, (uint64_t)v26);
    }

    goto LABEL_27;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v3);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], CFSTR("com.apple.itunesstored.token"));
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
  result = 0;
  v5 = SecItemCopyMatching(Mutable, &result);
  v6 = (void *)result;
  if ((_DWORD)v5 || !objc_msgSend((id)result, "length"))
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v11 = (void *)objc_opt_class();
      v12 = (void *)MEMORY[0x1E0CB37E8];
      v13 = v11;
      objc_msgSend(v12, "numberWithInt:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 138543618;
      v50 = v11;
      v51 = 2114;
      v52 = v14;
      LODWORD(v47) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
        v22 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v49, v47);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v7, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v10);
    }
    v22 = 0;
  }
  else
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v36 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v37 = v36 | 2;
    else
      v37 = v36;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v37 &= 2u;
    if (v37)
    {
      v38 = (void *)objc_opt_class();
      v49 = 138543362;
      v50 = v38;
      v39 = v38;
      LODWORD(v47) = 12;
      v40 = (void *)_os_log_send_and_compose_impl();

      if (!v40)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v40, 4, &v49, v47);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v40);
      SSFileLog(v7, CFSTR("%@"), v41, v42, v43, v44, v45, v46, (uint64_t)v10);
    }
  }

LABEL_15:
  CFRelease(Mutable);

LABEL_28:
  return v22;
}

- (void)setEligibility:(id)a3 forServiceType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__SSAccount_setEligibility_forServiceType___block_invoke;
  v9[3] = &unk_1E47BAB68;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a4;
  v10 = v6;
  v8 = v6;
  dispatch_barrier_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __43__SSAccount_setEligibility_forServiceType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPropertyForKey:", CFSTR("eligibleServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v3);
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);
  else
    objc_msgSend(v5, "removeObjectForKey:", v6);
  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }
  objc_msgSend(WeakRetained, "_backingAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountProperty:forKey:", v5, CFSTR("eligibleServices"));

}

- (void)setPrivacyAcknowledgement:(id)a3
{
  -[SSAccount _setAccountProperty:forKey:](self, "_setAccountProperty:forKey:", a3, CFSTR("privacyAcknowledgement"));
}

+ (id)storeFrontIdentifierFromURLResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("X-Set-Apple-Store-Front");
  v4 = a3;
  objc_msgSend(CFSTR("X-Set-Apple-Store-Front"), "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v12[2] = CFSTR("X-Apple-Request-Store-Front");
  v12[3] = CFSTR("x-apple-request-store-front");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allHeaderFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_valueForFirstAvailableKeyPath:inDictionary:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (id)copyLockdownRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  id v29;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SSAccount altDSID](self, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("AltDSID"));
  -[SSAccount creditsString](self, "creditsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("CreditDisplayString"));
  -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("DSPersonID"));
  -[SSAccount accountName](self, "accountName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("AppleID"));
  -[SSAccount ITunesPassSerialNumber](self, "ITunesPassSerialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("AccountITunesPassSerial"));
  -[SSAccount storeFrontIdentifier](self, "storeFrontIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("AccountStoreFront"));
  -[SSAccount firstName](self, "firstName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("FirstName"));
  -[SSAccount lastName](self, "lastName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("LastName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SSAccount accountKind](self, "accountKind"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("AccountKind"));

  if (-[SSAccount accountScope](self, "accountScope") == 1)
    v13 = CFSTR("sandbox");
  else
    v13 = CFSTR("production");
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("AccountURLBagType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SSAccount availableServiceTypes](self, "availableServiceTypes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("AccountAvailableServiceTypes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SSAccount enabledServiceTypes](self, "enabledServiceTypes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("AccountServiceTypes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SSAccount freeDownloadsPasswordSetting](self, "freeDownloadsPasswordSetting"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("AccountFreeDownloadsPasswordSetting"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SSAccount paidPurchasesPasswordSetting](self, "paidPurchasesPasswordSetting"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("AccountPaidPurchasesPasswordSetting"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSAccount isNewCustomer](self, "isNewCustomer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("AccountIsNewCustomer"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSAccount didFallbackToPassword](self, "didFallbackToPassword"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("DidFallbackToPassword"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSAccount isSocialEnabled](self, "isSocialEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("AccountSocialEnabled"));

  if (-[SSAccount accountSource](self, "accountSource") == 1)
    v21 = CFSTR("iTunes");
  else
    v21 = CFSTR("device");
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("AccountSource"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSAccount isManagedAppleID](self, "isManagedAppleID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("AccountIsManagedAppleID"));

  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __39__SSAccount_copyLockdownRepresentation__block_invoke;
  v28[3] = &unk_1E47B8768;
  v28[4] = self;
  v24 = v3;
  v29 = v24;
  dispatch_sync(v23, v28);

  v25 = v29;
  v26 = v24;

  return v26;
}

void __39__SSAccount_copyLockdownRepresentation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPropertyForKey:", CFSTR("eligibleServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSAccount_copyLockdownRepresentation__block_invoke_2;
  v4[3] = &unk_1E47B89D8;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __39__SSAccount_copyLockdownRepresentation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(a3, "BOOLValue"))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "integerValue");
    SSVLockdownAccountServiceEligibilityKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v6);

  }
}

- (BOOL)mergeValuesFromAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  int v34;
  int v35;
  NSObject *v36;
  int v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  int v56;
  int v57;
  NSObject *v58;
  int v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  int v78;
  int v79;
  NSObject *v80;
  int v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  int v100;
  int v101;
  NSObject *v102;
  int v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  char v120;
  void *v121;
  int v122;
  int v123;
  NSObject *v124;
  int v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  char v142;
  void *v143;
  int v144;
  int v145;
  NSObject *v146;
  int v147;
  id v148;
  void *v149;
  id v150;
  void *v151;
  id v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  char v164;
  void *v165;
  int v166;
  int v167;
  NSObject *v168;
  int v169;
  id v170;
  void *v171;
  id v172;
  void *v173;
  id v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  void *v184;
  void *v185;
  char v186;
  void *v187;
  int v188;
  int v189;
  NSObject *v190;
  int v191;
  id v192;
  void *v193;
  id v194;
  void *v195;
  id v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  int v205;
  int v206;
  NSObject *v207;
  int v208;
  id v209;
  void *v210;
  id v211;
  void *v212;
  id v213;
  void *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int64_t v221;
  void *v222;
  int v223;
  int v224;
  NSObject *v225;
  int v226;
  id v227;
  void *v228;
  id v229;
  void *v230;
  id v231;
  void *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  int64_t v239;
  void *v240;
  int v241;
  int v242;
  NSObject *v243;
  int v244;
  id v245;
  void *v246;
  id v247;
  void *v248;
  id v249;
  void *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  int64_t v257;
  void *v258;
  int v259;
  int v260;
  NSObject *v261;
  int v262;
  id v263;
  void *v264;
  id v265;
  void *v266;
  id v267;
  void *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  int v275;
  void *v276;
  int v277;
  int v278;
  NSObject *v279;
  int v280;
  id v281;
  void *v282;
  id v283;
  void *v284;
  id v285;
  void *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  int64_t v293;
  void *v294;
  int v295;
  int v296;
  NSObject *v297;
  int v298;
  id v299;
  void *v300;
  id v301;
  void *v302;
  id v303;
  void *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  int v311;
  void *v312;
  int v313;
  int v314;
  NSObject *v315;
  int v316;
  id v317;
  void *v318;
  id v319;
  void *v320;
  id v321;
  void *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  int v329;
  void *v330;
  int v331;
  int v332;
  NSObject *v333;
  int v334;
  id v335;
  void *v336;
  id v337;
  void *v338;
  id v339;
  void *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  int64_t v347;
  void *v348;
  int v349;
  int v350;
  NSObject *v351;
  int v352;
  id v353;
  void *v354;
  id v355;
  void *v356;
  id v357;
  void *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  int v367;
  int v368;
  NSObject *v369;
  int v370;
  id v371;
  void *v372;
  id v373;
  void *v374;
  id v375;
  void *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  void *v384;
  int v385;
  NSObject *v386;
  int v387;
  id v388;
  void *v389;
  id v390;
  void *v391;
  id v392;
  void *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  void *v400;
  int v401;
  void *v402;
  int v403;
  void *v404;
  int v405;
  NSObject *v406;
  int v407;
  id v408;
  void *v409;
  id v410;
  void *v411;
  id v412;
  void *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  int *v421;
  int *v422;
  int *v423;
  int *v424;
  int *v425;
  int *v426;
  int *v427;
  int *v428;
  int *v429;
  int *v430;
  int *v431;
  int *v432;
  int *v433;
  int *v434;
  int *v435;
  int *v436;
  int *v437;
  int *v438;
  int *v439;
  uint64_t v440;
  void *v441;
  void *v442;
  int v443;
  id v444;
  __int16 v445;
  id v446;
  __int16 v447;
  id v448;
  uint64_t v449;

  v449 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "creditsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v442 = v4;
  if (v5)
  {
    -[SSAccount creditsString](self, "creditsString");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {

    }
    else
    {
      v7 = (void *)v6;
      -[SSAccount creditsString](self, "creditsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v5, "isEqual:", v8);

      if ((v9 & 1) == 0)
      {
        +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v11 = objc_msgSend(v10, "shouldLog");
        if (objc_msgSend(v10, "shouldLogToDisk"))
          v12 = v11 | 2;
        else
          v12 = v11;
        objc_msgSend(v10, "OSLogObject");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          v14 = v12;
        else
          v14 = v12 & 2;
        if (v14)
        {
          v15 = (id)objc_opt_class();
          -[SSAccount accountName](self, "accountName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          SSHashIfNeeded(v16);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "accountName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          SSHashIfNeeded(v18);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v443 = 138543874;
          v444 = v15;
          v445 = 2114;
          v446 = v17;
          v447 = 2114;
          v448 = v19;
          LODWORD(v440) = 32;
          v421 = &v443;
          v20 = (void *)_os_log_send_and_compose_impl();

          v4 = v442;
          if (!v20)
          {
LABEL_16:

            -[SSAccount setCreditsString:](self, "setCreditsString:", v5);
            v27 = 1;
            goto LABEL_19;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v443, v440);
          v13 = objc_claimAutoreleasedReturnValue();
          free(v20);
          SSFileLog(v10, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v13);
        }

        goto LABEL_16;
      }
    }
  }
  v27 = 0;
LABEL_19:
  objc_msgSend(v4, "uniqueIdentifier", v421);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
    goto LABEL_36;
  -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v28 != (void *)v29)
  {
    v30 = (void *)v29;
    -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v28, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_36;
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34 = objc_msgSend(v33, "shouldLog");
    if (objc_msgSend(v33, "shouldLogToDisk"))
      v35 = v34 | 2;
    else
      v35 = v34;
    objc_msgSend(v33, "OSLogObject");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      v37 = v35;
    else
      v37 = v35 & 2;
    if (v37)
    {
      v38 = (id)objc_opt_class();
      -[SSAccount accountName](self, "accountName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v39);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountName");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v41);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v443 = 138543874;
      v444 = v38;
      v445 = 2114;
      v446 = v40;
      v447 = 2114;
      v448 = v42;
      LODWORD(v440) = 32;
      v422 = &v443;
      v43 = (void *)_os_log_send_and_compose_impl();

      v4 = v442;
      if (!v43)
      {
LABEL_34:

        -[SSAccount setUniqueIdentifier:](self, "setUniqueIdentifier:", v28);
        v27 = 1;
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4, &v443, v440);
      v36 = objc_claimAutoreleasedReturnValue();
      free(v43);
      SSFileLog(v33, CFSTR("%@"), v44, v45, v46, v47, v48, v49, (uint64_t)v36);
    }

    goto LABEL_34;
  }

LABEL_36:
  objc_msgSend(v4, "accountName", v422);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
    goto LABEL_53;
  -[SSAccount accountName](self, "accountName");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v50 != (void *)v51)
  {
    v52 = (void *)v51;
    -[SSAccount accountName](self, "accountName");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v50, "isEqual:", v53);

    if ((v54 & 1) != 0)
      goto LABEL_53;
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v55)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v56 = objc_msgSend(v55, "shouldLog");
    if (objc_msgSend(v55, "shouldLogToDisk"))
      v57 = v56 | 2;
    else
      v57 = v56;
    objc_msgSend(v55, "OSLogObject");
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      v59 = v57;
    else
      v59 = v57 & 2;
    if (v59)
    {
      v60 = (id)objc_opt_class();
      -[SSAccount accountName](self, "accountName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v61);
      v62 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountName");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v63);
      v64 = (id)objc_claimAutoreleasedReturnValue();
      v443 = 138543874;
      v444 = v60;
      v445 = 2114;
      v446 = v62;
      v447 = 2114;
      v448 = v64;
      LODWORD(v440) = 32;
      v423 = &v443;
      v65 = (void *)_os_log_send_and_compose_impl();

      v4 = v442;
      if (!v65)
      {
LABEL_51:

        -[SSAccount setAccountName:](self, "setAccountName:", v50);
        v27 = 1;
        goto LABEL_53;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v65, 4, &v443, v440);
      v58 = objc_claimAutoreleasedReturnValue();
      free(v65);
      SSFileLog(v55, CFSTR("%@"), v66, v67, v68, v69, v70, v71, (uint64_t)v58);
    }

    goto LABEL_51;
  }

LABEL_53:
  objc_msgSend(v4, "altDSID", v423);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v72)
    goto LABEL_70;
  -[SSAccount altDSID](self, "altDSID");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v72 != (void *)v73)
  {
    v74 = (void *)v73;
    -[SSAccount altDSID](self, "altDSID");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v72, "isEqual:", v75);

    if ((v76 & 1) != 0)
      goto LABEL_70;
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v77)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v78 = objc_msgSend(v77, "shouldLog");
    if (objc_msgSend(v77, "shouldLogToDisk"))
      v79 = v78 | 2;
    else
      v79 = v78;
    objc_msgSend(v77, "OSLogObject");
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      v81 = v79;
    else
      v81 = v79 & 2;
    if (v81)
    {
      v82 = (id)objc_opt_class();
      -[SSAccount accountName](self, "accountName");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v83);
      v84 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountName");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v85);
      v86 = (id)objc_claimAutoreleasedReturnValue();
      v443 = 138543874;
      v444 = v82;
      v445 = 2114;
      v446 = v84;
      v447 = 2114;
      v448 = v86;
      LODWORD(v440) = 32;
      v424 = &v443;
      v87 = (void *)_os_log_send_and_compose_impl();

      v4 = v442;
      if (!v87)
      {
LABEL_68:

        -[SSAccount setAltDSID:](self, "setAltDSID:", v72);
        v27 = 1;
        goto LABEL_70;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v87, 4, &v443, v440);
      v80 = objc_claimAutoreleasedReturnValue();
      free(v87);
      SSFileLog(v77, CFSTR("%@"), v88, v89, v90, v91, v92, v93, (uint64_t)v80);
    }

    goto LABEL_68;
  }

LABEL_70:
  objc_msgSend(v4, "ITunesPassSerialNumber", v424);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v94)
    goto LABEL_87;
  -[SSAccount ITunesPassSerialNumber](self, "ITunesPassSerialNumber");
  v95 = objc_claimAutoreleasedReturnValue();
  if (v94 != (void *)v95)
  {
    v96 = (void *)v95;
    -[SSAccount ITunesPassSerialNumber](self, "ITunesPassSerialNumber");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v94, "isEqual:", v97);

    if ((v98 & 1) != 0)
      goto LABEL_87;
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v99)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v100 = objc_msgSend(v99, "shouldLog");
    if (objc_msgSend(v99, "shouldLogToDisk"))
      v101 = v100 | 2;
    else
      v101 = v100;
    objc_msgSend(v99, "OSLogObject");
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      v103 = v101;
    else
      v103 = v101 & 2;
    if (v103)
    {
      v104 = (id)objc_opt_class();
      -[SSAccount accountName](self, "accountName");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v105);
      v106 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountName");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v107);
      v108 = (id)objc_claimAutoreleasedReturnValue();
      v443 = 138543874;
      v444 = v104;
      v445 = 2114;
      v446 = v106;
      v447 = 2114;
      v448 = v108;
      LODWORD(v440) = 32;
      v425 = &v443;
      v109 = (void *)_os_log_send_and_compose_impl();

      v4 = v442;
      if (!v109)
      {
LABEL_85:

        -[SSAccount setITunesPassSerialNumber:](self, "setITunesPassSerialNumber:", v94);
        v27 = 1;
        goto LABEL_87;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v109, 4, &v443, v440);
      v102 = objc_claimAutoreleasedReturnValue();
      free(v109);
      SSFileLog(v99, CFSTR("%@"), v110, v111, v112, v113, v114, v115, (uint64_t)v102);
    }

    goto LABEL_85;
  }

LABEL_87:
  objc_msgSend(v4, "secureToken", v425);
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v116)
    goto LABEL_104;
  -[SSAccount secureToken](self, "secureToken");
  v117 = objc_claimAutoreleasedReturnValue();
  if (v116 != (void *)v117)
  {
    v118 = (void *)v117;
    -[SSAccount secureToken](self, "secureToken");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v116, "isEqual:", v119);

    if ((v120 & 1) != 0)
      goto LABEL_104;
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v121)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v122 = objc_msgSend(v121, "shouldLog");
    if (objc_msgSend(v121, "shouldLogToDisk"))
      v123 = v122 | 2;
    else
      v123 = v122;
    objc_msgSend(v121, "OSLogObject");
    v124 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      v125 = v123;
    else
      v125 = v123 & 2;
    if (v125)
    {
      v126 = (id)objc_opt_class();
      -[SSAccount accountName](self, "accountName");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v127);
      v128 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountName");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v129);
      v130 = (id)objc_claimAutoreleasedReturnValue();
      v443 = 138543874;
      v444 = v126;
      v445 = 2114;
      v446 = v128;
      v447 = 2114;
      v448 = v130;
      LODWORD(v440) = 32;
      v426 = &v443;
      v131 = (void *)_os_log_send_and_compose_impl();

      v4 = v442;
      if (!v131)
      {
LABEL_102:

        -[SSAccount setSecureToken:](self, "setSecureToken:", v116);
        v27 = 1;
        goto LABEL_104;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v131, 4, &v443, v440);
      v124 = objc_claimAutoreleasedReturnValue();
      free(v131);
      SSFileLog(v121, CFSTR("%@"), v132, v133, v134, v135, v136, v137, (uint64_t)v124);
    }

    goto LABEL_102;
  }

LABEL_104:
  objc_msgSend(v4, "storeFrontIdentifier", v426);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v138)
    goto LABEL_121;
  -[SSAccount storeFrontIdentifier](self, "storeFrontIdentifier");
  v139 = objc_claimAutoreleasedReturnValue();
  if (v138 != (void *)v139)
  {
    v140 = (void *)v139;
    -[SSAccount storeFrontIdentifier](self, "storeFrontIdentifier");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v138, "isEqual:", v141);

    if ((v142 & 1) != 0)
      goto LABEL_121;
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v143)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v144 = objc_msgSend(v143, "shouldLog");
    if (objc_msgSend(v143, "shouldLogToDisk"))
      v145 = v144 | 2;
    else
      v145 = v144;
    objc_msgSend(v143, "OSLogObject");
    v146 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
      v147 = v145;
    else
      v147 = v145 & 2;
    if (v147)
    {
      v148 = (id)objc_opt_class();
      -[SSAccount accountName](self, "accountName");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v149);
      v150 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountName");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v151);
      v152 = (id)objc_claimAutoreleasedReturnValue();
      v443 = 138543874;
      v444 = v148;
      v445 = 2114;
      v446 = v150;
      v447 = 2114;
      v448 = v152;
      LODWORD(v440) = 32;
      v427 = &v443;
      v153 = (void *)_os_log_send_and_compose_impl();

      v4 = v442;
      if (!v153)
      {
LABEL_119:

        -[SSAccount setStoreFrontIdentifier:](self, "setStoreFrontIdentifier:", v138);
        v27 = 1;
        goto LABEL_121;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v153, 4, &v443, v440);
      v146 = objc_claimAutoreleasedReturnValue();
      free(v153);
      SSFileLog(v143, CFSTR("%@"), v154, v155, v156, v157, v158, v159, (uint64_t)v146);
    }

    goto LABEL_119;
  }

LABEL_121:
  objc_msgSend(v4, "firstName", v427);
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v160)
    goto LABEL_138;
  -[SSAccount firstName](self, "firstName");
  v161 = objc_claimAutoreleasedReturnValue();
  if (v160 != (void *)v161)
  {
    v162 = (void *)v161;
    -[SSAccount firstName](self, "firstName");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = objc_msgSend(v160, "isEqual:", v163);

    if ((v164 & 1) != 0)
      goto LABEL_138;
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v165)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v166 = objc_msgSend(v165, "shouldLog");
    if (objc_msgSend(v165, "shouldLogToDisk"))
      v167 = v166 | 2;
    else
      v167 = v166;
    objc_msgSend(v165, "OSLogObject");
    v168 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
      v169 = v167;
    else
      v169 = v167 & 2;
    if (v169)
    {
      v170 = (id)objc_opt_class();
      -[SSAccount accountName](self, "accountName");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v171);
      v172 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountName");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v173);
      v174 = (id)objc_claimAutoreleasedReturnValue();
      v443 = 138543874;
      v444 = v170;
      v445 = 2114;
      v446 = v172;
      v447 = 2114;
      v448 = v174;
      LODWORD(v440) = 32;
      v428 = &v443;
      v175 = (void *)_os_log_send_and_compose_impl();

      v4 = v442;
      if (!v175)
      {
LABEL_136:

        -[SSAccount setFirstName:](self, "setFirstName:", v160);
        v27 = 1;
        goto LABEL_138;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v175, 4, &v443, v440);
      v168 = objc_claimAutoreleasedReturnValue();
      free(v175);
      SSFileLog(v165, CFSTR("%@"), v176, v177, v178, v179, v180, v181, (uint64_t)v168);
    }

    goto LABEL_136;
  }

LABEL_138:
  objc_msgSend(v4, "lastName", v428);
  v182 = (void *)objc_claimAutoreleasedReturnValue();

  v441 = v182;
  if (!v182)
    goto LABEL_155;
  -[SSAccount lastName](self, "lastName");
  v183 = objc_claimAutoreleasedReturnValue();
  if (v182 == (void *)v183)
  {

    goto LABEL_155;
  }
  v184 = (void *)v183;
  -[SSAccount lastName](self, "lastName");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = objc_msgSend(v182, "isEqual:", v185);

  if ((v186 & 1) != 0)
    goto LABEL_155;
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v187)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v188 = objc_msgSend(v187, "shouldLog");
  if (objc_msgSend(v187, "shouldLogToDisk"))
    v189 = v188 | 2;
  else
    v189 = v188;
  objc_msgSend(v187, "OSLogObject");
  v190 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
    v191 = v189;
  else
    v191 = v189 & 2;
  if (!v191)
    goto LABEL_153;
  v192 = (id)objc_opt_class();
  -[SSAccount accountName](self, "accountName");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v193);
  v194 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountName");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v195);
  v196 = (id)objc_claimAutoreleasedReturnValue();
  v443 = 138543874;
  v444 = v192;
  v445 = 2114;
  v446 = v194;
  v447 = 2114;
  v448 = v196;
  LODWORD(v440) = 32;
  v429 = &v443;
  v197 = (void *)_os_log_send_and_compose_impl();

  v4 = v442;
  v182 = v441;
  if (v197)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v197, 4, &v443, v440);
    v190 = objc_claimAutoreleasedReturnValue();
    free(v197);
    SSFileLog(v187, CFSTR("%@"), v198, v199, v200, v201, v202, v203, (uint64_t)v190);
LABEL_153:

  }
  -[SSAccount setLastName:](self, "setLastName:", v182);
  v27 = 1;
LABEL_155:
  if (!objc_msgSend(v4, "isActiveLockerAccount", v429))
    goto LABEL_170;
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v204)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v205 = objc_msgSend(v204, "shouldLog");
  if (objc_msgSend(v204, "shouldLogToDisk"))
    v206 = v205 | 2;
  else
    v206 = v205;
  objc_msgSend(v204, "OSLogObject");
  v207 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
    v208 = v206;
  else
    v208 = v206 & 2;
  if (!v208)
  {
    v182 = v441;
    goto LABEL_168;
  }
  v209 = (id)objc_opt_class();
  -[SSAccount accountName](self, "accountName");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v210);
  v211 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountName");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v212);
  v213 = (id)objc_claimAutoreleasedReturnValue();
  v443 = 138543874;
  v444 = v209;
  v445 = 2114;
  v446 = v211;
  v447 = 2114;
  v448 = v213;
  LODWORD(v440) = 32;
  v430 = &v443;
  v214 = (void *)_os_log_send_and_compose_impl();

  v4 = v442;
  v182 = v441;
  if (v214)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v214, 4, &v443, v440);
    v207 = objc_claimAutoreleasedReturnValue();
    free(v214);
    SSFileLog(v204, CFSTR("%@"), v215, v216, v217, v218, v219, v220, (uint64_t)v207);
LABEL_168:

  }
  v27 = 1;
  -[SSAccount setActiveLockerAccount:](self, "setActiveLockerAccount:", 1);
LABEL_170:
  if (v4)
  {
    v221 = -[SSAccount accountKind](self, "accountKind");
    if (v221 == objc_msgSend(v4, "accountKind"))
      goto LABEL_185;
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v222)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v223 = objc_msgSend(v222, "shouldLog", v430);
    if (objc_msgSend(v222, "shouldLogToDisk"))
      v224 = v223 | 2;
    else
      v224 = v223;
    objc_msgSend(v222, "OSLogObject");
    v225 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
      v226 = v224;
    else
      v226 = v224 & 2;
    if (v226)
    {
      v227 = (id)objc_opt_class();
      -[SSAccount accountName](self, "accountName");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v228);
      v229 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountName");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v230);
      v231 = (id)objc_claimAutoreleasedReturnValue();
      v443 = 138543874;
      v444 = v227;
      v445 = 2114;
      v446 = v229;
      v447 = 2114;
      v448 = v231;
      LODWORD(v440) = 32;
      v430 = &v443;
      v232 = (void *)_os_log_send_and_compose_impl();

      v4 = v442;
      if (!v232)
      {
LABEL_184:

        -[SSAccount setAccountKind:](self, "setAccountKind:", objc_msgSend(v4, "accountKind"));
        v27 = 1;
LABEL_185:
        v239 = -[SSAccount accountScope](self, "accountScope", v430);
        if (v239 == objc_msgSend(v4, "accountScope"))
          goto LABEL_199;
        +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v240)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v241 = objc_msgSend(v240, "shouldLog");
        if (objc_msgSend(v240, "shouldLogToDisk"))
          v242 = v241 | 2;
        else
          v242 = v241;
        objc_msgSend(v240, "OSLogObject");
        v243 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
          v244 = v242;
        else
          v244 = v242 & 2;
        if (v244)
        {
          v245 = (id)objc_opt_class();
          -[SSAccount accountName](self, "accountName");
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          SSHashIfNeeded(v246);
          v247 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "accountName");
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          SSHashIfNeeded(v248);
          v249 = (id)objc_claimAutoreleasedReturnValue();
          v443 = 138543874;
          v444 = v245;
          v445 = 2114;
          v446 = v247;
          v447 = 2114;
          v448 = v249;
          LODWORD(v440) = 32;
          v431 = &v443;
          v250 = (void *)_os_log_send_and_compose_impl();

          v4 = v442;
          if (!v250)
          {
LABEL_198:

            -[SSAccount setAccountScope:](self, "setAccountScope:", objc_msgSend(v4, "accountScope"));
            v27 = 1;
LABEL_199:
            v257 = -[SSAccount accountSource](self, "accountSource", v431);
            if (v257 == objc_msgSend(v4, "accountSource"))
              goto LABEL_213;
            +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v258)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v258 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v259 = objc_msgSend(v258, "shouldLog");
            if (objc_msgSend(v258, "shouldLogToDisk"))
              v260 = v259 | 2;
            else
              v260 = v259;
            objc_msgSend(v258, "OSLogObject");
            v261 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT))
              v262 = v260;
            else
              v262 = v260 & 2;
            if (v262)
            {
              v263 = (id)objc_opt_class();
              -[SSAccount accountName](self, "accountName");
              v264 = (void *)objc_claimAutoreleasedReturnValue();
              SSHashIfNeeded(v264);
              v265 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "accountName");
              v266 = (void *)objc_claimAutoreleasedReturnValue();
              SSHashIfNeeded(v266);
              v267 = (id)objc_claimAutoreleasedReturnValue();
              v443 = 138543874;
              v444 = v263;
              v445 = 2114;
              v446 = v265;
              v447 = 2114;
              v448 = v267;
              LODWORD(v440) = 32;
              v432 = &v443;
              v268 = (void *)_os_log_send_and_compose_impl();

              v4 = v442;
              if (!v268)
              {
LABEL_212:

                -[SSAccount setAccountSource:](self, "setAccountSource:", objc_msgSend(v4, "accountSource"));
                v27 = 1;
LABEL_213:
                v275 = -[SSAccount didFallbackToPassword](self, "didFallbackToPassword", v432);
                if (v275 == objc_msgSend(v4, "didFallbackToPassword"))
                  goto LABEL_227;
                +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
                v276 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v276)
                {
                  +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                  v276 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v277 = objc_msgSend(v276, "shouldLog");
                if (objc_msgSend(v276, "shouldLogToDisk"))
                  v278 = v277 | 2;
                else
                  v278 = v277;
                objc_msgSend(v276, "OSLogObject");
                v279 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v279, OS_LOG_TYPE_DEFAULT))
                  v280 = v278;
                else
                  v280 = v278 & 2;
                if (v280)
                {
                  v281 = (id)objc_opt_class();
                  -[SSAccount accountName](self, "accountName");
                  v282 = (void *)objc_claimAutoreleasedReturnValue();
                  SSHashIfNeeded(v282);
                  v283 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "accountName");
                  v284 = (void *)objc_claimAutoreleasedReturnValue();
                  SSHashIfNeeded(v284);
                  v285 = (id)objc_claimAutoreleasedReturnValue();
                  v443 = 138543874;
                  v444 = v281;
                  v445 = 2114;
                  v446 = v283;
                  v447 = 2114;
                  v448 = v285;
                  LODWORD(v440) = 32;
                  v433 = &v443;
                  v286 = (void *)_os_log_send_and_compose_impl();

                  v4 = v442;
                  if (!v286)
                  {
LABEL_226:

                    -[SSAccount setDidFallbackToPassword:](self, "setDidFallbackToPassword:", objc_msgSend(v4, "didFallbackToPassword"));
                    v27 = 1;
LABEL_227:
                    v293 = -[SSAccount freeDownloadsPasswordSetting](self, "freeDownloadsPasswordSetting", v433);
                    if (v293 == objc_msgSend(v4, "freeDownloadsPasswordSetting"))
                      goto LABEL_241;
                    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
                    v294 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v294)
                    {
                      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                      v294 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    v295 = objc_msgSend(v294, "shouldLog");
                    if (objc_msgSend(v294, "shouldLogToDisk"))
                      v296 = v295 | 2;
                    else
                      v296 = v295;
                    objc_msgSend(v294, "OSLogObject");
                    v297 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v297, OS_LOG_TYPE_DEFAULT))
                      v298 = v296;
                    else
                      v298 = v296 & 2;
                    if (v298)
                    {
                      v299 = (id)objc_opt_class();
                      -[SSAccount accountName](self, "accountName");
                      v300 = (void *)objc_claimAutoreleasedReturnValue();
                      SSHashIfNeeded(v300);
                      v301 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "accountName");
                      v302 = (void *)objc_claimAutoreleasedReturnValue();
                      SSHashIfNeeded(v302);
                      v303 = (id)objc_claimAutoreleasedReturnValue();
                      v443 = 138543874;
                      v444 = v299;
                      v445 = 2114;
                      v446 = v301;
                      v447 = 2114;
                      v448 = v303;
                      LODWORD(v440) = 32;
                      v434 = &v443;
                      v304 = (void *)_os_log_send_and_compose_impl();

                      v4 = v442;
                      if (!v304)
                      {
LABEL_240:

                        -[SSAccount setFreeDownloadsPasswordSetting:](self, "setFreeDownloadsPasswordSetting:", objc_msgSend(v4, "freeDownloadsPasswordSetting"));
                        v27 = 1;
LABEL_241:
                        v311 = -[SSAccount isManagedAppleID](self, "isManagedAppleID", v434);
                        if (v311 == objc_msgSend(v4, "isManagedAppleID"))
                          goto LABEL_255;
                        +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
                        v312 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v312)
                        {
                          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                          v312 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        v313 = objc_msgSend(v312, "shouldLog");
                        if (objc_msgSend(v312, "shouldLogToDisk"))
                          v314 = v313 | 2;
                        else
                          v314 = v313;
                        objc_msgSend(v312, "OSLogObject");
                        v315 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v315, OS_LOG_TYPE_DEFAULT))
                          v316 = v314;
                        else
                          v316 = v314 & 2;
                        if (v316)
                        {
                          v317 = (id)objc_opt_class();
                          -[SSAccount accountName](self, "accountName");
                          v318 = (void *)objc_claimAutoreleasedReturnValue();
                          SSHashIfNeeded(v318);
                          v319 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v4, "accountName");
                          v320 = (void *)objc_claimAutoreleasedReturnValue();
                          SSHashIfNeeded(v320);
                          v321 = (id)objc_claimAutoreleasedReturnValue();
                          v443 = 138543874;
                          v444 = v317;
                          v445 = 2114;
                          v446 = v319;
                          v447 = 2114;
                          v448 = v321;
                          LODWORD(v440) = 32;
                          v435 = &v443;
                          v322 = (void *)_os_log_send_and_compose_impl();

                          v4 = v442;
                          if (!v322)
                          {
LABEL_254:

                            -[SSAccount setManagedAppleID:](self, "setManagedAppleID:", objc_msgSend(v4, "isManagedAppleID"));
                            v27 = 1;
LABEL_255:
                            v329 = -[SSAccount isNewCustomer](self, "isNewCustomer", v435);
                            if (v329 == objc_msgSend(v4, "isNewCustomer"))
                              goto LABEL_269;
                            +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
                            v330 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v330)
                            {
                              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                              v330 = (void *)objc_claimAutoreleasedReturnValue();
                            }
                            v331 = objc_msgSend(v330, "shouldLog");
                            if (objc_msgSend(v330, "shouldLogToDisk"))
                              v332 = v331 | 2;
                            else
                              v332 = v331;
                            objc_msgSend(v330, "OSLogObject");
                            v333 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v333, OS_LOG_TYPE_DEFAULT))
                              v334 = v332;
                            else
                              v334 = v332 & 2;
                            if (v334)
                            {
                              v335 = (id)objc_opt_class();
                              -[SSAccount accountName](self, "accountName");
                              v336 = (void *)objc_claimAutoreleasedReturnValue();
                              SSHashIfNeeded(v336);
                              v337 = (id)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v4, "accountName");
                              v338 = (void *)objc_claimAutoreleasedReturnValue();
                              SSHashIfNeeded(v338);
                              v339 = (id)objc_claimAutoreleasedReturnValue();
                              v443 = 138543874;
                              v444 = v335;
                              v445 = 2114;
                              v446 = v337;
                              v447 = 2114;
                              v448 = v339;
                              LODWORD(v440) = 32;
                              v436 = &v443;
                              v340 = (void *)_os_log_send_and_compose_impl();

                              v4 = v442;
                              if (!v340)
                              {
LABEL_268:

                                -[SSAccount setNewCustomer:](self, "setNewCustomer:", objc_msgSend(v4, "isNewCustomer"));
                                v27 = 1;
LABEL_269:
                                v347 = -[SSAccount paidPurchasesPasswordSetting](self, "paidPurchasesPasswordSetting", v436);
                                if (v347 == objc_msgSend(v4, "paidPurchasesPasswordSetting"))
                                  goto LABEL_283;
                                +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
                                v348 = (void *)objc_claimAutoreleasedReturnValue();
                                if (!v348)
                                {
                                  +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                                  v348 = (void *)objc_claimAutoreleasedReturnValue();
                                }
                                v349 = objc_msgSend(v348, "shouldLog");
                                if (objc_msgSend(v348, "shouldLogToDisk"))
                                  v350 = v349 | 2;
                                else
                                  v350 = v349;
                                objc_msgSend(v348, "OSLogObject");
                                v351 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v351, OS_LOG_TYPE_DEFAULT))
                                  v352 = v350;
                                else
                                  v352 = v350 & 2;
                                if (v352)
                                {
                                  v353 = (id)objc_opt_class();
                                  -[SSAccount accountName](self, "accountName");
                                  v354 = (void *)objc_claimAutoreleasedReturnValue();
                                  SSHashIfNeeded(v354);
                                  v355 = (id)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v4, "accountName");
                                  v356 = (void *)objc_claimAutoreleasedReturnValue();
                                  SSHashIfNeeded(v356);
                                  v357 = (id)objc_claimAutoreleasedReturnValue();
                                  v443 = 138543874;
                                  v444 = v353;
                                  v445 = 2114;
                                  v446 = v355;
                                  v447 = 2114;
                                  v448 = v357;
                                  LODWORD(v440) = 32;
                                  v437 = &v443;
                                  v358 = (void *)_os_log_send_and_compose_impl();

                                  v4 = v442;
                                  if (!v358)
                                  {
LABEL_282:

                                    -[SSAccount setPaidPurchasesPasswordSetting:](self, "setPaidPurchasesPasswordSetting:", objc_msgSend(v4, "paidPurchasesPasswordSetting"));
                                    v27 = 1;
LABEL_283:
                                    v365 = objc_msgSend(v4, "availableServiceTypes", v437);
                                    if (v365 == -[SSAccount availableServiceTypes](self, "availableServiceTypes"))
                                      goto LABEL_297;
                                    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
                                    v366 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (!v366)
                                    {
                                      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                                      v366 = (void *)objc_claimAutoreleasedReturnValue();
                                    }
                                    v367 = objc_msgSend(v366, "shouldLog");
                                    if (objc_msgSend(v366, "shouldLogToDisk"))
                                      v368 = v367 | 2;
                                    else
                                      v368 = v367;
                                    objc_msgSend(v366, "OSLogObject");
                                    v369 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v369, OS_LOG_TYPE_DEFAULT))
                                      v370 = v368;
                                    else
                                      v370 = v368 & 2;
                                    if (v370)
                                    {
                                      v371 = (id)objc_opt_class();
                                      -[SSAccount accountName](self, "accountName");
                                      v372 = (void *)objc_claimAutoreleasedReturnValue();
                                      SSHashIfNeeded(v372);
                                      v373 = (id)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v442, "accountName");
                                      v374 = (void *)objc_claimAutoreleasedReturnValue();
                                      SSHashIfNeeded(v374);
                                      v375 = (id)objc_claimAutoreleasedReturnValue();
                                      v443 = 138543874;
                                      v444 = v371;
                                      v445 = 2114;
                                      v446 = v373;
                                      v447 = 2114;
                                      v448 = v375;
                                      LODWORD(v440) = 32;
                                      v438 = &v443;
                                      v376 = (void *)_os_log_send_and_compose_impl();

                                      if (!v376)
                                      {
LABEL_296:

                                        -[SSAccount setAvailableServiceTypes:](self, "setAvailableServiceTypes:", v365);
                                        v27 = 1;
                                        v4 = v442;
LABEL_297:
                                        v383 = objc_msgSend(v4, "enabledServiceTypes", v438);
                                        if (v383 == -[SSAccount enabledServiceTypes](self, "enabledServiceTypes"))
                                          goto LABEL_310;
                                        +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
                                        v384 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (!v384)
                                        {
                                          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                                          v384 = (void *)objc_claimAutoreleasedReturnValue();
                                        }
                                        v385 = objc_msgSend(v384, "shouldLog");
                                        if (objc_msgSend(v384, "shouldLogToDisk"))
                                          v385 |= 2u;
                                        objc_msgSend(v384, "OSLogObject");
                                        v386 = objc_claimAutoreleasedReturnValue();
                                        if (os_log_type_enabled(v386, OS_LOG_TYPE_DEFAULT))
                                          v387 = v385;
                                        else
                                          v387 = v385 & 2;
                                        if (v387)
                                        {
                                          v388 = (id)objc_opt_class();
                                          -[SSAccount accountName](self, "accountName");
                                          v389 = (void *)objc_claimAutoreleasedReturnValue();
                                          SSHashIfNeeded(v389);
                                          v390 = (id)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v442, "accountName");
                                          v391 = (void *)objc_claimAutoreleasedReturnValue();
                                          SSHashIfNeeded(v391);
                                          v392 = (id)objc_claimAutoreleasedReturnValue();
                                          v443 = 138543874;
                                          v444 = v388;
                                          v445 = 2114;
                                          v446 = v390;
                                          v447 = 2114;
                                          v448 = v392;
                                          LODWORD(v440) = 32;
                                          v439 = &v443;
                                          v393 = (void *)_os_log_send_and_compose_impl();

                                          if (!v393)
                                          {
LABEL_309:

                                            -[SSAccount setEnabledServiceTypes:](self, "setEnabledServiceTypes:", v383);
                                            v27 = 1;
                                            v4 = v442;
LABEL_310:
                                            objc_msgSend(v4, "eligibilityForService:", 0, v439);
                                            v400 = (void *)objc_claimAutoreleasedReturnValue();
                                            v401 = objc_msgSend(v400, "BOOLValue");
                                            -[SSAccount eligibilityForService:](self, "eligibilityForService:", 0);
                                            v402 = (void *)objc_claimAutoreleasedReturnValue();
                                            v403 = objc_msgSend(v402, "BOOLValue");

                                            v182 = v441;
                                            if (v401 == v403)
                                            {
LABEL_323:

                                              goto LABEL_324;
                                            }
                                            +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
                                            v404 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (!v404)
                                            {
                                              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                                              v404 = (void *)objc_claimAutoreleasedReturnValue();
                                            }
                                            v405 = objc_msgSend(v404, "shouldLog");
                                            if (objc_msgSend(v404, "shouldLogToDisk"))
                                              v405 |= 2u;
                                            objc_msgSend(v404, "OSLogObject");
                                            v406 = objc_claimAutoreleasedReturnValue();
                                            if (os_log_type_enabled(v406, OS_LOG_TYPE_DEFAULT))
                                              v407 = v405;
                                            else
                                              v407 = v405 & 2;
                                            if (v407)
                                            {
                                              v408 = (id)objc_opt_class();
                                              -[SSAccount accountName](self, "accountName");
                                              v409 = (void *)objc_claimAutoreleasedReturnValue();
                                              SSHashIfNeeded(v409);
                                              v410 = (id)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v442, "accountName");
                                              v411 = (void *)objc_claimAutoreleasedReturnValue();
                                              SSHashIfNeeded(v411);
                                              v412 = (id)objc_claimAutoreleasedReturnValue();
                                              v443 = 138543874;
                                              v444 = v408;
                                              v445 = 2114;
                                              v446 = v410;
                                              v447 = 2114;
                                              v448 = v412;
                                              LODWORD(v440) = 32;
                                              v413 = (void *)_os_log_send_and_compose_impl();

                                              v182 = v441;
                                              if (!v413)
                                              {
LABEL_322:

                                                -[SSAccount setEligibility:forServiceType:](self, "setEligibility:forServiceType:", v400, 0);
                                                v27 = 1;
                                                v4 = v442;
                                                goto LABEL_323;
                                              }
                                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v413, 4, &v443, v440);
                                              v406 = objc_claimAutoreleasedReturnValue();
                                              free(v413);
                                              SSFileLog(v404, CFSTR("%@"), v414, v415, v416, v417, v418, v419, (uint64_t)v406);
                                            }

                                            goto LABEL_322;
                                          }
                                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v393, 4, &v443, v440);
                                          v386 = objc_claimAutoreleasedReturnValue();
                                          free(v393);
                                          SSFileLog(v384, CFSTR("%@"), v394, v395, v396, v397, v398, v399, (uint64_t)v386);
                                        }

                                        goto LABEL_309;
                                      }
                                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v376, 4, &v443, v440);
                                      v369 = objc_claimAutoreleasedReturnValue();
                                      free(v376);
                                      SSFileLog(v366, CFSTR("%@"), v377, v378, v379, v380, v381, v382, (uint64_t)v369);
                                    }

                                    goto LABEL_296;
                                  }
                                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v358, 4, &v443, v440);
                                  v351 = objc_claimAutoreleasedReturnValue();
                                  free(v358);
                                  SSFileLog(v348, CFSTR("%@"), v359, v360, v361, v362, v363, v364, (uint64_t)v351);
                                }

                                goto LABEL_282;
                              }
                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v340, 4, &v443, v440);
                              v333 = objc_claimAutoreleasedReturnValue();
                              free(v340);
                              SSFileLog(v330, CFSTR("%@"), v341, v342, v343, v344, v345, v346, (uint64_t)v333);
                            }

                            goto LABEL_268;
                          }
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v322, 4, &v443, v440);
                          v315 = objc_claimAutoreleasedReturnValue();
                          free(v322);
                          SSFileLog(v312, CFSTR("%@"), v323, v324, v325, v326, v327, v328, (uint64_t)v315);
                        }

                        goto LABEL_254;
                      }
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v304, 4, &v443, v440);
                      v297 = objc_claimAutoreleasedReturnValue();
                      free(v304);
                      SSFileLog(v294, CFSTR("%@"), v305, v306, v307, v308, v309, v310, (uint64_t)v297);
                    }

                    goto LABEL_240;
                  }
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v286, 4, &v443, v440);
                  v279 = objc_claimAutoreleasedReturnValue();
                  free(v286);
                  SSFileLog(v276, CFSTR("%@"), v287, v288, v289, v290, v291, v292, (uint64_t)v279);
                }

                goto LABEL_226;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v268, 4, &v443, v440);
              v261 = objc_claimAutoreleasedReturnValue();
              free(v268);
              SSFileLog(v258, CFSTR("%@"), v269, v270, v271, v272, v273, v274, (uint64_t)v261);
            }

            goto LABEL_212;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v250, 4, &v443, v440);
          v243 = objc_claimAutoreleasedReturnValue();
          free(v250);
          SSFileLog(v240, CFSTR("%@"), v251, v252, v253, v254, v255, v256, (uint64_t)v243);
        }

        goto LABEL_198;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v232, 4, &v443, v440);
      v225 = objc_claimAutoreleasedReturnValue();
      free(v232);
      SSFileLog(v222, CFSTR("%@"), v233, v234, v235, v236, v237, v238, (uint64_t)v225);
    }

    goto LABEL_184;
  }
LABEL_324:

  return v27;
}

- (id)popBiometricToken
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__SSAccount_popBiometricToken__block_invoke;
  v6[3] = &unk_1E47B8680;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__SSAccount_popBiometricToken__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (void)setBiometricToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__SSAccount_setBiometricToken___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __31__SSAccount_setBiometricToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 16);
  v4 = (id *)(v2 + 16);
  if (v5 != v3)
    objc_storeStrong(v4, v3);
}

- (void)setLockdownDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "objectForKey:", CFSTR("AltDSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setAltDSID:](self, "setAltDSID:", v4);
  objc_msgSend(v25, "objectForKey:", CFSTR("DSPersonID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setUniqueIdentifier:](self, "setUniqueIdentifier:", v5);
  objc_msgSend(v25, "objectForKey:", CFSTR("AppleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setAccountName:](self, "setAccountName:", v6);
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountKind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setAccountKind:](self, "setAccountKind:", objc_msgSend(v7, "integerValue"));
  objc_msgSend(v25, "objectForKey:", CFSTR("CreditDisplayString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setCreditsString:](self, "setCreditsString:", v8);
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountURLBagType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setAccountScope:](self, "setAccountScope:", objc_msgSend(v9, "isEqualToString:", CFSTR("sandbox")));
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountAvailableServiceTypes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setAvailableServiceTypes:](self, "setAvailableServiceTypes:", objc_msgSend(v10, "integerValue"));
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountServiceTypes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SSAccount setEnabledServiceTypes:](self, "setEnabledServiceTypes:", objc_msgSend(v11, "integerValue"));
  }
  else
  {
    objc_msgSend(v25, "objectForKey:", CFSTR("AccountSocialEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SSAccount setSocialEnabled:](self, "setSocialEnabled:", objc_msgSend(v12, "BOOLValue"));
    v11 = v12;
  }
  objc_msgSend(v25, "objectForKey:", CFSTR("DidFallbackToPassword"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SSAccount setDidFallbackToPassword:](self, "setDidFallbackToPassword:", objc_msgSend(v13, "BOOLValue"));
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountIsNewCustomer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SSAccount setNewCustomer:](self, "setNewCustomer:", objc_msgSend(v14, "BOOLValue"));
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setAccountSource:](self, "setAccountSource:", objc_msgSend(v15, "isEqualToString:", CFSTR("iTunes")));
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountStoreFront"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setStoreFrontIdentifier:](self, "setStoreFrontIdentifier:", v16);
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountITunesPassSerial"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setITunesPassSerialNumber:](self, "setITunesPassSerialNumber:", v17);
  objc_msgSend(v25, "objectForKey:", CFSTR("FirstName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setFirstName:](self, "setFirstName:", v18);
  objc_msgSend(v25, "objectForKey:", CFSTR("LastName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setLastName:](self, "setLastName:", v19);
  SSVLockdownAccountServiceEligibilityKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setEligibility:forServiceType:](self, "setEligibility:forServiceType:", v21, 0);
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountFreeDownloadsPasswordSetting"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setFreeDownloadsPasswordSetting:](self, "setFreeDownloadsPasswordSetting:", objc_msgSend(v22, "integerValue"));
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountPaidPurchasesPasswordSetting"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSAccount setPaidPurchasesPasswordSetting:](self, "setPaidPurchasesPasswordSetting:", objc_msgSend(v23, "integerValue"));
  objc_msgSend(v25, "objectForKey:", CFSTR("AccountIsManagedAppleID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SSAccount setManagedAppleID:](self, "setManagedAppleID:", objc_msgSend(v24, "BOOLValue"));

}

+ (id)serverValueForAccountPasswordSettingValue:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("always");
  if (a3 == 2)
    v3 = CFSTR("sometimes");
  if (a3 == 3)
    return CFSTR("never");
  else
    return (id)v3;
}

- (void)updateAccountPasswordSettings:(id)a3
{
  -[SSAccount updateAccountPasswordSettingsWithRequestProperties:completionBlock:](self, "updateAccountPasswordSettingsWithRequestProperties:completionBlock:", 0, a3);
}

- (void)updateAccountPasswordSettingsWithRequestProperties:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SSXPCConnection *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v29 = 136446210;
      v30 = "-[SSAccount updateAccountPasswordSettingsWithRequestProperties:completionBlock:]";
      LODWORD(v26) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v29, v26);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  if ((SSIsDaemon() & 1) == 0)
  {
    v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "0", 151);
    -[SSAccount uniqueIdentifier](self, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SSXPCDictionarySetObject(v20, "1", v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SSAccount freeDownloadsPasswordSetting](self, "freeDownloadsPasswordSetting"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SSXPCDictionarySetObject(v20, "2", v22);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SSAccount paidPurchasesPasswordSetting](self, "paidPurchasesPasswordSetting"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    SSXPCDictionarySetObject(v20, "3", v23);

    if (v6)
    {
      v24 = (void *)objc_msgSend(v6, "copyXPCEncoding");
      if (v24)
        xpc_dictionary_set_value(v20, "4", v24);

    }
    v25 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __80__SSAccount_updateAccountPasswordSettingsWithRequestProperties_completionBlock___block_invoke;
    v27[3] = &unk_1E47BAB40;
    v28 = v7;
    -[SSXPCConnection sendMessage:withReply:](v25, "sendMessage:withReply:", v20, v27);

  }
}

void __80__SSAccount_updateAccountPasswordSettingsWithRequestProperties_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
    {
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v4, "2");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v10, "initWithXPCEncoding:", v11);

      goto LABEL_7;
    }
    v5 = 111;
  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__SSAccount_updateAccountPasswordSettingsWithRequestProperties_completionBlock___block_invoke_2;
  v12[3] = &unk_1E47B8A98;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v9 = v6;
  dispatch_async(v7, v12);

}

uint64_t __80__SSAccount_updateAccountPasswordSettingsWithRequestProperties_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_addAccountPropertyBitmask:(int64_t)a3 forKey:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SSAccount__addAccountPropertyBitmask_forKey___block_invoke;
  v9[3] = &unk_1E47BAB68;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = (id)a3;
  v8 = v6;
  dispatch_barrier_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __47__SSAccount__addAccountPropertyBitmask_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPropertyForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 != (*(_QWORD *)(a1 + 48) | v4))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAccountProperty:forKey:", v5, *(_QWORD *)(a1 + 32));

  }
}

+ (id)_countryCodeFromStorefrontIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_displayedServerPromptKeyWithIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayedServerPrompt-%@"), a3);
}

+ (id)_lastAttemptForServerPromptKeyWithIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastAttemptForServerPrompt-%@"), a3);
}

- (void)_removeAccountPropertyBitmask:(int64_t)a3 forKey:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__SSAccount__removeAccountPropertyBitmask_forKey___block_invoke;
  v9[3] = &unk_1E47BAB68;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = (id)a3;
  v8 = v6;
  dispatch_barrier_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __50__SSAccount__removeAccountPropertyBitmask_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPropertyForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 != (v4 & ~*(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAccountProperty:forKey:", v5, *(_QWORD *)(a1 + 32));

  }
}

- (void)_sendMessage:(id)a3 withReply:(id)a4
{
  id v5;
  id v6;
  SSXPCConnection *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__SSAccount__sendMessage_withReply___block_invoke;
  v9[3] = &unk_1E47BAB40;
  v10 = v5;
  v8 = v5;
  -[SSXPCConnection sendMessage:withReply:](v7, "sendMessage:withReply:", v6, v9);

}

void __36__SSAccount__sendMessage_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v4 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
    {
      v6 = v7;
      v5 = 0;
      goto LABEL_7;
    }
    v4 = 111;
  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SSAccount backingAccountAccessQueue](self, "backingAccountAccessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__SSAccount__setAccountProperty_forKey___block_invoke;
  v11[3] = &unk_1E47BAB90;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_barrier_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __40__SSAccount__setAccountProperty_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_backingAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPropertyForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "_backingAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccountProperty:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

+ (id)_valueForFirstAvailableKeyPath:(id)a3 inDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "valueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)setBackingAccountAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backingAccountAccessQueue, a3);
}

@end
