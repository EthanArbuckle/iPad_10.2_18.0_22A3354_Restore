@implementation WBSWebExtensionsController

- (WBSWebExtensionNewTabOverridePreferencesManager)tabOverridePreferencesManager
{
  return self->_tabOverridePreferencesManager;
}

- (BOOL)extensionIsEnabled:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canLoad");

  if ((v6 & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)WBSWebExtensionsController;
    v7 = -[WBSExtensionsController extensionIsEnabled:](&v9, sel_extensionIsEnabled_, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)webExtensionForComposedIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[WBSExtensionsController extensionWithComposedIdentifier:](self, "extensionWithComposedIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)webExtensionForExtension:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[WBSExtensionsController extensionDataForExtension:](self, "extensionDataForExtension:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (id)composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions
{
  return (id)-[NSMutableSet allObjects](self->_migratedWebNavigationExtensionIdentifiers, "allObjects");
}

- (WBSWebExtensionsController)initWithProfileServerID:(id)a3 userContentController:(id)a4
{
  id v6;
  id v7;
  WBSWebExtensionsController *v8;
  WBSWebExtensionNewTabOverridePreferencesManager *v9;
  WBSWebExtensionNewTabOverridePreferencesManager *tabOverridePreferencesManager;
  uint64_t v11;
  NSMutableDictionary *extensionIdentifierToData;
  void *v13;
  void *v14;
  WBSWebExtensionsController *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSWebExtensionsController;
  v8 = -[WBSExtensionsController initWithProfileServerID:userContentController:](&v17, sel_initWithProfileServerID_userContentController_, v6, v7);
  if (v8)
  {
    if (-[WBSWebExtensionsController initWithProfileServerID:userContentController:]::once != -1)
      dispatch_once(&-[WBSWebExtensionsController initWithProfileServerID:userContentController:]::once, &__block_literal_global_67);
    v9 = -[WBSWebExtensionNewTabOverridePreferencesManager initWithExtensionsController:]([WBSWebExtensionNewTabOverridePreferencesManager alloc], "initWithExtensionsController:", v8);
    tabOverridePreferencesManager = v8->_tabOverridePreferencesManager;
    v8->_tabOverridePreferencesManager = v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    extensionIdentifierToData = v8->_extensionIdentifierToData;
    v8->_extensionIdentifierToData = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__webExtensionDataPermissionsWereGranted_, CFSTR("webExtensionPermissionsWereGranted"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__webExtensionDataPermissionsWereRevokedOrRemoved_, CFSTR("webExtensionPermissionsWereRevoked"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__webExtensionDataPermissionsWereRevokedOrRemoved_, CFSTR("webExtensionGrantedPermissionsWereRemoved"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__webExtensionDataPermissionsWereRevokedOrRemoved_, CFSTR("webExtensionRevokedPermissionsWereRemoved"), 0);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel__webExtensionEnabledStateInPrivateBrowsingChanged_, *MEMORY[0x1E0D8A6E0], 0);
    v15 = v8;

  }
  return v8;
}

- (void)didActivateWindow:(id)a3
{
  -[_WKWebExtensionController didFocusWindow:](self->_webKitController, "didFocusWindow:", a3);
}

- (void)didOpenWindow:(id)a3
{
  -[_WKWebExtensionController didOpenWindow:](self->_webKitController, "didOpenWindow:", a3);
}

+ (id)_composedIdentifierForStateOfExtensionWithBundleIdentifier:(id)a3 developerIdentifier:(id)a4
{
  const __CFString *v4;

  v4 = CFSTR("UNSIGNED");
  if (a4)
    v4 = (const __CFString *)a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_finishedLoadingExtensions
{
  void *v3;
  objc_super v4;

  if (-[WBSExtensionsController loadEnabledExtensionsWasCalled](self, "loadEnabledExtensionsWasCalled"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("DidGrantSearchProviderAccessToWebNavigationExtensions")) & 1) == 0)
      objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("DidGrantSearchProviderAccessToWebNavigationExtensions"));
    v4.receiver = self;
    v4.super_class = (Class)WBSWebExtensionsController;
    -[WBSExtensionsController _finishedLoadingExtensions](&v4, sel__finishedLoadingExtensions);

  }
}

- (void)loadSuitableDiscoveredExtensions
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WBSWebExtensionsController;
  -[WBSExtensionsController loadSuitableDiscoveredExtensions](&v2, sel_loadSuitableDiscoveredExtensions);
}

+ (id)_extensionPointIdentifier
{
  return CFSTR("com.apple.Safari.web-extension");
}

- (id)_urlForExtensionSettings
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  NSURL *settingsFileURL;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSURL *v14;
  NSURL *v15;
  NSURL *v16;
  NSURL *v17;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController profileServerID](self, "profileServerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v4);

  if (v5
    || (-[WBSExtensionsController profileServerID](self, "profileServerID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "safari_profileDirectoryURLWithID:createIfNeeded:", v6, 0),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    settingsFileURL = self->_settingsFileURL;
    if (!settingsFileURL)
    {
      objc_msgSend(v3, "safari_webExtensionsSettingsDirectoryURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        -[WBSExtensionsController profileServerID](self, "profileServerID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "safari_profileDirectoryURLWithID:createIfNeeded:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("WebExtensions"), 1);
        v12 = objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v9 = (void *)v12;
          v13 = (id)objc_msgSend(v3, "safari_ensureDirectoryExists:", v12);
        }
        else
        {
          v9 = 0;
        }
      }
      objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("Extensions.plist"), 0);
      v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v17 = self->_settingsFileURL;
      self->_settingsFileURL = v16;

      settingsFileURL = self->_settingsFileURL;
    }
    v15 = settingsFileURL;
  }
  else
  {
    v14 = self->_settingsFileURL;
    self->_settingsFileURL = 0;

    v15 = 0;
  }

  return v15;
}

- (void)fireOnUpdatedEventForTab:(id)a3 withChangedProperties:(unint64_t)a4
{
  -[_WKWebExtensionController didChangeTabProperties:forTab:](self->_webKitController, "didChangeTabProperties:forTab:", (4 * (int)a4) & 0x10 | ((a4 & 3) << 7) | (a4 >> 1) & 0xC, a3);
}

uint64_t __76__WBSWebExtensionsController_initWithProfileServerID_userContentController___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CEF730], "registerCustomURLScheme:", *MEMORY[0x1E0D8A6E8]);
}

- (void)initializeWebKitControllerIfNeededFromSettings:(BOOL)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _WKWebExtensionController *v11;
  _WKWebExtensionController *webKitController;
  void *v13;
  id v14;

  if (!self->_webKitController)
  {
    objc_msgSend(MEMORY[0x1E0CEF728], "defaultConfiguration");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[WBSExtensionsController profileServerID](self, "profileServerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CEF728], "configurationWithIdentifier:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v8;
    }

    if (a3)
    {
      -[WBSWebExtensionsController _urlForWebKitExtensionsDirectory](self, "_urlForWebKitExtensionsDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setStorageDirectoryPath:", v10);

    }
    else
    {
      -[WBSWebExtensionsController _webViewConfiguration](self, "_webViewConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWebViewConfiguration:", v9);
    }

    v11 = (_WKWebExtensionController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF720]), "initWithConfiguration:", v14);
    webKitController = self->_webKitController;
    self->_webKitController = v11;

    -[_WKWebExtensionController setDelegate:](self->_webKitController, "setDelegate:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "_extensionDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WKWebExtensionController _setTestingMode:](self->_webKitController, "_setTestingMode:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E0D8A2C0]));

    }
  }
}

+ (id)extensionURLScheme
{
  return (id)*MEMORY[0x1E0D8A6E8];
}

