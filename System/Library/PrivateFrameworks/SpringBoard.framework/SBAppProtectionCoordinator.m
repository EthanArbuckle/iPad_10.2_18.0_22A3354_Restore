@implementation SBAppProtectionCoordinator

+ (BOOL)isEnabled
{
  if ((APCoreFunctionalityEnabled() & 1) != 0)
    return 1;
  else
    return _os_feature_enabled_impl();
}

- (SBAppProtectionCoordinator)init
{
  SBAppProtectionCoordinator *v2;
  _SBAppProtectionPlugin *v3;
  uint64_t v4;
  APSystemAppOutlet *systemAppOutlet;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BSCompoundAssertion *suppressHidingAssertions;
  BSCompoundAssertion *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBAppProtectionCoordinator;
  v2 = -[SBAppProtectionCoordinator init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_SBAppProtectionPlugin);
    -[_SBAppProtectionPlugin set_owningCoordinator:](v3, "set_owningCoordinator:", v2);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF96B0]), "initWithSystemAppInterface:", v3);
    systemAppOutlet = v2->_systemAppOutlet;
    v2->_systemAppOutlet = (APSystemAppOutlet *)v4;

    -[APSystemAppOutlet resume](v2->_systemAppOutlet, "resume");
    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addMonitor:subjectMask:", v2, 2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_applicationsChanged_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

    objc_initWeak(&location, v2);
    v9 = (void *)MEMORY[0x1E0D01718];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __34__SBAppProtectionCoordinator_init__block_invoke;
    v18 = &unk_1E8EA3688;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v9, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("Suppress hiding hidden apps"), &v15);
    v10 = objc_claimAutoreleasedReturnValue();
    suppressHidingAssertions = v2->_suppressHidingAssertions;
    v2->_suppressHidingAssertions = (BSCompoundAssertion *)v10;

    v12 = v2->_suppressHidingAssertions;
    SBLogAppProtection();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v12, "setLog:", v13, v15, v16, v17, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __34__SBAppProtectionCoordinator_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateShouldHide");

}

- (void)dealloc
{
  objc_super v3;

  -[APSystemAppOutlet invalidate](self->_systemAppOutlet, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBAppProtectionCoordinator;
  -[SBAppProtectionCoordinator dealloc](&v3, sel_dealloc);
}

- (void)applicationsChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBInstalledApplicationsRemovedBundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_bundleIdentifiersToAssistants, "objectForKey:", v11, (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "invalidate");

          -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifiersToAssistants, "removeObjectForKey:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (id)acquireSuppressHidingAppsAssertionForReason:(id)a3
{
  return (id)-[BSCompoundAssertion acquireForReason:](self->_suppressHidingAssertions, "acquireForReason:", a3);
}

- (BOOL)shouldSuppressHiding
{
  return -[BSCompoundAssertion isActive](self->_suppressHidingAssertions, "isActive");
}

- (id)assistantForApplication:(id)a3
{
  id v4;
  NSMutableDictionary *bundleIdentifiersToAssistants;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  SBApplicationAppProtectionAssistant *v9;
  APSystemAppOutlet *systemAppOutlet;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;

  v4 = a3;
  bundleIdentifiersToAssistants = self->_bundleIdentifiersToAssistants;
  if (!bundleIdentifiersToAssistants)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_bundleIdentifiersToAssistants;
    self->_bundleIdentifiersToAssistants = v6;

    bundleIdentifiersToAssistants = self->_bundleIdentifiersToAssistants;
  }
  objc_msgSend(v4, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](bundleIdentifiersToAssistants, "objectForKey:", v8);
  v9 = (SBApplicationAppProtectionAssistant *)objc_claimAutoreleasedReturnValue();

  if (v4 && !v9)
  {
    v9 = -[SBApplicationAppProtectionAssistant initWithApplication:]([SBApplicationAppProtectionAssistant alloc], "initWithApplication:", v4);
    -[SBApplicationAppProtectionAssistant setOwningCoordinator:](v9, "setOwningCoordinator:", self);
    systemAppOutlet = self->_systemAppOutlet;
    -[SBApplicationAppProtectionAssistant appProtectionApplication](v9, "appProtectionApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationAppProtectionAssistant setShouldShield:](v9, "setShouldShield:", -[APSystemAppOutlet shouldShieldLaunchOfApplication:](systemAppOutlet, "shouldShieldLaunchOfApplication:", v11));

    -[SBApplicationAppProtectionAssistant addObserver:](v9, "addObserver:", self);
    v12 = self->_bundleIdentifiersToAssistants;
    objc_msgSend(v4, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v9, v13);

  }
  return v9;
}

- (void)noteAllScenesDismissedForAssistant:(id)a3
{
  id v4;
  NSObject *v5;
  APSystemAppOutlet *systemAppOutlet;
  void *v7;
  APSystemAppOutlet *v8;
  void *v9;
  int v10;
  APSystemAppOutlet *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAppProtection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    systemAppOutlet = self->_systemAppOutlet;
    objc_msgSend(v4, "appProtectionApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = systemAppOutlet;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Informing %{public}@ that %@ will become background as far as we know", (uint8_t *)&v10, 0x16u);

  }
  v8 = self->_systemAppOutlet;
  objc_msgSend(v4, "appProtectionApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSystemAppOutlet noteAllScenesDismissedForApplication:](v8, "noteAllScenesDismissedForApplication:", v9);

}

- (void)noteSceneWillBecomeForegroundVisibleForAssistant:(id)a3
{
  id v4;
  NSObject *v5;
  APSystemAppOutlet *systemAppOutlet;
  void *v7;
  APSystemAppOutlet *v8;
  void *v9;
  int v10;
  APSystemAppOutlet *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAppProtection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    systemAppOutlet = self->_systemAppOutlet;
    objc_msgSend(v4, "appProtectionApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = systemAppOutlet;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Informing %{public}@ that %@ will become foreground visible", (uint8_t *)&v10, 0x16u);

  }
  v8 = self->_systemAppOutlet;
  objc_msgSend(v4, "appProtectionApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSystemAppOutlet noteSceneWillBecomeForegroundVisibleForApplication:](v8, "noteSceneWillBecomeForegroundVisibleForApplication:", v9);

}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CF96A8], "hiddenMetaSubject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v9, "isEqual:", v10);

        if ((_DWORD)v9)
          BSDispatchMain();
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

uint64_t __75__SBAppProtectionCoordinator_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateShouldHide");
}

- (void)appProtectionAssistantShouldHideDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("SBAppProtectionCoordinatorHiddenAppsDidChange"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotification:", v4);

}

- (void)_updateShouldHide
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_bundleIdentifiersToAssistants, "allValues", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_updateShouldHide");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (APSystemAppOutlet)systemAppOutlet
{
  return self->_systemAppOutlet;
}

- (void)setSystemAppOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_systemAppOutlet, a3);
}

- (NSMutableDictionary)bundleIdentifiersToAssistants
{
  return self->_bundleIdentifiersToAssistants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiersToAssistants, 0);
  objc_storeStrong((id *)&self->_systemAppOutlet, 0);
  objc_storeStrong((id *)&self->_suppressHidingAssertions, 0);
}

@end
