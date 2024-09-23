@implementation PUHorizontalAlbumListGadgetProvider

- (PUHorizontalAlbumListGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadgetProvider.m"), 56, CFSTR("%s is not available as initializer"), "-[PUHorizontalAlbumListGadgetProvider init]");

  abort();
}

- (PUHorizontalAlbumListGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadgetProvider.m"), 60, CFSTR("%s is not available as initializer"), "-[PUHorizontalAlbumListGadgetProvider initWithIdentifier:]");

  abort();
}

- (PUHorizontalAlbumListGadgetProvider)initWithType:(unint64_t)a3 extendedTraitCollection:(id)a4 sessionInfo:(id)a5 photoLibrary:(id)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  PUHorizontalAlbumListGadgetProvider *v16;
  __CFString *v17;
  uint64_t v18;
  NSString *title;
  void *v20;
  __objc2_class *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  void *v27;
  objc_super v28;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), objc_opt_class(), a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)PUHorizontalAlbumListGadgetProvider;
  v16 = -[PXGadgetProvider initWithIdentifier:](&v28, sel_initWithIdentifier_, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_photoLibrary, a6);
    v16->_type = a3;
    objc_storeStrong((id *)&v16->_traitCollection, a4);
    objc_storeStrong((id *)&v16->_sessionInfo, a5);
    -[PXExtendedTraitCollection registerChangeObserver:context:](v16->_traitCollection, "registerChangeObserver:context:", v16, PUHorizontalAlbumsListGadgetProviderTraitCollectionContext);
    switch(a3)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("PUHorizontalAlbumListGadgetProvider.m"), 102, CFSTR("Invalid PUHorizontalAlbumListType"));

        abort();
      case 1uLL:
      case 6uLL:
        v17 = CFSTR("USER_CREATED_ALBUMS_TITLE");
        goto LABEL_7;
      case 2uLL:
        PULocalizedString(CFSTR("SHARED_ALBUMS_GADGET_HEADER_TITLE"));
        v18 = objc_claimAutoreleasedReturnValue();
        title = v16->_title;
        v16->_title = (NSString *)v18;

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObserver:selector:name:object:", v16, sel__accountStoreDidChange_, *MEMORY[0x1E0D71C28], 0);

        v21 = PUAlbumListSettings;
        goto LABEL_10;
      case 3uLL:
        objc_msgSend(v14, "px_peoplePetsHomeVisibility");
        PXLocalizedStringForPersonOrPetAndVisibility();
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 4uLL:
        v17 = CFSTR("FROM_MY_MAC");
LABEL_7:
        PULocalizedString(v17);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v23 = v16->_title;
        v16->_title = (NSString *)v22;
        goto LABEL_11;
      case 5uLL:
        PULocalizedString(CFSTR("OTHER_ALBUMS_GADGET_HEADER_TITLE"));
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v16->_title;
        v16->_title = (NSString *)v24;

        v21 = (__objc2_class *)MEMORY[0x1E0D7B188];
LABEL_10:
        -[__objc2_class sharedInstance](v21, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addKeyObserver:", v16);
LABEL_11:

        break;
      default:
        break;
    }
  }

  return v16;
}

- (void)loadDataForGadgets
{
  void *v3;
  id v4;

  if (-[PUHorizontalAlbumListGadgetProvider _canProvideGadgets](self, "_canProvideGadgets"))
  {
    v4 = -[PUHorizontalAlbumListGadgetProvider _newConfiguration](self, "_newConfiguration");
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B708]), "initWithConfiguration:", v4);
    objc_msgSend(v3, "registerChangeObserver:context:", self, PUHorizontalAlbumListGadgetProviderDataSourceManagerContext);
    -[PUHorizontalAlbumListGadgetProvider setDataSourceManager:](self, "setDataSourceManager:", v3);

  }
}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v3;
  void *v4;
  unint64_t v5;

  if (!-[PUHorizontalAlbumListGadgetProvider _canProvideGadgets](self, "_canProvideGadgets"))
    return 0;
  -[PUHorizontalAlbumListGadgetProvider dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "numberOfItemsInSection:", 0) != 0;
  return v5;
}

