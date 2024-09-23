@implementation SBHomeScreenService

- (void)refreshAppLibrary:(id)a3 reason:(id)a4
{
  -[SBHomeScreenService requestAppLibraryUpdate:reason:completion:](self, "requestAppLibraryUpdate:reason:completion:", a3, a4, 0);
}

- (void)setObservingIconBadgeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  int v11;
  uint64_t v12;
  NSMutableSet *iconBadgeValueObservingConnections;
  NSMutableSet *v14;
  NSMutableSet *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService iconBadgeValueAuthenticator](self, "iconBadgeValueAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v18);
  v10 = v18;

  if ((v9 & 1) != 0)
  {
    v11 = objc_msgSend(v4, "BOOLValue");
    os_unfair_lock_lock(&self->_lock);
    v12 = -[NSMutableSet count](self->_iconBadgeValueObservingConnections, "count");
    iconBadgeValueObservingConnections = self->_iconBadgeValueObservingConnections;
    if (v11)
    {
      if (!iconBadgeValueObservingConnections)
      {
        v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v15 = self->_iconBadgeValueObservingConnections;
        self->_iconBadgeValueObservingConnections = v14;

        iconBadgeValueObservingConnections = self->_iconBadgeValueObservingConnections;
      }
      -[NSMutableSet addObject:](iconBadgeValueObservingConnections, "addObject:", v5);
    }
    else
    {
      -[NSMutableSet removeObject:](iconBadgeValueObservingConnections, "removeObject:", v5);
    }
    v17 = -[NSMutableSet count](self->_iconBadgeValueObservingConnections, "count");
    os_unfair_lock_unlock(&self->_lock);
    if (v12 || !v17)
    {
      if (v12 && !v17)
        -[SBHomeScreenService endObservingNotificationsForIconBadgeValue](self, "endObservingNotificationsForIconBadgeValue");
    }
    else
    {
      -[SBHomeScreenService beginObservingNotificationsForIconBadgeValue](self, "beginObservingNotificationsForIconBadgeValue");
    }
  }
  else
  {
    SBLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService setObservingIconBadgeValue:].cold.1(v10);

  }
}

- (FBServiceClientAuthenticator)iconBadgeValueAuthenticator
{
  return self->_iconBadgeValueAuthenticator;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "New client connection: %@", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SBHomeScreenService_listener_didReceiveConnection_withContext___block_invoke;
  v10[3] = &unk_1E8EA1060;
  v10[4] = self;
  objc_msgSend(v6, "configureConnection:", v10);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SBHomeScreenService activeConnections](self, "activeConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v6);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "activate");

}

- (NSMutableSet)activeConnections
{
  return self->_activeConnections;
}

- (void)setObservingInstalledWebClips:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  int v11;
  NSMutableSet *webClipObservingConnections;
  NSMutableSet *v13;
  NSMutableSet *v14;
  NSObject *v15;
  id v16;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService observeInstalledWebClipsAuthenticator](self, "observeInstalledWebClipsAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v16);
  v10 = v16;

  if ((v9 & 1) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    v11 = objc_msgSend(v4, "BOOLValue");
    webClipObservingConnections = self->_webClipObservingConnections;
    if (v11)
    {
      if (!webClipObservingConnections)
      {
        v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v14 = self->_webClipObservingConnections;
        self->_webClipObservingConnections = v13;

        webClipObservingConnections = self->_webClipObservingConnections;
      }
      -[NSMutableSet addObject:](webClipObservingConnections, "addObject:", v5);
    }
    else
    {
      -[NSMutableSet removeObject:](webClipObservingConnections, "removeObject:", v5);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    SBLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService setObservingInstalledWebClips:].cold.1(v10);

  }
}

- (void)setObservingInstalledWebClips:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)setObservingIconBadgeValue:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (FBServiceClientAuthenticator)observeInstalledWebClipsAuthenticator
{
  return self->_observeInstalledWebClipsAuthenticator;
}

- (void)requestAppLibraryUpdate:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBIconController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SBIconController *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_iconController;
  if (-[SBIconController isModalAppLibrarySupported](v11, "isModalAppLibrarySupported"))
  {
    v23 = v11;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connectedWindowScenes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v13;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "modalLibraryController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "libraryViewController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "categoryMapProvider");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHomeScreenService _requestAppLibraryUpdate:categoryMapProvider:reason:optionalCompletionHandler:](self, "_requestAppLibraryUpdate:categoryMapProvider:reason:optionalCompletionHandler:", v8, v20, v9, v10);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v15);
    }

    v11 = v23;
  }
  else
  {
    -[SBIconController overlayLibraryViewController](v11, "overlayLibraryViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "categoryMapProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenService _requestAppLibraryUpdate:categoryMapProvider:reason:optionalCompletionHandler:](self, "_requestAppLibraryUpdate:categoryMapProvider:reason:optionalCompletionHandler:", v8, v22, v9, v10);

  }
}

- (void)_requestAppLibraryUpdate:(id)a3 categoryMapProvider:(id)a4 reason:(id)a5 optionalCompletionHandler:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id from;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  v14 = objc_msgSend(v10, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "remoteProcess");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "auditToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService appLibraryRequestUpdateAuthenticator](self, "appLibraryRequestUpdateAuthenticator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  LOBYTE(v16) = objc_msgSend(v18, "authenticateAuditToken:error:", v17, &v33);
  v19 = v33;

  if ((v16 & 1) != 0)
  {
    v20 = 8;
    if (!v14)
      v20 = 14;
    if (v14 == 1)
      v20 = 10;
    if (v13)
      v21 = v20 | 0x20;
    else
      v21 = v20;
    if (v12)
      v22 = v12;
    else
      v22 = CFSTR("(Home Screen Service; no update reason given)");
    objc_msgSend(v11, "requestLibraryCategoryMapRefreshWithOptions:reason:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v28 = v11;
      from = 0;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0DAA830];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __101__SBHomeScreenService__requestAppLibraryUpdate_categoryMapProvider_reason_optionalCompletionHandler___block_invoke;
      v29[3] = &unk_1E8EAA778;
      objc_copyWeak(&v31, &from);
      v30 = v13;
      objc_msgSend(v24, "addObserverForName:object:queue:usingBlock:", v26, v23, v25, v29);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak(&from, v27);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&from);
      v11 = v28;
    }
  }
  else
  {
    SBLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService _requestAppLibraryUpdate:categoryMapProvider:reason:optionalCompletionHandler:].cold.1(v19);
  }

}

- (FBServiceClientAuthenticator)appLibraryRequestUpdateAuthenticator
{
  return self->_appLibraryRequestUpdateAuthenticator;
}

void __65__SBHomeScreenService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0DAAEB0];
  v4 = a2;
  objc_msgSend(v3, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v5);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v6);

  objc_msgSend(v4, "setTargetQueue:", MEMORY[0x1E0C80D38]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SBHomeScreenService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_1E8EAA830;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setInvalidationHandler:", v7);

}

