@implementation BYManagedAppleIDBootstrap

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_6);
  return (id)sharedManager_instance_0;
}

void __42__BYManagedAppleIDBootstrap_sharedManager__block_invoke()
{
  BYManagedAppleIDBootstrap *v0;
  void *v1;

  v0 = objc_alloc_init(BYManagedAppleIDBootstrap);
  v1 = (void *)sharedManager_instance_0;
  sharedManager_instance_0 = (uint64_t)v0;

}

+ (id)delegateBundleIDsForManagedAccount
{
  return &unk_1E4E34708;
}

- (BYManagedAppleIDBootstrap)init
{
  BYManagedAppleIDBootstrap *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  uint64_t v5;
  BYPreferencesController *buddyPreferences;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BYManagedAppleIDBootstrap;
  v2 = -[BYManagedAppleIDBootstrap init](&v8, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)BYUserSwitchContextHasBeenUsed, CFSTR("BYUserSwitchContextHasBeenUsed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    +[BYNetworkMonitor sharedInstance](BYNetworkMonitor, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", v2);

    v2->_silentLoginUpgradeRetryCount = 0;
    +[BYPreferencesController buddyPreferences](BYPreferencesController, "buddyPreferences");
    v5 = objc_claimAutoreleasedReturnValue();
    buddyPreferences = v2->_buddyPreferences;
    v2->_buddyPreferences = (BYPreferencesController *)v5;

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("BYUserSwitchContextHasBeenUsed"), 0);
  v4.receiver = self;
  v4.super_class = (Class)BYManagedAppleIDBootstrap;
  -[BYManagedAppleIDBootstrap dealloc](&v4, sel_dealloc);
}

+ (BOOL)isMultiUser
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiUser");

  return v3;
}

+ (BOOL)isFirstTimeLogin
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isMultiUser"))
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "inFirstLoginSession");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isSettingUpMultiUser
{
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass;
  v11 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getMCProfileConnectionClass_block_invoke;
    v7[3] = &unk_1E4E26900;
    v7[4] = &v8;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userMode") == 1 && !objc_msgSend(v4, "isEphemeralMultiUser");

  return v5;
}

+ (BOOL)isManagedAppleIDSignedIn
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "aa_isManagedAppleID");
  return (char)v2;
}

- (BOOL)isLoginUser
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoginUser");

  return v4;
}

- (void)userSwitchContextHasBeenUsed
{
  NSObject *v3;
  UMUserSwitchContext *userSwitchContext;
  void *v5;
  uint8_t v6[16];

  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "User switch context has been used", v6, 2u);
  }

  userSwitchContext = self->_userSwitchContext;
  if (userSwitchContext)
  {
    self->_userSwitchContext = 0;

    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUserSwitchContextHasBeenUsed");

  }
}

- (UMUserSwitchContext)userSwitchContext
{
  UMUserSwitchContext *userSwitchContext;
  void *v4;
  UMUserSwitchContext *v5;
  UMUserSwitchContext *v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  userSwitchContext = self->_userSwitchContext;
  if (!userSwitchContext)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentUserSwitchContext");
    v5 = (UMUserSwitchContext *)objc_claimAutoreleasedReturnValue();
    v6 = self->_userSwitchContext;
    self->_userSwitchContext = v5;

    if (self->_userSwitchContext)
    {
      _BYLoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = -[UMUserSwitchContext secondaryActionRequired](self->_userSwitchContext, "secondaryActionRequired");
        v9 = CFSTR("NERP");
        if (v8)
          v9 = CFSTR("YASE");
        v11 = 138543362;
        v12 = v9;
        _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Fetched user switch context. Password change required = %{public}@", (uint8_t *)&v11, 0xCu);
      }

    }
    userSwitchContext = self->_userSwitchContext;
  }
  return userSwitchContext;
}

