@implementation SBIconModel

- (BOOL)isIconVisible:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBIconModel;
    if (-[SBHIconModel isIconVisible:](&v10, sel_isIconVisible_, v4))
    {
      if (!objc_msgSend(v4, "isBookmarkIcon")
        || (-[SBHIconModel hiddenIconTags](self, "hiddenIconTags"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.webapp")),
            v5,
            !v6))
      {
        v8 = 1;
        goto LABEL_10;
      }
      SBLogIcon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v4;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Icon is not visible: %{public}@ / WebAppBundle", buf, 0xCu);
      }

    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)applicationIconForBundleIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconModel;
  -[SBHIconModel applicationIconForBundleIdentifier:](&v4, sel_applicationIconForBundleIdentifier_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)adjustIconsToShow:(id)a3 iconsToHide:(id)a4 afterChangeToVisibleIconTags:(id)a5 hiddenIconTags:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)SBIconModel;
  -[SBHIconModel adjustIconsToShow:iconsToHide:afterChangeToVisibleIconTags:hiddenIconTags:](&v28, sel_adjustIconsToShow_iconsToHide_afterChangeToVisibleIconTags_hiddenIconTags_, v10, v11, v12, v13);
  if (!self->_createsIconsForInternalApps
    && objc_msgSend(v12, "containsObject:", CFSTR("SBInternalAppTag")))
  {
    v23 = v11;
    self->_createsIconsForInternalApps = 1;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[SBHIconModel applicationDataSource](self, "applicationDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allApplicationsForIconModel:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v19);
          v21 = (void *)MEMORY[0x1D17E5334]();
          if (objc_msgSend(v20, "isInternalApplication"))
          {
            -[SBIconModel addApplication:](self, "addApplication:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[SBIconModel isIconVisible:](self, "isIconVisible:", v22))
              objc_msgSend(v10, "addObject:", v22);

          }
          objc_autoreleasePoolPop(v21);
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v17);
    }

    v11 = v23;
  }

}

- (id)bookmarkIconForWebClipIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconModel;
  -[SBHIconModel bookmarkIconForWebClipIdentifier:](&v4, sel_bookmarkIconForWebClipIdentifier_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)bookmarkIconClass
{
  return (Class)objc_opt_self();
}

+ (Class)bookmarkClass
{
  return (Class)objc_opt_self();
}

- (id)addBookmarkIconForWebClip:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconModel;
  -[SBHIconModel addBookmarkIconForWebClip:](&v4, sel_addBookmarkIconForWebClip_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)applicationIconClass
{
  return (Class)objc_opt_self();
}

- (id)addApplication:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconModel;
  -[SBHIconModel addApplication:](&v4, sel_addApplication_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldAvoidCreatingIconForApplication:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBIconModel;
  v5 = -[SBHIconModel shouldAvoidCreatingIconForApplication:](&v12, sel_shouldAvoidCreatingIconForApplication_, v4);
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  if ((v5 & 1) != 0)
    goto LABEL_5;
  if (self->_createsIconsForInternalApps)
    goto LABEL_11;
  objc_msgSend(v7, "tags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", CFSTR("SBInternalAppTag")) & 1) == 0)
  {

    goto LABEL_11;
  }
  v10 = objc_msgSend(v7, "visibilityOverride");

  if (v10)
  {
LABEL_11:
    v8 = objc_msgSend(v7, "hasHiddenTag");
    goto LABEL_12;
  }
LABEL_5:
  v8 = 1;
LABEL_12:

  return v8;
}

- (void)loadAllIcons
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBIconModel;
  -[SBHIconModel loadAllIcons](&v3, sel_loadAllIcons);
  self->_iconsHaveBeenLoadedOnce = 1;
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBHIconModel applicationDataSource](self, "applicationDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconModel:applicationWithBundleIdentifier:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)indexPathForIconInPlatformState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSystemApplication") && (objc_msgSend(v5, "isRestoringIcon") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconModel;
    -[SBHIconModel indexPathForIconInPlatformState:](&v8, sel_indexPathForIconInPlatformState_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)shouldAvoidPlacingIconOnFirstPage:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isRestoringIcon") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconModel;
    v6 = -[SBHIconModel shouldAvoidPlacingIconOnFirstPage:](&v8, sel_shouldAvoidPlacingIconOnFirstPage_, v4);
  }

  return v6;
}

- (void)_replaceAppIconsWithDownloadingIcons
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SBHIconModel rootFolder](self, "rootFolder", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leafIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "leafIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconModel leafIconForIdentifier:](self, "leafIconForIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12
          && objc_msgSend(v10, "isApplicationIcon")
          && objc_msgSend(v10, "hasApplication"))
        {
          objc_msgSend(v10, "application");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v10, v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
    -[SBIconModel _replaceAppIconsWithDownloadingIcons:](self, "_replaceAppIconsWithDownloadingIcons:", v3);

}