- (SBHomeScreenService)initWithIconController:(id)a3
{
  id v5;
  SBHomeScreenService *v6;
  SBHomeScreenService *v7;
  uint64_t v8;
  FBServiceClientAuthenticator *resetHomeScreenLayoutAuthenticator;
  uint64_t v10;
  FBServiceClientAuthenticator *requestSuggestedAppAuthenticator;
  uint64_t v12;
  FBServiceClientAuthenticator *iconFolderPathLookupAuthenticator;
  uint64_t v14;
  FBServiceClientAuthenticator *addApplicationIconAuthenticator;
  uint64_t v16;
  FBServiceClientAuthenticator *addWidgetToTodayViewAuthenticator;
  uint64_t v18;
  FBServiceClientAuthenticator *largeIconLayoutAuthenticator;
  uint64_t v20;
  FBServiceClientAuthenticator *addsNewIconsToHomeScreenAuthenticator;
  uint64_t v22;
  FBServiceClientAuthenticator *showsBadgesInAppLibraryAuthenticator;
  uint64_t v24;
  FBServiceClientAuthenticator *showsHomeScreenSearchAffordanceAuthenticator;
  uint64_t v26;
  FBServiceClientAuthenticator *homeScreenBundleIdentifiersAuthenticator;
  uint64_t v28;
  FBServiceClientAuthenticator *displayedDateAuthenticator;
  uint64_t v30;
  FBServiceClientAuthenticator *configurationAuthenticator;
  uint64_t v32;
  FBServiceClientAuthenticator *appLibraryRequestUpdateAuthenticator;
  uint64_t v34;
  FBServiceClientAuthenticator *openPodAuthenticator;
  uint64_t v36;
  FBServiceClientAuthenticator *addDebugIconAuthenticator;
  uint64_t v38;
  FBServiceClientAuthenticator *observeInstalledWebClipsAuthenticator;
  uint64_t v40;
  FBServiceClientAuthenticator *activeWidgetInfoAuthenticator;
  uint64_t v42;
  FBServiceClientAuthenticator *addEmptyPageAuthenticator;
  uint64_t v44;
  FBServiceClientAuthenticator *addSuggestedPageAuthenticator;
  uint64_t v46;
  FBServiceClientAuthenticator *homeScreenLayoutAvailabilityAuthenticator;
  uint64_t v48;
  FBServiceClientAuthenticator *homeScreenLayoutAuthenticator;
  uint64_t v50;
  FBServiceClientAuthenticator *iconBadgeValueAuthenticator;
  uint64_t v52;
  FBServiceClientAuthenticator *overflowSlotsAuthenticator;
  uint64_t v54;
  FBServiceClientAuthenticator *silhouetteAuthenticator;
  uint64_t v56;
  FBServiceClientAuthenticator *iconTintColorAuthenticator;
  uint64_t v58;
  FBServiceClientAuthenticator *iconStyleAuthenticator;
  void *v60;
  uint64_t v61;
  void *v62;
  NSMutableSet *v63;
  NSMutableSet *activeConnections;
  void *v65;
  id *v66;
  uint64_t v67;
  id v68;
  _QWORD v70[4];
  id *v71;
  objc_super v72;

  v5 = a3;
  v72.receiver = self;
  v72.super_class = (Class)SBHomeScreenService;
  v6 = -[SBHomeScreenService init](&v72, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconController, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.resetHomeScreenLayout"));
    resetHomeScreenLayoutAuthenticator = v7->_resetHomeScreenLayoutAuthenticator;
    v7->_resetHomeScreenLayoutAuthenticator = (FBServiceClientAuthenticator *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.requestSuggestedApplication"));
    requestSuggestedAppAuthenticator = v7->_requestSuggestedAppAuthenticator;
    v7->_requestSuggestedAppAuthenticator = (FBServiceClientAuthenticator *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.lookupFolderPathForIcon"));
    iconFolderPathLookupAuthenticator = v7->_iconFolderPathLookupAuthenticator;
    v7->_iconFolderPathLookupAuthenticator = (FBServiceClientAuthenticator *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.addApplicationIcon"));
    addApplicationIconAuthenticator = v7->_addApplicationIconAuthenticator;
    v7->_addApplicationIconAuthenticator = (FBServiceClientAuthenticator *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.addWidgetToTodayView"));
    addWidgetToTodayViewAuthenticator = v7->_addWidgetToTodayViewAuthenticator;
    v7->_addWidgetToTodayViewAuthenticator = (FBServiceClientAuthenticator *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.largeIconLayout"));
    largeIconLayoutAuthenticator = v7->_largeIconLayoutAuthenticator;
    v7->_largeIconLayoutAuthenticator = (FBServiceClientAuthenticator *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.addsNewIconsToHomeScreen"));
    addsNewIconsToHomeScreenAuthenticator = v7->_addsNewIconsToHomeScreenAuthenticator;
    v7->_addsNewIconsToHomeScreenAuthenticator = (FBServiceClientAuthenticator *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.showsBadgesInAppLibrary"));
    showsBadgesInAppLibraryAuthenticator = v7->_showsBadgesInAppLibraryAuthenticator;
    v7->_showsBadgesInAppLibraryAuthenticator = (FBServiceClientAuthenticator *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.showsHomeScreenSearchAffordance"));
    showsHomeScreenSearchAffordanceAuthenticator = v7->_showsHomeScreenSearchAffordanceAuthenticator;
    v7->_showsHomeScreenSearchAffordanceAuthenticator = (FBServiceClientAuthenticator *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.allHomeScreenApplicationBundleIdentifiers"));
    homeScreenBundleIdentifiersAuthenticator = v7->_homeScreenBundleIdentifiersAuthenticator;
    v7->_homeScreenBundleIdentifiersAuthenticator = (FBServiceClientAuthenticator *)v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.overrideDisplayedDate"));
    displayedDateAuthenticator = v7->_displayedDateAuthenticator;
    v7->_displayedDateAuthenticator = (FBServiceClientAuthenticator *)v28;

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.configureHomeScreenForTesting"));
    configurationAuthenticator = v7->_configurationAuthenticator;
    v7->_configurationAuthenticator = (FBServiceClientAuthenticator *)v30;

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.appLibraryRefresh"));
    appLibraryRequestUpdateAuthenticator = v7->_appLibraryRequestUpdateAuthenticator;
    v7->_appLibraryRequestUpdateAuthenticator = (FBServiceClientAuthenticator *)v32;

    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.applibrary.openpod"));
    openPodAuthenticator = v7->_openPodAuthenticator;
    v7->_openPodAuthenticator = (FBServiceClientAuthenticator *)v34;

    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.addDebugIcon"));
    addDebugIconAuthenticator = v7->_addDebugIconAuthenticator;
    v7->_addDebugIconAuthenticator = (FBServiceClientAuthenticator *)v36;

    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.observeInstalledWebClips"));
    observeInstalledWebClipsAuthenticator = v7->_observeInstalledWebClipsAuthenticator;
    v7->_observeInstalledWebClipsAuthenticator = (FBServiceClientAuthenticator *)v38;

    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.activeWidgetInfo"));
    activeWidgetInfoAuthenticator = v7->_activeWidgetInfoAuthenticator;
    v7->_activeWidgetInfoAuthenticator = (FBServiceClientAuthenticator *)v40;

    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.addEmptyPage"));
    addEmptyPageAuthenticator = v7->_addEmptyPageAuthenticator;
    v7->_addEmptyPageAuthenticator = (FBServiceClientAuthenticator *)v42;

    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.addSuggestedPage"));
    addSuggestedPageAuthenticator = v7->_addSuggestedPageAuthenticator;
    v7->_addSuggestedPageAuthenticator = (FBServiceClientAuthenticator *)v44;

    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.homeScreenLayoutAvailability"));
    homeScreenLayoutAvailabilityAuthenticator = v7->_homeScreenLayoutAvailabilityAuthenticator;
    v7->_homeScreenLayoutAvailabilityAuthenticator = (FBServiceClientAuthenticator *)v46;

    v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.homeScreenLayout"));
    homeScreenLayoutAuthenticator = v7->_homeScreenLayoutAuthenticator;
    v7->_homeScreenLayoutAuthenticator = (FBServiceClientAuthenticator *)v48;

    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.iconBadgeValue"));
    iconBadgeValueAuthenticator = v7->_iconBadgeValueAuthenticator;
    v7->_iconBadgeValueAuthenticator = (FBServiceClientAuthenticator *)v50;

    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.overflowSlotCount"));
    overflowSlotsAuthenticator = v7->_overflowSlotsAuthenticator;
    v7->_overflowSlotsAuthenticator = (FBServiceClientAuthenticator *)v52;

    v54 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.homeScreenSilhouetteLayout"));
    silhouetteAuthenticator = v7->_silhouetteAuthenticator;
    v7->_silhouetteAuthenticator = (FBServiceClientAuthenticator *)v54;

    v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.iconTintColor"));
    iconTintColorAuthenticator = v7->_iconTintColorAuthenticator;
    v7->_iconTintColorAuthenticator = (FBServiceClientAuthenticator *)v56;

    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.homeScreenIconStyle"));
    iconStyleAuthenticator = v7->_iconStyleAuthenticator;
    v7->_iconStyleAuthenticator = (FBServiceClientAuthenticator *)v58;

    v7->_homeScreenLayoutAvailable = objc_msgSend((id)objc_opt_class(), "isHomeScreenLayoutAvailableForIconController:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = *MEMORY[0x1E0DAAA08];
    objc_msgSend(v5, "model");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObserver:selector:name:object:", v7, sel_iconModelDidLayout_, v61, v62);

    v63 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeConnections = v7->_activeConnections;
    v7->_activeConnections = v63;

    v7->_lock._os_unfair_lock_opaque = 0;
    v65 = (void *)MEMORY[0x1E0D23030];
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __46__SBHomeScreenService_initWithIconController___block_invoke;
    v70[3] = &unk_1E8E9EFA0;
    v66 = v7;
    v71 = v66;
    objc_msgSend(v65, "listenerWithConfigurator:", v70);
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = v66[35];
    v66[35] = (id)v67;

    objc_msgSend(v66[35], "activate");
  }

  return v7;
}

void __46__SBHomeScreenService_initWithIconController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAEB0], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DAAA08];
  -[SBIconController model](self->_iconController, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconStyleCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeIconStyleObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)SBHomeScreenService;
  -[SBHomeScreenService dealloc](&v8, sel_dealloc);
}

- (id)homeScreenDefaults
{
  void *v2;
  void *v3;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)resetHomeScreenLayoutWithCompletion:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  id v15;

  v4 = (void (**)(id, id))a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService resetHomeScreenLayoutAuthenticator](self, "resetHomeScreenLayoutAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v15);
  v10 = v15;

  if ((v9 & 1) != 0)
  {
    -[SBHomeScreenService iconController](self, "iconController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "resetHomeScreenLayout");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHomeScreenServiceErrorDomain"), 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v13;
    }
  }
  else
  {
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService resetHomeScreenLayoutWithCompletion:].cold.1(v10);

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v4[2](v4, v10);

}

- (void)unforbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  id v18;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService resetHomeScreenLayoutAuthenticator](self, "resetHomeScreenLayoutAuthenticator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v12 = objc_msgSend(v11, "authenticateAuditToken:error:", v10, &v18);
  v13 = v18;

  if ((v12 & 1) != 0)
  {
    -[SBHomeScreenService iconController](self, "iconController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unforbidApplicationBundleIdentifierFromLibrary:", v6);

    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHomeScreenServiceErrorDomain"), 1, 0);
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v16;
    }
  }
  else
  {
    SBLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService unforbidApplicationBundleIdentifierFromLibrary:withCompletion:].cold.1(v13);

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v7[2](v7, v13);

}

- (void)forbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  id v18;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService resetHomeScreenLayoutAuthenticator](self, "resetHomeScreenLayoutAuthenticator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v12 = objc_msgSend(v11, "authenticateAuditToken:error:", v10, &v18);
  v13 = v18;

  if ((v12 & 1) != 0)
  {
    -[SBHomeScreenService iconController](self, "iconController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "forbidApplicationBundleIdentifierFromLibrary:", v6);

    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHomeScreenServiceErrorDomain"), 1, 0);
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v16;
    }
  }
  else
  {
    SBLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService forbidApplicationBundleIdentifierFromLibrary:withCompletion:].cold.1(v13);

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v7[2](v7, v13);

}

- (void)resetCategoriesLayoutWithCompletion:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  id v15;

  v4 = (void (**)(id, id))a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService resetHomeScreenLayoutAuthenticator](self, "resetHomeScreenLayoutAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v15);
  v10 = v15;

  if ((v9 & 1) != 0)
  {
    -[SBHomeScreenService iconController](self, "iconController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "resetCategories");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHomeScreenServiceErrorDomain"), 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v13;
    }
  }
  else
  {
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService resetCategoriesLayoutWithCompletion:].cold.1(v10);

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v4[2](v4, v10);

}

