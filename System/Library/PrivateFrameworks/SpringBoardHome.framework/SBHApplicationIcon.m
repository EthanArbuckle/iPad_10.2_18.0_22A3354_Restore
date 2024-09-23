@implementation SBHApplicationIcon

- (BOOL)isApplicationIcon
{
  return 1;
}

- (id)iconImageCacheIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SBLeafIcon applicationBundleID](self, "applicationBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHApplicationIcon;
    -[SBIcon iconImageCacheIdentifier](&v8, sel_iconImageCacheIdentifier);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)possibleUserTapDidCancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHApplicationIcon;
  -[SBIcon possibleUserTapDidCancel](&v4, sel_possibleUserTapDidCancel);
  -[SBHApplicationIcon application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "possibleUserTapDidCancel");

}

- (id)application
{
  void *v2;
  void *v3;
  id v4;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)possibleUserTapBeganWithAbsoluteTime:(unint64_t)a3 andContinuousTime:(unint64_t)a4
{
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHApplicationIcon;
  -[SBIcon possibleUserTapBeganWithAbsoluteTime:andContinuousTime:](&v8, sel_possibleUserTapBeganWithAbsoluteTime_andContinuousTime_);
  -[SBHApplicationIcon application](self, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "possibleUserTapBeganWithAbsoluteTime:andContinuousTime:", a3, a4);

}

- (id)applicationPlaceholder
{
  void *v2;
  void *v3;
  id v4;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (SBHApplicationIcon)initWithLeafIdentifier:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SBHApplicationIcon *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](self, "initWithLeafIdentifier:applicationBundleID:", v7, v8);

  if (v9)
    -[SBLeafIcon addIconDataSource:](v9, "addIconDataSource:", v6);

  return v9;
}

- (SBHApplicationIcon)initWithApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBHApplicationIcon *v7;
  SBHApplicationIcon *v8;
  SBHApplicationIcon *v9;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "iconIdentifier");
  else
    objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](self, "initWithLeafIdentifier:applicationBundleID:", v6, v5);
    v8 = v7;
    if (v7)
      -[SBLeafIcon addIconDataSource:](v7, "addIconDataSource:", v4);
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SBHApplicationIcon)initWithApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  SBHApplicationIcon *v5;
  SBHSimpleApplication *v6;

  v4 = a3;
  if ((__sb__runningInSpringBoard() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = -[SBHSimpleApplication initWithBundleIdentifier:]([SBHSimpleApplication alloc], "initWithBundleIdentifier:", v4);
    if (v6)
    {
      self = -[SBHApplicationIcon initWithApplication:](self, "initWithApplication:", v6);
      v5 = self;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (SBHApplicationIcon)initWithLeafIdentifier:(id)a3 applicationPlaceholder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SBHApplicationIcon *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "applicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](self, "initWithLeafIdentifier:applicationBundleID:", v7, v8);

  if (v9)
    -[SBLeafIcon addIconDataSource:](v9, "addIconDataSource:", v6);

  return v9;
}

- (SBHApplicationIcon)initWithApplicationPlaceholder:(id)a3
{
  id v4;
  void *v5;
  SBHApplicationIcon *v6;
  SBHApplicationIcon *v7;

  v4 = a3;
  objc_msgSend(v4, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](self, "initWithLeafIdentifier:applicationBundleID:", v5, v5);
  v7 = v6;
  if (v6)
    -[SBLeafIcon addIconDataSource:](v6, "addIconDataSource:", v4);

  return v7;
}

- (void)removeApplicationDataSources
{
  -[SBLeafIcon removeIconDataSourcesPassingTest:](self, "removeIconDataSourcesPassingTest:", &__block_literal_global_41);
}

uint64_t __50__SBHApplicationIcon_removeApplicationDataSources__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_opt_respondsToSelector() & (v2 != 0);

  return v3;
}

- (void)removeApplicationPlaceholderDataSources
{
  -[SBLeafIcon removeIconDataSourcesPassingTest:](self, "removeIconDataSourcesPassingTest:", &__block_literal_global_3_1);
}

uint64_t __61__SBHApplicationIcon_removeApplicationPlaceholderDataSources__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_opt_respondsToSelector() & (v2 != 0);

  return v3;
}

