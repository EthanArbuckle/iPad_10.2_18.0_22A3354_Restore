@implementation SBSSystemAperturePortalSourceInfoRequest

+ (void)rootWindowPortalSourceWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  void (**v22)(id, void *);
  id v23;
  uint8_t buf[16];

  v4 = (void (**)(id, void *))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_RequestLock);
  objc_msgSend(a1, "_portalSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    || (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "bundleIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.springboard")),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    if (v4)
    {
      objc_msgSend(a1, "_portalSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v9);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSSystemAperturePortalSourceInfoRequestServiceSpecification identifier](SBSSystemAperturePortalSourceInfoRequestServiceSpecification, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpointForMachName:service:instance:", v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v14, "configureConnection:", &__block_literal_global_38);
    objc_msgSend(v14, "activate");
    objc_msgSend(v14, "remoteTarget");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      SBLogSystemApertureHosting();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EB52000, v16, OS_LOG_TYPE_DEFAULT, "System Aperture Portal Source request connection handled-requested.", buf, 2u);
      }

      objc_msgSend(v14, "remoteTarget");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_7;
      v21 = &unk_1E288F7E0;
      v23 = a1;
      v22 = v4;
      objc_msgSend(v17, "rootWindowPortalSourceWithCompletion:", &v18);

    }
    objc_msgSend(v14, "invalidate", v18, v19, v20, v21);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_RequestLock);

}

void __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  +[SBSSystemAperturePortalSourceInfoRequestServiceSpecification interface](SBSSystemAperturePortalSourceInfoRequestServiceSpecification, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v2);

  +[SBSSystemAperturePortalSourceInfoRequestServiceSpecification serviceQuality](SBSSystemAperturePortalSourceInfoRequestServiceSpecification, "serviceQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v3);

  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_6_2);
}

void __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_2()
{
  NSObject *v0;

  SBLogSystemApertureHosting();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_2_cold_1(v0);

}

void __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SBLogSystemApertureHosting();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v8)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v9 = "System Aperture Portal Source request connection handled succcessfully.";
    v10 = v7;
    v11 = 2;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    *(_DWORD *)buf = 138543362;
    v18 = v6;
    v9 = "System Aperture Portal Source request connection handled with failure. Error: %{public}@";
    v10 = v7;
    v11 = 12;
  }
  _os_log_impl(&dword_18EB52000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 40), "_setPortalSource:", v5);
  if (*(_QWORD *)(a1 + 32))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_8;
    v14[3] = &unk_1E288DE58;
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = v12;
    v16 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
}

void __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_portalSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (SBSPortalSource)_portalSource
{
  id v2;

  os_unfair_lock_lock(&_PortalSourceLock);
  v2 = (id)_PortalSourceLock_SBSSystemApertureRootWindowPortalSource;
  os_unfair_lock_unlock(&_PortalSourceLock);
  return (SBSPortalSource *)v2;
}

+ (void)_setPortalSource:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock(&_PortalSourceLock);
  v4 = (void *)_PortalSourceLock_SBSSystemApertureRootWindowPortalSource;
  _PortalSourceLock_SBSSystemApertureRootWindowPortalSource = (uint64_t)v3;

  os_unfair_lock_unlock(&_PortalSourceLock);
}

void __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "System Aperture Portal Source request connection invalidated remotely.", v1, 2u);
}

@end