- (id)extensionStateKeysToCopy
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)WBSWebExtensionsController;
  -[WBSExtensionsController extensionStateKeysToCopy](&v6, sel_extensionStateKeysToCopy);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("AccessibleOrigins");
  v7[1] = CFSTR("GrantedPermissions");
  v7[2] = CFSTR("Permissions");
  v7[3] = CFSTR("RevokedPermissions");
  v7[4] = CFSTR("GrantedPermissionOrigins");
  v7[5] = CFSTR("LastSeenVersion");
  v7[6] = CFSTR("RequestedOptionalAccessToAllHosts");
  v7[7] = CFSTR("RevokedPermissionOrigins");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_urlForWebKitExtensionsDirectory
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  -[WBSExtensionsController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDefault");

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("Default");
  }
  else
  {
    -[WBSExtensionsController profileServerID](self, "profileServerID");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_settingsDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  v14[0] = CFSTR("WebKit");
  v14[1] = CFSTR("WebExtensions");
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathWithComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_displayNameForExtension:(id)a3
{
  void *v3;
  void *v4;

  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_displayShortNameForExtension:(id)a3
{
  void *v3;
  void *v4;

  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayShortName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_displayVersionForExtension:(id)a3
{
  void *v3;
  void *v4;

  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_versionNumberForExtension:(id)a3
{
  void *v3;
  void *v4;

  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_loadEnabledExtension:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionsController _loadPermissionsFromStorageForWebExtension:completionHandler:](self, "_loadPermissionsFromStorageForWebExtension:completionHandler:", v5, &__block_literal_global_94_1);
  objc_msgSend(v5, "load");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WBSWebExtensionsController__loadEnabledExtension___block_invoke_2;
  v7[3] = &unk_1E54413C0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __52__WBSWebExtensionsController__loadEnabledExtension___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "composedIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_postExtensionWasEnabledRemotelyNotificationIfNecessary:");

}

- (void)_updateExtensionNewTabPageIfNecessary
{
  id v2;

  +[WBSCloudExtensionStateManager sharedManager](WBSCloudExtensionStateManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateNewTabPageFromCloudDeviceState");

}

- (void)_unloadPreviouslyEnabledExtension:(id)a3
{
  id v3;

  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unload");

}

- (id)enabledExtensionsWithPrivateBrowsingEnabled:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  -[WBSExtensionsController enabledExtensions](self, "enabledExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__WBSWebExtensionsController_enabledExtensionsWithPrivateBrowsingEnabled___block_invoke;
  v8[3] = &unk_1E5448B30;
  v8[4] = self;
  v9 = a3;
  objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __74__WBSWebExtensionsController_enabledExtensionsWithPrivateBrowsingEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(*(id *)(a1 + 32), "webExtensionForExtension:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "allowedInPrivateBrowsing") & 1) != 0 || !*(_BYTE *)(a1 + 40);

  return v4;
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 dueToUserGesture:(BOOL)a5 skipSavingToStorage:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  objc_super v12;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  if (v8)
  {
    -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "canLoad") & 1) == 0)
      goto LABEL_6;
  }
  else
  {
    v11 = 0;
    -[WBSWebExtensionsController clearPermissionStateUsedToDetermineIfExtensionShouldBeDisabledOnUpgradeForExtension:](self, "clearPermissionStateUsedToDetermineIfExtensionShouldBeDisabledOnUpgradeForExtension:", v10);
  }
  v12.receiver = self;
  v12.super_class = (Class)WBSWebExtensionsController;
  -[WBSExtensionsController setExtension:isEnabled:dueToUserGesture:skipSavingToStorage:](&v12, sel_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage_, v10, v8, v7, v6);
LABEL_6:

}

- (void)removeOldExtensionStateForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v6, "count"))
  {
    v19[0] = CFSTR("LastSeenBaseURI");
    v19[1] = CFSTR("LastSeenVersion");
    v19[2] = CFSTR("BackgroundPageListeners");
    v19[3] = CFSTR("BackgroundPageListenersVersion");
    v19[4] = CFSTR("DeclarativeNetRequestRulesetState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    v9 = v7;
    if (v8)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 == 0;

          if (!v13)
          {

            objc_msgSend(v6, "removeObjectsForKeys:", v7);
            -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v4);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSExtensionsController _setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:](self, "_setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:", v6, v9);
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
      v9 = v7;
    }
LABEL_12:

  }
}

- (BOOL)_extensionShouldBeEnabled:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canLoad");

  if ((v6 & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)WBSWebExtensionsController;
    v7 = -[WBSExtensionsController _extensionShouldBeEnabled:](&v9, sel__extensionShouldBeEnabled_, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_extensionShouldBeAutomaticallyEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSCloudExtensionStateManager sharedManager](WBSCloudExtensionStateManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController profileServerID](self, "profileServerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isExtensionEnabledInCloudWithComposedIdentifier:forProfileServerID:", v5, v7);

  if ((v8 & 1) != 0)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 141558275;
      v17 = 1752392040;
      v18 = 2117;
      v19 = v5;
      _os_log_impl(&dword_1A840B000, v9, OS_LOG_TYPE_INFO, "Automatically enabling extension %{sensitive, mask.hash}@ on download since it's on in the cloud", buf, 0x16u);
    }
    v10 = *MEMORY[0x1E0D8A5C0];
    v15[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D68], "now", v10, *MEMORY[0x1E0D8A5E0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = *MEMORY[0x1E0D8A5B8];
    v15[1] = v11;
    v15[2] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSExtensionsController _setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:](self, "_setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:", v12, v5);
  }

  return v8;
}

- (id)_updatedExtensionStateForCurrentPermissions:(id)a3 previousExtensionState:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRequestedOptionalAccessToAllHosts:", objc_msgSend(v6, "safari_BOOLForKey:", CFSTR("RequestedOptionalAccessToAllHosts")));
  objc_msgSend(v7, "extensionStateWithPreviousState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_updateExtensionStateIfThisVersionOfSafariIsNotSupported:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._extensionIdentifierToStateMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if ((objc_msgSend(v6, "safari_BOOLForKey:", *MEMORY[0x1E0D8A5C0]) & 1) != 0)
  {
    -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v7, "extensionSupportsCurrentSafariVersion"))
    {
      case 0:
        break;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
        v9 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSWebExtensionsController _displayNameForExtension:](self, "_displayNameForExtension:", v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", v10, v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_5;
      default:
        v8 = 0;
LABEL_5:
        -[WBSExtensionsController setExtension:isEnabled:](self, "setExtension:isEnabled:", v14, 0);
        objc_msgSend(v14, "sf_uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSWebExtensionsController _showPromptForExtensionDisabledBecauseItDoesNotSupportThisVersionOfSafariWithMessage:extensionIdentifier:](self, "_showPromptForExtensionDisabledBecauseItDoesNotSupportThisVersionOfSafariWithMessage:extensionIdentifier:", v8, v13);

        break;
    }

  }
}

- (id)webExtensionForExtensionIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[WBSExtensionsController extensionWithUUID:](self, "extensionWithUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)webExtensionForBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[WBSExtensionsController extensionWithBundleIdentifier:](self, "extensionWithBundleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)webExtensionForBaseURIHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._baseURIHostToExtensionIdentifier, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionsController webExtensionForExtensionIdentifier:](self, "webExtensionForExtensionIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)webExtensionForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WBSWebExtensionsController canonicalURLForWebExtensionURL:](self, "canonicalURLForWebExtensionURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionsController webExtensionForBaseURIHost:](self, "webExtensionForBaseURIHost:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)canonicalURLForWebExtensionURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if ((objc_msgSend(v4, "safari_isSafariWebExtensionURL") & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

    if (v7)
    {
      objc_msgSend(v4, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSWebExtensionsController webExtensionForBaseURIHost:](self, "webExtensionForBaseURIHost:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = v4;
      else
        v10 = 0;
      v11 = v10;

    }
    else
    {
      -[WBSWebExtensionsController _extensionURLToLoadFromPersistentStateURL:](self, "_extensionURLToLoadFromPersistentStateURL:", v4);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)installationDateForExtension:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D8A360]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)test_isRunningExtensionTestMode
{
  return 0;
}

