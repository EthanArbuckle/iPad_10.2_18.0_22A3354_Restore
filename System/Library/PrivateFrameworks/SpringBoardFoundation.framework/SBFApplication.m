@implementation SBFApplication

- (SBFApplication)initWithApplicationBundleIdentifier:(id)a3
{
  id v6;
  SBFApplication *v7;
  SBFApplication *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *displayName;
  uint64_t v13;
  NSURL *bundleURL;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSNumber *appStoreItemID;
  void *v20;
  uint64_t v21;
  NSString *applicationShortcutWidgetBundleIdentifier;
  void *v24;
  objc_super v25;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFApplication.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationBundleIdentifier != nil"));

  }
  v25.receiver = self;
  v25.super_class = (Class)SBFApplication;
  v7 = -[SBFApplication init](&v25, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_applicationBundleIdentifier, a3);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "localizedName");
      v11 = objc_claimAutoreleasedReturnValue();
      displayName = v8->_displayName;
      v8->_displayName = (NSString *)v11;

      objc_msgSend(v10, "URL");
      v13 = objc_claimAutoreleasedReturnValue();
      bundleURL = v8->_bundleURL;
      v8->_bundleURL = (NSURL *)v13;

      objc_msgSend(v10, "typeForInstallMachinery");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("System")) & 1) != 0
        || objc_msgSend(v15, "isEqualToString:", CFSTR("Internal")))
      {
        v8->_systemOrInternalApplication = 1;
      }
      objc_msgSend(v10, "iTunesMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "storeItemIdentifier");

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
        appStoreItemID = v8->_appStoreItemID;
        v8->_appStoreItemID = (NSNumber *)v18;

      }
      objc_msgSend(v10, "infoDictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:ofClass:", CFSTR("UIApplicationShortcutWidget"), objc_opt_class());
      v21 = objc_claimAutoreleasedReturnValue();
      applicationShortcutWidgetBundleIdentifier = v8->_applicationShortcutWidgetBundleIdentifier;
      v8->_applicationShortcutWidgetBundleIdentifier = (NSString *)v21;

    }
  }

  return v8;
}

- (SBFApplication)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%s is not a valid initializer. You must call -[%@ initWithApplicationBundleIdentifier:]."), "-[SBFApplication init]", v6);

  return -[SBFApplication initWithApplicationBundleIdentifier:](self, "initWithApplicationBundleIdentifier:", 0);
}

- (void)dealloc
{
  SBSApplicationShortcutService *applicationShortcutService;
  objc_super v4;

  applicationShortcutService = self->_applicationShortcutService;
  if (applicationShortcutService)
    -[SBSApplicationShortcutService invalidate](applicationShortcutService, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SBFApplication;
  -[SBFApplication dealloc](&v4, sel_dealloc);
}

- (NSArray)staticApplicationShortcutItems
{
  SBSApplicationShortcutServiceFetchResult *v3;
  SBSApplicationShortcutServiceFetchResult *applicationShortcutServiceFetchResult;
  void *v5;

  v3 = self->_applicationShortcutServiceFetchResult;
  objc_sync_enter(v3);
  applicationShortcutServiceFetchResult = self->_applicationShortcutServiceFetchResult;
  if (!applicationShortcutServiceFetchResult)
  {
    -[SBFApplication _updateApplicationShortcutServiceFetchResult](self, "_updateApplicationShortcutServiceFetchResult");
    applicationShortcutServiceFetchResult = self->_applicationShortcutServiceFetchResult;
  }
  -[SBSApplicationShortcutServiceFetchResult staticApplicationShortcutItems](applicationShortcutServiceFetchResult, "staticApplicationShortcutItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return (NSArray *)v5;
}

- (NSArray)dynamicApplicationShortcutItems
{
  SBSApplicationShortcutServiceFetchResult *v3;
  void *v4;

  v3 = self->_applicationShortcutServiceFetchResult;
  objc_sync_enter(v3);
  -[SBFApplication _updateApplicationShortcutServiceFetchResult](self, "_updateApplicationShortcutServiceFetchResult");
  -[SBSApplicationShortcutServiceFetchResult dynamicApplicationShortcutItems](self->_applicationShortcutServiceFetchResult, "dynamicApplicationShortcutItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (void)_updateApplicationShortcutServiceFetchResult
{
  SBSApplicationShortcutService *v3;
  SBSApplicationShortcutService *applicationShortcutService;
  double v5;
  SBSApplicationShortcutService *v6;
  void *v7;
  SBSApplicationShortcutServiceFetchResult *v8;
  SBSApplicationShortcutServiceFetchResult *applicationShortcutServiceFetchResult;
  double v10;

  if (!self->_applicationShortcutService)
  {
    v3 = (SBSApplicationShortcutService *)objc_alloc_init(MEMORY[0x1E0DAADA8]);
    applicationShortcutService = self->_applicationShortcutService;
    self->_applicationShortcutService = v3;

  }
  BSContinuousMachTimeNow();
  if (v5 - self->_applicationShortcutServiceFetchResultExpirationReferenceTime >= 2.0)
  {
    v6 = self->_applicationShortcutService;
    -[SBFApplication applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSApplicationShortcutService applicationShortcutItemsOfTypes:forBundleIdentifier:](v6, "applicationShortcutItemsOfTypes:forBundleIdentifier:", 3, v7);
    v8 = (SBSApplicationShortcutServiceFetchResult *)objc_claimAutoreleasedReturnValue();
    applicationShortcutServiceFetchResult = self->_applicationShortcutServiceFetchResult;
    self->_applicationShortcutServiceFetchResult = v8;

    BSContinuousMachTimeNow();
    self->_applicationShortcutServiceFetchResultExpirationReferenceTime = v10;
  }
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (BOOL)isSystemOrInternalApplication
{
  return self->_systemOrInternalApplication;
}

- (NSNumber)appStoreItemID
{
  return self->_appStoreItemID;
}

- (NSString)applicationShortcutWidgetBundleIdentifier
{
  return self->_applicationShortcutWidgetBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationShortcutWidgetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appStoreItemID, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationShortcutServiceFetchResult, 0);
  objc_storeStrong((id *)&self->_applicationShortcutService, 0);
}

@end
