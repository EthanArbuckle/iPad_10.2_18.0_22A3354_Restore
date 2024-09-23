@implementation PUAlbumsGadgetProvider

- (PUAlbumsGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumsGadgetProvider.m"), 65, CFSTR("%s is not available as initializer"), "-[PUAlbumsGadgetProvider init]");

  abort();
}

- (PUAlbumsGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumsGadgetProvider.m"), 69, CFSTR("%s is not available as initializer"), "-[PUAlbumsGadgetProvider initWithIdentifier:]");

  abort();
}

- (PUAlbumsGadgetProvider)initWithAlbumListType:(unint64_t)a3 dataSourceManager:(id)a4 extendedTraitCollection:(id)a5
{
  return -[PUAlbumsGadgetProvider initWithAlbumListType:dataSourceManager:extendedTraitCollection:hasClearBackgroundColor:](self, "initWithAlbumListType:dataSourceManager:extendedTraitCollection:hasClearBackgroundColor:", a3, a4, a5, 0);
}

- (PUAlbumsGadgetProvider)initWithAlbumListType:(unint64_t)a3 dataSourceManager:(id)a4 extendedTraitCollection:(id)a5 hasClearBackgroundColor:(BOOL)a6
{
  id v11;
  id v12;
  PUAlbumsGadgetProvider *v13;
  PUAlbumsGadgetProvider *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PUAlbumsGadgetProvider;
  v13 = -[PXGadgetProvider init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_albumListType = a3;
    objc_storeStrong((id *)&v13->_dataSourceManager, a4);
    objc_storeStrong((id *)&v14->_extendedTraitCollection, a5);
    v14->_hasClearBackgroundColor = a6;
    -[PXExtendedTraitCollection registerChangeObserver:context:](v14->_extendedTraitCollection, "registerChangeObserver:context:", v14, PXAlbumsGadgetProviderExtendedTraitCollectionObservableContext);
  }

  return v14;
}

