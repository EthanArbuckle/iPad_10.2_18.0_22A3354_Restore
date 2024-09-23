@implementation SBDeviceApplicationSceneStatusBarBreadcrumbProvider

- (BOOL)hasBreadcrumb
{
  SBBreadcrumbActionContext *currentBreadcrumbActionContext;

  currentBreadcrumbActionContext = self->_currentBreadcrumbActionContext;
  return currentBreadcrumbActionContext
      && currentBreadcrumbActionContext->_didCaptureContext
      && currentBreadcrumbActionContext->_breadcrumbAppBundleID != 0;
}

- (void)captureContextForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_breadcrumbBundleIdForActivatingSceneEntity:withTransitionContext:", v23, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  v13 = objc_msgSend(v23, "layoutRole");
  if (v13 != 1 && (SBLayoutRoleIsValidForSplitView(v13) & v12) == 1)
    -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider _setCurrentBreadcrumbActionContext:](self, "_setCurrentBreadcrumbActionContext:", 0);
  if (objc_msgSend((id)objc_opt_class(), "_shouldAddBreadcrumbToActivatingSceneEntity:sceneHandle:withTransitionContext:", v23, WeakRetained, v6))
  {
    -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider _breadcrumbNavigationActionContextForActivatingSceneEntity:withTransitionContext:](self, "_breadcrumbNavigationActionContextForActivatingSceneEntity:withTransitionContext:", v23, v6);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_breadcrumbTitleForAppWithBundleID:sceneHandle:activatingSceneEntity:withTransitionContext:", v9, WeakRetained, v23, v6);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(v14 + 64);
    *(_QWORD *)(v14 + 64) = v15;

    objc_msgSend(v6, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayConfiguration");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(v14 + 72);
    *(_QWORD *)(v14 + 72) = v18;

    objc_msgSend((id)SBApp, "windowSceneManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v14 + 72), "identity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "windowSceneForDisplayIdentity:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)(v14 + 80), v22);

    if (v8)
      -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider _setCurrentBreadcrumbActionContext:](self, "_setCurrentBreadcrumbActionContext:", v14);

  }
}

