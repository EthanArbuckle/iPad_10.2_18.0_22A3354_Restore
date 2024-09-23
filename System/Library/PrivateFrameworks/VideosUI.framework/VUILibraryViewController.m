@implementation VUILibraryViewController

- (VUILibraryViewController)initWithMenuDataSource:(id)a3
{
  id v5;
  VUILibraryViewController *v6;
  VUILibraryViewController *v7;
  void *v8;
  uint64_t v9;
  VUIMediaLibrary *mediaLibrary;
  NSObject *v11;
  uint64_t v12;
  VUIViewControllerContentPresenter *v13;
  VUIViewControllerContentPresenter *contentPresenter;
  NSObject *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VUILibraryViewController;
  v6 = -[VUILibraryStackViewController init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_viewHasAppearedAtLeastOnce = 0;
    v6->_currentLibraryCategoryIsValid = 0;
    objc_storeStrong((id *)&v6->_menuDataSource, a3);
    -[VUILibraryViewController menuDataSource](v7, "menuDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v7);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "mediaLibrary");
      v9 = objc_claimAutoreleasedReturnValue();
      mediaLibrary = v7->_mediaLibrary;
      v7->_mediaLibrary = (VUIMediaLibrary *)v9;

      VUIDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[VUIMediaLibrary type](v7->_mediaLibrary, "type");
        *(_DWORD *)buf = 134217984;
        v20 = v12;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] library init with media library type %lu", buf, 0xCu);
      }

    }
    v7->_doesDeviceSupportHDR = SSDeviceIsHDRCapable();
    v13 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v7->_contentPresenter;
    v7->_contentPresenter = v13;

    -[VUIViewControllerContentPresenter setLogName:](v7->_contentPresenter, "setLogName:", CFSTR("VUILibraryViewController"));
    VUIDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      VUIBoolLogString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v16;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUILibraryViewController _doesDeviceSupportHDR = %@", buf, 0xCu);

    }
  }

  return v7;
}

- (VUILibraryMenuDataSource)menuDataSource
{
  return self->_menuDataSource;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  VUILibraryViewController *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VUILibraryViewController;
  -[VUILibraryViewController willMoveToParentViewController:](&v18, sel_willMoveToParentViewController_, v4);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "type");

        if (v8 != 1)
        {
          -[VUILibraryViewController navigationController](self, "navigationController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "interactivePopGestureRecognizer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setEnabled:", 1);

          -[VUILibraryViewController navigationController](self, "navigationController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "interactivePopGestureRecognizer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          v15 = self;
          goto LABEL_7;
        }
      }
    }
  }
  -[VUILibraryViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[VUILibraryViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interactivePopGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 0);

    -[VUILibraryViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "interactivePopGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 0;
LABEL_7:
    objc_msgSend(v13, "setDelegate:", v15);

  }
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

void __74__VUILibraryViewController__constructLibraryDataSourceAndUpdateActiveView__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint8_t v8[16];

  v2 = *MEMORY[0x1E0DB18F8];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0DB18F8]))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PerceivedLaunch", ", v8, 2u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008) = 1;
  v3 = (id *)MEMORY[0x1E0DC4730];
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "shouldRecordExtendedLaunchTime"))
  {
    v4 = *v3;
    objc_msgSend(*v3, "_launchTestName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "isRunningTest:", v5);

    if ((_DWORD)v4)
    {
      v6 = *v3;
      objc_msgSend(*v3, "_launchTestName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "finishedTest:extraResults:", v7, 0);

    }
  }
}

id __46__VUILibraryViewController__applyBatchChanges__block_invoke_5(uint64_t a1, void *a2)
{
  return a2;
}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_4(uint64_t a1)
{
  int v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_updateVisibleCellSeparators");
  objc_msgSend(*(id *)(a1 + 32), "setHasBatchChangesInProgress:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "hasNewerBatchChanges");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "setHasNewerBatchChanges:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_applyBatchChanges");
  }
  else
  {
    v4 = objc_msgSend(v3, "hasPendingShelvesUpdate");
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "setHasPendingShelvesUpdate:", 0);
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "shelvesDataSource");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shelvesDidFinishWithDataSource:", v7);

    }
    else
    {
      objc_msgSend(v5, "_showContentOrNoContentView");
    }
  }
}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __46__VUILibraryViewController__applyBatchChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[2];

  v5 = a3;
  v6 = objc_msgSend(v5, "changeKind");
  if (v6 == 1)
  {
    objc_msgSend(v5, "destinationIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __46__VUILibraryViewController__applyBatchChanges__block_invoke_3;
    v18 = &unk_1E9F9E250;
    v9 = (id *)v19;
    v19[0] = v12;
    v19[1] = a2;
    v10 = v12;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", &v15);
    objc_msgSend(*(id *)(a1 + 32), "stackCollectionView", v15, v16, v17, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertItemsAtIndexPaths:", v10);
  }
  else
  {
    if (v6 != 2)
    {
      v13 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "sourceIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_2;
    v20[3] = &unk_1E9F9E250;
    v9 = (id *)v21;
    v21[0] = v8;
    v21[1] = a2;
    v10 = v8;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v20);
    objc_msgSend(*(id *)(a1 + 32), "stackCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteItemsAtIndexPaths:", v10);
  }

  v13 = 1;
LABEL_7:

  return v13;
}

void __39__VUILibraryViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "start");

}