- (void)runFloatingDockStressTestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService resetHomeScreenLayoutAuthenticator](self, "resetHomeScreenLayoutAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v23);
  v9 = v23;

  if ((v6 & 1) != 0)
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeDisplayWindowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatingDockController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    v15 = v13;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v18 = v16;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "suggestionsModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __63__SBHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke;
      v21[3] = &unk_1E8E9E8D0;
      v22 = v4;
      objc_msgSend(v19, "_runStressTestWithCompletion:", v21);

    }
    else if (v9)
    {
      (*((void (**)(id, id))v4 + 2))(v4, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v20);

    }
    goto LABEL_18;
  }
  SBLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SBHomeScreenService runFloatingDockStressTestWithCompletion:].cold.1(v9);

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v10);
LABEL_18:

    goto LABEL_19;
  }
  (*((void (**)(id, id))v4 + 2))(v4, v9);
LABEL_19:

}

uint64_t __63__SBHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)requestSuggestedApplicationWithBundleIdentifier:(id)a3 assertionPort:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteProcess");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "auditToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService requestSuggestedAppAuthenticator](self, "requestSuggestedAppAuthenticator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  LOBYTE(v12) = objc_msgSend(v14, "authenticateAuditToken:error:", v13, &v30);
  v15 = v30;

  if ((v12 & 1) != 0)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "applicationWithBundleIdentifier:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SBApp, "windowSceneManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activeDisplayWindowScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatingDockController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v17
      && v20
      && (objc_msgSend(v20, "requestedSuggestedApplication"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v22,
          !v22))
    {
      objc_msgSend(v21, "setRequestedSuggestedApplication:", v17);
      v26 = (void *)MEMORY[0x1E0D01810];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __96__SBHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_assertionPort_completion___block_invoke;
      v27[3] = &unk_1E8E9E820;
      v28 = v21;
      v29 = v17;
      objc_msgSend(v26, "monitorSendRight:withHandler:", v9, v27);

      v24 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHomeScreenServiceErrorDomain"), 1, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v15;
      v15 = (id)v23;
    }

    v10[2](v10, v15);
  }
  else
  {
    SBLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService requestSuggestedApplicationWithBundleIdentifier:assertionPort:completion:].cold.1(v15);

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10[2](v10, v15);
  }

}

void __96__SBHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_assertionPort_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  BSDispatchMain();

}

void __96__SBHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_assertionPort_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "requestedSuggestedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 32), "setRequestedSuggestedApplication:", 0);
}

- (id)folderPathToIconWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v15;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService iconFolderPathLookupAuthenticator](self, "iconFolderPathLookupAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v15);
  v10 = v15;

  if ((v9 & 1) != 0)
  {
    -[SBHomeScreenService iconController](self, "iconController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconPathForIconWithDisplayID:", v4);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAEA0]), "initWithArray:", v12);
  }
  else
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService folderPathToIconWithBundleIdentifier:].cold.1(v10);
    v13 = 0;
  }

  return v13;
}

- (void)addApplicationIconToHomeScreenWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService addApplicationIconAuthenticator](self, "addApplicationIconAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v15);
  v10 = v15;

  if ((v9 & 1) != 0)
  {
    if (objc_msgSend(v4, "length"))
    {
      -[SBHomeScreenService iconController](self, "iconController");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject iconManager](v11, "iconManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "iconModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "applicationIconForBundleIdentifier:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        -[NSObject addIconToHomeScreen:](v11, "addIconToHomeScreen:", v14);

    }
    else
    {
      SBLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SBHomeScreenService addApplicationIconToHomeScreenWithBundleIdentifier:].cold.1(v11);
    }
  }
  else
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService addApplicationIconToHomeScreenWithBundleIdentifier:].cold.2(v10);
  }

}

- (NSNumber)largeIconLayoutEnabledValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v13;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService largeIconLayoutAuthenticator](self, "largeIconLayoutAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  LOBYTE(v4) = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v13);
  v7 = v13;

  if ((v4 & 1) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject homeScreenDefaults](v8, "homeScreenDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldUseLargeDefaultSizedIcons");

  }
  else
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService largeIconLayoutEnabledValue].cold.1(v7);
    v10 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v11;
}

- (void)setLargeIconLayoutEnabledValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService largeIconLayoutAuthenticator](self, "largeIconLayoutAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v12);
  v9 = v12;

  if ((v6 & 1) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject homeScreenDefaults](v10, "homeScreenDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShouldUseLargeDefaultSizedIcons:", objc_msgSend(v4, "BOOLValue"));

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService setLargeIconLayoutEnabledValue:].cold.1(v9);
  }

}

- (NSNumber)addsNewIconsToHomeScreenValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v12;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService addsNewIconsToHomeScreenAuthenticator](self, "addsNewIconsToHomeScreenAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LOBYTE(v4) = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v12);
  v7 = v12;

  if ((v4 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject shouldAddNewIconsToRootFolder](v8, "shouldAddNewIconsToRootFolder");
  }
  else
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService addsNewIconsToHomeScreenValue].cold.1(v7);
    v9 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v10;
}

- (void)setAddsNewIconsToHomeScreenValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService addsNewIconsToHomeScreenAuthenticator](self, "addsNewIconsToHomeScreenAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v12);
  v9 = v12;

  if ((v6 & 1) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject homeScreenDefaults](v10, "homeScreenDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutomaticallyAddsNewApplications:", objc_msgSend(v4, "BOOLValue"));

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService setAddsNewIconsToHomeScreenValue:].cold.1(v9);
  }

}

- (void)setIconListsHidden:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  NSObject *obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService addsNewIconsToHomeScreenAuthenticator](self, "addsNewIconsToHomeScreenAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v49);
  v10 = v49;

  if ((v9 & 1) != 0)
  {
    v31 = v10;
    v32 = v7;
    -[SBHomeScreenService iconController](self, "iconController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootFolder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lists");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v14;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v46 != v17)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "setHidden:", 0);
        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v16);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v33 = v4;
    objc_msgSend(v4, "array");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v19)
    {
      v20 = v19;
      v35 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v42 != v35)
            objc_enumerationMutation(v34);
          v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v23 = obj;
          v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v38;
            do
            {
              for (k = 0; k != v25; ++k)
              {
                if (*(_QWORD *)v38 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
                objc_msgSend(v28, "uniqueIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "isEqualToString:", v22);

                if (v30)
                  objc_msgSend(v28, "setHidden:", 1);
              }
              v25 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
            }
            while (v25);
          }

        }
        v20 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v20);
    }

    v7 = v32;
    v4 = v33;
    v10 = v31;
  }
  else
  {
    SBLogCommon();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService setIconListsHidden:].cold.1(v10);
  }

}

- (NSNumber)showsBadgesInAppLibraryValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v13;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService showsBadgesInAppLibraryAuthenticator](self, "showsBadgesInAppLibraryAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  LOBYTE(v4) = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v13);
  v7 = v13;

  if ((v4 & 1) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject homeScreenDefaults](v8, "homeScreenDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "showsBadgesInAppLibrary");

  }
  else
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService showsBadgesInAppLibraryValue].cold.1(v7);
    v10 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v11;
}

- (void)setShowsBadgesInAppLibraryValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService showsBadgesInAppLibraryAuthenticator](self, "showsBadgesInAppLibraryAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v12);
  v9 = v12;

  if ((v6 & 1) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject homeScreenDefaults](v10, "homeScreenDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShowsBadgesInAppLibrary:", objc_msgSend(v4, "BOOLValue"));

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService setShowsBadgesInAppLibraryValue:].cold.1(v9);
  }

}

- (NSNumber)showsHomeScreenSearchAffordanceValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v13;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService showsHomeScreenSearchAffordanceAuthenticator](self, "showsHomeScreenSearchAffordanceAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  LOBYTE(v4) = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v13);
  v7 = v13;

  if ((v4 & 1) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject homeScreenDefaults](v8, "homeScreenDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "showsHomeScreenSearchAffordance");

  }
  else
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService showsHomeScreenSearchAffordanceValue].cold.1(v7);
    v10 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v11;
}

- (void)setShowsHomeScreenSearchAffordanceValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService showsHomeScreenSearchAffordanceAuthenticator](self, "showsHomeScreenSearchAffordanceAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v12);
  v9 = v12;

  if ((v6 & 1) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject homeScreenDefaults](v10, "homeScreenDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShowsHomeScreenSearchAffordance:", objc_msgSend(v4, "BOOLValue"));

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService setShowsHomeScreenSearchAffordanceValue:].cold.1(v9);
  }

}