+ (id)_breadcrumbBundleIdForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4
{
  id v5;
  id v6;
  char v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  void *v16;
  void *v17;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "BOOLForActivationSetting:", 26);
  v8 = objc_msgSend(v6, "BOOLForActivationSetting:", 43);

  objc_msgSend(v5, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originatingProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.camera"));
  if (v8)
  {
    v13 = CFSTR("com.apple.Siri");
LABEL_7:
    v14 = v13;
    goto LABEL_8;
  }
  if ((v7 & 1) == 0)
  {
    if (!v12)
    {
      objc_msgSend(v5, "previousApplicationSceneEntityForLayoutRole:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "application");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    v13 = CFSTR("com.apple.camera");
    goto LABEL_7;
  }
  v14 = CFSTR("com.apple.springboard.spotlight-placeholder");
LABEL_8:

  return v14;
}

+ (BOOL)_shouldAddBreadcrumbToActivatingSceneEntity:(id)a3 sceneHandle:(id)a4 withTransitionContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  char v34;
  void *v35;
  void *v36;
  void *v38;
  char v39;
  char v40;
  char v41;
  int v42;
  char v43;
  int v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  char v51;
  _BOOL4 v52;
  int v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  int v65;
  int v66;
  int v67;
  unint64_t v68;
  uint64_t v69;
  char v70;
  int v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "applicationSceneEntityForLayoutRole:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "application");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "previousApplicationSceneEntityForLayoutRole:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "application");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "previousApplicationSceneEntityForLayoutRole:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "application");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "application");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "bundleIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v20, "source");
  objc_msgSend(v20, "originatingProcess");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bundleIdentifier");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = v15;
  v69 = objc_msgSend(v15, "length");
  v75 = (void *)v19;
  v22 = (void *)v12;
  if (objc_msgSend(v7, "BOOLForActivationSetting:", 43))
    v23 = +[SBAssistantController shouldBreadcrumbLaunchedApplicationWithBundleIdentifier:](SBAssistantController, "shouldBreadcrumbLaunchedApplicationWithBundleIdentifier:", v19);
  else
    v23 = 0;
  v24 = objc_msgSend(v76, "isEqualToString:", CFSTR("com.apple.Spotlight"));
  v71 = objc_msgSend(v7, "BOOLForActivationSetting:", 26);
  v25 = objc_opt_class();
  objc_msgSend(v8, "previousApplicationSceneEntityForLayoutRole:", 1);
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v26, "sceneHandle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "forbidsActivationByBreadcrumbAction");
  objc_msgSend(v28, "application");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = objc_msgSend(v30, "isSetup");

  if ((v26 & 1) != 0
    || (+[SBDefaults localDefaults](SBDefaults, "localDefaults"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v31, "workspaceDefaults"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = objc_msgSend(v32, "isBreadcrumbDisabled") | v29,
        v32,
        v31,
        (v33 & 1) != 0))
  {
    v34 = 0;
    v35 = v22;
LABEL_7:
    v36 = v74;
    goto LABEL_8;
  }
  v35 = v22;
  v36 = v74;
  if ((objc_msgSend(v22, "isEqual:", v74) & v24 & v71) == 1)
  {
    v34 = +[SBHomeScreenReturnToSpotlightPolicy areSpotlightBreadcrumbsEnabled](SBHomeScreenReturnToSpotlightPolicy, "areSpotlightBreadcrumbsEnabled");
    goto LABEL_8;
  }
  if (objc_msgSend(v22, "isEqual:", v75))
  {
    v34 = v23;
    if (((objc_msgSend(v74, "isEqual:", v75) ^ 1 | v23) & 1) == 0)
      goto LABEL_18;
  }
  else
  {
    v34 = v23;
    if (!v23)
      goto LABEL_8;
  }
  if (!objc_msgSend(v20, "isMainWorkspaceTransitionRequest"))
  {
LABEL_18:
    v34 = 0;
    goto LABEL_8;
  }
  v65 = objc_msgSend(v7, "BOOLForActivationSetting:", 41);
  v67 = objc_msgSend(v7, "BOOLForActivationSetting:", 39);
  v66 = objc_msgSend(v76, "isEqualToString:", CFSTR("com.apple.camera"));
  if (v69)
  {
    objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v74);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isHidden");

    v34 = v39 | v23;
    v40 = v39 ^ 1;
  }
  else
  {
    v40 = 1;
  }
  v41 = v34;
  v34 = v40 | v34 ^ 1;
  if ((v41 & 1) == 0 && v68 != 45)
  {
    if ((v67 & v66 & 1) != 0)
    {
      v34 = 1;
      goto LABEL_8;
    }
    v42 = v65;
    if (v68 == 6)
      v42 = 1;
    if (v42 == 1)
    {
      if (v69)
        v43 = 1;
      else
        v43 = v71;
      v34 = (v67 ^ 1) & v43;
      goto LABEL_8;
    }
    if ((v68 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      if (v69)
        v34 = v67 ^ 1;
      else
        v34 = 0;
      goto LABEL_8;
    }
    v34 = 0;
    if (v68 <= 0x13 && ((1 << v68) & 0x8A004) != 0)
    {
      v44 = objc_msgSend(v7, "BOOLForActivationSetting:", 49);
      LODWORD(v45) = objc_msgSend(v7, "BOOLForActivationSetting:", 40);
      objc_msgSend(v7, "objectForActivationSetting:", 5);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        objc_msgSend(v7, "objectForActivationSetting:", 14);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (id)v47;
        if (v69 && v47)
        {
          v70 = (char)v45;
          objc_msgSend(v8, "previousApplicationSceneEntityForBundleID:", v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            LOBYTE(v45) = v70;
LABEL_47:
            v63 = v35;
            if ((v71 & 1) != 0)
            {
              v51 = objc_msgSend(v48, "isEqual:", v75);
              v52 = +[SBHomeScreenReturnToSpotlightPolicy areSpotlightBreadcrumbsEnabled](SBHomeScreenReturnToSpotlightPolicy, "areSpotlightBreadcrumbsEnabled");
              v53 = !v52 | v44;
              v54 = v51;
              if (v46)
                v55 = 1;
              else
                v55 = (char)v45;
              if (v53)
                v56 = v52;
              else
                v56 = v55;
            }
            else
            {
              v57 = objc_msgSend(v74, "isEqual:", v48);
              v58 = objc_msgSend(v73, "isEqual:", v48);
              v54 = objc_msgSend(v48, "isEqual:", v75);
              v56 = v57 | v58;
            }
            v72 = v56;
            +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance", v63);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "applicationWithBundleIdentifier:", v48);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "info");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "shouldLaunchSuspendedAlways");

            v34 = v72 & ((v54 | v62) ^ 1);
            v35 = v64;
            goto LABEL_7;
          }
          v45 = v74;

          v48 = v45;
          LOBYTE(v45) = v70;
        }
        v50 = v74;
        if (v48)
          goto LABEL_47;
      }
      else
      {
        v50 = v76;
        if (!(_DWORD)v45)
        {
          v48 = 0;
          goto LABEL_47;
        }
      }
      v48 = v50;
      goto LABEL_47;
    }
  }