- (void)sendMessage:(id)a3 toApplicationWithID:(id)a4 fromExtensionWithIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *nativeRequestIdentifiersToCompletionHandlers;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id location;
  _QWORD v49[4];
  id v50;
  id v51;
  const __CFString *v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v9 = a5;
  v10 = a6;
  v31 = v9;
  -[WBSWebExtensionsController webExtensionForExtensionIdentifier:](self, "webExtensionForExtensionIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "composedIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    {
      v13 = (void *)-[WBSWebExtensionsController sendMessage:toApplicationWithID:fromExtensionWithIdentifier:completionHandler:]::nativeMessagingActiveContextTracker;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSWebExtensionsController sendMessage:toApplicationWithID:fromExtensionWithIdentifier:completionHandler:]::nativeMessagingActiveContextTracker = (uint64_t)v13;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v49[0] = v15;
      v49[1] = 3221225472;
      v49[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke;
      v49[3] = &unk_1E5448B58;
      v50 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v50;
      objc_msgSend(v14, "safari_removeObjectsPassingTest:", v49);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)-[WBSWebExtensionsController sendMessage:toApplicationWithID:fromExtensionWithIdentifier:completionHandler:]::nativeMessagingActiveContextTracker, "setObject:forKeyedSubscript:");
    }
    if ((unint64_t)objc_msgSend(v14, "count") < 0x97)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v19);

      objc_msgSend(v12, "extension");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_nativeRequestIdentifiersToCompletionHandlers)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        nativeRequestIdentifiersToCompletionHandlers = self->_nativeRequestIdentifiersToCompletionHandlers;
        self->_nativeRequestIdentifiersToCompletionHandlers = v20;

      }
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v18);
      v46[0] = v15;
      v46[1] = 3221225472;
      v46[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_114;
      v46[3] = &unk_1E5448B80;
      objc_copyWeak(&v47, (id *)buf);
      v44[0] = v15;
      v44[1] = 3221225472;
      v44[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_2;
      v44[3] = &unk_1E5448BA8;
      v22 = (id)MEMORY[0x1A85D45E4](v46);
      v45 = v22;
      objc_msgSend(v18, "setRequestCancellationBlock:", v44, v22);
      v41[0] = v15;
      v41[1] = 3221225472;
      v41[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_4;
      v41[3] = &unk_1E5448BD0;
      v23 = v22;
      v42 = v23;
      objc_copyWeak(&v43, &location);
      objc_msgSend(v18, "setRequestInterruptionBlock:", v41);
      v39[0] = v15;
      v39[1] = 3221225472;
      v39[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_6;
      v39[3] = &unk_1E5448BF8;
      v24 = v23;
      v40 = v24;
      objc_msgSend(v18, "setRequestCompletionBlock:", v39);
      v25 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
      objc_msgSend(v12, "privacyPreservingProfileIdentifier");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v26)
      {
        v54[0] = CFSTR("message");
        v54[1] = CFSTR("profile");
        v55[0] = v33;
        v55[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
      }
      else
      {
        v52 = CFSTR("message");
        v53 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setUserInfo:", v28);

      v51 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v15;
      v34[1] = 3221225472;
      v34[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_8;
      v34[3] = &unk_1E5448C48;
      objc_copyWeak(&v37, (id *)buf);
      objc_copyWeak(&v38, &location);
      v35 = v10;
      v30 = v24;
      v36 = v30;
      objc_msgSend(v18, "beginExtensionRequestWithInputItems:completion:", v29, v34);

      objc_destroyWeak(&v38);
      objc_destroyWeak(&v37);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v17 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v57 = v32;
        _os_log_impl(&dword_1A840B000, v17, OS_LOG_TYPE_INFO, "Dropping native message from %{private}@ due to too many active native messages", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFErrorDomain"), 3, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v18);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

uint64_t __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_isEarlierThanDate:", *(_QWORD *)(a1 + 32));
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_114(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *WeakRetained;
  id *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[26], "objectForKeyedSubscript:", v12);
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v10[26], "setObject:forKeyedSubscript:", 0, v12);
      ((void (**)(_QWORD, id, id))v11)[2](v11, v7, v8);
    }

  }
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_1E5441B50;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_5;
  v10 = &unk_1E5442F00;
  v12 = *(id *)(a1 + 32);
  v4 = v3;
  v11 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], &v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "cancelExtensionRequestWithIdentifier:", v4, v7, v8, v9, v10);

}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFErrorDomain"), 3, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_7;
  block[3] = &unk_1E5441B50;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v2 + 16))(v2, v1, v4, 0);

}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_8(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_9;
  v10[3] = &unk_1E5448C20;
  objc_copyWeak(&v15, a1 + 6);
  objc_copyWeak(&v16, a1 + 7);
  v11 = v5;
  v7 = a1[4];
  v12 = v6;
  v13 = v7;
  v14 = a1[5];
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
}

void __108__WBSWebExtensionsController_sendMessage_toApplicationWithID_fromExtensionWithIdentifier_completionHandler___block_invoke_9(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(a1 + 72));
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 48);
      if (*(_QWORD *)(a1 + 32))
      {
        v5 = (void *)MEMORY[0x1A85D45E4](v4);
        objc_msgSend(v6[26], "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

        if (*(_QWORD *)(a1 + 40))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          objc_msgSend(v3, "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(a1 + 32));
        }
      }
      else
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, *(_QWORD *)(a1 + 40));
      }
    }

    WeakRetained = v6;
  }

}

- (id)lastSeenUniqueIdentiferForWebExtension:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_stringForKey:", CFSTR("LastSeenUniqueIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)saveUniqueIdentifierToStorageForWebExtension:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v6)
  {
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("LastSeenUniqueIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sf_uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqual:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v16, "extension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sf_uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("LastSeenUniqueIdentifier"));

      objc_msgSend(v16, "extension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSExtensionsController _setExtensionState:forExtension:](self, "_setExtensionState:forExtension:", v6, v15);

    }
  }

}

- (void)savePermissionStateUsedToDetermineIfExtensionShouldBeDisabledOnUpgradeForWebExtension:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  _QWORD *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v6)
  {
    v7 = *MEMORY[0x1E0D8A5C8];
    v8 = objc_msgSend(v6, "safari_BOOLForKey:", *MEMORY[0x1E0D8A5C8]);
    v9 = objc_msgSend(v15, "hasAbilityToInjectContentIntoWebpages");
    v10 = (_QWORD *)MEMORY[0x1E0D8A600];
    if (v8 != v9
      || (v11 = objc_msgSend(v6, "safari_BOOLForKey:", *MEMORY[0x1E0D8A600]),
          v11 != objc_msgSend(v15, "hasDeclarativeNetRequestHostAccessPermission")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v15, "hasAbilityToInjectContentIntoWebpages"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v7);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v15, "hasDeclarativeNetRequestHostAccessPermission"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *v10);

      objc_msgSend(v15, "extension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSExtensionsController _setExtensionState:forExtension:](self, "_setExtensionState:forExtension:", v6, v14);

    }
  }

}

