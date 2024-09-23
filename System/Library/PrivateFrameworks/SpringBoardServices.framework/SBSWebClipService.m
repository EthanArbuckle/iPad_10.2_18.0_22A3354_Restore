@implementation SBSWebClipService

+ (void)launchWebClipWithIdentifier:(id)a3
{
  objc_msgSend(a1, "launchWebClipWithIdentifier:origin:", a3, 0);
}

+ (void)launchWebClipWithIdentifier:(id)a3 origin:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogWebClip();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (a4 > 2)
      v11 = CFSTR("Unknown");
    else
      v11 = off_1E288EDA0[a4];
    v15 = 138543874;
    v16 = v9;
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_18EB52000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Received request to launch web clip with identifier: %{public}@ origin:%{public}@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(a1, "_setupAndActivateServiceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "launchWebClipWithIdentifier:origin:", v6, v14);

  objc_msgSend(v12, "invalidate");
}

+ (void)updateWebClipPropertiesWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogWebClip();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Received request to update web clip properties with identifier: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(a1, "_setupAndActivateServiceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWebClipPropertiesWithIdentifier:", v4);

  objc_msgSend(v8, "invalidate");
}

+ (id)_setupAndActivateServiceConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSWebClipServiceSessionSpecification identifier](SBSWebClipServiceSessionSpecification, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointForMachName:service:instance:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke;
  v9[3] = &__block_descriptor_40_e42_v16__0___BSServiceConnectionConfiguring__8l;
  v9[4] = a1;
  objc_msgSend(v7, "configureConnection:", v9);
  objc_msgSend(v7, "activate");

  return v7;
}

void __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v2 = a2;
  +[SBSWebClipServiceSessionSpecification interface](SBSWebClipServiceSessionSpecification, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:", v3);

  +[SBSWebClipServiceSessionSpecification serviceQuality](SBSWebClipServiceSessionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setServiceQuality:", v4);

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_2;
  v15[3] = &unk_1E288ED60;
  v8 = v6;
  v16 = v8;
  objc_msgSend(v2, "setActivationHandler:", v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_11;
  v13[3] = &unk_1E288ED60;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v2, "setInterruptionHandler:", v13);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_12;
  v11[3] = &unk_1E288ED60;
  v12 = v9;
  v10 = v9;
  objc_msgSend(v2, "setInvalidationHandler:", v11);

}

void __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogWebClip();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Received activation for connection: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogWebClip();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Received interruption for connection: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogWebClip();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Received invalidation for connection: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

@end