- (void)replaceIconDataSourcesWithApplication:(id)a3
{
  id v4;

  v4 = a3;
  -[SBLeafIcon removeAllIconDataSources](self, "removeAllIconDataSources");
  -[SBHApplicationIcon addApplicationDataSource:](self, "addApplicationDataSource:", v4);

}

- (void)replaceIconDataSourcesWithApplicationPlaceholder:(id)a3
{
  id v4;

  v4 = a3;
  -[SBLeafIcon removeAllIconDataSources](self, "removeAllIconDataSources");
  -[SBLeafIcon addIconDataSource:](self, "addIconDataSource:", v4);

}

- (BOOL)prioritizeDownload
{
  void *v2;
  char v3;

  -[SBHApplicationIcon applicationPlaceholder](self, "applicationPlaceholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "prioritize");
  else
    v3 = 0;

  return v3;
}

- (BOOL)pauseDownload
{
  void *v2;
  char v3;

  -[SBHApplicationIcon applicationPlaceholder](self, "applicationPlaceholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "pause");
  else
    v3 = 0;

  return v3;
}

- (BOOL)resumeDownload
{
  void *v2;
  char v3;

  -[SBHApplicationIcon applicationPlaceholder](self, "applicationPlaceholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "resume");
  else
    v3 = 0;

  return v3;
}

- (BOOL)cancelDownload
{
  void *v2;
  char v3;

  -[SBHApplicationIcon applicationPlaceholder](self, "applicationPlaceholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "cancel");
  else
    v3 = 0;

  return v3;
}

- (void)changeLockedStatusToLocked:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[SBHApplicationIcon changeEnablement:ofFeature:](self, "changeEnablement:ofFeature:", v3, 1);
}

- (void)changeHiddenStatusToHidden:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[SBHApplicationIcon changeEnablement:ofFeature:](self, "changeEnablement:ofFeature:", v3, 2);
}

- (void)changeEnablement:(unint64_t)a3 ofFeature:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;
  unint64_t v12;

  -[SBLeafIcon applicationBundleID](self, "applicationBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CF96D8];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__SBHApplicationIcon_changeEnablement_ofFeature___block_invoke;
    v9[3] = &unk_1E8D892E0;
    v10 = v6;
    v11 = a4;
    v12 = a3;
    objc_msgSend(v8, "oneshotBeginFlowToSetEnablement:ofFeature:forSubject:completion:", a3, a4, v7, v9);

  }
}

void __49__SBHApplicationIcon_changeEnablement_ofFeature___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    SBLogProtectedApps();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __49__SBHApplicationIcon_changeEnablement_ofFeature___block_invoke_cold_1(a1, (uint64_t)v5, v6);

  }
}

- (NSString)applicationDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHApplicationIcon applicationPlaceholder](self, "applicationPlaceholder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "applicationDisplayName");
  else
    -[SBIcon displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)noteExternalApplicationPlaceholderStateChange
{
  -[SBLeafIcon _noteActiveDataSourceDidChangeAndReloadIcon:](self, "_noteActiveDataSourceDidChangeAndReloadIcon:", 0);
}

- (void)setBadge:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBHApplicationIcon application](self, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setBadgeValue:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHApplicationIcon;
  v4 = -[SBLeafIcon copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setUninstalledByUser:", -[SBHApplicationIcon isUninstalledByUser](self, "isUninstalledByUser"));
  return v4;
}

- (id)copyWithLeafIdentifier:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHApplicationIcon;
  v4 = -[SBLeafIcon copyWithLeafIdentifier:](&v6, sel_copyWithLeafIdentifier_, a3);
  objc_msgSend(v4, "setUninstalledByUser:", -[SBHApplicationIcon isUninstalledByUser](self, "isUninstalledByUser"));
  return v4;
}

- (id)automationID
{
  void *v2;
  void *v3;

  -[SBLeafIcon applicationBundleID](self, "applicationBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("BTN "), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isUninstalledByUser
{
  return self->_uninstalledByUser;
}

- (void)setUninstalledByUser:(BOOL)a3
{
  self->_uninstalledByUser = a3;
}

void __49__SBHApplicationIcon_changeEnablement_ofFeature___block_invoke_cold_1(_QWORD *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = 138413058;
  v7 = v3;
  v8 = 2048;
  v9 = v4;
  v10 = 2048;
  v11 = v5;
  v12 = 2114;
  v13 = a2;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Failed to change enablement status of application: %@ feature %llu to %llu with error: %{public}@", (uint8_t *)&v6, 0x2Au);
}

@end
