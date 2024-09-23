@implementation SBXXSetAllApplicationsShowSyncIndicator

void ___SBXXSetAllApplicationsShowSyncIndicator_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 48))
  {
    v2 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = ___SBXXSetAllApplicationsShowSyncIndicator_block_invoke_2;
    v16[3] = &unk_1E8E9E820;
    v17 = *(id *)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    v10 = v2;
    v11 = 3221225472;
    v12 = ___SBXXSetAllApplicationsShowSyncIndicator_block_invoke_73;
    v13 = &unk_1E8E9E820;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    +[SBDaemonRequest requestWithEnabler:disabler:](SBDaemonRequest, "requestWithEnabler:disabler:", v16, &v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogStatusBarish();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v20 = v5;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "SBDaemonRequest: adding %{public}@ for %{public}@", buf, 0x16u);
    }

    +[SBDaemonHandler addRequest:forKey:forDaemonPid:](SBDaemonHandler, "addRequest:forKey:forDaemonPid:", v3, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 52), v10, v11, v12, v13);
  }
  else
  {
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "SBDaemonRequest: removing %{public}@ for %{public}@", buf, 0x16u);
    }

    +[SBDaemonHandler removeRequestForKey:forDaemonPid:](SBDaemonHandler, "removeRequestForKey:forDaemonPid:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 52));
  }
}

void ___SBXXSetAllApplicationsShowSyncIndicator_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "SBDaemonRequest: enabling %{public}@ for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend((id)SBApp, "statusBarStateAggregator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsSyncActivityIndicator:", 1);

}

void ___SBXXSetAllApplicationsShowSyncIndicator_block_invoke_73(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "SBDaemonRequest: disabling %{public}@ for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend((id)SBApp, "statusBarStateAggregator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsSyncActivityIndicator:", 0);

}

@end
