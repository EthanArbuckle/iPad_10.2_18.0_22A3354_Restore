@implementation STLockoutPolicyController

- (STLockoutPolicyController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STLockoutPolicyController;
  return -[STLockoutPolicyController init](&v3, sel_init);
}

- (STLockoutPolicyController)initWithCategoryIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  STLockoutPolicyController *v8;
  STLockoutPolicyController *v9;
  uint64_t v10;
  NSString *categoryIdentifier;
  uint64_t v12;
  STManagementState *managementState;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)STLockoutPolicyController;
  v8 = -[STLockoutPolicyController init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = objc_msgSend(v6, "copy");
    categoryIdentifier = v9->_categoryIdentifier;
    v9->_categoryIdentifier = (NSString *)v10;

    v9->_style = 4;
    -[STLockoutPolicyController _setupCategoryPolicyMonitorForIdentifier:](v9, "_setupCategoryPolicyMonitorForIdentifier:", v9->_categoryIdentifier);
    v12 = objc_opt_new();
    managementState = v9->_managementState;
    v9->_managementState = (STManagementState *)v12;

  }
  return v9;
}

- (STLockoutPolicyController)initWithBundleIdentifier:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  STLockoutPolicyController *v9;
  STLockoutPolicyController *v10;
  uint64_t v11;
  STManagementState *managementState;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STLockoutPolicyController;
  v9 = -[STLockoutPolicyController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_style = 0;
    v11 = objc_opt_new();
    managementState = v10->_managementState;
    v10->_managementState = (STManagementState *)v11;

    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
  }

  return v10;
}

- (STLockoutPolicyController)initWithWebsiteURL:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  STLockoutPolicyController *v9;
  STLockoutPolicyController *v10;
  uint64_t v11;
  STManagementState *managementState;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STLockoutPolicyController;
  v9 = -[STLockoutPolicyController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_websiteURL, a3);
    v10->_style = 1;
    -[STLockoutPolicyController _setupWebsitePolicyMonitorForURL:](v10, "_setupWebsitePolicyMonitorForURL:", v10->_websiteURL);
    v11 = objc_opt_new();
    managementState = v10->_managementState;
    v10->_managementState = (STManagementState *)v11;

  }
  return v10;
}

- (STLockoutPolicyController)initWithBundleIdentifier:(id)a3 contactsHandles:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  STLockoutPolicyController *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  uint64_t v14;
  NSArray *contactsHandles;
  uint64_t v16;
  STManagementState *managementState;
  uint64_t v18;
  CNContactStore *contactStore;
  void *v20;
  STLockoutPolicyController *v21;
  id v22;
  id v23;
  void *v24;
  STLockoutPolicyController *v25;
  _QWORD v27[4];
  id v28;
  STLockoutPolicyController *v29;
  id v30;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)STLockoutPolicyController;
  v10 = a5;
  v11 = -[STLockoutPolicyController init](&v31, sel_init);
  v12 = objc_msgSend(v8, "copy");
  bundleIdentifier = v11->_bundleIdentifier;
  v11->_bundleIdentifier = (NSString *)v12;

  v14 = objc_msgSend(v9, "copy");
  contactsHandles = v11->_contactsHandles;
  v11->_contactsHandles = (NSArray *)v14;

  objc_storeWeak((id *)&v11->_delegate, v10);
  v11->_style = 3;
  v11->_state = 0;
  v16 = objc_opt_new();
  managementState = v11->_managementState;
  v11->_managementState = (STManagementState *)v16;

  v18 = objc_opt_new();
  contactStore = v11->_contactStore;
  v11->_contactStore = (CNContactStore *)v18;

  v20 = (void *)MEMORY[0x24BE84550];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke;
  v27[3] = &unk_24CED42C8;
  v28 = v8;
  v21 = v11;
  v29 = v21;
  v30 = v9;
  v22 = v9;
  v23 = v8;
  objc_msgSend(v20, "requestConversationWithBundleIdentifier:completionHandler:", v23, v27);
  v24 = v30;
  v25 = v21;

  return v25;
}

void __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke_8;
    block[3] = &unk_24CED42A0;
    v9 = *(id *)(a1 + 40);
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v7 = v9;
  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke_cold_1();
  }

}

void __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setConversation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "allowableByContactsHandles:", *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setConversationContext:", v6);
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v6, "allowedByScreenTime");
  v4 = objc_msgSend(v6, "applicationCurrentlyLimited");
  objc_msgSend(v6, "allowedByContactsHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateAllowedByScreenTime:applicationCurrentlyLimited:allowedByContactsHandle:", v3, v4, v5);

  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("allowedByScreenTime"), 1, CFSTR("KVOContextLockoutPolicyController"));
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("applicationCurrentlyLimited"), 1, CFSTR("KVOContextLockoutPolicyController"));
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("allowedByContactsHandle"), 1, CFSTR("KVOContextLockoutPolicyController"));

}

- (STLockoutPolicyController)initWithBundleIdentifier:(id)a3 conversationContext:(id)a4 contactStore:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  STLockoutPolicyController *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *contactsHandles;
  uint64_t v21;
  STManagementState *managementState;
  CNContactStore *v23;
  CNContactStore *contactStore;
  STConversationContext *conversationContext;
  id v26;
  objc_super v28;

  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)STLockoutPolicyController;
  v12 = a6;
  v13 = a3;
  v14 = -[STLockoutPolicyController init](&v28, sel_init);
  v15 = objc_msgSend(v13, "copy", v28.receiver, v28.super_class);

  bundleIdentifier = v14->_bundleIdentifier;
  v14->_bundleIdentifier = (NSString *)v15;

  objc_msgSend(v10, "allowedByContactsHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  contactsHandles = v14->_contactsHandles;
  v14->_contactsHandles = (NSArray *)v19;

  objc_storeWeak((id *)&v14->_delegate, v12);
  v14->_style = 3;
  v14->_state = 0;
  v21 = objc_opt_new();
  managementState = v14->_managementState;
  v14->_managementState = (STManagementState *)v21;

  if (v11)
    v23 = (CNContactStore *)v11;
  else
    v23 = (CNContactStore *)objc_opt_new();
  contactStore = v14->_contactStore;
  v14->_contactStore = v23;

  conversationContext = v14->_conversationContext;
  v14->_conversationContext = (STConversationContext *)v10;
  v26 = v10;

  -[STConversationContext addObserver:forKeyPath:options:context:](v14->_conversationContext, "addObserver:forKeyPath:options:context:", v14, CFSTR("allowedByScreenTime"), 1, CFSTR("KVOContextLockoutPolicyController"));
  -[STConversationContext addObserver:forKeyPath:options:context:](v14->_conversationContext, "addObserver:forKeyPath:options:context:", v14, CFSTR("applicationCurrentlyLimited"), 1, CFSTR("KVOContextLockoutPolicyController"));
  -[STConversationContext addObserver:forKeyPath:options:context:](v14->_conversationContext, "addObserver:forKeyPath:options:context:", v14, CFSTR("allowedByContactsHandle"), 1, CFSTR("KVOContextLockoutPolicyController"));

  return v14;
}

