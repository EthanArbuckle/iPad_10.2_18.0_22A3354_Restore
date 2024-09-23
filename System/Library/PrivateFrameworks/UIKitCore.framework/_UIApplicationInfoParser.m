@implementation _UIApplicationInfoParser

- (BOOL)supportsAlwaysOnDisplay
{
  return self->_supportsAlwaysOnDisplay;
}

- (BOOL)supportsBacklightEnvironment
{
  return self->_supportsBacklightEnvironment;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (BOOL)supportsPrintCommand
{
  return self->_supportsPrintCommand;
}

+ (id)mainBundleInfoParser
{
  if (qword_1ECD7DCB8 != -1)
    dispatch_once(&qword_1ECD7DCB8, &__block_literal_global_230);
  return (id)_MergedGlobals_1053;
}

- (BOOL)requiresGameControllerBasedFocus
{
  return self->_requiresGameControllerBasedFocus;
}

- (BOOL)focusSystemEnabled
{
  return self->_focusSystemEnabled;
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (unint64_t)viewControllerBasedStatusBarAppearance
{
  return self->_viewControllerBasedStatusBarAppearance;
}

- (BOOL)systemWindowsSecure
{
  return self->_systemWindowsSecure;
}

- (BOOL)statusBarHidden
{
  return self->_statusBarHidden;
}

- (BOOL)statusBarHiddenWhenVerticallyCompact
{
  return self->_statusBarHiddenWhenVerticallyCompact;
}

- (int64_t)requestedStatusBarStyle
{
  return self->_requestedStatusBarStyle;
}

- (BOOL)optOutOfRTL
{
  return self->_optOutOfRTL;
}

- (BOOL)isExitsOnSuspend
{
  return self->_isExitsOnSuspend;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (NSString)keyColorAssetName
{
  return self->_keyColorAssetName;
}

- (BOOL)fakingRequiresHighResolution
{
  return self->_fakingRequiresHighResolution;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (id)_initWithBundle:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIApplicationInfoParser _initWithApplicationPlistData:](self, "_initWithApplicationPlistData:", v4);

  return v5;
}

- (void)_computeSupportedInterfaceOrientationsWithInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  const __CFString *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bs_safeArrayForKey:", CFSTR("UISupportedInterfaceOrientations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_objectsOfClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (_UIDeviceNativeUserInterfaceIdiomIgnoringClassic())
    v7 = 1;
  else
    v7 = !+[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton");
  if (objc_msgSend(v6, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v6;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v6);
          v10 |= 1 << +[UIApplication interfaceOrientationForString:](UIApplication, "interfaceOrientationForString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v9);

      if (v10 == 4)
        v13 = v7;
      else
        v13 = 0;
      if (v13 == 1)
      {
        v24 = CFSTR("UIInterfaceOrientationPortrait");
        v14 = 1;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = 2;
        v6 = (id)v15;
LABEL_31:
        objc_msgSend(v6, "objectAtIndex:", 0, (_QWORD)v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = +[UIApplication interfaceOrientationForString:](UIApplication, "interfaceOrientationForString:", v19);

        goto LABEL_32;
      }
      if ((v10 & 2) != 0)
      {
        v14 = 1;
        goto LABEL_31;
      }
      if ((v10 & 0x10) != 0)
      {
        v14 = 4;
        goto LABEL_31;
      }
      if ((v10 & 8) != 0)
      {
        v14 = 3;
        goto LABEL_31;
      }
    }
    else
    {

      v10 = 0;
    }
    if ((v10 & 4) != 0)
      v14 = 2;
    else
      v14 = 1;
    goto LABEL_31;
  }
  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("UIInterfaceOrientation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[UIApplication interfaceOrientationForString:](UIApplication, "interfaceOrientationForString:", v16);
  if ((v7 & (v17 == 2)) != 0)
    v18 = 1;
  else
    v18 = v17;

  v10 = 0;
  v14 = v18;
LABEL_32:
  self->_launchingInterfaceOrientationForSpringBoard = v18;
  self->_supportedInterfaceOrientations = v10;
  self->_interfaceOrientation = v14;

}

- (id)_initWithApplicationPlistData:(id)a3
{
  id v4;
  _UIApplicationInfoParser *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *launchImageFile;
  uint64_t v30;
  NSString *keyColorAssetName;
  void *v32;
  uint64_t v33;
  NSArray *canvasDefinitions;
  void *v35;
  uint64_t v36;
  NSDictionary *sceneConfigurations;
  char v38;
  uint64_t v39;
  NSString *preferredDefaultSceneSessionRole;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSArray *deviceFamilies;
  void *v47;
  char v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSString *v55;
  NSString *v56;
  Class v57;
  Class v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  int v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t j;
  void *v76;
  unint64_t v77;
  NSObject *v78;
  uint64_t v79;
  NSDictionary *utTypeToDocumentClassMap;
  uint64_t v81;
  NSArray *viewerRoleDocumentUTTypes;
  uint64_t v83;
  NSArray *editorRoleDocumentUTTypes;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  _UIApplicationInfoParser *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  id obj;
  void *v99;
  void *v100;
  void *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  objc_super v114;
  _BYTE v115[128];
  uint8_t v116[128];
  uint8_t buf[4];
  NSString *v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v114.receiver = self;
  v114.super_class = (Class)_UIApplicationInfoParser;
  v5 = -[_UIApplicationInfoParser init](&v114, sel_init);
  if (!v5)
    goto LABEL_68;
  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("UIStatusBarStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UIApplication statusBarStyleForString:](UIApplication, "statusBarStyleForString:", v6);

  if (v7 == -1)
    v8 = 0;
  else
    v8 = v7;
  v5->_requestedStatusBarStyle = v8;
  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("UIBackgroundStyle"));
  v9 = objc_claimAutoreleasedReturnValue();
  v92 = (void *)v9;
  if (v9)
  {
    v10 = +[UIApplication _backgroundStyleForString:](UIApplication, "_backgroundStyleForString:", v9);
  }
  else
  {
    objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("UIApplicationIsOpaque"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v10 = objc_msgSend(v11, "BOOLValue") ^ 1;
    else
      v10 = 0;

  }
  v5->_backgroundStyle = v10;
  v5->_canChangeBackgroundStyle = 0;
  objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("UIStatusBarHidden"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_statusBarHidden = objc_msgSend(v13, "BOOLValue");

  v5->_statusBarHiddenWhenVerticallyCompact = 1;
  objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("UIStatusBarHiddenWhenVerticallyCompact"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && (objc_msgSend(v14, "BOOLValue") & 1) == 0)
    v5->_statusBarHiddenWhenVerticallyCompact = 0;
  v91 = v15;
  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("UIWhitePointAdaptivityStyleKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    || (objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("_UIWhitePointAdaptivityStyle")),
        (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5->_whitePointAdaptivityStyle = _UIWhitePointAdaptivityStyleFromString(v16);

  }
  else
  {
    v5->_whitePointAdaptivityStyle = 0;
  }
  objc_msgSend(v4, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", CFSTR("UIViewControllerBasedStatusBarAppearance"));

  if (v18)
  {
    v19 = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("UIViewControllerBasedStatusBarAppearance"));
    v20 = 1;
    if (!v19)
      v20 = 2;
  }
  else
  {
    v20 = 0;
  }
  v5->_viewControllerBasedStatusBarAppearance = v20;
  objc_msgSend(v4, "objectForKey:", CFSTR("Capabilities"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeArrayForKey:", CFSTR("Capabilities"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0D27CA0];
  if (objc_msgSend(v21, "containsObject:", *MEMORY[0x1E0D27CA0]))
  {

LABEL_25:
    v5->_requiresHighResolution = 1;
    goto LABEL_26;
  }
  objc_msgSend(v4, "bs_safeDictionaryForKey:", CFSTR("Capabilities"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  if (v25)
    goto LABEL_25;
LABEL_26:
  v5->_fakingRequiresHighResolution = 0;
  objc_msgSend(v4, "bs_safeArrayForKey:", CFSTR("UIStatusBarStyleIgnoredOverrides"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_ignoredOverrides = +[UIApplication _statusBarStyleOverridesForArray:](UIApplication, "_statusBarStyleOverridesForArray:", v26);

  v5->_systemWindowsSecure = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("UIApplicationSystemWindowsSecureKey"));
  v5->_optOutOfRTL = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("UIOptOutOfRTL"));
  v5->_disableLayoutAwareShortcuts = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("NSDisableKeyboardLayoutAdjustedShortcuts"));
  objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("UIApplicationExitsOnSuspend"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_isExitsOnSuspend = objc_msgSend(v27, "BOOLValue");

  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("UILaunchImageFile"));
  v28 = objc_claimAutoreleasedReturnValue();
  launchImageFile = v5->_launchImageFile;
  v5->_launchImageFile = (NSString *)v28;

  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("NSAccentColorName"));
  v30 = objc_claimAutoreleasedReturnValue();
  keyColorAssetName = v5->_keyColorAssetName;
  v5->_keyColorAssetName = (NSString *)v30;

  v5->_supportedOnLockScreen = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("UIApplicationShowsViewsWhileLocked"));
  objc_msgSend(v4, "bs_safeDictionaryForKey:", CFSTR("UIApplicationInterfaceManifest"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_supportsMultiwindow = objc_msgSend(v32, "bs_BOOLForKey:", CFSTR("UIApplicationSupportsMultiwindow"));
  v89 = v32;
  objc_msgSend(v32, "bs_safeArrayForKey:", CFSTR("UICanvasDefinitions"));
  v33 = objc_claimAutoreleasedReturnValue();
  canvasDefinitions = v5->_canvasDefinitions;
  v5->_canvasDefinitions = (NSArray *)v33;

  objc_msgSend(v4, "bs_safeDictionaryForKey:", CFSTR("UIApplicationSceneManifest"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bs_safeDictionaryForKey:", CFSTR("UISceneConfigurations"));
  v36 = objc_claimAutoreleasedReturnValue();
  sceneConfigurations = v5->_sceneConfigurations;
  v5->_sceneConfigurations = (NSDictionary *)v36;

  if (v5->_supportsMultiwindow)
    v38 = 1;
  else
    v38 = objc_msgSend(v35, "bs_BOOLForKey:", CFSTR("UIApplicationSupportsMultipleScenes"));
  v5->_supportsMultiwindow = v38;
  objc_msgSend(v35, "bs_safeStringForKey:", CFSTR("UIApplicationPreferredDefaultSceneSessionRole"));
  v39 = objc_claimAutoreleasedReturnValue();
  preferredDefaultSceneSessionRole = v5->_preferredDefaultSceneSessionRole;
  v5->_preferredDefaultSceneSessionRole = (NSString *)v39;

  v88 = v35;
  v5->_supportsSceneItemProviders = objc_msgSend(v35, "bs_BOOLForKey:", CFSTR("UIApplicationSupportsSceneItemProviders"));
  objc_msgSend(v4, "objectForKey:", CFSTR("com.apple.uikit.feature-a"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_hasSupportsIndirectInputEventsKey = v41 != 0;

  objc_msgSend(v4, "objectForKey:", CFSTR("UIApplicationSupportsIndirectInputEvents"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_hasSupportsIndirectInputEventsKey |= v42 != 0;

  v5->_supportsIndirectInputEvents = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("com.apple.uikit.feature-a"));
  v5->_supportsIndirectInputEvents |= objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("UIApplicationSupportsIndirectInputEvents"));
  objc_msgSend(v4, "bs_safeArrayForKey:", CFSTR("UIDeviceFamily"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bs_objectsOfClass:", v44);
  v45 = objc_claimAutoreleasedReturnValue();
  deviceFamilies = v5->_deviceFamilies;
  v5->_deviceFamilies = (NSArray *)v45;

  v5->_supportsPrintCommand = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("UIApplicationSupportsPrintCommand"));
  v5->_supportsAlwaysOnDisplay = objc_msgSend(v4, "bs_BOOLForKey:", 0x1E1760D20);
  v5->_supportsBacklightEnvironment = objc_msgSend(v4, "bs_BOOLForKey:", 0x1E1760D40);
  -[_UIApplicationInfoParser _computeSupportedInterfaceOrientationsWithInfo:](v5, "_computeSupportedInterfaceOrientationsWithInfo:", v4);
  -[_UIApplicationInfoParser _computeSupportedUserInterfaceStyleFromInfo:](v5, "_computeSupportedUserInterfaceStyleFromInfo:", v4);
  v5->_requiresGameControllerBasedFocus = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("_UIRequiresGameControllerBasedFocus"));
  v5->_focusEnabledInLimitedControls = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("_UIFocusLimitedControlsEnabled"));
  v5->_forcesDefaultFocusAppearance = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("_UIFocusDefaultAppearanceEnabled"));
  objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("UIFocusSystemEnabled"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v47;
  if (v47)
    v48 = objc_msgSend(v47, "BOOLValue", v47);
  else
    v48 = 1;
  v5->_focusSystemEnabled = v48;
  v93 = v5;
  v5->_observationTrackingEnabled = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("UIObservationTrackingEnabled"), v86);
  v49 = (void *)objc_opt_new();
  v95 = (void *)objc_opt_new();
  v94 = (void *)objc_opt_new();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  objc_msgSend(v4, "bs_safeArrayForKey:", CFSTR("CFBundleDocumentTypes"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v111;
    v96 = *(_QWORD *)v111;
    do
    {
      v53 = 0;
      v97 = v51;
      do
      {
        if (*(_QWORD *)v111 != v52)
          objc_enumerationMutation(obj);
        v54 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v53);
        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("UIDocumentClass"));
        v55 = (NSString *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
        {
          v57 = NSClassFromString(v55);
          if (v57)
          {
            v58 = v57;
            objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("LSItemContentTypes"));
            v59 = objc_claimAutoreleasedReturnValue();
            v60 = (void *)MEMORY[0x1E0CEC3F8];
            v101 = (void *)v59;
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "_typesWithIdentifiers:", v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            v100 = v62;
            objc_msgSend(v62, "allValues");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
            if (v64)
            {
              v65 = v64;
              v66 = *(_QWORD *)v107;
              do
              {
                for (i = 0; i != v65; ++i)
                {
                  if (*(_QWORD *)v107 != v66)
                    objc_enumerationMutation(v63);
                  objc_msgSend(v49, "setObject:forKey:", v58, *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i));
                }
                v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
              }
              while (v65);
            }

            objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("CFBundleTypeRole"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "isEqualToString:", CFSTR("Viewer"));
            if ((v69 & 1) != 0 || objc_msgSend(v68, "isEqualToString:", CFSTR("Editor")))
            {
              v99 = v68;
              v104 = 0u;
              v105 = 0u;
              v102 = 0u;
              v103 = 0u;
              v70 = v101;
              v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
              if (v71)
              {
                v72 = v71;
                v73 = *(_QWORD *)v103;
                if (v69)
                  v74 = v95;
                else
                  v74 = v94;
                do
                {
                  for (j = 0; j != v72; ++j)
                  {
                    if (*(_QWORD *)v103 != v73)
                      objc_enumerationMutation(v70);
                    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * j));
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v76)
                      objc_msgSend(v74, "addObject:", v76);

                  }
                  v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
                }
                while (v72);
              }

              v68 = v99;
            }

            v52 = v96;
            v51 = v97;
          }
          else
          {
            v77 = _initWithApplicationPlistData____s_category;
            if (!_initWithApplicationPlistData____s_category)
            {
              v77 = __UILogCategoryGetNode("UIDocument", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v77, (unint64_t *)&_initWithApplicationPlistData____s_category);
            }
            v78 = *(NSObject **)(v77 + 8);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v118 = v56;
              _os_log_impl(&dword_185066000, v78, OS_LOG_TYPE_ERROR, "Unable to find class %@ which is specified to handle documents in the application's info.plist", buf, 0xCu);
            }
          }
        }

        ++v53;
      }
      while (v53 != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
    }
    while (v51);
  }

  v79 = objc_msgSend(v49, "copy");
  v5 = v93;
  utTypeToDocumentClassMap = v93->_utTypeToDocumentClassMap;
  v93->_utTypeToDocumentClassMap = (NSDictionary *)v79;

  objc_msgSend(v95, "array");
  v81 = objc_claimAutoreleasedReturnValue();
  viewerRoleDocumentUTTypes = v93->_viewerRoleDocumentUTTypes;
  v93->_viewerRoleDocumentUTTypes = (NSArray *)v81;

  objc_msgSend(v94, "array");
  v83 = objc_claimAutoreleasedReturnValue();
  editorRoleDocumentUTTypes = v93->_editorRoleDocumentUTTypes;
  v93->_editorRoleDocumentUTTypes = (NSArray *)v83;

LABEL_68:
  return v5;
}

- (void)_computeSupportedUserInterfaceStyleFromInfo:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int64_t v6;
  __CFString *v7;

  objc_msgSend(a3, "bs_safeStringForKey:", CFSTR("UIUserInterfaceStyle"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (self->_isYukonLinked)
      v5 = CFSTR("Automatic");
    else
      v5 = CFSTR("Light");
    v4 = v5;
  }
  v7 = v4;
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("Automatic")))
  {
    self->_supportedUserInterfaceStyle = 0;
  }
  else
  {
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("Dark")))
      v6 = 2;
    else
      v6 = 1;
    self->_supportedUserInterfaceStyle = v6;
  }

}

- (BOOL)supportsMultiwindow
{
  return self->_supportsMultiwindow;
}

- (BOOL)supportedOnLockScreen
{
  return self->_supportedOnLockScreen;
}

- (NSDictionary)sceneConfigurations
{
  return self->_sceneConfigurations;
}

- (NSArray)canvasDefinitions
{
  return self->_canvasDefinitions;
}

- (BOOL)supportsIndirectInputEvents
{
  return self->_supportsIndirectInputEvents;
}

- (BOOL)hasSupportsIndirectInputEventsKey
{
  return self->_hasSupportsIndirectInputEventsKey;
}

- (_UIApplicationInfoParser)initWithApplicationProxy:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _UIApplicationInfoParser *v10;

  v4 = a3;
  if (qword_1ECD7DCC8 != -1)
    dispatch_once(&qword_1ECD7DCC8, &__block_literal_global_3_6);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sdkVersion");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    LOBYTE(v6) = objc_msgSend(v5, "isVersion:greaterThanOrEqualToVersion:", v6, CFSTR("13.0"));
  self->_isYukonLinked = v6;
  objc_msgSend(v4, "objectsForInfoDictionaryKeys:", qword_1ECD7DCC0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rawValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIApplicationInfoParser _initWithApplicationPlistData:](self, "_initWithApplicationPlistData:", v9);

  return v10;
}

- (BOOL)_isLinkedOnOrAfterYukon
{
  return self->_isYukonLinked;
}

- (int64_t)launchingInterfaceOrientationForSpringBoard
{
  return self->_launchingInterfaceOrientationForSpringBoard;
}

- (unint64_t)ignoredOverrides
{
  return self->_ignoredOverrides;
}

- (NSString)launchImageFile
{
  return self->_launchImageFile;
}

- (BOOL)canChangeBackgroundStyle
{
  return self->_canChangeBackgroundStyle;
}

- (BOOL)disableLayoutAwareShortcuts
{
  return self->_disableLayoutAwareShortcuts;
}

- (BOOL)requiresHighResolution
{
  return self->_requiresHighResolution;
}

- (BOOL)supportsSceneItemProviders
{
  return self->_supportsSceneItemProviders;
}

- (NSString)preferredDefaultSceneSessionRole
{
  return self->_preferredDefaultSceneSessionRole;
}

- (int64_t)supportedUserInterfaceStyle
{
  return self->_supportedUserInterfaceStyle;
}

- (NSArray)deviceFamilies
{
  return self->_deviceFamilies;
}

- (BOOL)focusEnabledInLimitedControls
{
  return self->_focusEnabledInLimitedControls;
}

- (BOOL)forcesDefaultFocusAppearance
{
  return self->_forcesDefaultFocusAppearance;
}

- (BOOL)observationTrackingEnabled
{
  return self->_observationTrackingEnabled;
}

- (NSDictionary)utTypeToDocumentClassMap
{
  return self->_utTypeToDocumentClassMap;
}

- (NSArray)viewerRoleDocumentUTTypes
{
  return self->_viewerRoleDocumentUTTypes;
}

- (NSArray)editorRoleDocumentUTTypes
{
  return self->_editorRoleDocumentUTTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorRoleDocumentUTTypes, 0);
  objc_storeStrong((id *)&self->_viewerRoleDocumentUTTypes, 0);
  objc_storeStrong((id *)&self->_utTypeToDocumentClassMap, 0);
  objc_storeStrong((id *)&self->_deviceFamilies, 0);
  objc_storeStrong((id *)&self->_sceneConfigurations, 0);
  objc_storeStrong((id *)&self->_preferredDefaultSceneSessionRole, 0);
  objc_storeStrong((id *)&self->_canvasDefinitions, 0);
  objc_storeStrong((id *)&self->_keyColorAssetName, 0);
  objc_storeStrong((id *)&self->_launchImageFile, 0);
}

@end