void __33__VUILibraryViewController_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v29 = WeakRetained;
  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "contentPresenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:", CFSTR("LIBRARY_EMPTY_TITLE_LIBRARY_ONLY"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNoContentErrorTitle:", v18);

    objc_msgSend(v29, "contentPresenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    v20 = CFSTR("LIBRARY_EMPTY_DESCRIPTION_LIBRARY_ONLY");
LABEL_10:
    objc_msgSend(v19, "localizedStringForKey:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNoContentErrorMessage:", v24);
    goto LABEL_11;
  }
  objc_msgSend(WeakRetained, "familyMember");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v29, "familyMember");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sharingPurchases");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v29, "contentPresenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:", CFSTR("LIBRARY_FS_NOT_SHARING_TITLE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setNoContentErrorTitle:", v23);

      objc_msgSend(v29, "contentPresenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("LIBRARY_FS_NOT_SHARING_DESCRIPTION");
      goto LABEL_8;
    }
  }
  objc_msgSend(v29, "contentPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", CFSTR("LIBRARY_EMPTY_TITLE_NEW"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNoContentErrorTitle:", v9);

  objc_msgSend(v29, "familyMember");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "contentPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    v20 = CFSTR("LIBRARY_EMPTY_DESCRIPTION_NEW");
    goto LABEL_10;
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = CFSTR("LIBRARY_FS_EMPTY_DESCRIPTION");
LABEL_8:
  objc_msgSend(v13, "localizedStringForKey:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "familyMember");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@"), 0, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNoContentErrorMessage:", v27);

LABEL_11:
  objc_msgSend(v29, "contentPresenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "refreshNoContentViewIfNeeded");

}

void __33__VUILibraryViewController_start__block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__VUILibraryViewController_start__block_invoke_2;
  v3[3] = &unk_1E9F9A758;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)VUILibraryViewController;
  -[VUILibraryViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  -[VUILibraryViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

  -[VUILibraryStackViewController stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  LODWORD(v4) = CGRectEqualToRect(v9, *MEMORY[0x1E0C9D648]);

  if ((_DWORD)v4)
  {
    -[VUILibraryStackViewController stackView](self, "stackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v6, "setFrame:");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _VUILibrarySeeAllController *currentSeeAllController;
  VUIMediaLibrary *currentHomeShareMediaLibrary;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  BOOL v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VUILibraryViewController;
  -[VUILibraryViewController viewWillAppear:](&v25, sel_viewWillAppear_);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != 1)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActiveMediaLibrary:", v8);

  }
  currentSeeAllController = self->_currentSeeAllController;
  self->_currentSeeAllController = 0;

  currentHomeShareMediaLibrary = self->_currentHomeShareMediaLibrary;
  self->_currentHomeShareMediaLibrary = 0;

  -[VUILibraryViewController contentPresenter](self, "contentPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "currentContentViewType");

  if (v12 == 3)
  {
    -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathsForSelectedItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[VUILibraryViewController transitionCoordinator](self, "transitionCoordinator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __43__VUILibraryViewController_viewWillAppear___block_invoke;
        v21[3] = &unk_1E9F98F00;
        v22 = v13;
        v23 = v15;
        v24 = a3;
        v18[0] = v17;
        v18[1] = 3221225472;
        v18[2] = __43__VUILibraryViewController_viewWillAppear___block_invoke_2;
        v18[3] = &unk_1E9F98F28;
        v19 = v22;
        v20 = v23;
        objc_msgSend(v16, "animateAlongsideTransition:completion:", v21, v18);

      }
      else
      {
        objc_msgSend(v13, "deselectItemAtIndexPath:animated:", v15, 1);
      }

    }
  }
  -[VUILibraryViewController _resetNavigationBar](self, "_resetNavigationBar");
}

- (void)viewDidLoad
{
  void *v3;
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
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VUILibraryViewController;
  -[VUILibraryStackViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[VUILibraryViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("LIBRARY_LOADING_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLoadingMessage:", v5);

  -[VUILibraryViewController contentPresenter](self, "contentPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("LIBRARY_LOADING_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLoadingTitle:", v8);

  objc_initWeak(&location, self);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __39__VUILibraryViewController_viewDidLoad__block_invoke;
  v18 = &unk_1E9F99C98;
  objc_copyWeak(&v19, &location);
  +[VUIGDPRPresentationManager checkGDPRConsentAndPerformRequests:](VUIGDPRPresentationManager, "checkGDPRConsentAndPerformRequests:", &v15);
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager", v15, v16, v17, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginDiscoveringHomeShareMediaLibraries");

  -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[VUILibraryViewController contentPresenter](self, "contentPresenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryStackViewController stackView](self, "stackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentView:", v12);

  }
  -[VUILibraryViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUILibraryViewController;
  -[VUILibraryStackViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[VUILibraryViewController setCurrentLibraryCategoryIsValid:](self, "setCurrentLibraryCategoryIsValid:", 0);
  -[VUILibraryViewController setViewHasAppearedAtLeastOnce:](self, "setViewHasAppearedAtLeastOnce:", 1);
  v4 = CFSTR("LibraryMain");
  -[VUILibraryViewController familyMember](self, "familyMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = CFSTR("FamilySharingLibraryMain");

    v4 = v6;
  }
  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", v4);

}

- (NSMutableArray)validShelfTypes
{
  return self->_validShelfTypes;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *shelves;
  VUILibraryShelvesDataSource *v7;
  VUILibraryShelvesDataSource *shelvesDataSource;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id buf[2];

  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] library view starts all fetches", (uint8_t *)buf, 2u);
  }

  -[VUILibraryViewController _addMediaLibraryNotificationObservers](self, "_addMediaLibraryNotificationObservers");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__accountsChanged_, CFSTR("VUIAuthenticationManagerAccountStoreDidChangeNotification"), 0);

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  shelves = self->_shelves;
  self->_shelves = v5;

  -[VUILibraryViewController _dataSourceForShelves](self, "_dataSourceForShelves");
  v7 = (VUILibraryShelvesDataSource *)objc_claimAutoreleasedReturnValue();
  shelvesDataSource = self->_shelvesDataSource;
  self->_shelvesDataSource = v7;

  -[VUILibraryViewController menuDataSource](self, "menuDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startFetch");

  -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "type"))
  {
    if (objc_msgSend(v10, "type") == 1)
    {
      if ((objc_msgSend(v10, "isConnectable") & 1) != 0)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:", CFSTR("LIBRARY_EMPTY_HS_DESCRIPTION"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[VUILibraryViewController contentPresenter](self, "contentPresenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setNoContentErrorMessage:", v15);

        VUIDefaultLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_INFO, "[VUILibraryViewController] start - home share - update content view type to loading", (uint8_t *)buf, 2u);
        }

        -[VUILibraryViewController contentPresenter](self, "contentPresenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setCurrentContentViewType:", 1);

        objc_initWeak(buf, self);
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __33__VUILibraryViewController_start__block_invoke_93;
        v40[3] = &unk_1E9F9C6F8;
        objc_copyWeak(&v41, buf);
        objc_msgSend(v10, "connectWithCompletionHandler:progressHandler:", v40, 0);
        objc_destroyWeak(&v41);
        objc_destroyWeak(buf);

      }
      else
      {
        -[VUILibraryViewController contentPresenter](self, "contentPresenter");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:", CFSTR("LIBRARY_HS_UNSUPPORTED_VERSION_TITLE"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setNoContentErrorTitle:", v35);

        -[VUILibraryViewController contentPresenter](self, "contentPresenter");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:", CFSTR("LIBRARY_HS_UNSUPPORTED_VERSION_DESCRIPTION"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setNoContentErrorMessage:", v38);

        -[VUILibraryViewController contentPresenter](self, "contentPresenter");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setCurrentContentViewType:", 2);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isNetworkReachable");

    if ((v20 & 1) != 0)
    {
      VUIDefaultLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_INFO, "[VUILibraryViewController] start - update content view type to loading", (uint8_t *)buf, 2u);
      }

      -[VUILibraryViewController contentPresenter](self, "contentPresenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCurrentContentViewType:", 1);

    }
    else
    {
      -[VUILibraryViewController _presentDownloadViewController](self, "_presentDownloadViewController");
    }
    v23 = -[VUILibraryViewController _isDeviceMediaLibraryInitialUpdateInProgress](self, "_isDeviceMediaLibraryInitialUpdateInProgress");
    VUIDefaultLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Device Media Library Update in progress", (uint8_t *)buf, 2u);
      }

      -[VUILibraryViewController _startMonitoringDeviceMediaLibraryInitialUpdate](self, "_startMonitoringDeviceMediaLibraryInitialUpdate");
    }
    else
    {
      if (v25)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Device Media Library already ready", (uint8_t *)buf, 2u);
      }

      -[VUILibraryViewController setHasMenuItemFetchCompleted:](self, "setHasMenuItemFetchCompleted:", 1);
      -[VUILibraryViewController _updateViewIfFetchComplete](self, "_updateViewIfFetchComplete");
    }
    -[VUILibraryViewController contentPresenter](self, "contentPresenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:", CFSTR("LIBRARY_CLOUD_UPDATE_FAILED_TITLE"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCloudUpdateFailedTitle:", v28);

    -[VUILibraryViewController contentPresenter](self, "contentPresenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:", CFSTR("LIBRARY_CLOUD_UPDATE_FAILED_MESSAGE"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCloudUpdateFailedMessage:", v31);

    objc_initWeak(buf, self);
    v32 = (void *)MEMORY[0x1E0DC8868];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __33__VUILibraryViewController_start__block_invoke;
    v42[3] = &unk_1E9F9B3A0;
    objc_copyWeak(&v43, buf);
    objc_msgSend(v32, "isFullTVAppEnabledwithCompletion:", v42);
    objc_destroyWeak(&v43);
    objc_destroyWeak(buf);
  }

}

- (NSMutableArray)shelves
{
  return self->_shelves;
}

- (void)shelvesDidFinishWithDataSource:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VUILibraryShelfCollectionViewController *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  if (!-[VUILibraryViewController hasBatchChangesInProgress](self, "hasBatchChangesInProgress"))
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Shelves datasource fetch completed", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isNetworkReachable");

    v7 = -[VUILibraryViewController hasMediaEntitiesFetchCompleted](self, "hasMediaEntitiesFetchCompleted");
    if ((v6 & 1) != 0)
    {
      if (v7)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        -[VUILibraryViewController validShelfTypes](self, "validShelfTypes");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (!v8)
          goto LABEL_22;
        v9 = v8;
        v22 = *(_QWORD *)v25;
        while (1)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v25 != v22)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
            objc_msgSend(v23, "dataSourcesByShelfType");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKey:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dataSource == %@"), v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUILibraryViewController shelves](self, "shelves");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "firstObject");
            v17 = (VUILibraryShelfCollectionViewController *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "mediaEntities");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count");

            if (!v17)
            {
              if (!v19)
                goto LABEL_20;
              v17 = -[VUILibraryShelfCollectionViewController initWithDataSource:]([VUILibraryShelfCollectionViewController alloc], "initWithDataSource:", v13);
              -[VUILibraryViewController _configureShelfViewController:withShelfType:](self, "_configureShelfViewController:withShelfType:", v17, objc_msgSend(v11, "unsignedIntegerValue"));
              -[VUILibraryViewController shelves](self, "shelves");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v17);
              goto LABEL_18;
            }
            if (!v19)
            {
              -[VUILibraryViewController shelves](self, "shelves");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "removeObject:", v17);
LABEL_18:

              goto LABEL_19;
            }
            -[VUILibraryShelfCollectionViewController updateWithDataSource:](v17, "updateWithDataSource:", v13);
LABEL_19:

LABEL_20:
            ++v10;
          }
          while (v9 != v10);
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (!v9)
          {
LABEL_22:

            -[VUILibraryViewController _updateViewIfFetchComplete](self, "_updateViewIfFetchComplete");
            -[VUILibraryViewController _showContentOrNoContentView](self, "_showContentOrNoContentView");
            goto LABEL_25;
          }
        }
      }
    }
    else if (v7)
    {
      goto LABEL_25;
    }
    -[VUILibraryViewController _constructShelves](self, "_constructShelves");
    -[VUILibraryViewController setHasMediaEntitiesFetchCompleted:](self, "setHasMediaEntitiesFetchCompleted:", 1);
    -[VUILibraryViewController _updateViewIfFetchComplete](self, "_updateViewIfFetchComplete");
    goto LABEL_25;
  }
  -[VUILibraryViewController setHasPendingShelvesUpdate:](self, "setHasPendingShelvesUpdate:", 1);
LABEL_25:

}

- (VUILibraryShelvesDataSource)shelvesDataSource
{
  return self->_shelvesDataSource;
}

- (void)setViewHasAppearedAtLeastOnce:(BOOL)a3
{
  self->_viewHasAppearedAtLeastOnce = a3;
}

- (void)setHomeShares:(id)a3
{
  objc_storeStrong((id *)&self->_homeShares, a3);
}

- (void)setHasNewerBatchChanges:(BOOL)a3
{
  self->_hasNewerBatchChanges = a3;
}

- (void)setHasMenuItemFetchCompleted:(BOOL)a3
{
  self->_hasMenuItemFetchCompleted = a3;
}

- (void)setHasMediaEntitiesFetchCompleted:(BOOL)a3
{
  self->_hasMediaEntitiesFetchCompleted = a3;
}

- (void)setHasBatchChangesInProgress:(BOOL)a3
{
  self->_hasBatchChangesInProgress = a3;
}

- (void)setCurrentLibraryCategoryIsValid:(BOOL)a3
{
  self->_currentLibraryCategoryIsValid = a3;
}

- (VUIDownloadTableViewController)presentedDownloadViewController
{
  return self->_presentedDownloadViewController;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 4;
}

- (NSArray)menuCells
{
  return self->_menuCells;
}