- (PUAlbumListCellContentViewHelper)contentViewHelper
{
  PUAlbumListCellContentViewHelper *contentViewHelper;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  int v10;
  PXPhotoKitUIMediaProvider *v11;
  PXPhotoKitUIMediaProvider *mediaProvider;
  id v13;
  id v14;
  PXPhotoKitUIMediaProvider *v15;
  PXPhotoKitUIMediaProvider *v16;
  PUAlbumListCellContentViewHelper *v17;
  void *v18;
  PXPhotoKitUIMediaProvider *v19;
  void *v20;
  PUAlbumListCellContentViewHelper *v21;
  PUAlbumListCellContentViewHelper *v22;

  contentViewHelper = self->_contentViewHelper;
  if (!contentViewHelper)
  {
    +[PUAlbumListCellContentViewHelperConfiguration defaultConfiguration](PUAlbumListCellContentViewHelperConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHasClearBackgroundColor:", -[PUAlbumsGadgetProvider hasClearBackgroundColor](self, "hasClearBackgroundColor"));
    v5 = objc_alloc(MEMORY[0x1E0D7B4A0]);
    -[PUAlbumsGadgetProvider extendedTraitCollection](self, "extendedTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithTraitCollection:scrollAxis:", v6, 2);

    objc_msgSend(v7, "columnWidthForColumnSpan:", 0);
    objc_msgSend(v4, "setStackSize:", v8, v8);
    if (-[PUAlbumsGadgetProvider albumListType](self, "albumListType") == 2)
    {
      +[PUAlbumListSettings sharedInstance](PUAlbumListSettings, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "shouldUseEditorialLayout");

      if (v10)
      {
        objc_msgSend(v4, "setStackViewStyle:", 6);
        objc_msgSend(v4, "setGridItemSpacing:", 4.0);
      }
    }
    if (!self->_mediaProvider)
    {
      v11 = (PXPhotoKitUIMediaProvider *)objc_alloc_init(MEMORY[0x1E0D7B768]);
      mediaProvider = self->_mediaProvider;
      self->_mediaProvider = v11;

      v13 = objc_alloc(MEMORY[0x1E0D7B768]);
      v14 = objc_alloc_init(MEMORY[0x1E0CD1488]);
      v15 = (PXPhotoKitUIMediaProvider *)objc_msgSend(v13, "initWithImageManager:", v14);
      v16 = self->_mediaProvider;
      self->_mediaProvider = v15;

    }
    v17 = [PUAlbumListCellContentViewHelper alloc];
    -[PUAlbumsGadgetProvider dataSourceManager](self, "dataSourceManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_mediaProvider;
    -[PUAlbumsGadgetProvider extendedTraitCollection](self, "extendedTraitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PUAlbumListCellContentViewHelper initWithConfiguration:dataSourceManager:mediaProvider:extendedTraitCollection:](v17, "initWithConfiguration:dataSourceManager:mediaProvider:extendedTraitCollection:", v4, v18, v19, v20);

    v22 = self->_contentViewHelper;
    self->_contentViewHelper = v21;

    contentViewHelper = self->_contentViewHelper;
  }
  return contentViewHelper;
}

- (BOOL)shouldShowSeeAllAccessoryButton
{
  unint64_t v3;
  BOOL v4;
  void *v5;

  v3 = -[PUAlbumsGadgetProvider albumListType](self, "albumListType");
  if (v3 - 4 >= 2)
    return v3 - 1 <= 1;
  -[PXGadgetProvider gadgets](self, "gadgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v5, "count") > 2;

  return v4;
}

- (NSString)seeAllAccessoryButtonTitle
{
  NSObject *v3;
  NSString *result;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  switch(-[PUAlbumsGadgetProvider albumListType](self, "albumListType"))
  {
    case 0uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
      PXAssertGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v5 = 134217984;
        v6 = -[PUAlbumsGadgetProvider albumListType](self, "albumListType");
        _os_log_error_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_ERROR, "No localized 'See All' button title expected to be provided for albumListType %li. A generic title will be used.", (uint8_t *)&v5, 0xCu);
      }

      goto LABEL_5;
    case 1uLL:
    case 2uLL:
    case 4uLL:
      PXLocalizedString();
      result = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_5:
      result = (NSString *)0;
      break;
  }
  return result;
}

- (void)startLoadingRemainingData
{
  id v2;

  -[PUAlbumsGadgetProvider dataSourceManager](self, "dataSourceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareBackgroundFetchingIfNeeded");
  objc_msgSend(v2, "startBackgroundFetchingIfNeeded");

}

- (void)pauseLoadingRemainingData
{
  id v2;

  -[PUAlbumsGadgetProvider dataSourceManager](self, "dataSourceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pauseBackgroundFetching");

}

- (id)gadgetForIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "item");
  -[PXGadgetProvider gadgets](self, "gadgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)gadgetForCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;

  v4 = a3;
  -[PXGadgetProvider gadgets](self, "gadgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v6 = v4;
  PXFind();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)loadDataForGadgets
{
  void *v3;
  void *v4;
  id v5;

  if (-[PUAlbumsGadgetProvider albumListType](self, "albumListType") == 3)
  {
    objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheduleTaskWithQoS:block:", 0, &__block_literal_global_10468);

  }
  -[PUAlbumsGadgetProvider dataSourceManager](self, "dataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumsGadgetProvider _updateDataSourceWithChangeDetails:](self, "_updateDataSourceWithChangeDetails:", 0);
  objc_msgSend(v5, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumsGadgetProvider setCurrentDataSourceIdentifier:](self, "setCurrentDataSourceIdentifier:", objc_msgSend(v4, "identifier"));

  objc_msgSend(v5, "registerChangeObserver:context:", self, PXAlbumsGadgetProviderDataSourceManagerObservableContext);
}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PUAlbumsGadgetProvider dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);
  return v4;
}

- (void)generateGadgets
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PUAlbumsGadgetProvider *v16;
  id v17;
  _OWORD v18[2];

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUAlbumsGadgetProvider dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "firstItemIndexPath");
  else
    memset(v18, 0, sizeof(v18));
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__PUAlbumsGadgetProvider_generateGadgets__block_invoke;
  v14[3] = &unk_1E589C780;
  v7 = v5;
  v15 = v7;
  v16 = self;
  v8 = v3;
  v17 = v8;
  objc_msgSend(v7, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v18, 0, v14);
  if (objc_msgSend(v8, "count"))
  {
    v9 = v6;
    v10 = 3221225472;
    v11 = __41__PUAlbumsGadgetProvider_generateGadgets__block_invoke_2;
    v12 = &unk_1E589FDD0;
    v13 = v8;
    -[PXGadgetProvider performChanges:](self, "performChanges:", &v9);

  }
  -[PUAlbumsGadgetProvider setHasGeneratedGadgets:](self, "setHasGeneratedGadgets:", 1, v9, v10, v11, v12);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v6 = a4;
  v9 = a3;
  if ((void *)PXAlbumsGadgetProviderDataSourceManagerObservableContext == a5)
  {
    if ((v6 & 1) != 0)
      px_dispatch_on_main_queue();
  }
  else
  {
    if ((void *)PXAlbumsGadgetProviderExtendedTraitCollectionObservableContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumsGadgetProvider.m"), 263, CFSTR("Unexpected PXObservableContext"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      -[PUAlbumsGadgetProvider setContentViewHelper:](self, "setContentViewHelper:", 0);
      -[PUAlbumsGadgetProvider _reconfigureGadgets](self, "_reconfigureGadgets");
    }
    else if ((v6 & 0x10) != 0)
    {
      -[PUAlbumsGadgetProvider contentViewHelper](self, "contentViewHelper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumsGadgetProvider setContentViewHelper:](self, "setContentViewHelper:", 0);
      -[PUAlbumsGadgetProvider contentViewHelper](self, "contentViewHelper");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "albumCellSize");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v11, "albumCellSize");
      if (v13 != v17 || v15 != v16)
        -[PUAlbumsGadgetProvider _reconfigureGadgets](self, "_reconfigureGadgets");

    }
  }

}

