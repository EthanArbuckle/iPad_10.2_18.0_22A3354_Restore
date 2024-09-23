@implementation SetDisplayShowsProgress

uint64_t __SetDisplayShowsProgress_block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v4;
    v9 = 1024;
    v10 = v3;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "SBDaemonRequest: enabling %{public}@ for pid: %i (%{public}@)", (uint8_t *)&v7, 0x1Cu);
  }

  return objc_msgSend(*(id *)(a1 + 48), "setShowsProgress:", 1);
}

uint64_t __SetDisplayShowsProgress_block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v4;
    v9 = 1024;
    v10 = v3;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "SBDaemonRequest: disabling %{public}@ for pid: %i (%{public}@)", (uint8_t *)&v7, 0x1Cu);
  }

  return objc_msgSend(*(id *)(a1 + 48), "setShowsProgress:", 0);
}

void __SetDisplayShowsProgress_block_invoke_66(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v4;
    v9 = 1024;
    v10 = v3;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "SBDaemonRequest: enabling %{public}@ for pid: %i (%{public}@)", (uint8_t *)&v7, 0x1Cu);
  }

  objc_msgSend((id)SBApp, "statusBarStateAggregator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsActivityIndicatorEverywhere:", 1);

}

void __SetDisplayShowsProgress_block_invoke_67(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v4;
    v9 = 1024;
    v10 = v3;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "SBDaemonRequest: disabling %{public}@ for pid: %i (%{public}@)", (uint8_t *)&v7, 0x1Cu);
  }

  objc_msgSend((id)SBApp, "statusBarStateAggregator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsActivityIndicatorEverywhere:", 0);

}

@end