- (void)loadView
{
  VUILibraryMenuItemViewCell *v3;
  VUILibraryMenuItemViewCell *menuItemSizingCell;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VUILibraryViewController;
  -[VUILibraryViewController loadView](&v11, sel_loadView);
  -[VUILibraryViewController _updateNavigationTitle](self, "_updateNavigationTitle");
  -[VUILibraryViewController _setupNavigationItemAccessoryView](self, "_setupNavigationItemAccessoryView");
  v3 = objc_alloc_init(VUILibraryMenuItemViewCell);
  menuItemSizingCell = self->_menuItemSizingCell;
  self->_menuItemSizingCell = v3;

  -[VUILibraryViewController contentPresenter](self, "contentPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRootViewForViewController:", self);

  objc_initWeak(&location, self);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__VUILibraryViewController_loadView__block_invoke;
  v8[3] = &unk_1E9F99F98;
  objc_copyWeak(&v9, &location);
  v7 = (id)-[VUILibraryViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSArray)homeShares
{
  return self->_homeShares;
}

- (BOOL)hasNewerBatchChanges
{
  return self->_hasNewerBatchChanges;
}

- (BOOL)hasMenuItemFetchCompleted
{
  return self->_hasMenuItemFetchCompleted;
}

- (BOOL)hasMediaEntitiesFetchCompleted
{
  return self->_hasMediaEntitiesFetchCompleted;
}

- (BOOL)hasBatchChangesInProgress
{
  return self->_hasBatchChangesInProgress;
}

- (VUIFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  BOOL v7;
  _BOOL4 v8;
  uint8_t v9[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Datasource fetch completed", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNetworkReachable");

  v7 = +[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount");
  v8 = -[VUILibraryViewController hasMenuItemFetchCompleted](self, "hasMenuItemFetchCompleted");
  if (!v6 || !v7)
  {
    if (v8)
    {
LABEL_10:
      -[VUILibraryViewController _updateViewIfFetchComplete](self, "_updateViewIfFetchComplete");
      return;
    }
LABEL_9:
    -[VUILibraryViewController setHasMenuItemFetchCompleted:](self, "setHasMenuItemFetchCompleted:", 1);
    goto LABEL_10;
  }
  if (!v8)
    goto LABEL_9;
  if (-[VUILibraryViewController hasBatchChangesInProgress](self, "hasBatchChangesInProgress"))
    -[VUILibraryViewController setHasNewerBatchChanges:](self, "setHasNewerBatchChanges:", 1);
  else
    -[VUILibraryViewController _applyBatchChanges](self, "_applyBatchChanges");
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)configureWithCollectionView:(id)a3
{
  objc_msgSend(a3, "setDataSource:", self);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;

  v6 = a3;
  switch(a4)
  {
    case 0:
      -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "type") == 1;

      break;
    case 1:
      v9 = 1064;
      goto LABEL_7;
    case 2:
      v9 = 1080;
      goto LABEL_7;
    case 3:
      v9 = 1112;
LABEL_7:
      v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v9), "count");
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  double Width;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  VUILibraryBannerCollectionViewCell *bannerViewSizingCell;
  VUILibraryBannerCollectionViewCell *v16;
  VUILibraryBannerCollectionViewCell *v17;
  VUILibraryBannerCollectionViewCell *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  double v43;
  double v44;
  double v45;
  CGSize result;
  CGRect v47;

  v6 = a5;
  -[VUILibraryViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  Width = CGRectGetWidth(v47);

  switch(objc_msgSend(v6, "section"))
  {
    case 0:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:", CFSTR("LIBRARY_BANNER_LOCAL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0CB3940];
      -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      bannerViewSizingCell = self->_bannerViewSizingCell;
      if (!bannerViewSizingCell)
      {
        v16 = [VUILibraryBannerCollectionViewCell alloc];
        v17 = -[VUILibraryBannerCollectionViewCell initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v18 = self->_bannerViewSizingCell;
        self->_bannerViewSizingCell = v17;

        bannerViewSizingCell = self->_bannerViewSizingCell;
      }
      -[VUILibraryBannerCollectionViewCell titleLabel](bannerViewSizingCell, "titleLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryBannerCollectionViewCell titleLabel](self->_bannerViewSizingCell, "titleLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v14, v20, v21);

      -[VUILibraryBannerCollectionViewCell sizeThatFits:](self->_bannerViewSizingCell, "sizeThatFits:", Width, 1.79769313e308);
      v24 = v23;

      goto LABEL_9;
    case 1:
      v25 = -[NSArray count](self->_menuCells, "count");
      if (v25 <= objc_msgSend(v6, "row"))
        v26 = 0;
      else
        v26 = objc_msgSend(v6, "row");
      -[NSArray objectAtIndex:](self->_menuCells, "objectAtIndex:", v26);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (int)objc_msgSend(v36, "intValue");

      -[VUILibraryViewController _localizedTitleForCellType:](self, "_localizedTitleForCellType:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMenuItemViewCell titleLabel](self->_menuItemSizingCell, "titleLabel");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "textLayout");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMenuItemViewCell titleLabel](self->_menuItemSizingCell, "titleLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v38, v40, v41);

      -[VUILibraryMenuItemViewCell sizeThatFits:](self->_menuItemSizingCell, "sizeThatFits:", Width, 1.79769313e308);
      v24 = v43;
      break;
    case 2:
      -[NSArray objectAtIndexedSubscript:](self->_homeShares, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMenuItemViewCell titleLabel](self->_menuItemSizingCell, "titleLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "textLayout");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMenuItemViewCell titleLabel](self->_menuItemSizingCell, "titleLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v27, v29, v30);

      -[VUILibraryMenuItemViewCell sizeThatFits:](self->_menuItemSizingCell, "sizeThatFits:", Width, 1.79769313e308);
      v24 = v32;
LABEL_9:

      break;
    case 3:
      -[NSMutableArray objectAtIndex:](self->_shelves, "objectAtIndex:", objc_msgSend(v6, "item"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sizeThatFits:", Width, 1.79769313e308);
      v24 = v35;

      break;
    default:
      Width = *MEMORY[0x1E0C9D820];
      v24 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
  }

  v44 = Width;
  v45 = v24;
  result.height = v45;
  result.width = v44;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  VUISeparatorView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  VUISeparatorView *v32;

  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v7, "section"))
  {
    case 0:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:", CFSTR("LIBRARY_BANNER_LOCAL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0CB3940];
      -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v12);
      v13 = (VUISeparatorView *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUILibraryBannerCellReuseIdentifier"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "titleLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "titleLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v13, v16, v17);

      goto LABEL_13;
    case 1:
      -[NSArray objectAtIndex:](self->_menuCells, "objectAtIndex:", objc_msgSend(v7, "row"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (int)objc_msgSend(v19, "intValue");

      -[VUILibraryViewController _symbolNameForCellType:](self, "_symbolNameForCellType:", v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUILibraryMenuCellReuseIdentifier"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "titleLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "textLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setColor:", v23);

      }
      -[VUILibraryViewController _localizedTitleForCellType:](self, "_localizedTitleForCellType:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "titleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v24, v22, v25);

      if (objc_msgSend(v7, "row"))
      {
        objc_msgSend(v14, "setTopSeparatorView:", 0);
      }
      else
      {
        v32 = objc_alloc_init(VUISeparatorView);
        objc_msgSend(v14, "setTopSeparatorView:", v32);

      }
      objc_msgSend(v14, "setImageName:", v9);

      goto LABEL_16;
    case 2:
      -[NSArray objectAtIndex:](self->_homeShares, "objectAtIndex:", objc_msgSend(v7, "row"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUILibraryMenuCellReuseIdentifier"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "titleLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "textLayout");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "titleLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v27, v29, v30);

      if (-[NSArray count](self->_menuCells, "count") || objc_msgSend(v7, "row"))
        goto LABEL_10;
      goto LABEL_12;
    case 3:
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUILibraryCollectionCellReuseIdentifier"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_shelves, "objectAtIndex:", objc_msgSend(v7, "item"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setViewController:", v9);
      if (objc_msgSend(v7, "row"))
      {
LABEL_12:
        v13 = objc_alloc_init(VUISeparatorView);
        objc_msgSend(v14, "setTopSeparatorView:", v13);
LABEL_13:

      }
      else
      {
LABEL_10:
        objc_msgSend(v14, "setTopSeparatorView:", 0);
      }
LABEL_16:

      break;
    default:
      v14 = 0;
      break;
  }

  return v14;
}

- (void)_updateVisibleCellSeparators
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "indexPathForCell:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v11, "row"))
            objc_msgSend(v9, "setTopSeparatorView:", 0);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_updateViewIfFetchComplete
{
  if (-[VUILibraryViewController _haveAllInitialFetchesCompleted](self, "_haveAllInitialFetchesCompleted"))
    -[VUILibraryViewController _constructLibraryDataSourceAndUpdateActiveView](self, "_constructLibraryDataSourceAndUpdateActiveView");
}

- (void)_updateNavigationTitle
{
  void *v3;
  uint64_t v4;
  id v5;

  -[VUILibraryViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUILibraryViewController _navigationBarTitle](self, "_navigationBarTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v3);
  if (objc_msgSend(MEMORY[0x1E0DC69D0], "isPhone"))
    v4 = 3;
  else
    v4 = 1;
  objc_msgSend(v5, "setLargeTitleDisplayMode:", v4);
  objc_msgSend(v5, "_setSupportsTwoLineLargeTitles:", 1);

}

- (id)_symbolNameForCellType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return &stru_1E9FF3598;
  else
    return off_1E9FA33B8[a3 - 1];
}

- (void)_showContentOrNoContentView
{
  uint64_t v3;
  id v4;

  if (-[VUILibraryViewController _shouldShowContentView](self, "_shouldShowContentView"))
  {
    v3 = 3;
  }
  else
  {
    if (-[VUILibraryViewController _didFailUpdateCloudLibrary](self, "_didFailUpdateCloudLibrary"))
      v3 = 4;
    else
      v3 = 2;
    -[VUILibraryViewController _startMonitoringDeviceMediaLibraryInitialUpdate](self, "_startMonitoringDeviceMediaLibraryInitialUpdate");
  }
  -[VUILibraryViewController contentPresenter](self, "contentPresenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentContentViewType:", v3);

}

- (BOOL)_shouldShowContentView
{
  BOOL v3;

  v3 = -[NSArray count](self->_menuCells, "count")
    || -[NSArray count](self->_homeShares, "count")
    || -[NSMutableArray count](self->_shelves, "count") != 0;
  return v3 & +[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount");
}

- (void)_setupNavigationItemAccessoryView
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Library:: appController doesn't exists, other tabs is not showing; don't display account setting button",
    v1,
    2u);
}

