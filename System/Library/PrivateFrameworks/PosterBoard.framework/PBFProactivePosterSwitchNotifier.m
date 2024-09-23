@implementation PBFProactivePosterSwitchNotifier

- (void)posterExtensionDataStore:(id)a3 didUpdateActiveConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a6;
  v8 = a4;
  objc_msgSend(v8, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLogDataStore();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "Preparing to update proactive poster switch for role %{public}@", buf, 0xCu);
  }

  objc_msgSend(v8, "_path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "serverIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "posterUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9060]), "initWithLockscreenId:switchMechanism:outcome:duration:", v14, v7, &stru_1E86FC5B8, 0);
  objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __121__PBFProactivePosterSwitchNotifier_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke;
  v18[3] = &unk_1E86F26D8;
  v19 = v9;
  v17 = v9;
  objc_msgSend(v16, "logPosterSwitch:completion:", v15, v18);

}

void __121__PBFProactivePosterSwitchNotifier_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PBFLogDataStore();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __121__PBFProactivePosterSwitchNotifier_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "Success logging poster switch to proactive for role %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

void __121__PBFProactivePosterSwitchNotifier_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "Error logging poster switch to proactive for role %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