- (void)_reconfigureGadgets
{
  id v2;

  -[PXGadgetProvider gadgets](self, "gadgets");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeObjectsPerformSelector:", sel_reconfigure);

}

- (id)_newGadgetForCollection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(-[PUAlbumsGadgetProvider _albumGadgetClassForCollection:](self, "_albumGadgetClassForCollection:", v4)), "initWithCollection:albumGadgetDelegate:", v4, self);

  return v5;
}

- (Class)_albumGadgetClassForCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (-[PUAlbumsGadgetProvider albumListType](self, "albumListType") != 2
    && (objc_msgSend(v4, "px_isPlacesSmartAlbum") & 1) == 0)
  {
    objc_msgSend(v4, "px_isPeopleVirtualCollection");
  }
  v5 = (id)objc_opt_class();

  return (Class)v5;
}

- (void)_updateDataSourceWithChangeDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[4];
  id v25;
  PUAlbumsGadgetProvider *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  PUAlbumsGadgetProvider *v31;
  id v32;
  id v33;

  v4 = a3;
  -[PUAlbumsGadgetProvider dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUAlbumsGadgetProvider hasGeneratedGadgets](self, "hasGeneratedGadgets"))
  {
    objc_msgSend(v4, "itemChangesInSection:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "hasIncrementalChanges"))
    {
      objc_msgSend(v8, "removedIndexes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertedIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "changedIndexes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "count");
      v13 = MEMORY[0x1E0C809B0];
      if (v12 || objc_msgSend(v10, "count"))
      {
        v29[0] = v13;
        v29[1] = 3221225472;
        v29[2] = __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke;
        v29[3] = &unk_1E589C7A8;
        v30 = v9;
        v31 = self;
        v32 = v10;
        v33 = v6;
        -[PXGadgetProvider performChanges:](self, "performChanges:", v29);

      }
      v27[0] = v13;
      v27[1] = 3221225472;
      v27[2] = __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_3;
      v27[3] = &unk_1E589C7F8;
      v27[4] = self;
      v14 = v6;
      v28 = v14;
      objc_msgSend(v8, "enumerateMovedIndexesUsingBlock:", v27);
      aBlock[0] = v13;
      aBlock[1] = 3221225472;
      aBlock[2] = __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_5;
      aBlock[3] = &unk_1E589C820;
      v25 = v14;
      v26 = self;
      v22[0] = v13;
      v22[1] = 3221225472;
      v22[2] = __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_6;
      v22[3] = &unk_1E589E818;
      v15 = _Block_copy(aBlock);
      v23 = v15;
      objc_msgSend(v11, "enumerateIndexesUsingBlock:", v22);
      objc_msgSend(v4, "sectionsWithItemChanges");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v13;
      v19[1] = 3221225472;
      v19[2] = __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_7;
      v19[3] = &unk_1E589C870;
      v20 = v4;
      v21 = v15;
      v17 = v15;
      objc_msgSend(v16, "enumerateIndexesUsingBlock:", v19);

    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_9;
      v18[3] = &unk_1E589FDD0;
      v18[4] = self;
      -[PXGadgetProvider performChanges:](self, "performChanges:", v18);
    }

  }
}

