@implementation SBApplicationAppProtectionAssistant

+ (id)assistantForApplication:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_appProtectionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assistantForApplication:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_assistantForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "assistantForApplication:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)areAnyApplicationsHidden
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SBAppProtectionCoordinator isEnabled](SBAppProtectionCoordinator, "isEnabled");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF96A8], "hiddenMetaSubject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isHidden");

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)areAnyApplicationsLocked
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SBAppProtectionCoordinator isEnabled](SBAppProtectionCoordinator, "isEnabled");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF96A8], "lockedMetaSubject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isLocked");

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)shouldHideApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (+[SBAppProtectionCoordinator isEnabled](SBAppProtectionCoordinator, "isEnabled"))
  {
    objc_msgSend(a1, "_assistantForBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldHide");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SBApplicationAppProtectionAssistant)initWithApplication:(id)a3
{
  id v5;
  SBApplicationAppProtectionAssistant *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  APApplication *appProtectionApplication;
  uint64_t v11;
  NSString *displayName;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BSCompoundAssertion *visibilityAssertions;
  BSCompoundAssertion *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationAppProtectionAssistant.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("application"));

  }
  v28.receiver = self;
  v28.super_class = (Class)SBApplicationAppProtectionAssistant;
  v6 = -[SBApplicationAppProtectionAssistant init](&v28, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CF9688];
    objc_msgSend(v5, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationWithBundleIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    appProtectionApplication = v6->_appProtectionApplication;
    v6->_appProtectionApplication = (APApplication *)v9;

    objc_msgSend(v5, "displayName");
    v11 = objc_claimAutoreleasedReturnValue();
    displayName = v6->_displayName;
    v6->_displayName = (NSString *)v11;

    objc_initWeak(&location, v6);
    v13 = (void *)MEMORY[0x1E0D01718];
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: %p - %@"), v16, v6, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __59__SBApplicationAppProtectionAssistant_initWithApplication___block_invoke;
    v25[3] = &unk_1E8EA3688;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v13, "assertionWithIdentifier:stateDidChangeHandler:", v18, v25);
    v19 = objc_claimAutoreleasedReturnValue();
    visibilityAssertions = v6->_visibilityAssertions;
    v6->_visibilityAssertions = (BSCompoundAssertion *)v19;

    v21 = v6->_visibilityAssertions;
    SBLogAppProtection();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v21, "setLog:", v22);

    v6->_shouldHide = -[APApplication isHidden](v6->_appProtectionApplication, "isHidden");
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __59__SBApplicationAppProtectionAssistant_initWithApplication___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  int v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "owningCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isActive");

  if (v5)
    objc_msgSend(v4, "noteSceneWillBecomeForegroundVisibleForAssistant:", WeakRetained);
  else
    objc_msgSend(v4, "noteAllScenesDismissedForAssistant:", WeakRetained);

}

- (void)invalidate
{
  -[BSCompoundAssertion invalidate](self->_visibilityAssertions, "invalidate");
  -[NSTimer invalidate](self->_shouldHideDebounceTimer, "invalidate");
}

- (void)setShouldShield:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  id buf;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_shouldShield != a3)
  {
    v3 = a3;
    self->_shouldShield = a3;
    SBLogAppProtection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SBApplicationAppProtectionAssistant succinctDescription](self, "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 67109378;
      HIDWORD(buf) = v3;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Setting shouldShield: %{BOOL}u for %{public}@", (uint8_t *)&buf, 0x12u);

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "appProtectionAssistantShouldShieldDidChange:", self);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    if (v3 && -[SBApplicationAppProtectionAssistant isHidden](self, "isHidden"))
    {
      -[SBApplicationAppProtectionAssistant shouldHideDebounceTimer](self, "shouldHideDebounceTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

      }
      else if (-[SBApplicationAppProtectionAssistant isHidden](self, "isHidden"))
      {
        objc_initWeak(&buf, self);
        v14 = (void *)MEMORY[0x1E0C99E88];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __55__SBApplicationAppProtectionAssistant_setShouldShield___block_invoke;
        v16[3] = &unk_1E8E9FA90;
        objc_copyWeak(&v17, &buf);
        objc_msgSend(v14, "scheduledTimerWithTimeInterval:repeats:block:", 0, v16, 3.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplicationAppProtectionAssistant setShouldHideDebounceTimer:](self, "setShouldHideDebounceTimer:", v15);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&buf);
      }
    }
    else
    {
      -[SBApplicationAppProtectionAssistant shouldHideDebounceTimer](self, "shouldHideDebounceTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "invalidate");

      -[SBApplicationAppProtectionAssistant setShouldHideDebounceTimer:](self, "setShouldHideDebounceTimer:", 0);
      -[SBApplicationAppProtectionAssistant setShouldHide:](self, "setShouldHide:", 0);
    }
  }
}

void __55__SBApplicationAppProtectionAssistant_setShouldShield___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShouldHideDebounceTimer:", 0);
  objc_msgSend(WeakRetained, "_updateShouldHide");

}