- (void)clearPermissionStateUsedToDetermineIfExtensionShouldBeDisabledOnUpgradeForExtension:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v5)
  {
    objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x1E0D8A5C8]);
    objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x1E0D8A600]);
    -[WBSExtensionsController _setExtensionState:forExtension:](self, "_setExtensionState:forExtension:", v5, v6);
  }

}

- (unint64_t)toolbarItemIdealPointSize
{
  return 0;
}

- (void)_deleteStateForExtensionWithComposedIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[WBSWebExtensionsController _deleteStorageForExtensionWithComposedIdentifier:](self, "_deleteStorageForExtensionWithComposedIdentifier:");
  -[WBSWebExtensionsController _clearNewTabPreferenceIfNecessaryForRemovedExtensionWithComposedIdentifier:](self, "_clearNewTabPreferenceIfNecessaryForRemovedExtensionWithComposedIdentifier:", v4);

}

- (void)_deleteStorageForExtensionWithComposedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0D8A2D0]);

  if ((v6 & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v16 = v4;
      _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Deleting storage for removed extension with composed identifier %{private}@", buf, 0xCu);
    }
    -[WBSWebExtensionsController _urlForWebKitExtensionsDirectory](self, "_urlForWebKitExtensionsDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v10, "removeItemAtURL:error:", v9, &v14);
    v11 = v14;

    if (v11)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "safari_privacyPreservingDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSWebExtensionsController _deleteStorageForExtensionWithComposedIdentifier:].cold.1((uint64_t)v4, v13, buf, v12);
      }

    }
  }

}

- (void)_updateExtensionStateIfPermissionsIncreased:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionsController loadPermissionsIfNecessaryForExtension:](self, "loadPermissionsIfNecessaryForExtension:", v5);
  v6.receiver = self;
  v6.super_class = (Class)WBSWebExtensionsController;
  -[WBSExtensionsController _updateExtensionStateIfPermissionsIncreased:](&v6, sel__updateExtensionStateIfPermissionsIncreased_, v4);

}

- (BOOL)_shouldDisableExtensionIfAdditionalPermissionsAreRequired:(id)a3 previousExtensionState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPermissionOrigins");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v6, "safari_numberForKey:", *MEMORY[0x1E0D8A5C8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    LOBYTE(v9) = v10
              && (objc_msgSend(v10, "BOOLValue") & 1) == 0
              && (objc_msgSend(v7, "hasAbilityToInjectContentIntoWebpages") & 1) != 0
              || (v11,
                  objc_msgSend(v6, "safari_numberForKey:", *MEMORY[0x1E0D8A600]),
                  v12 = (void *)objc_claimAutoreleasedReturnValue(),
                  (v11 = v12) != 0)
              && (objc_msgSend(v12, "BOOLValue") & 1) == 0
              && (objc_msgSend(v7, "hasDeclarativeNetRequestHostAccessPermission") & 1) != 0;

  }
  return v9;
}

- (id)webExtensionController:(id)a3 openWindowsForExtensionContext:(id)a4
{
  void *v5;
  void *v6;

  +[WBSWebExtensionData webExtensionForWebKitExtensionContext:](WBSWebExtensionData, "webExtensionForWebKitExtensionContext:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionsController _allWindowsForWebExtension:](self, "_allWindowsForWebExtension:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)webExtensionController:(id)a3 focusedWindowForExtensionContext:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  +[WBSWebExtensionData webExtensionForWebKitExtensionContext:](WBSWebExtensionData, "webExtensionForWebKitExtensionContext:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WBSWebExtensionsController lastFocusedWindow](self, "lastFocusedWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WBSWebExtensionsController isWindow:visibleToExtension:](self, "isWindow:visibleToExtension:", v6, v5))
      v7 = v6;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)webExtensionController:(id)a3 openNewTabWithOptions:(id)a4 forExtensionContext:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  WBSWebExtensionsController *v18;
  id v19;

  v8 = a4;
  v9 = a6;
  objc_msgSend(v8, "desiredWindow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "desiredIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "desiredURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "shouldActivate");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __113__WBSWebExtensionsController_webExtensionController_openNewTabWithOptions_forExtensionContext_completionHandler___block_invoke;
  v16[3] = &unk_1E5448C70;
  v14 = v9;
  v19 = v14;
  v15 = v8;
  v17 = v15;
  v18 = self;
  -[WBSWebExtensionsController _createNewTabInWindow:tabIndex:url:makeActive:completionHandler:](self, "_createNewTabInWindow:tabIndex:url:makeActive:completionHandler:", v10, v11, v12, v13, v16);

}

void __113__WBSWebExtensionsController_webExtensionController_openNewTabWithOptions_forExtensionContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "shouldPin"))
      objc_msgSend(*(id *)(a1 + 40), "_pinTab:", v4);
    if (objc_msgSend(*(id *)(a1 + 32), "shouldMute"))
      objc_msgSend(v4, "mute");
    if (objc_msgSend(*(id *)(a1 + 32), "shouldShowReaderMode")
      && (objc_msgSend(v4, "isInReaderMode") & 1) == 0)
    {
      objc_msgSend(v4, "toggleReader");
    }
    objc_msgSend(*(id *)(a1 + 32), "desiredParentTab");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 40), "_relateParentTab:toTab:", v3, v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)webExtensionController:(id)a3 sendMessage:(id)a4 toApplicationIdentifier:(id)a5 forExtensionContext:(id)a6 replyHandler:(id)a7
{
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a7;
  +[WBSWebExtensionData webExtensionForWebKitExtensionContext:](WBSWebExtensionData, "webExtensionForWebKitExtensionContext:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionsController sendMessage:toApplicationWithID:fromExtensionWithIdentifier:completionHandler:](self, "sendMessage:toApplicationWithID:fromExtensionWithIdentifier:completionHandler:", v16, v11, v15, v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3586, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v15);
  }

}

- (void)webExtensionController:(id)a3 connectUsingMessagePort:(id)a4 forExtensionContext:(id)a5 completionHandler:(id)a6
{
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = (void (**)(id, _QWORD))a6;
  +[WBSWebExtensionData webExtensionForWebKitExtensionContext:](WBSWebExtensionData, "webExtensionForWebKitExtensionContext:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "connectUsingMessagePort:", v12);
    v8[2](v8, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3586, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v8)[2](v8, v11);

  }
}

- (void)webExtensionController:(id)a3 promptForPermissions:(id)a4 inTab:(id)a5 forExtensionContext:(id)a6 completionHandler:(id)a7
{
  (*((void (**)(id, id, _QWORD))a7 + 2))(a7, a4, 0);
}

- (void)webExtensionController:(id)a3 promptForPermissionMatchPatterns:(id)a4 inTab:(id)a5 forExtensionContext:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  WBSWebExtensionsController *v23;
  id v24;
  id v25;
  id v26;

  v10 = a4;
  v11 = a6;
  v12 = a7;
  +[WBSWebExtensionData webExtensionForWebKitExtensionContext:](WBSWebExtensionData, "webExtensionForWebKitExtensionContext:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __130__WBSWebExtensionsController_webExtensionController_promptForPermissionMatchPatterns_inTab_forExtensionContext_completionHandler___block_invoke;
    v22 = &unk_1E5448C98;
    v23 = self;
    v26 = v12;
    v14 = v10;
    v24 = v14;
    v15 = v13;
    v25 = v15;
    v16 = (void *)MEMORY[0x1A85D45E4](&v19);
    objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_130, v19, v20, v21, v22, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionsController _showAccessRequestAlertForExtension:domains:callingAPIName:responseBlock:](self, "_showAccessRequestAlertForExtension:domains:callingAPIName:responseBlock:", v15, v17, CFSTR("permissions.request()"), v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v18, 0);

  }
}

