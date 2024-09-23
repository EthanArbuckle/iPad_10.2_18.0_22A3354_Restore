@implementation PLQuickActionManager

- (PLQuickActionManager)initWithDatabaseContext:(id)a3
{
  id v6;
  PLQuickActionManager *v7;
  uint64_t v8;
  NSOperationQueue *operationQueue;
  id v10;
  void *v11;
  NSOperationQueue *v12;
  uint64_t v13;
  id cameraWellObserver;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PLQuickActionManager;
  v7 = -[PLQuickActionManager init](&v23, sel_init);
  if (v7)
  {
    v8 = objc_opt_new();
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = (NSOperationQueue *)v8;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v7->_operationQueue, "setQualityOfService:", 9);
    objc_storeStrong((id *)&v7->_databaseContext, a3);
    objc_initWeak(&location, v7);
    if (!dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices"), "fileSystemRepresentation"), 4))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLQuickActionManager.m"), 74, CFSTR("No SpringBoardServices!"));

    }
    -[PLQuickActionManager _setSBSApplicationShortcutItemClass:](v7, "_setSBSApplicationShortcutItemClass:", NSClassFromString(CFSTR("SBSApplicationShortcutItem")));
    if (!-[PLQuickActionManager _SBSApplicationShortcutItemClass](v7, "_SBSApplicationShortcutItemClass"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLQuickActionManager.m"), 77, CFSTR("No SBSApplicationShortcutItem"));

    }
    -[PLQuickActionManager _setSBSApplicationShortcutServiceClass:](v7, "_setSBSApplicationShortcutServiceClass:", NSClassFromString(CFSTR("SBSApplicationShortcutService")));
    if (!-[PLQuickActionManager _SBSApplicationShortcutServiceClass](v7, "_SBSApplicationShortcutServiceClass"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLQuickActionManager.m"), 80, CFSTR("No _setSBSApplicationShortcutService"));

    }
    -[PLQuickActionManager _setSBSApplicationShortcutCustomImageIconClass:](v7, "_setSBSApplicationShortcutCustomImageIconClass:", NSClassFromString(CFSTR("SBSApplicationShortcutCustomImageIcon")));
    if (!-[PLQuickActionManager _SBSApplicationShortcutCustomImageIconClass](v7, "_SBSApplicationShortcutCustomImageIconClass"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLQuickActionManager.m"), 83, CFSTR("No SBSApplicationShortcutCustomImageIcon"));

    }
    v10 = objc_alloc_init(-[PLQuickActionManager _SBSApplicationShortcutServiceClass](v7, "_SBSApplicationShortcutServiceClass"));
    -[PLQuickActionManager _setAppShortcutService:](v7, "_setAppShortcutService:", v10);
    +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7->_operationQueue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __48__PLQuickActionManager_initWithDatabaseContext___block_invoke;
    v20[3] = &unk_1E3671BB0;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v11, "observeCameraPreviewWellImageChangeOnQueue:block:", v12, v20);
    v13 = objc_claimAutoreleasedReturnValue();
    cameraWellObserver = v7->_cameraWellObserver;
    v7->_cameraWellObserver = (id)v13;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  id cameraWellObserver;
  objc_super v5;

  -[SBSApplicationShortcutService invalidate](self->__appShortcutService, "invalidate");
  +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCameraPreviewWellImageChangeObserver:", self->_cameraWellObserver);

  cameraWellObserver = self->_cameraWellObserver;
  self->_cameraWellObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)PLQuickActionManager;
  -[PLQuickActionManager dealloc](&v5, sel_dealloc);
}

- (void)cameraPreviewWellImageDidChange
{
  -[PLQuickActionManager _setMostRecentPhotoIsInvalid:](self, "_setMostRecentPhotoIsInvalid:", 1);
  -[PLQuickActionManager buildQuickActionItems](self, "buildQuickActionItems");
}