- (void)_resetNavigationBar
{
  void *v2;
  void *v3;
  id v4;

  -[VUILibraryViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  objc_msgSend(v4, "_setTitleOpacity:", 1.0);
  objc_msgSend(v4, "_setBackgroundOpacity:", 1.0);
  objc_msgSend(v4, "setPrefersLargeTitles:", 1);

}

- (void)_removeDownloadViewController
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] removeDownloadViewController", v13, 2u);
    }

    -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "willMoveToParentViewController:", 0);

    -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromParentViewController");

    -[VUILibraryViewController setPresentedDownloadViewController:](self, "setPresentedDownloadViewController:", 0);
    -[VUILibraryViewController _navigationBarTitle](self, "_navigationBarTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController setTitle:](self, "setTitle:", v9);

    -[VUILibraryViewController contentPresenter](self, "contentPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryStackViewController stackView](self, "stackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentView:", v11);

    -[VUILibraryViewController contentPresenter](self, "contentPresenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentContentViewType:", 3);

    -[VUILibraryViewController setCurrentLibraryCategoryIsValid:](self, "setCurrentLibraryCategoryIsValid:", 0);
    -[VUILibraryViewController setIsPresentingDownloads:](self, "setIsPresentingDownloads:", 0);
  }
}

- (id)_navigationBarTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 1)
  {
    -[VUIMediaLibrary title](self->_mediaLibrary, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:", CFSTR("LIBRARY"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("DOWNLOADED"));
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:

    v4 = (void *)v8;
    return v4;
  }
  -[VUILibraryViewController familyMember](self, "familyMember");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("LIBRARY_FAMILY_SHARING_HEADER"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController familyMember](self, "familyMember");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v13);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v11;
    goto LABEL_8;
  }
  return v4;
}

- (id)_menuItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[VUILibraryViewController menuDataSource](self, "menuDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainMenuItemsWithDefaultItemsForIphone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v26 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v6);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v16, "longValue") == 2)
        {
          v12 = 1;
        }
        else if (objc_msgSend(v16, "longValue") == 3)
        {
          v13 = 1;
        }
        else if (objc_msgSend(v16, "longValue") == 5)
        {
          v11 = 1;
        }
        else if (objc_msgSend(v16, "longValue") == 7)
        {
          v9 = 1;
        }
        else if (objc_msgSend(v16, "longValue") == 8)
        {
          v26 = 1;
        }
        else
        {
          v10 |= objc_msgSend(v16, "longValue") == 0;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v26 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }

  v17 = (void *)objc_opt_new();
  v18 = v17;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v17, "addObject:", &unk_1EA0BA0A8);
    if ((v13 & 1) == 0)
    {
LABEL_23:
      if ((v12 & 1) == 0)
        goto LABEL_24;
      goto LABEL_34;
    }
  }
  else if ((v13 & 1) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(v18, "addObject:", &unk_1EA0BA078);
  if ((v12 & 1) == 0)
  {
LABEL_24:
    if ((v11 & 1) == 0)
      goto LABEL_25;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v18, "addObject:", &unk_1EA0BA060);
  if ((v11 & 1) == 0)
  {
LABEL_25:
    if ((v9 & 1) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_35:
  objc_msgSend(v18, "addObject:", &unk_1EA0BA090);
  if ((v9 & 1) != 0)
LABEL_26:
    objc_msgSend(v18, "addObject:", &unk_1EA0BA0C0);
LABEL_27:
  if ((v26 & 1) != 0)
    objc_msgSend(v18, "addObject:", &unk_1EA0BA0D8);
  -[VUILibraryViewController menuDataSource](self, "menuDataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "menuItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "genreMenuItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
    objc_msgSend(v18, "addObject:", &unk_1EA0BA0F0);
  v23 = (void *)objc_msgSend(v18, "copy");

  return v23;
}

- (id)_localizedTitleForCellType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  switch(a3)
  {
    case 1:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_MOVIES");
      goto LABEL_11;
    case 2:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_TVSHOWS");
      goto LABEL_11;
    case 3:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_HOME_VIDEOS");
      goto LABEL_11;
    case 4:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_FAMILY_SHARING");
      goto LABEL_11;
    case 5:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("DOWNLOADED");
      goto LABEL_11;
    case 6:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("RECENTLY_ADDED");
      goto LABEL_11;
    case 7:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("EMPTY_PURCHASES");
      goto LABEL_11;
    case 8:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_GENRES_HEADER");
LABEL_11:
      objc_msgSend(v3, "localizedStringForKey:", v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = &stru_1E9FF3598;
      break;
  }
  return v6;
}

- (BOOL)_isDeviceMediaLibraryInitialUpdateInProgress
{
  void *v2;
  void *v3;
  char v4;

  -[VUILibraryViewController _deviceMediaLibrary](self, "_deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isInitialUpdateInProgress");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_haveAllInitialFetchesCompleted
{
  return self->_hasMenuItemFetchCompleted && self->_hasMediaEntitiesFetchCompleted;
}

- (id)_deviceMediaLibrary
{
  void *v2;
  id v3;

  -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)_dataSourceForShelves
{
  NSMutableArray *v3;
  NSMutableArray *validShelfTypes;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  VUIFamilySharingLibraryShelvesDataSource *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  VUIMPLibraryShelvesDataSource *v14;
  void *v15;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  validShelfTypes = self->_validShelfTypes;
  self->_validShelfTypes = v3;

  -[VUILibraryViewController familyMember](self, "familyMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");

    if (!v7)
      -[NSMutableArray addObject:](self->_validShelfTypes, "addObject:", &unk_1EA0BA048);
  }
  -[NSMutableArray addObject:](self->_validShelfTypes, "addObject:", &unk_1EA0BA060);
  -[NSMutableArray addObject:](self->_validShelfTypes, "addObject:", &unk_1EA0BA078);
  -[VUILibraryViewController familyMember](self, "familyMember");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else if (self->_doesDeviceSupportHDR)
  {
    -[NSMutableArray addObject:](self->_validShelfTypes, "addObject:", &unk_1EA0BA090);
  }
  -[VUILibraryViewController familyMember](self, "familyMember");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [VUIFamilySharingLibraryShelvesDataSource alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_validShelfTypes);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController familyMember](self, "familyMember");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VUIFamilySharingLibraryShelvesDataSource initWithValidShelfTypes:withFamilyMember:](v10, "initWithValidShelfTypes:withFamilyMember:", v11, v12);
  }
  else
  {
    v14 = [VUIMPLibraryShelvesDataSource alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_validShelfTypes);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VUIMPLibraryShelvesDataSource initWithValidShelfTypes:forMediaLibrary:](v14, "initWithValidShelfTypes:forMediaLibrary:", v11, v12);
  }
  v15 = (void *)v13;

  objc_msgSend(v15, "setShelvesDelegate:", self);
  objc_msgSend(v15, "startFetch");
  return v15;
}