- (SBSHomeScreenServiceArrayOfStrings)allHomeScreenApplicationBundleIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService homeScreenBundleIdentifiersAuthenticator](self, "homeScreenBundleIdentifiersAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v7 = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v18);
  v8 = v18;

  if ((v7 & 1) != 0)
  {
    -[SBHomeScreenService iconController](self, "iconController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootFolder");
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__SBHomeScreenService_allHomeScreenApplicationBundleIdentifiers__block_invoke;
    v16[3] = &unk_1E8EAA728;
    v13 = v12;
    v17 = v13;
    -[NSObject enumerateAllIconsWithOptions:usingBlock:](v11, "enumerateAllIconsWithOptions:usingBlock:", 1, v16);

  }
  else
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService allHomeScreenApplicationBundleIdentifiers].cold.1(v8);
    v13 = 0;
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAEA0]), "initWithArray:", v13);
  return (SBSHomeScreenServiceArrayOfStrings *)v14;
}

void __64__SBHomeScreenService_allHomeScreenApplicationBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isApplicationIcon"))
  {
    if (objc_msgSend(v5, "hasApplication"))
    {
      objc_msgSend(v5, "applicationBundleID");
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = (void *)v3;
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

      }
    }
  }

}

- (SBSHomeScreenServiceArrayOfStrings)allHomeScreenApplicationPlaceholderBundleIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService homeScreenBundleIdentifiersAuthenticator](self, "homeScreenBundleIdentifiersAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v7 = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v18);
  v8 = v18;

  if ((v7 & 1) != 0)
  {
    -[SBHomeScreenService iconController](self, "iconController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootFolder");
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __75__SBHomeScreenService_allHomeScreenApplicationPlaceholderBundleIdentifiers__block_invoke;
    v16[3] = &unk_1E8EAA728;
    v13 = v12;
    v17 = v13;
    -[NSObject enumerateAllIconsWithOptions:usingBlock:](v11, "enumerateAllIconsWithOptions:usingBlock:", 1, v16);

  }
  else
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService allHomeScreenApplicationPlaceholderBundleIdentifiers].cold.1(v8);
    v13 = 0;
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAEA0]), "initWithArray:", v13);
  return (SBSHomeScreenServiceArrayOfStrings *)v14;
}

void __75__SBHomeScreenService_allHomeScreenApplicationPlaceholderBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isApplicationIcon"))
  {
    if (objc_msgSend(v5, "hasApplicationPlaceholder"))
    {
      objc_msgSend(v5, "applicationBundleID");
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = (void *)v3;
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

      }
    }
  }

}

- (NSString)allIconLists
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v15;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService homeScreenBundleIdentifiersAuthenticator](self, "homeScreenBundleIdentifiersAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v15);
  v8 = v15;

  if ((v7 & 1) != 0)
  {
    -[SBHomeScreenService iconController](self, "iconController");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject model](v9, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootFolder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "debugDescription");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService allIconLists].cold.1(v8);
    v13 = &stru_1E8EC7EC0;
  }

  return (NSString *)v13;
}

- (BOOL)hasWidgetWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService homeScreenBundleIdentifiersAuthenticator](self, "homeScreenBundleIdentifiersAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v19);
  v10 = v19;

  if ((v9 & 1) != 0)
  {
    -[SBHomeScreenService iconController](self, "iconController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootFolder");
    v13 = objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__SBHomeScreenService_hasWidgetWithBundleIdentifier___block_invoke;
    v17[3] = &unk_1E8EAA750;
    v18 = v4;
    -[NSObject indexPathForIconPassingTest:](v13, "indexPathForIconPassingTest:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

  }
  else
  {
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService hasWidgetWithBundleIdentifier:].cold.1(v10);
    v15 = 0;
  }

  return v15;
}

uint64_t __53__SBHomeScreenService_hasWidgetWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isWidgetIcon"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "widgets", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "extensionBundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if ((v10 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_13:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)debugContinuityWithBadgeType:(id)a3 deviceTypeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v16;

  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteProcess");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "auditToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHomeScreenService configurationAuthenticator](self, "configurationAuthenticator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v12 = objc_msgSend(v11, "authenticateAuditToken:error:", v10, &v16);
    v13 = v16;

    if ((v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DAA5C0], "itemForBadgeTypeString:deviceTypeIdentifier:", v6, v7);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DAA620], "setDebugContinuityItem:", v14);
    }
    else
    {
      SBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SBHomeScreenService debugContinuityWithBadgeType:deviceTypeIdentifier:].cold.1(v13);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)runDownloadingIconTest
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)runRemoveAndRestoreIconTest
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

void __101__SBHomeScreenService__requestAppLibraryUpdate_categoryMapProvider_reason_optionalCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "removeObserver:", WeakRetained);

  objc_msgSend(v11, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DAA810]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v11, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DAA818]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

  }
}

- (void)configureDeweyEachAppHasItsOwnCategory
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)configureDeweyOneCategoryWithAllApps
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)configureLibraryWithCategoryLimit:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService configurationAuthenticator](self, "configurationAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v11);
  v9 = v11;

  if ((v6 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject _configureLibraryWithCategoryLimit:](v10, "_configureLibraryWithCategoryLimit:", objc_msgSend(v4, "integerValue"));
  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService configureLibraryWithCategoryLimit:].cold.1(v9);
  }

}

- (id)configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService configurationAuthenticator](self, "configurationAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v13);
  v9 = v13;

  if ((v6 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject _configureCategoryMapProviderToUseCategoryMapAtURL:](v10, "_configureCategoryMapProviderToUseCategoryMapAtURL:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService configureCategoryMapProviderToUseCategoryMapAtURL:].cold.1(v9);
    v11 = 0;
  }

  return v11;
}

- (void)organizeAllIconsIntoFoldersWithPageCount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService configurationAuthenticator](self, "configurationAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v12);
  v9 = v12;

  if ((v6 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject iconManager](v10, "iconManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "organizeAllIconsIntoFoldersWithPageCount:", objc_msgSend(v4, "unsignedIntegerValue"));

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService organizeAllIconsIntoFoldersWithPageCount:].cold.1(v9);
  }

}

- (void)organizeAllIconsAcrossPagesWithPageCount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService configurationAuthenticator](self, "configurationAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v12);
  v9 = v12;

  if ((v6 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject iconManager](v10, "iconManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "organizeAllIconsAcrossPagesWithPageCount:", objc_msgSend(v4, "unsignedIntegerValue"));

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService organizeAllIconsAcrossPagesWithPageCount:].cold.1(v9);
  }

}

- (void)randomizeAllIconsAcrossPagesWithPageCount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService configurationAuthenticator](self, "configurationAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v12);
  v9 = v12;

  if ((v6 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject iconManager](v10, "iconManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "randomizeAllIconsAcrossPagesWithPageCount:", objc_msgSend(v4, "unsignedIntegerValue"));

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService randomizeAllIconsAcrossPagesWithPageCount:].cold.1(v9);
  }

}

- (void)ignoreAllApps
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)removeAllWidgets
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)removeWidgetsFromHomeScreen
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)deleteAllWebClips
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)changeDisplayedDateOverride:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService displayedDateAuthenticator](self, "displayedDateAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v11);
  v9 = v11;

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject setOverrideDate:](v10, "setOverrideDate:", v4);
  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService changeDisplayedDateOverride:].cold.1(v9);
  }

}

- (void)changeDisplayedDateOffsetOverride:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService displayedDateAuthenticator](self, "displayedDateAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v11);
  v9 = v11;

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    -[NSObject setOverrideDateOffset:](v10, "setOverrideDateOffset:");
  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService changeDisplayedDateOffsetOverride:].cold.1(v9);
  }

}

- (void)reloadIcons
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)reloadHomeScreenLayout
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)resetTodayViewLayout
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)clearTodayViewLayout
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)overrideBadgeValue:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService configurationAuthenticator](self, "configurationAuthenticator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  LOBYTE(v9) = objc_msgSend(v11, "authenticateAuditToken:error:", v10, &v21);
  v12 = v21;

  if ((v9 & 1) != 0)
  {
    v13 = v6;
    if (objc_msgSend(v13, "integerValue") >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "integerValue"));
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v14;
    }
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "iconManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iconModel");
    v17 = objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__SBHomeScreenService_overrideBadgeValue_forBundleIdentifier___block_invoke;
    v19[3] = &unk_1E8EAA7A0;
    v20 = v13;
    v18 = v13;
    -[NSObject enumerateApplicationIconsForBundleIdentifier:usingBlock:](v17, "enumerateApplicationIconsForBundleIdentifier:usingBlock:", v7, v19);

  }
  else
  {
    SBLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService overrideBadgeValue:forBundleIdentifier:].cold.1(v12);
  }

}

uint64_t __62__SBHomeScreenService_overrideBadgeValue_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOverrideBadgeNumberOrString:", *(_QWORD *)(a1 + 32));
}

