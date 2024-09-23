@implementation BYSilentLoginUpgradeGuarantor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  return (id)sharedInstance_sharedInstance_0;
}

void __47__BYSilentLoginUpgradeGuarantor_sharedInstance__block_invoke()
{
  BYSilentLoginUpgradeGuarantor *v0;
  void *v1;

  v0 = objc_alloc_init(BYSilentLoginUpgradeGuarantor);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (BYSilentLoginUpgradeGuarantor)init
{
  BYSilentLoginUpgradeGuarantor *v2;
  BYSilentLoginUpgradeGuarantor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BYSilentLoginUpgradeGuarantor;
  v2 = -[BYSilentLoginUpgradeGuarantor init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BYSilentLoginUpgradeGuarantor setDidEnsureQueuesAndStartSilentLoginUpgrade:](v2, "setDidEnsureQueuesAndStartSilentLoginUpgrade:", 0);
  return v3;
}

- (void)_ensureQueuesAndStartSilentLoginUpgrade
{
  BYSilentLoginUpgradeGuarantor *v2;
  dispatch_queue_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!-[BYSilentLoginUpgradeGuarantor didEnsureQueuesAndStartSilentLoginUpgrade](v2, "didEnsureQueuesAndStartSilentLoginUpgrade"))
  {
    v3 = dispatch_queue_create("com.apple.purplebuddy.silentloginupgradecompletion", 0);
    -[BYSilentLoginUpgradeGuarantor setSilentLoginUpgradeCompletionQueue:](v2, "setSilentLoginUpgradeCompletionQueue:", v3);

    -[BYSilentLoginUpgradeGuarantor silentLoginUpgradeCompletionQueue](v2, "silentLoginUpgradeCompletionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v4);

    v5 = dispatch_queue_create("com.apple.purplebuddy.shortlivedtokenupgradecompletion", 0);
    -[BYSilentLoginUpgradeGuarantor setShortLivedTokenUpgradeCompletionQueue:](v2, "setShortLivedTokenUpgradeCompletionQueue:", v5);

    -[BYSilentLoginUpgradeGuarantor shortLivedTokenUpgradeCompletionQueue](v2, "shortLivedTokenUpgradeCompletionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v6);

    +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[4] = v2;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__BYSilentLoginUpgradeGuarantor__ensureQueuesAndStartSilentLoginUpgrade__block_invoke;
    v9[3] = &unk_1E4E27218;
    v9[4] = v2;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__BYSilentLoginUpgradeGuarantor__ensureQueuesAndStartSilentLoginUpgrade__block_invoke_5;
    v8[3] = &unk_1E4E26958;
    objc_msgSend(v7, "runSilentLoginUpgradeIfNeededWithCompletion:shortLivedTokenUpgradeCompletion:", v9, v8);

    -[BYSilentLoginUpgradeGuarantor setDidEnsureQueuesAndStartSilentLoginUpgrade:](v2, "setDidEnsureQueuesAndStartSilentLoginUpgrade:", 1);
  }
  objc_sync_exit(v2);

}

void __72__BYSilentLoginUpgradeGuarantor__ensureQueuesAndStartSilentLoginUpgrade__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Daemon did finish silent upgrade. Resuming completion queue.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "silentLoginUpgradeCompletionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v3);

}

void __72__BYSilentLoginUpgradeGuarantor__ensureQueuesAndStartSilentLoginUpgrade__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Daemon did finish short lived token upgrade. Resuming completion queue.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "shortLivedTokenUpgradeCompletionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v3);

}

- (void)blockUntilSilentLoginUpgradeCompletesForNonLoginUser
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[BYSilentLoginUpgradeGuarantor _ensureQueuesAndStartSilentLoginUpgrade](self, "_ensureQueuesAndStartSilentLoginUpgrade");
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "blockUntilSilentLoginUpgradeCompletesForNonLoginUser will schedule block.", v5, 2u);
  }

  -[BYSilentLoginUpgradeGuarantor silentLoginUpgradeCompletionQueue](self, "silentLoginUpgradeCompletionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v4, &__block_literal_global_6);

}

void __85__BYSilentLoginUpgradeGuarantor_blockUntilSilentLoginUpgradeCompletesForNonLoginUser__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "blockUntilSilentLoginUpgradeCompletesForNonLoginUser returning.", v1, 2u);
  }

}

- (void)blockUntilSilentLoginUpgradeCompletes
{
  void *v3;
  char v4;

  +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoginUser");

  if ((v4 & 1) != 0)
    -[BYSilentLoginUpgradeGuarantor didShortCircuitSilentLoginUpgrade](self, "didShortCircuitSilentLoginUpgrade");
  else
    -[BYSilentLoginUpgradeGuarantor blockUntilSilentLoginUpgradeCompletesForNonLoginUser](self, "blockUntilSilentLoginUpgradeCompletesForNonLoginUser");
}

- (void)blockUntilShortLivedTokenUpgradeCompletes
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoginUser");

  if ((v4 & 1) != 0)
  {
    -[BYSilentLoginUpgradeGuarantor didShortCircuitShortLivedTokenUpgrade](self, "didShortCircuitShortLivedTokenUpgrade");
  }
  else
  {
    -[BYSilentLoginUpgradeGuarantor _ensureQueuesAndStartSilentLoginUpgrade](self, "_ensureQueuesAndStartSilentLoginUpgrade");
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "blockUntilShortLivedTokenUpgradeCompletes will schedule block.", v7, 2u);
    }

    -[BYSilentLoginUpgradeGuarantor shortLivedTokenUpgradeCompletionQueue](self, "shortLivedTokenUpgradeCompletionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v6, &__block_literal_global_7);

  }
}

void __74__BYSilentLoginUpgradeGuarantor_blockUntilShortLivedTokenUpgradeCompletes__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _BYLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A4E92000, v0, OS_LOG_TYPE_DEFAULT, "blockUntilShortLivedTokenUpgradeCompletes returning.", v1, 2u);
  }

}

- (BOOL)didEnsureQueuesAndStartSilentLoginUpgrade
{
  return self->_didEnsureQueuesAndStartSilentLoginUpgrade;
}

- (void)setDidEnsureQueuesAndStartSilentLoginUpgrade:(BOOL)a3
{
  self->_didEnsureQueuesAndStartSilentLoginUpgrade = a3;
}

- (OS_dispatch_queue)silentLoginUpgradeCompletionQueue
{
  return self->_silentLoginUpgradeCompletionQueue;
}

- (void)setSilentLoginUpgradeCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_silentLoginUpgradeCompletionQueue, a3);
}

- (OS_dispatch_queue)shortLivedTokenUpgradeCompletionQueue
{
  return self->_shortLivedTokenUpgradeCompletionQueue;
}

- (void)setShortLivedTokenUpgradeCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_shortLivedTokenUpgradeCompletionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortLivedTokenUpgradeCompletionQueue, 0);
  objc_storeStrong((id *)&self->_silentLoginUpgradeCompletionQueue, 0);
}

@end