- (NSString)shortLivedToken
{
  void *v2;
  void *v3;
  void *v4;

  -[BYManagedAppleIDBootstrap userSwitchContext](self, "userSwitchContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLivedToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (BOOL)passwordChangeFlowNeedsToRun
{
  void *v2;
  char v3;

  -[BYManagedAppleIDBootstrap userSwitchContext](self, "userSwitchContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "secondaryActionRequired");

  return v3;
}

- (OS_dispatch_queue)notificationQueue
{
  OS_dispatch_queue *notificationQueue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  notificationQueue = self->_notificationQueue;
  if (!notificationQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.purplebuddy.startupNotificationQueue", 0);
    v5 = self->_notificationQueue;
    self->_notificationQueue = v4;

    notificationQueue = self->_notificationQueue;
  }
  return notificationQueue;
}

- (void)postUserSwitchContextHasBeenUsed
{
  OUTLINED_FUNCTION_0_0(&dword_1A4E92000, a1, a3, "Posting user switch context usage...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)ingestManagedBuddyData
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A4E92000, a2, OS_LOG_TYPE_DEBUG, "Buddy data from IdMS: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (BOOL)needsToUpgradeShortLivedToken
{
  void *v3;
  BOOL v4;

  if (!objc_msgSend((id)objc_opt_class(), "isMultiUser"))
    return 0;
  -[BYManagedAppleIDBootstrap shortLivedToken](self, "shortLivedToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)switchToLoginWindowDueToError:(id)a3 completion:(id)a4
{
  void *v4;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _BYLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v9 = 0;
      v10 = v6;
    }
    else if (v6)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "domain");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v4, objc_msgSend(v6, "code"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "Unrecoverable error, switching to Login Window: %{public}@", buf, 0xCu);
    if (v9)
    {

    }
  }

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__BYManagedAppleIDBootstrap_switchToLoginWindowDueToError_completion___block_invoke;
  v14[3] = &unk_1E4E26DE8;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v12, "switchToLoginUserWithError:completionHandler:", v6, v14);

}

void __70__BYManagedAppleIDBootstrap_switchToLoginWindowDueToError_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  NSObject *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = _BYIsInternalInstall();
      v7 = v4;
      if ((v6 & 1) == 0)
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "domain");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(v4, "code"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Switch to Login Window failed: %{public}@", buf, 0xCu);
      if ((v6 & 1) == 0)
      {

      }
    }

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);

}

- (void)_runSilentLoginUpgradeWithCompletion:(id)a3 shortLivedTokenUpgradeCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke;
  v10[3] = &unk_1E4E26E70;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[BYManagedAppleIDBootstrap _upgradeShortLivedTokenCompletion:](self, "_upgradeShortLivedTokenCompletion:", v10);

}

void __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke(id *a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a1[4];
  if (a2)
  {
    objc_msgSend(v6, "postUserSwitchContextHasBeenUsed");
    if (a1[5])
    {
      _BYLoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Short lived token upgrade completed with success. Will call shortLivedTokenUpgradeCompletion", buf, 2u);
      }

      (*((void (**)(void))a1[5] + 2))();
    }
    kdebug_trace();
    v8 = a1[4];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke_45;
    v19[3] = &unk_1E4E26E20;
    v20 = a1[6];
    objc_msgSend(v8, "recoverEMCSWithCompletion:", v19);
    v9 = v20;
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v6, "silentLoginUpgradeRetryCount") <= 1)
  {
    objc_msgSend(a1[4], "setSilentLoginUpgradeRetryCount:", objc_msgSend(a1[4], "silentLoginUpgradeRetryCount") + 1);
    _BYLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(a1[4], "silentLoginUpgradeRetryCount");
      *(_DWORD *)buf = 134217984;
      v22 = v11;
      _os_log_impl(&dword_1A4E92000, v10, OS_LOG_TYPE_DEFAULT, "Retrying Silent Token Upgrade, retry count: %ld", buf, 0xCu);
    }

    +[BYNetworkMonitor sharedInstance](BYNetworkMonitor, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke_47;
    v16[3] = &unk_1E4E26E48;
    v16[4] = a1[4];
    v17 = a1[6];
    v18 = a1[5];
    objc_msgSend(v12, "withMinimumNetworkType:timeout:runBlock:", 1, v16, 10.0);

    v9 = v17;
    goto LABEL_11;
  }
  if (a1[6])
  {
    _BYLoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(a1[4], "silentLoginUpgradeRetryCount");
      *(_DWORD *)buf = 134217984;
      v22 = v14;
      _os_log_impl(&dword_1A4E92000, v13, OS_LOG_TYPE_DEFAULT, "Silent login upgrade failed with an error, retry count: %ld", buf, 0xCu);
    }

    if (a1[5])
    {
      _BYLoggingFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E92000, v15, OS_LOG_TYPE_DEFAULT, "Will call shortLivedTokenUpgradeCompletion", buf, 2u);
      }

      (*((void (**)(void))a1[5] + 2))();
    }
    (*((void (**)(void))a1[6] + 2))();
  }