- (void)_constructShelves
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  VUILibraryShelfCollectionViewController *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[VUILibraryViewController shelves](self, "shelves");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[VUILibraryViewController validShelfTypes](self, "validShelfTypes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        -[VUILibraryViewController shelvesDataSource](self, "shelvesDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dataSourcesByShelfType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "mediaEntities");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14)
        {
          v15 = -[VUILibraryShelfCollectionViewController initWithDataSource:]([VUILibraryShelfCollectionViewController alloc], "initWithDataSource:", v12);
          -[VUILibraryViewController _configureShelfViewController:withShelfType:](self, "_configureShelfViewController:withShelfType:", v15, objc_msgSend(v9, "unsignedIntegerValue"));
          -[VUILibraryViewController shelves](self, "shelves");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v15);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (void)_constructLibraryDataSourceAndUpdateActiveView
{
  void *v3;
  NSObject *v4;
  NSUInteger v5;
  NSArray *v6;
  NSArray *menuCells;
  NSObject *v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  dispatch_time_t v20;
  void *v21;
  _QWORD block[5];
  uint8_t buf[4];
  NSUInteger v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[VUILibraryViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSArray count](self->_menuCells, "count");
    *(_DWORD *)buf = 134217984;
    v24 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] before update, menu cells count is %lu", buf, 0xCu);
  }

  if (-[VUILibraryViewController hasBatchChangesInProgress](self, "hasBatchChangesInProgress"))
  {
    -[VUILibraryViewController setHasNewerBatchChanges:](self, "setHasNewerBatchChanges:", 1);
  }
  else
  {
    -[VUILibraryViewController _menuItems](self, "_menuItems");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    menuCells = self->_menuCells;
    self->_menuCells = v6;

  }
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[NSArray count](self->_menuCells, "count");
    *(_DWORD *)buf = 134217984;
    v24 = v9;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] after update, menu cells count is %lu", buf, 0xCu);
  }

  -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "type"))
    goto LABEL_14;
  -[VUILibraryViewController menuDataSource](self, "menuDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "validCategories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", &unk_1EA0BA108);

  if (v13)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeShareMediaLibraries");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = v14;
    else
      v16 = MEMORY[0x1E0C9AA60];
    -[VUILibraryViewController setHomeShares:](self, "setHomeShares:", v16);

LABEL_14:
  }
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isNetworkReachable");

  if (v18
    && (+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount")
     || !-[VUILibraryViewController _downloadsAreAvailable](self, "_downloadsAreAvailable")))
  {
    -[VUILibraryViewController _removeDownloadViewController](self, "_removeDownloadViewController");
    -[VUILibraryViewController _showContentOrNoContentView](self, "_showContentOrNoContentView");
    if (!-[VUILibraryViewController hasBatchChangesInProgress](self, "hasBatchChangesInProgress"))
    {
      -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reloadData");

    }
    if (!self->_ppt_isLoaded)
    {
      v20 = dispatch_time(0, 10000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__VUILibraryViewController__constructLibraryDataSourceAndUpdateActiveView__block_invoke;
      block[3] = &unk_1E9F98DF0;
      block[4] = self;
      dispatch_after(v20, MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    -[VUILibraryViewController _presentDownloadViewController](self, "_presentDownloadViewController");
  }
  -[VUILibraryViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[VUILibraryViewController navigationController](self, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNeedsStatusBarAppearanceUpdate");

}

- (void)_configureShelfViewController:(id)a3 withShelfType:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_localizedTitleForShelfType:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      v11 = CFSTR("LIBRARY_HDR_SUBTITLE_PAD");
    else
      v11 = CFSTR("LIBRARY_HDR_SUBTITLE_PHONE");
    objc_msgSend(v9, "localizedStringForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v6, "setHeaderTitle:andSubtitle:", v13, v12);
  objc_msgSend(v6, "setShelfType:", a4);
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)_applyBatchChanges
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSArray *menuCells;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  char v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  VUILibraryViewController *v45;
  id v46;
  id v47;
  _QWORD v48[5];
  _QWORD aBlock[5];
  uint8_t buf[4];
  NSArray *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  -[VUILibraryViewController setHasBatchChangesInProgress:](self, "setHasBatchChangesInProgress:", 1);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke;
  aBlock[3] = &unk_1E9FA3258;
  aBlock[4] = self;
  v30 = _Block_copy(aBlock);
  v48[0] = v3;
  v48[1] = 3221225472;
  v48[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_4;
  v48[3] = &unk_1E9F9B4F8;
  v48[4] = self;
  v4 = _Block_copy(v48);
  -[VUILibraryViewController _menuItems](self, "_menuItems");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DC6998]);
  -[VUILibraryViewController menuCells](self, "menuCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  v34 = (void *)v5;
  objc_msgSend(v6, "changeSetFromObjects:toObjects:identifierBlock:isEqualBlock:", v7, v5, &__block_literal_global_137, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hasChanges");
  -[VUILibraryViewController homeShares](self, "homeShares");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeShareMediaLibraries");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x1E0C9AA60];
  if (v12)
    v14 = (void *)v12;
  v15 = v14;

  v32 = objc_alloc_init(MEMORY[0x1E0DC6998]);
  objc_msgSend(v32, "changeSetFromObjects:toObjects:identifierBlock:isEqualBlock:", v10, v15, &__block_literal_global_139, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasChanges");
  v41[0] = v3;
  v41[1] = 3221225472;
  v41[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_7;
  v41[3] = &unk_1E9FA3328;
  v18 = v10;
  v42 = v18;
  v19 = v15;
  v43 = v19;
  v20 = v16;
  v44 = v20;
  v45 = self;
  v21 = v30;
  v46 = v21;
  v22 = v4;
  v47 = v22;
  v23 = _Block_copy(v41);
  v24 = v23;
  if (v9)
  {
    v31 = v18;
    VUIDefaultLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      menuCells = self->_menuCells;
      *(_DWORD *)buf = 138412802;
      v51 = menuCells;
      v52 = 2112;
      v53 = v34;
      v54 = 2112;
      v55 = v8;
      _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "Apply ChangeSet To The Categories Section: Current Menu Items: %@, Latest Menu Items: %@, Changes: %@", buf, 0x20u);
    }

    -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_142;
    v39[3] = &unk_1E9FA3300;
    v39[4] = self;
    v29 = v34;
    v40 = v34;
    v35[0] = v28;
    v35[1] = 3221225472;
    v35[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_2_143;
    v35[3] = &unk_1E9FA3350;
    v38 = v17;
    v36 = v24;
    v37 = v22;
    objc_msgSend(v27, "vui_applyChangeSet:inSection:updateDataSourceBlock:applyChangeBlock:completionHandler:", v8, 1, v39, v21, v35);

    v18 = v31;
  }
  else
  {
    if (v17)
      (*((void (**)(void *))v23 + 2))(v23);
    else
      -[VUILibraryViewController setHasBatchChangesInProgress:](self, "setHasBatchChangesInProgress:", 0);
    v29 = v34;
  }

}

- (void)_addNotificationObserversWithDeviceLibrary:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__homeShareMediaLibrariesDidChange_, CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__networkReachabilityDidChange_, *MEMORY[0x1E0DC6B70], 0);

}

- (void)_addMediaLibraryNotificationObservers
{
  void *v3;
  void *v4;

  -[VUILibraryViewController _deviceMediaLibrary](self, "_deviceMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[VUILibraryViewController _addNotificationObserversWithDeviceLibrary:](self, "_addNotificationObserversWithDeviceLibrary:", v3);
    v3 = v4;
  }

}

+ (id)_localizedTitleForShelfType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  switch(a3)
  {
    case 0:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("RENTALS");
      goto LABEL_7;
    case 1:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_RECENT_SHOWS");
      goto LABEL_7;
    case 2:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_RECENT_MOVIES");
      goto LABEL_7;
    case 3:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("LIBRARY_HDR_TITLE");
LABEL_7:
      objc_msgSend(v3, "localizedStringForKey:", v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = &stru_1E9FF3598;
      break;
  }
  return v6;
}

- (VUILibraryViewController)initWithMenuDataSource:(id)a3 familyMember:(id)a4
{
  id v7;
  id v8;
  VUILibraryViewController *v9;
  VUILibraryViewController *v10;
  void *v11;
  uint64_t v12;
  VUIMediaLibrary *mediaLibrary;
  NSObject *v14;
  uint64_t v15;
  VUIViewControllerContentPresenter *v16;
  VUIViewControllerContentPresenter *contentPresenter;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)VUILibraryViewController;
  v9 = -[VUILibraryStackViewController init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_viewHasAppearedAtLeastOnce = 0;
    v9->_currentLibraryCategoryIsValid = 0;
    objc_storeStrong((id *)&v9->_menuDataSource, a3);
    objc_storeStrong((id *)&v10->_familyMember, a4);
    -[VUILibraryViewController menuDataSource](v10, "menuDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v10);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "mediaLibrary");
      v12 = objc_claimAutoreleasedReturnValue();
      mediaLibrary = v10->_mediaLibrary;
      v10->_mediaLibrary = (VUIMediaLibrary *)v12;

      VUIDefaultLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = -[VUIMediaLibrary type](v10->_mediaLibrary, "type");
        *(_DWORD *)buf = 134217984;
        v25 = v15;
        _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] library init with media library type %lu", buf, 0xCu);
      }

    }
    v10->_doesDeviceSupportHDR = SSDeviceIsHDRCapable();
    v16 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v10->_contentPresenter;
    v10->_contentPresenter = v16;

    -[VUIViewControllerContentPresenter setLogName:](v10->_contentPresenter, "setLogName:", CFSTR("VUILibraryViewController"));
    VUIDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      VUIBoolLogString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = (uint64_t)v19;
      _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "VUILibraryViewController _doesDeviceSupportHDR = %@", buf, 0xCu);

    }
    -[VUILibraryViewController view](v10, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccessibilityIdentifier:", v21);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[VUILibraryViewController _removeMediaLibraryNotificationObservers](self, "_removeMediaLibraryNotificationObservers");
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryViewController;
  -[VUILibraryViewController dealloc](&v3, sel_dealloc);
}

void __36__VUILibraryViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateViewIfFetchComplete");

}

