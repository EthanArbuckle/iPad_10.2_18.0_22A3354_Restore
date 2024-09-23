@implementation STSPicker

- (STSPicker)initWithSearchModel:(id)a3 showSuggestions:(BOOL)a4
{
  id v7;
  STSPicker *v8;
  STSPicker *v9;
  uint64_t v10;
  NSMutableSet *lastInsertedIndexesWaitingToLoad;
  uint64_t v12;
  NSMutableArray *displayedResults;
  dispatch_queue_t v14;
  OS_dispatch_queue *displayedResultsQueue;
  uint64_t v16;
  NSMutableSet *visibleResultsSent;
  uint64_t v18;
  NSMutableArray *debugItems;
  objc_super v21;

  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)STSPicker;
  v8 = -[STSPicker init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_searchModel, a3);
    v9->_showSuggestions = a4;
    -[STSSearchModel setDelegate:](v9->_searchModel, "setDelegate:", v9);
    v9->_sectionsTag = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    lastInsertedIndexesWaitingToLoad = v9->_lastInsertedIndexesWaitingToLoad;
    v9->_lastInsertedIndexesWaitingToLoad = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    displayedResults = v9->_displayedResults;
    v9->_displayedResults = (NSMutableArray *)v12;

    v14 = dispatch_queue_create("com.apple.messages.picker.displayedresultsq", 0);
    displayedResultsQueue = v9->_displayedResultsQueue;
    v9->_displayedResultsQueue = (OS_dispatch_queue *)v14;

    v16 = objc_opt_new();
    visibleResultsSent = v9->_visibleResultsSent;
    v9->_visibleResultsSent = (NSMutableSet *)v16;

    v9->_isSnapShotting = 0;
    v9->_debugMode = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    debugItems = v9->_debugItems;
    v9->_debugItems = (NSMutableArray *)v18;

  }
  return v9;
}

- (void)didReceiveMemoryWarning
{
  void *v2;
  uint8_t v3[16];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STSPicker;
  -[STSPicker didReceiveMemoryWarning](&v4, sel_didReceiveMemoryWarning);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Clear image cache for memory warning", v3, 2u);
  }
  +[STSImageCache sharedCache](STSImageCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearInMemoryCache");

}

- (void)loadView
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
  void *v15;
  void *v16;
  STSPickerView *v17;

  STSLocalizedString(CFSTR("POPULAR_RESULTS_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSPicker setTitle:](self, "setTitle:", v3);

  v17 = objc_alloc_init(STSPickerView);
  -[STSPickerView collectionView](v17, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[STSPickerView collectionView](v17, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollsToTop:", 1);

  -[STSPickerView collectionView](v17, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataSource:", self);

  -[STSPickerView collectionView](v17, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[STSPickerView collectionView](v17, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("STSGridLayoutElementKindHeader"), CFSTR("STSGridLayoutElementKindHeader"));

  -[STSPickerView collectionView](v17, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("STSGridLayoutElementKindFooter"), CFSTR("STSGridLayoutElementKindFooter"));

  -[STSPickerView collectionView](v17, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("STSImageCell"));

  -[STSPickerView collectionView](v17, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("STSVideoCell"));

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__handleLongPress_);
  objc_msgSend(v13, "setMinimumPressDuration:", 0.75);
  -[STSPickerView collectionView](v17, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addGestureRecognizer:", v13);

  if (STSIsInternalInstall())
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9B0]), "initWithTarget:action:", self, sel__handleDebugGesture_);
    objc_msgSend(v15, "setDirection:", 3);
    objc_msgSend(v15, "setNumberOfTouchesRequired:", 2);
    -[STSPickerView collectionView](v17, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addGestureRecognizer:", v15);

  }
  -[STSPicker setView:](self, "setView:", v17);

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *displayedResultsQueue;
  _QWORD block[5];

  displayedResultsQueue = self->_displayedResultsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__STSPicker_viewDidDisappear___block_invoke;
  block[3] = &unk_24E7457A8;
  block[4] = self;
  dispatch_async(displayedResultsQueue, block);
}

uint64_t __30__STSPicker_viewDidDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "removeAllObjects");
}

- (void)willMoveToParentViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  STSPicker *v18;
  void *v19;
  _QWORD v20[5];
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)STSPicker;
  -[STSPicker willMoveToParentViewController:](&v22, sel_willMoveToParentViewController_);
  -[STSSearchModel sections](self->_searchModel, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[STSPicker view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathsForVisibleItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __44__STSPicker_willMoveToParentViewController___block_invoke;
    v20[3] = &unk_24E745898;
    v11 = &v21;
    v20[4] = self;
    v21 = v7;
    v12 = v7;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v20);

  }
  else
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __44__STSPicker_willMoveToParentViewController___block_invoke_2;
    v17 = &unk_24E745898;
    v11 = &v19;
    v18 = self;
    v19 = v7;
    v13 = v7;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v14);

    +[STSImageCache sharedCache](STSImageCache, "sharedCache", v14, v15, v16, v17, v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clearInMemoryCache");
  }

}

void __44__STSPicker_willMoveToParentViewController___block_invoke(uint64_t a1, void *a2)
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
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v12, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "urlValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "pickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_fetchImageWithURL:priority:forCollectionView:atIndexPath:", v8, 0, v11, v12);

  }
}