- (void)clearNewlyInstalledAndRecentlyUpdatedAppIndicators
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)presentAppLibraryCategoryPodForCategoryIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  SBIconController *v15;
  SBIconController *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService openPodAuthenticator](self, "openPodAuthenticator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = objc_msgSend(v11, "authenticateAuditToken:error:", v10, &v21);
  v13 = v21;

  if ((v12 & 1) != 0)
  {
    -[SBHomeScreenService _translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:](self, "_translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBHomeScreenService _isLibraryPresentationAllowedWithCompletion:](self, "_isLibraryPresentationAllowedWithCompletion:", v14))
    {
      v15 = self->_iconController;
      if (-[SBIconController isModalAppLibrarySupported](v15, "isModalAppLibrarySupported"))
      {
        objc_msgSend((id)SBApp, "windowSceneManager");
        v16 = (SBIconController *)objc_claimAutoreleasedReturnValue();

        -[SBIconController activeDisplayWindowScene](v16, "activeDisplayWindowScene");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "modalLibraryController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "presentLibraryCategoryPodForCategoryIdentifier:animated:completion:", v6, 1, v14);

        v15 = v16;
      }
      else
      {
        -[SBIconController presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier:animated:completion:](v15, "presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier:animated:completion:", v6, 1, v14);
      }

    }
  }
  else
  {
    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService presentAppLibraryCategoryPodForCategoryIdentifier:completion:].cold.1(v13);

    if (v13)
    {
      v7[2](v7, v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v20);

    }
  }

}

- (BOOL)_isLibraryPresentationAllowedWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (void (**)(id, void *))a3;
  -[SBHomeScreenService iconController](self, "iconController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isAppLibraryAllowed") & 1) != 0)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isUILocked");

    if (v7)
    {
      if (v4)
        goto LABEL_6;
LABEL_13:
      v9 = 0;
      goto LABEL_14;
    }
    objc_msgSend((id)SBApp, "windowSceneManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeDisplayWindowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutStateProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "unlockedEnvironmentMode") == 1)
    {

      v9 = 1;
      goto LABEL_7;
    }
    v13 = objc_msgSend(v5, "isModalAppLibrarySupported");

    if ((v13 & 1) != 0)
    {
      v9 = 1;
      goto LABEL_14;
    }
    if (!v4)
      goto LABEL_13;
  }
  else if (!v4)
  {
    goto LABEL_13;
  }
LABEL_6:
  SBHLibraryPresentationErrorForCode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8);
  v9 = 0;
LABEL_7:

LABEL_14:
  return v9;
}

- (void)presentAppLibraryAnimated:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;

  v6 = (void (**)(id, id))a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "auditToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService configurationAuthenticator](self, "configurationAuthenticator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v11 = objc_msgSend(v10, "authenticateAuditToken:error:", v9, &v20);
  v12 = v20;

  if ((v11 & 1) != 0)
  {
    -[SBHomeScreenService _translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:](self, "_translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBHomeScreenService _isLibraryPresentationAllowedWithCompletion:](self, "_isLibraryPresentationAllowedWithCompletion:", v13))
    {
      -[SBHomeScreenService iconController](self, "iconController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isModalAppLibrarySupported"))
      {
        objc_msgSend((id)SBApp, "windowSceneManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "activeDisplayWindowScene");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "modalLibraryController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "presentLibraryAnimated:completion:", a3 != 0, 0);

      }
      else
      {
        objc_msgSend(v14, "presentLibraryFromOverlayControllerAnimated:completion:", a3 != 0, 0);
      }

    }
  }
  else
  {
    SBLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService presentAppLibraryAnimated:completion:].cold.1(v12);

    if (v12)
    {
      v6[2](v6, v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v19);

    }
  }

}

- (void)dismissAppLibraryWithCompletion:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;

  v4 = (void (**)(id, id))a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService openPodAuthenticator](self, "openPodAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v18);
  v10 = v18;

  if ((v9 & 1) != 0)
  {
    -[SBHomeScreenService _translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:](self, "_translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBHomeScreenService _isLibraryDismissalAllowedWithCompletion:](self, "_isLibraryDismissalAllowedWithCompletion:", v11))
    {
      -[SBHomeScreenService iconController](self, "iconController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isModalAppLibrarySupported"))
      {
        objc_msgSend((id)SBApp, "windowSceneManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "activeDisplayWindowScene");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "modalLibraryController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dismissLibraryAnimated:completion:", 1, 0);

      }
      else
      {
        objc_msgSend(v12, "dismissLibraryAnimated:completion:", 1, 0);
      }

    }
  }
  else
  {
    SBLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService dismissAppLibraryWithCompletion:].cold.1(v10);

    if (v10)
    {
      v4[2](v4, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v17);

    }
  }

}

- (BOOL)_isLibraryDismissalAllowedWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  BOOL v13;
  char v14;

  v4 = (void (**)(id, void *))a3;
  -[SBHomeScreenService iconController](self, "iconController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeDisplayWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isAppLibraryAllowed") & 1) == 0)
  {
    if (v4)
      goto LABEL_15;
    goto LABEL_17;
  }
  if (objc_msgSend(v5, "isModalAppLibrarySupported"))
  {
    objc_msgSend(v7, "modalLibraryController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isPresentingLibrary");
  }
  else
  {
    objc_msgSend(v5, "iconManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isMainDisplayLibraryViewVisible");
  }
  v10 = v9;

  if ((v10 & 1) == 0)
  {
    if (v4)
      goto LABEL_15;
    goto LABEL_17;
  }
  objc_msgSend(v7, "layoutStateProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "unlockedEnvironmentMode") == 1)
  {

    v13 = 1;
LABEL_16:

    goto LABEL_18;
  }
  v14 = objc_msgSend(v5, "isModalAppLibrarySupported");

  if ((v14 & 1) == 0)
  {
    if (v4)
    {
LABEL_15:
      SBHLibraryPresentationErrorForCode();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v11);
      v13 = 0;
      goto LABEL_16;
    }
LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
  v13 = 1;
LABEL_18:

  return v13;
}

- (id)_translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__SBHomeScreenService__translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion___block_invoke;
  v8[3] = &unk_1E8E9F598;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1D17E5550](v8);
  v6 = (void *)MEMORY[0x1D17E5550]();

  return v6;
}

void __98__SBHomeScreenService__translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v11 = v3;
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAA838]);

    if (v5)
    {
      objc_msgSend(v11, "code");
      v6 = SBSLibraryPodPresentationErrorCodeForErrorCode();
      NSStringFromSBSLibraryPodPresentationErrorCode();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0CB2D50]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addEntriesFromDictionary:", v9);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAB790], v6, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    v3 = v11;
  }

}

- (void)addDebugIconWithSizeClassDescription:(id)a3 inPage:(id)a4 atPositionDescription:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteProcess");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "auditToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService addDebugIconAuthenticator](self, "addDebugIconAuthenticator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  LOBYTE(v12) = objc_msgSend(v14, "authenticateAuditToken:error:", v13, &v36);
  v15 = v36;

  if ((v12 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iconManager");
    v17 = objc_claimAutoreleasedReturnValue();

    SBHIconGridSizeClassForString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v9, "unsignedIntegerValue");
    v20 = objc_msgSend(v10, "rangeOfString:", CFSTR(","));
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSObject addDebugIconOfSizeClass:toPage:iconIndex:](v17, "addDebugIconOfSizeClass:toPage:iconIndex:", v18, v19, objc_msgSend(v10, "integerValue"));
    }
    else
    {
      v22 = v20;
      v23 = v21;
      v35 = v19;
      objc_msgSend(v10, "substringToIndex:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v24, "integerValue");

      objc_msgSend(v10, "substringFromIndex:", v22 + v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");

      if (objc_msgSend(v10, "hasSuffix:", CFSTR("P")))
      {
        v27 = v17;
        v28 = v18;
        v30 = v34;
        v29 = v35;
        v31 = v26;
        v32 = 1;
      }
      else
      {
        v33 = objc_msgSend(v10, "hasSuffix:", CFSTR("L"));
        v29 = v35;
        if (!v33)
        {
          -[NSObject addDebugIconOfSizeClass:toPage:coordinate:](v17, "addDebugIconOfSizeClass:toPage:coordinate:", v18, v35, v34, v26);
          goto LABEL_12;
        }
        v27 = v17;
        v28 = v18;
        v30 = v34;
        v31 = v26;
        v32 = 4;
      }
      -[NSObject addDebugIconOfSizeClass:toPage:coordinate:orientation:](v27, "addDebugIconOfSizeClass:toPage:coordinate:orientation:", v28, v29, v30, v31, v32);
    }
LABEL_12:

    goto LABEL_13;
  }
  SBLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SBHomeScreenService addDebugIconWithSizeClassDescription:inPage:atPositionDescription:].cold.1(v15);
LABEL_13:

}

- (void)noteInstalledWebClipsDidChange
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SBHomeScreenService webClipObservingConnections](self, "webClipObservingConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "remoteTarget", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "installedWebClipsDidChange");

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (SBSDebugActiveWidgetInfo)debuggingActiveWidgetInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService activeWidgetInfoAuthenticator](self, "activeWidgetInfoAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v13);
  v8 = v13;

  if ((v7 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconManager");
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSObject debuggingActiveWidgetInfo](v10, "debuggingActiveWidgetInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService debuggingActiveWidgetInfo].cold.1(v8);
    v11 = 0;
  }

  return (SBSDebugActiveWidgetInfo *)v11;
}

- (void)insertEmptyPageAtIndex:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  id v15;
  id v16;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService addEmptyPageAuthenticator](self, "addEmptyPageAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v16);
  v10 = v16;

  if ((v9 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconManager");
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject rootFolder](v12, "rootFolder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "unsignedIntegerValue");
    if (v14 <= objc_msgSend(v13, "listCount"))
      v15 = (id)objc_msgSend(v13, "insertEmptyListAtIndex:", v14);

  }
  else
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService insertEmptyPageAtIndex:].cold.1(v10);
  }

}