uint64_t __43__VUILibraryViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __43__VUILibraryViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[VUILibraryViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactivePopGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
    return 1;
  -[VUILibraryViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {

  }
  else
  {
    v10 = -[VUILibraryViewController _gestureRecognizerShouldBegin](self, "_gestureRecognizerShouldBegin");

    if (v10)
      return 1;
  }
  return 0;
}

void __33__VUILibraryViewController_start__block_invoke_93(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__VUILibraryViewController_start__block_invoke_2_94;
  v3[3] = &unk_1E9F9A758;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __33__VUILibraryViewController_start__block_invoke_2_94(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!*(_BYTE *)(a1 + 40))
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "contentPresenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:", CFSTR("LIBRARY_HS_CONNECTION_FAILED_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNoContentErrorTitle:", v5);

    objc_msgSend(v10, "contentPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("LIBRARY_HS_CONNECTION_FAILED_DESCRIPTION"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNoContentErrorMessage:", v8);

    objc_msgSend(v10, "contentPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentContentViewType:", 2);

    WeakRetained = v10;
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  int64_t *v7;
  int64_t v8;
  uint64_t v9;
  VUIMediaLibrary *v10;
  VUILibraryViewController *v11;
  void *v12;
  VUILibraryViewController *v13;
  VUIMediaLibrary *currentHomeShareMediaLibrary;
  void *v15;
  id v16;

  v16 = a4;
  switch(objc_msgSend(v16, "section"))
  {
    case 0:
    case 3:
      goto LABEL_9;
    case 1:
      -[NSArray objectAtIndex:](self->_menuCells, "objectAtIndex:", objc_msgSend(v16, "row"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (int)objc_msgSend(v5, "intValue");

      -[VUILibraryViewController _selectLibraryCellType:](self, "_selectLibraryCellType:", v6);
      v7 = -[VUILibraryViewController _categoryForCellType:](self, "_categoryForCellType:", v6);
      if (v7)
      {
        v8 = *v7;
        free(v7);
        v9 = 1;
        goto LABEL_8;
      }
      v9 = 0;
      goto LABEL_7;
    case 2:
      -[NSArray objectAtIndexedSubscript:](self->_homeShares, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
      v10 = (VUIMediaLibrary *)objc_claimAutoreleasedReturnValue();
      v11 = [VUILibraryViewController alloc];
      +[VUILibraryMenuDataSourceFactory libraryMenuDataSourceForMediaLibrary:](VUILibraryMenuDataSourceFactory, "libraryMenuDataSourceForMediaLibrary:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[VUILibraryViewController initWithMenuDataSource:](v11, "initWithMenuDataSource:", v12);

      currentHomeShareMediaLibrary = self->_currentHomeShareMediaLibrary;
      self->_currentHomeShareMediaLibrary = v10;

      -[VUILibraryViewController navigationController](self, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1;
      objc_msgSend(v15, "pushViewController:animated:", v13, 1);

      v8 = 9;
      goto LABEL_8;
    default:
      v9 = 1;
LABEL_7:
      v8 = 1;
LABEL_8:
      -[VUILibraryViewController setCurrentLibraryCategory:](self, "setCurrentLibraryCategory:", v8);
      -[VUILibraryViewController setCurrentLibraryCategoryIsValid:](self, "setCurrentLibraryCategoryIsValid:", v9);
      -[VUILibraryViewController setCurrentLibraryCategoryIsFromShelf:](self, "setCurrentLibraryCategoryIsFromShelf:", 0);
LABEL_9:

      return;
  }
}

- (void)seeAllButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VUILibraryGridCollectionViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _VUILibrarySeeAllController *v20;
  _VUILibrarySeeAllController *currentSeeAllController;
  void *v22;
  id v23;

  v23 = a3;
  if (-[NSMutableArray containsObject:](self->_shelves, "containsObject:"))
  {
    -[VUILibraryShelvesDataSource dataSourcesByShelfType](self->_shelvesDataSource, "dataSourcesByShelfType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeysForObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");
      v9 = VUILibraryCategoryTypeFromShelfType(v8);
      -[VUILibraryViewController familyMember](self, "familyMember");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[VUILibraryViewController familyMember](self, "familyMember");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntitiesDataSourceFactory dataSourceForShelf:withFamilyMember:](VUIMediaEntitiesDataSourceFactory, "dataSourceForShelf:withFamilyMember:", v8, v11);
      }
      else
      {
        -[VUILibraryViewController menuDataSource](self, "menuDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mediaLibrary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUIMediaEntitiesDataSourceFactory dataSourceForShelf:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForShelf:withLibrary:", v8, v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -[VUILibraryGridCollectionViewController initWithDataSource:categoryType:]([VUILibraryGridCollectionViewController alloc], "initWithDataSource:categoryType:", v13, v9);
      -[VUILibraryViewController familyMember](self, "familyMember");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryGridCollectionViewController setFamilyMember:](v14, "setFamilyMember:", v15);

      objc_msgSend((id)objc_opt_class(), "_localizedTitleForShelfType:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryGridCollectionViewController setTitle:withLargeTitleDisplayEnabled:](v14, "setTitle:withLargeTitleDisplayEnabled:", v16, 0);

      -[VUILibraryViewController libraryBarButton](self, "libraryBarButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryGridCollectionViewController setLibraryBarButton:](v14, "setLibraryBarButton:", v17);

      -[VUILibraryGridCollectionViewController setForceBackButton:](v14, "setForceBackButton:", 1);
      +[VUILibraryMetrics pageStringForLibraryShelfType:](VUILibraryMetrics, "pageStringForLibraryShelfType:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("LibrarySeeAll"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryGridCollectionViewController setPageType:](v14, "setPageType:", v19);
      v20 = objc_alloc_init(_VUILibrarySeeAllController);
      currentSeeAllController = self->_currentSeeAllController;
      self->_currentSeeAllController = v20;

      -[_VUILibrarySeeAllController setGridViewController:](self->_currentSeeAllController, "setGridViewController:", v14);
      -[_VUILibrarySeeAllController setShelfType:](self->_currentSeeAllController, "setShelfType:", v8);
      -[VUILibraryViewController navigationController](self, "navigationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pushViewController:animated:", v14, 1);

    }
  }

}

- (void)shelfCollectionViewController:(id)a3 collectionView:(id)a4 didSelectMediaEntity:(id)a5 atIndexPath:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v8 = a5;
  v9 = a3;
  -[VUILibraryViewController familyMember](self, "familyMember");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILibraryViewFactory viewControllerForMediaEntity:withFamilyMember:](VUILibraryViewFactory, "viewControllerForMediaEntity:withFamilyMember:", v8, v10);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Library.id=\"%@\"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", v16);

  v17 = objc_msgSend(v9, "shelfType");
  -[VUILibraryViewController setCurrentLibraryCategory:](self, "setCurrentLibraryCategory:", -[VUILibraryViewController _categoryForShelfType:](self, "_categoryForShelfType:", v17));
  -[VUILibraryViewController setCurrentLibraryCategoryIsFromShelf:](self, "setCurrentLibraryCategoryIsFromShelf:", 1);
  -[VUILibraryViewController setCurrentLibraryCategoryIsValid:](self, "setCurrentLibraryCategoryIsValid:", 1);
  -[VUILibraryViewController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pushViewController:animated:", v19, 1);

  +[VUILibraryMetrics recordClickOnMediaEntity:](VUILibraryMetrics, "recordClickOnMediaEntity:", v8);
}

- (void)familyMemberViewController:(id)a3 didSelectFamilyMember:(id)a4
{
  id v5;
  VUILibraryViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  +[VUILibraryMenuDataSourceFactory libraryMenuDataSourceForFamilyMember:](VUILibraryMenuDataSourceFactory, "libraryMenuDataSourceForFamilyMember:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[VUILibraryViewController initWithMenuDataSource:familyMember:]([VUILibraryViewController alloc], "initWithMenuDataSource:familyMember:", v11, v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library.id=\"%@\"), CFSTR("FamilyMemberLibrary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryViewController view](v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v9);

  -[VUILibraryViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v6, 1);

}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __46__VUILibraryViewController__applyBatchChanges__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "Apply ChangeSet To The Home Shares Section: Current Home Shares: %@, Latest Home Shares: %@, ChangeSet: %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 56), "stackCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_140;
  v8[3] = &unk_1E9FA3300;
  v7 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "vui_applyChangeSet:inSection:updateDataSourceBlock:applyChangeBlock:completionHandler:", v7, 2, v8, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_140(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1080), *(id *)(a1 + 40));
}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_142(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1064), *(id *)(a1 + 40));
}

uint64_t __46__VUILibraryViewController__applyBatchChanges__block_invoke_2_143(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_selectLibraryCellType:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[VUILibraryViewController _viewControllerWithCellType:](self, "_viewControllerWithCellType:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VUILibraryViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 6)
  {
    v7 = (id)objc_msgSend(v5, "popToViewController:animated:", self, 0);
  }
  else if (v8)
  {
    objc_msgSend(v5, "pushViewController:animated:", v8, 1);
  }

}

- (id)_viewControllerWithCellType:(int64_t)a3
{
  void *v3;
  VUILibraryGridCollectionViewController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  VUILibraryFamilyMembersDataSource *v14;
  VUIFamilyMembersViewController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __objc2_class **v21;
  void *v22;
  VUIMenuDataSource *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  VUIMenuCollectionViewController *v31;
  VUILibraryGenresMenuCollectionConfiguration *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  CGRect v43;

  v3 = 0;
  v6 = 0;
  switch(a3)
  {
    case 1:
      -[VUILibraryViewController familyMember](self, "familyMember");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[VUILibraryViewController familyMember](self, "familyMember");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 2;
        v10 = 2;
        goto LABEL_6;
      }
      -[VUILibraryViewController menuDataSource](self, "menuDataSource");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "mediaLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = 2;
      v13 = 2;
      goto LABEL_19;
    case 2:
      -[VUILibraryViewController familyMember](self, "familyMember");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[VUILibraryViewController familyMember](self, "familyMember");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 3;
        v10 = 3;
LABEL_6:
        +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:withFamilyMember:](VUIMediaEntitiesDataSourceFactory, "dataSourceForCategoryType:withFamilyMember:", v10, v8);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[VUILibraryViewController menuDataSource](self, "menuDataSource");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "mediaLibrary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = 3;
        v13 = 3;
LABEL_19:
        +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForCategoryType:withLibrary:", v13, v8);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v3 = (void *)v12;
LABEL_21:

      if (v3)
      {
        v6 = -[VUILibraryGridCollectionViewController initWithDataSource:categoryType:]([VUILibraryGridCollectionViewController alloc], "initWithDataSource:categoryType:", v3, v9);
        -[VUILibraryViewController familyMember](self, "familyMember");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUILibraryGridCollectionViewController setFamilyMember:](v6, "setFamilyMember:", v35);

        -[VUILibraryViewController _localizedTitleForCellType:](self, "_localizedTitleForCellType:", a3);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUILibraryGridCollectionViewController setTitle:withLargeTitleDisplayEnabled:](v6, "setTitle:withLargeTitleDisplayEnabled:", v36, 1);

        -[VUILibraryViewController libraryBarButton](self, "libraryBarButton");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUILibraryGridCollectionViewController setLibraryBarButton:](v6, "setLibraryBarButton:", v37);

        +[VUILibraryMetrics pageStringForLibraryCellType:](VUILibraryMetrics, "pageStringForLibraryCellType:", a3);
        v14 = (VUILibraryFamilyMembersDataSource *)objc_claimAutoreleasedReturnValue();
        v38 = CFSTR("LibraryMain");
        -[VUILibraryViewController familyMember](self, "familyMember");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          v40 = CFSTR("FamilySharingLibraryMain");

          v38 = v40;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v38, v14);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUILibraryGridCollectionViewController setPageType:](v6, "setPageType:", v41);

LABEL_25:
      }
      else
      {
        v6 = 0;
      }
