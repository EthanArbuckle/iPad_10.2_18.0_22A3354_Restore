@implementation PXNavigationListGadgetProvider

- (PXNavigationListGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListGadgetProvider.m"), 58, CFSTR("%s is not available as initializer"), "-[PXNavigationListGadgetProvider init]");

  abort();
}

- (PXNavigationListGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListGadgetProvider.m"), 62, CFSTR("%s is not available as initializer"), "-[PXNavigationListGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXNavigationListGadgetProvider)initWithType:(unint64_t)a3 extendedTraitCollection:(id)a4 isPresentedInPicker:(BOOL)a5 isLimitedLibraryPicker:(BOOL)a6 assetsFilterPredicate:(id)a7 excludesHiddenAlbum:(BOOL)a8 photoLibrary:(id)a9
{
  id v16;
  void *v17;
  PXNavigationListGadgetProvider *v18;
  uint64_t v19;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  id v22;
  id v23;
  objc_super v24;

  v23 = a4;
  v22 = a7;
  v16 = a9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), objc_opt_class(), a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)PXNavigationListGadgetProvider;
  v18 = -[PXGadgetProvider initWithIdentifier:](&v24, sel_initWithIdentifier_, v17);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_photoLibrary, a9);
    v18->_type = a3;
    objc_storeStrong((id *)&v18->_traitCollection, a4);
    v18->_isPresentedInPicker = a5;
    v18->_isLimitedLibraryPicker = a5 && a6;
    v18->_excludesHiddenAlbum = a8;
    objc_storeStrong((id *)&v18->_assetsFilterPredicate, a7);
    -[PXExtendedTraitCollection registerChangeObserver:context:](v18->_traitCollection, "registerChangeObserver:context:", v18, PXNavigationListGadgetProviderTraitCollectionContext);
    if (a3 == 1)
    {
      PXRegisterPreferencesObserver(v18);
      +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v16);
      v19 = objc_claimAutoreleasedReturnValue();
      sharedLibraryStatusProvider = v18->_sharedLibraryStatusProvider;
      v18->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v19;

      -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v18->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v18, PXNavigationListGadgetProviderSharedLibraryContext);
    }
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  if (-[PXNavigationListGadgetProvider type](self, "type") == 1)
    PXUnregisterPreferencesObserver(self);
  v3.receiver = self;
  v3.super_class = (Class)PXNavigationListGadgetProvider;
  -[PXNavigationListGadgetProvider dealloc](&v3, sel_dealloc);
}

- (unint64_t)estimatedNumberOfGadgets
{
  return 1;
}

- (void)generateGadgets
{
  -[PXNavigationListGadgetProvider _initializeDataSourceManagerIfNeeded](self, "_initializeDataSourceManagerIfNeeded");
  -[PXNavigationListGadgetProvider _updateGadgets](self, "_updateGadgets");
}