- (void)addEmptyPage
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)addSuggestedPageWithPageType:(id)a3 focusModeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService addSuggestedPageAuthenticator](self, "addSuggestedPageAuthenticator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v12 = objc_msgSend(v11, "authenticateAuditToken:error:", v10, &v17);
  v13 = v17;

  if ((v12 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iconManager");
    v15 = objc_claimAutoreleasedReturnValue();

    -[NSObject proactivePageSuggestionsManager](v15, "proactivePageSuggestionsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_addSuggestedPageWithPageType:focusModeIdentifier:", v6, v7);

  }
  else
  {
    SBLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService addSuggestedPageWithPageType:focusModeIdentifier:].cold.1(v13);
  }

}

- (void)setObservingHomeScreenLayoutAvailability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  int v11;
  NSMutableSet *layoutAvailabilityObservingConnections;
  NSMutableSet *v13;
  NSMutableSet *v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService homeScreenLayoutAvailabilityAuthenticator](self, "homeScreenLayoutAvailabilityAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v18);
  v10 = v18;

  if ((v9 & 1) == 0)
  {
    SBLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService setObservingHomeScreenLayoutAvailability:].cold.1(v10);
    goto LABEL_12;
  }
  os_unfair_lock_lock(&self->_lock);
  v11 = objc_msgSend(v4, "BOOLValue");
  layoutAvailabilityObservingConnections = self->_layoutAvailabilityObservingConnections;
  if (v11)
  {
    if (!layoutAvailabilityObservingConnections)
    {
      v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v14 = self->_layoutAvailabilityObservingConnections;
      self->_layoutAvailabilityObservingConnections = v13;

      layoutAvailabilityObservingConnections = self->_layoutAvailabilityObservingConnections;
    }
    -[NSMutableSet addObject:](layoutAvailabilityObservingConnections, "addObject:", v5);
  }
  else
  {
    -[NSMutableSet removeObject:](layoutAvailabilityObservingConnections, "removeObject:", v5);
  }
  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(v4, "BOOLValue"))
  {
    -[SBHomeScreenService homeScreenLayoutAvailability](self, "homeScreenLayoutAvailability");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
    {
      objc_msgSend(v5, "remoteTarget");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject homeScreenLayoutAvailabilityDidChange:](v15, "homeScreenLayoutAvailabilityDidChange:", MEMORY[0x1E0C9AAB0]);
LABEL_12:

    }
  }

}

- (void)noteHomeScreenLayoutAvailabilityDidChange
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SBHomeScreenService layoutAvailabilityObservingConnections](self, "layoutAvailabilityObservingConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  v6 = -[SBHomeScreenService isHomeScreenLayoutAvailable](self, "isHomeScreenLayoutAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "remoteTarget", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "homeScreenLayoutAvailabilityDidChange:", v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (NSNumber)homeScreenLayoutAvailability
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  _BOOL8 v9;
  void *v10;
  NSObject *v11;
  id v13;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService homeScreenLayoutAvailabilityAuthenticator](self, "homeScreenLayoutAvailabilityAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v13);
  v8 = v13;

  if ((v7 & 1) != 0)
  {
    v9 = -[SBHomeScreenService isHomeScreenLayoutAvailable](self, "isHomeScreenLayoutAvailable");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService homeScreenLayoutAvailability].cold.1(v8);

    v10 = (void *)MEMORY[0x1E0C9AAA0];
  }

  return (NSNumber *)v10;
}

+ (BOOL)isHomeScreenLayoutAvailableForIconController:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (unint64_t)(objc_msgSend(v3, "lastLayoutStatus") - 1) < 2;
  else
    v5 = 0;

  return v5;
}

- (void)iconModelDidLayout:(id)a3
{
  uint64_t v4;
  id v5;

  -[SBHomeScreenService iconController](self, "iconController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "isHomeScreenLayoutAvailableForIconController:", v5);
  if ((_DWORD)v4 != -[SBHomeScreenService isHomeScreenLayoutAvailable](self, "isHomeScreenLayoutAvailable"))
  {
    -[SBHomeScreenService setHomeScreenLayoutAvailable:](self, "setHomeScreenLayoutAvailable:", v4);
    -[SBHomeScreenService noteHomeScreenLayoutAvailabilityDidChange](self, "noteHomeScreenLayoutAvailabilityDidChange");
  }
  -[SBHomeScreenService noteHomeScreenLayoutDidChange](self, "noteHomeScreenLayoutDidChange");

}

- (void)setObservingHomeScreenLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  int v11;
  NSMutableSet *layoutObservingConnections;
  NSMutableSet *v13;
  NSMutableSet *v14;
  NSObject *v15;
  id v16;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService homeScreenLayoutAuthenticator](self, "homeScreenLayoutAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v16);
  v10 = v16;

  if ((v9 & 1) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    v11 = objc_msgSend(v4, "BOOLValue");
    layoutObservingConnections = self->_layoutObservingConnections;
    if (v11)
    {
      if (!layoutObservingConnections)
      {
        v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v14 = self->_layoutObservingConnections;
        self->_layoutObservingConnections = v13;

        layoutObservingConnections = self->_layoutObservingConnections;
      }
      -[NSMutableSet addObject:](layoutObservingConnections, "addObject:", v5);
    }
    else
    {
      -[NSMutableSet removeObject:](layoutObservingConnections, "removeObject:", v5);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    SBLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService setObservingHomeScreenLayout:].cold.1(v10);

  }
}

- (void)noteHomeScreenLayoutDidChange
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SBHomeScreenService layoutObservingConnections](self, "layoutObservingConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "remoteTarget", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "homeScreenLayoutDidChange");

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)beginObservingNotificationsForIconBadgeValue
{
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_leafIconDataSourceDidChange_, *MEMORY[0x1E0DAAA60], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = SBIconControllerIconBadgeVisibilityDidChangeNotification;
  -[SBHomeScreenService iconController](self, "iconController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_iconBadgeVisibilityDidChange_, v4, v5);

}

- (void)endObservingNotificationsForIconBadgeValue
{
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DAAA60], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = SBIconControllerIconBadgeVisibilityDidChangeNotification;
  -[SBHomeScreenService iconController](self, "iconController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, v4, v5);

}

- (void)leafIconDataSourceDidChange:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenService processUpdatesToBadgeValueForApplicationBundleIdentifiers:](self, "processUpdatesToBadgeValueForApplicationBundleIdentifiers:", v8);

    }
    v6 = v9;
  }

}

- (void)iconBadgeVisibilityDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBApplicationBundleIdentifiers"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[SBHomeScreenService processUpdatesToBadgeValueForApplicationBundleIdentifiers:](self, "processUpdatesToBadgeValueForApplicationBundleIdentifiers:", v6);
    v5 = v6;
  }

}

- (void)processUpdatesToBadgeValueForApplicationBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  SBHomeScreenService *v15;
  id v16;

  v4 = a3;
  -[SBHomeScreenService iconBadgeValueUpdateBatchTimer](self, "iconBadgeValueUpdateBatchTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SBHomeScreenService iconBadgeValueUpdateBatchBundleIdentifiers](self, "iconBadgeValueUpdateBatchBundleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v4);

  }
  else
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    -[SBHomeScreenService setIconBadgeValueUpdateBatchBundleIdentifiers:](self, "setIconBadgeValueUpdateBatchBundleIdentifiers:", v7);
    v8 = (void *)MEMORY[0x1E0C99E88];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __81__SBHomeScreenService_processUpdatesToBadgeValueForApplicationBundleIdentifiers___block_invoke;
    v14 = &unk_1E8EA5240;
    v15 = self;
    v16 = v7;
    v9 = v7;
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v11, 0.1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenService setIconBadgeValueUpdateBatchTimer:](self, "setIconBadgeValueUpdateBatchTimer:", v10, v11, v12, v13, v14, v15);

  }
}

void __81__SBHomeScreenService_processUpdatesToBadgeValueForApplicationBundleIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setIconBadgeValueUpdateBatchTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIconBadgeValueUpdateBatchBundleIdentifiers:", 0);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "iconBadgeValueObservingConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_alloc(MEMORY[0x1E0DAAEA0]);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "remoteTarget", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "applicationIconInfoChangedForBundleIdentifiers:", v6);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (id)badgeValueForIconWithApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService iconBadgeValueAuthenticator](self, "iconBadgeValueAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v18);
  v10 = v18;

  if ((v9 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconManager");
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject iconModel](v12, "iconModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leafIconForIdentifier:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "badgeNumberOrString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAEA8]), "initWithNumberOrString:", v15);

  }
  else
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService badgeValueForIconWithApplicationBundleIdentifier:].cold.1(v10);
    v16 = 0;
  }

  return v16;
}

- (void)badgeValueForIconWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService iconBadgeValueAuthenticator](self, "iconBadgeValueAuthenticator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = objc_msgSend(v11, "authenticateAuditToken:error:", v10, &v21);
  v13 = v21;

  if ((v12 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iconManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "iconModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "applicationIconForBundleIdentifier:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "badgeNumberOrString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "allowsBadgingForIcon:", v17) & 1) == 0)
    {

      v18 = 0;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAEA8]), "initWithNumberOrString:", v18);
    v7[2](v7, v19, 0);

    v7 = (void (**)(id, void *, _QWORD))v15;
  }
  else
  {
    SBLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService badgeValueForIconWithApplicationBundleIdentifier:completionHandler:].cold.1(v13);

    v7[2](v7, 0, 0);
  }

}