- (void)setBundleIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  NSString *bundleIdentifier;
  void *v8;
  id v9;
  id v10;
  DMFApplicationPolicyMonitor *v11;
  DMFApplicationPolicyMonitor *applicationPolicyMonitor;
  _QWORD v13[4];
  id v14;
  id v15[2];
  uint8_t buf[4];
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412290;
    v17 = bundleIdentifier;
    _os_log_impl(&dword_212E1A000, v6, OS_LOG_TYPE_DEFAULT, "bundle identifier is %@", buf, 0xCu);
  }

  v8 = (void *)(self->_reuseIdentifier + 1);
  self->_reuseIdentifier = (unint64_t)v8;
  objc_initWeak((id *)buf, self);
  v9 = objc_alloc(MEMORY[0x24BE2C7C0]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__STLockoutPolicyController_setBundleIdentifier___block_invoke;
  v13[3] = &unk_24CED42F0;
  objc_copyWeak(v15, (id *)buf);
  v15[1] = v8;
  v10 = v5;
  v14 = v10;
  v11 = (DMFApplicationPolicyMonitor *)objc_msgSend(v9, "initWithPolicyChangeHandler:", v13);
  applicationPolicyMonitor = self->_applicationPolicyMonitor;
  self->_applicationPolicyMonitor = v11;

  self->_state = 0;
  -[STLockoutPolicyController _changePolicyToCurrent](self, "_changePolicyToCurrent");

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);

}

void __49__STLockoutPolicyController_setBundleIdentifier___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4[2];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__STLockoutPolicyController_setBundleIdentifier___block_invoke_2;
  block[3] = &unk_24CED42F0;
  objc_copyWeak(v4, a1 + 5);
  v4[1] = a1[6];
  v3 = a1[4];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v4);
}

void __49__STLockoutPolicyController_setBundleIdentifier___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[1] == *(_QWORD *)(a1 + 48))
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3[1]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_212E1A000, v4, OS_LOG_TYPE_DEFAULT, "received notification of policy change for %@ (%@) bundle identifier %@", (uint8_t *)&v7, 0x20u);

    }
    objc_msgSend(v3, "_changePolicyToCurrentWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  }

}

- (BOOL)handleAction:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 0:
      if (v6)
        (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
      goto LABEL_4;
    case 1:
      if (v6)
        (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
      v8 = 0;
      break;
    case 2:
      v9 = -[STLockoutPolicyController _requestAdditionalTime:withCompletionHandler:](self, "_requestAdditionalTime:withCompletionHandler:", 2, v6);
      goto LABEL_13;
    case 3:
      v9 = -[STLockoutPolicyController _actionIgnoreLimitForTodayWithCompletionHandler:](self, "_actionIgnoreLimitForTodayWithCompletionHandler:", v6);
      goto LABEL_13;
    case 4:
      v9 = -[STLockoutPolicyController _actionRemindMeInMinutesWithCompletionHandler:](self, "_actionRemindMeInMinutesWithCompletionHandler:", v6);
      goto LABEL_13;
    case 5:
      v9 = -[STLockoutPolicyController _actionRemindMeInOneHourWithCompletionHandler:](self, "_actionRemindMeInOneHourWithCompletionHandler:", v6);
      goto LABEL_13;
    case 6:
      v9 = -[STLockoutPolicyController _actionOneMoreMinuteWithCompletionHandler:](self, "_actionOneMoreMinuteWithCompletionHandler:", v6);
LABEL_13:
      v8 = v9;
      break;
    default:
LABEL_4:
      v8 = 1;
      break;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[STConversationContext removeObserver:forKeyPath:context:](self->_conversationContext, "removeObserver:forKeyPath:context:", self, CFSTR("allowedByScreenTime"), CFSTR("KVOContextLockoutPolicyController"));
  -[STConversationContext removeObserver:forKeyPath:context:](self->_conversationContext, "removeObserver:forKeyPath:context:", self, CFSTR("applicationCurrentlyLimited"), CFSTR("KVOContextLockoutPolicyController"));
  -[STConversationContext removeObserver:forKeyPath:context:](self->_conversationContext, "removeObserver:forKeyPath:context:", self, CFSTR("allowedByContactsHandle"), CFSTR("KVOContextLockoutPolicyController"));
  v3.receiver = self;
  v3.super_class = (Class)STLockoutPolicyController;
  -[STLockoutPolicyController dealloc](&v3, sel_dealloc);
}

- (NSSet)blockedContactsHandles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[STLockoutPolicyController conversationContext](self, "conversationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allowedByContactsHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keysOfEntriesPassingTest:", &__block_literal_global_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBCF20];
    -[STLockoutPolicyController contactsHandles](self, "contactsHandles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSSet *)v7;
}

- (CNContainer)iCloudContainer
{
  STManagementState *managementState;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];
  id v14;
  id v15;

  managementState = self->_managementState;
  v15 = 0;
  -[STManagementState primaryiCloudCardDAVAccountIdentifierWithError:](managementState, "primaryiCloudCardDAVAccountIdentifierWithError:", &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBAD18], "predicateForContainersInAccountWithExternalIdentifier:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    -[STLockoutPolicyController contactStore](self, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v5;
    objc_msgSend(v7, "containersMatchingPredicate:error:", v6, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;

    if (v8)
    {
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
      +[STBlockingUILog log](STBlockingUILog, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_212E1A000, v11, OS_LOG_TYPE_DEFAULT, "No iCloud container found for user", v13, 2u);
      }
    }
    else
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[STBlockingViewController _iCloudContainer].cold.2();
    }

    v10 = 0;
    goto LABEL_13;
  }
  +[STBlockingUILog log](STBlockingUILog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[STBlockingViewController _iCloudContainer].cold.1();
  v10 = 0;
  v9 = v5;
LABEL_14:

  return (CNContainer *)v10;
}