- (void)generateGadgets
{
  void *v3;
  void *v4;
  unint64_t v5;
  PUAlbumsGadgetProvider *v6;
  void *v7;
  void *v8;
  void *v9;
  PUAlbumsGadgetProvider *v10;
  PUHorizontalAlbumListGadget *v11;
  void *v12;
  uint64_t v13;
  PUHorizontalAlbumListGadget *v14;
  _QWORD v15[4];
  PUHorizontalAlbumListGadget *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id location;

  if (-[PUHorizontalAlbumListGadgetProvider estimatedNumberOfGadgets](self, "estimatedNumberOfGadgets"))
  {
    -[PUHorizontalAlbumListGadgetProvider dataSourceManager](self, "dataSourceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "numberOfItemsInSection:", 0))
    {
      v5 = -[PUHorizontalAlbumListGadgetProvider type](self, "type");
      v6 = [PUAlbumsGadgetProvider alloc];
      -[PUHorizontalAlbumListGadgetProvider dataSourceManager](self, "dataSourceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUHorizontalAlbumListGadgetProvider traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUHorizontalAlbumListGadgetProvider sessionInfo](self, "sessionInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PUAlbumsGadgetProvider initWithAlbumListType:dataSourceManager:extendedTraitCollection:hasClearBackgroundColor:](v6, "initWithAlbumListType:dataSourceManager:extendedTraitCollection:hasClearBackgroundColor:", v5, v7, v8, objc_msgSend(v9, "hasClearBackgroundColor"));

      -[PUHorizontalAlbumListGadgetProvider setAlbumsGadgetProvider:](self, "setAlbumsGadgetProvider:", v10);
      v11 = -[PUHorizontalAlbumListGadget initWithAlbumsGadgetProvider:]([PUHorizontalAlbumListGadget alloc], "initWithAlbumsGadgetProvider:", v10);
      -[PXHorizontalCollectionGadget setPrefersPagingEnabled:](v11, "setPrefersPagingEnabled:", v5 == 1);
      -[PUHorizontalAlbumListGadgetProvider sessionInfo](self, "sessionInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUHorizontalAlbumListGadget setSessionInfo:](v11, "setSessionInfo:", v12);

      -[PXHorizontalCollectionGadget setDefaultColumnSpan:](v11, "setDefaultColumnSpan:", 1);
      objc_initWeak(&location, self);
      v13 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __54__PUHorizontalAlbumListGadgetProvider_generateGadgets__block_invoke;
      v18[3] = &unk_1E589FD80;
      objc_copyWeak(&v19, &location);
      -[PXHorizontalCollectionGadget setAccessoryButtonAction:](v11, "setAccessoryButtonAction:", v18);
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __54__PUHorizontalAlbumListGadgetProvider_generateGadgets__block_invoke_2;
      v17[3] = &unk_1E589FDA8;
      v17[4] = self;
      -[PXHorizontalCollectionGadget performChanges:](v11, "performChanges:", v17);
      v15[0] = v13;
      v15[1] = 3221225472;
      v15[2] = __54__PUHorizontalAlbumListGadgetProvider_generateGadgets__block_invoke_3;
      v15[3] = &unk_1E589FDD0;
      v14 = v11;
      v16 = v14;
      -[PXGadgetProvider performChanges:](self, "performChanges:", v15);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
  }
}

- (void)_handleAccessoryButtonAction:(id)a3 sender:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[PUHorizontalAlbumListGadgetProvider _seeAllViewController](self, "_seeAllViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUHorizontalAlbumListGadgetProvider sessionInfo](self, "sessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSessionInfo:", v6);

  objc_msgSend(v5, "gadget:transitionToViewController:animated:completion:", v5, v7, 1, 0);
}

- (void)startLoadingRemainingData
{
  id v2;

  -[PUHorizontalAlbumListGadgetProvider albumsGadgetProvider](self, "albumsGadgetProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startLoadingRemainingData");

}

- (void)pauseLoadingRemainingData
{
  id v2;

  -[PUHorizontalAlbumListGadgetProvider albumsGadgetProvider](self, "albumsGadgetProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pauseLoadingRemainingData");

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  -[PXGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_33410, a4);
  -[PUHorizontalAlbumListGadgetProvider generateGadgets](self, "generateGadgets");
}

- (void)_accountStoreDidChange:(id)a3
{
  if (-[PUHorizontalAlbumListGadgetProvider _canProvideGadgets](self, "_canProvideGadgets", a3))
    -[PUHorizontalAlbumListGadgetProvider loadDataForGadgets](self, "loadDataForGadgets");
  -[PUHorizontalAlbumListGadgetProvider _resetGadgets](self, "_resetGadgets");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PUHorizontalAlbumsListGadgetProviderTraitCollectionContext == a5)
  {
    if ((v6 & 2) != 0)
    {
      v11 = v9;
      -[PUHorizontalAlbumListGadgetProvider _resetGadgets](self, "_resetGadgets");
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)PUHorizontalAlbumListGadgetProviderDataSourceManagerContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadgetProvider.m"), 210, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      v11 = v9;
      -[PUHorizontalAlbumListGadgetProvider _handleDataSourceChange](self, "_handleDataSourceChange");
LABEL_7:
      v9 = v11;
    }
  }

}

- (void)_handleDataSourceChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  char v8;
  id v9;

  -[PUHorizontalAlbumListGadgetProvider dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v9, "numberOfItemsInSection:", 0);
  -[PXGadgetProvider gadgets](self, "gadgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = -[PUHorizontalAlbumListGadgetProvider _canProvideGadgets](self, "_canProvideGadgets");
  if (v4 && !v6 && v7)
  {
    -[PUHorizontalAlbumListGadgetProvider generateGadgets](self, "generateGadgets");
    goto LABEL_11;
  }
  if (!v4)
  {
    if (!v6)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (v6)
    v8 = v7;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
LABEL_10:
    -[PXGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_160);
LABEL_11:

}

- (void)_resetGadgets
{
  void *v3;
  uint64_t v4;

  if (-[PUHorizontalAlbumListGadgetProvider _canProvideGadgets](self, "_canProvideGadgets"))
  {
    -[PXGadgetProvider gadgets](self, "gadgets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
      -[PUHorizontalAlbumListGadgetProvider generateGadgets](self, "generateGadgets");
  }
  else
  {
    -[PXGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_161_33406);
  }
}

- (id)_newRootConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CD14E0];
  -[PUHorizontalAlbumListGadgetProvider photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRootAlbumCollectionListWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v6);
  return v7;
}

- (id)_newConfiguration
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;

  -[PUHorizontalAlbumListGadgetProvider sessionInfo](self, "sessionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[PUHorizontalAlbumListGadgetProvider type](self, "type"))
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadgetProvider.m"), 331, CFSTR("Invalid PUHorizontalAlbumListType"));

      abort();
    case 1uLL:
      v5 = -[PUHorizontalAlbumListGadgetProvider _newRootConfiguration](self, "_newRootConfiguration");
      if (objc_msgSend(v4, "isForAssetPicker"))
        v6 = 4982802;
      else
        v6 = 4983826;
      objc_msgSend(v5, "setCollectionTypesToInclude:", v6);
      if (objc_msgSend(v4, "isSelectingAssets"))
        objc_msgSend(v5, "setSkipSyndicatedAssetFetches:", 1);
      if (objc_msgSend(v4, "isLimitedLibraryPicker"))
        objc_msgSend(v5, "setShouldExcludePrivacySensitiveAlbums:", 1);
      break;
    case 2uLL:
      -[PUHorizontalAlbumListGadgetProvider photoLibrary](self, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_virtualCollections");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sharedAlbumsCollectionList");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v9);
      goto LABEL_25;
    case 3uLL:
      v5 = -[PUHorizontalAlbumListGadgetProvider _newRootConfiguration](self, "_newRootConfiguration");
      objc_msgSend(v5, "setCollectionTypesToInclude:", 64);
      v10 = (void *)MEMORY[0x1E0D7B970];
      -[PUHorizontalAlbumListGadgetProvider photoLibrary](self, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sharedLibraryStatusProviderWithPhotoLibrary:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "hasSharedLibraryOrPreview"))
        objc_msgSend(v5, "setCollectionTypesToInclude:", objc_msgSend(v5, "collectionTypesToInclude") | 2);
      objc_msgSend(v5, "setIncludePeopleAlbum:", 1);
      goto LABEL_16;
    case 4uLL:
      -[PUHorizontalAlbumListGadgetProvider _fromMyMacConfiguration](self, "_fromMyMacConfiguration");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      v13 = objc_msgSend(v4, "isForAssetPicker") ^ 1;
      v14 = objc_msgSend(v4, "isSelectingAssets") ^ 1;
      objc_msgSend(MEMORY[0x1E0CD14E0], "px_otherAlbumsCollectionListIncludeDeleted:includeHidden:includeDuplicates:", v4 == 0, v14, v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v12);
      objc_msgSend(v5, "setCollectionTypesToInclude:", -3);