LABEL_12:

}

void __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke_45(uint64_t a1, char a2, void *a3)
{
  void *v3;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  kdebug_trace();
  if (v6 || (a2 & 1) == 0)
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v9 = 0;
        v10 = v6;
      }
      else if (v6)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "domain");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v6, "code"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 1;
      }
      else
      {
        v9 = 0;
        v10 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_error_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_ERROR, "Continuing despite EMCS recovery failure with error: %{public}@", buf, 0xCu);
      if (v9)
      {

      }
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

}

uint64_t __99__BYManagedAppleIDBootstrap__runSilentLoginUpgradeWithCompletion_shortLivedTokenUpgradeCompletion___block_invoke_47(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v9;
  __int16 v10;

  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v10 = 0;
      v6 = "Timed out waiting for Wi-Fi!";
      v7 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    v9 = 0;
    v6 = "Wi-Fi Acquired!";
    v7 = (uint8_t *)&v9;
    goto LABEL_6;
  }

  return objc_msgSend(*(id *)(a1 + 32), "_runSilentLoginUpgradeWithCompletion:shortLivedTokenUpgradeCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)runSilentLoginUpgradeIfNeededWithCompletion:(id)a3 shortLivedTokenUpgradeCompletion:(id)a4
{
  -[BYManagedAppleIDBootstrap runSilentLoginUpgradeIfNeededWithCompletion:shortLivedTokenUpgradeCompletion:willNotCompleteBlock:](self, "runSilentLoginUpgradeIfNeededWithCompletion:shortLivedTokenUpgradeCompletion:willNotCompleteBlock:", a3, a4, 0);
}

- (void)runSilentLoginUpgradeIfNeededWithCompletion:(id)a3 shortLivedTokenUpgradeCompletion:(id)a4 willNotCompleteBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[5];
  void (**v27)(_QWORD, _QWORD);
  id v28;
  void (**v29)(_QWORD);
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3)
    v7 = a3;
  else
    v7 = &__block_literal_global_49;
  v8 = a5;
  v9 = a4;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85AAF94](v7);
  if (v9)
    v11 = v9;
  else
    v11 = &__block_literal_global_50;
  v12 = (void (**)(_QWORD))MEMORY[0x1A85AAF94](v11);

  if (v8)
    v13 = v8;
  else
    v13 = &__block_literal_global_51;
  v14 = (void *)MEMORY[0x1A85AAF94](v13);

  if ((objc_msgSend((id)objc_opt_class(), "isMultiUser") & 1) == 0)
    goto LABEL_22;
  v15 = -[BYManagedAppleIDBootstrap needsToUpgradeShortLivedToken](self, "needsToUpgradeShortLivedToken");
  v16 = -[BYManagedAppleIDBootstrap passwordChangeFlowNeedsToRun](self, "passwordChangeFlowNeedsToRun");
  if (objc_msgSend((id)objc_opt_class(), "isMultiUser"))
    v17 = v15 && !v16;
  else
    v17 = 0;
  _BYLoggingFacility();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v32 = v15;
    v33 = 1024;
    v34 = v16;
    v35 = 1024;
    v36 = v17;
    _os_log_impl(&dword_1A4E92000, v18, OS_LOG_TYPE_DEFAULT, "Silent token upgrade requirements: needs upgrade: %d, password change required: %d, running silent upgrade: %d", buf, 0x14u);
  }

  if (v17)
  {
    v19 = +[BYManagedAppleIDBootstrap isFirstTimeLogin](BYManagedAppleIDBootstrap, "isFirstTimeLogin");
    v20 = MEMORY[0x1E0C809B0];
    if (v19)
    {
      +[BYAppleIDAccountsManager sharedManager](BYAppleIDAccountsManager, "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "delegateBundleIDsForManagedAccount");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "preloadDefaultLoginParametersWithBundleIDs:", v22);

      dispatch_get_global_queue(25, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = v20;
      block[1] = 3221225472;
      block[2] = __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_53;
      block[3] = &unk_1E4E26958;
      block[4] = self;
      dispatch_async(v23, block);

    }
    CFPreferencesSetAppValue(CFSTR("silentTokenUpgradeInProgress"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.purplebuddy.notbackedup"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy.notbackedup"));
    kdebug_trace();
    _BYLoggingFacility();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v24, OS_LOG_TYPE_DEFAULT, "Waiting for Wi-Fi...", buf, 2u);
    }

    +[BYNetworkMonitor sharedInstance](BYNetworkMonitor, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    v26[1] = 3221225472;
    v26[2] = __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_54;
    v26[3] = &unk_1E4E26F48;
    v26[4] = self;
    v27 = v10;
    v28 = v14;
    v29 = v12;
    objc_msgSend(v25, "withMinimumNetworkType:timeout:runBlock:", 1, v26, 20.0);

  }
  else
  {
LABEL_22:
    v12[2](v12);
    v10[2](v10, 0);
  }

}