- (void)_setupCategoryPolicyMonitorForIdentifier:(id)a3
{
  id v4;
  void *reuseIdentifier;
  id v6;
  id v7;
  DMFCategoryPolicyMonitor *v8;
  DMFCategoryPolicyMonitor *categoryPolicyMonitor;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x24BE2C7C8]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__STLockoutPolicyController__setupCategoryPolicyMonitorForIdentifier___block_invoke;
  v10[3] = &unk_24CED42F0;
  objc_copyWeak(v12, &location);
  v12[1] = reuseIdentifier;
  v7 = v4;
  v11 = v7;
  v8 = (DMFCategoryPolicyMonitor *)objc_msgSend(v6, "initWithPolicyChangeHandler:", v10);
  categoryPolicyMonitor = self->_categoryPolicyMonitor;
  self->_categoryPolicyMonitor = v8;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

void __70__STLockoutPolicyController__setupCategoryPolicyMonitorForIdentifier___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4[2];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__STLockoutPolicyController__setupCategoryPolicyMonitorForIdentifier___block_invoke_2;
  block[3] = &unk_24CED42F0;
  objc_copyWeak(v4, a1 + 5);
  v4[1] = a1[6];
  v3 = a1[4];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v4);
}

void __70__STLockoutPolicyController__setupCategoryPolicyMonitorForIdentifier___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[1] == *(_QWORD *)(a1 + 48))
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3[1]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_212E1A000, v4, OS_LOG_TYPE_DEFAULT, "received notification of policy change for %@ (%@) category identifier %@", (uint8_t *)&v7, 0x20u);

    }
    objc_msgSend(v3, "_changePolicyToCurrentWithCategoryIdentifier:", *(_QWORD *)(a1 + 32));
  }

}

- (void)_setupWebsitePolicyMonitorForURL:(id)a3
{
  id v4;
  void *reuseIdentifier;
  id v6;
  id v7;
  DMFWebsitePolicyMonitor *v8;
  DMFWebsitePolicyMonitor *websitePolicyMonitor;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x24BE2C968]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__STLockoutPolicyController__setupWebsitePolicyMonitorForURL___block_invoke;
  v10[3] = &unk_24CED42F0;
  objc_copyWeak(v12, &location);
  v12[1] = reuseIdentifier;
  v7 = v4;
  v11 = v7;
  v8 = (DMFWebsitePolicyMonitor *)objc_msgSend(v6, "initWithPolicyChangeHandler:", v10);
  websitePolicyMonitor = self->_websitePolicyMonitor;
  self->_websitePolicyMonitor = v8;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

void __62__STLockoutPolicyController__setupWebsitePolicyMonitorForURL___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4[2];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__STLockoutPolicyController__setupWebsitePolicyMonitorForURL___block_invoke_2;
  block[3] = &unk_24CED42F0;
  objc_copyWeak(v4, a1 + 5);
  v4[1] = a1[6];
  v3 = a1[4];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v4);
}

void __62__STLockoutPolicyController__setupWebsitePolicyMonitorForURL___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[1] == *(_QWORD *)(a1 + 48))
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3[1]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_212E1A000, v4, OS_LOG_TYPE_DEFAULT, "received notification of policy change for %@ (%@) URL %@", (uint8_t *)&v7, 0x20u);

    }
    objc_msgSend(v3, "_changePolicyToCurrentWithURL:", *(_QWORD *)(a1 + 32));
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == CFSTR("KVOContextLockoutPolicyController"))
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("allowedByScreenTime")))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v14)
      {

        v13 = 0;
      }
      -[STLockoutPolicyController _allowedByScreenTimeDidChange:conversationContext:](self, "_allowedByScreenTimeDidChange:conversationContext:", objc_msgSend(v13, "BOOLValue"), v11);
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("applicationCurrentlyLimited")))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v15)
      {

        v13 = 0;
      }
      -[STLockoutPolicyController _applicationCurrentlyLimitedDidChange:conversationContext:](self, "_applicationCurrentlyLimitedDidChange:conversationContext:", objc_msgSend(v13, "BOOLValue"), v11);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("allowedByContactsHandle")))
        goto LABEL_16;
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v16)
      {

        v13 = 0;
      }
      -[STLockoutPolicyController _allowedByContactsHandleDidChange:conversationContext:](self, "_allowedByContactsHandleDidChange:conversationContext:", v13, v11);
    }

    goto LABEL_16;
  }
  v17.receiver = self;
  v17.super_class = (Class)STLockoutPolicyController;
  -[STLockoutPolicyController observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_16:

}

- (void)_allowedByScreenTimeDidChange:(BOOL)a3 conversationContext:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__STLockoutPolicyController__allowedByScreenTimeDidChange_conversationContext___block_invoke;
  block[3] = &unk_24CED4318;
  v10 = a3;
  block[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __79__STLockoutPolicyController__allowedByScreenTimeDidChange_conversationContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "applicationCurrentlyLimited");
  objc_msgSend(*(id *)(a1 + 40), "allowedByContactsHandle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateAllowedByScreenTime:applicationCurrentlyLimited:allowedByContactsHandle:", v2, v4, v5);

}

