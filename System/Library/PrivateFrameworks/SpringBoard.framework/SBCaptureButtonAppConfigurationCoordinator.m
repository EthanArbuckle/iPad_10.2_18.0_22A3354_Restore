@implementation SBCaptureButtonAppConfigurationCoordinator

- (SBCaptureButtonAppConfigurationCoordinator)init
{
  SBCaptureButtonAppConfigurationCoordinator *v2;
  uint64_t v3;
  NSHashTable *observers;
  void *v5;
  uint64_t v6;
  SBCaptureButtonDefaults *captureButtonDefaults;
  SBCaptureButtonDefaults *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSString *associatedAppBundleIdentifier;
  NSSet *v15;
  uint64_t v16;
  NSString *v17;
  NSSet *eligibleAppsBundleIdentifiers;
  uint64_t v19;
  SBSCaptureButtonAppConfigurationServer *server;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SBCaptureButtonAppConfigurationCoordinator;
  v2 = -[SBCaptureButtonAppConfigurationCoordinator init](&v29, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captureButtonDefaults");
    v6 = objc_claimAutoreleasedReturnValue();
    captureButtonDefaults = v2->_captureButtonDefaults;
    v2->_captureButtonDefaults = (SBCaptureButtonDefaults *)v6;

    objc_initWeak(&location, v2);
    v8 = v2->_captureButtonDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "captureButtonAssociatedAppBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __50__SBCaptureButtonAppConfigurationCoordinator_init__block_invoke;
    v26 = &unk_1E8E9DF28;
    objc_copyWeak(&v27, &location);
    v12 = (id)-[SBCaptureButtonDefaults observeDefault:onQueue:withBlock:](v8, "observeDefault:onQueue:withBlock:", v9, v10, &v23);

    -[SBCaptureButtonDefaults captureButtonAssociatedAppBundleIdentifier](v2->_captureButtonDefaults, "captureButtonAssociatedAppBundleIdentifier", v23, v24, v25, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v13, "isEqualToString:", CFSTR("none"));

    if ((_DWORD)v8)
    {
      associatedAppBundleIdentifier = v2->_associatedAppBundleIdentifier;
      v2->_associatedAppBundleIdentifier = 0;

      v15 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    }
    else
    {
      -[SBCaptureButtonDefaults captureButtonAssociatedAppBundleIdentifier](v2->_captureButtonDefaults, "captureButtonAssociatedAppBundleIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v2->_associatedAppBundleIdentifier;
      v2->_associatedAppBundleIdentifier = (NSString *)v16;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2->_associatedAppBundleIdentifier);
      v15 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    eligibleAppsBundleIdentifiers = v2->_eligibleAppsBundleIdentifiers;
    v2->_eligibleAppsBundleIdentifiers = v15;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAAE08]), "initWithAssociatedAppBundleIdentifier:eligibleAppsBundleIdentifiers:delegate:", v2->_associatedAppBundleIdentifier, v2->_eligibleAppsBundleIdentifiers, v2);
    server = v2->_server;
    v2->_server = (SBSCaptureButtonAppConfigurationServer *)v19;

    -[SBSCaptureButtonAppConfigurationServer startServer](v2->_server, "startServer");
    +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:", v2);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __50__SBCaptureButtonAppConfigurationCoordinator_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setAssociatedAppBundleIdentifierFromDefaults");
    WeakRetained = v2;
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v6;
    if (!v5)
    {
      -[NSHashTable addObject:](self->_observers, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void)captureButtonAppConfigurationServer:(id)a3 setCurrentAssociatedAppUsingBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  SBCaptureButtonAppConfigurationCoordinator *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogCameraCaptureAppConfiguration();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v11 = self;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Coordinator %p set current associated app to %{public}@ from server %{public}@", buf, 0x20u);
  }

  v9 = v7;
  BSDispatchMain();

}

uint64_t __127__SBCaptureButtonAppConfigurationCoordinator_captureButtonAppConfigurationServer_setCurrentAssociatedAppUsingBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAssociatedAppBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)captureApplicationCenter:(id)a3 didUpdateKnownApplications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  SBCaptureButtonAppConfigurationCoordinator *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "bundleIdentifier", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v11);
  }

  SBLogCameraCaptureAppConfiguration();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v21 = self;
    v22 = 2114;
    v23 = v8;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Coordinator %p received updated eligible apps bundle identifiers %{public}@ according to source %{public}@", buf, 0x20u);
  }

  -[SBCaptureButtonAppConfigurationCoordinator _setEligibleAppsBundleIdentifiers:](self, "_setEligibleAppsBundleIdentifiers:", v8);
  -[SBCaptureButtonAppConfigurationCoordinator _reevaluateCurrentAssociatedApp](self, "_reevaluateCurrentAssociatedApp");

}