id __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_53(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_fetchAKURLBagSynchronously");
}

void __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_54(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[16];

  kdebug_trace();
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Timed out waiting for Wi-Fi!", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_54_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  objc_msgSend(*(id *)(a1 + 32), "setSilentLoginUpgradeRetryCount:", 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_55;
  v15[3] = &unk_1E4E26F20;
  v13 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v14;
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v13, "_runSilentLoginUpgradeWithCompletion:shortLivedTokenUpgradeCompletion:", v15, *(_QWORD *)(a1 + 56));

}

void __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_55(id *a1, void *a2)
{
  id v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v5;
  void (*v6)(void);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  CFPreferencesSetAppValue(CFSTR("silentTokenUpgradeInProgress"), 0, CFSTR("com.apple.purplebuddy.notbackedup"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy.notbackedup"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("silentTokenUpgradeCompleted"), 0, 0, 1u);
  if (!v3)
  {
    objc_msgSend(a1[4], "markUserWithManagedCredentials");
    v6 = (void (*)(void))*((_QWORD *)a1[5] + 2);
LABEL_8:
    v6();
    goto LABEL_9;
  }
  if (!+[BYManagedAppleIDBootstrap isFirstTimeLogin](BYManagedAppleIDBootstrap, "isFirstTimeLogin"))
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_55_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);

    v6 = (void (*)(void))*((_QWORD *)a1[5] + 2);
    goto LABEL_8;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_56;
  v14[3] = &unk_1E4E26EF8;
  v5 = a1[4];
  v15 = a1[5];
  v16 = a1[6];
  objc_msgSend(v5, "switchToLoginWindowDueToError:completion:", v3, v14);

LABEL_9:
}

uint64_t __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_56(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint8_t v5[16];

  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Blocking indefinitely as we are attempting logout.", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_runPostStartupTasksWithAccountStore:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  id v18;
  void (*v19)(_QWORD *, _QWORD *);
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void (**v25)(_QWORD);
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[BYManagedAppleIDBootstrap authenticationResults](self, "authenticationResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCF68]), "initWithAccountStore:", v6);
    -[BYManagedAppleIDBootstrap authenticationResults](self, "authenticationResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYManagedAppleIDBootstrap _authenticationContextWithAuthenticationResults:](self, "_authenticationContextWithAuthenticationResults:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke;
    v32[3] = &unk_1E4E26F70;
    v32[4] = self;
    v33 = v6;
    v13 = (void *)MEMORY[0x1A85AAF94](v32);
    v29[0] = v12;
    v29[1] = 3221225472;
    v29[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_59;
    v29[3] = &unk_1E4E26F70;
    v14 = v9;
    v30 = v14;
    v15 = v11;
    v31 = v15;
    v16 = (_QWORD *)MEMORY[0x1A85AAF94](v29);
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_61;
    v26[3] = &unk_1E4E26F70;
    v27 = v14;
    v28 = v15;
    v17 = v15;
    v18 = v14;
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_64;
    v22[3] = &unk_1E4E27010;
    v23 = v13;
    v24 = (id)MEMORY[0x1A85AAF94](v26);
    v25 = v7;
    v19 = (void (*)(_QWORD *, _QWORD *))v16[2];
    v20 = v24;
    v21 = v13;
    v19(v16, v22);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BYAppleIDAccountsManager *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = [BYAppleIDAccountsManager alloc];
  objc_msgSend((id)objc_opt_class(), "delegateBundleIDsForManagedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BYAppleIDAccountsManager initForDelegateBundleIDs:](v4, "initForDelegateBundleIDs:", v5);

  objc_msgSend(*(id *)(a1 + 40), "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2;
  v9[3] = &unk_1E4E26E20;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v6, "enableDataClassesForAccount:completion:", v7, v9);

}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v3;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _BYLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v8 = 0;
      v9 = v6;
    }
    else if (v6)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "domain");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v6, "code"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    *(_DWORD *)buf = 67109378;
    v13 = a2;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Finished enabling data classes with success: %d, error: %{public}@", buf, 0x12u);
    if (v8)
    {

    }
  }

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_59(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *MEMORY[0x1E0CFCF38];
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_60;
  v8[3] = &unk_1E4E26E20;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "signInService:withContext:completion:", v4, v5, v8);

}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_60(uint64_t a1, int a2, void *a3)
{
  void *v3;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _BYLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v8 = 0;
      v9 = v6;
    }
    else if (v6)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "domain");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v6, "code"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    *(_DWORD *)buf = 67109378;
    v13 = a2;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Finished signing in iTunes account with success: %d, error: %{public}@", buf, 0x12u);
    if (v8)
    {

    }
  }

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *MEMORY[0x1E0CFCF20];
  v11[0] = *MEMORY[0x1E0CFCF30];
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_62;
  v9[3] = &unk_1E4E26F98;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "signInToServices:usingContext:completion:", v6, v7, v9);

}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_62(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Finished signing in Messages & FaceTime account with success: %d, result: %{public}@", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_64(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_65;
  v3[3] = &unk_1E4E26FE8;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

void __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_2_65(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_3;
  v2[3] = &unk_1E4E26FC0;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v2);

}