void __44__STSPicker_willMoveToParentViewController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v11, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "urlValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STSImageCache sharedCache](STSImageCache, "sharedCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchCachedStaticImageForURL:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v10);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  UIViewControllerPreviewing *v8;
  UIViewControllerPreviewing *previewingContext;
  void *v10;
  id v11;

  -[STSPicker parentViewController](self, "parentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!self->_previewingContext)
    {
      -[STSPicker traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "forceTouchCapability");

      if (v6 == 2)
      {
        -[STSPicker view](self, "view");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "collectionView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[STSPicker registerForPreviewingWithDelegate:sourceView:](self, "registerForPreviewingWithDelegate:sourceView:", self, v7);
        v8 = (UIViewControllerPreviewing *)objc_claimAutoreleasedReturnValue();
        previewingContext = self->_previewingContext;
        self->_previewingContext = v8;

      }
    }
  }
  else
  {
    -[STSPicker view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOverlayView:", 0);

    if (self->_previewingContext)
      -[STSPicker unregisterForPreviewingWithContext:](self, "unregisterForPreviewingWithContext:");
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (self->_needsReloadAfterLayout)
  {
    self->_needsReloadAfterLayout = 0;
    -[STSPicker view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
  -[STSPicker view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  -[STSPicker _updatePredictedSuggestionsForSize:](self, "_updatePredictedSuggestionsForSize:", v6, v7);

  if (!self->_isSnapShotting)
    -[STSPicker sendVisibleResultsFeedback](self, "sendVisibleResultsFeedback");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[STSPicker _updatePredictedSuggestionsForSize:](self, "_updatePredictedSuggestionsForSize:", width, height);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, 0);
  v8.receiver = self;
  v8.super_class = (Class)STSPicker;
  -[STSPicker viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  void *v4;
  char isKindOfClass;
  id v6;

  if (!a3)
  {
    -[STSPicker presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[STSPicker presentedViewController](self, "presentedViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

    }
  }
}

- (void)willResignActiveWithConversation:(id)a3
{
  -[STSPicker _reportFeedbackDisplayedResultsDidScroll:](self, "_reportFeedbackDisplayedResultsDidScroll:", 0);
}

- (id)snapshotImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL showSuggestions;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[9];

  self->_isSnapShotting = 1;
  -[STSPicker view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollToTopWithAnimation:", 0);

  -[STSPicker view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[STSPicker view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  showSuggestions = self->_showSuggestions;
  self->_showSuggestions = 0;
  -[STSPicker view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[STSPicker view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "headerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setTopSuggestions:", 0);
    objc_msgSend(v13, "setBottomSuggestions:", 0);
    -[STSPicker view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

    -[STSPicker view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutIfNeeded");

  }
  -[STSPicker view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", v22, v24);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __26__STSPicker_snapshotImage__block_invoke;
  v34[3] = &unk_24E745C90;
  v34[5] = v18;
  v34[6] = v20;
  *(double *)&v34[7] = v22;
  *(double *)&v34[8] = v24;
  v34[4] = self;
  objc_msgSend(v25, "imageWithActions:", v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showSuggestions = showSuggestions;
  -[STSPicker view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidden:", 0);

  -[STSPicker view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "overlayView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidden:", 0);

  -[STSPicker _updatePredictedSuggestionsForSize:](self, "_updatePredictedSuggestionsForSize:", v22, v24);
  -[STSPicker view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setNeedsLayout");

  -[STSPicker view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutIfNeeded");

  self->_isSnapShotting = 0;
  return v26;
}

void __26__STSPicker_snapshotImage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BEBD4B8];
  v4 = a2;
  objc_msgSend(v3, "sts_defaultBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFill");

  objc_msgSend(v4, "fillRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "drawViewHierarchyInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)performZKWSearchQuery
{
  NSString *currentQuery;
  NSObject *displayedResultsQueue;
  uint64_t v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  STSSearchModel *searchModel;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  id v14;
  id location;
  _QWORD v16[6];
  _QWORD v17[3];
  char v18;
  _QWORD block[5];

  currentQuery = self->_currentQuery;
  self->_currentQuery = 0;

  displayedResultsQueue = self->_displayedResultsQueue;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__STSPicker_performZKWSearchQuery__block_invoke;
  block[3] = &unk_24E7457A8;
  block[4] = self;
  dispatch_async(displayedResultsQueue, block);
  -[STSPicker view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverlayView:", 0);

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 1;
  v7 = dispatch_time(0, 1000000000);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __34__STSPicker_performZKWSearchQuery__block_invoke_2;
  v16[3] = &unk_24E745CB8;
  v16[4] = self;
  v16[5] = v17;
  dispatch_after(v7, MEMORY[0x24BDAC9B8], v16);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_lastSearchId, v8);
  objc_initWeak(&location, self);
  searchModel = self->_searchModel;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __34__STSPicker_performZKWSearchQuery__block_invoke_3;
  v11[3] = &unk_24E745CE0;
  objc_copyWeak(&v14, &location);
  v13 = v17;
  v10 = v8;
  v12 = v10;
  -[STSSearchModel performZKWSearchQueryWithCompletion:](searchModel, "performZKWSearchQueryWithCompletion:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  _Block_object_dispose(v17, 8);
}

uint64_t __34__STSPicker_performZKWSearchQuery__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "removeAllObjects");
}

void __34__STSPicker_performZKWSearchQuery__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowActivityIndicator:", v1);

}

void __34__STSPicker_performZKWSearchQuery__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowActivityIndicator:", 0);

    if (objc_msgSend(v6[122], "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v6, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "scrollToTopWithAnimation:", 0);
      }
      else
      {
        objc_msgSend(v6, "_noticeTextForSearchError:", v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_presentNoticeWithText:", v8);
      }

    }
  }

}

- (void)performSearchWithQueryString:(id)a3 requestType:(int64_t)a4
{
  id v7;
  void *v8;
  NSObject *displayedResultsQueue;
  uint64_t v10;
  dispatch_time_t v11;
  void *v12;
  STSSearchModel *searchModel;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  id v18[2];
  id location;
  _QWORD v20[6];
  _QWORD v21[3];
  char v22;
  _QWORD block[5];

  v7 = a3;
  objc_storeStrong((id *)&self->_currentQuery, a3);
  -[STSPicker view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverlayView:", 0);

  displayedResultsQueue = self->_displayedResultsQueue;
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__STSPicker_performSearchWithQueryString_requestType___block_invoke;
  block[3] = &unk_24E7457A8;
  block[4] = self;
  dispatch_async(displayedResultsQueue, block);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 1;
  v11 = dispatch_time(0, 1000000000);
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __54__STSPicker_performSearchWithQueryString_requestType___block_invoke_2;
  v20[3] = &unk_24E745CB8;
  v20[4] = self;
  v20[5] = v21;
  dispatch_after(v11, MEMORY[0x24BDAC9B8], v20);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_lastSearchId, v12);
  objc_initWeak(&location, self);
  searchModel = self->_searchModel;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __54__STSPicker_performSearchWithQueryString_requestType___block_invoke_3;
  v15[3] = &unk_24E745D08;
  objc_copyWeak(v18, &location);
  v17 = v21;
  v14 = v12;
  v16 = v14;
  v18[1] = (id)a4;
  -[STSSearchModel performSearchWithQueryString:requestType:completion:](searchModel, "performSearchWithQueryString:requestType:completion:", v7, a4, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Block_object_dispose(v21, 8);
}

uint64_t __54__STSPicker_performSearchWithQueryString_requestType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "removeAllObjects");
}

void __54__STSPicker_performSearchWithQueryString_requestType___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowActivityIndicator:", v1);

}

void __54__STSPicker_performSearchWithQueryString_requestType___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowActivityIndicator:", 0);

    if (objc_msgSend(v6[122], "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      if ((a2 & 1) == 0)
      {
        objc_msgSend(v6, "_noticeTextForSearchError:", v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_presentNoticeWithText:", v8);
        goto LABEL_7;
      }
      if ((*(_QWORD *)(a1 + 56) | 4) == 5)
      {
        objc_msgSend(v6, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "scrollToTopWithAnimation:", 0);
LABEL_7:

      }
    }
  }

}

- (void)cancelImageDownloads
{
  void *v3;

  -[STSPicker _cancelActiveDownload](self, "_cancelActiveDownload");
  +[STSImageCache sharedCache](STSImageCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllDownloads");

  -[NSMutableSet removeAllObjects](self->_queuedImageURLs, "removeAllObjects");
}

- (void)resetContent
{
  id v3;

  -[STSSearchModel removeAllSections](self->_searchModel, "removeAllSections");
  -[STSPicker view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOverlayView:", 0);

}

- (NSArray)querySuggestions
{
  return -[STSSearchModel querySuggestions](self->_searchModel, "querySuggestions");
}

- (STSPickerView)pickerView
{
  -[STSPicker loadViewIfNeeded](self, "loadViewIfNeeded");
  return (STSPickerView *)-[STSPicker view](self, "view");
}

- (void)updateContentOffset:(double)a3
{
  id v4;

  -[STSPicker pickerView](self, "pickerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateContentOffset:", a3);

}

- (void)_handleLongPress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  STSSearchModel **p_searchModel;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[STSPicker view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSPicker view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v8);
    objc_msgSend(v6, "indexPathForItemAtPoint:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[STSPicker _presentDetailViewControllerForIndexPath:](self, "_presentDetailViewControllerForIndexPath:", v9);
    v10 = objc_msgSend(v9, "section");
    p_searchModel = &self->_searchModel;
    -[STSSearchModel sections](*p_searchModel, "sections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v10 >= v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[STSPicker _handleLongPress:].cold.1((id *)p_searchModel, v10);
    }
    else
    {
      -[STSSearchModel sections](*p_searchModel, "sections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "results");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v9, "item"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "didPreviewResultLongPress:", v17);

    }
  }

}

- (void)_handleDebugGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIColor *v14;
  UIColor *originalColor;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];

  if (STSIsInternalInstall())
  {
    if (self->_debugMode)
    {
      self->_debugMode = 0;
      -[STSPicker pickerView](self, "pickerView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAllowsMultipleSelection:", 0);

      -[STSPicker pickerView](self, "pickerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", self->_originalColor);

      if (-[NSMutableArray count](self->_debugItems, "count"))
      {
        objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Open Tap-to-Radar"), CFSTR("Report issue with selected images."), 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = MEMORY[0x24BDAC760];
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __33__STSPicker__handleDebugGesture___block_invoke;
        v22[3] = &unk_24E745A48;
        v22[4] = self;
        objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", CFSTR("Yes"), 0, v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v9;
        v21[1] = 3221225472;
        v21[2] = __33__STSPicker__handleDebugGesture___block_invoke_3;
        v21[3] = &unk_24E745A48;
        v21[4] = self;
        objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", CFSTR("No"), 0, v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v10);
        objc_msgSend(v8, "addAction:", v11);
        -[STSPicker presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

      }
    }
    else
    {
      self->_debugMode = 1;
      -[STSPicker pickerView](self, "pickerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "backgroundColor");
      v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
      originalColor = self->_originalColor;
      self->_originalColor = v14;

      -[STSPicker pickerView](self, "pickerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "purpleColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBackgroundColor:", v18);

      -[STSPicker pickerView](self, "pickerView");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAllowsMultipleSelection:", 1);

    }
  }
}

void __33__STSPicker__handleDebugGesture___block_invoke(uint64_t a1)
{
  uint64_t i;
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
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD block[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 1144);
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "sections");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v3, "section"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "results");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v3, "item"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "thumbnail");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "urlValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "absoluteString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("thumbnail"));

        objc_msgSend(v7, "url");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("url"));

        objc_msgSend(v22, "addObject:", v8);
        objc_msgSend(*(id *)(a1 + 32), "pickerView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "collectionView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cellForItemAtIndexPath:", v3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __33__STSPicker__handleDebugGesture___block_invoke_2;
          block[3] = &unk_24E745D30;
          block[4] = *(_QWORD *)(a1 + 32);
          block[5] = v3;
          dispatch_async(MEMORY[0x24BDAC9B8], block);
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v23);
  }

  objc_msgSend(*(id *)(a1 + 32), "getTapToRadarPunchOut:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "extensionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "openURL:completionHandler:", v18, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "removeAllObjects");
}

void __33__STSPicker__handleDebugGesture___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDebugBadge:", 0);
}

uint64_t __33__STSPicker__handleDebugGesture___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  uint64_t v12;
  id obj;
  _QWORD block[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = 1144;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 1144);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 32), "pickerView", v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cellForItemAtIndexPath:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __33__STSPicker__handleDebugGesture___block_invoke_4;
          block[3] = &unk_24E745D30;
          block[4] = *(_QWORD *)(a1 + 32);
          block[5] = v6;
          dispatch_async(MEMORY[0x24BDAC9B8], block);
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v12), "removeAllObjects");
}