void __130__WBSWebExtensionsController_webExtensionController_promptForPermissionMatchPatterns_inTab_forExtensionContext_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend((id)objc_opt_class(), "temporarySiteAccessTimeInterval");
    objc_msgSend(v4, "dateWithTimeIntervalSinceNow:");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2)
    {
      v15 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v15 + 16))(v15);

      return;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v3;
  +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:](WBSWebExtensionMatchPattern, "matchPatternsWtihWebKitPatterns:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allProfileExtensionsControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 48), "extension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "webExtensionForExtension:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "grantPermissions:origins:expirationDate:", v14, v6, v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

id __130__WBSWebExtensionsController_webExtensionController_promptForPermissionMatchPatterns_inTab_forExtensionContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringByRemovingWwwAndWildcardDotPrefixes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)webExtensionController:(id)a3 promptForPermissionToAccessURLs:(id)a4 inTab:(id)a5 forExtensionContext:(id)a6 completionHandler:(id)a7
{
  id v10;
  void (**v11)(id, void *, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v10 = a5;
  v11 = (void (**)(id, void *, _QWORD))a7;
  +[WBSWebExtensionData webExtensionForWebKitExtensionContext:](WBSWebExtensionData, "webExtensionForWebKitExtensionContext:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "promptForAccessToURLs:inTab:completionHandler:", v15, v10, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v14, 0);

  }
}

- (id)_safariShortVersion
{
  return 0;
}

- (id)_webViewConfiguration
{
  return 0;
}

- (id)_allWindowsForWebExtension:(id)a3
{
  return 0;
}

- (void)_createNewTabInWindow:(id)a3 tabIndex:(id)a4 url:(id)a5 makeActive:(BOOL)a6 completionHandler:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (id)_findWindowWithID:(double)a3
{
  return 0;
}

- (WBSWebExtensionWindow)lastFocusedWindow
{
  return 0;
}

- (BOOL)showOptionsForExtension:(id)a3 requestingWebView:(id)a4
{
  return 0;
}

- (id)_deviceUUIDString
{
  return 0;
}

- (NSString)profileName
{
  void *v2;
  void *v3;

  -[WBSExtensionsController profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasNamedProfiles
{
  return 0;
}

- (WBTabGroupManager)tabGroupManager
{
  return 0;
}

- (id)_domainForDefaultSearchProvider
{
  return 0;
}

- (id)_enabledWebExtensionsSortedByDisplayShortName
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[2];

  v3 = MEMORY[0x1E0C809B0];
  v14[1] = *MEMORY[0x1E0C80C00];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__WBSWebExtensionsController__enabledWebExtensionsSortedByDisplayShortName__block_invoke;
  v13[3] = &unk_1E5448D00;
  v13[4] = self;
  v4 = (void *)MEMORY[0x1A85D45E4](v13, a2);
  if (-[WBSExtensionsController loadEnabledExtensionsWasCalled](self, "loadEnabledExtensionsWasCalled"))
  {
    -[WBSExtensionsController enabledExtensions](self, "enabledExtensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WBSExtensionsController extensions](self, "extensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __75__WBSWebExtensionsController__enabledWebExtensionsSortedByDisplayShortName__block_invoke_2;
    v12[3] = &unk_1E5442640;
    v12[4] = self;
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:selector:", CFSTR("displayShortName"), 1, sel_localizedStandardCompare_);
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __75__WBSWebExtensionsController__enabledWebExtensionsSortedByDisplayShortName__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "webExtensionForExtension:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __75__WBSWebExtensionsController__enabledWebExtensionsSortedByDisplayShortName__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "extensionIsEnabled:", a2);
}

- (id)_discoverabilityTitleForCommand:(id)a3 webExtension:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "commandDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "commandDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayShortName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ — %@"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "displayShortName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)webExtensionKeyCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__WBSWebExtensionsController_webExtensionKeyCommands__block_invoke;
  v8[3] = &unk_1E5448D50;
  v8[4] = self;
  v3 = (void *)MEMORY[0x1A85D45E4](v8, a2);
  -[WBSWebExtensionsController _enabledWebExtensionsSortedByDisplayShortName](self, "_enabledWebExtensionsSortedByDisplayShortName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_flattenedArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53__WBSWebExtensionsController_webExtensionKeyCommands__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "commands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__WBSWebExtensionsController_webExtensionKeyCommands__block_invoke_2;
  v8[3] = &unk_1E5448D28;
  v8[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53__WBSWebExtensionsController_webExtensionKeyCommands__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "keyCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_discoverabilityTitleForCommand:webExtension:", v3, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDiscoverabilityTitle:", v5);

  return v4;
}

- (id)commandShortcutConflictsForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "hasCommands") & 1) != 0)
  {
    -[WBSWebExtensionsController _enabledWebExtensionsSortedByDisplayShortName](self, "_enabledWebExtensionsSortedByDisplayShortName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (objc_msgSend(v6, "containsObject:", v4))
      objc_msgSend(v6, "removeObject:", v4);
    objc_msgSend((id)objc_opt_class(), "_commandShortcutConflictsForExtension:sortedWebExtensions:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)performCommandForKeyCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  -[WBSWebExtensionsController webKitController](self, "webKitController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v10, "performCommandForKeyCommand:", v4) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

+ (id)_firstConflctForCommand:(id)a3 inSortedWebExtensions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  WBSWebExtensionCommandShortcutConflict *v16;
  WBSWebExtensionCommandShortcutConflict *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "shortcut");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    v9 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "commands");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v9;
        v24[1] = 3221225472;
        v24[2] = __76__WBSWebExtensionsController__firstConflctForCommand_inSortedWebExtensions___block_invoke;
        v24[3] = &unk_1E5448D78;
        v25 = v23;
        objc_msgSend(v12, "safari_firstObjectPassingTest:", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "shortcut");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length") == 0;

        if (!v15)
        {
          v17 = [WBSWebExtensionCommandShortcutConflict alloc];
          objc_msgSend(v13, "shortcut");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "displayName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "displayShortName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[WBSWebExtensionCommandShortcutConflict initWithShortcut:extensionDisplayName:extensionDisplayShortName:](v17, "initWithShortcut:extensionDisplayName:extensionDisplayShortName:", v18, v19, v20);

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

uint64_t __76__WBSWebExtensionsController__firstConflctForCommand_inSortedWebExtensions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "shortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "safari_isCaseInsensitiveEqualToString:", v3);

  return v4;
}

+ (id)_commandShortcutConflictsForExtension:(id)a3 sortedWebExtensions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v6, "commands", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "_firstConflctForCommand:inSortedWebExtensions:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v8, "copy");
  return v14;
}

- (BOOL)anyWebExtensionContentBlockerEnabled
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->super._extensions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[WBSWebExtensionsController extensionIsEnabled:](self, "extensionIsEnabled:", v7, (_QWORD)v13))
        {
          -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "webKitContext");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "hasContentModificationRules");

          if ((v10 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (void)loadPermissionsIfNecessaryForExtension:(id)a3
{
  id v4;
  NSMutableSet *enabledExtensions;
  void *v6;
  id v7;

  v4 = a3;
  enabledExtensions = self->super._enabledExtensions;
  v7 = v4;
  objc_msgSend(v4, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enabledExtensions) = -[NSMutableSet containsObject:](enabledExtensions, "containsObject:", v6);

  if ((enabledExtensions & 1) == 0)
    -[WBSWebExtensionsController _loadPermissionsFromStorageForWebExtension:completionHandler:](self, "_loadPermissionsFromStorageForWebExtension:completionHandler:", v7, &__block_literal_global_147_0);

}

- (void)_applyManagedExtensionPermissionsForWebExtension:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "composedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8A148], "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allDomainsAreManagedForComposedIdentifier:", v3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "grantedPermissionOrigins");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

    objc_msgSend(v22, "revokedPermissionOrigins");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v10);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeGrantedAndRevokedPermissions:origins:exactPatternMatchesOnly:", v11, v6, 1);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8A148], "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allowedDomainsForComposedIdentifier:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_151);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "grantPermissions:origins:expirationDate:", v12, v15, v16);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8A148], "sharedController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deniedDomainsForComposedIdentifier:", v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_151);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "revokePermissions:origins:expirationDate:", v17, v20, v21);

}

