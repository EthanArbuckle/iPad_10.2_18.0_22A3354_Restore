@implementation SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy

- (SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy)initWithCaptureApplicationMonitor:(id)a3
{
  id v5;
  SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy *v6;
  SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy *v7;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy;
  v6 = -[SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_applicationMonitor, a3);
    -[LCSCaptureApplicationMonitor addObserver:](v7->_applicationMonitor, "addObserver:", v7);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

  }
  return v7;
}

- (SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy)init
{
  id v3;
  SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D44658]);
  v4 = -[SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy initWithCaptureApplicationMonitor:](self, "initWithCaptureApplicationMonitor:", v3);

  return v4;
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
  __CFString *v14;
  void *v15;
  SBDashBoardApplicationHostableEntity *v16;
  SBDashBoardApplicationHostableEntity *v17;
  BOOL v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[LCSCaptureApplicationMonitor knownCaptureApplicationsByBundleIdentifier](self->_applicationMonitor, "knownCaptureApplicationsByBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.camera"));
  v12 = &SBDashBoardCapturePlacementCameraOverlay;
  if (v11)
    v12 = &SBDashBoardCapturePlacementCameraPage;
  v13 = *v12;
  if (_os_feature_enabled_impl()
    && objc_msgSend(v7, "isEqualToString:", SBDashBoardCaptureLaunchSourceCaptureButton))
  {
    v14 = SBDashBoardCapturePlacementCaptureButtonCameraPage;

    v13 = v14;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v17 = 0;
LABEL_16:
    v19 = 0;
    goto LABEL_17;
  }
  if (v11)
    v16 = -[SBDashBoardApplicationHostableEntity initWithApplicationSceneEntity:]([SBDashBoardApplicationHostableEntity alloc], "initWithApplicationSceneEntity:", v6);
  else
    v16 = -[SBDashBoardSecureCaptureExtensionHostableEntity initWithCaptureApplication:]([SBDashBoardSecureCaptureExtensionHostableEntity alloc], "initWithCaptureApplication:", v15);
  v17 = v16;
  if (v13)
    v18 = v16 == 0;
  else
    v18 = 1;
  if (v18)
    goto LABEL_16;
  +[SBDashBoardCaptureLaunchDestination launchDestinationWithPlacement:entity:](SBDashBoardCaptureLaunchDestination, "launchDestinationWithPlacement:entity:", v13, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v19;
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
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  SBDashBoardCameraPrewarmConfiguration *v15;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "prewarmType");
  objc_msgSend(v6, "applicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.camera"));
  objc_msgSend(v5, "captureApplicationForBundleIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = v8;
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
  if (v7 == 2)
  {
    v12 = 0;
  }
  else if (v7 == 1)
  {
    v14 = v8;

    v12 = 0;
    v11 = v14;
  }
  v15 = -[SBDashBoardCameraPrewarmConfiguration initWithPrewarmCameraHardware:prewarmForCaptureLaunch:backgroundLaunchTarget:applicationBundleIdentifier:prewarmingBundleIdentifier:]([SBDashBoardCameraPrewarmConfiguration alloc], "initWithPrewarmCameraHardware:prewarmForCaptureLaunch:backgroundLaunchTarget:applicationBundleIdentifier:prewarmingBundleIdentifier:", 1, v9 ^ 1u, v12, v8, v11);

  return v15;
}

- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4
{
  BSDispatchMain();
}

void __112__SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy_captureApplicationProvider_didUpdateKnownApplications___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "captureLaunchPolicyDidUpdatePolicy:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
}

@end