- (void)_replaceAppIconsWithDownloadingIcons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBIconModel *v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SBHIconModel applicationDataSource](self, "applicationDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allApplicationPlaceholdersForIconModel:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v16 = self;
    v17 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "applicationBundleID", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isApplicationIcon")
            && (objc_msgSend(v13, "hasApplicationPlaceholder") & 1) == 0)
          {
            v14 = (void *)MEMORY[0x1E0D4E420];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Added placeholder icon to icon list."));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 1;
            objc_msgSend(v14, "logStep:byParty:phase:success:forBundleID:description:", 3, 10, 3, 1, v12, v15);

            objc_msgSend(v13, "replaceIconDataSourcesWithApplicationPlaceholder:", v11);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);

    if ((v17 & 1) != 0)
      -[SBHIconModel saveIconStateIfNeeded](v16, "saveIconStateIfNeeded");
  }
  else
  {

  }
}

- (void)willLayout
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconModel;
  -[SBHIconModel willLayout](&v7, sel_willLayout);
  -[SBHIconModel rootFolder](self, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEmpty"))
  {

  }
  else
  {
    -[SBHIconModel applicationDataSource](self, "applicationDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allApplicationPlaceholdersForIconModel:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
      -[SBIconModel _replaceAppIconsWithDownloadingIcons](self, "_replaceAppIconsWithDownloadingIcons");
  }
}

+ (id)currentLocaleDidChangeNotificationName
{
  return CFSTR("SBCurrentLocaleDidChangeNotification");
}

- (void)clearDesiredIconStateWithOptions:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconModel;
  -[SBHIconModel clearDesiredIconStateWithOptions:](&v4, sel_clearDesiredIconStateWithOptions_, a3);
  -[SBIconModel setCachedFlattenedForecastedDesiredIconState:](self, "setCachedFlattenedForecastedDesiredIconState:", 0);
}