void __33__STSPicker__handleDebugGesture___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDebugBadge:", 0);
}

- (id)getTapToRadarPunchOut:(id)a3
{
  id v4;
  void *v5;
  const __CFString *currentQuery;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n\n############################\n\n#IMAGES DEBUG INFO (PLEASE DO NOT EDIT):\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentQuery = (const __CFString *)self->_currentQuery;
  if (!currentQuery)
    currentQuery = CFSTR("ZKW");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\nQUERY:\n%@\n"), currentQuery);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v13, "objectForKey:", CFSTR("thumbnail"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("\nTHUMBNAIL:\n%@\n"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingString:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v13, "objectForKey:", CFSTR("url"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("\nORIGINAL:\n%@\n"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAppendingString:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n############################\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringByAppendingString:", v22);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v10);
  }

  v23 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v23, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v23, "setHost:", CFSTR("new"));
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("Parsec Image Search"));
  objc_msgSend(v24, "addObject:", v25);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("1.0"));
  objc_msgSend(v24, "addObject:", v26);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("680051"));
  objc_msgSend(v24, "addObject:", v27);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("Classification"), CFSTR("Other Bug"));
  objc_msgSend(v24, "addObject:", v28);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
  objc_msgSend(v24, "addObject:", v29);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("Description"), v8);
  objc_msgSend(v24, "addObject:", v30);

  objc_msgSend(v23, "setQueryItems:", v24);
  objc_msgSend(v23, "URL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)searchModelUpdatedPredictedSuggestions:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  double v8;
  double v9;
  id v10;

  -[STSPicker view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[STSPicker view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    -[STSPicker _updatePredictedSuggestionsForSize:](self, "_updatePredictedSuggestionsForSize:", v8, v9);

    -[STSPicker view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
}

- (void)searchModel:(id)a3 insertedResultsAtIndexPaths:(id)a4 removedResultsAtIndexPaths:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 IsEmpty;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  CGRect v29;

  v28 = a4;
  v7 = a5;
  self->_isLoadingMoreResults = 0;
  -[STSPicker _loadMoreFooter](self, "_loadMoreFooter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLoading:", 0);

  if (objc_msgSend(v28, "count"))
  {
    self->_lastInsertedIndexesCount = objc_msgSend(v28, "count");
    -[NSMutableSet removeAllObjects](self->_lastInsertedIndexesWaitingToLoad, "removeAllObjects");
    -[NSMutableSet addObjectsFromArray:](self->_lastInsertedIndexesWaitingToLoad, "addObjectsFromArray:", v28);
  }
  -[STSPicker view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  IsEmpty = CGRectIsEmpty(v29);

  if (IsEmpty)
  {
    self->_needsReloadAfterLayout = 1;
  }
  else
  {
    if (!objc_msgSend(v7, "count"))
      goto LABEL_16;
    -[STSPicker view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "numberOfItemsInSection:", 0);
    v15 = objc_msgSend(v7, "count");

    if (v14 > v15)
    {
      -[STSPicker view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "reloadData");

    }
    else
    {
LABEL_16:
      if (objc_msgSend(v28, "count"))
      {
        -[STSPicker view](self, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "collectionView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reloadData");

        -[STSPicker sendVisibleResultsFeedback](self, "sendVisibleResultsFeedback");
      }
    }
  }
  -[STSSearchModel sections](self->_searchModel, "sections");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "results");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    +[STSLoadMoreFooter defaultHeight](STSLoadMoreFooter, "defaultHeight");
    v24 = v23;
  }
  else
  {
    v24 = 0.0;
  }

  -[STSPicker view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "collectionViewLayout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFooterHeight:", v24);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[STSSearchModel sections](self->_searchModel, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 <= 1)
    return 1;
  else
    return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[STSSearchModel sections](self->_searchModel, "sections", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  char v70;
  uint8_t buf[4];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[STSSearchModel sections](self->_searchModel, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9 > objc_msgSend(v7, "section"))
  {
    -[STSSearchModel sections](self->_searchModel, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v58, "results");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v57, "count");
    if (v11 <= objc_msgSend(v7, "item"))
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("STSImageCell"), v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "sts_defaultCellPlaceholderColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPlaceholderColor:", v20);

LABEL_39:
      goto LABEL_40;
    }
    objc_msgSend(v58, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "sts_badge");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "thumbnail");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "urlValue");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sts_descriptionText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resultType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v14, "isEqualToString:", CFSTR("image_search"));

    if ((_DWORD)v12)
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("STSImageCell"), v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[STSImageCache sharedCache](STSImageCache, "sharedCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fetchCachedImageInfoForURL:", v55);
      v52 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setCategory:", 0);
      if (STSIsInternalInstall())
      {
        objc_msgSend(v15, "setDebugBadge:", 0);
        if (-[NSMutableArray containsObject:](self->_debugItems, "containsObject:", v7))
        {
          objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", CFSTR("feedback-selected-icon"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDebugBadge:", v17);

        }
      }
      if (v52)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v72 = v52;
          _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Cache Hit: imageInfo %@", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x24BEBD640], "agif_animatedImageWithImageInfo:", v52);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setImage:", v18);
        -[NSMutableSet removeObject:](self->_lastInsertedIndexesWaitingToLoad, "removeObject:", v7);

      }
      else
      {
        v70 = 0;
        +[STSImageCache sharedCache](STSImageCache, "sharedCache");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "fetchCachedStaticImageForURL:hasMultipleFrames:", v55, &v70);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setImage:", v38);
        if (!v38 || v70)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v72 = v55;
            _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Cache Miss: fetching %@", buf, 0xCu);
          }
          -[STSPicker _fetchImageWithURL:priority:forCollectionView:atIndexPath:](self, "_fetchImageWithURL:priority:forCollectionView:atIndexPath:", v55, 0, v6, v7);
        }

      }
      if (v53)
      {
        objc_msgSend(v15, "setAccessibilityTraits:", *MEMORY[0x24BEBDF18]);
        objc_msgSend(v15, "setIsAccessibilityElement:", 1);
        objc_msgSend(v15, "setAccessibilityValue:", v53);
      }
      else
      {
        objc_msgSend(v15, "setAccessibilityValue:", 0);
        objc_msgSend(v15, "setAccessibilityTraits:", *MEMORY[0x24BEBDF10]);
      }
      objc_msgSend(v13, "secondaryTitle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v13, "secondaryTitle");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCategory:", v40);

      }
      if (-[NSIndexPath isEqual:](self->_activeDownloadIndexPath, "isEqual:", v7))
      {
        objc_msgSend(v15, "setDownloadProgress:", self->_activeDownloadProgress);
        objc_msgSend(v15, "setShowDownloadIndicator:animated:", 0, 1.0);
      }
    }
    else
    {
      objc_msgSend(v13, "resultType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("web_video"));

      if (!v22)
      {
        v15 = 0;
        goto LABEL_32;
      }
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("STSVideoCell"), v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTitle:", v24);

      v25 = (void *)objc_opt_new();
      objc_msgSend(v13, "descriptions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x24BDAC760];
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke;
      v68[3] = &unk_24E745D80;
      v52 = v25;
      v69 = v52;
      objc_msgSend(v26, "enumerateObjectsUsingBlock:", v68);

      objc_msgSend(v15, "setCategory:", 0);
      objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSubtitle:", v51);
      objc_msgSend(v13, "sts_videoDuration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDuration:", v28);

      objc_msgSend(v13, "sts_providerName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setProviderName:", v29);

      objc_msgSend(v15, "setProviderIcon:", 0);
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "scale");
      v32 = v31;
      v65[0] = v27;
      v65[1] = 3221225472;
      v65[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_3;
      v65[3] = &unk_24E745DD0;
      v50 = v6;
      v66 = v50;
      v33 = v7;
      v67 = v33;
      objc_msgSend(v13, "sts_providerIconWithScale:completion:", v65, v32);

      objc_initWeak((id *)buf, self);
      v62[0] = v27;
      v62[1] = 3221225472;
      v62[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_5;
      v62[3] = &unk_24E745DF8;
      objc_copyWeak(&v64, (id *)buf);
      v34 = v33;
      v63 = v34;
      objc_msgSend(v15, "setPlayButtonAction:", v62);
      +[STSImageCache sharedCache](STSImageCache, "sharedCache");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "fetchCachedStaticImageForURL:", v55);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setImage:", v36);
      if (!v36)
        -[STSPicker _fetchImageWithURL:priority:forCollectionView:atIndexPath:](self, "_fetchImageWithURL:priority:forCollectionView:atIndexPath:", v55, 0, v50, v34);

      objc_destroyWeak(&v64);
      objc_destroyWeak((id *)buf);

    }
LABEL_32:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v41 = (void *)MEMORY[0x24BEBD4B8],
          objc_msgSend(v56, "keyColor"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v41, "sts_colorFromHexString:alpha:", v42, 1.0),
          v43 = (void *)objc_claimAutoreleasedReturnValue(),
          v42,
          !v43))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "sts_defaultCellPlaceholderColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "setPlaceholderColor:", v43);
    objc_msgSend(v54, "imageData");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v45 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "scale");
      objc_msgSend(v45, "imageWithData:scale:", v44);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setBadge:", v47);
    }
    else
    {
      objc_msgSend(v15, "setBadge:", 0);
      objc_msgSend(v13, "sts_badge");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = 3221225472;
      v59[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_6;
      v59[3] = &unk_24E745E20;
      v60 = v6;
      v61 = v7;
      objc_msgSend(v48, "loadImageDataWithCompletionAndErrorHandler:", v59);

      v47 = v60;
    }

    goto LABEL_39;
  }
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("STSImageCell"), v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "sts_defaultCellPlaceholderColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPlaceholderColor:", v19);

