@implementation SBDashBoardExtensionAlwaysCapturePolicy

- (SBDashBoardExtensionAlwaysCapturePolicy)initWithCaptureApplicationMonitor:(id)a3
{
  id v5;
  SBDashBoardExtensionAlwaysCapturePolicy *v6;
  SBDashBoardExtensionAlwaysCapturePolicy *v7;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardExtensionAlwaysCapturePolicy;
  v6 = -[SBDashBoardExtensionAlwaysCapturePolicy init](&v11, sel_init);
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

- (SBDashBoardExtensionAlwaysCapturePolicy)init
{
  id v3;
  SBDashBoardExtensionAlwaysCapturePolicy *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D44658]);
  v4 = -[SBDashBoardExtensionAlwaysCapturePolicy initWithCaptureApplicationMonitor:](self, "initWithCaptureApplicationMonitor:", v3);

  return v4;
}

- (id)resolveCameraDestinationLaunchOf:(id)a3 fromSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __CFString **v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  SBDashBoardSecureCaptureExtensionHostableEntity *v15;
  SBDashBoardSecureCaptureExtensionHostableEntity *v16;
  BOOL v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a3, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[LCSCaptureApplicationMonitor knownCaptureApplicationsByBundleIdentifier](self->_applicationMonitor, "knownCaptureApplicationsByBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.camera"));
  v11 = &SBDashBoardCapturePlacementCameraOverlay;
  if (v10)
    v11 = &SBDashBoardCapturePlacementCameraPage;
  v12 = *v11;
  if (_os_feature_enabled_impl()
    && objc_msgSend(v6, "isEqualToString:", SBDashBoardCaptureLaunchSourceCaptureButton))
  {
    v13 = SBDashBoardCapturePlacementCaptureButtonCameraPage;

    v12 = v13;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v16 = 0;
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  v15 = -[SBDashBoardSecureCaptureExtensionHostableEntity initWithCaptureApplication:]([SBDashBoardSecureCaptureExtensionHostableEntity alloc], "initWithCaptureApplication:", v14);
  v16 = v15;
  if (v12)
    v17 = v15 == 0;
  else
    v17 = 1;
  if (v17)
    goto LABEL_13;
  +[SBDashBoardCaptureLaunchDestination launchDestinationWithPlacement:entity:](SBDashBoardCaptureLaunchDestination, "launchDestinationWithPlacement:entity:", v12, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

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
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  SBDashBoardCameraPrewarmConfiguration *v14;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "prewarmType");
  objc_msgSend(v6, "applicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "captureApplicationForBundleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "extension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == 2)
  {
    v13 = 0;
  }
  else if (v7 == 1)
  {
    v12 = v8;

    v13 = 0;
    v11 = v12;
  }
  else
  {
    v13 = 2;
  }
  v14 = -[SBDashBoardCameraPrewarmConfiguration initWithPrewarmCameraHardware:prewarmForCaptureLaunch:backgroundLaunchTarget:applicationBundleIdentifier:prewarmingBundleIdentifier:]([SBDashBoardCameraPrewarmConfiguration alloc], "initWithPrewarmCameraHardware:prewarmForCaptureLaunch:backgroundLaunchTarget:applicationBundleIdentifier:prewarmingBundleIdentifier:", 1, 1, v13, v8, v11);

  return v14;
}

- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4
{
  BSDispatchMain();
}

void __97__SBDashBoardExtensionAlwaysCapturePolicy_captureApplicationProvider_didUpdateKnownApplications___block_invoke(uint64_t a1)
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