- (void)_applicationCurrentlyLimitedDidChange:(BOOL)a3 conversationContext:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__STLockoutPolicyController__applicationCurrentlyLimitedDidChange_conversationContext___block_invoke;
  block[3] = &unk_24CED4318;
  block[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __87__STLockoutPolicyController__applicationCurrentlyLimitedDidChange_conversationContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "allowedByScreenTime");
  v4 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "allowedByContactsHandle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateAllowedByScreenTime:applicationCurrentlyLimited:allowedByContactsHandle:", v3, v4, v5);

}

- (void)_allowedByContactsHandleDidChange:(id)a3 conversationContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__STLockoutPolicyController__allowedByContactsHandleDidChange_conversationContext___block_invoke;
  block[3] = &unk_24CED42A0;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __83__STLockoutPolicyController__allowedByContactsHandleDidChange_conversationContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAllowedByScreenTime:applicationCurrentlyLimited:allowedByContactsHandle:", objc_msgSend(*(id *)(a1 + 40), "allowedByScreenTime"), objc_msgSend(*(id *)(a1 + 40), "applicationCurrentlyLimited"), *(_QWORD *)(a1 + 48));
}

- (void)_updateAllowedByScreenTime:(BOOL)a3 applicationCurrentlyLimited:(BOOL)a4 allowedByContactsHandle:(id)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a4;
  v8 = a5;
  v12 = v8;
  if (a3)
  {
    v9 = 9;
LABEL_7:
    -[STLockoutPolicyController _changeInternalStateTo:](self, "_changeInternalStateTo:", v9);
    goto LABEL_8;
  }
  objc_msgSend(v8, "keysOfEntriesPassingTest:", &__block_literal_global_3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    if (v5)
      v9 = 8;
    else
      v9 = 7;
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)_shouldRequestMoreTime
{
  return -[STManagementState shouldRequestMoreTime](self->_managementState, "shouldRequestMoreTime");
}

- (BOOL)_isRestrictionsPasscodeSet
{
  return -[STManagementState isRestrictionsPasscodeSet](self->_managementState, "isRestrictionsPasscodeSet");
}

- (BOOL)needsToSetRestrictionsPasscode
{
  return -[STManagementState needsToSetRestrictionsPasscode](self->_managementState, "needsToSetRestrictionsPasscode");
}

- (BOOL)shouldAllowOneMoreMinute
{
  NSString *bundleIdentifier;
  STManagementState *managementState;
  void *v5;
  void *v6;
  id v7;
  char v8;
  NSURL *websiteURL;
  NSURL **p_websiteURL;
  void *v11;
  STManagementState *v12;
  NSString *categoryIdentifier;
  STManagementState *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v24;
  id v25;
  void *v26;

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    managementState = self->_managementState;
    v26 = 0;
    -[STManagementState shouldAllowOneMoreMinuteForBundleIdentifier:error:](managementState, "shouldAllowOneMoreMinuteForBundleIdentifier:error:", bundleIdentifier, &v26);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v26;
  }
  else
  {
    p_websiteURL = &self->_websiteURL;
    websiteURL = self->_websiteURL;
    if (websiteURL)
    {
      -[NSURL host](websiteURL, "host");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = self->_managementState;
        v25 = 0;
        -[STManagementState shouldAllowOneMoreMinuteForWebDomain:error:](v12, "shouldAllowOneMoreMinuteForWebDomain:error:", v11, &v25);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v25;
      }
      else
      {
        +[STBlockingUILog log](STBlockingUILog, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          -[STLockoutPolicyController shouldAllowOneMoreMinute].cold.2((uint64_t)p_websiteURL, v15, v16, v17, v18, v19, v20, v21);

        v7 = 0;
        v5 = 0;
      }

      if (v5)
        goto LABEL_4;
LABEL_14:
      +[STBlockingUILog log](STBlockingUILog, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[STLockoutPolicyController shouldAllowOneMoreMinute].cold.1();

      v8 = 1;
      goto LABEL_17;
    }
    categoryIdentifier = self->_categoryIdentifier;
    if (!categoryIdentifier)
      return 0;
    v14 = self->_managementState;
    v24 = 0;
    -[STManagementState shouldAllowOneMoreMinuteForCategoryIdentifier:error:](v14, "shouldAllowOneMoreMinuteForCategoryIdentifier:error:", categoryIdentifier, &v24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v24;
  }
  v7 = v6;
  if (!v5)
    goto LABEL_14;
LABEL_4:
  v8 = objc_msgSend(v5, "BOOLValue");
LABEL_17:

  return v8;
}

- (void)_changePolicyToCurrentWithCategoryIdentifier:(id)a3
{
  id v4;
  void *reuseIdentifier;
  DMFCategoryPolicyMonitor *categoryPolicyMonitor;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
    reuseIdentifier = (void *)self->_reuseIdentifier;
    objc_initWeak(&location, self);
    categoryPolicyMonitor = self->_categoryPolicyMonitor;
    v13[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __74__STLockoutPolicyController__changePolicyToCurrentWithCategoryIdentifier___block_invoke;
    v9[3] = &unk_24CED4368;
    v10 = v4;
    objc_copyWeak(v11, &location);
    v11[1] = reuseIdentifier;
    -[DMFCategoryPolicyMonitor requestPoliciesForCategoryIdentifiers:completionHandler:](categoryPolicyMonitor, "requestPoliciesForCategoryIdentifiers:completionHandler:", v7, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STLockoutPolicyController _changePolicyToCurrentWithCategoryIdentifier:].cold.1();

  }
}

void __74__STLockoutPolicyController__changePolicyToCurrentWithCategoryIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_212E1A000, v6, OS_LOG_TYPE_DEFAULT, "request policies for category %@ returned error: %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)-[NSObject integerValue](v6, "integerValue");
    +[STBlockingUILog log](STBlockingUILog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      STStringFromPolicy((unint64_t)v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_212E1A000, v9, OS_LOG_TYPE_DEFAULT, "request policies for category %@ returned %@", buf, 0x16u);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__STLockoutPolicyController__changePolicyToCurrentWithCategoryIdentifier___block_invoke_25;
    block[3] = &unk_24CED4340;
    objc_copyWeak(v13, (id *)(a1 + 40));
    v13[1] = *(id *)(a1 + 48);
    v13[2] = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(v13);
  }

}