LABEL_40:
  return v15;
}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "formattedTextPieces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v4[3] = &unk_24E745D58;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "text");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_4;
  block[3] = &unk_24E745DA8;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProviderIcon:", *(_QWORD *)(a1 + 48));

}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_presentDetailViewControllerForIndexPath:", *(_QWORD *)(a1 + 32));

}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  if (a2)
  {
    v3 = (void *)MEMORY[0x24BEBD640];
    v4 = (void *)MEMORY[0x24BEBD8F8];
    v5 = a2;
    objc_msgSend(v4, "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    objc_msgSend(v3, "imageWithData:scale:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_7;
    block[3] = &unk_24E745DA8;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = v7;
    v8 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBadge:", *(_QWORD *)(a1 + 48));

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("STSGridLayoutElementKindFooter")))
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("STSGridLayoutElementKindFooter"), CFSTR("STSGridLayoutElementKindFooter"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLoading:", self->_isLoadingMoreResults);
    objc_msgSend(v10, "setDelegate:", self);
    +[STSImageCache sharedCache](STSImageCache, "sharedCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchProviderImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSearchProviderImage:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int64_t v19;

  v6 = a5;
  -[STSSearchModel sections](self->_searchModel, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v6, "section");

  if (v8 <= v9)
  {
    v19 = 1;
  }
  else
  {
    -[STSSearchModel sections](self->_searchModel, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v6, "item");
    objc_msgSend(v11, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 >= v14)
    {
      v19 = 1;
    }
    else
    {
      objc_msgSend(v11, "results");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "resultType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("web_video"));

      v19 = v18 ^ 1u;
    }

  }
  return v19;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (!self->_debugMode)
  {
    v11 = -[NSIndexPath isEqual:](self->_activeDownloadIndexPath, "isEqual:", v6);
    -[STSPicker _cancelActiveDownload](self, "_cancelActiveDownload");
    -[STSSearchModel sections](self->_searchModel, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "count");
    if (v12 <= objc_msgSend(v6, "section"))
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "secondaryTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[STSPicker selectionDelegate](self, "selectionDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "browser:didSelectCategoryResult:", self, v14);

    }
    else
    {
      if (v6)
        v17 = v11;
      else
        v17 = 1;
      if ((v17 & 1) == 0)
        -[STSPicker _beginDownloadingResultAtIndexPath:](self, "_beginDownloadingResultAtIndexPath:", v6);
    }

LABEL_13:
    goto LABEL_14;
  }
  -[NSMutableArray addObject:](self->_debugItems, "addObject:", v6);
  objc_msgSend(v18, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v18, "cellForItemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", CFSTR("feedback-selected-icon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDebugBadge:", v10);
    goto LABEL_13;
  }