- (void)_reevaluateCurrentAssociatedApp
{
  id v3;

  if (-[NSSet containsObject:](self->_eligibleAppsBundleIdentifiers, "containsObject:", self->_associatedAppBundleIdentifier))
  {
    -[SBCaptureButtonDefaults captureButtonAssociatedAppBundleIdentifier](self->_captureButtonDefaults, "captureButtonAssociatedAppBundleIdentifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SBCaptureButtonAppConfigurationCoordinator _setAssociatedAppBundleIdentifier:](self, "_setAssociatedAppBundleIdentifier:", v3);

  }
  else
  {
    -[SBCaptureButtonAppConfigurationCoordinator _setAssociatedAppBundleIdentifier:](self, "_setAssociatedAppBundleIdentifier:", 0);
  }
}

- (void)_setAssociatedAppBundleIdentifierFromDefaults
{
  __CFString *associatedAppBundleIdentifier;
  void *v4;
  char v5;
  NSString *v6;
  NSString *v7;
  __CFString *v8;

  associatedAppBundleIdentifier = (__CFString *)self->_associatedAppBundleIdentifier;
  if (!associatedAppBundleIdentifier)
    associatedAppBundleIdentifier = CFSTR("none");
  v8 = associatedAppBundleIdentifier;
  -[SBCaptureButtonDefaults captureButtonAssociatedAppBundleIdentifier](self->_captureButtonDefaults, "captureButtonAssociatedAppBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[SBCaptureButtonDefaults captureButtonAssociatedAppBundleIdentifier](self->_captureButtonDefaults, "captureButtonAssociatedAppBundleIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_associatedAppBundleIdentifier;
    self->_associatedAppBundleIdentifier = v6;

    -[SBCaptureButtonAppConfigurationCoordinator _notifyObserversOfConfigurationUpdates](self, "_notifyObserversOfConfigurationUpdates");
    -[SBSCaptureButtonAppConfigurationServer setAssociatedAppBundleIdentifier:](self->_server, "setAssociatedAppBundleIdentifier:", self->_associatedAppBundleIdentifier);
  }

}

- (void)_setAssociatedAppBundleIdentifier:(id)a3
{
  __CFString *associatedAppBundleIdentifier;
  __CFString *v6;
  void *v7;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *captureApplicationLaunchActionsAssertion;
  id v11;

  v11 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, a3);
    associatedAppBundleIdentifier = (__CFString *)self->_associatedAppBundleIdentifier;
    if (!associatedAppBundleIdentifier)
      associatedAppBundleIdentifier = CFSTR("none");
    v6 = associatedAppBundleIdentifier;
    -[SBCaptureButtonDefaults setCaptureButtonAssociatedAppBundleIdentifier:](self->_captureButtonDefaults, "setCaptureButtonAssociatedAppBundleIdentifier:", v6);
    -[SBCaptureButtonAppConfigurationCoordinator _notifyObserversOfConfigurationUpdates](self, "_notifyObserversOfConfigurationUpdates");
    -[SBSCaptureButtonAppConfigurationServer setAssociatedAppBundleIdentifier:](self->_server, "setAssociatedAppBundleIdentifier:", v11);
    -[BSInvalidatable invalidate](self->_captureApplicationLaunchActionsAssertion, "invalidate");
    if (v11)
    {
      +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "captureApplicationForBundleIdentifier:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "acquireLaunchPrewarmAssertionForReason:", CFSTR("associated to capture button"));
      v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      captureApplicationLaunchActionsAssertion = self->_captureApplicationLaunchActionsAssertion;
      self->_captureApplicationLaunchActionsAssertion = v9;

    }
    else
    {
      v8 = self->_captureApplicationLaunchActionsAssertion;
      self->_captureApplicationLaunchActionsAssertion = 0;
    }

  }
}

- (void)_setEligibleAppsBundleIdentifiers:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_eligibleAppsBundleIdentifiers, a3);
    -[SBCaptureButtonAppConfigurationCoordinator _notifyObserversOfConfigurationUpdates](self, "_notifyObserversOfConfigurationUpdates");
    -[SBSCaptureButtonAppConfigurationServer setEligibleAppsBundleIdentifiers:](self->_server, "setEligibleAppsBundleIdentifiers:", v5);
  }

}

- (void)_notifyObserversOfConfigurationUpdates
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "captureButtonAppConfigurationUpdated:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (NSSet)eligibleAppsBundleIdentifiers
{
  return self->_eligibleAppsBundleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibleAppsBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_captureApplicationLaunchActionsAssertion, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_captureButtonDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