- (void)buildQuickActionItems
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PLQuickActionManager _cachedMostRecentPhotoData](self, "_cachedMostRecentPhotoData");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        v5 = -[PLQuickActionManager _mostRecentPhotoIsInvalid](self, "_mostRecentPhotoIsInvalid"),
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x1E0D73140], "cameraPreviewWellImageFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v6);
    -[PLQuickActionManager _setCachedMostRecentPhotoData:](self, "_setCachedMostRecentPhotoData:", v7);
    -[PLQuickActionManager _setMostRecentPhotoIsInvalid:](self, "_setMostRecentPhotoIsInvalid:", 0);

  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PLQuickActionManager _userHasPhotos](self, "_userHasPhotos"))
  {
    -[PLQuickActionManager _buildMostRecentPhotoQuickAction](self, "_buildMostRecentPhotoQuickAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v13, "addObject:", v8);

    -[PLQuickActionManager _buildFavoritesQuickAction](self, "_buildFavoritesQuickAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v13, "addObject:", v9);

    -[PLQuickActionManager _buildOneYearAgoQuickAction](self, "_buildOneYearAgoQuickAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v13, "addObject:", v10);

    -[PLQuickActionManager _buildSearchQuickAction](self, "_buildSearchQuickAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v13, "addObject:", v11);

  }
  -[PLQuickActionManager _appShortcutService](self, "_appShortcutService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateDynamicApplicationShortcutItems:forBundleIdentifier:", v13, CFSTR("com.apple.mobileslideshow"));

}

- (id)_buildMostRecentPhotoQuickAction
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(-[PLQuickActionManager _SBSApplicationShortcutItemClass](self, "_SBSApplicationShortcutItemClass"));
  objc_msgSend(v3, "setType:", CFSTR("com.apple.photos.shortcuts.recentphoto"));
  objc_msgSend(v3, "setLocalizedTitle:", CFSTR("MOST_RECENT_PHOTO"));
  v4 = objc_alloc(-[PLQuickActionManager _SBSApplicationShortcutCustomImageIconClass](self, "_SBSApplicationShortcutCustomImageIconClass"));
  -[PLQuickActionManager _cachedMostRecentPhotoData](self, "_cachedMostRecentPhotoData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithImageData:dataType:isTemplate:", v5, 0, 0);

  objc_msgSend(v3, "setIcon:", v6);
  return v3;
}

- (id)_buildOneYearAgoQuickAction
{
  void *v3;
  _BOOL4 v4;
  id v5;

  +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLNLP nlpSearchSupportsLocale:](PLNLP, "nlpSearchSupportsLocale:", v3))
  {
    v4 = -[PLQuickActionManager _userHasPhotosFromLastYear](self, "_userHasPhotosFromLastYear");

    if (!v4)
    {
      v5 = 0;
      return v5;
    }
    v5 = objc_alloc_init(-[PLQuickActionManager _SBSApplicationShortcutItemClass](self, "_SBSApplicationShortcutItemClass"));
    objc_msgSend(v5, "setType:", CFSTR("com.apple.photos.shortcuts.oneyearago"));
    objc_msgSend(v5, "setLocalizedTitle:", CFSTR("ONE_YEAR_AGO"));
    -[PLQuickActionManager _shortcutSystemImageNamed:](self, "_shortcutSystemImageNamed:", CFSTR("clock"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIcon:", v3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_buildFavoritesQuickAction
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(-[PLQuickActionManager _SBSApplicationShortcutItemClass](self, "_SBSApplicationShortcutItemClass"));
  objc_msgSend(v3, "setType:", CFSTR("com.apple.photos.shortcuts.favorites"));
  objc_msgSend(v3, "setLocalizedTitle:", CFSTR("FAVORITES"));
  -[PLQuickActionManager _shortcutSystemImageNamed:](self, "_shortcutSystemImageNamed:", CFSTR("heart"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIcon:", v4);

  return v3;
}

- (id)_buildSearchQuickAction
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(-[PLQuickActionManager _SBSApplicationShortcutItemClass](self, "_SBSApplicationShortcutItemClass"));
  objc_msgSend(v3, "setType:", CFSTR("com.apple.photos.shortcuts.search"));
  objc_msgSend(v3, "setLocalizedTitle:", CFSTR("SEARCH"));
  -[PLQuickActionManager _shortcutSystemImageNamed:](self, "_shortcutSystemImageNamed:", CFSTR("magnifyingglass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIcon:", v4);

  return v3;
}

- (id)_shortcutItemWithType:(id)a3 localizedTitle:(id)a4 iconName:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(-[PLQuickActionManager _SBSApplicationShortcutItemClass](self, "_SBSApplicationShortcutItemClass"));
  objc_msgSend(v11, "setType:", v10);

  objc_msgSend(v11, "setLocalizedTitle:", v9);
  -[PLQuickActionManager _shortcutSystemImageNamed:](self, "_shortcutSystemImageNamed:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setIcon:", v12);
  return v11;
}

- (id)_shortcutSystemImageNamed:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAADB8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSystemImageName:", v4);

  return v5;
}

- (BOOL)_userHasPhotos
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PLDatabaseContext *databaseContext;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFetchLimit:", 1);
  v6 = (void *)MEMORY[0x1E0CB3528];
  +[PLManagedAsset predicateToExcludeTrashedAssets](PLManagedAsset, "predicateToExcludeTrashedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  +[PLManagedAsset predicateToExcludeHiddenAssets](PLManagedAsset, "predicateToExcludeHiddenAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v10);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  databaseContext = self->_databaseContext;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__PLQuickActionManager__userHasPhotos__block_invoke;
  v14[3] = &unk_1E3671BD8;
  v16 = &v17;
  v12 = v5;
  v15 = v12;
  -[PLDatabaseContext performSync:withName:](databaseContext, "performSync:withName:", v14, "-[PLQuickActionManager _userHasPhotos]");
  LOBYTE(v5) = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return (char)v5;
}

- (BOOL)_userHasPhotosFromLastYear
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PLDatabaseContext *databaseContext;
  id v16;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setYear:", -1);
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v4, v19, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setYear:", 0);
  objc_msgSend(v4, "setDay:", -3);
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v4, v5, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDay:", 3);
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", -[PLDatabaseContext wellKnownPhotoLibraryIdentifier](self->_databaseContext, "wellKnownPhotoLibraryIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated >= %@ AND dateCreated <= %@"), v18, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setFetchLimit:", 1);
  objc_msgSend(v14, "setPredicate:", v11);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  databaseContext = self->_databaseContext;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__PLQuickActionManager__userHasPhotosFromLastYear__block_invoke;
  v20[3] = &unk_1E3671BD8;
  v22 = &v23;
  v16 = v14;
  v21 = v16;
  -[PLDatabaseContext performSync:withName:](databaseContext, "performSync:withName:", v20, "-[PLQuickActionManager _userHasPhotosFromLastYear]");
  LOBYTE(self) = *((_BYTE *)v24 + 24) != 0;

  _Block_object_dispose(&v23, 8);
  return (char)self;
}