LABEL_15:

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self->_debugMode)
  {
    -[NSMutableArray removeObject:](self->_debugItems, "removeObject:", v6);
    objc_msgSend(v10, "cellForItemAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v10, "cellForItemAtIndexPath:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDebugBadge:", 0);

    }
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v13;

  v13 = a3;
  -[STSPicker _cancelActiveDownload](self, "_cancelActiveDownload");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    -[STSPicker view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateHeaderPositionOnScroll");

  }
  -[STSPicker selectionDelegate](self, "selectionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[STSPicker selectionDelegate](self, "selectionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "browserDidScroll:", self);

  }
  -[STSPicker _loadMoreResultsIfNecessary](self, "_loadMoreResultsIfNecessary");
  objc_msgSend(v13, "contentOffset");
  if (v10 - self->_startScrollPosition.y > 50.0)
  {
    -[STSPicker sendVisibleResultsFeedback](self, "sendVisibleResultsFeedback");
    objc_msgSend(v13, "contentOffset");
    self->_startScrollPosition.x = v11;
    self->_startScrollPosition.y = v12;
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  -[STSPicker view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateHeaderPositionOnDraggingBegan");

  self->_isScrolling = 1;
  self = (STSPicker *)((char *)self + 1112);
  objc_msgSend(v4, "contentOffset");
  v7 = v6;
  v9 = v8;

  self->super.super.super.isa = v7;
  *(_QWORD *)&self->super.super._responderFlags = v9;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v7;

  y = a4.y;
  x = a4.x;
  -[STSPicker view](self, "view", a3, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateHeaderPositionOnDraggingEndedWithVelocity:", x, y);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;

  -[STSPicker view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateHeaderPositionOnDecelerationEnded");

  self->_isScrolling = 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v7 = a4;
  v8 = a5;
  v24 = v7;
  objc_msgSend(v24, "imageInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v24, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_4;
    -[STSSearchModel sections](self->_searchModel, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "count");
    if (v11 > objc_msgSend(v8, "section"))
    {
      -[STSSearchModel sections](self->_searchModel, "sections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "results");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      if (v15 > objc_msgSend(v8, "item"))
      {
        objc_msgSend(v13, "results");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v8, "item"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "thumbnail");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "urlValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[STSImageCache sharedCache](STSImageCache, "sharedCache");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fetchCachedImageInfoForURL:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(MEMORY[0x24BEBD640], "agif_animatedImageWithImageInfo:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[STSImageCache sharedCache](STSImageCache, "sharedCache");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "fetchCachedStaticImageForURL:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v24, "setImage:", v22);

      }
    }
  }

LABEL_4:
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a5;
  -[STSSearchModel sections](self->_searchModel, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v16, "row");
  objc_msgSend(v7, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 < v10)
  {
    objc_msgSend(v7, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "thumbnail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "urlValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[STSImageCache sharedCache](STSImageCache, "sharedCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPriority:forQueuedDownloadWithURL:", -8, v14);

  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  STSDetailTransitionAnimator *v37;
  STSDetailTransitionAnimator *detailTransitionAnimator;
  STSDetailTransitionAnimator *v39;
  STSDetailTransitionAnimator *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  STSDetailTransitionAnimator *v51;

  v7 = a3;
  v8 = a4;
  -[STSPicker view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellForItemAtIndexPath:", self->_detailResultIndexPath);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[STSPicker view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutAttributesForItemAtIndexPath:", self->_detailResultIndexPath);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[STSPicker view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSPicker view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "convertRect:fromView:", v25, v16, v18, v20, v22);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v34 = objc_alloc(MEMORY[0x24BEBD668]);
  v35 = (void *)objc_msgSend(v34, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v35, "setClipsToBounds:", 1);
  objc_msgSend(v35, "setContentMode:", 2);
  objc_msgSend(v11, "image");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setImage:", v36);

  v37 = objc_alloc_init(STSDetailTransitionAnimator);
  detailTransitionAnimator = self->_detailTransitionAnimator;
  self->_detailTransitionAnimator = v37;

  -[STSDetailTransitionAnimator setSnapshotView:](self->_detailTransitionAnimator, "setSnapshotView:", v35);
  v39 = self->_detailTransitionAnimator;
  objc_msgSend(v11, "imageInsets");
  -[STSDetailTransitionAnimator setSourceInsets:](v39, "setSourceInsets:");
  -[STSDetailTransitionAnimator setSourceFrame:](self->_detailTransitionAnimator, "setSourceFrame:", v27, v29, v31, v33);
  v40 = self->_detailTransitionAnimator;
  objc_msgSend(v8, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  objc_msgSend(v8, "traitCollection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentFrameForBounds:traitCollection:", v50, v43, v45, v47, v49);
  -[STSDetailTransitionAnimator setPresentedFrame:](v40, "setPresentedFrame:");

  -[STSDetailTransitionAnimator setPresenting:](self->_detailTransitionAnimator, "setPresenting:", 1);
  v51 = self->_detailTransitionAnimator;

  return v51;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  STSDetailTransitionAnimator *detailTransitionAnimator;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;

  v4 = a3;
  -[STSPicker view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutAttributesForItemAtIndexPath:", self->_detailResultIndexPath);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[STSPicker view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSPicker view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertRect:fromView:", v18, v9, v11, v13, v15);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[STSDetailTransitionAnimator setSourceFrame:](self->_detailTransitionAnimator, "setSourceFrame:", v20, v22, v24, v26);
  detailTransitionAnimator = self->_detailTransitionAnimator;
  objc_msgSend(v4, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  objc_msgSend(v4, "traitCollection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentFrameForBounds:traitCollection:", v37, v30, v32, v34, v36);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  -[STSDetailTransitionAnimator setPresentedFrame:](detailTransitionAnimator, "setPresentedFrame:", v39, v41, v43, v45);
  -[STSDetailTransitionAnimator setPresenting:](self->_detailTransitionAnimator, "setPresenting:", 0);
  return self->_detailTransitionAnimator;
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  int v9;
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
  SFSearchResult *v20;
  void *v21;
  SFSearchResult *previewingSearchResult;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[STSPicker selectionDelegate](self, "selectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "browserIsPresentedFullscreen:", self);

  if (v9)
  {
    -[STSPicker view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathForItemAtPoint:", x, y);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[STSPicker _cancelActiveDownload](self, "_cancelActiveDownload");
      -[STSPicker _detailViewControllerForIndexPath:](self, "_detailViewControllerForIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setModalTransitionStyle:", 2);
      objc_msgSend(v13, "setModalPresentationStyle:", 6);
      objc_msgSend(v13, "setIsFullscreen:", 0);
      -[STSPicker view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layoutAttributesForItemAtIndexPath:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      objc_msgSend(v7, "setSourceRect:");

      objc_storeStrong((id *)&self->_detailResultIndexPath, v12);
      -[STSSearchModel sections](self->_searchModel, "sections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v12, "section"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "results");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v12, "item"));
      v20 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();

      +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "didPreviewResult:peek:", v20, 1);

      previewingSearchResult = self->_previewingSearchResult;
      self->_previewingSearchResult = v20;

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  SFSearchResult *previewingSearchResult;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  objc_msgSend(v5, "setUseBackgroundBlur:", 1);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__STSPicker_previewingContext_commitViewController___block_invoke;
  v9[3] = &unk_24E7457A8;
  v6 = v5;
  v10 = v6;
  -[STSPicker presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 0, v9);
  if (self->_previewingSearchResult)
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didPreviewResult:peek:", self->_previewingSearchResult, 0);

    previewingSearchResult = self->_previewingSearchResult;
    self->_previewingSearchResult = 0;

  }
}

uint64_t __52__STSPicker_previewingContext_commitViewController___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "setIsFullscreen:", 1);
  return result;
}

- (void)detailViewControllerDidSelectProviderLink:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[STSSearchModel sections](self->_searchModel, "sections", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[NSIndexPath row](self->_detailResultIndexPath, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[STSPicker selectionDelegate](self, "selectionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "browser:didSelectProviderLink:", self, v6);

}

- (void)detailViewControllerDidInsert:(id)a3
{
  id v4;
  NSIndexPath *detailResultIndexPath;
  char v6;
  id v7;

  v4 = a3;
  detailResultIndexPath = self->_detailResultIndexPath;
  if (detailResultIndexPath)
  {
    v7 = v4;
    v6 = -[NSIndexPath isEqual:](detailResultIndexPath, "isEqual:", self->_activeDownloadIndexPath);
    v4 = v7;
    if ((v6 & 1) == 0)
    {
      -[STSPicker _cancelActiveDownload](self, "_cancelActiveDownload");
      -[STSPicker _beginDownloadingResultAtIndexPath:](self, "_beginDownloadingResultAtIndexPath:", self->_detailResultIndexPath);
      v4 = v7;
    }
  }

}

- (void)detailViewControllerDidReportConcern:(id)a3 result:(id)a4 punchout:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a4;
  v8 = a5;
  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didReportConcern:punchout:", v7, v8);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__STSPicker_detailViewControllerDidReportConcern_result_punchout___block_invoke;
  v11[3] = &unk_24E745D30;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

uint64_t __66__STSPicker_detailViewControllerDidReportConcern_result_punchout___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "removeResultAtIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "addSearchResultToReportConcernStore:", *(_QWORD *)(a1 + 40));
}

- (void)headerViewDidSelectSearchButton:(id)a3
{
  id v4;

  -[STSPicker selectionDelegate](self, "selectionDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browserSearchBarButtonClicked:", self);

}

- (void)headerDidSelectCancelButton:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[STSPicker selectionDelegate](self, "selectionDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[STSPicker selectionDelegate](self, "selectionDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "browserSearchBarCancelButtonClicked:", self);

  }
}

- (void)headerViewDidDeleteText
{
  id v2;

  -[STSPicker selectionDelegate](self, "selectionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "browserDidDeleteQuery");

}

- (void)headerView:(id)a3 didSearchFor:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[STSPicker selectionDelegate](self, "selectionDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "browser:didSearchFor:", self, v5);

}

- (void)headerView:(id)a3 didRequestCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[STSPicker selectionDelegate](self, "selectionDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "browser:requestSuggestionsFor:", self, v5);

}

- (void)headerView:(id)a3 didSelectSuggestionButtonAtIndex:(unint64_t)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v6;
    v7 = -[NSArray count](self->_visiblePredictions, "count") > a4;
    v6 = v10;
    if (v7)
    {
      -[NSArray objectAtIndexedSubscript:](self->_visiblePredictions, "objectAtIndexedSubscript:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STSPicker selectionDelegate](self, "selectionDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "browserSuggestionButtonClicked:suggestion:", self, v8);

      v6 = v10;
    }
  }

}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  STSPicker *v11;
  int64_t v12;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__STSPicker_mailComposeController_didFinishWithResult_error___block_invoke;
  v9[3] = &unk_24E745E48;
  v11 = self;
  v12 = a4;
  v10 = v7;
  v8 = v7;
  -[STSPicker dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);

}

void __61__STSPicker_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(a1 + 48) == 3)
  {
    v2 = (void *)MEMORY[0x24BEBD3B0];
    STSLocalizedString(CFSTR("COULD_NOT_SEND_FEEDBACK_ALERT_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x24BEBD3A8];
    STSLocalizedString(CFSTR("OK"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAction:", v7);
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)loadMoreFooterDidTapLogo
{
  id v3;

  -[STSPicker selectionDelegate](self, "selectionDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browserDidTapLogo:", self);

}

- (void)_fetchImageWithURL:(id)a3 priority:(int64_t)a4 forCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  STSPicker *v23;
  _QWORD *v24;
  __int128 *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  _QWORD *v30;
  id v31;
  _QWORD v32[4];
  id location;
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    +[STSImageCache sharedCache](STSImageCache, "sharedCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "fetching url %@", (uint8_t *)&buf, 0xCu);

  }
  objc_initWeak(&location, self);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  v38 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  +[STSImageCache sharedCache](STSImageCache, "sharedCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke;
  v27[3] = &unk_24E745E70;
  v28 = v10;
  objc_copyWeak(&v31, &location);
  p_buf = &buf;
  v30 = v32;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke_113;
  v19[3] = &unk_24E745EC0;
  v24 = v32;
  v16 = v28;
  v20 = v16;
  v25 = &buf;
  objc_copyWeak(&v26, &location);
  v17 = v12;
  v21 = v17;
  v18 = v11;
  v22 = v18;
  v23 = self;
  objc_msgSend(v14, "fetchImageWithURL:priority:isSource:begin:progress:completion:", v16, a4, 0, v27, 0, v19);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v31);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

void __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v15 = 138412290;
    v16 = v2;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Begin downloading image at URL: %@", (uint8_t *)&v15, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = (void *)*((_QWORD *)WeakRetained + 121);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "currentQuery");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v9 = v7;
  else
    v9 = &stru_24E7469D8;
  objc_msgSend(v8, "didStartNetworkRequest:query:queryId:", *(_QWORD *)(a1 + 32), v9, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "systemUptime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v14;

}

void __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke_113(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id WeakRetained;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "fetchImageWithURL completion block called", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "systemUptime");
  v18 = v17;
  v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("STSImageDownloadOperationStatusCode"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v18 - v19) * 1000.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v36 = v20;
    v37 = 2112;
    v38 = v11;
    v39 = 2112;
    v40 = v12;
    v41 = 2112;
    v42 = v21;
    v43 = 2112;
    v44 = v22;
    v45 = 2112;
    v46 = v14;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "download completed for url: %@, image: %@, imageInfo: %@, status_code: %@, duration: %@, feedback: %@", buf, 0x3Eu);

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "didEndNetworkRequest:infoDict:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v14);

  }
  if (v11)
  {
    v24 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD640], "agif_animatedImageWithImageInfo:", v12);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke_115;
  block[3] = &unk_24E745E98;
  v30 = *(id *)(a1 + 40);
  v31 = *(id *)(a1 + 48);
  v32 = v25;
  v33 = *(_QWORD *)(a1 + 56);
  v34 = WeakRetained;
  v27 = WeakRetained;
  v28 = v25;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke_115(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "get cell at index %@", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:animated:", *(_QWORD *)(a1 + 48), 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1016), "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 64), "_loadMoreResultsIfNecessary");

}

- (void)_loadMoreResultsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double Height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  int64_t lastInsertedIndexesCount;
  uint64_t v21;
  int64_t v22;
  id v23;
  CGRect v24;
  CGRect v25;

  if (!self->_isLoadingMoreResults)
  {
    -[STSSearchModel sections](self->_searchModel, "sections");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      -[STSSearchModel sections](self->_searchModel, "sections");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "results");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (!v6)
        return;
      -[STSPicker view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionView");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "contentOffset");
      v9 = v8;
      objc_msgSend(v23, "bounds");
      Height = CGRectGetHeight(v24);
      objc_msgSend(v23, "contentInset");
      v12 = v11;
      objc_msgSend(v23, "contentSize");
      if (v13 > 0.0)
      {
        v14 = v9 + Height - v12;
        objc_msgSend(v23, "contentSize");
        v16 = v15;
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        v18 = v16 + CGRectGetHeight(v25) * -0.5;

        if (v14 > v18)
        {
          -[STSPicker _loadMoreFooter](self, "_loadMoreFooter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setLoading:", 1);

          lastInsertedIndexesCount = self->_lastInsertedIndexesCount;
          v21 = -[NSMutableSet count](self->_lastInsertedIndexesWaitingToLoad, "count");
          v22 = self->_lastInsertedIndexesCount;
          if (v22 < 10 || (double)(lastInsertedIndexesCount - v21) / (double)v22 > 0.5)
          {
            self->_isLoadingMoreResults = 1;
            -[STSSearchModel fetchMoreResults](self->_searchModel, "fetchMoreResults");
          }
        }
      }
    }

  }
}

- (void)_updatePredictedSuggestionsForSize:(CGSize)a3
{
  double width;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray **p_visiblePredictions;
  void *v14;
  void *v15;
  id v16;

  if (self->_showSuggestions)
  {
    width = a3.width;
    -[STSSearchModel predictedSuggestions](self->_searchModel, "predictedSuggestions", a3.width, a3.height);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v16 = v5;
      v6 = objc_msgSend(v5, "count");
      if (v6 >= 2)
        v7 = 2;
      else
        v7 = v6;
      if (v7)
      {
        objc_msgSend(v16, "subarrayWithRange:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = (void *)MEMORY[0x24BDBD1A8];
      }
      -[STSPicker view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "headerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (width >= 480.0)
        v11 = v8;
      else
        v11 = 0;
      if (width >= 480.0)
        v12 = 0;
      else
        v12 = v8;
      objc_msgSend(v10, "setTopSuggestions:", v11);
      objc_msgSend(v10, "setBottomSuggestions:", v12);
      p_visiblePredictions = &self->_visiblePredictions;
      if (!-[NSArray isEqualToArray:](self->_visiblePredictions, "isEqualToArray:", v8))
      {
        +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[STSSearchModel conversationID](self->_searchModel, "conversationID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "didShowProactiveSuggestions:conversationId:", v8, v15);

        objc_storeStrong((id *)p_visiblePredictions, v8);
      }

      v5 = v16;
    }

  }
}

- (id)_loadMoreFooter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[STSPicker view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supplementaryViewForElementKind:atIndexPath:", CFSTR("STSGridLayoutElementKindFooter"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_presentNoticeWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STSSearchNoticeView *v7;

  v4 = a3;
  v7 = objc_alloc_init(STSSearchNoticeView);
  -[STSSearchNoticeView setText:](v7, "setText:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "sts_searchErrorTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSSearchNoticeView setTextColor:](v7, "setTextColor:", v5);

  -[STSSearchNoticeView setContentCentered:](v7, "setContentCentered:", 1);
  -[STSPicker view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverlayView:", v7);

}

- (void)_presentDetailViewControllerForIndexPath:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[STSPicker _cancelActiveDownload](self, "_cancelActiveDownload");
    -[STSPicker selectionDelegate](self, "selectionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __54__STSPicker__presentDetailViewControllerForIndexPath___block_invoke;
    v6[3] = &unk_24E745D30;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "requestExpandedPresentationStyleForBrowser:completion:", self, v6);

  }
}

void __54__STSPicker__presentDetailViewControllerForIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1032), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_detailViewControllerForIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUseBackgroundBlur:", 1);
  objc_msgSend(v2, "setNumberOfReportedResults:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "numberOfReportedResults"));
  objc_msgSend(v2, "setModalTransitionStyle:", 2);
  objc_msgSend(v2, "setModalPresentationStyle:", 6);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v2, 1, 0);

}