LABEL_8:

  return v34;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  BOOL v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v9 = v4;
    if (!observers)
    {
      v6 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    v8 = -[NSHashTable containsObject:](observers, "containsObject:", v9);
    v4 = v9;
    if (!v8)
    {
      -[NSHashTable addObject:](self->_observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)initWithSceneHandle:(id)a3
{
  id v4;
  SBDeviceApplicationSceneStatusBarBreadcrumbProvider *v5;
  SBDeviceApplicationSceneStatusBarBreadcrumbProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationSceneStatusBarBreadcrumbProvider;
  v5 = -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sceneHandle, v4);
    objc_msgSend(v4, "addObserver:", v6);
  }

  return v6;
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (NSString)breadcrumbTitle
{
  SBBreadcrumbActionContext *currentBreadcrumbActionContext;

  currentBreadcrumbActionContext = self->_currentBreadcrumbActionContext;
  if (currentBreadcrumbActionContext)
    return currentBreadcrumbActionContext->_breadcrumbTitle;
  else
    return (NSString *)0;
}

- (BOOL)activateBreadcrumbIfPossible
{
  -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider _handleBreadcrumbAction](self, "_handleBreadcrumbAction");
  return -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider hasBreadcrumb](self, "hasBreadcrumb");
}

- (void)prepareForReuse
{
  -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider _setCurrentBreadcrumbActionContext:](self, "_setCurrentBreadcrumbActionContext:", 0);
  -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider noteDidUpdateDisplayProperties](self, "noteDidUpdateDisplayProperties");
}

- (void)noteDidUpdateDisplayProperties
{
  void *v3;
  _QWORD v4[5];

  -[NSHashTable allObjects](self->_observers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__SBDeviceApplicationSceneStatusBarBreadcrumbProvider_noteDidUpdateDisplayProperties__block_invoke;
  v4[3] = &unk_1E8EA5990;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __85__SBDeviceApplicationSceneStatusBarBreadcrumbProvider_noteDidUpdateDisplayProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "statusBarBreadcrumbProviderDidUpdateDisplayProperties:", *(_QWORD *)(a1 + 32));

}

- (id)_breadcrumbNavigationActionContextForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4
{
  id v5;
  id v6;
  SBBreadcrumbActionContext *v7;
  uint64_t v8;
  NSString *breadcrumbAppBundleID;
  uint64_t v10;
  NSString *breadcrumbSceneID;
  char v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *previousSideBundleId;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(SBBreadcrumbActionContext);
  v7->_lastSource = SBSpotlightLastPresentationSource();
  objc_msgSend((id)objc_opt_class(), "_breadcrumbBundleIdForActivatingSceneEntity:withTransitionContext:", v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  breadcrumbAppBundleID = v7->_breadcrumbAppBundleID;
  v7->_breadcrumbAppBundleID = (NSString *)v8;

  objc_msgSend((id)objc_opt_class(), "_breadcrumbSceneIdForAppWithBundleID:activatingSceneEntity:withTransitionContext:", v7->_breadcrumbAppBundleID, v5, v6);
  v10 = objc_claimAutoreleasedReturnValue();
  breadcrumbSceneID = v7->_breadcrumbSceneID;
  v7->_breadcrumbSceneID = (NSString *)v10;

  if ((objc_msgSend(v5, "BOOLForActivationSetting:", 26) & 1) != 0)
    v12 = 1;
  else
    v12 = -[NSString isEqualToString:](v7->_breadcrumbAppBundleID, "isEqualToString:", CFSTR("com.apple.springboard.spotlight-placeholder"));
  v7->_wasFromSpotlight = v12;
  if ((objc_msgSend(v5, "BOOLForActivationSetting:", 43) & 1) != 0)
    v13 = 1;
  else
    v13 = -[NSString isEqualToString:](v7->_breadcrumbAppBundleID, "isEqualToString:", CFSTR("com.apple.Siri"));
  v7->_wasFromAssistant = v13;
  objc_msgSend(v6, "previousApplicationSceneEntityForLayoutRole:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "application");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  previousSideBundleId = v7->_previousSideBundleId;
  v7->_previousSideBundleId = (NSString *)v16;

  if (v7->_wasFromSpotlight)
  {
    v18 = 1;
  }
  else if (v7->_wasFromAssistant)
  {
    v18 = 2;
  }
  else if (-[NSString length](v7->_breadcrumbAppBundleID, "length"))
  {
    v18 = 3;
  }
  else
  {
    v18 = 5;
  }
  v7->_analyticsType = v18;
  v25 = *MEMORY[0x1E0DABEB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0DA9D78];
  v22 = v20;
  objc_msgSend(v21, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "emitEvent:withPayload:", 15, v22);

  v7->_didCaptureContext = 1;
  return v7;
}

+ (id)_destinationContextsForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_breadcrumbBundleIdForActivatingSceneEntity:withTransitionContext:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_breadcrumbSceneIdForAppWithBundleID:activatingSceneEntity:withTransitionContext:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previousApplicationSceneEntityForLayoutRole:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_breadcrumbTitleForAppWithBundleID:sceneHandle:activatingSceneEntity:withTransitionContext:", v8, v11, v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(MEMORY[0x1E0CEAA40], "systemNavigationActionContextWithTitle:sceneIdentifier:", v12, v9);
  else
    objc_msgSend(MEMORY[0x1E0CEAA40], "systemNavigationActionContextWithTitle:bundleId:", v12, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, &unk_1E91D0530);

  return v13;
}

+ (id)_breadcrumbTitleForAppWithBundleID:(id)a3 sceneHandle:(id)a4 activatingSceneEntity:(id)a5 withTransitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  void *v21;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applicationWithBundleIdentifier:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "BOOLForActivationSetting:", 26) & 1) != 0)
  {
    if (!objc_msgSend(v10, "BOOLForActivationSetting:", 43))
      goto LABEL_7;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("SIRI");
LABEL_8:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v14 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.springboard.spotlight-placeholder"));
  if ((objc_msgSend(v10, "BOOLForActivationSetting:", 43) & 1) != 0)
    goto LABEL_5;
  if (v14)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("SYSTEM_SEARCH_TITLE");
    goto LABEL_8;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.webapp")))
  {
    objc_msgSend(v13, "displayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(a1, "_breadcrumbSceneIdForAppWithBundleID:activatingSceneEntity:withTransitionContext:", v9, v10, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:](SBWebApplication, "_webClipIdentifierFromWebAppIdentifier:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAC08], "webClipWithIdentifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
LABEL_10:

  return v18;
}

+ (id)_breadcrumbSceneIdForAppWithBundleID:(id)a3 activatingSceneEntity:(id)a4 withTransitionContext:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a5;
  v7 = a3;
  objc_msgSend(v6, "previousApplicationSceneEntityForLayoutRole:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v10, "isEqualToString:", v7);
  if ((_DWORD)v8)
  {
    objc_msgSend(v6, "previousApplicationSceneEntityForLayoutRole:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sceneHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sceneIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_setCurrentBreadcrumbActionContext:(id)a3
{
  SBBreadcrumbActionContext *v5;
  SBBreadcrumbActionContext *currentBreadcrumbActionContext;
  SBBreadcrumbActionContext *v7;
  SBBreadcrumbActionContext *v8;
  void *v9;
  void *v10;
  SBBreadcrumbActionContext *v11;

  v5 = (SBBreadcrumbActionContext *)a3;
  currentBreadcrumbActionContext = self->_currentBreadcrumbActionContext;
  if (currentBreadcrumbActionContext != v5)
  {
    v11 = v5;
    v7 = currentBreadcrumbActionContext;
    objc_storeStrong((id *)&self->_currentBreadcrumbActionContext, a3);
    v8 = self->_currentBreadcrumbActionContext;
    if (v7)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), v10);
LABEL_7:

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__installedApplicationsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), v10);
      goto LABEL_7;
    }

    v5 = v11;
  }

}

