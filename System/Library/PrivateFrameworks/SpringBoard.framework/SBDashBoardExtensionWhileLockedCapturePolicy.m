@implementation SBDashBoardExtensionWhileLockedCapturePolicy

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_launchDestinationWithPlacement_entity_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBDashBoardExtensionWhileLockedCapturePolicy.m"), 40, CFSTR("%s is unavailable; use %@ instead"),
    "+[SBDashBoardExtensionWhileLockedCapturePolicy new]",
    v5);

  return 0;
}

- (SBDashBoardExtensionWhileLockedCapturePolicy)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPlacement_entity_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardExtensionWhileLockedCapturePolicy.m"), 44, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBDashBoardExtensionWhileLockedCapturePolicy init]",
    v5);

  return 0;
}

+ (id)policyWithAuthenticationStatusProvider:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D44658];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "policyWithAuthenticationStatusProvider:captureApplicationMonitor:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)policyWithAuthenticationStatusProvider:(id)a3 captureApplicationMonitor:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAuthenticationStatusProvider:captureApplicationMonitor:", v7, v6);

  return v8;
}

- (SBDashBoardExtensionWhileLockedCapturePolicy)initWithAuthenticationStatusProvider:(id)a3 captureApplicationMonitor:(id)a4
{
  id v7;
  id v8;
  SBDashBoardExtensionWhileLockedCapturePolicy *v9;
  SBDashBoardExtensionWhileLockedCapturePolicy *v10;
  uint64_t v11;
  NSHashTable *observers;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardExtensionWhileLockedCapturePolicy;
  v9 = -[SBDashBoardExtensionWhileLockedCapturePolicy init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authenticationStatusProvider, a3);
    objc_storeStrong((id *)&v10->_applicationMonitor, a4);
    -[LCSCaptureApplicationMonitor addObserver:](v10->_applicationMonitor, "addObserver:", v10);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v10, sel__authenticationStateDidChange_, *MEMORY[0x1E0DAA248], 0);

  }
  return v10;
}

- (id)resolveCameraDestinationLaunchOf:(id)a3 fromSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __CFString **v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  SBDashBoardApplicationHostableEntity *v16;
  SBDashBoardApplicationHostableEntity *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[LCSCaptureApplicationMonitor knownCaptureApplicationsByBundleIdentifier](self->_applicationMonitor, "knownCaptureApplicationsByBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBFAuthenticationStatusProvider isAuthenticatedCached](self->_authenticationStatusProvider, "isAuthenticatedCached");
  v12 = &SBDashBoardCapturePlacementCameraPage;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.camera")) & 1) == 0)
  {
    if (objc_msgSend(v7, "isEqualToString:", SBDashBoardCaptureLaunchSourceCaptureButton))
    {
      if (v11)
      {
        if (_os_feature_enabled_impl())
          v12 = &SBDashBoardCapturePlacementCaptureButtonCameraPage;
      }
      else
      {
        v12 = &SBDashBoardCapturePlacementCameraOverlay;
      }
    }
    else
    {
      if ((v11 & 1) != 0)
      {
        v13 = 0;
LABEL_18:
        v18 = 0;
        goto LABEL_19;
      }
      v12 = &SBDashBoardCapturePlacementSecureApp;
    }
  }
  v13 = *v12;
  if (!v13)
    goto LABEL_18;
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_18;
  v15 = (void *)v14;
  v16 = (v11 & 1) != 0
      ? -[SBDashBoardApplicationHostableEntity initWithApplicationSceneEntity:]([SBDashBoardApplicationHostableEntity alloc], "initWithApplicationSceneEntity:", v6): (SBDashBoardApplicationHostableEntity *)-[SBDashBoardSecureCaptureExtensionHostableEntity initWithCaptureApplication:]([SBDashBoardSecureCaptureExtensionHostableEntity alloc], "initWithCaptureApplication:", v14);
  v17 = v16;

  if (!v17)
    goto LABEL_18;
  +[SBDashBoardCaptureLaunchDestination launchDestinationWithPlacement:entity:](SBDashBoardCaptureLaunchDestination, "launchDestinationWithPlacement:entity:", v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v18;
}

- (void)addLaunchPolicyObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeLaunchPolicyObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)prewarmingConfigurationForIdentifier:(id)a3 captureApplicationProvider:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  SBDashBoardCameraPrewarmConfiguration *v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "prewarmType");
  objc_msgSend(v7, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = -[SBFAuthenticationStatusProvider isAuthenticatedCached](self->_authenticationStatusProvider, "isAuthenticatedCached");
  objc_msgSend(v6, "captureApplicationForBundleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v7)
  {
    v11 = v9;
    v12 = 1;
  }
  else
  {
    objc_msgSend(v10, "extension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 2;
  }
  if (v8 == 2)
  {
    v12 = 0;
  }
  else if (v8 == 1)
  {
    v14 = v9;

    v12 = 0;
    v11 = v14;
  }
  v15 = -[SBDashBoardCameraPrewarmConfiguration initWithPrewarmCameraHardware:prewarmForCaptureLaunch:backgroundLaunchTarget:applicationBundleIdentifier:prewarmingBundleIdentifier:]([SBDashBoardCameraPrewarmConfiguration alloc], "initWithPrewarmCameraHardware:prewarmForCaptureLaunch:backgroundLaunchTarget:applicationBundleIdentifier:prewarmingBundleIdentifier:", 1, 1, v12, v9, v11);

  return v15;
}

- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4
{
  BSDispatchMain();
}

uint64_t __102__SBDashBoardExtensionWhileLockedCapturePolicy_captureApplicationProvider_didUpdateKnownApplications___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notePolicyMayHaveChanged");
}

- (void)_notePolicyMayHaveChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "captureLaunchPolicyDidUpdatePolicy:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
}

@end