- (id)_detailViewControllerForIndexPath:(id)a3
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
  int v14;
  STSImageDetailViewController *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  STSImageDetailViewController *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double Width;
  double Height;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  STSImageDetailViewController *v47;
  void *v49;
  _QWORD v50[4];
  STSImageDetailViewController *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;
  CGRect v57;
  CGRect v58;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STSSearchModel sections](self->_searchModel, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v6;
  objc_msgSend(v6, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "thumbnail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sts_providerHostPageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "urlValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v53 = v11;
    v54 = 2112;
    v55 = v12;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Generating detail view for result with thumbnail: %@, url: %@", buf, 0x16u);

  }
  objc_msgSend(v8, "resultType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("image_search"));

  if (v14)
  {
    v15 = -[STSImageDetailViewController initWithNibName:bundle:]([STSImageDetailViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[STSResultDetailViewController setQueryId:](v15, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
    -[STSSearchModel currentQuery](self->_searchModel, "currentQuery");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSResultDetailViewController setQueryString:](v15, "setQueryString:", v16);

    objc_msgSend(v8, "sts_appProviderName");
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v20 = (void *)v17;
    -[STSResultDetailViewController setProviderName:](v15, "setProviderName:", v17);

    goto LABEL_9;
  }
  objc_msgSend(v8, "resultType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("web_video"));

  if (v19)
  {
    v15 = -[STSVideoDetailViewController initWithNibName:bundle:]([STSVideoDetailViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[STSResultDetailViewController setQueryId:](v15, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
    -[STSResultDetailViewController setContentSize:](v15, "setContentSize:", 16.0, 9.0);
    objc_msgSend(v8, "sts_providerName");
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v15 = 0;
LABEL_9:
  -[STSResultDetailViewController setNumberOfReportedResults:](v15, "setNumberOfReportedResults:", -[STSSearchModel numberOfReportedResults](self->_searchModel, "numberOfReportedResults"));
  objc_msgSend(v8, "sts_providerIconSize");
  -[STSResultDetailViewController setProviderIconSize:](v15, "setProviderIconSize:");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scale");
  v23 = v22;
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __47__STSPicker__detailViewControllerForIndexPath___block_invoke;
  v50[3] = &unk_24E745EE8;
  v24 = v15;
  v51 = v24;
  objc_msgSend(v8, "sts_providerIconWithScale:completion:", v50, v23);

  -[STSPicker view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v57.origin.x = v27;
  v57.origin.y = v29;
  v57.size.width = v31;
  v57.size.height = v33;
  Width = CGRectGetWidth(v57);
  v58.origin.x = v27;
  v58.origin.y = v29;
  v58.size.width = v31;
  v58.size.height = v33;
  Height = CGRectGetHeight(v58);
  if (Width < Height)
    Height = Width;
  -[STSImageDetailViewController setPreferredContentSize:](v24, "setPreferredContentSize:", Height, Height);
  objc_msgSend(v8, "url");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSImageDetailViewController setContentURL:](v24, "setContentURL:", v36);

  -[STSResultDetailViewController setProviderURL:](v24, "setProviderURL:", v10);
  -[STSResultDetailViewController setDelegate:](v24, "setDelegate:", self);
  -[STSResultDetailViewController setSearchResult:](v24, "setSearchResult:", v8);
  -[STSPicker view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "collectionView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "cellForItemAtIndexPath:", v4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "image");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "images");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "count");

  if (v42 < 2)
  {
    +[STSImageCache sharedCache](STSImageCache, "sharedCache");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "fetchCachedImageInfoForURL:", v11);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "agif_animatedImageWithImageInfo:", v45);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[STSImageCache sharedCache](STSImageCache, "sharedCache");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "fetchCachedStaticImageForURL:", v11);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v39, "image");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v43, "size");
  -[STSResultDetailViewController setContentSize:](v24, "setContentSize:");
  -[STSResultDetailViewController updateWithThumbnail:orThumbnailInfo:](v24, "updateWithThumbnail:orThumbnailInfo:", v43, 0);
  v47 = v24;

  return v47;
}

void __47__STSPicker__detailViewControllerForIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__STSPicker__detailViewControllerForIndexPath___block_invoke_2;
  v5[3] = &unk_24E745D30;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __47__STSPicker__detailViewControllerForIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProviderIcon:", *(_QWORD *)(a1 + 40));
}

- (void)_beginDownloadingResultAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  STSPicker *v28;
  _QWORD *v29;
  _QWORD *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  STSPicker *v37;
  _QWORD *v38;
  _QWORD *v39;
  id v40;
  _QWORD v41[4];
  _QWORD v42[5];
  id v43;
  id location;
  _QWORD block[4];
  id v46;
  STSPicker *v47;

  v5 = a3;
  -[STSSearchModel sections](self->_searchModel, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "resultType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("web_video"));

  if (v11)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke;
    block[3] = &unk_24E745D30;
    v46 = v9;
    v47 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v12 = v46;
  }
  else
  {
    v23 = v7;
    objc_storeStrong((id *)&self->_activeDownloadIndexPath, a3);
    self->_activeDownloadProgress = 0.0;
    -[STSPicker view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellForItemAtIndexPath:", self->_activeDownloadIndexPath);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v15;
    objc_msgSend(v15, "setShowDownloadIndicator:animated:", 1, 1.0);
    objc_initWeak(&location, self);
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__1;
    v42[4] = __Block_byref_object_dispose__1;
    v43 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    objc_msgSend(v9, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[STSImageCache sharedCache](STSImageCache, "sharedCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3;
    v35[3] = &unk_24E745F38;
    v19 = v16;
    v36 = v19;
    objc_copyWeak(&v40, &location);
    v37 = self;
    v38 = v42;
    v39 = v41;
    v32[0] = v18;
    v32[1] = 3221225472;
    v32[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_125;
    v32[3] = &unk_24E745F88;
    objc_copyWeak(&v34, &location);
    v32[4] = self;
    v20 = v5;
    v33 = v20;
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3_128;
    v24[3] = &unk_24E745FB0;
    objc_copyWeak(&v31, &location);
    v25 = v20;
    v29 = v41;
    v21 = v19;
    v26 = v21;
    v30 = v42;
    v27 = v9;
    v28 = self;
    objc_msgSend(v17, "fetchImageDataWithURL:priority:isSource:begin:progress:completion:", v21, 8, 1, v35, v32, v24);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v40);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(v42, 8);

    objc_destroyWeak(&location);
    v12 = v22;
    v7 = v23;
  }

}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke(uint64_t a1)
{
  STSPayload *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v2 = objc_alloc_init(STSPayload);
  objc_msgSend(*(id *)(a1 + 32), "punchout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2;
  v6[3] = &unk_24E745F10;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  -[STSPayload setVideoURL:](v2, "setVideoURL:", v8[5]);
  objc_msgSend(*(id *)(a1 + 40), "selectionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "browser:didSelectResult:withPayload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v2);

  _Block_object_dispose(&v7, 8);
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("http"));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v13 = 138412290;
    v14 = v2;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Begin downloading image at URL: %@", (uint8_t *)&v13, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "currentQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "currentQuery");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &stru_24E7469D8;
    }
    objc_msgSend(v4, "didStartNetworkRequest:query:queryId:", v5, v7, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (v6)
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemUptime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v12;

}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_125(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  double v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2_126;
    v8[3] = &unk_24E745F60;
    v7 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    v10 = WeakRetained;
    v11 = (double)a2 / (double)a3;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2_126(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1048) = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setDownloadProgress:", *(double *)(a1 + 56));
  }
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3_128(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *WeakRetained;
  id *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t (*__ptr32 *v25)();
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  id *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id *v38;
  id v39;
  void *v40;
  id *v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  id *v50;
  uint64_t v51;
  _QWORD v52[4];
  _QWORD v53[2];
  _QWORD v54[4];
  id v55;
  id *v56;
  id v57;
  _QWORD block[4];
  id *v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  v15 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained[130], "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "systemUptime");
    v18 = v17;
    v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("STSImageDownloadOperationStatusCode"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v18 - v19) * 1000.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v64 = v20;
      v65 = 2112;
      v66 = v21;
      v67 = 2112;
      v68 = v22;
      _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "source image downloaded status_code %@ %@ (duration %@)", buf, 0x20u);

    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "didEndNetworkRequest:infoDict:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v12);

    }
    objc_msgSend(v11, "lowercaseString");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v25 = &off_221814000;
    if (v10 && !v13)
    {
      if ((objc_msgSend(v48, "containsString:", CFSTR("gif")) & 1) != 0
        || (objc_msgSend(v48, "containsString:", CFSTR("jpeg")) & 1) != 0
        || (objc_msgSend(v48, "containsString:", CFSTR("png")) & 1) != 0)
      {
        goto LABEL_18;
      }
      v61 = *MEMORY[0x24BDD0FC8];
      STSLocalizedString(CFSTR("ERROR_DESC_UNSUPPORTED_FILETYPE"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("STSErrorDomain"), 1, v27);
      v24 = MEMORY[0x24BDAC760];
    }
    if (v13)
    {
      objc_msgSend(v13, "domain");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BDD1308]))
      {
        v29 = v24;
        v30 = objc_msgSend(v13, "code");

        v31 = v30 == -999;
        v24 = v29;
        v25 = &off_221814000;
        if (v31)
          goto LABEL_22;
      }
      else
      {

      }
      v52[0] = v24;
      v52[1] = *((_QWORD *)v25 + 184);
      v52[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3_145;
      v52[3] = &unk_24E745D30;
      v41 = (id *)v53;
      v13 = v13;
      v42 = *(_QWORD *)(a1 + 56);
      v53[0] = v13;
      v53[1] = v42;
      dispatch_async(MEMORY[0x24BDAC9B8], v52);
LABEL_21:

LABEL_22:
      v49[0] = v24;
      v49[1] = *((_QWORD *)v25 + 184);
      v49[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_4;
      v49[3] = &unk_24E745D30;
      v43 = v15;
      v44 = *(_QWORD *)(a1 + 56);
      v50 = v43;
      v51 = v44;
      dispatch_async(MEMORY[0x24BDAC9B8], v49);

      goto LABEL_23;
    }
LABEL_18:
    block[0] = v24;
    block[1] = 3221225472;
    block[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_139;
    block[3] = &unk_24E745D30;
    v47 = v11;
    v32 = v15;
    v59 = v32;
    v60 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v45, "stringByAppendingPathComponent:", CFSTR("tmp.gif"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v24;
    v36 = (void *)objc_msgSend(v33, "initWithString:", v34);

    v25 = &off_221814000;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeItemAtPath:error:", v36, 0);
    objc_msgSend(v10, "writeToFile:atomically:", v36, 1);
    v54[0] = v35;
    v54[1] = 3221225472;
    v54[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2_143;
    v54[3] = &unk_24E745DA8;
    v55 = v36;
    v38 = v32;
    v11 = v47;
    v56 = v38;
    v57 = *(id *)(a1 + 48);
    v39 = v36;
    v40 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], v54);

    v24 = v35;
    v41 = (id *)&v59;

    v13 = 0;
    goto LABEL_21;
  }
LABEL_23:

}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_139(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDownloadProgress:", 1.0);
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2_143(uint64_t a1)
{
  void *v2;
  void *v3;
  STSPayload *v4;

  v4 = objc_alloc_init(STSPayload);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSPayload setImageURL:](v4, "setImageURL:", v2);

  objc_msgSend(*(id *)(a1 + 40), "selectionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browser:didSelectResult:withPayload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);

}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3_145(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x24BEBD3B0];
  STSLocalizedString(CFSTR("SHARE_IMAGE_FAILED_ALERT_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BEBD3A8];
  STSLocalizedString(CFSTR("OK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v7);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v8, 1, 0);

}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1040));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setShowDownloadIndicator:animated:", 1, 0.0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1040);
  *(_QWORD *)(v4 + 1040) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) = 0;
}

- (void)_cancelActiveDownload
{
  NSIndexPath *activeDownloadIndexPath;
  NSIndexPath *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  activeDownloadIndexPath = self->_activeDownloadIndexPath;
  if (activeDownloadIndexPath)
  {
    self->_activeDownloadIndexPath = 0;
    v4 = activeDownloadIndexPath;

    self->_activeDownloadProgress = 0.0;
    -[STSSearchModel sections](self->_searchModel, "sections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", -[NSIndexPath section](v4, "section"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", -[NSIndexPath item](v4, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[STSImageCache sharedCache](STSImageCache, "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelQueuedDownloadForURL:", v9);

    -[STSPicker view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForItemAtIndexPath:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setShowDownloadIndicator:animated:", 1, 0.0);
  }
}

- (void)_reportFeedbackDisplayedResultsDidScroll:(BOOL)a3
{
  NSObject *displayedResultsQueue;
  _QWORD v4[5];
  BOOL v5;

  displayedResultsQueue = self->_displayedResultsQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__STSPicker__reportFeedbackDisplayedResultsDidScroll___block_invoke;
  v4[3] = &unk_24E745FD8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(displayedResultsQueue, v4);
}

uint64_t __54__STSPicker__reportFeedbackDisplayedResultsDidScroll___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "count");
  if (result)
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "copy");
    objc_msgSend(v3, "didShowResults:scrolling:", v4, *(unsigned __int8 *)(a1 + 40));

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "removeAllObjects");
  }
  return result;
}

- (id)_noticeTextForSearchError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("STSErrorDomain")))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 2)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD1308]))
  {

    goto LABEL_9;
  }
  v7 = objc_msgSend(v3, "code");

  if (v7 != -1009)
  {
LABEL_9:
    STSLocalizedString(CFSTR("ERROR_DESC_COULD_NOT_LOAD"));
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_7:
  objc_msgSend(v3, "localizedDescription");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = (void *)v8;

  return v9;
}