LABEL_16:

      break;
    case 6uLL:
      v15 = v4;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        v9 = v15;
      else
        v9 = 0;

      objc_msgSend(v9, "rootCollectionList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = objc_alloc(MEMORY[0x1E0D7B710]);
        objc_msgSend(v9, "rootCollectionList");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (id)objc_msgSend(v17, "initWithCollectionList:", v18);

      }
      else
      {
        v5 = -[PUHorizontalAlbumListGadgetProvider _newRootConfiguration](self, "_newRootConfiguration");
      }
      objc_msgSend(v5, "setCollectionTypesToInclude:", 264208);
      objc_msgSend(v5, "setSkipSyndicatedAssetFetches:", 1);
      objc_msgSend(v5, "setShouldExcludePrivacySensitiveAlbums:", 1);
LABEL_25:

      break;
    default:
      v5 = 0;
      break;
  }
  if (objc_msgSend(v4, "isForAssetPicker"))
  {
    objc_msgSend(v4, "assetsFilterPredicate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAssetsFilterPredicate:", v19);

    objc_msgSend(v5, "setAssetTypesToInclude:", objc_msgSend(v4, "assetTypesToInclude"));
  }

  return v5;
}

- (BOOL)_canProvideGadgets
{
  BOOL v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = 0;
  switch(-[PUHorizontalAlbumListGadgetProvider type](self, "type"))
  {
    case 1uLL:
    case 4uLL:
    case 6uLL:
      v3 = 1;
      break;
    case 2uLL:
      -[PUHorizontalAlbumListGadgetProvider photoLibrary](self, "photoLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUHorizontalAlbumListGadgetProvider sessionInfo](self, "sessionInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isForAssetPicker");

      if ((v6 & 1) != 0)
      {
        v3 = 1;
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0D719E0];
        objc_msgSend(v4, "photoLibraryURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "sharedStreamsEnabledForPhotoLibraryURL:", v9))
        {
          -[PUHorizontalAlbumListGadgetProvider sessionInfo](self, "sessionInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v10 == 0;

        }
        else
        {
          v3 = 0;
        }

      }
      break;
    case 3uLL:
      -[PUHorizontalAlbumListGadgetProvider sessionInfo](self, "sessionInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v7 == 0;

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)_fromMyMacConfiguration
{
  id v2;

  v2 = -[PUHorizontalAlbumListGadgetProvider _newRootConfiguration](self, "_newRootConfiguration");
  objc_msgSend(v2, "setCollectionTypesToInclude:", 0x200000);
  return v2;
}

- (id)_seeAllViewController
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUAlbumListViewController *v8;
  PUAlbumListViewController *v9;
  PUAlbumListViewController *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  -[PUHorizontalAlbumListGadgetProvider traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PULegacyViewControllerSpec specForIdiom:](PUAlbumListViewControllerSpec, "specForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  switch(-[PUHorizontalAlbumListGadgetProvider type](self, "type"))
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadgetProvider.m"), 414, CFSTR("Invalid PUHorizontalAlbumListType"));
      goto LABEL_11;
    case 1uLL:
      -[PUHorizontalAlbumListGadgetProvider dataSourceManager](self, "dataSourceManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUHorizontalAlbumListGadgetProvider photoLibrary](self, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[PUAlbumListViewController newMyAlbumsViewControllerWithSpec:sessionInfo:dataSourceManager:photoLibrary:](PUAlbumListViewController, "newMyAlbumsViewControllerWithSpec:sessionInfo:dataSourceManager:photoLibrary:", v5, 0, v6, v7);
      goto LABEL_5;
    case 2uLL:
      -[PUHorizontalAlbumListGadgetProvider dataSourceManager](self, "dataSourceManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUHorizontalAlbumListGadgetProvider photoLibrary](self, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[PUAlbumListViewController newSharedAlbumsViewControllerWithSpec:sessionInfo:dataSourceManager:photoLibrary:](PUAlbumListViewController, "newSharedAlbumsViewControllerWithSpec:sessionInfo:dataSourceManager:photoLibrary:", v5, 0, v6, v7);
LABEL_5:
      v9 = v8;

      goto LABEL_7;
    case 3uLL:
    case 5uLL:
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUHorizontalAlbumListGadgetProvider title](self, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadgetProvider.m"), 409, CFSTR("Can not navigate to 'See All' for %@"), v15);

LABEL_11:
      abort();
    case 4uLL:
      v10 = [PUAlbumListViewController alloc];
      -[PUHorizontalAlbumListGadgetProvider photoLibrary](self, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PUAlbumListViewController initWithSpec:photoLibrary:](v10, "initWithSpec:photoLibrary:", v5, v11);

      -[PUHorizontalAlbumListGadgetProvider _fromMyMacConfiguration](self, "_fromMyMacConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController setDataSourceManagerConfiguration:](v9, "setDataSourceManagerConfiguration:", v12);

      PULocalizedString(CFSTR("FROM_MY_MAC"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController setTitle:](v9, "setTitle:", v6);
LABEL_7:

      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (PUSessionInfo)sessionInfo
{
  return (PUSessionInfo *)objc_getProperty(self, a2, 48, 1);
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

- (PXPhotoKitCollectionsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (PUAlbumsGadgetProvider)albumsGadgetProvider
{
  return self->_albumsGadgetProvider;
}

- (void)setAlbumsGadgetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_albumsGadgetProvider, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_albumsGadgetProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
}

uint64_t __52__PUHorizontalAlbumListGadgetProvider__resetGadgets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

uint64_t __62__PUHorizontalAlbumListGadgetProvider__handleDataSourceChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

uint64_t __67__PUHorizontalAlbumListGadgetProvider_settings_changedValueForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

void __54__PUHorizontalAlbumListGadgetProvider_generateGadgets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleAccessoryButtonAction:sender:", v6, v5);

}

void __54__PUHorizontalAlbumListGadgetProvider_generateGadgets__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollectionTitle:", v4);

}

void __54__PUHorizontalAlbumListGadgetProvider_generateGadgets__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);

}

@end