- (NSData)_cachedMostRecentPhotoData
{
  return self->__cachedMostRecentPhotoData;
}

- (void)_setCachedMostRecentPhotoData:(id)a3
{
  objc_storeStrong((id *)&self->__cachedMostRecentPhotoData, a3);
}

- (BOOL)_mostRecentPhotoIsInvalid
{
  return self->__mostRecentPhotoIsInvalid;
}

- (void)_setMostRecentPhotoIsInvalid:(BOOL)a3
{
  self->__mostRecentPhotoIsInvalid = a3;
}

- (SBSApplicationShortcutService)_appShortcutService
{
  return self->__appShortcutService;
}

- (void)_setAppShortcutService:(id)a3
{
  objc_storeStrong((id *)&self->__appShortcutService, a3);
}

- (Class)_SBSApplicationShortcutServiceClass
{
  return self->__SBSApplicationShortcutServiceClass;
}

- (void)_setSBSApplicationShortcutServiceClass:(Class)a3
{
  objc_storeStrong((id *)&self->__SBSApplicationShortcutServiceClass, a3);
}

- (Class)_SBSApplicationShortcutItemClass
{
  return self->__SBSApplicationShortcutItemClass;
}

- (void)_setSBSApplicationShortcutItemClass:(Class)a3
{
  objc_storeStrong((id *)&self->__SBSApplicationShortcutItemClass, a3);
}

- (Class)_SBSApplicationShortcutCustomImageIconClass
{
  return self->__SBSApplicationShortcutCustomImageIconClass;
}

- (void)_setSBSApplicationShortcutCustomImageIconClass:(Class)a3
{
  objc_storeStrong((id *)&self->__SBSApplicationShortcutCustomImageIconClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__SBSApplicationShortcutCustomImageIconClass, 0);
  objc_storeStrong((id *)&self->__SBSApplicationShortcutItemClass, 0);
  objc_storeStrong((id *)&self->__SBSApplicationShortcutServiceClass, 0);
  objc_storeStrong((id *)&self->__appShortcutService, 0);
  objc_storeStrong((id *)&self->__cachedMostRecentPhotoData, 0);
  objc_storeStrong((id *)&self->_databaseContext, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_cameraWellObserver, 0);
}

void __50__PLQuickActionManager__userHasPhotosFromLastYear__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  BOOL v8;
  char v9;
  id v10;

  objc_msgSend(a2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  v5 = objc_msgSend(v3, "countForFetchRequest:error:", v4, &v10);
  v6 = v10;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  v9 = v8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;

}

void __38__PLQuickActionManager__userHasPhotos__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  BOOL v8;
  char v9;
  id v10;

  objc_msgSend(a2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  v5 = objc_msgSend(v3, "countForFetchRequest:error:", v4, &v10);
  v6 = v10;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  v9 = v8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;

}

void __48__PLQuickActionManager_initWithDatabaseContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cameraPreviewWellImageDidChange");

}

+ (BOOL)shouldShowInternalQuickActions
{
  int v2;
  int AppBooleanValue;
  BOOL v4;
  Boolean keyExistsAndHasValidFormat;

  v2 = MEMORY[0x19AEC04C8](a1, a2);
  if (v2)
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("showInternalQuickActions"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v4 = AppBooleanValue == 0;
    else
      v4 = 0;
    LOBYTE(v2) = !v4;
  }
  return v2;
}

+ (void)setShouldShowInternalQuickActions:(BOOL)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("showInternalQuickActions"), v3, CFSTR("com.apple.mobileslideshow"));

  notify_post("cameraPreviewImageWellChanged");
}

@end