- (void)sendVisibleResultsFeedback
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL isScrolling;
  NSObject *displayedResultsQueue;
  id v33;
  _QWORD block[4];
  id v35;
  BOOL v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[STSSearchModel sections](self->_searchModel, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[STSPicker pickerView](self, "pickerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathsForVisibleItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          -[STSPicker pickerView](self, "pickerView", v33);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "collectionView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "cellForItemAtIndexPath:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v16, "layer");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "frame");
            v19 = v18;

            -[STSPicker pickerView](self, "pickerView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "collectionView");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "contentOffset");
            v23 = v22;
            objc_msgSend(v21, "frame");
            v25 = v23 + v24;
            objc_msgSend(v21, "contentInset");
            if (v19 < v25 - v26 + -20.0)
            {
              -[STSSearchModel sections](self->_searchModel, "sections");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v28, "results");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v13, "item"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if ((-[NSMutableSet containsObject:](self->_visibleResultsSent, "containsObject:", v30) & 1) == 0)
              {
                -[NSMutableSet addObject:](self->_visibleResultsSent, "addObject:", v30);
                objc_msgSend(v33, "addObject:", v30);
              }

            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v33, "count"))
    {
      isScrolling = self->_isScrolling;
      displayedResultsQueue = self->_displayedResultsQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __39__STSPicker_sendVisibleResultsFeedback__block_invoke;
      block[3] = &unk_24E745FD8;
      v35 = v33;
      v36 = isScrolling;
      dispatch_async(displayedResultsQueue, block);

    }
  }
}