- (BOOL)isHidden
{
  void *v2;
  char v3;

  -[SBApplicationAppProtectionAssistant appProtectionApplication](self, "appProtectionApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setShouldHide:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_shouldHide != a3)
  {
    self->_shouldHide = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "appProtectionAssistantShouldHideDidChange:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)_updateShouldHide
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  int v7;

  -[SBApplicationAppProtectionAssistant shouldHideDebounceTimer](self, "shouldHideDebounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if ((v4 & 1) == 0
    && -[SBApplicationAppProtectionAssistant isHidden](self, "isHidden")
    && -[SBApplicationAppProtectionAssistant shouldShield](self, "shouldShield"))
  {
    if (self->_shouldHide)
    {
      v5 = 1;
    }
    else
    {
      -[SBApplicationAppProtectionAssistant owningCoordinator](self, "owningCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "shouldSuppressHiding");

      v5 = v7 ^ 1u;
    }
  }
  else
  {
    v5 = 0;
  }
  -[SBApplicationAppProtectionAssistant setShouldHide:](self, "setShouldHide:", v5);
}

- (APApplication)appProtectionApplication
{
  return self->_appProtectionApplication;
}

- (id)createShieldUIViewController
{
  SBAppProtectionShieldViewController *v3;
  void *v4;
  void *v5;
  SBAppProtectionShieldViewController *v6;

  v3 = [SBAppProtectionShieldViewController alloc];
  -[SBApplicationAppProtectionAssistant owningCoordinator](self, "owningCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemAppOutlet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBAppProtectionShieldViewController initWithAssistant:systemAppOutlet:](v3, "initWithAssistant:systemAppOutlet:", self, v5);

  return v6;
}

- (id)createShieldUIView
{
  SBAppProtectionShieldView *v3;
  void *v4;
  void *v5;
  SBAppProtectionShieldView *v6;

  v3 = [SBAppProtectionShieldView alloc];
  -[SBApplicationAppProtectionAssistant owningCoordinator](self, "owningCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemAppOutlet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBAppProtectionShieldView initWithAssistant:systemAppOutlet:](v3, "initWithAssistant:systemAppOutlet:", self, v5);

  return v6;
}

- (void)addObserver:(id)a3
{
  id v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationAppProtectionAssistant.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_observers;
    self->_observers = v7;

    v5 = v10;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v5);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSUInteger v5;
  NSHashTable *observers;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    v5 = -[NSHashTable count](self->_observers, "count");
    v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      v4 = v7;
    }
  }

}

- (id)acquireVisibilityAssertionForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBApplicationAppProtectionAssistant visibilityAssertions](self, "visibilityAssertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireForReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)requestUnshielding
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogAppProtection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SBApplicationAppProtectionAssistant succinctDescription](self, "succinctDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will request unshielding", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CF9690], "sharedGuard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationAppProtectionAssistant appProtectionApplication](self, "appProtectionApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SBApplicationAppProtectionAssistant_requestUnshielding__block_invoke;
  v7[3] = &unk_1E8EA2B20;
  v7[4] = self;
  objc_msgSend(v5, "authenticateForShieldDismissalForSubject:completion:", v6, v7);

}

void __57__SBApplicationAppProtectionAssistant_requestUnshielding__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogAppProtection();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "authenticateForSubject: %@ with success: %{BOOL}u error: %{public}@", (uint8_t *)&v8, 0x1Cu);

  }
}

- (NSString)description
{
  return (NSString *)-[SBApplicationAppProtectionAssistant descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBApplicationAppProtectionAssistant succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationAppProtectionAssistant appProtectionApplication](self, "appProtectionApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("app"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBApplicationAppProtectionAssistant descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBApplicationAppProtectionAssistant *v11;

  v4 = a3;
  -[SBApplicationAppProtectionAssistant succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__SBApplicationAppProtectionAssistant_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __77__SBApplicationAppProtectionAssistant_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "shouldShield"), CFSTR("shouldShield"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "shouldHide"), CFSTR("shouldHide"), 1);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isHidden"), CFSTR("isHidden"), 1);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "visibilityAssertions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(v7, "isActive"), CFSTR("visibilityAssertions.isActive"), 1);

}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)shouldShield
{
  return self->_shouldShield;
}

- (BOOL)shouldHide
{
  return self->_shouldHide;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BSCompoundAssertion)visibilityAssertions
{
  return self->_visibilityAssertions;
}

- (NSTimer)shouldHideDebounceTimer
{
  return self->_shouldHideDebounceTimer;
}

- (void)setShouldHideDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_shouldHideDebounceTimer, a3);
}

- (SBAppProtectionCoordinator)owningCoordinator
{
  return (SBAppProtectionCoordinator *)objc_loadWeakRetained((id *)&self->_owningCoordinator);
}

- (void)setOwningCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_owningCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningCoordinator);
  objc_storeStrong((id *)&self->_shouldHideDebounceTimer, 0);
  objc_storeStrong((id *)&self->_visibilityAssertions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_appProtectionApplication, 0);
}

@end
