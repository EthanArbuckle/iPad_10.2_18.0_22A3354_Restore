@implementation SBHProxiedApplicationPlaceholder

- (BOOL)canBeShared
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  int v10;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, 0);

  if (v5)
  {
    objc_msgSend(v5, "typeForInstallMachinery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iTunesMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "storeItemIdentifier");

    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA5830]))
      v9 = v8 == 0;
    else
      v9 = 1;
    if (v9)
      LOBYTE(v10) = 0;
    else
      v10 = objc_msgSend(v5, "isBeta") ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (SBHProxiedApplicationPlaceholder)initWithPlaceholderProxy:(id)a3
{
  id v5;
  SBHProxiedApplicationPlaceholder *v6;
  SBHProxiedApplicationPlaceholder *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSNumber *applicationItemID;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBHProxiedApplicationPlaceholder;
  v6 = -[SBHProxiedApplicationPlaceholder init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placeholderProxy, a3);
    -[FBSApplicationPlaceholder addObserver:](v7->_placeholderProxy, "addObserver:", v7);
    v8 = objc_alloc(MEMORY[0x1E0CA5870]);
    objc_msgSend(v5, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:allowPlaceholder:error:", v9, 1, 0);

    if (v10)
    {
      objc_msgSend(v10, "iTunesMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "storeItemIdentifier");

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        applicationItemID = v7->_applicationItemID;
        v7->_applicationItemID = (NSNumber *)v13;

      }
      objc_msgSend(v10, "appClipMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_appClip = v15 != 0;

    }
    -[SBHProxiedApplicationPlaceholder placeholderDidChangeSignificantly:](v7, "placeholderDidChangeSignificantly:", v5);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBHProxiedApplicationPlaceholder;
  -[SBHProxiedApplicationPlaceholder dealloc](&v2, sel_dealloc);
}

- (NSString)applicationBundleID
{
  return (NSString *)-[FBSApplicationPlaceholder bundleIdentifier](self->_placeholderProxy, "bundleIdentifier");
}

- (NSString)applicationBundleIdentifier
{
  return (NSString *)-[FBSApplicationPlaceholder bundleIdentifier](self->_placeholderProxy, "bundleIdentifier");
}

- (NSString)applicationDisplayName
{
  return (NSString *)-[FBSApplicationPlaceholder displayName](self->_placeholderProxy, "displayName");
}

- (unint64_t)installType
{
  return -[FBSApplicationPlaceholder installType](self->_placeholderProxy, "installType");
}

- (unint64_t)_expectedFinalInstallPhase
{
  return -[FBSApplicationPlaceholder expectedFinalInstallPhase](self->_placeholderProxy, "expectedFinalInstallPhase");
}

- (BOOL)isDone
{
  void *v2;
  BOOL v3;

  -[FBSApplicationPlaceholder progress](self->_placeholderProxy, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 6;

  return v3;
}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  -[FBSApplicationPlaceholder progress](self->_placeholderProxy, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") != 0;

  return v3;
}

- (BOOL)isWaiting
{
  void *v2;
  BOOL v3;

  -[FBSApplicationPlaceholder progress](self->_placeholderProxy, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 3;

  return v3;
}

- (BOOL)isPaused
{
  void *v2;
  BOOL v3;

  -[FBSApplicationPlaceholder progress](self->_placeholderProxy, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 2;

  return v3;
}

- (BOOL)isFailed
{
  void *v2;
  BOOL v3;

  -[FBSApplicationPlaceholder progress](self->_placeholderProxy, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 1;

  return v3;
}

- (BOOL)isDownloading
{
  void *v2;
  BOOL v3;

  -[FBSApplicationPlaceholder progress](self->_placeholderProxy, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 4;

  return v3;
}

- (BOOL)isInstalling
{
  void *v2;
  BOOL v3;

  -[FBSApplicationPlaceholder progress](self->_placeholderProxy, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 5;

  return v3;
}

- (BOOL)isPrioritizable
{
  return -[FBSApplicationPlaceholder isPrioritizable](self->_placeholderProxy, "isPrioritizable");
}

- (BOOL)isPausable
{
  id WeakRetained;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained && !objc_msgSend(WeakRetained, "placeholderShouldAllowPausing:", self))
    v5 = 0;
  else
    v5 = -[FBSApplicationPlaceholder isPausable](self->_placeholderProxy, "isPausable");

  return v5;
}

- (BOOL)isCancelable
{
  return -[FBSApplicationPlaceholder isCancellable](self->_placeholderProxy, "isCancellable");
}

- (BOOL)isCloudDemoted
{
  -[SBHProxiedApplicationPlaceholder installType](self, "installType");
  return FBSInstallTypeIsCloudDemoted();
}

- (BOOL)isStoreDownload
{
  return -[SBHProxiedApplicationPlaceholder installType](self, "installType") == 1;
}

- (BOOL)isNewAppInstallFromStore
{
  id WeakRetained;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = objc_msgSend(WeakRetained, "placeholderRepresentsNewAppInstallFromStore:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)prioritize
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogAppPlaceholder();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "PRIORITIZE: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return -[FBSApplicationPlaceholder prioritizeWithResult:](self->_placeholderProxy, "prioritizeWithResult:", 0);
}

- (BOOL)cancel
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogAppPlaceholder();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "CANCEL: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return -[FBSApplicationPlaceholder cancelWithResult:](self->_placeholderProxy, "cancelWithResult:", 0);
}

- (BOOL)pause
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogAppPlaceholder();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "PAUSE: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return -[FBSApplicationPlaceholder pauseWithResult:](self->_placeholderProxy, "pauseWithResult:", 0);
}

- (BOOL)resume
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogAppPlaceholder();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "RESUME: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return -[FBSApplicationPlaceholder resumeWithResult:](self->_placeholderProxy, "resumeWithResult:", 0);
}

- (void)_progressChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  SBHProxiedApplicationPlaceholder *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogAppPlaceholder();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Updated progress: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("SBLeafIconDataSourceDidChangeNotification"), self, 0);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBHProxiedApplicationPlaceholder placeholderProxy](self, "placeholderProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeholderProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)-[SBHProxiedApplicationPlaceholder descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (void)invalidate
{
  id v3;

  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[FBSApplicationPlaceholder removeObserver:](self->_placeholderProxy, "removeObserver:", self);
    objc_storeWeak((id *)&self->_delegate, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBLeafIconDataSourceDidInvalidateNotification"), self);

  }
}

- (void)placeholderProgressDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBHProxiedApplicationPlaceholder_placeholderProgressDidUpdate___block_invoke;
  v6[3] = &unk_1E8D84EF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __65__SBHProxiedApplicationPlaceholder_placeholderProgressDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 8) && *(_QWORD *)(result + 16) == *(_QWORD *)(a1 + 40))
    return objc_msgSend((id)result, "_progressChanged");
  return result;
}

- (void)placeholderDidChangeSignificantly:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__SBHProxiedApplicationPlaceholder_placeholderDidChangeSignificantly___block_invoke;
  v6[3] = &unk_1E8D84EF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __70__SBHProxiedApplicationPlaceholder_placeholderDidChangeSignificantly___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 8) && *(_QWORD *)(result + 16) == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend((id)result, "_progressChanged");
    return objc_msgSend(*(id *)(a1 + 32), "_reloadThumbnailImage");
  }
  return result;
}