- (void)_installedApplicationsDidChange:(id)a3
{
  id v4;
  SBBreadcrumbActionContext *currentBreadcrumbActionContext;
  NSString *v6;
  NSString *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  currentBreadcrumbActionContext = self->_currentBreadcrumbActionContext;
  v10 = v4;
  if (currentBreadcrumbActionContext)
  {
    v6 = currentBreadcrumbActionContext->_breadcrumbAppBundleID;
    v7 = v6;
    if (v6 && -[NSString length](v6, "length"))
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "applicationWithBundleIdentifier:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider prepareForReuse](self, "prepareForReuse");

    }
  }
  else
  {
    v7 = 0;
  }

}

- (void)_handleBreadcrumbAction
{
  SBBreadcrumbActionContext *v3;
  SBBreadcrumbActionContext *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSString *breadcrumbSceneID;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = self->_currentBreadcrumbActionContext;
  v4 = v3;
  if (v3 && v3->_didCaptureContext)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v3->_windowScene);
    v14[0] = *MEMORY[0x1E0DABE80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4->_analyticsType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = *MEMORY[0x1E0DABCF8];
    v15[0] = v6;
    v15[1] = &unk_1E91D0548;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DA9D78];
    v9 = v7;
    objc_msgSend(v8, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emitEvent:withPayload:", 16, v9);

    if (v4->_wasFromAssistant)
    {
      -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider _presentAssistantFromBreadcrumb](self, "_presentAssistantFromBreadcrumb");
    }
    else if (v4->_wasFromSpotlight)
    {
      -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider _presentSpotlightFromBreadcrumbInWindowScene:](self, "_presentSpotlightFromBreadcrumbInWindowScene:", WeakRetained);
    }
    else
    {
      SBWorkspaceApplicationForIdentifier(v4->_breadcrumbAppBundleID);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      breadcrumbSceneID = v4->_breadcrumbSceneID;
      objc_msgSend(WeakRetained, "sceneManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider _activateBreadcrumbApplication:withSceneIdentifier:sceneHandleProvider:displayConfiguration:](self, "_activateBreadcrumbApplication:withSceneIdentifier:sceneHandleProvider:displayConfiguration:", v11, breadcrumbSceneID, v13, v4->_displayConfiguration);

    }
  }

}

- (void)_presentAssistantFromBreadcrumb
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "policyAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsCapability:", 4);

  if (v5)
  {
    -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider prepareForReuse](self, "prepareForReuse");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentAssistantFromBreadcrumb__block_invoke;
    v9[3] = &unk_1E8E9DED8;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0D229B0], "eventWithName:handler:", CFSTR("SiriBreadcrumb"), v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executeOrAppendEvent:", v6);

  }
}

uint64_t __86__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentAssistantFromBreadcrumb__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D97818]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  return objc_msgSend(v2, "activate");
}