void __74__STLockoutPolicyController__changePolicyToCurrentWithCategoryIdentifier___block_invoke_25(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1] == *(_QWORD *)(a1 + 40))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleChangeToPolicy:", *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_changePolicyToCurrentWithBundleIdentifier:(id)a3
{
  id v4;
  void *reuseIdentifier;
  DMFApplicationPolicyMonitor *applicationPolicyMonitor;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
    reuseIdentifier = (void *)self->_reuseIdentifier;
    objc_initWeak(&location, self);
    applicationPolicyMonitor = self->_applicationPolicyMonitor;
    v13[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __72__STLockoutPolicyController__changePolicyToCurrentWithBundleIdentifier___block_invoke;
    v9[3] = &unk_24CED4368;
    v10 = v4;
    objc_copyWeak(v11, &location);
    v11[1] = reuseIdentifier;
    -[DMFApplicationPolicyMonitor requestPoliciesForBundleIdentifiers:completionHandler:](applicationPolicyMonitor, "requestPoliciesForBundleIdentifiers:completionHandler:", v7, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STLockoutPolicyController _changePolicyToCurrentWithBundleIdentifier:].cold.1();

  }
}

void __72__STLockoutPolicyController__changePolicyToCurrentWithBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_212E1A000, v6, OS_LOG_TYPE_DEFAULT, "request policies for bundle identifier %@ returned error: %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)-[NSObject integerValue](v6, "integerValue");
    +[STBlockingUILog log](STBlockingUILog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      STStringFromPolicy((unint64_t)v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_212E1A000, v9, OS_LOG_TYPE_DEFAULT, "request policies for bundle identifier %@ returned %@", buf, 0x16u);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__STLockoutPolicyController__changePolicyToCurrentWithBundleIdentifier___block_invoke_27;
    block[3] = &unk_24CED4340;
    objc_copyWeak(v13, (id *)(a1 + 40));
    v13[1] = *(id *)(a1 + 48);
    v13[2] = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(v13);
  }

}

void __72__STLockoutPolicyController__changePolicyToCurrentWithBundleIdentifier___block_invoke_27(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1] == *(_QWORD *)(a1 + 40))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleChangeToPolicy:", *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_changePolicyToCurrentWithURL:(id)a3
{
  id v4;
  void *reuseIdentifier;
  DMFWebsitePolicyMonitor *websitePolicyMonitor;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
    reuseIdentifier = (void *)self->_reuseIdentifier;
    objc_initWeak(&location, self);
    websitePolicyMonitor = self->_websitePolicyMonitor;
    v13[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__STLockoutPolicyController__changePolicyToCurrentWithURL___block_invoke;
    v9[3] = &unk_24CED4368;
    v10 = v4;
    objc_copyWeak(v11, &location);
    v11[1] = reuseIdentifier;
    -[DMFWebsitePolicyMonitor requestPoliciesForWebsites:completionHandler:](websitePolicyMonitor, "requestPoliciesForWebsites:completionHandler:", v7, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STLockoutPolicyController _changePolicyToCurrentWithURL:].cold.1();

  }
}

void __59__STLockoutPolicyController__changePolicyToCurrentWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_212E1A000, v6, OS_LOG_TYPE_DEFAULT, "request policies for website %@ returned error: %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)-[NSObject integerValue](v6, "integerValue");
    +[STBlockingUILog log](STBlockingUILog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      STStringFromPolicy((unint64_t)v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_212E1A000, v9, OS_LOG_TYPE_DEFAULT, "request policies for website %@ returned %@", buf, 0x16u);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__STLockoutPolicyController__changePolicyToCurrentWithURL___block_invoke_28;
    block[3] = &unk_24CED4340;
    objc_copyWeak(v13, (id *)(a1 + 40));
    v13[1] = *(id *)(a1 + 48);
    v13[2] = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(v13);
  }

}

void __59__STLockoutPolicyController__changePolicyToCurrentWithURL___block_invoke_28(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1] == *(_QWORD *)(a1 + 40))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleChangeToPolicy:", *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_changePolicyToCurrent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_212E1A000, v0, v1, "Error: unable to change policy to current; defaulting to blocked",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_9();
}

- (void)_handleChangeToPolicy:(int64_t)a3
{
  NSObject *v5;
  STLockoutPolicyController *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  switch(a3)
  {
    case 0:
      +[STBlockingUILog log](STBlockingUILog, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212E1A000, v5, OS_LOG_TYPE_DEFAULT, "change to policy OK", buf, 2u);
      }

      v6 = self;
      v7 = 9;
      goto LABEL_17;
    case 1:
      +[STBlockingUILog log](STBlockingUILog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_212E1A000, v8, OS_LOG_TYPE_DEFAULT, "change to policy Warn", v16, 2u);
      }

      v6 = self;
      v7 = 2;
      goto LABEL_17;
    case 2:
      +[STBlockingUILog log](STBlockingUILog, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_212E1A000, v9, OS_LOG_TYPE_DEFAULT, "change to policy Ask", v15, 2u);
      }

      v6 = self;
      v7 = 3;
      goto LABEL_17;
    case 3:
      +[STBlockingUILog log](STBlockingUILog, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_212E1A000, v10, OS_LOG_TYPE_DEFAULT, "change to policy Ask Pending", v14, 2u);
      }

      v6 = self;
      v7 = 4;
      goto LABEL_17;
    case 4:
      +[STBlockingUILog log](STBlockingUILog, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_212E1A000, v11, OS_LOG_TYPE_DEFAULT, "change to policy Blocked", v13, 2u);
      }

      v6 = self;
      v7 = 6;
LABEL_17:
      -[STLockoutPolicyController _changeInternalStateTo:](v6, "_changeInternalStateTo:", v7);
      break;
    case 5:
      +[STBlockingUILog log](STBlockingUILog, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[STLockoutPolicyController _handleChangeToPolicy:].cold.1();

      break;
    default:
      return;
  }
}

