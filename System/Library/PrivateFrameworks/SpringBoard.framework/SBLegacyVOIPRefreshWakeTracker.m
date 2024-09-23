@implementation SBLegacyVOIPRefreshWakeTracker

- (void)dealloc
{
  objc_super v3;

  -[SBLegacyVOIPRefreshWakeTracker setAppKeepAliveAssertion:](self, "setAppKeepAliveAssertion:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBLegacyVOIPRefreshWakeTracker;
  -[SBLegacyVOIPRefreshWakeTracker dealloc](&v3, sel_dealloc);
}

- (BOOL)beginWakeForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  SBLegacyVOIPRefreshWakeTracker *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SBLegacyVOIPRefreshWakeTracker: waking %{public}@.", buf, 0xCu);
  }

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke;
  v12[3] = &unk_1E8EA3AD8;
  v13 = v4;
  v14 = self;
  v15 = v6;
  v9 = v6;
  v10 = v4;
  objc_msgSend(v8, "requestTransitionWithBuilder:", v12);

  return 1;
}

void __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 59);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke_2;
  v9[3] = &unk_1E8E9EE50;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke_3;
  v7[3] = &unk_1E8E9DEB0;
  v5 = *(void **)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v6 = (id)objc_msgSend(v3, "addCompletionHandler:", v7);

}

void __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  SBDeviceApplicationSceneEntity *v6;

  v3 = a2;
  v6 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA318]), "initWithInfo:responder:", 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneEntity addActions:](v6, "addActions:", v5);

  objc_msgSend(v3, "setBackground:", 1);
  objc_msgSend(v3, "setWaitsForSceneUpdates:", 0);
  objc_msgSend(v3, "setEntity:forLayoutRole:", v6, 1);

}

void __58__SBLegacyVOIPRefreshWakeTracker_beginWakeForApplication___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_createAssertionForAppProcessIdentity:", *(_QWORD *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAppKeepAliveAssertion:");

  }
  else
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBLegacyVOIPRefreshWakeTracker: SBWorkspace rejected activation of %{public}@.", buf, 0xCu);
    }

  }
}

- (void)endWake
{
  BSDispatchQueueAssertMain();
  -[SBLegacyVOIPRefreshWakeTracker setAppKeepAliveAssertion:](self, "setAppKeepAliveAssertion:", 0);
}

- (double)wakeDuration
{
  return 10.0;
}

- (void)setAppKeepAliveAssertion:(id)a3
{
  RBSAssertion *v4;
  RBSAssertion *appKeepAliveAssertion;
  RBSAssertion *v6;

  v4 = (RBSAssertion *)a3;
  BSDispatchQueueAssertMain();
  appKeepAliveAssertion = self->_appKeepAliveAssertion;
  if (appKeepAliveAssertion != v4)
    -[RBSAssertion invalidate](appKeepAliveAssertion, "invalidate");
  v6 = self->_appKeepAliveAssertion;
  self->_appKeepAliveAssertion = v4;

}

- (id)_createAssertionForAppProcessIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithProcessIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CB0], "grantUserInitiated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0D87DE8], "withReason:", 10003);
  v7 = objc_claimAutoreleasedReturnValue();
  v22[1] = v7;
  objc_msgSend(MEMORY[0x1E0D87CC8], "grant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v8;
  objc_msgSend(MEMORY[0x1E0D87D08], "grantWithForegroundPriority");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v9;
  objc_msgSend(MEMORY[0x1E0D87DD8], "grantWithResistance:", 30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v10;
  v11 = (void *)MEMORY[0x1E0D87CE0];
  -[SBLegacyVOIPRefreshWakeTracker wakeDuration](self, "wakeDuration");
  objc_msgSend(v11, "invalidateAfterInterval:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", CFSTR("Wake for VoIP Keep Alive"), v5, v13);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__SBLegacyVOIPRefreshWakeTracker__createAssertionForAppProcessIdentity___block_invoke;
  v20[3] = &unk_1E8EA3B00;
  v20[4] = self;
  v15 = v4;
  v21 = v15;
  objc_msgSend(v14, "setInvalidationHandler:", v20);
  v19 = 0;
  LOBYTE(v7) = objc_msgSend(v14, "acquireWithError:", &v19);
  v16 = v19;
  if ((v7 & 1) == 0)
  {
    SBLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SBLegacyVOIPRefreshWakeTracker _createAssertionForAppProcessIdentity:].cold.1((uint64_t)v15, v16, v17);

    v14 = 0;
  }

  return v14;
}

void __72__SBLegacyVOIPRefreshWakeTracker__createAssertionForAppProcessIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v9 = *(id *)(a1 + 40);
  v10 = v6;
  v7 = v6;
  v8 = v5;
  BSDispatchMain();

}

uint64_t __72__SBLegacyVOIPRefreshWakeTracker__createAssertionForAppProcessIdentity___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 8))
  {
    v1 = result;
    SBLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 48);
      objc_msgSend(*(id *)(v1 + 56), "localizedFailureReason");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543618;
      v6 = v3;
      v7 = 2114;
      v8 = v4;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBLegacyVOIPRefreshWakeTracker: keep-alive assertion for %{public}@ invalidated: %{public}@", (uint8_t *)&v5, 0x16u);

    }
    return objc_msgSend(*(id *)(v1 + 40), "setAppKeepAliveAssertion:", 0);
  }
  return result;
}

- (RBSAssertion)appKeepAliveAssertion
{
  return self->_appKeepAliveAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appKeepAliveAssertion, 0);
}

- (void)_createAssertionForAppProcessIdentity:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "SBLegacyVOIPRefreshWakeTracker: failed to acquire keep-alive assertion for %{public}@: %{public}@.", (uint8_t *)&v6, 0x16u);

}

@end