- (void)_presentSpotlightFromBreadcrumbInWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (-[SBDeviceApplicationSceneStatusBarBreadcrumbProvider _showTransientOverlayInPlace](self, "_showTransientOverlayInPlace"))
  {
    objc_msgSend((id)SBApp, "toggleSearchOnWindowScene:fromBreadcrumbSource:withWillBeginHandler:completionHandler:", v4, 1, 0, 0);
    -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider prepareForReuse](self, "prepareForReuse");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D229B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __100__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentSpotlightFromBreadcrumbInWindowScene___block_invoke;
    v10[3] = &unk_1E8E9DED8;
    v11 = v4;
    objc_msgSend(v5, "eventWithName:handler:", CFSTR("presentSpotlight"), v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executeOrAppendEvent:", v6);

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestTransitionWithBuilder:", &__block_literal_global_58);

  }
}

void __100__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentSpotlightFromBreadcrumbInWindowScene___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "homeScreenController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v5 = v2;
  }
  else
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iconManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "presentSpotlightFromSource:animated:completionHandler:", 5, 0, 0);

}

void __100__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentSpotlightFromBreadcrumbInWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setEventLabel:", CFSTR("SpotlightBreadcrumb"));
  objc_msgSend(v2, "setSource:", 15);
  objc_msgSend(v2, "modifyApplicationContext:", &__block_literal_global_68_0);

}

void __100__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__presentSpotlightFromBreadcrumbInWindowScene___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivatingEntity:", v3);

}

- (BOOL)_showTransientOverlayInPlace
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (int64_t)_openStrategyForAppLinkState:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0DAB548]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (void)_activateBreadcrumbApplication:(id)a3 withSceneIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayConfiguration:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __147__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__activateBreadcrumbApplication_withSceneIdentifier_sceneHandleProvider_displayConfiguration___block_invoke;
  v18[3] = &unk_1E8EA5A20;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  objc_msgSend(v13, "requestTransitionWithOptions:displayConfiguration:builder:", 0, v14, v18);

}

void __147__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__activateBreadcrumbApplication_withSceneIdentifier_sceneHandleProvider_displayConfiguration___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 15);
  objc_msgSend(a1[4], "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventLabelWithFormat:", CFSTR("ActivateFromBreadcrumb: %@"), v4);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __147__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__activateBreadcrumbApplication_withSceneIdentifier_sceneHandleProvider_displayConfiguration___block_invoke_2;
  v5[3] = &unk_1E8EA59F8;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[7];
  objc_msgSend(v3, "modifyApplicationContext:", v5);

}

void __147__SBDeviceApplicationSceneStatusBarBreadcrumbProvider__activateBreadcrumbApplication_withSceneIdentifier_sceneHandleProvider_displayConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SBDeviceApplicationSceneEntity *v9;

  v3 = a2;
  v4 = [SBDeviceApplicationSceneEntity alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v4, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v5, v6, v7, v8);

  -[SBWorkspaceEntity setFlag:forActivationSetting:](v9, "setFlag:forActivationSetting:", 1, 47);
  objc_msgSend(v3, "setActivatingEntity:", v9);

}

- (void)sceneHandle:(id)a3 didChangeEffectiveForegroundness:(BOOL)a4
{
  if (!a4)
    -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider prepareForReuse](self, "prepareForReuse", a3);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider breadcrumbTitle](self, "breadcrumbTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v4, CFSTR("breadcrumbTitle"), 1);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  SBBreadcrumbActionContext *v5;
  NSString *v6;

  -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_currentBreadcrumbActionContext;
  if (v5 && -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider hasBreadcrumb](self, "hasBreadcrumb"))
    v6 = v5->_breadcrumbAppBundleID;
  else
    v6 = 0;
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v6, CFSTR("breadcrumbAppBundleID"), 1);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_sceneHandle);
  objc_storeStrong((id *)&self->_currentBreadcrumbActionContext, 0);
  objc_storeStrong((id *)&self->_siriSource, 0);
}

@end