- (void)_reloadThumbnailImage
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogAppPlaceholder();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_INFO, "Reloading thumbnail image for placeholder: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("SBLeafIconDataSourceDidGenerateImageNotification"), self);

}

- (id)icon:(id)a3 statusDescriptionForLocation:(id)a4
{
  void *v5;
  void *v7;
  void *v8;
  const __CFString *v9;

  if (!-[SBHProxiedApplicationPlaceholder isActive](self, "isActive", a3, a4)
    || -[SBHProxiedApplicationPlaceholder isFailed](self, "isFailed")
    || -[SBHProxiedApplicationPlaceholder isDone](self, "isDone"))
  {
    v5 = 0;
  }
  else
  {
    if (-[SBHProxiedApplicationPlaceholder isPaused](self, "isPaused"))
    {
      SBHBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("PAUSED_ICON_LABEL");
    }
    else if (-[SBHProxiedApplicationPlaceholder isWaiting](self, "isWaiting"))
    {
      SBHBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("WAITING_ICON_LABEL");
    }
    else if (-[SBHProxiedApplicationPlaceholder isInstalling](self, "isInstalling")
           && -[SBHProxiedApplicationPlaceholder _expectedFinalInstallPhase](self, "_expectedFinalInstallPhase") != 4)
    {
      SBHBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("INSTALLING_ICON_LABEL");
    }
    else
    {
      SBHBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("DOWNLOADING_ICON_LABEL");
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 2;
}

- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3
{
  return 1;
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
  -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImageWithTraitCollection(v15, (uint64_t)v14, v9, v12, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)iconCanTruncateLabel:(id)a3
{
  return 1;
}

- (BOOL)iconCanTightenLabel:(id)a3
{
  return 1;
}

- (int64_t)progressStateForIcon:(id)a3
{
  int64_t v4;
  void *v5;
  double v6;
  double v7;

  v4 = -[SBHProxiedApplicationPlaceholder isCloudDemoted](self, "isCloudDemoted", a3) ^ 1;
  if (!-[SBHProxiedApplicationPlaceholder isFailed](self, "isFailed"))
  {
    if (-[SBHProxiedApplicationPlaceholder isActive](self, "isActive"))
    {
      -[FBSApplicationPlaceholder progress](self->_placeholderProxy, "progress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "percentComplete");
      v7 = v6;

      if (v7 > 2.22044605e-16)
        return 2;
    }
  }
  return v4;
}

- (double)progressPercentForIcon:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[FBSApplicationPlaceholder progress](self->_placeholderProxy, "progress", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "percentComplete");
  v5 = v4;

  return v5;
}

- (int64_t)accessoryTypeForIcon:(id)a3
{
  return 0;
}

- (id)badgeNumberOrStringForIcon:(id)a3
{
  return 0;
}

- (id)formattedAccessoryStringForIcon:(id)a3
{
  return 0;
}

- (int64_t)labelAccessoryTypeForIcon:(id)a3
{
  if (-[SBHProxiedApplicationPlaceholder isCloudDemoted](self, "isCloudDemoted", a3))
    return 3;
  else
    return 0;
}

- (BOOL)iconSupportsUninstall:(id)a3
{
  return !-[SBHProxiedApplicationPlaceholder isDone](self, "isDone", a3)
      && -[SBHProxiedApplicationPlaceholder isCancelable](self, "isCancelable");
}

- (BOOL)iconCompleteUninstall:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isApplicationIcon") && objc_msgSend(v4, "isUninstalledByUser"))
  {
    -[SBHProxiedApplicationPlaceholder delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeholderWantsUninstall:", self);

  }
  return 1;
}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  NSObject *v7;

  if (-[SBHProxiedApplicationPlaceholder isPaused](self, "isPaused", a3, a4, a5))
  {
    if (-[SBHProxiedApplicationPlaceholder resume](self, "resume"))
      return 1;
  }
  else if (-[SBHProxiedApplicationPlaceholder isPausable](self, "isPausable")
         && -[SBHProxiedApplicationPlaceholder pause](self, "pause"))
  {
    return 1;
  }
  if (-[SBHProxiedApplicationPlaceholder prioritize](self, "prioritize"))
    return 1;
  SBLogAppPlaceholder();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[SBHProxiedApplicationPlaceholder icon:launchFromLocation:context:].cold.1(self, v7);

  return 0;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHProxiedApplicationPlaceholder descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHProxiedApplicationPlaceholder applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("bundleIdentifier"));

  -[SBHProxiedApplicationPlaceholder applicationDisplayName](self, "applicationDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("displayName"));

  -[FBSApplicationPlaceholder progress](self->_placeholderProxy, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "percentComplete");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%.0f%%"), v12 * 100.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v4, "appendObject:withName:", v13, CFSTR("progress"));

    objc_msgSend(v10, "state");
    NSStringFromFBSApplicationPlaceholderProgressState();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v4, "appendObject:withName:", v15, CFSTR("state"));

  }
  v17 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHProxiedApplicationPlaceholder isPausable](self, "isPausable"), CFSTR("canPause?"), 1);
  v18 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHProxiedApplicationPlaceholder isPrioritizable](self, "isPrioritizable"), CFSTR("canPromote?"), 1);
  v19 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHProxiedApplicationPlaceholder isCancelable](self, "isCancelable"), CFSTR("canCancel?"), 1);

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHProxiedApplicationPlaceholder succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (FBSApplicationPlaceholder)placeholderProxy
{
  return self->_placeholderProxy;
}

- (SBHProxiedApplicationPlaceholderDelegate)delegate
{
  return (SBHProxiedApplicationPlaceholderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNumber)applicationItemID
{
  return self->_applicationItemID;
}

- (BOOL)isAppClip
{
  return self->_appClip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationItemID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderProxy, 0);
}

- (void)icon:(void *)a1 launchFromLocation:(NSObject *)a2 context:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "applicationBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "All action attempts failed for placeholder: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
