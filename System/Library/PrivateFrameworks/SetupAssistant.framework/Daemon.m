@implementation Daemon

void __Daemon_BYSetupAssistantNeedsToRun_block_invoke()
{
  void *v0;
  int v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  _QWORD v6[5];
  id v7;

  +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isLoginUser");

  if (v1)
  {
    _BYLaunchLogSubsystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __Daemon_BYSetupAssistantNeedsToRun_block_invoke_cold_1(v2);

  }
  else
  {
    +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ingestManagedBuddyData");

    Daemon_BYSetupAssistantNeedsToRun_needsToRun = Internal_BYSetupAssistantNeedsToRun();
    if (+[BYManagedAppleIDBootstrap isFirstTimeLogin](BYManagedAppleIDBootstrap, "isFirstTimeLogin"))
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x3032000000;
      v6[3] = __Block_byref_object_copy__2;
      v6[4] = __Block_byref_object_dispose__2;
      v7 = (id)os_transaction_create();
      dispatch_get_global_queue(25, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __Daemon_BYSetupAssistantNeedsToRun_block_invoke_102;
      block[3] = &unk_1E4E26900;
      block[4] = v6;
      dispatch_async(v4, block);

      _Block_object_dispose(v6, 8);
    }
  }
}

void __Daemon_BYSetupAssistantNeedsToRun_block_invoke_102(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  +[BYSilentLoginUpgradeGuarantor sharedInstance](BYSilentLoginUpgradeGuarantor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blockUntilSilentLoginUpgradeCompletesForNonLoginUser");

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __Daemon_BYSetupAssistantNeedsToRun_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E92000, log, OS_LOG_TYPE_ERROR, "In login window. Nothing to do.", v1, 2u);
}

@end