uint64_t __77__BYManagedAppleIDBootstrap__runPostStartupTasksWithAccountStore_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)recoverEMCSWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[8];
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Starting EMCS Recovery...", buf, 2u);
  }

  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v5 = (void *)getSecureBackupClass_softClass;
  v25 = getSecureBackupClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getSecureBackupClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = (uint64_t)__getSecureBackupClass_block_invoke;
    v20 = &unk_1E4E26900;
    v21 = &v22;
    __getSecureBackupClass_block_invoke((uint64_t)buf);
    v5 = (void *)v23[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v22, 8);
  v8 = (void *)objc_opt_new();
  *(_QWORD *)buf = 0;
  v18 = (uint64_t)buf;
  v19 = 0x2020000000;
  v9 = (id *)getkSecureBackupContainsEMCSDataKeySymbolLoc_ptr;
  v20 = (void *)getkSecureBackupContainsEMCSDataKeySymbolLoc_ptr;
  if (!getkSecureBackupContainsEMCSDataKeySymbolLoc_ptr)
  {
    v10 = (void *)CloudServicesLibrary();
    v9 = (id *)dlsym(v10, "kSecureBackupContainsEMCSDataKey");
    *(_QWORD *)(v18 + 24) = v9;
    getkSecureBackupContainsEMCSDataKeySymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(buf, 8);
  if (!v9)
  {
    +[BYSiriUtilities deviceSupportsSystemAssistantExperience].cold.1();
    __break(1u);
  }
  v26 = *v9;
  v27[0] = MEMORY[0x1E0C9AAB0];
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = v26;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __55__BYManagedAppleIDBootstrap_recoverEMCSWithCompletion___block_invoke;
  v15[3] = &unk_1E4E27038;

  v16 = v3;
  v14 = v3;
  objc_msgSend(v8, "recoverWithInfo:completionBlock:", v13, v15);

}

void __55__BYManagedAppleIDBootstrap_recoverEMCSWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v7 = 0;
      v8 = v5;
    }
    else if (v5)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "domain");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v5, "code"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "EMCS recovery completed with error: %{public}@", buf, 0xCu);
    if (v7)
    {

    }
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v5 == 0, v5);

}

- (void)_createAppleAccountWithAuthenticationResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  kdebug_trace();
  v8 = objc_alloc_init((Class)getACAccountStoreClass());
  -[BYManagedAppleIDBootstrap _authenticationContextWithAuthenticationResults:](self, "_authenticationContextWithAuthenticationResults:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCF68]), "initWithAccountStore:", v8);
  v11 = *MEMORY[0x1E0CFCF18];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__BYManagedAppleIDBootstrap__createAppleAccountWithAuthenticationResults_completion___block_invoke;
  v13[3] = &unk_1E4E26E20;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v10, "signInService:withContext:completion:", v11, v9, v13);

}