- (SBSHomeScreenIconStyleConfiguration)homeScreenIconStyleConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  id v15;
  id v16;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService iconTintColorAuthenticator](self, "iconTintColorAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v16);
  v8 = v16;
  if (v7)
  {

    v9 = v8;
LABEL_4:
    +[SBIconController sharedInstanceIfExists](SBIconController, "sharedInstanceIfExists");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject currentHomeScreenIconStyleConfiguration](v12, "currentHomeScreenIconStyleConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[SBHomeScreenService iconStyleAuthenticator](self, "iconStyleAuthenticator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v10, "authenticateAuditToken:error:", v5, &v15);
  v9 = v15;

  if ((v11 & 1) != 0)
    goto LABEL_4;
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[SBHomeScreenService homeScreenIconStyleConfiguration].cold.1(v9);
  v13 = 0;
LABEL_8:

  return (SBSHomeScreenIconStyleConfiguration *)v13;
}

- (void)setHomeScreenIconStyleConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  NSObject *v14;
  id v15;
  id v16;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService iconTintColorAuthenticator](self, "iconTintColorAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v16);
  v10 = v16;
  if (v9)
  {

    v11 = v10;
LABEL_4:
    +[SBIconController sharedInstanceIfExists](SBIconController, "sharedInstanceIfExists");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject setCurrentHomeScreenIconStyleConfiguration:](v14, "setCurrentHomeScreenIconStyleConfiguration:", v4);
    goto LABEL_7;
  }
  -[SBHomeScreenService iconStyleAuthenticator](self, "iconStyleAuthenticator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v13 = objc_msgSend(v12, "authenticateAuditToken:error:", v7, &v15);
  v11 = v15;

  if ((v13 & 1) != 0)
    goto LABEL_4;
  SBLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SBHomeScreenService setHomeScreenIconStyleConfiguration:].cold.1(v11);
LABEL_7:

}

- (void)setObservingIconTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  int v14;
  uint64_t v15;
  NSMutableSet *iconTintColorObservingConnections;
  NSMutableSet *v17;
  NSMutableSet *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService iconTintColorAuthenticator](self, "iconTintColorAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v23);
  v10 = v23;
  if (v9)
  {

  }
  else
  {
    -[SBHomeScreenService iconStyleAuthenticator](self, "iconStyleAuthenticator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v12 = objc_msgSend(v11, "authenticateAuditToken:error:", v7, &v22);
    v13 = v22;

    if ((v12 & 1) == 0)
    {
      SBLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SBHomeScreenService setObservingIconTintColor:].cold.1(v13);
      goto LABEL_20;
    }
    v10 = v13;
  }
  v14 = objc_msgSend(v4, "BOOLValue");
  os_unfair_lock_lock(&self->_lock);
  v15 = -[NSMutableSet count](self->_iconTintColorObservingConnections, "count");
  iconTintColorObservingConnections = self->_iconTintColorObservingConnections;
  if (v14)
  {
    if (!iconTintColorObservingConnections)
    {
      v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v18 = self->_iconTintColorObservingConnections;
      self->_iconTintColorObservingConnections = v17;

      iconTintColorObservingConnections = self->_iconTintColorObservingConnections;
    }
    -[NSMutableSet addObject:](iconTintColorObservingConnections, "addObject:", v5);
  }
  else
  {
    -[NSMutableSet removeObject:](iconTintColorObservingConnections, "removeObject:", v5);
  }
  v19 = -[NSMutableSet count](self->_iconTintColorObservingConnections, "count");
  os_unfair_lock_unlock(&self->_lock);
  if (v15 || !v19)
  {
    if (v15 && !v19)
      -[SBHomeScreenService endObservingNotificationsForIconTintColor](self, "endObservingNotificationsForIconTintColor");
  }
  else
  {
    -[SBHomeScreenService beginObservingNotificationsForIconTintColor](self, "beginObservingNotificationsForIconTintColor");
  }
  if (v14)
  {
    objc_msgSend(v5, "remoteTarget");
    v20 = objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenService _currentStyleConfiguration](self, "_currentStyleConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject homeScreenIconStyleConfigurationDidChange:](v20, "homeScreenIconStyleConfigurationDidChange:", v21);

    v13 = v10;
LABEL_20:

    v10 = v13;
  }

}

- (void)beginObservingNotificationsForIconTintColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[SBHomeScreenService iconTintColorObserver](self, "iconTintColorObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    -[SBHomeScreenService homeScreenDefaults](self, "homeScreenDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __66__SBHomeScreenService_beginObservingNotificationsForIconTintColor__block_invoke;
    v13 = &unk_1E8E9DF28;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "observeIconTintColorOnQueue:withBlock:", v5, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHomeScreenService setIconTintColorObserver:](self, "setIconTintColorObserver:", v7, v10, v11, v12, v13);
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconStyleCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIconStyleObserver:", self);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __66__SBHomeScreenService_beginObservingNotificationsForIconTintColor__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyObserversOfIconImageStyleChange");

}

- (void)endObservingNotificationsForIconTintColor
{
  void *v3;
  void *v4;
  id v5;

  -[SBHomeScreenService iconTintColorObserver](self, "iconTintColorObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBHomeScreenService setIconTintColorObserver:](self, "setIconTintColorObserver:", 0);
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconStyleCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeIconStyleObserver:", self);

}

- (id)_currentStyleConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[SBIconController sharedInstanceIfExists](SBIconController, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconStyleCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v4, "styleType"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DAAE80], "automaticStyleConfiguration");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      objc_msgSend(MEMORY[0x1E0DAAE80], "darkStyleConfiguration");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      objc_msgSend(MEMORY[0x1E0DAAE80], "lightStyleConfiguration");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = (void *)v5;
      break;
    case 3:
      v7 = (void *)MEMORY[0x1E0DAAE80];
      objc_msgSend(v4, "accentColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "BSColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tintedStyleConfigurationWithTintColor:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (void)notifyObserversOfIconImageStyleChange
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SBHomeScreenService iconTintColorObservingConnections](self, "iconTintColorObservingConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  -[SBHomeScreenService _currentStyleConfiguration](self, "_currentStyleConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "remoteTarget", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "homeScreenIconStyleConfigurationDidChange:", v6);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)clearAllOverflowSlotCounts
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

uint64_t __49__SBHomeScreenService_clearAllOverflowSlotCounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOverflowSlotCount:", 0);
}

- (SBSHomeScreenServiceArrayOfNumbers)overflowSlotCounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService overflowSlotsAuthenticator](self, "overflowSlotsAuthenticator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v7 = objc_msgSend(v6, "authenticateAuditToken:error:", v5, &v22);
  v8 = v22;

  if ((v7 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconManager");
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSObject rootFolder](v10, "rootFolder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __41__SBHomeScreenService_overflowSlotCounts__block_invoke;
    v20 = &unk_1E8EAA808;
    v21 = v12;
    v13 = v12;
    objc_msgSend(v11, "enumerateListsWithOptions:usingBlock:", 4, &v17);
    v14 = objc_alloc(MEMORY[0x1E0DAAE98]);
    v15 = (void *)objc_msgSend(v14, "initWithArray:", v13, v17, v18, v19, v20);

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService overflowSlotCounts].cold.1(v8);
    v15 = 0;
  }

  return (SBSHomeScreenServiceArrayOfNumbers *)v15;
}

void __41__SBHomeScreenService_overflowSlotCounts__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "overflowSlotCount"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)setupHomeScreenForWidgetScrollPerformanceTest
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)runWidgetDiscoverabilityTest
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (id)silhouetteLayoutForPageAtIndex:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v15;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenService silhouetteAuthenticator](self, "silhouetteAuthenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v8, "authenticateAuditToken:error:", v7, &v15);
  v10 = v15;

  if ((v9 & 1) != 0)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconManager");
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject silhouetteLayoutForPageAtIndex:](v12, "silhouetteLayoutForPageAtIndex:", objc_msgSend(v4, "unsignedIntegerValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenService silhouetteLayoutForPageAtIndex:].cold.1(v10);
    v13 = 0;
  }

  return v13;
}

void __65__SBHomeScreenService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Client disconnection: %@", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "activeConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "webClipObservingConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "layoutObservingConnections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "layoutAvailabilityObservingConnections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "iconBadgeValueObservingConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "removeObject:", v3);
    if (!objc_msgSend(v9, "count"))
      objc_msgSend(*(id *)(a1 + 32), "endObservingNotificationsForIconBadgeValue");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));

}

- (SBIconController)iconController
{
  return self->_iconController;
}

- (FBServiceClientAuthenticator)resetHomeScreenLayoutAuthenticator
{
  return self->_resetHomeScreenLayoutAuthenticator;
}

- (FBServiceClientAuthenticator)requestSuggestedAppAuthenticator
{
  return self->_requestSuggestedAppAuthenticator;
}

- (FBServiceClientAuthenticator)iconFolderPathLookupAuthenticator
{
  return self->_iconFolderPathLookupAuthenticator;
}

- (FBServiceClientAuthenticator)addApplicationIconAuthenticator
{
  return self->_addApplicationIconAuthenticator;
}

- (FBServiceClientAuthenticator)addWidgetToTodayViewAuthenticator
{
  return self->_addWidgetToTodayViewAuthenticator;
}

- (FBServiceClientAuthenticator)largeIconLayoutAuthenticator
{
  return self->_largeIconLayoutAuthenticator;
}

- (FBServiceClientAuthenticator)addsNewIconsToHomeScreenAuthenticator
{
  return self->_addsNewIconsToHomeScreenAuthenticator;
}

- (FBServiceClientAuthenticator)showsBadgesInAppLibraryAuthenticator
{
  return self->_showsBadgesInAppLibraryAuthenticator;
}