- (void)startLoadingRemainingData
{
  void *v3;

  -[PXNavigationListGadgetProvider dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startBackgroundFetchingIfNeeded");

  -[PXNavigationListGadgetProvider setBackgroundFetchingIsActive:](self, "setBackgroundFetchingIsActive:", 1);
}

- (void)pauseLoadingRemainingData
{
  void *v3;

  -[PXNavigationListGadgetProvider dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pauseBackgroundFetching");

  -[PXNavigationListGadgetProvider setBackgroundFetchingIsActive:](self, "setBackgroundFetchingIsActive:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXNavigationListGadgetProviderTraitCollectionContext == a5)
  {
    if ((v6 & 2) == 0)
      goto LABEL_11;
    goto LABEL_9;
  }
  if ((void *)PXNavigationListGadgetProviderDataSourceManagerContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    v11 = v9;
    -[PXNavigationListGadgetProvider _updateGadgets](self, "_updateGadgets");
    goto LABEL_10;
  }
  if ((void *)PXNavigationListGadgetProviderSharedLibraryContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListGadgetProvider.m"), 139, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 3) != 0)
  {
    v11 = v9;
    -[PXNavigationListGadgetProvider _resetGadgets](self, "_resetGadgets");
LABEL_10:
    v9 = v11;
  }
LABEL_11:

}

- (void)preferencesDidChange
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  -[PXNavigationListGadgetProvider hiddenAlbumVisibleCache](self, "hiddenAlbumVisibleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  if (v3)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
    v5 = v4 ^ -[PXNavigationListGadgetProvider _shouldHiddenAlbumBeVisible](self, "_shouldHiddenAlbumBeVisible");
  }
  else
  {
    v5 = 0;
  }
  -[PXNavigationListGadgetProvider contentPrivacyEnabledCache](self, "contentPrivacyEnabledCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v8 = objc_msgSend(v6, "BOOLValue");
  if (((v8 ^ -[PXNavigationListGadgetProvider _isContentPrivacyEnabled](self, "_isContentPrivacyEnabled") | v5) & 1) != 0)
LABEL_6:
    -[PXNavigationListGadgetProvider _resetGadgets](self, "_resetGadgets");
LABEL_7:

}

- (void)_updateGadgets
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  PXNavigationListGadget *v10;
  void *v11;
  PXNavigationListGadget *v12;
  PXNavigationListGadget *v13;
  _QWORD v14[4];
  PXNavigationListGadget *v15;

  if (!-[PXNavigationListGadgetProvider shouldShowNavigationListForDeviceAndLayoutClass](self, "shouldShowNavigationListForDeviceAndLayoutClass"))goto LABEL_3;
  -[PXNavigationListGadgetProvider dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXNavigationListGadgetProvider _initializeDataSourceManagerIfNeeded](self, "_initializeDataSourceManagerIfNeeded");
  -[PXNavigationListGadgetProvider dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDataSectionEmpty");

  if ((v5 & 1) == 0)
  {
    if (!v3
      || (-[PXGadgetProvider gadgets](self, "gadgets"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          !v9))
    {
      v10 = [PXNavigationListGadget alloc];
      -[PXNavigationListGadgetProvider dataSourceManager](self, "dataSourceManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PXNavigationListController initWithDataSectionManager:](v10, "initWithDataSectionManager:", v11);

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __48__PXNavigationListGadgetProvider__updateGadgets__block_invoke;
      v14[3] = &unk_1E5145360;
      v15 = v12;
      v13 = v12;
      -[PXGadgetProvider performChanges:](self, "performChanges:", v14);

    }
  }
  else
  {
LABEL_3:
    -[PXGadgetProvider gadgets](self, "gadgets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      -[PXGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_213236);
  }
}

- (BOOL)shouldShowNavigationListForDeviceAndLayoutClass
{
  void *v3;
  BOOL v4;

  -[PXNavigationListGadgetProvider traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutSizeClass") == 1
    || -[PXNavigationListGadgetProvider shouldShowNavigationListOnIpad](self, "shouldShowNavigationListOnIpad");

  return v4;
}

- (void)_initializeDataSourceManagerIfNeeded
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  _BOOL4 v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  PXNavigationListDataSectionManager *v19;
  id v20;

  if (-[PXNavigationListGadgetProvider shouldShowNavigationListForDeviceAndLayoutClass](self, "shouldShowNavigationListForDeviceAndLayoutClass"))
  {
    -[PXNavigationListGadgetProvider dataSourceManager](self, "dataSourceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = -[PXNavigationListGadgetProvider type](self, "type");
      if (v4 == 1)
      {
        v8 = -[PXNavigationListGadgetProvider isPresentedInPicker](self, "isPresentedInPicker");
        if (v8)
        {
          +[PXContentPrivacySettings sharedInstance](PXContentPrivacySettings, "sharedInstance");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "contentPrivacyEnabled");
          if (-[PXNavigationListGadgetProvider isLimitedLibraryPicker](self, "isLimitedLibraryPicker")
            && (v10 & 1) != 0)
          {
            v11 = 0;
          }
          else
          {
            v11 = -[PXNavigationListGadgetProvider excludesHiddenAlbum](self, "excludesHiddenAlbum") ^ 1;
          }

        }
        else
        {
          v11 = 1;
        }
        objc_msgSend(MEMORY[0x1E0CD14E0], "px_otherAlbumsCollectionListIncludeDeleted:includeHidden:includeDuplicates:", !v8, v11, !v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXNavigationListDataSectionConfiguration configurationWithCollectionList:](PXNavigationListDataSectionConfiguration, "configurationWithCollectionList:", v12);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setEmptyCollectionsHidden:", -[PXNavigationListGadgetProvider isPresentedInPicker](self, "isPresentedInPicker"));
        v13 = -[PXNavigationListGadgetProvider _shouldHiddenAlbumBeVisible](self, "_shouldHiddenAlbumBeVisible");
        v14 = v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXNavigationListGadgetProvider setHiddenAlbumVisibleCache:](self, "setHiddenAlbumVisibleCache:", v15);

        objc_msgSend(v20, "setHideHiddenAlbum:", !v14);
        v16 = -[PXNavigationListGadgetProvider _isContentPrivacyEnabled](self, "_isContentPrivacyEnabled");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXNavigationListGadgetProvider setContentPrivacyEnabledCache:](self, "setContentPrivacyEnabledCache:", v17);

      }
      else if (v4)
      {
        v20 = 0;
      }
      else
      {
        -[PXNavigationListGadgetProvider photoLibrary](self, "photoLibrary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "px_virtualCollections");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mediaTypesCollectionList");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXNavigationListDataSectionConfiguration configurationWithCollectionList:](PXNavigationListDataSectionConfiguration, "configurationWithCollectionList:", v7);
        v20 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "setEmptyCollectionsHidden:", 1);
      }
      -[PXNavigationListGadgetProvider assetsFilterPredicate](self, "assetsFilterPredicate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAssetsFilterPredicate:", v18);

      if (-[PXNavigationListGadgetProvider isPresentedInPicker](self, "isPresentedInPicker"))
        objc_msgSend(v20, "setSkipSyndicatedAssetFetches:", 1);
      v19 = -[PXNavigationListDataSectionManager initWithConfiguration:]([PXNavigationListDataSectionManager alloc], "initWithConfiguration:", v20);
      -[PXNavigationListDataSectionManager registerChangeObserver:context:](v19, "registerChangeObserver:context:", self, PXNavigationListGadgetProviderDataSourceManagerContext);
      -[PXNavigationListGadgetProvider setDataSourceManager:](self, "setDataSourceManager:", v19);

    }
  }
}

- (BOOL)_shouldHiddenAlbumBeVisible
{
  int AppBooleanValue;
  BOOL result;
  BOOL v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("HiddenAlbumVisible"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  result = 0;
  if (keyExistsAndHasValidFormat)
    v5 = AppBooleanValue == 0;
  else
    v5 = 0;
  if (!v5)
  {
    if (-[PXNavigationListGadgetProvider isLimitedLibraryPicker](self, "isLimitedLibraryPicker"))
      return 0;
    else
      return !-[PXNavigationListGadgetProvider excludesHiddenAlbum](self, "excludesHiddenAlbum");
  }
  return result;
}

- (void)_resetGadgets
{
  id v3;

  -[PXNavigationListGadgetProvider setDataSourceManager:](self, "setDataSourceManager:", 0);
  -[PXNavigationListGadgetProvider _updateGadgets](self, "_updateGadgets");
  if (-[PXNavigationListGadgetProvider backgroundFetchingIsActive](self, "backgroundFetchingIsActive"))
  {
    -[PXNavigationListGadgetProvider dataSourceManager](self, "dataSourceManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startBackgroundFetchingIfNeeded");

  }
}

- (BOOL)shouldShowNavigationListOnIpad
{
  return self->_shouldShowNavigationListOnIpad;
}

- (void)setShouldShowNavigationListOnIpad:(BOOL)a3
{
  self->_shouldShowNavigationListOnIpad = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (unint64_t)type
{
  return self->_type;
}

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (PXNavigationListDataSectionManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (BOOL)isPresentedInPicker
{
  return self->_isPresentedInPicker;
}

- (BOOL)isLimitedLibraryPicker
{
  return self->_isLimitedLibraryPicker;
}

- (BOOL)excludesHiddenAlbum
{
  return self->_excludesHiddenAlbum;
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (NSNumber)hiddenAlbumVisibleCache
{
  return self->_hiddenAlbumVisibleCache;
}

- (void)setHiddenAlbumVisibleCache:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenAlbumVisibleCache, a3);
}

- (NSNumber)contentPrivacyEnabledCache
{
  return self->_contentPrivacyEnabledCache;
}

- (void)setContentPrivacyEnabledCache:(id)a3
{
  objc_storeStrong((id *)&self->_contentPrivacyEnabledCache, a3);
}

- (BOOL)backgroundFetchingIsActive
{
  return self->_backgroundFetchingIsActive;
}

- (void)setBackgroundFetchingIsActive:(BOOL)a3
{
  self->_backgroundFetchingIsActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPrivacyEnabledCache, 0);
  objc_storeStrong((id *)&self->_hiddenAlbumVisibleCache, 0);
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
}

void __48__PXNavigationListGadgetProvider__updateGadgets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "removeAllGadgets");
  v5[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4);

}

uint64_t __48__PXNavigationListGadgetProvider__updateGadgets__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

@end
