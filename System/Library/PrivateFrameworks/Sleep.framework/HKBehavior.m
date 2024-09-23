@implementation HKBehavior

void __84___HKBehavior_HKSPSleep__hksp_activePairedDeviceHasSleepAppInstalledWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HKSPLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_error_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_ERROR, "failed to fetch installed applications: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