id __79__WBSWebExtensionsController__applyManagedExtensionPermissionsForWebExtension___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("*")))
  {
    +[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern](WBSWebExtensionMatchPattern, "allHostsAndSchemesMatchPattern");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (void *)v3;
    goto LABEL_7;
  }
  if (!objc_msgSend(v2, "hasPrefix:", CFSTR("*")))
  {
    +[WBSWebExtensionMatchPattern matchPatternForDomainWithoutSubdomains:](WBSWebExtensionMatchPattern, "matchPatternForDomainWithoutSubdomains:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v2, "substringFromIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSWebExtensionMatchPattern matchPatternForDomain:](WBSWebExtensionMatchPattern, "matchPatternForDomain:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v5;
}

- (void)_updateManagedWebsiteAccessForAllExtensions
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  v3 = self->super._extensions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "hasLoadedPermissionsFromStorage") & 1) != 0)
          -[WBSWebExtensionsController _applyManagedExtensionPermissionsForWebExtension:](self, "_applyManagedExtensionPermissionsForWebExtension:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_updateManagedPrivateBrowsingStateForAllExtensions
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D8A148], "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->super._extensions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7), (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "composedIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v3, "managedExtensionPrivateBrowsingStateForComposedIdentifier:", v9);

        if (v10)
          objc_msgSend(v8, "setAllowedInPrivateBrowsing:", v10 == 1);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_loadPermissionsFromStorageForWebExtension:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *extensionIdentifierToStateMap;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t *v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  _QWORD v55[7];

  v55[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!self->super._extensionIdentifierToStateMap)
  {
    -[WBSExtensionsController readExtensionsStateFromStorage](self, "readExtensionsStateFromStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
    extensionIdentifierToStateMap = self->super._extensionIdentifierToStateMap;
    self->super._extensionIdentifierToStateMap = v9;

  }
  objc_msgSend(v6, "extension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && !objc_msgSend(v6, "hasLoadedPermissionsFromStorage"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLForKey:", *MEMORY[0x1E0D8A2B0]);

    if (v15)
    {
      v16 = (void *)objc_msgSend(v12, "mutableCopy");
      v55[0] = CFSTR("GrantedPermissions");
      v55[1] = CFSTR("GrantedPermissionOrigins");
      v55[2] = CFSTR("RevokedPermissions");
      v55[3] = CFSTR("RevokedPermissionOrigins");
      v55[4] = *MEMORY[0x1E0D8A370];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectsForKeys:", v17);

      v13 = (void *)objc_msgSend(v16, "copy");
      v18 = self->super._extensionIdentifierToStateMap;
      objc_msgSend(v6, "extension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v13, v20);

    }
    else
    {
      v13 = v12;
    }
    objc_msgSend(v13, "safari_dictionaryForKey:", CFSTR("GrantedPermissions"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = (void *)MEMORY[0x1E0C9AA70];
    if (v21)
      v23 = (void *)v21;
    v24 = v23;

    objc_msgSend(v6, "webKitExtension");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "requestedPermissions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safari_dictionaryByMappingObjectsToValuesUsingBlock:", &__block_literal_global_157);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "safari_dictionaryByMergingWithDictionary:", v24);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setGrantedPermissions:", v45);
    objc_msgSend(v13, "safari_dictionaryForKey:", CFSTR("RevokedPermissions"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
      v30 = v28;
    else
      v30 = MEMORY[0x1E0C9AA70];
    objc_msgSend(v6, "setRevokedPermissions:", v30);

    v31 = objc_msgSend(v6, "requestsAccessToAllHosts");
    objc_msgSend(v6, "manifestAccessibleOrigins");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "manifestOptionalPermissionOrigins");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_2;
    v46[3] = &unk_1E5448E48;
    v50 = v31;
    v33 = v44;
    v47 = v33;
    v49 = &v51;
    v34 = v32;
    v48 = v34;
    v35 = (void *)MEMORY[0x1A85D45E4](v46);
    objc_msgSend(v13, "safari_dictionaryForKey:", CFSTR("GrantedPermissionOrigins"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "safari_mapAndFilterKeysUsingBlock:", v35);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    if (v37)
      v39 = v37;
    else
      v39 = MEMORY[0x1E0C9AA70];
    objc_msgSend(v6, "setGrantedPermissionOrigins:", v39);

    objc_msgSend(v13, "safari_dictionaryForKey:", CFSTR("RevokedPermissionOrigins"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "safari_mapAndFilterKeysUsingBlock:", v35);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v41)
      v43 = v41;
    else
      v43 = MEMORY[0x1E0C9AA70];
    objc_msgSend(v6, "setRevokedPermissionOrigins:", v43);

    -[WBSWebExtensionsController _applyManagedExtensionPermissionsForWebExtension:](self, "_applyManagedExtensionPermissionsForWebExtension:", v6);
    objc_msgSend(v6, "setHasLoadedPermissionsFromStorage:", 1);
    if (*((_BYTE *)v52 + 24))
      -[WBSWebExtensionsController _savePermissionsToStorageForWebExtension:](self, "_savePermissionsToStorageForWebExtension:", v6);
    v7[2](v7);

    _Block_object_dispose(&v51, 8);
  }
  else
  {
    v7[2](v7);
    v13 = v12;
  }

}

id __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke()
{
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[WBSWebExtensionMatchPattern matchPatternWithString:](WBSWebExtensionMatchPattern, "matchPatternWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_BYTE *)(a1 + 56))
  {
    v6 = v4;
  }
  else if (objc_msgSend(v4, "matchesAllHosts"))
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138478083;
      v22 = v5;
      v23 = 2113;
      v24 = v8;
      _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Skipping loading permission: %{private}@ since it doesn't match any manifest accessible patterns (%{private}@)", buf, 0x16u);
    }
    v6 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_158;
    v19[3] = &unk_1E5448E20;
    v11 = v5;
    v20 = v11;
    if (objc_msgSend(v9, "safari_containsObjectPassingTest:", v19))
    {
      v6 = v11;
    }
    else
    {
      v12 = *(void **)(a1 + 40);
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_2_160;
      v17[3] = &unk_1E5448E20;
      v13 = v11;
      v18 = v13;
      if ((objc_msgSend(v12, "safari_containsObjectPassingTest:", v17) & 1) != 0)
      {
        v6 = v13;
      }
      else
      {
        v14 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138478083;
          v22 = v13;
          v23 = 2113;
          v24 = v15;
          _os_log_impl(&dword_1A840B000, v14, OS_LOG_TYPE_INFO, "Skipping loading permission: %{private}@ since it doesn't match any manifest accessible patterns (%{private}@)", buf, 0x16u);
        }
        v6 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }

    }
  }

  return v6;
}

uint64_t __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_158(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesPattern:options:", *(_QWORD *)(a1 + 32), 4);
}

uint64_t __91__WBSWebExtensionsController__loadPermissionsFromStorageForWebExtension_completionHandler___block_invoke_2_160(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesPattern:options:", *(_QWORD *)(a1 + 32), 4);
}