- (void)_changeStateToBeforePending
{
  unint64_t stateBeforePending;
  NSObject *v4;
  STLockoutPolicyController *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (self->_state == 4)
  {
    stateBeforePending = self->_stateBeforePending;
    if (stateBeforePending == 2)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_212E1A000, v10, OS_LOG_TYPE_DEFAULT, "Reverting state to Warn", (uint8_t *)&v12, 2u);
      }

      v5 = self;
      v6 = 2;
      goto LABEL_12;
    }
    if (stateBeforePending == 3)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_212E1A000, v4, OS_LOG_TYPE_DEFAULT, "Reverting state to Ask", (uint8_t *)&v12, 2u);
      }

      v5 = self;
      v6 = 3;
LABEL_12:
      -[STLockoutPolicyController _changeInternalStateTo:](v5, "_changeInternalStateTo:", v6);
      return;
    }
    +[STBlockingUILog log](STBlockingUILog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      STStringFromLockoutState(self->_stateBeforePending);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_212E1A000, v7, OS_LOG_TYPE_DEFAULT, "State before request was %{public}@; expected Ask or Warn",
        (uint8_t *)&v12,
        0xCu);

    }
  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      STStringFromLockoutState(self->_state);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      STStringFromLockoutState(self->_stateBeforePending);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_212E1A000, v7, OS_LOG_TYPE_DEFAULT, "Current state (%{public}@) is no longer pending, so skipping revert to state (%{public}@) before pending", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (BOOL)_changeInternalStateTo:(unint64_t)a3
{
  unint64_t state;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  STLockoutPolicyControllerDelegate **p_delegate;
  id WeakRetained;
  id v12;
  char v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  state = self->_state;
  if (state == a3)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      STStringFromLockoutState(a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v17;
      _os_log_impl(&dword_212E1A000, v16, OS_LOG_TYPE_DEFAULT, "skipping change to state: already %@", (uint8_t *)&v19, 0xCu);

    }
    goto LABEL_17;
  }
  if (state == 9)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      STStringFromLockoutState(a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v7;
      _os_log_impl(&dword_212E1A000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: change to state %@: lockout state is Dismissing", (uint8_t *)&v19, 0xCu);

    }
  }
  +[STBlockingUILog log](STBlockingUILog, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    STStringFromLockoutState(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v9;
    _os_log_impl(&dword_212E1A000, v8, OS_LOG_TYPE_DEFAULT, "changing lockout state to %@", (uint8_t *)&v19, 0xCu);

  }
  if (a3 == 4)
    self->_stateBeforePending = self->_state;
  self->_state = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained((id *)p_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        STStringFromLockoutState(a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v15;
        _os_log_impl(&dword_212E1A000, v14, OS_LOG_TYPE_DEFAULT, "calling delegate  stateDidChange to %@", (uint8_t *)&v19, 0xCu);

      }
      v16 = objc_loadWeakRetained((id *)p_delegate);
      -[NSObject stateDidChange:](v16, "stateDidChange:", a3);
LABEL_17:

    }
  }
  return state != a3;
}

- (void)_changeStateToInitial
{
  NSObject *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Initial", v4, 2u);
  }

  if (-[STLockoutPolicyController _changeInternalStateTo:](self, "_changeInternalStateTo:", 1))
    -[STLockoutPolicyController _changePolicyToCurrent](self, "_changePolicyToCurrent");
}

- (double)_timeIntervalToEndOfDay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, 1, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 252, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHour:", 0);
  objc_msgSend(v5, "setMinute:", 0);
  objc_msgSend(v5, "setSecond:", 0);
  objc_msgSend(v2, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v3);
  v8 = v7;

  return v8;
}

- (void)_authenticatedApproveForAdditionalTime:(double)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *reuseIdentifier;
  STAskForTimeResource *v8;
  STAskForTimeResource *askForTimeResource;
  double v10;
  double v11;
  NSObject *v12;
  STAskForTimeResource *v13;
  void *v14;
  id v15;
  void *v16;
  STAskForTimeResource *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23[3];
  uint8_t buf[4];
  STAskForTimeResource *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  -[STLockoutPolicyController _makeAskForTimeResource](self, "_makeAskForTimeResource");
  v8 = (STAskForTimeResource *)objc_claimAutoreleasedReturnValue();
  askForTimeResource = self->_askForTimeResource;
  self->_askForTimeResource = v8;

  v10 = a3;
  if (a3 != 60.0)
  {
    v10 = a3;
    if (a3 == 0.0)
    {
      -[STLockoutPolicyController _timeIntervalToEndOfDay](self, "_timeIntervalToEndOfDay");
      v10 = v11;
    }
  }
  +[STBlockingUILog log](STBlockingUILog, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_askForTimeResource;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v13;
    v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_212E1A000, v12, OS_LOG_TYPE_DEFAULT, "Created Ask For Time Resource %@ to grant additional time %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __90__STLockoutPolicyController__authenticatedApproveForAdditionalTime_withCompletionHandler___block_invoke;
  v21 = &unk_24CED43B8;
  v23[1] = *(id *)&v10;
  objc_copyWeak(v23, (id *)buf);
  v23[2] = reuseIdentifier;
  v15 = v6;
  v22 = v15;
  v16 = (void *)MEMORY[0x2199A6950](&v18);
  v17 = self->_askForTimeResource;
  if (a3 == 60.0)
    -[STAskForTimeResource approveOneMoreMinuteWithCompletionHandler:](v17, "approveOneMoreMinuteWithCompletionHandler:", v16, v18, v19, v20, v21);
  else
    -[STAskForTimeResource approveAdditionalTime:completionHandler:](v17, "approveAdditionalTime:completionHandler:", v16, v10, v18, v19, v20, v21);

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);

}