void __85__BYManagedAppleIDBootstrap__createAppleAccountWithAuthenticationResults_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _BYLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v8 = 0;
      v9 = v6;
    }
    else if (v6)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "domain");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v6, "code"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    *(_DWORD *)buf = 67109378;
    v13 = a2;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Finished signing in iCloud account with success: %d, error: %{public}@", buf, 0x12u);
    if (v8)
    {

    }
  }

  kdebug_trace();
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v6);

}

- (void)_registerForStartupCompletionNotificationWithTask:(id)a3
{
  id v4;
  const char *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD handler[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v5 = (const char *)objc_msgSend(CFSTR("com.apple.LoginKit.isLoggedIn"), "UTF8String");
  -[BYManagedAppleIDBootstrap notificationQueue](self, "notificationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __79__BYManagedAppleIDBootstrap__registerForStartupCompletionNotificationWithTask___block_invoke;
  handler[3] = &unk_1E4E27060;
  v8 = v4;
  v17 = v8;
  v18 = v19;
  LODWORD(v5) = notify_register_dispatch(v5, &self->_notifyToken, v6, handler);

  if ((_DWORD)v5)
  {
    _BYLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BYManagedAppleIDBootstrap _registerForStartupCompletionNotificationWithTask:].cold.1(v9);

  }
  v10 = dispatch_time(0, 30000000000);
  -[BYManagedAppleIDBootstrap notificationQueue](self, "notificationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __79__BYManagedAppleIDBootstrap__registerForStartupCompletionNotificationWithTask___block_invoke_68;
  v13[3] = &unk_1E4E27088;
  v14 = v8;
  v15 = v19;
  v12 = v8;
  dispatch_after(v10, v11, v13);

  _Block_object_dispose(v19, 8);
}

uint64_t __79__BYManagedAppleIDBootstrap__registerForStartupCompletionNotificationWithTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "User logged in notification received", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      result = (*(uint64_t (**)(void))(result + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t __79__BYManagedAppleIDBootstrap__registerForStartupCompletionNotificationWithTask___block_invoke_68(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Stop waiting for startup completion", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      result = (*(uint64_t (**)(void))(result + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)_upgradeShortLivedTokenCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _BYTE *v36;
  __int128 *v37;
  BOOL v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE buf[24];
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Running silent short-lived token upgrade...", buf, 2u);
  }

  *(_QWORD *)&v43 = 0;
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E4E271E0;
    *(_QWORD *)&buf[16] = 0;
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleAccountLibraryCore_frameworkLibrary)
    {
      v31 = v43;
      v30 = (void *)abort_report_np();
      __break(1u);
      free(v30);
    }
  }
  -[BYManagedAppleIDBootstrap shortLivedToken](self, "shortLivedToken", v31);
  v6 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alternateDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _BYLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v49 = v6;
    _os_log_debug_impl(&dword_1A4E92000, v10, OS_LOG_TYPE_DEBUG, "Username: %@, altDSID: %@, SLT: %@", buf, 0x20u);
  }

  if (v8 && v9 && v6)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v49 = __Block_byref_object_copy__1;
    v50 = __Block_byref_object_dispose__1;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v11 = (void *)getAKAppleIDAuthenticationContextClass_softClass;
    v42 = getAKAppleIDAuthenticationContextClass_softClass;
    if (!getAKAppleIDAuthenticationContextClass_softClass)
    {
      *(_QWORD *)&v43 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v43 + 1) = 3221225472;
      v44 = (uint64_t)__getAKAppleIDAuthenticationContextClass_block_invoke;
      v45 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E26900;
      v46 = (void (*)(uint64_t))&v39;
      __getAKAppleIDAuthenticationContextClass_block_invoke((uint64_t)&v43);
      v11 = (void *)v40[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v39, 8);
    v51 = objc_alloc_init(v12);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setShouldPreventInteractiveAuth:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setUsername:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_setShortLivedToken:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setAltDSID:", v9);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setShouldUpdatePersistentServiceTokens:", 1);
    -[BYManagedAppleIDBootstrap _modifyAuthenticationContextIfNeeded:](self, "_modifyAuthenticationContextIfNeeded:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v13 = objc_alloc_init((Class)getACAccountStoreClass());
    objc_msgSend(v13, "aa_primaryAppleAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

    _BYLoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("NERP");
      if (v14)
        v17 = CFSTR("YASE");
      LODWORD(v43) = 138412290;
      *(_QWORD *)((char *)&v43 + 4) = v17;
      _os_log_impl(&dword_1A4E92000, v16, OS_LOG_TYPE_DEFAULT, "Primary account exists: %@", (uint8_t *)&v43, 0xCu);
    }

    if (!v14)
      v18 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setFirstTimeLogin:", 1);
    *(_QWORD *)&v43 = 0;
    *((_QWORD *)&v43 + 1) = &v43;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__1;
    v46 = __Block_byref_object_dispose__1;
    v47 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass(v18, v19, v20, v21, v22, v23, v24, v25));
    kdebug_trace();
    v26 = *(void **)(*((_QWORD *)&v43 + 1) + 40);
    v27 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke;
    v33[3] = &unk_1E4E27128;
    v38 = v15;
    v35 = v4;
    v33[4] = self;
    v28 = v13;
    v34 = v28;
    v36 = buf;
    v37 = &v43;
    objc_msgSend(v26, "authenticateWithContext:completion:", v27, v33);

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(buf, 8);

  }
  else if (v4)
  {
    _BYLoggingFacility();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v29, OS_LOG_TYPE_DEFAULT, "Missing required data to do token upgrade", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  kdebug_trace();
  _BYLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Silent token upgrade error: %@", buf, 0xCu);
  }

  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_9:
      v9();
    }
  }
  else
  {
    if (!*(_BYTE *)(a1 + 72))
    {
      v11 = objc_msgSend(v5, "copy");
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 48);
      *(_QWORD *)(v12 + 48) = v11;

      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_69;
      v19[3] = &unk_1E4E27100;
      v14 = *(void **)(a1 + 40);
      v20 = *(id *)(a1 + 32);
      v21 = v14;
      v22 = *(id *)(a1 + 48);
      objc_msgSend(v20, "_createAppleAccountWithAuthenticationResults:completion:", v5, v19);

      goto LABEL_11;
    }
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
    {
      v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_9;
    }
  }