LABEL_27:

      return v6;
    case 3:
      -[VUILibraryViewController mediaLibrary](self, "mediaLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 5;
      v13 = 5;
      goto LABEL_19;
    case 4:
      v14 = objc_alloc_init(VUILibraryFamilyMembersDataSource);
      v15 = -[VUIFamilyMembersViewController initWithDataSource:]([VUIFamilyMembersViewController alloc], "initWithDataSource:", v14);
      v6 = (VUILibraryGridCollectionViewController *)v15;
      goto LABEL_14;
    case 5:
      v16 = (void *)MEMORY[0x1E0DC3F98];
      -[VUILibraryViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v18 = objc_msgSend(v16, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v43));

      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "aggregateMediaLibrary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForCategoryType:withLibrary:", 8, v20);
      v14 = (VUILibraryFamilyMembersDataSource *)objc_claimAutoreleasedReturnValue();

      v21 = &off_1E9F96CA8;
      if ((unint64_t)(v18 - 1) >= 3)
        v21 = off_1E9F96C98;
      v6 = (VUILibraryGridCollectionViewController *)objc_msgSend(objc_alloc(*v21), "initWithDataSource:", v14);
      goto LABEL_15;
    case 6:
      goto LABEL_27;
    case 7:
      -[VUILibraryViewController menuDataSource](self, "menuDataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "mediaLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForCategoryType:withLibrary:", 0, v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      goto LABEL_21;
    case 8:
      v23 = [VUIMenuDataSource alloc];
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryViewController menuDataSource](self, "menuDataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "menuItems");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "genreMenuItems");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[VUIMenuDataSource initWithMainMenuItems:genreMenuItems:](v23, "initWithMainMenuItems:genreMenuItems:", v24, v27);

      -[VUILibraryViewController menuDataSource](self, "menuDataSource");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "menuItems");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "genreTypes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryFamilyMembersDataSource setGenreTypes:](v14, "setGenreTypes:", v30);

      v31 = [VUIMenuCollectionViewController alloc];
      v32 = objc_alloc_init(VUILibraryGenresMenuCollectionConfiguration);
      v6 = -[VUIMenuCollectionViewController initWithCategories:gridConfiguration:](v31, "initWithCategories:gridConfiguration:", v14, v32);

      -[VUILibraryGridCollectionViewController setShouldDeselectOnViewAppear:](v6, "setShouldDeselectOnViewAppear:", 1);
      v15 = (VUIFamilyMembersViewController *)v6;
LABEL_14:
      -[VUIFamilyMembersViewController setDelegate:](v15, "setDelegate:", self);
LABEL_15:
      v3 = 0;
      goto LABEL_25;
    default:
      v6 = 0;
      goto LABEL_27;
  }
}

- (void)_homeShareMediaLibrariesDidChange:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id location;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyMediaLibraries"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyChangeSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VUILibraryViewController _haveAllInitialFetchesCompleted](self, "_haveAllInitialFetchesCompleted"))
  {
    -[VUILibraryViewController homeShares](self, "homeShares");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vui_arrayByApplyingChangeSet:destinationObjects:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (self->_currentHomeShareMediaLibrary && (objc_msgSend(v9, "containsObject:") & 1) == 0)
    {
      objc_initWeak(&location, self);
      v11 = (void *)MEMORY[0x1E0DC3450];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:", CFSTR("LIBRARY_HS_UNAVAILABLE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", 0, v13, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0DC3448];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:", CFSTR("OK"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __62__VUILibraryViewController__homeShareMediaLibrariesDidChange___block_invoke;
      v19[3] = &unk_1E9FA3378;
      objc_copyWeak(&v20, &location);
      v19[4] = self;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "addAction:", v17);
      -[UIViewController vui_presentViewController:animated:completion:](self, "vui_presentViewController:animated:completion:", v18, 1, 0);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    if (v7 && objc_msgSend(v7, "hasChanges"))
    {
      if (-[VUILibraryViewController hasBatchChangesInProgress](self, "hasBatchChangesInProgress"))
        -[VUILibraryViewController setHasNewerBatchChanges:](self, "setHasNewerBatchChanges:", 1);
      else
        -[VUILibraryViewController _applyBatchChanges](self, "_applyBatchChanges");
    }
    else
    {
      objc_storeStrong((id *)&self->_homeShares, v10);
    }

  }
  else
  {
    -[VUILibraryViewController setHomeShares:](self, "setHomeShares:", v6);
  }

}

void __62__VUILibraryViewController__homeShareMediaLibrariesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "popToViewController:animated:", *(_QWORD *)(a1 + 32), 1);

}

- (void)didSelectMenuItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VUILibraryGridCollectionViewController *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  -[VUILibraryViewController menuDataSource](self, "menuDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "genreMenuItems");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "row");
  objc_msgSend(v22, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryViewController familyMember](self, "familyMember");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[VUILibraryViewController menuDataSource](self, "menuDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getGenreByGenreTitle:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUILibraryViewController familyMember](self, "familyMember");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntitiesDataSourceFactory dataSourceForGenre:withFamilyMember:](VUIMediaEntitiesDataSourceFactory, "dataSourceForGenre:withFamilyMember:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_8;
  }
  else
  {
    +[VUIMediaEntitiesDataSourceFactory dataSourceForGenre:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForGenre:withLibrary:", v8, self->_mediaLibrary);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_8;
  }
  v14 = -[VUILibraryGridCollectionViewController initWithDataSource:categoryType:]([VUILibraryGridCollectionViewController alloc], "initWithDataSource:categoryType:", v13, 10);
  -[VUILibraryGridCollectionViewController setTitle:withLargeTitleDisplayEnabled:](v14, "setTitle:withLargeTitleDisplayEnabled:", v8, 1);
  -[VUILibraryViewController libraryBarButton](self, "libraryBarButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController setLibraryBarButton:](v14, "setLibraryBarButton:", v15);

  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E9FF3598);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("LibraryMain");
  -[VUILibraryViewController familyMember](self, "familyMember");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = CFSTR("FamilySharingLibraryMain");

    v17 = v19;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v17, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryGridCollectionViewController setPageType:](v14, "setPageType:", v20);
  -[VUILibraryViewController navigationController](self, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pushViewController:animated:", v14, 1);

LABEL_8:
}

- (void)_networkReachabilityDidChange:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  VUIDownloadTableViewController *presentedDownloadViewController;
  void *v9;
  void *v10;
  void *v11;
  VUIDownloadTableViewController *v12;
  VUIDownloadTableViewController *v13;
  id v14;

  objc_msgSend(a3, "userInfo");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "vui_numberForKey:", *MEMORY[0x1E0DC6B78]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    -[VUILibraryViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "popToViewController:animated:", self, 0);

    -[VUILibraryViewController _resetNavigationBar](self, "_resetNavigationBar");
    if (self->_presentedDownloadViewController)
    {
      -[VUILibraryViewController _removeDownloadViewController](self, "_removeDownloadViewController");
      presentedDownloadViewController = self->_presentedDownloadViewController;
      self->_presentedDownloadViewController = 0;

    }
    else
    {
      -[VUILibraryViewController setCurrentLibraryCategoryIsValid:](self, "setCurrentLibraryCategoryIsValid:", 0);
    }
  }
  else if (!self->_presentedDownloadViewController)
  {
    -[VUILibraryViewController _resetNavigationBar](self, "_resetNavigationBar");
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aggregateMediaLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForCategoryType:withLibrary:", 8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[VUIDownloadTableViewController initWithDataSource:]([VUIDownloadTableViewController alloc], "initWithDataSource:", v11);
    v13 = self->_presentedDownloadViewController;
    self->_presentedDownloadViewController = v12;

    -[VUILibraryViewController _presentDownloadViewController](self, "_presentDownloadViewController");
  }

}

- (BOOL)_didFailUpdateCloudLibrary
{
  void *v2;
  char v3;

  -[VUILibraryViewController _deviceMediaLibrary](self, "_deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && +[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount"))
  {
    v3 = objc_msgSend(v2, "didFailUpdateCloudLibrary");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_startMonitoringDeviceMediaLibraryInitialUpdate
{
  void *v3;
  id v4;

  -[VUILibraryViewController _deviceMediaLibrary](self, "_deviceMediaLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__deviceMediaLibraryUpdateStateDidChange_, CFSTR("VUIDeviceMediaLibraryUpdateStateDidChangeNotification"), v4);

  }
}

- (void)_stopMonitoringDeviceMediaLibraryInitialUpdate
{
  void *v3;
  id v4;

  -[VUILibraryViewController _deviceMediaLibrary](self, "_deviceMediaLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("VUIDeviceMediaLibraryUpdateStateDidChangeNotification"), v4);

  }
}

- (void)_deviceMediaLibraryUpdateStateDidChange:(id)a3
{
  NSObject *v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Media Library Update state changed", (uint8_t *)&v14, 2u);
  }

  if (!+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount"))
  {
    if (-[VUILibraryViewController _downloadsAreAvailable](self, "_downloadsAreAvailable"))
    {
      -[VUILibraryViewController _presentDownloadViewController](self, "_presentDownloadViewController");
      return;
    }
    -[VUILibraryViewController contentPresenter](self, "contentPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 2;
    goto LABEL_15;
  }
  v5 = -[VUILibraryViewController _isDeviceMediaLibraryInitialUpdateInProgress](self, "_isDeviceMediaLibraryInitialUpdateInProgress");
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    VUIBoolLogString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Media library is update in progress:%@", (uint8_t *)&v14, 0xCu);

  }
  if (v5)
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "[VUILibraryViewController] _deviceMediaLibraryUpdateStateDidChange - update content view type to loading", (uint8_t *)&v14, 2u);
    }

    -[VUILibraryViewController contentPresenter](self, "contentPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 1;
LABEL_15:
    objc_msgSend(v9, "setCurrentContentViewType:", v11);
    goto LABEL_16;
  }
  -[VUILibraryViewController setHasMenuItemFetchCompleted:](self, "setHasMenuItemFetchCompleted:", 0);
  -[VUILibraryViewController setHasMediaEntitiesFetchCompleted:](self, "setHasMediaEntitiesFetchCompleted:", 0);
  -[VUILibraryViewController _stopMonitoringDeviceMediaLibraryInitialUpdate](self, "_stopMonitoringDeviceMediaLibraryInitialUpdate");
  -[VUILibraryViewController menuDataSource](self, "menuDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return;
  -[VUILibraryViewController menuDataSource](self, "menuDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "refetch");
LABEL_16:

}

- (void)_removeMediaLibraryNotificationObservers
{
  void *v3;
  void *v4;

  -[VUILibraryViewController _deviceMediaLibrary](self, "_deviceMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[VUILibraryViewController _removeNotificationObserversWithDeviceLibrary:](self, "_removeNotificationObserversWithDeviceLibrary:", v3);
    v3 = v4;
  }

}

- (void)_removeNotificationObserversWithDeviceLibrary:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeNotification"), 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC6B70], 0);
  -[VUILibraryViewController _stopMonitoringDeviceMediaLibraryInitialUpdate](self, "_stopMonitoringDeviceMediaLibraryInitialUpdate");

}