void __90__STLockoutPolicyController__authenticatedApproveForAdditionalTime_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11[2];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      v14 = 2114;
      v15 = v3;
      _os_log_impl(&dword_212E1A000, v4, OS_LOG_TYPE_DEFAULT, "Attempt to grant approval for %@{public}@ seconds failed; error: %{public}@",
        buf,
        0x16u);

    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __90__STLockoutPolicyController__authenticatedApproveForAdditionalTime_withCompletionHandler___block_invoke_33;
    v8[3] = &unk_24CED4390;
    objc_copyWeak(v11, (id *)(a1 + 40));
    v11[1] = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

    objc_destroyWeak(v11);
  }
  else
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_212E1A000, v4, OS_LOG_TYPE_DEFAULT, "Request to grant approval for %{public}@ seconds was received with no error; should be granted immediately",
        buf,
        0xCu);

    }
  }

}

void __90__STLockoutPolicyController__authenticatedApproveForAdditionalTime_withCompletionHandler___block_invoke_33(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 1) == *(_QWORD *)(a1 + 56))
    {
      v4 = *(_QWORD *)(a1 + 40);
      if (v4)
      {
        v5 = v3;
        (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
        v3 = v5;
      }
    }
  }

}

- (BOOL)_requestAdditionalTime:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  void *reuseIdentifier;
  NSObject *v8;
  STAskForTimeResource *v9;
  STAskForTimeResource *askForTimeResource;
  NSObject *v11;
  STAskForTimeResource *v12;
  void *v13;
  void *categoryIdentifier;
  int v15;
  STAskForTimeResource *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21[3];
  uint8_t buf[4];
  STAskForTimeResource *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212E1A000, v6, OS_LOG_TYPE_DEFAULT, "Requesting parent for additional time", buf, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  if (self->_askForTimeResource)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212E1A000, v8, OS_LOG_TYPE_DEFAULT, "warning: ask for time request in progress when another one issued", buf, 2u);
    }

  }
  -[STLockoutPolicyController _makeAskForTimeResource](self, "_makeAskForTimeResource");
  v9 = (STAskForTimeResource *)objc_claimAutoreleasedReturnValue();
  askForTimeResource = self->_askForTimeResource;
  self->_askForTimeResource = v9;

  +[STBlockingUILog log](STBlockingUILog, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_askForTimeResource;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 3600.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    categoryIdentifier = self->_categoryIdentifier;
    if (categoryIdentifier || (categoryIdentifier = self->_bundleIdentifier) != 0)
    {
      v15 = 0;
    }
    else
    {
      -[NSURL host](self->_websiteURL, "host");
      categoryIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 1;
    }
    *(_DWORD *)buf = 138412802;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = categoryIdentifier;
    _os_log_impl(&dword_212E1A000, v11, OS_LOG_TYPE_DEFAULT, "Created Ask For Time Resource %@ for additional time %@ for %@", buf, 0x20u);
    if (v15)

  }
  objc_initWeak((id *)buf, self);
  v16 = self->_askForTimeResource;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__STLockoutPolicyController__requestAdditionalTime_withCompletionHandler___block_invoke;
  v19[3] = &unk_24CED43B8;
  v21[1] = (id)0x40AC200000000000;
  objc_copyWeak(v21, (id *)buf);
  v21[2] = reuseIdentifier;
  v17 = v5;
  v20 = v17;
  -[STAskForTimeResource requestAdditionalTime:completionHandler:](v16, "requestAdditionalTime:completionHandler:", v19, 3600.0);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);

  return 1;
}

void __74__STLockoutPolicyController__requestAdditionalTime_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10[2];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_212E1A000, v4, OS_LOG_TYPE_DEFAULT, "Requested %@ seconds; error: %@", buf, 0x16u);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_212E1A000, v4, OS_LOG_TYPE_DEFAULT, "Requested %@ seconds; request pending", buf, 0xCu);

    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __74__STLockoutPolicyController__requestAdditionalTime_withCompletionHandler___block_invoke_35;
    v9[3] = &unk_24CED43E0;
    objc_copyWeak(v10, (id *)(a1 + 40));
    v10[1] = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x24BDAC9B8], v9);
    objc_destroyWeak(v10);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

void __74__STLockoutPolicyController__requestAdditionalTime_withCompletionHandler___block_invoke_35(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1] == *(_QWORD *)(a1 + 40))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_changeInternalStateTo:", 4);
    WeakRetained = v3;
  }

}

- (BOOL)_actionOneMoreMinuteWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[STLockoutPolicyController _authenticatedApproveForAdditionalTime:withCompletionHandler:](self, "_authenticatedApproveForAdditionalTime:withCompletionHandler:", v4, 60.0);

  return 1;
}

- (BOOL)_actionRemindMeInMinutesWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[STLockoutPolicyController _authenticatedApproveForAdditionalTime:withCompletionHandler:](self, "_authenticatedApproveForAdditionalTime:withCompletionHandler:", v4, 900.0);

  return 1;
}

- (BOOL)_actionRemindMeInOneHourWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[STLockoutPolicyController _authenticatedApproveForAdditionalTime:withCompletionHandler:](self, "_authenticatedApproveForAdditionalTime:withCompletionHandler:", v4, 3600.0);

  return 1;
}

- (BOOL)_actionIgnoreLimitForTodayWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[STLockoutPolicyController _authenticatedApproveForAdditionalTime:withCompletionHandler:](self, "_authenticatedApproveForAdditionalTime:withCompletionHandler:", v4, 0.0);

  return 1;
}

- (id)_makeAskForTimeResource
{
  void *reuseIdentifier;
  void *v4;
  int64_t style;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12[2];
  id location;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__STLockoutPolicyController__makeAskForTimeResource__block_invoke;
  v11[3] = &unk_24CED4430;
  objc_copyWeak(v12, &location);
  v12[1] = reuseIdentifier;
  v4 = (void *)MEMORY[0x2199A6950](v11);
  style = self->_style;
  if (style != 1)
  {
    if (style == 4 && self->_categoryIdentifier)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE844D8]), "initWithCategoryIdentifier:changeHandler:", self->_categoryIdentifier, v4);
LABEL_8:
      v9 = (void *)v6;
      goto LABEL_9;
    }