- (id)gadgetHostingViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumsGadgetProvider gadgetForIndexPath:](self, "gadgetForIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadgetViewControllerHostingGadget:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentGadgetViewController:animated:completion:", v5, 1, 0);

  return 1;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  if (v7)
  {
    -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissGadgetViewController:animated:completion:", v7, 1, v8);
  }
  else
  {
    -[PUAlbumsGadgetProvider gadgetHostingViewController](self, "gadgetHostingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v8);
  }

  return 1;
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v8;
    -[PUAlbumsGadgetProvider gadgetHostingViewController](self, "gadgetHostingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7B5C8], "moviePresenterWithPresentingViewController:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentMovieViewControllerForAssetCollection:keyAssetFetchResult:preferredTransitionType:", v5, 0, 1);

  }
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v6;
  void *v7;

  v6 = a4;
  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentGadgetViewController:animated:completion:", v6, 1, 0);

  return 1;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v3;
  void *v4;

  -[PUAlbumsGadgetProvider gadgetHostingViewController](self, "gadgetHostingViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  void *v3;
  void *v4;

  -[PUAlbumsGadgetProvider gadgetHostingViewController](self, "gadgetHostingViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7BBE8], "defaultPresenterWithViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PXPhotoKitCollectionsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setContentViewHelper:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewHelper, a3);
}

- (unint64_t)albumListType
{
  return self->_albumListType;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (BOOL)hasClearBackgroundColor
{
  return self->_hasClearBackgroundColor;
}

- (int64_t)currentDataSourceIdentifier
{
  return self->_currentDataSourceIdentifier;
}

- (void)setCurrentDataSourceIdentifier:(int64_t)a3
{
  self->_currentDataSourceIdentifier = a3;
}

- (PXPhotoKitUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (BOOL)hasGeneratedGadgets
{
  return self->_hasGeneratedGadgets;
}

- (void)setHasGeneratedGadgets:(BOOL)a3
{
  self->_hasGeneratedGadgets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_contentViewHelper, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

void __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v11 = a2;
  if (objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(a1[5], "gadgets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectsAtIndexes:", a1[4]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeGadgets:", v4);

  }
  v5 = objc_msgSend(a1[6], "count");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_2;
    v12[3] = &unk_1E58A0380;
    v7 = a1[6];
    v8 = a1[7];
    v9 = a1[5];
    v13 = v8;
    v14 = v9;
    v15 = v6;
    v10 = v6;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v12);
    objc_msgSend(v11, "insertGadgets:atIndexes:", v10, a1[6]);

  }
}

void __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "gadgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_albumGadgetClassForCollection:", v9);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "setCollection:", v9);
    objc_msgSend(v6, "reconfigure");
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_4;
    v13[3] = &unk_1E589C7D0;
    v11 = v6;
    v12 = *(_QWORD *)(a1 + 32);
    v14 = v11;
    v15 = v12;
    v16 = v9;
    v17 = a3;
    objc_msgSend(v10, "performChanges:", v13);

  }
}

void __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionAtIndexPath:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "gadgets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCollection:", v5);
  objc_msgSend(v7, "reconfigure");

}

uint64_t __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "itemsWithSubitemChangesInSection:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_8;
  v5[3] = &unk_1E589C848;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v5);

}

uint64_t __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_9(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "removeAllGadgets");
  return objc_msgSend(*(id *)(a1 + 32), "generateGadgets");
}

uint64_t __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

void __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGadgets:", v5);

  v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "_newGadgetForCollection:", *(_QWORD *)(a1 + 48));
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertGadgets:atIndexes:", v7, v8);

}

void __61__PUAlbumsGadgetProvider__updateDataSourceWithChangeDetails___block_invoke_2(id *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "collectionAtIndexPath:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(a1[5], "_newGadgetForCollection:", v3);
  objc_msgSend(a1[6], "addObject:", v4);

}

void __55__PUAlbumsGadgetProvider_observable_didChange_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "currentDataSourceIdentifier");
  objc_msgSend(*(id *)(a1 + 32), "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v2, objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setCurrentDataSourceIdentifier:", objc_msgSend(v4, "identifier"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 32), "_updateDataSourceWithChangeDetails:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

void __41__PUAlbumsGadgetProvider_generateGadgets__block_invoke(uint64_t a1, __int128 *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;

  v3 = *(void **)(a1 + 32);
  v7 = *a2;
  v8 = a2[1];
  PXIndexPathFromSimpleIndexPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionAtIndexPath:", v4, v7, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "_newGadgetForCollection:", v5);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

uint64_t __41__PUAlbumsGadgetProvider_generateGadgets__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addGadgets:", *(_QWORD *)(a1 + 32));
}

uint64_t __46__PUAlbumsGadgetProvider_gadgetForCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

@end