+ (id)shelfTypesSortComparator
{
  return &__block_literal_global_180_0;
}

uint64_t __52__VUILibraryViewController_shelfTypesSortComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int64_t)_categoryForCellType:(int64_t)a3
{
  int64_t *result;
  int64_t v5;

  result = (int64_t *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  switch(a3)
  {
    case 1:
      v5 = 2;
      goto LABEL_11;
    case 2:
      v5 = 3;
      goto LABEL_11;
    case 3:
      v5 = 5;
      goto LABEL_11;
    case 4:
      v5 = 7;
      goto LABEL_11;
    case 5:
      v5 = 8;
      goto LABEL_11;
    case 6:
      v5 = 1;
      goto LABEL_11;
    case 7:
      *result = 0;
      return result;
    case 8:
      v5 = 10;
LABEL_11:
      *result = v5;
      break;
    default:
      free(result);
      result = 0;
      break;
  }
  return result;
}

- (int64_t)_categoryForShelfType:(int64_t)a3
{
  int64_t v3;

  v3 = 4;
  if (a3 != 3)
    v3 = 1;
  if (a3)
    return v3;
  else
    return 6;
}

- (void)_accountsChanged:(id)a3
{
  NSObject *v4;
  const __CFString *v5;
  const __CFString *v6;
  _QWORD block[2];
  void (*v8)(uint64_t);
  void *v9;
  VUILibraryViewController *v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount"))
    {
      v5 = CFSTR("YES");
    }
    else
    {
      v5 = CFSTR("NO");
    }
    if (-[VUILibraryViewController _isDeviceMediaLibraryInitialUpdateInProgress](self, "_isDeviceMediaLibraryInitialUpdateInProgress"))
    {
      v6 = CFSTR("YES");
    }
    else
    {
      v6 = CFSTR("NO");
    }
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] _accountsChanged - has active account %@ - isInitialUpdateInProgress %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v8 = __45__VUILibraryViewController__accountsChanged___block_invoke;
  v9 = &unk_1E9F98DF0;
  v10 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v8((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __45__VUILibraryViewController__accountsChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  BOOL v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint8_t v11[16];

  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "[VUILibraryViewController] _accountsChanged - update content view type to loading", v11, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentContentViewType:", 1);

  v4 = +[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "_removeDownloadViewController");
  }
  else
  {
    if (objc_msgSend(v5, "_downloadsAreAvailable"))
      objc_msgSend(*(id *)(a1 + 32), "_presentDownloadViewController");
    v6 = objc_msgSend(*(id *)(a1 + 32), "_isDeviceMediaLibraryInitialUpdateInProgress");
    v7 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v7, "_startMonitoringDeviceMediaLibraryInitialUpdate");
    }
    else
    {
      objc_msgSend(v7, "setHasMediaEntitiesFetchCompleted:", 1);
      objc_msgSend(*(id *)(a1 + 32), "menuDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "menuDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "refetch");

      }
    }
  }
}

- (void)_presentDownloadViewController
{
  void *v3;
  VUILibraryViewController *v4;
  NSObject *v5;
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
  uint8_t v21[16];

  -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (VUILibraryViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] presentDownloadViewController", v21, 2u);
    }

    -[VUILibraryStackViewController stackView](self, "stackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[VUILibraryViewController _downloadViewController](self, "_downloadViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController setPresentedDownloadViewController:](self, "setPresentedDownloadViewController:", v7);

    -[VUILibraryViewController _navigationBarTitle](self, "_navigationBarTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController setTitle:](self, "setTitle:", v8);

    -[VUILibraryViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v11);

    -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController addChildViewController:](self, "addChildViewController:", v12);

    -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didMoveToParentViewController:", self);

    -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    objc_msgSend(v15, "setFrame:");

  }
  -[VUILibraryViewController contentPresenter](self, "contentPresenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryViewController presentedDownloadViewController](self, "presentedDownloadViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentView:", v19);

  -[VUILibraryViewController contentPresenter](self, "contentPresenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCurrentContentViewType:", 3);

  -[VUILibraryViewController setCurrentLibraryCategory:](self, "setCurrentLibraryCategory:", 8);
  -[VUILibraryViewController setCurrentLibraryCategoryIsValid:](self, "setCurrentLibraryCategoryIsValid:", 1);
  -[VUILibraryViewController setCurrentLibraryCategoryIsFromShelf:](self, "setCurrentLibraryCategoryIsFromShelf:", 0);
  -[VUILibraryViewController setIsPresentingDownloads:](self, "setIsPresentingDownloads:", 1);
}

- (BOOL)_gestureRecognizerShouldBegin
{
  VUILibraryViewController *v2;
  void *v3;
  VUIDownloadTableViewController *v4;

  v2 = self;
  -[VUILibraryViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (VUIDownloadTableViewController *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != v2->_presentedDownloadViewController;

  return (char)v2;
}

- (BOOL)_downloadsAreAvailable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[VUILibraryViewController _haveAllInitialFetchesCompleted](self, "_haveAllInitialFetchesCompleted"))
  {
    -[VUILibraryViewController menuDataSource](self, "menuDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "menuItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainMenuItemsWithDefaultItemsForIphone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "longValue", (_QWORD)v12) == 8)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)_downloadViewController
{
  void *v2;
  void *v3;
  void *v4;
  VUIDownloadTableViewController *v5;

  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aggregateMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForCategoryType:withLibrary:", 8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[VUIDownloadTableViewController initWithDataSource:]([VUIDownloadTableViewController alloc], "initWithDataSource:", v4);
  return v5;
}

- (BOOL)vui_ppt_isLoading
{
  return !self->_ppt_isLoaded;
}

- (void)setFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_familyMember, a3);
}

- (int64_t)currentLibraryCategory
{
  return self->_currentLibraryCategory;
}

- (void)setCurrentLibraryCategory:(int64_t)a3
{
  self->_currentLibraryCategory = a3;
}

- (BOOL)viewHasAppearedAtLeastOnce
{
  return self->_viewHasAppearedAtLeastOnce;
}

- (BOOL)currentLibraryCategoryIsFromShelf
{
  return self->_currentLibraryCategoryIsFromShelf;
}

- (void)setCurrentLibraryCategoryIsFromShelf:(BOOL)a3
{
  self->_currentLibraryCategoryIsFromShelf = a3;
}

- (BOOL)currentLibraryCategoryIsValid
{
  return self->_currentLibraryCategoryIsValid;
}

- (BOOL)isPresentingDownloads
{
  return self->_isPresentingDownloads;
}

- (void)setIsPresentingDownloads:(BOOL)a3
{
  self->_isPresentingDownloads = a3;
}

- (UIBarButtonItem)libraryBarButton
{
  return self->_libraryBarButton;
}

- (void)setLibraryBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_libraryBarButton, a3);
}

- (void)setContentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_contentPresenter, a3);
}

- (void)setMenuDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_menuDataSource, a3);
}

- (void)setMenuCells:(id)a3
{
  objc_storeStrong((id *)&self->_menuCells, a3);
}

- (VUILibraryMenuItemViewCell)menuItemSizingCell
{
  return self->_menuItemSizingCell;
}

- (void)setMenuItemSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_menuItemSizingCell, a3);
}

- (VUIMediaLibrary)currentHomeShareMediaLibrary
{
  return self->_currentHomeShareMediaLibrary;
}

- (void)setCurrentHomeShareMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_currentHomeShareMediaLibrary, a3);
}

- (VUILibraryBannerCollectionViewCell)bannerViewSizingCell
{
  return self->_bannerViewSizingCell;
}

- (void)setBannerViewSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_bannerViewSizingCell, a3);
}

- (void)setShelvesDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_shelvesDataSource, a3);
}

- (void)setShelves:(id)a3
{
  objc_storeStrong((id *)&self->_shelves, a3);
}

- (void)setValidShelfTypes:(id)a3
{
  objc_storeStrong((id *)&self->_validShelfTypes, a3);
}

- (_VUILibrarySeeAllController)currentSeeAllController
{
  return self->_currentSeeAllController;
}

- (void)setCurrentSeeAllController:(id)a3
{
  objc_storeStrong((id *)&self->_currentSeeAllController, a3);
}

- (BOOL)doesDeviceSupportHDR
{
  return self->_doesDeviceSupportHDR;
}

- (void)setDoesDeviceSupportHDR:(BOOL)a3
{
  self->_doesDeviceSupportHDR = a3;
}

- (BOOL)hasPendingShelvesUpdate
{
  return self->_hasPendingShelvesUpdate;
}

- (void)setHasPendingShelvesUpdate:(BOOL)a3
{
  self->_hasPendingShelvesUpdate = a3;
}

- (void)setPresentedDownloadViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedDownloadViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedDownloadViewController, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_currentSeeAllController, 0);
  objc_storeStrong((id *)&self->_validShelfTypes, 0);
  objc_storeStrong((id *)&self->_shelves, 0);
  objc_storeStrong((id *)&self->_shelvesDataSource, 0);
  objc_storeStrong((id *)&self->_bannerViewSizingCell, 0);
  objc_storeStrong((id *)&self->_currentHomeShareMediaLibrary, 0);
  objc_storeStrong((id *)&self->_homeShares, 0);
  objc_storeStrong((id *)&self->_menuItemSizingCell, 0);
  objc_storeStrong((id *)&self->_menuCells, 0);
  objc_storeStrong((id *)&self->_menuDataSource, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_libraryBarButton, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