- (void)_savePermissionsToStorageForWebExtension:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v6)
  {
    objc_msgSend(v14, "grantedPermissions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("GrantedPermissions"));

    objc_msgSend(v14, "revokedPermissions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("RevokedPermissions"));

    objc_msgSend(v14, "grantedPermissionOrigins");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_163);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("GrantedPermissionOrigins"));

    objc_msgSend(v14, "revokedPermissionOrigins");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_163);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("RevokedPermissionOrigins"));

    objc_msgSend(v14, "extension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSExtensionsController _setExtensionState:forExtension:](self, "_setExtensionState:forExtension:", v6, v13);

  }
}

id __71__WBSWebExtensionsController__savePermissionsToStorageForWebExtension___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_savePermissionsToStorageIfNecessaryAndPostDidChangeNotificationForWebExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "webExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "permissionsWereUpdatedDueToAnExternalChange") & 1) == 0)
    -[WBSWebExtensionsController _savePermissionsToStorageForWebExtension:](self, "_savePermissionsToStorageForWebExtension:", v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("permissionsWereUpdatedDueToAnExternalChange");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "permissionsWereUpdatedDueToAnExternalChange"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("webExtensionPermissionDidChange"), v7, v9);

}

- (void)_savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:(id)a3 permissionsWereUpdatedDueToAnExternalChange:(BOOL)a4
{
  _BOOL8 v4;
  WBSSavePermissionsToStorageInformation *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  {
    -[WBSWebExtensionsController _savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:permissionsWereUpdatedDueToAnExternalChange:]::selectorToCoalesce = (uint64_t)sel__savePermissionsToStorageIfNecessaryAndPostDidChangeNotificationForWebExtension_;
  }
  v6 = -[WBSSavePermissionsToStorageInformation initWithWebExtension:permissionsWereUpdatedDueToAnExternalChange:]([WBSSavePermissionsToStorageInformation alloc], "initWithWebExtension:permissionsWereUpdatedDueToAnExternalChange:", v7, v4);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, -[WBSWebExtensionsController _savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:permissionsWereUpdatedDueToAnExternalChange:]::selectorToCoalesce, v6);
  -[WBSWebExtensionsController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", -[WBSWebExtensionsController _savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:permissionsWereUpdatedDueToAnExternalChange:]::selectorToCoalesce, v6, 0.01);

}

- (void)_webExtensionDataPermissionsWereGranted:(id)a3
{
  void *v4;
  WBSWebExtensionsController *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionsController");
  v5 = (WBSWebExtensionsController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    objc_msgSend(v8, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safari_BOOLForKey:", CFSTR("permissionsWereUpdatedDueToAnExternalChange"));

    -[WBSWebExtensionsController _savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:permissionsWereUpdatedDueToAnExternalChange:](self, "_savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:permissionsWereUpdatedDueToAnExternalChange:", v4, v7);
  }

}

- (void)_webExtensionDataPermissionsWereRevokedOrRemoved:(id)a3
{
  void *v4;
  WBSWebExtensionsController *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionsController");
  v5 = (WBSWebExtensionsController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    objc_msgSend(v13, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("webExtensionGrantedPermissionsWereRemoved"));

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v13, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("webExtensionPermissionsWereRevoked"));

      if ((v9 & 1) == 0)
      {
        objc_msgSend(v13, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "isEqualToString:", CFSTR("webExtensionRevokedPermissionsWereRemoved"));

      }
    }
    objc_msgSend(v13, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "safari_BOOLForKey:", CFSTR("permissionsWereUpdatedDueToAnExternalChange"));

    -[WBSWebExtensionsController _savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:permissionsWereUpdatedDueToAnExternalChange:](self, "_savePermissionsToStorageAndPostDidChangeNotificationSoonForWebExtension:permissionsWereUpdatedDueToAnExternalChange:", v4, v12);
  }

}

- (void)_webExtensionEnabledStateInPrivateBrowsingChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("WBSWebExtensionComposedIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    -[WBSWebExtensionsController webExtensionForComposedIdentifier:](self, "webExtensionForComposedIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowedInPrivateBrowsing:", objc_msgSend(v7, "safari_BOOLForKey:", *MEMORY[0x1E0D8A2F8]));

  }
}

+ (double)pendingSiteAccessTimeoutInterval
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", *MEMORY[0x1E0D8A298]);
  v4 = v3;

  result = 60.0;
  if (v4 != 0.0)
    return v4;
  return result;
}

- (id)_filteredOriginsRemovingAllHostsPatterns:(id)a3 containedAllHostsPattern:(BOOL *)a4
{
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__WBSWebExtensionsController__filteredOriginsRemovingAllHostsPatterns_containedAllHostsPattern___block_invoke;
  v7[3] = &unk_1E5448EB0;
  v7[4] = &v8;
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __96__WBSWebExtensionsController__filteredOriginsRemovingAllHostsPatterns_containedAllHostsPattern___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (objc_msgSend(v3, "matchesAllHosts"))
  {
    v4 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (void)_showAccessRequestAlertForExtension:(id)a3 domains:(id)a4 callingAPIName:(id)a5 responseBlock:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 3);
}