LABEL_11:
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = 0;

}

void __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_69(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v5 = a3;
  if ((_DWORD)a2)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__1;
    v16[4] = __Block_byref_object_dispose__1;
    v17 = (id)os_transaction_create();
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerUserSwitchStakeHolder:", a1[4]);

    objc_msgSend(MEMORY[0x1E0DC5F08], "taskWithName:reason:", CFSTR("BuddUserSwitchBlockingTask"), CFSTR("Post Startup tasks"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "begin");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_2;
    v11[3] = &unk_1E4E270D8;
    v8 = (void *)a1[5];
    v12 = (id)a1[4];
    v13 = v8;
    v9 = v7;
    v14 = v9;
    v15 = v16;
    objc_msgSend(v12, "_registerForStartupCompletionNotificationWithTask:", v11);

    _Block_object_dispose(v16, 8);
  }
  v10 = a1[6];
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

void __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_3;
  v6[3] = &unk_1E4E270B0;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "_runPostStartupTasksWithAccountStore:completion:", v3, v6);

}

void __63__BYManagedAppleIDBootstrap__upgradeShortLivedTokenCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "end");
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterStakeHolder:status:reason:", *(_QWORD *)(a1 + 40), 0, CFSTR("Tasks completed"));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)_languageConfigurationDictionary
{
  return CFPreferencesCopyMultiple((CFArrayRef)&unk_1E4E34720, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

- (void)writeAccountConfigurationIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if ((objc_msgSend((id)objc_opt_class(), "isMultiUser") & 1) != 0)
  {
    dispatch_get_global_queue(25, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke;
    v6[3] = &unk_1E4E27178;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

void __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  CFDictionaryRef v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alternateDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Write account configuration? altDSID = %@", (uint8_t *)&buf, 0xCu);
  }

  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = CFPreferencesCopyMultiple(0, CFSTR("com.apple.purplebuddy"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);
    objc_msgSend(*(id *)(a1 + 32), "buddyPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v9);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SetupDone"));
    _BYLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A4E92000, v10, OS_LOG_TYPE_DEFAULT, "Writing defaults to IdMS...", (uint8_t *)&buf, 2u);
    }

    if (_BYLoggingEnabled())
    {
      _BYLoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_1A4E92000, v11, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_languageConfigurationDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__1;
    v33 = __Block_byref_object_dispose__1;
    getAKAppleIDAuthenticationControllerClass((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    v34 = (id)objc_opt_new();
    v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v21 = (void *)objc_msgSend(v6, "copy");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke_95;
    v25[3] = &unk_1E4E27150;
    p_buf = &buf;
    v22 = v12;
    v26 = v22;
    v27 = v4;
    v28 = *(id *)(a1 + 40);
    objc_msgSend(v20, "setConfigurationInfo:forIdentifier:forAltDSID:completion:", v21, CFSTR("com.apple.idms.config.BuddyData"), v27, v25);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    _BYLoggingFacility();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A4E92000, v23, OS_LOG_TYPE_DEFAULT, "No account altDSID, not writing configuration data.", (uint8_t *)&buf, 2u);
    }

    v24 = *(_QWORD *)(a1 + 40);
    if (v24)
      (*(void (**)(void))(v24 + 16))();
  }

}

