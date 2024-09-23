@implementation SBHSimpleApplication

- (BOOL)isBlockedForScreenTimeExpiration
{
  return self->_blockedForScreenTimeExpiration;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)progressState
{
  return self->_progressState;
}

- (double)progressPercent
{
  return self->_progressPercent;
}

- (BOOL)isProgressPaused
{
  return self->_progressPaused;
}

- (void)setIconModelApplicationDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_iconModelApplicationDataSource, a3);
}

- (SBHSimpleApplication)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  SBHSimpleApplication *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, v4, &v12);
  v8 = v12;
  if (v7)
  {
    self = -[SBHSimpleApplication initWithApplicationRecord:](self, "initWithApplicationRecord:", v7);
    v9 = self;
  }
  else
  {
    SBLogIcon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "Error creating SBHSimpleApplication with '%@': %@", buf, 0x16u);
    }

    v9 = 0;
  }

  return v9;
}

- (SBHSimpleApplication)initWithApplicationRecord:(id)a3
{
  id v4;
  SBHSimpleApplication *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  NSURL *bundleURL;
  void *v12;
  uint64_t v13;
  NSString *displayName;
  uint64_t v15;
  NSArray *tags;
  void *v17;
  BOOL v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBHSimpleApplication;
  v5 = -[SBHSimpleApplication init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(v4, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v10;

    objc_msgSend(v4, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    objc_msgSend(v4, "appTags");
    v15 = objc_claimAutoreleasedReturnValue();
    tags = v5->_tags;
    v5->_tags = (NSArray *)v15;

    v5->_beta = objc_msgSend(v4, "isBeta");
    v5->_placeholder = objc_msgSend(v4, "isPlaceholder");
    v5->_installType = objc_msgSend(v4, "installType");
    objc_msgSend(v4, "typeForInstallMachinery");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_internalApplication = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CA57F0]);
    v18 = (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CA5820]) & 1) != 0 || v5->_internalApplication;
    v5->_systemApplication = v18;
    +[SBHSimpleApplicationPolicyMonitor sharedInstance](SBHSimpleApplicationPolicyMonitor, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerApplication:", v5);

  }
  return v5;
}