- (void)_permissionsMayHaveBeenChangedExternallyForExtension:(id)a3 previousExtensionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "safari_dictionaryForKey:", CFSTR("GrantedPermissionOrigins"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_168_0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E0C9AA70];
  if (v9)
    v12 = (void *)v9;
  else
    v12 = (void *)MEMORY[0x1E0C9AA70];
  v13 = v12;

  objc_msgSend(v7, "safari_dictionaryForKey:", CFSTR("RevokedPermissionOrigins"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_168_0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v11;
  v18 = v17;

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __106__WBSWebExtensionsController__permissionsMayHaveBeenChangedExternallyForExtension_previousExtensionState___block_invoke_2;
  v22[3] = &unk_1E5441410;
  v19 = v6;
  v23 = v19;
  v20 = v13;
  v24 = v20;
  v25 = v18;
  v21 = v18;
  -[WBSWebExtensionsController _loadPermissionsFromStorageForWebExtension:completionHandler:](self, "_loadPermissionsFromStorageForWebExtension:completionHandler:", v19, v22);

}

id __106__WBSWebExtensionsController__permissionsMayHaveBeenChangedExternallyForExtension_previousExtensionState___block_invoke(uint64_t a1, uint64_t a2)
{
  +[WBSWebExtensionMatchPattern matchPatternWithString:](WBSWebExtensionMatchPattern, "matchPatternWithString:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __106__WBSWebExtensionsController__permissionsMayHaveBeenChangedExternallyForExtension_previousExtensionState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previouslyGrantedPermissionOriginsMayHaveBeenChangedExternally:previouslyRevokedPermissionOrigins:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)isTab:(id)a3 visibleToExtension:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
    goto LABEL_5;
  if ((objc_msgSend(v6, "allowedInPrivateBrowsing") & 1) != 0 || (objc_msgSend(v5, "isPrivate") & 1) == 0)
LABEL_6:
    v11 = 1;
  else
LABEL_5:
    v11 = 0;

  return v11;
}

- (void)didOpenTab:(id)a3
{
  -[_WKWebExtensionController didOpenTab:](self->_webKitController, "didOpenTab:", a3);
}

- (void)didCloseTab:(id)a3 windowIsClosing:(BOOL)a4
{
  -[_WKWebExtensionController didCloseTab:windowIsClosing:](self->_webKitController, "didCloseTab:windowIsClosing:", a3, a4);
}

- (void)didMoveTab:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v7;
  _WKWebExtensionController *webKitController;
  void *v9;
  id v10;

  v7 = a3;
  webKitController = self->_webKitController;
  v10 = v7;
  objc_msgSend(v7, "webExtensionWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WKWebExtensionController didMoveTab:fromIndex:inWindow:](webKitController, "didMoveTab:fromIndex:inWindow:", v10, a4, v9);

}

- (void)didMoveTab:(id)a3 fromWindowWithID:(double)a4 indexInOldWindow:(unint64_t)a5
{
  void *v8;
  id v9;

  v9 = a3;
  if (a4 == -1.0)
  {
    v8 = 0;
  }
  else
  {
    -[WBSWebExtensionsController _findWindowWithID:](self, "_findWindowWithID:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_WKWebExtensionController didMoveTab:fromIndex:inWindow:](self->_webKitController, "didMoveTab:fromIndex:inWindow:", v9, a5, v8);

}

- (void)didReplaceTab:(id)a3 newTab:(id)a4
{
  -[_WKWebExtensionController didReplaceTab:withTab:](self->_webKitController, "didReplaceTab:withTab:", a3, a4);
}

- (void)didSelectTab:(id)a3 previousTab:(id)a4
{
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_WKWebExtensionController didActivateTab:previousActiveTab:](self->_webKitController, "didActivateTab:previousActiveTab:", v6, a4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->super._enabledExtensions;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "toolbarItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "didSelectTab:", v6);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (BOOL)isWindow:(id)a3 visibleToExtension:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
    goto LABEL_5;
  if ((objc_msgSend(v6, "allowedInPrivateBrowsing") & 1) != 0 || (objc_msgSend(v5, "isPrivate") & 1) == 0)
LABEL_6:
    v11 = 1;
  else
LABEL_5:
    v11 = 0;

  return v11;
}

- (id)_persistentStateURLForExtensionURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionsController webExtensionForBaseURIHost:](self, "webExtensionForBaseURIHost:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "composedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEncodedHost:", v9);

    objc_msgSend(v4, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_extensionURLToLoadFromPersistentStateURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_composedIdentifierAndProfileIdentifierInSafariWebExtensionURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "first");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionsController webExtensionForComposedIdentifier:](self, "webExtensionForComposedIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "baseURIHost");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHost:", v11);

      objc_msgSend(v5, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WBSCoreAnalyticsExtensionsStatistics)extensionStatisticsReport
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableArray *extensions;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke;
  v15[3] = &unk_1E5448F18;
  v15[4] = self;
  v4 = (void *)MEMORY[0x1A85D45E4](v15, a2);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke_2;
  v14[3] = &unk_1E5448F18;
  v14[4] = self;
  v5 = (void *)MEMORY[0x1A85D45E4](v14);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke_3;
  v13[3] = &unk_1E5448F40;
  v13[4] = self;
  v6 = (void *)MEMORY[0x1A85D45E4](v13);
  v7 = objc_alloc(MEMORY[0x1E0D8A0F0]);
  extensions = self->super._extensions;
  -[WBSWebExtensionsController tabOverridePreferencesManager](self, "tabOverridePreferencesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithExtensionsList:extractDeveloperIdentifier:extractComposedIdentifier:extensionTelemetryDataPredicate:newTabPageIsOverridden:", extensions, v4, v5, v6, objc_msgSend(v9, "isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:", v10));

  return (WBSCoreAnalyticsExtensionsStatistics *)v11;
}

id __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_developerIdentifierForExtension:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "composedIdentifierForExtensionStateForExtension:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __55__WBSWebExtensionsController_extensionStatisticsReport__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D8A118]);
  objc_msgSend(*(id *)(a1 + 32), "webExtensionForExtension:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", v3));
  objc_msgSend(*(id *)(a1 + 32), "composedIdentifierForExtensionStateForExtension:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v6);

  objc_msgSend(v4, "setManifestVersion:", objc_msgSend(v5, "manifestVersion"));
  objc_msgSend(v4, "setAllWebsitesPermissionLevel:", objc_msgSend(v5, "hasPermissionToAccessAllHosts"));
  objc_msgSend(v5, "currentPermissionOrigins");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWebsitesGrantedAccessCount:", objc_msgSend(v7, "count"));

  objc_msgSend(v5, "revokedPermissionOrigins");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWebsitesDeniedAccessCount:", objc_msgSend(v8, "count"));

  v9 = (void *)objc_msgSend(v5, "newTabOverridePageURL");
  objc_msgSend(v4, "setCanOverrideNewTabPage:", v9 != 0);

  return v4;
}

- (void)_grantRequestedPermissionsIfNecessaryForExtension:(id)a3
{
  void *v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSMutableSet *migratedWebNavigationExtensionIdentifiers;
  NSMutableSet *v12;
  NSMutableSet *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id obj;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("DidGrantSearchProviderAccessToWebNavigationExtensions"));

  if ((v5 & 1) == 0)
  {
    v6 = v28;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v32 = v8;
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E547C3C0);
      -[WBSWebExtensionsController _grantRequestedPermissionsIfNecessaryForExtension:]::searchProviderComposedIdentifiers = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "composedIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)-[WBSWebExtensionsController _grantRequestedPermissionsIfNecessaryForExtension:]::searchProviderComposedIdentifiers, "containsObject:") & 1) != 0)
    {
      objc_msgSend(v8, "grantedPermissionOrigins");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
      {
        migratedWebNavigationExtensionIdentifiers = self->_migratedWebNavigationExtensionIdentifiers;
        if (!migratedWebNavigationExtensionIdentifiers)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
          v13 = self->_migratedWebNavigationExtensionIdentifiers;
          self->_migratedWebNavigationExtensionIdentifiers = v12;

          migratedWebNavigationExtensionIdentifiers = self->_migratedWebNavigationExtensionIdentifiers;
        }
        -[NSMutableSet addObject:](migratedWebNavigationExtensionIdentifiers, "addObject:", v27);
        v14 = (void *)MEMORY[0x1E0C99E60];
        -[WBSWebExtensionsController _domainForDefaultSearchProvider](self, "_domainForDefaultSearchProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBSWebExtensionMatchPattern matchPatternForDomain:](WBSWebExtensionMatchPattern, "matchPatternForDomain:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWithObject:", v16);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        -[WBSExtensionsController allProfileExtensionsControllers](self, "allProfileExtensionsControllers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        obj = v18;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v39;
          v21 = MEMORY[0x1E0C809B0];
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v39 != v20)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v32, "extension");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "webExtensionForExtension:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v33[0] = v21;
              v33[1] = 3221225472;
              v33[2] = __80__WBSWebExtensionsController__grantRequestedPermissionsIfNecessaryForExtension___block_invoke;
              v33[3] = &unk_1E5446B30;
              v26 = v25;
              v34 = v26;
              v35 = v31;
              v36 = v30;
              v37 = v17;
              objc_msgSend(v23, "_loadPermissionsFromStorageForWebExtension:completionHandler:", v26, v33);

            }
            v18 = obj;
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          }
          while (v19);
        }

      }
    }

  }
}

uint64_t __80__WBSWebExtensionsController__grantRequestedPermissionsIfNecessaryForExtension___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "grantPermissions:origins:expirationDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (_WKWebExtensionController)webKitController
{
  return self->_webKitController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabOverridePreferencesManager, 0);
  objc_storeStrong((id *)&self->_webKitController, 0);
  objc_storeStrong((id *)&self->_migratedWebNavigationExtensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_settingsFileURL, 0);
  objc_storeStrong((id *)&self->_nativeRequestIdentifiersToCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_extensionIdentifierToData, 0);
  objc_storeStrong((id *)&self->_extensionsWithWebNavigationListeners, 0);
  objc_storeStrong((id *)&self->_extensionsWithWebRequestListeners, 0);
}

- (void)_deleteStorageForExtensionWithComposedIdentifier:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138478083;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Failed to delete storage for removed extension with composed identifier %{private}@: %{public}@", buf, 0x16u);

}

@end