LABEL_7:
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE844C8]), "initWithBundleIdentifier:changeHandler:", self->_bundleIdentifier, v4);
    goto LABEL_8;
  }
  if (!self->_websiteURL)
    goto LABEL_7;
  v7 = objc_alloc(MEMORY[0x24BE84500]);
  -[NSURL host](self->_websiteURL, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWebsiteDomain:changeHandler:", v8, v4);

LABEL_9:
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v9;
}

void __52__STLockoutPolicyController__makeAskForTimeResource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19[3];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__STLockoutPolicyController__makeAskForTimeResource__block_invoke_2;
  v15[3] = &unk_24CED4408;
  objc_copyWeak(v19, (id *)(a1 + 32));
  v19[1] = *(id *)(a1 + 40);
  v19[2] = a2;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

  objc_destroyWeak(v19);
}

void __52__STLockoutPolicyController__makeAskForTimeResource__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && WeakRetained[1] == *(_QWORD *)(a1 + 64))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_askForTimeResponseWithState:respondingParent:amountGranted:error:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_askForTimeResponseWithState:(int64_t)a3 respondingParent:(id)a4 amountGranted:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  STLockoutPolicyController *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  STAskForTimeResource *askForTimeResource;
  NSObject *v23;
  _BOOL4 v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  NSObject *v28;
  STAskForTimeResource *v29;
  STAskForTimeResource *v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v31 = 67109378;
      *(_DWORD *)&v31[4] = a3;
      *(_WORD *)&v31[8] = 2112;
      *(_QWORD *)&v31[10] = v12;
      v14 = "ask for time response: request state %d, error: %@";
      v15 = v13;
      v16 = 18;
LABEL_4:
      _os_log_impl(&dword_212E1A000, v15, OS_LOG_TYPE_DEFAULT, v14, v31, v16);
    }
LABEL_5:

  }
  else
  {
    dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
    switch(a3)
    {
      case 0:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          goto LABEL_5;
        *(_WORD *)v31 = 0;
        v14 = "ask for time response: unknown";
        v15 = v13;
        v16 = 2;
        goto LABEL_4;
      case 1:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_212E1A000, v17, OS_LOG_TYPE_DEFAULT, "ask for time response: request pending", v31, 2u);
        }

        v18 = self;
        v19 = 4;
        goto LABEL_29;
      case 2:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        *(_WORD *)v31 = 0;
        v21 = "ask for time response: timeout";
        goto LABEL_17;
      case 3:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        *(_WORD *)v31 = 0;
        v21 = "ask for time response: canceled";
LABEL_17:
        _os_log_impl(&dword_212E1A000, v20, OS_LOG_TYPE_DEFAULT, v21, v31, 2u);
LABEL_18:

        askForTimeResource = self->_askForTimeResource;
        self->_askForTimeResource = 0;

        -[STLockoutPolicyController _changeStateToBeforePending](self, "_changeStateToBeforePending");
        break;
      case 4:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (!v24)
            goto LABEL_28;
          *(_DWORD *)v31 = 138412546;
          *(_QWORD *)&v31[4] = v10;
          *(_WORD *)&v31[12] = 2112;
          *(_QWORD *)&v31[14] = v11;
          v25 = "ask for time response: parent %@ approved for %@ seconds";
          v26 = v23;
          v27 = 22;
        }
        else
        {
          if (!v24)
            goto LABEL_28;
          *(_DWORD *)v31 = 138412290;
          *(_QWORD *)&v31[4] = v10;
          v25 = "ask for time response: parent %@ approved for rest of day";
          v26 = v23;
          v27 = 12;
        }
        _os_log_impl(&dword_212E1A000, v26, OS_LOG_TYPE_DEFAULT, v25, v31, v27);
LABEL_28:

        v30 = self->_askForTimeResource;
        self->_askForTimeResource = 0;

        v18 = self;
        v19 = 5;
LABEL_29:
        -[STLockoutPolicyController _changeInternalStateTo:](v18, "_changeInternalStateTo:", v19, *(_OWORD *)v31, *(_QWORD *)&v31[16], v32);
        break;
      case 5:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_212E1A000, v28, OS_LOG_TYPE_DEFAULT, "ask for time response: disapproved", v31, 2u);
        }

        v29 = self->_askForTimeResource;
        self->_askForTimeResource = 0;

        v18 = self;
        v19 = 6;
        goto LABEL_29;
      default:
        break;
    }
  }

}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)websiteURL
{
  return self->_websiteURL;
}

- (void)setWebsiteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)contactsEditable
{
  return self->_contactsEditable;
}

- (unint64_t)state
{
  return self->_state;
}

- (STConversation)conversation
{
  return (STConversation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setConversation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (STConversationContext)conversationContext
{
  return (STConversationContext *)objc_getProperty(self, a2, 136, 1);
}

- (void)setConversationContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)contactsHandles
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setContactsHandles:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsHandles, 0);
  objc_storeStrong((id *)&self->_conversationContext, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_websitePolicyMonitor, 0);
  objc_storeStrong((id *)&self->_websiteURL, 0);
  objc_storeStrong((id *)&self->_applicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_categoryPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_askForTimeResource, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
}

void __79__STLockoutPolicyController_initWithBundleIdentifier_contactsHandles_delegate___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v3 = 2114;
  v4 = v0;
  _os_log_fault_impl(&dword_212E1A000, v1, OS_LOG_TYPE_FAULT, "Failed to request a conversation: %{public}@ for bundle identifier: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)shouldAllowOneMoreMinute
{
  OUTLINED_FUNCTION_4_0(&dword_212E1A000, a2, a3, "Website URL does not have a host: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_changePolicyToCurrentWithCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_212E1A000, v0, v1, "change policy to current error: missing category identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_changePolicyToCurrentWithBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_212E1A000, v0, v1, "change policy to current error: missing application bundle identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_changePolicyToCurrentWithURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_212E1A000, v0, v1, "change policy to current error: missing website URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_handleChangeToPolicy:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_11();
  _os_log_fault_impl(&dword_212E1A000, v0, OS_LOG_TYPE_FAULT, "unexpected policy Shielded", v1, 2u);
  OUTLINED_FUNCTION_9();
}

@end