void __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke_95(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v17 = a2;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Wrote Buddy data to IdMS, success = %d, error = %@", buf, 0x12u);
  }

  v7 = (void *)a1[6];
  v8 = *(_QWORD *)(a1[7] + 8);
  v14[0] = MEMORY[0x1E0C809B0];
  v9 = *(void **)(v8 + 40);
  v14[2] = __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke_96;
  v14[3] = &unk_1E4E26E20;
  v10 = a1[4];
  v11 = a1[5];
  v14[1] = 3221225472;
  v15 = v7;
  objc_msgSend(v9, "setConfigurationInfo:forIdentifier:forAltDSID:completion:", v10, CFSTR("com.apple.idms.config.Language"), v11, v14);
  v12 = *(_QWORD *)(a1[7] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

void __77__BYManagedAppleIDBootstrap_writeAccountConfigurationIfNeededWithCompletion___block_invoke_96(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Wrote Language data to IdMS, success = %d, error = %@", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (id)_fetchAKURLBagSynchronously
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "requestNewURLBagIfNecessaryWithError:", &v12);
  v3 = v12;

  if (v3)
  {
    _BYLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BYManagedAppleIDBootstrap _fetchAKURLBagSynchronously].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return v3;
}

- (id)_authenticationContextWithAuthenticationResults:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CFCF58];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setAuthenticationResults:", v4);

  objc_msgSend(v5, "setShouldForceOperation:", 0);
  objc_msgSend(v5, "setOperationUIPermissions:", 0);
  return v5;
}

- (void)markUserWithManagedCredentials
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "refetchUser");
  if ((objc_msgSend(v3, "hasManagedCredentials") & 1) == 0)
  {
    _BYLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "User has a managed credential set up, update it", v6, 2u);
    }

    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "setHasManagedCredentials:", 1);
    objc_msgSend(v5, "commitChanges");

  }
}

- (void)_modifyAuthenticationContextIfNeeded:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (os_variant_has_internal_ui())
  {
    objc_msgSend(v6, "altDSID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsString:", CFSTR("restrictionlessLogin"));

    if (v4)
    {
      objc_msgSend(v6, "setAltDSID:", 0);
      objc_msgSend(v6, "_shortLivedToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setPassword:", v5);

      objc_msgSend(v6, "_setShortLivedToken:", 0);
    }
  }

}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (BOOL)shouldRetrySilentLoginUpgrade
{
  return self->_shouldRetrySilentLoginUpgrade;
}

- (void)setShouldRetrySilentLoginUpgrade:(BOOL)a3
{
  self->_shouldRetrySilentLoginUpgrade = a3;
}

- (int64_t)silentLoginUpgradeRetryCount
{
  return self->_silentLoginUpgradeRetryCount;
}

- (void)setSilentLoginUpgradeRetryCount:(int64_t)a3
{
  self->_silentLoginUpgradeRetryCount = a3;
}

- (NSDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void)setAuthenticationResults:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationResults, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_authenticationResults, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_userSwitchContext, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
}

void __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_54_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A4E92000, a1, a3, "Wi-Fi Acquired!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __127__BYManagedAppleIDBootstrap_runSilentLoginUpgradeIfNeededWithCompletion_shortLivedTokenUpgradeCompletion_willNotCompleteBlock___block_invoke_55_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1A4E92000, a2, a3, "Failed to upgrade the short lived token due to error, but continuing anyway. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_registerForStartupCompletionNotificationWithTask:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E92000, log, OS_LOG_TYPE_ERROR, "Failed to regsiter for startup notification", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchAKURLBagSynchronously
{
  OUTLINED_FUNCTION_1_0(&dword_1A4E92000, a2, a3, "Fetching AKURLBag failed with error:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