void __39__STSPicker_sendVisibleResultsFeedback__block_invoke(uint64_t a1)
{
  id v2;

  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didShowResults:scrolling:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (STSPickerSelectionDelegate)selectionDelegate
{
  return (STSPickerSelectionDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (NSString)headerCellReuseIdentifier
{
  return self->_headerCellReuseIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCellReuseIdentifier, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_debugItems, 0);
  objc_storeStrong((id *)&self->_originalColor, 0);
  objc_storeStrong((id *)&self->_visibleResultsSent, 0);
  objc_storeStrong((id *)&self->_previewingSearchResult, 0);
  objc_storeStrong((id *)&self->_displayedResultsQueue, 0);
  objc_storeStrong((id *)&self->_detailTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_feedbackMailComposer, 0);
  objc_storeStrong((id *)&self->_previewingContext, 0);
  objc_storeStrong((id *)&self->_activeDownloadIndexPath, 0);
  objc_storeStrong((id *)&self->_detailResultIndexPath, 0);
  objc_storeStrong((id *)&self->_visiblePredictions, 0);
  objc_storeStrong((id *)&self->_lastInsertedIndexesWaitingToLoad, 0);
  objc_storeStrong((id *)&self->_queuedImageURLs, 0);
  objc_storeStrong((id *)&self->_displayedResults, 0);
  objc_storeStrong((id *)&self->_lastSearchId, 0);
  objc_storeStrong((id *)&self->_searchModel, 0);
}

- (void)_handleLongPress:(id *)a1 .cold.1(id *a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = objc_msgSend(v3, "count");
  _os_log_fault_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "processing feedback for STSPicker handleLongPress, somehow the selected section (%lu), is greater than the number of feedback sections (%lu)", (uint8_t *)&v4, 0x16u);

}

@end