- (int64_t)labelAccessoryTypeForIcon:(id)a3
{
  if (-[SBHSimpleApplication isBlockedForScreenTimeExpiration](self, "isBlockedForScreenTimeExpiration", a3))
    return 4;
  if (-[SBHSimpleApplication isBeta](self, "isBeta"))
    return 2;
  if (-[SBHSimpleApplication isPlaceholder](self, "isPlaceholder"))
  {
    -[SBHSimpleApplication installType](self, "installType");
    if ((FBSInstallTypeIsCloudDemoted() & 1) != 0)
      return 3;
  }
  return 0;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  -[SBHSimpleApplication bundleIdentifier](self, "bundleIdentifier", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImage(v10, 0, v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)badgeNumberOrStringForIcon:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  if (!-[SBHSimpleApplication isBadgeValueValid](self, "isBadgeValueValid", a3))
  {
    objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasEntitlement:", CFSTR("com.apple.springboard.iconBadgeValue"));

    if (v5)
    {
      -[SBHSimpleApplication bundleIdentifier](self, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "homeScreenService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __51__SBHSimpleApplication_badgeNumberOrStringForIcon___block_invoke;
      v9[3] = &unk_1E8D86F40;
      v9[4] = self;
      objc_msgSend(v7, "badgeValueForIconWithApplicationBundleIdentifier:completionHandler:", v6, v9);

    }
  }
  -[SBHSimpleApplication badgeValue](self, "badgeValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isBadgeValueValid
{
  return self->_badgeValueValid;
}

- (id)badgeValue
{
  return self->_badgeValue;
}

- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3
{
  return 1;
}

- (void)updateDeviceManagementPolicy:(int64_t)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3 != 0;
  if (self->_blockedForScreenTimeExpiration != v3)
  {
    self->_blockedForScreenTimeExpiration = v3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("SBLeafIconDataSourceDidChangeNotification"), self);

  }
}

- (SBHSimpleApplication)initWithBundleIdentifier:(id)a3
{
  return -[SBHSimpleApplication initWithBundleIdentifier:allowPlaceholder:](self, "initWithBundleIdentifier:allowPlaceholder:", a3, 0);
}

- (SBHSimpleApplication)initWithBundleIdentifier:(id)a3 forcePlaceholder:(BOOL)a4
{
  _BOOL4 v4;
  SBHSimpleApplication *result;

  v4 = a4;
  result = -[SBHSimpleApplication initWithBundleIdentifier:allowPlaceholder:](self, "initWithBundleIdentifier:allowPlaceholder:", a3, 1);
  if (result)
  {
    if (v4)
      result->_placeholder = 1;
  }
  return result;
}

- (SBHSimpleApplication)initWithApplicationInfo:(id)a3
{
  id v4;
  SBHSimpleApplication *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  NSURL *bundleURL;
  void *v12;
  uint64_t v13;
  NSString *displayName;
  void *v15;
  uint64_t v16;
  NSArray *tags;
  unint64_t v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBHSimpleApplication;
  v5 = -[SBHSimpleApplication init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(v4, "bundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v10;

    objc_msgSend(v4, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    objc_msgSend(v4, "tags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    tags = v5->_tags;
    v5->_tags = (NSArray *)v16;

    v5->_beta = objc_msgSend(v4, "isBeta");
    v5->_blockedForScreenTimeExpiration = objc_msgSend(v4, "isBlockedForScreenTimeExpiration");
    v18 = objc_msgSend(v4, "type");
    v5->_systemApplication = v18 < 2;
    v5->_internalApplication = v18 == 0;
    +[SBHSimpleApplicationPolicyMonitor sharedInstance](SBHSimpleApplicationPolicyMonitor, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerApplication:", v5);

  }
  return v5;
}

- (SBHSimpleApplication)initWithApplicationProxy:(id)a3
{
  id v4;
  SBHSimpleApplication *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  NSURL *bundleURL;
  void *v12;
  uint64_t v13;
  NSString *displayName;
  uint64_t v15;
  NSArray *tags;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  char v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SBHSimpleApplication;
  v5 = -[SBHSimpleApplication init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(v4, "bundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v10;

    objc_msgSend(v4, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    objc_msgSend(v4, "appTags");
    v15 = objc_claimAutoreleasedReturnValue();
    tags = v5->_tags;
    v5->_tags = (NSArray *)v15;

    v5->_beta = objc_msgSend(v4, "isBetaApp");
    objc_msgSend(v4, "appState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_placeholder = objc_msgSend(v17, "isPlaceholder");

    v5->_installType = objc_msgSend(v4, "installType");
    objc_msgSend(v4, "applicationType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CA5820]);
    v20 = *MEMORY[0x1E0CA57F0];
    if ((v19 & 1) != 0)
      v21 = 1;
    else
      v21 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CA57F0]);
    v5->_systemApplication = v21;
    v5->_internalApplication = objc_msgSend(v18, "isEqualToString:", v20);
    +[SBHSimpleApplicationPolicyMonitor sharedInstance](SBHSimpleApplicationPolicyMonitor, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerApplication:", v5);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SBHSimpleApplicationPolicyMonitor sharedInstance](SBHSimpleApplicationPolicyMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterApplication:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBHSimpleApplication;
  -[SBHSimpleApplication dealloc](&v4, sel_dealloc);
}

- (void)updateProgressState:(int64_t)a3 progressPercent:(double)a4 progressPaused:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  -[SBHSimpleApplication setProgressState:](self, "setProgressState:", a3);
  -[SBHSimpleApplication setProgressPercent:](self, "setProgressPercent:", a4);
  -[SBHSimpleApplication setProgressPaused:](self, "setProgressPaused:", v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SBLeafIconDataSourceDidChangeNotification"), self);

}

- (unint64_t)priorityForIcon:(id)a3
{
  if (-[SBHSimpleApplication isPlaceholder](self, "isPlaceholder", a3))
    return 2;
  else
    return 1;
}

- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  -[SBHSimpleApplication bundleIdentifier](self, "bundleIdentifier", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImage(v10, 1, v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  SBIconImageInfo *v14;
  void *v15;
  void *v16;

  v9 = (int)a5;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  v14 = a4;
  LOBYTE(v9) = SBHIconServicesOptionsForImageOptions(v9);
  -[SBHSimpleApplication bundleIdentifier](self, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImageWithTraitCollection(v15, (uint64_t)v14, v9, v12, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)icon:(id)a3 canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  char v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  _QWORD v18[2];

  v9 = (char)a5;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  v18[1] = *MEMORY[0x1E0C80C00];
  -[SBHSimpleApplication bundleIdentifier](self, "bundleIdentifier", a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = SBHIconServicesCacheOptionsForImageOptions(v9);
  v18[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = SBHHasCachedIconImagesForApplications(v15, v14, v12, v11, v10);

  return v16;
}

- (void)icon:(id)a3 prepareToMakeLayerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v9 = v8;
  v10 = v7;
  v11 = v6;
  v14[1] = *MEMORY[0x1E0C80C00];
  -[SBHSimpleApplication bundleIdentifier](self, "bundleIdentifier", a3, a4, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SBHCacheIconImagesForApplications(v13, 3, v11, v10, v9);

}

- (id)icon:(id)a3 layerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SBIconImageInfo *v16;
  void *v17;
  char v18;
  void *v19;

  v10 = (int)a5;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  v16 = a4;
  -[SBHSimpleApplication bundleIdentifier](self, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = SBHIconServicesOptionsForImageOptions(v10);
  SBHGetApplicationIconLayerWithTraitCollection(v17, (uint64_t)v16, v18, v14, v13, v12, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  return +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass", a3);
}

- (BOOL)iconCompleteUninstall:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  -[SBHSimpleApplication iconModelApplicationDataSource](self, "iconModelApplicationDataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSimpleApplication bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "uninstallApplicationWithBundleIdentifier:completion:", v5, 0);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __51__SBHSimpleApplication_badgeNumberOrStringForIcon___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setBadgeValueValid:", 1);
  objc_msgSend(*(id *)(a1 + 32), "badgeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BSEqualObjects();

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setBadgeValue:", v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("SBLeafIconDataSourceDidChangeNotification"), *(_QWORD *)(a1 + 32));

  }
}

- (void)remoteBadgeValueDidChange
{
  id v3;

  -[SBHSimpleApplication setBadgeValueValid:](self, "setBadgeValueValid:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBLeafIconDataSourceDidChangeNotification"), self);

}

+ (id)homeScreenService
{
  if (homeScreenService_onceToken != -1)
    dispatch_once(&homeScreenService_onceToken, &__block_literal_global_17);
  return (id)homeScreenService__homeScreenService;
}

void __41__SBHSimpleApplication_homeScreenService__block_invoke()
{
  id v0;
  void *v1;

  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0DAAE90]);
    v1 = (void *)homeScreenService__homeScreenService;
    homeScreenService__homeScreenService = (uint64_t)v0;

  }
}

- (NSString)description
{
  return (NSString *)-[SBHSimpleApplication descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHSimpleApplication descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSimpleApplication bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("bundleIdentifier"));

  -[SBHSimpleApplication displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("displayName"));

  v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHSimpleApplication isPlaceholder](self, "isPlaceholder"), CFSTR("isPlaceholder"), 1);
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHSimpleApplication succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSArray)tags
{
  return self->_tags;
}

- (BOOL)isSystemApplication
{
  return self->_systemApplication;
}

- (BOOL)isInternalApplication
{
  return self->_internalApplication;
}

- (void)setBadgeValue:(id)a3
{
  objc_storeStrong(&self->_badgeValue, a3);
}

- (SBHIconModelApplicationDataSource)iconModelApplicationDataSource
{
  return (SBHIconModelApplicationDataSource *)objc_loadWeakRetained((id *)&self->_iconModelApplicationDataSource);
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)setProgressState:(int64_t)a3
{
  self->_progressState = a3;
}

- (void)setProgressPercent:(double)a3
{
  self->_progressPercent = a3;
}

- (void)setProgressPaused:(BOOL)a3
{
  self->_progressPaused = a3;
}

- (void)setBadgeValueValid:(BOOL)a3
{
  self->_badgeValueValid = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconModelApplicationDataSource);
  objc_storeStrong(&self->_badgeValue, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