- (FBServiceClientAuthenticator)showsHomeScreenSearchAffordanceAuthenticator
{
  return self->_showsHomeScreenSearchAffordanceAuthenticator;
}

- (FBServiceClientAuthenticator)homeScreenBundleIdentifiersAuthenticator
{
  return self->_homeScreenBundleIdentifiersAuthenticator;
}

- (FBServiceClientAuthenticator)displayedDateAuthenticator
{
  return self->_displayedDateAuthenticator;
}

- (FBServiceClientAuthenticator)configurationAuthenticator
{
  return self->_configurationAuthenticator;
}

- (FBServiceClientAuthenticator)openPodAuthenticator
{
  return self->_openPodAuthenticator;
}

- (FBServiceClientAuthenticator)addDebugIconAuthenticator
{
  return self->_addDebugIconAuthenticator;
}

- (FBServiceClientAuthenticator)activeWidgetInfoAuthenticator
{
  return self->_activeWidgetInfoAuthenticator;
}

- (FBServiceClientAuthenticator)addEmptyPageAuthenticator
{
  return self->_addEmptyPageAuthenticator;
}

- (FBServiceClientAuthenticator)addSuggestedPageAuthenticator
{
  return self->_addSuggestedPageAuthenticator;
}

- (FBServiceClientAuthenticator)homeScreenLayoutAvailabilityAuthenticator
{
  return self->_homeScreenLayoutAvailabilityAuthenticator;
}

- (FBServiceClientAuthenticator)homeScreenLayoutAuthenticator
{
  return self->_homeScreenLayoutAuthenticator;
}

- (FBServiceClientAuthenticator)overflowSlotsAuthenticator
{
  return self->_overflowSlotsAuthenticator;
}

- (FBServiceClientAuthenticator)silhouetteAuthenticator
{
  return self->_silhouetteAuthenticator;
}

- (FBServiceClientAuthenticator)iconTintColorAuthenticator
{
  return self->_iconTintColorAuthenticator;
}

- (FBServiceClientAuthenticator)iconStyleAuthenticator
{
  return self->_iconStyleAuthenticator;
}

- (NSMutableSet)webClipObservingConnections
{
  return self->_webClipObservingConnections;
}

- (NSMutableSet)layoutAvailabilityObservingConnections
{
  return self->_layoutAvailabilityObservingConnections;
}

- (NSMutableSet)layoutObservingConnections
{
  return self->_layoutObservingConnections;
}

- (NSMutableSet)iconBadgeValueObservingConnections
{
  return self->_iconBadgeValueObservingConnections;
}

- (NSMutableSet)iconTintColorObservingConnections
{
  return self->_iconTintColorObservingConnections;
}

- (BSServiceConnectionListener)connectionListener
{
  return self->_connectionListener;
}

- (BOOL)isHomeScreenLayoutAvailable
{
  return self->_homeScreenLayoutAvailable;
}

- (void)setHomeScreenLayoutAvailable:(BOOL)a3
{
  self->_homeScreenLayoutAvailable = a3;
}

- (NSTimer)iconBadgeValueUpdateBatchTimer
{
  return self->_iconBadgeValueUpdateBatchTimer;
}

- (void)setIconBadgeValueUpdateBatchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_iconBadgeValueUpdateBatchTimer, a3);
}

- (NSMutableSet)iconBadgeValueUpdateBatchBundleIdentifiers
{
  return self->_iconBadgeValueUpdateBatchBundleIdentifiers;
}

- (void)setIconBadgeValueUpdateBatchBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_iconBadgeValueUpdateBatchBundleIdentifiers, a3);
}

- (BSDefaultObserver)iconTintColorObserver
{
  return self->_iconTintColorObserver;
}

- (void)setIconTintColorObserver:(id)a3
{
  objc_storeStrong((id *)&self->_iconTintColorObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconTintColorObserver, 0);
  objc_storeStrong((id *)&self->_iconBadgeValueUpdateBatchBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_iconBadgeValueUpdateBatchTimer, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_iconTintColorObservingConnections, 0);
  objc_storeStrong((id *)&self->_iconBadgeValueObservingConnections, 0);
  objc_storeStrong((id *)&self->_layoutObservingConnections, 0);
  objc_storeStrong((id *)&self->_layoutAvailabilityObservingConnections, 0);
  objc_storeStrong((id *)&self->_webClipObservingConnections, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_iconStyleAuthenticator, 0);
  objc_storeStrong((id *)&self->_iconTintColorAuthenticator, 0);
  objc_storeStrong((id *)&self->_silhouetteAuthenticator, 0);
  objc_storeStrong((id *)&self->_overflowSlotsAuthenticator, 0);
  objc_storeStrong((id *)&self->_iconBadgeValueAuthenticator, 0);
  objc_storeStrong((id *)&self->_homeScreenLayoutAuthenticator, 0);
  objc_storeStrong((id *)&self->_homeScreenLayoutAvailabilityAuthenticator, 0);
  objc_storeStrong((id *)&self->_addSuggestedPageAuthenticator, 0);
  objc_storeStrong((id *)&self->_addEmptyPageAuthenticator, 0);
  objc_storeStrong((id *)&self->_activeWidgetInfoAuthenticator, 0);
  objc_storeStrong((id *)&self->_observeInstalledWebClipsAuthenticator, 0);
  objc_storeStrong((id *)&self->_addDebugIconAuthenticator, 0);
  objc_storeStrong((id *)&self->_openPodAuthenticator, 0);
  objc_storeStrong((id *)&self->_configurationAuthenticator, 0);
  objc_storeStrong((id *)&self->_displayedDateAuthenticator, 0);
  objc_storeStrong((id *)&self->_appLibraryRequestUpdateAuthenticator, 0);
  objc_storeStrong((id *)&self->_homeScreenBundleIdentifiersAuthenticator, 0);
  objc_storeStrong((id *)&self->_showsHomeScreenSearchAffordanceAuthenticator, 0);
  objc_storeStrong((id *)&self->_showsBadgesInAppLibraryAuthenticator, 0);
  objc_storeStrong((id *)&self->_addsNewIconsToHomeScreenAuthenticator, 0);
  objc_storeStrong((id *)&self->_largeIconLayoutAuthenticator, 0);
  objc_storeStrong((id *)&self->_addWidgetToTodayViewAuthenticator, 0);
  objc_storeStrong((id *)&self->_addApplicationIconAuthenticator, 0);
  objc_storeStrong((id *)&self->_iconFolderPathLookupAuthenticator, 0);
  objc_storeStrong((id *)&self->_requestSuggestedAppAuthenticator, 0);
  objc_storeStrong((id *)&self->_resetHomeScreenLayoutAuthenticator, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
}

- (void)resetHomeScreenLayoutWithCompletion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)unforbidApplicationBundleIdentifierFromLibrary:(void *)a1 withCompletion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)forbidApplicationBundleIdentifierFromLibrary:(void *)a1 withCompletion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)resetCategoriesLayoutWithCompletion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)runFloatingDockStressTestWithCompletion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)requestSuggestedApplicationWithBundleIdentifier:(void *)a1 assertionPort:completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)folderPathToIconWithBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)addApplicationIconToHomeScreenWithBundleIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SBHomeScreenService addApplicationIconToHomeScreenWithBundleIdentifier:]";
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "%s 'applicationBundleIdentifier' is empty", (uint8_t *)&v1, 0xCu);
}

- (void)addApplicationIconToHomeScreenWithBundleIdentifier:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)largeIconLayoutEnabledValue
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)setLargeIconLayoutEnabledValue:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)addsNewIconsToHomeScreenValue
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)setAddsNewIconsToHomeScreenValue:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)setIconListsHidden:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)showsBadgesInAppLibraryValue
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)setShowsBadgesInAppLibraryValue:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)showsHomeScreenSearchAffordanceValue
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)setShowsHomeScreenSearchAffordanceValue:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)allHomeScreenApplicationBundleIdentifiers
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)allHomeScreenApplicationPlaceholderBundleIdentifiers
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)allIconLists
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)hasWidgetWithBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)debugContinuityWithBadgeType:(void *)a1 deviceTypeIdentifier:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)_requestAppLibraryUpdate:(void *)a1 categoryMapProvider:reason:optionalCompletionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)configureLibraryWithCategoryLimit:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)configureCategoryMapProviderToUseCategoryMapAtURL:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)organizeAllIconsIntoFoldersWithPageCount:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)organizeAllIconsAcrossPagesWithPageCount:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)randomizeAllIconsAcrossPagesWithPageCount:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)changeDisplayedDateOverride:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)changeDisplayedDateOffsetOverride:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)overrideBadgeValue:(void *)a1 forBundleIdentifier:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)presentAppLibraryCategoryPodForCategoryIdentifier:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)presentAppLibraryAnimated:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)dismissAppLibraryWithCompletion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)addDebugIconWithSizeClassDescription:(void *)a1 inPage:atPositionDescription:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)debuggingActiveWidgetInfo
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)insertEmptyPageAtIndex:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)addSuggestedPageWithPageType:(void *)a1 focusModeIdentifier:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)setObservingHomeScreenLayoutAvailability:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)homeScreenLayoutAvailability
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)setObservingHomeScreenLayout:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)badgeValueForIconWithApplicationBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)badgeValueForIconWithApplicationBundleIdentifier:(void *)a1 completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)homeScreenIconStyleConfiguration
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)setHomeScreenIconStyleConfiguration:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)setObservingIconTintColor:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)overflowSlotCounts
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)silhouetteLayoutForPageAtIndex:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
