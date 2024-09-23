@implementation RBSLaunchContext

void __67__RBSLaunchContext_RBLaunchChecks___recordPassesEligibilityChecks___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;

  v7 = a3;
  v8 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v8, "objectForKey:ofClass:", v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_msgSend(*(id *)(a1 + 40), "_deviceIsEligibleForDomain:", v7) & 1) == 0)
  {
    rbs_process_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __67__RBSLaunchContext_RBLaunchChecks___recordPassesEligibilityChecks___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __59__RBSLaunchContext_RBLaunchChecks___sharedPreflightManager__block_invoke()
{
  uint64_t v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  id v4;
  void *v5;

  v0 = objc_opt_class();
  if (v0)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_queue_create("com.apple.runningboardservices.regulatory", v1);
    v3 = (void *)_sharedPreflightManager_queue;
    _sharedPreflightManager_queue = (uint64_t)v2;

    v4 = objc_alloc(MEMORY[0x24BE788A0]);
    v0 = objc_msgSend(v4, "initWithTargetQueue:", _sharedPreflightManager_queue);
  }
  v5 = (void *)_sharedPreflightManager_preflightManager;
  _sharedPreflightManager_preflightManager = v0;

}

void __58__RBSLaunchContext_RBLaunchChecks___needsEligibilityCheck__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24DD5FCF0);
  v1 = (void *)_needsEligibilityCheck_allowed;
  _needsEligibilityCheck_allowed = v0;

}

void __67__RBSLaunchContext_RBLaunchChecks___recordPassesEligibilityChecks___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "device is ineligible for domain %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