- (id)forecastedLayoutForIconState:(id)a3 includeMissingIcons:(BOOL)a4
{
  id v6;
  void *v7;
  SBIconModel *v8;
  void *v9;
  SBIconModel *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  if (self->_iconsHaveBeenLoadedOnce)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA608]), "initWithCurrentState:desiredState:", v6, v6);
    v8 = [SBIconModel alloc];
    -[SBHIconModel applicationDataSource](self, "applicationDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBHIconModel initWithStore:applicationDataSource:](v8, "initWithStore:applicationDataSource:", v7, v9);

    -[SBHIconModel delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel setDelegate:](v10, "setDelegate:", v11);

    if (a4)
    {
      +[SBHIconStateArchiver leafIdentifiersFromArchive:](SBIconStateArchiver, "leafIdentifiersFromArchive:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconModel setForecastedLeavesOnIconModel:includingMissingIcons:](self, "setForecastedLeavesOnIconModel:includingMissingIcons:", v10, v12);

    }
    else
    {
      -[SBHIconModel setForecastedLeavesOnIconModel:includingMissingIcons:](self, "setForecastedLeavesOnIconModel:includingMissingIcons:", v10, 0);
    }
    -[SBHIconModel visibleIconTags](self, "visibleIconTags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel hiddenIconTags](self, "hiddenIconTags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel setVisibilityOfIconsWithVisibleTags:hiddenTags:](v10, "setVisibilityOfIconsWithVisibleTags:hiddenTags:", v15, v16);

    -[SBHIconModel layout](v10, "layout");
    -[SBHIconModel iconModelMetadata](self, "iconModelMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBHIconStateArchiver archiveRootFolderInModel:metadata:](SBIconStateArchiver, "archiveRootFolderInModel:metadata:", v10, v17);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SBIconModel forecastedLayoutForIconState:includeMissingIcons:].cold.1(v13);

    v14 = v6;
  }

  return v14;
}

- (id)exportState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  SBIconModel *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  -[SBHIconModel iconModelMetadata](self, "iconModelMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBHIconStateArchiver archiveRootFolderInModel:metadata:](SBIconStateArchiver, "archiveRootFolderInModel:metadata:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconStateArchiver iTunesRepresentationFromRootArchive:preApex:pending:iconSource:](SBIconStateArchiver, "iTunesRepresentationFromRootArchive:preApex:pending:iconSource:", v6, !v3, 0, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "%@: exported state: %@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (id)exportPendingState:(BOOL)a3 includeMissingIcons:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  SBIconModel *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v5 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[SBHIconModel desiredIconState](self, "desiredIconState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SBIconModel forecastedLayoutForIconState:includeMissingIcons:](self, "forecastedLayoutForIconState:includeMissingIcons:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBHIconModel iconModelMetadata](self, "iconModelMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBHIconStateArchiver archiveRootFolderInModel:metadata:](SBIconStateArchiver, "archiveRootFolderInModel:metadata:", self, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[SBIconStateArchiver iTunesRepresentationFromRootArchive:preApex:pending:iconSource:](SBIconStateArchiver, "iTunesRepresentationFromRootArchive:preApex:pending:iconSource:", v8, !v5, v7 != 0, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "%@: exported pending state: %@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (id)exportFlattenedState:(BOOL)a3 includeMissingIcons:(BOOL)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  SBIconModel *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_8;
  v5 = a4;
  if (!-[SBHIconModel hasDesiredIconState](self, "hasDesiredIconState"))
    goto LABEL_8;
  -[SBIconModel cachedFlattenedForecastedDesiredIconState](self, "cachedFlattenedForecastedDesiredIconState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[SBHIconModel desiredIconState](self, "desiredIconState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconModel forecastedLayoutForIconState:includeMissingIcons:](self, "forecastedLayoutForIconState:includeMissingIcons:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[SBHIconStateArchiver leafIdentifiersFromArchive:](SBIconStateArchiver, "leafIdentifiersFromArchive:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    -[SBIconModel setCachedFlattenedForecastedDesiredIconState:](self, "setCachedFlattenedForecastedDesiredIconState:", v6);

    if (!v6)
    {
LABEL_8:
      -[SBHIconModel iconModelMetadata](self, "iconModelMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBHIconStateArchiver archiveRootFolderInModel:metadata:](SBIconStateArchiver, "archiveRootFolderInModel:metadata:", self, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBHIconStateArchiver leafIdentifiersFromArchive:](SBIconStateArchiver, "leafIdentifiersFromArchive:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "%@: exported flattened icon state: %@", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(v6, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)importState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  int v15;
  SBIconModel *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SBIconStateArchiver rootArchiveFromITunesRepresentation:](SBIconStateArchiver, "rootArchiveFromITunesRepresentation:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBIconStateArchiver modernizeRootArchive:](SBIconStateArchiver, "modernizeRootArchive:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
LABEL_9:
      v13 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_9;
    v6 = v4;
    if (!v6)
      goto LABEL_9;
  }
  -[SBHIconModel iconState](self, "iconState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAA4C0], "iconStateByReplacingTodayListsInIconState:withTodayListsFromIconState:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel importIconState:](self, "importIconState:", v10);
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    -[SBHIconModel desiredIconState](self, "desiredIconState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "%@: icon state imported: %@", (uint8_t *)&v15, 0x16u);

  }
  v13 = 1;
LABEL_10:

  return v13;
}

- (id)modernizeRootArchive:(id)a3
{
  return +[SBIconStateArchiver modernizeRootArchive:](SBIconStateArchiver, "modernizeRootArchive:", a3);
}

+ (id)migratedIdentifierForLeafIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)migratedIdentifierForLeafIdentifier____bundleIDChanges;
  if (!migratedIdentifierForLeafIdentifier____bundleIDChanges)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("com.apple.camera"), CFSTR("com.apple.mobileslideshow-Camera"), CFSTR("com.apple.mobileslideshow"), CFSTR("com.apple.mobileslideshow-Photos"), CFSTR("com.apple.tv"), CFSTR("com.apple.mobileipod-VideoPlayer"), CFSTR("com.apple.Music"), CFSTR("com.apple.mobileipod-MediaPlayer"), CFSTR("com.apple.Music"), CFSTR("com.apple.mobileipod-AudioPlayer"), CFSTR("com.apple.Music"), CFSTR("com.apple.mobileipod"), CFSTR("com.apple.Passbook"), CFSTR("com.apple.Shoebox"), CFSTR("com.apple.tv"), CFSTR("com.apple.videos"), CFSTR("com.apple.shortcuts"),
           CFSTR("is.workflow.my.app"),
           CFSTR("com.apple.findmy"),
           CFSTR("com.apple.mobileme.fmip1"),
           0);
    v6 = (void *)migratedIdentifierForLeafIdentifier____bundleIDChanges;
    migratedIdentifierForLeafIdentifier____bundleIDChanges = v5;

    v4 = (void *)migratedIdentifierForLeafIdentifier____bundleIDChanges;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:](SBWebApplication, "_webClipIdentifierFromWebAppIdentifier:", v3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v3;
    v9 = v12;

  }
  return v9;
}

- (NSOrderedSet)cachedFlattenedForecastedDesiredIconState
{
  return self->_cachedFlattenedForecastedDesiredIconState;
}

- (void)setCachedFlattenedForecastedDesiredIconState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFlattenedForecastedDesiredIconState, 0);
}

- (void)forecastedLayoutForIconState:(os_log_t)log includeMissingIcons:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Icons are not loaded (no _leafIconsByIdentifier) when calling forecastedLayoutForIconState!", v1, 2u);
}

@end
