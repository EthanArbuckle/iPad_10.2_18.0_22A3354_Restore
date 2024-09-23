@implementation PXMemoriesFeedViewControllerHelper

- (PXMemoriesFeedViewControllerHelper)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXMemoriesFeedViewControllerHelper *v6;
  PXMemoriesFeedViewControllerHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMemoriesFeedViewControllerHelper;
  v6 = -[PXMemoriesFeedViewControllerHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_photoLibrary, a3);

  return v7;
}

- (PXMemoriesFeedViewControllerHelper)initWithScrollViewController:(id)a3 photoLibrary:(id)a4 traitCollection:(id)a5 tilingControllerConfigurationBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXMemoriesFeedViewControllerHelper *v15;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitCollection"));

  }
  v15 = -[PXMemoriesFeedViewControllerHelper initWithScrollViewController:photoLibrary:traitCollection:memoriesStyle:tilingControllerConfigurationBlock:](self, "initWithScrollViewController:photoLibrary:traitCollection:memoriesStyle:tilingControllerConfigurationBlock:", v11, v12, v13, 0, v14);

  return v15;
}

- (PXMemoriesFeedViewControllerHelper)initWithScrollViewController:(id)a3 photoLibrary:(id)a4 traitCollection:(id)a5 memoriesStyle:(unint64_t)a6 tilingControllerConfigurationBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, PXTilingController *, PXMemoriesSpec *);
  PXMemoriesFeedViewControllerHelper *v17;
  PXMemoriesFeedViewControllerHelper *v18;
  uint64_t v19;
  PXViewControllerEventTracker *eventTracker;
  PXMemoriesSpecManager *v21;
  PXMemoriesSpecManager *specManager;
  uint64_t v23;
  PXMemoriesSpec *spec;
  uint64_t v25;
  PXMemoriesFeedDataSourceManager *dataSourceManager;
  uint64_t v27;
  PXSectionedSelectionManager *selectionManager;
  PXMemoriesFeedScrollFilter *v29;
  PXMemoriesFeedScrollFilter *scrollFilter;
  id v31;
  PXMemoriesFeedTilingLayout *v32;
  PXMemoriesSpec *v33;
  void *v34;
  PXMemoriesFeedTilingLayout *v35;
  PXTilingController *v36;
  PXTilingController *tilingController;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  objc_super v45;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, PXTilingController *, PXMemoriesSpec *))a7;
  v45.receiver = self;
  v45.super_class = (Class)PXMemoriesFeedViewControllerHelper;
  v17 = -[PXMemoriesFeedViewControllerHelper init](&v45, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_needsToUpdate.layoutEngine = 1;
    PXMemoriesViewControllerEventTrackerCreate(v15);
    v19 = objc_claimAutoreleasedReturnValue();
    eventTracker = v18->_eventTracker;
    v18->_eventTracker = (PXViewControllerEventTracker *)v19;

    objc_storeStrong((id *)&v18->_scrollViewController, a3);
    objc_storeStrong((id *)&v18->_photoLibrary, a4);
    objc_storeStrong((id *)&v18->_traitCollection, a5);
    v21 = -[PXMemoriesSpecManager initWithExtendedTraitCollection:options:style:]([PXMemoriesSpecManager alloc], "initWithExtendedTraitCollection:options:style:", v15, 0, a6);
    specManager = v18->_specManager;
    v18->_specManager = v21;

    -[PXFeatureSpecManager spec](v18->_specManager, "spec");
    v23 = objc_claimAutoreleasedReturnValue();
    spec = v18->__spec;
    v18->__spec = (PXMemoriesSpec *)v23;

    v25 = objc_msgSend(objc_alloc(-[PXMemoriesSpec feedDataSourceManagerClass](v18->__spec, "feedDataSourceManagerClass")), "initWithPhotoLibrary:", v14);
    dataSourceManager = v18->_dataSourceManager;
    v18->_dataSourceManager = (PXMemoriesFeedDataSourceManager *)v25;

    -[PXMemoriesFeedDataSourceManagerBase startObservingChanges](v18->_dataSourceManager, "startObservingChanges");
    v27 = objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v18->_dataSourceManager);
    selectionManager = v18->_selectionManager;
    v18->_selectionManager = (PXSectionedSelectionManager *)v27;

    -[PXSectionedDataSourceManager registerChangeObserver:context:](v18->_dataSourceManager, "registerChangeObserver:context:", v18, PXDataSourceManagerObservationContext_128624);
    -[PXSectionedSelectionManager registerChangeObserver:context:](v18->_selectionManager, "registerChangeObserver:context:", v18, PXSelectionManagerObservationContext_128627);
    -[PXExtendedTraitCollection registerChangeObserver:context:](v18->_traitCollection, "registerChangeObserver:context:", v18, PXExtendedTraitCollectionObservationContext_128625);
    -[PXMemoriesSpecManager registerChangeObserver:context:](v18->_specManager, "registerChangeObserver:context:", v18, PXSpecManagerObservationContext_128626);
    -[PXMemoriesFeedDataSourceManager startGeneratingMemories](v18->_dataSourceManager, "startGeneratingMemories");
    v29 = -[PXMemoriesFeedScrollFilter initWithScrollViewController:]([PXMemoriesFeedScrollFilter alloc], "initWithScrollViewController:", v18->_scrollViewController);
    scrollFilter = v18->__scrollFilter;
    v18->__scrollFilter = v29;

    -[PXMemoriesFeedScrollFilter setDelegate:](v18->__scrollFilter, "setDelegate:", v18);
    -[PXMemoriesFeedScrollFilter setSpec:](v18->__scrollFilter, "setSpec:", v18->__spec);
    v31 = objc_alloc_init(-[PXMemoriesSpec feedTransitionAnimationCoordinatorClass](v18->__spec, "feedTransitionAnimationCoordinatorClass"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[transitionAnimationCoordinator isKindOfClass:[PXMemoriesFeedTransitionAnimationCoordinator class]]"));

    }
    objc_storeStrong((id *)&v18->__transitionAnimationCoordinator, v31);
    v32 = [PXMemoriesFeedTilingLayout alloc];
    v33 = v18->__spec;
    -[PXLayoutEngine layoutSnapshot](v18->__layoutEngine, "layoutSnapshot");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[PXMemoriesFeedTilingLayout initWithSpec:layoutSnapshot:](v32, "initWithSpec:layoutSnapshot:", v33, v34);

    -[PXMemoriesFeedViewControllerHelper _configureLayout:](v18, "_configureLayout:", v35);
    v36 = -[PXTilingController initWithLayout:]([PXTilingController alloc], "initWithLayout:", v35);
    tilingController = v18->_tilingController;
    v18->_tilingController = v36;

    -[PXTilingController setScrollController:](v18->_tilingController, "setScrollController:", v18->_scrollViewController);
    -[PXTilingController setScrollDelegate:](v18->_tilingController, "setScrollDelegate:", v18);
    -[PXTilingController setTransitionDelegate:](v18->_tilingController, "setTransitionDelegate:", v18);
    v16[2](v16, v18->_tilingController, v18->__spec);
    -[PXTilingController tileSource](v18->_tilingController, "tileSource");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 153, CFSTR("The configured tiling controller must have a tile source."));

    }
    -[PXTilingController tileAnimator](v18->_tilingController, "tileAnimator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 154, CFSTR("The configured tiling controller must have a tile animator."));

    }
  }

  return v18;
}

- (void)_handleChangeFromDataSource:(id)a3 toDataSource:(id)a4 withChangeDetails:(id)a5
{
  NSString *v8;
  NSString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSString *v15;
  NSObject *v16;
  NSObject *v17;
  NSString *scrollTargetMemoryUUID;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  uint64_t v23;
  NSString *v24;
  NSString *v25;
  _QWORD v26[4];
  uint8_t buf[4];
  PXMemoriesFeedViewControllerHelper *v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  NSString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a4;
  v9 = (NSString *)a5;
  PLMemoriesGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v28 = self;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "%@ data source changed to %@ with details %@", buf, 0x20u);
  }

  -[PXMemoriesFeedViewControllerHelper _lastUserMemoryGenerationRequestDate](self, "_lastUserMemoryGenerationRequestDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "timeIntervalSinceNow");
    v14 = v13;
    -[PXMemoriesFeedViewControllerHelper _setLastUserMemoryGenerationRequestDate:](self, "_setLastUserMemoryGenerationRequestDate:", v12);
    if (v14 <= 0.0 && v14 > -36000.0)
    {
      -[PXMemoriesFeedViewControllerHelper _memoryReferenceInsertedOnChangeToDataSource:withChangeDetails:](self, "_memoryReferenceInsertedOnChangeToDataSource:withChangeDetails:", v8, v9);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      PLMemoriesGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
      goto LABEL_17;
    }
  }
  if (!a3
    && -[NSString numberOfSections](v8, "numberOfSections") >= 1
    && -[NSString numberOfItemsInSection:](v8, "numberOfItemsInSection:", 0) >= 1)
  {
    v26[0] = -[NSString identifier](v8, "identifier");
    v26[1] = 0;
    v26[2] = 0;
    v26[3] = 0x7FFFFFFFFFFFFFFFLL;
    -[NSString objectReferenceAtIndexPath:](v8, "objectReferenceAtIndexPath:", v26);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    PLMemoriesGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
LABEL_16:
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEBUG, "%@ memory to scroll to visible %@", buf, 0x16u);
    }
LABEL_17:

    -[PXMemoriesFeedViewControllerHelper _setMemoryReferenceToScrollToVisible:](self, "_setMemoryReferenceToScrollToVisible:", v15);
LABEL_26:

    goto LABEL_27;
  }
  if (self->_scrollTargetMemoryUUID)
  {
    -[NSString sectionedObjectReferenceForMemoryUUID:](v8, "sectionedObjectReferenceForMemoryUUID:");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[PXMemoriesFeedViewControllerHelper _setMemoryReferenceToScrollToVisible:](self, "_setMemoryReferenceToScrollToVisible:", v15);
      -[PXMemoriesFeedViewControllerHelper setScrollTargetMemoryUUID:](self, "setScrollTargetMemoryUUID:", 0);
      PLMemoriesGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        scrollTargetMemoryUUID = self->_scrollTargetMemoryUUID;
        *(_DWORD *)buf = 138412802;
        v28 = self;
        v29 = 2112;
        v30 = v15;
        v31 = 2112;
        v32 = scrollTargetMemoryUUID;
        v19 = "%@ memory to scroll to a memory target %@ (uuid - %@)";
        v20 = v17;
        v21 = OS_LOG_TYPE_DEBUG;
        v22 = 32;
LABEL_24:
        _os_log_impl(&dword_1A6789000, v20, v21, v19, buf, v22);
      }
LABEL_25:

      goto LABEL_26;
    }
    v23 = _handleChangeFromDataSource_toDataSource_withChangeDetails__numberOfRetry++;
    if (v23 < 2)
    {
      PLMemoriesGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        goto LABEL_25;
      v25 = self->_scrollTargetMemoryUUID;
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = v25;
      v19 = "%@ attempted to scroll to a memory with uuid %@ but couldn't find sectioned object reference for it. Try aga"
            "in at the next iteration of datasource change.";
      v20 = v17;
      v21 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      -[PXMemoriesFeedViewControllerHelper setScrollTargetMemoryUUID:](self, "setScrollTargetMemoryUUID:", 0);
      _handleChangeFromDataSource_toDataSource_withChangeDetails__numberOfRetry = 0;
      PLMemoriesGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      v24 = self->_scrollTargetMemoryUUID;
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = v24;
      v19 = "%@ Failed to scroll to a memory with uuid %@";
      v20 = v17;
      v21 = OS_LOG_TYPE_ERROR;
    }
    v22 = 22;
    goto LABEL_24;
  }
LABEL_27:

}

- (BOOL)canRequestNewMemoriesForReason:(unint64_t)a3
{
  void *v6;
  BOOL v7;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "BOOLForKey:", CFSTR("PXIgnoreRefreshLimit")) & 1) != 0 || a3 == 1)
  {
    v7 = 1;
  }
  else
  {
    if (!a3 || a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 224, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)canRequestNewMemories
{
  return -[PXMemoriesFeedViewControllerHelper canRequestNewMemoriesForReason:](self, "canRequestNewMemoriesForReason:", 1);
}

- (void)requestNewMemoriesForReason:(unint64_t)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((a3 | 2) != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(PHMemoryCreationReasonUserRequest == reason) || (PHMemoryCreationReasonTodayWidgetRequest == reason)"));

  }
  v9 = -[PXMemoriesFeedViewControllerHelper _isRequestingNewMemories](self, "_isRequestingNewMemories");
  v10 = -[PXMemoriesFeedViewControllerHelper canRequestNewMemoriesForReason:](self, "canRequestNewMemoriesForReason:", a3);
  if (!v9 && v10)
  {
    -[PXMemoriesFeedViewControllerHelper _setNewMemoriesRequestCompletion:](self, "_setNewMemoriesRequestCompletion:", v7);
    -[PXMemoriesFeedViewControllerHelper _setRequestingNewMemories:](self, "_setRequestingNewMemories:", 1);
    -[PXMemoriesFeedViewControllerHelper _setRefreshRetryCount:](self, "_setRefreshRetryCount:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoriesFeedViewControllerHelper _setLastUserMemoryGenerationRequestDate:](self, "_setLastUserMemoryGenerationRequestDate:", v11);

    -[PXMemoriesFeedViewControllerHelper _startRefreshForReason:](self, "_startRefreshForReason:", a3);
    goto LABEL_18;
  }
  PLMemoriesGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v13)
      goto LABEL_16;
    v14 = "Widget";
    if (a3 == 1)
      v14 = "User";
    *(_DWORD *)buf = 136315138;
    v18 = v14;
    v15 = "%s request to generate memories ignored: request already in progress";
  }
  else
  {
    if (!v13)
      goto LABEL_16;
    v16 = "Widget";
    if (a3 == 1)
      v16 = "User";
    *(_DWORD *)buf = 136315138;
    v18 = v16;
    v15 = "%s request to generate memories ignored: reached request limit";
  }
  _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
LABEL_16:

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
LABEL_18:

}

- (void)requestNewMemoriesWithCompletion:(id)a3
{
  -[PXMemoriesFeedViewControllerHelper requestNewMemoriesForReason:withCompletion:](self, "requestNewMemoriesForReason:withCompletion:", 1, a3);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $65CA9207A4E8A1AA7D5EF1EE10137E61 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->feedIsVisible = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->reloadedTileKindsOnObjectChanged = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->configureMetrics = objc_opt_respondsToSelector() & 1;
  }

}

- (void)didChangeTilingControllerLayout
{
  void *v3;
  NSObject *v4;
  int v5;
  PXMemoriesFeedViewControllerHelper *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PXMemoriesFeedViewControllerHelper _memoryReferenceToScrollToVisible](self, "_memoryReferenceToScrollToVisible");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXMemoriesFeedViewControllerHelper _setMemoryReferenceToScrollToVisible:](self, "_setMemoryReferenceToScrollToVisible:", 0);
    PLMemoriesGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412546;
      v6 = self;
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%@ scrolling memory reference %@", (uint8_t *)&v5, 0x16u);
    }

    -[PXMemoriesFeedViewControllerHelper scrollMemoryReferenceToVisible:animated:](self, "scrollMemoryReferenceToVisible:animated:", v3, self->_hasAppeared);
  }

}

- (id)memoryObjectReferenceInScrollViewAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  y = a3.y;
  x = a3.x;
  -[PXMemoriesFeedViewControllerHelper currentLayout](self, "currentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  -[PXMemoriesFeedViewControllerHelper indexPathForMemoryInScrollViewAtPoint:](self, "indexPathForMemoryInScrollViewAtPoint:", x, y);
  if (v7 && (_QWORD)v11 != *(_QWORD *)off_1E50B7E98)
  {
    v10[0] = v11;
    v10[1] = v12;
    objc_msgSend(v7, "objectReferenceAtIndexPath:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)memoryInfoInScrollViewAtPoint:(CGPoint)a3
{
  void *v4;
  void *v5;

  -[PXMemoriesFeedViewControllerHelper memoryObjectReferenceInScrollViewAtPoint:](self, "memoryObjectReferenceInScrollViewAtPoint:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesFeedViewControllerHelper memoryInfoForMemoryObjectReference:](self, "memoryInfoForMemoryObjectReference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)memoryInfoForMemoryObjectReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  if (v4)
  {
    -[PXMemoriesFeedViewControllerHelper currentLayout](self, "currentLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[PXMemoriesFeedViewControllerHelper dataSourceManager](self, "dataSourceManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataSource");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "objectReferenceForObjectReference:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "indexPath");
      objc_msgSend(v8, "objectAtIndexPath:", &v12);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v4;
}

- (PXSimpleIndexPath)indexPathForMemoryInScrollViewAtPoint:(SEL)a3
{
  double y;
  double x;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  PXSimpleIndexPath *result;
  __int128 v17;
  __int128 v18;

  y = a4.y;
  x = a4.x;
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v8;
  -[PXMemoriesFeedViewControllerHelper tilingController](self, "tilingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesFeedViewControllerHelper currentLayout](self, "currentLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v9, "contentCoordinateSpaceIdentifier"), objc_msgSend(v10, "coordinateSpaceIdentifier"), x, y);
    v13 = v12;
    v15 = v14;

    objc_msgSend(v10, "indexPathForMemoryAtPoint:", v13, v15);
    *(_OWORD *)&retstr->dataSourceIdentifier = v17;
    *(_OWORD *)&retstr->item = v18;
  }

  return result;
}

- (id)memoryInfoAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v9[2];

  -[PXMemoriesFeedViewControllerHelper currentLayout](self, "currentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v6;
  objc_msgSend(v5, "objectAtIndexPath:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PXSimpleIndexPath)indexPathForMemoryObjectReference:(SEL)a3
{
  id v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  PXSimpleIndexPath *result;
  __int128 v12;
  __int128 v13;

  v6 = a4;
  v7 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v7;
  if (v6)
  {
    -[PXMemoriesFeedViewControllerHelper currentLayout](self, "currentLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "indexPathForObjectReference:", v6);
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
    }
    *(_OWORD *)&retstr->dataSourceIdentifier = v12;
    *(_OWORD *)&retstr->item = v13;

  }
  return result;
}

- (PXMemoriesFeedTilingLayout)currentLayout
{
  void *v2;
  void *v3;

  -[PXMemoriesFeedViewControllerHelper tilingController](self, "tilingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXMemoriesFeedTilingLayout *)v3;
}

- (PXMemoriesFeedTilingLayout)targetLayout
{
  void *v2;
  void *v3;

  -[PXMemoriesFeedViewControllerHelper tilingController](self, "tilingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXMemoriesFeedTilingLayout *)v3;
}

- (void)setActivatedMemoryReference:(id)a3
{
  PXSectionedObjectReference *v5;
  PXSectionedObjectReference *v6;

  v5 = (PXSectionedObjectReference *)a3;
  if (self->_activatedMemoryReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_activatedMemoryReference, a3);
    -[PXMemoriesFeedViewControllerHelper _updateHighlightedIndexPathInLayout](self, "_updateHighlightedIndexPathInLayout");
    v5 = v6;
  }

}

- (void)setLastActionPresentationMemoryReference:(id)a3
{
  PXSectionedObjectReference *v5;
  PXSectionedObjectReference *v6;

  v5 = (PXSectionedObjectReference *)a3;
  if (self->_lastActionPresentationMemoryReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lastActionPresentationMemoryReference, a3);
    -[PXMemoriesFeedViewControllerHelper _updateHighlightedIndexPathInLayout](self, "_updateHighlightedIndexPathInLayout");
    v5 = v6;
  }

}

- (void)setHighlightedMemoryReference:(id)a3
{
  PXSectionedObjectReference *v5;
  PXSectionedObjectReference *v6;

  v5 = (PXSectionedObjectReference *)a3;
  if (self->_highlightedMemoryReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_highlightedMemoryReference, a3);
    -[PXMemoriesFeedViewControllerHelper _updateHighlightedIndexPathInLayout](self, "_updateHighlightedIndexPathInLayout");
    v5 = v6;
  }

}

- (void)feedViewControllerDidAppear:(id)a3 shouldUpdateNotifications:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[PXMemoriesFeedViewControllerHelper dataSourceManager](self, "dataSourceManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_hasKickedOffBatchGeneration)
  {
    self->_hasKickedOffBatchGeneration = 1;
    objc_msgSend(v8, "generateAdditionalEntriesIfPossible");
  }
  self->_hasAppeared = 1;
  -[PXMemoriesFeedViewControllerHelper eventTracker](self, "eventTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logViewControllerDidAppear:", v6);

  if (v4)
    objc_msgSend(v8, "updateCurrentMemoriesNonPendingAndNotificationStatus");

}

- (void)feedViewControllerDidDisappear:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXMemoriesFeedViewControllerHelper saveAnchorMemory](self, "saveAnchorMemory");
  self->_hasAppeared = 0;
  -[PXMemoriesFeedViewControllerHelper eventTracker](self, "eventTracker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logViewControllerDidDisappear:", v4);

}

- (void)invalidateMetrics
{
  -[PXMemoriesFeedViewControllerHelper _invalidateLayoutEngine](self, "_invalidateLayoutEngine");
  -[PXMemoriesFeedViewControllerHelper _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_startRefreshForReason:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8[2];
  BOOL v9;
  id location;

  +[PXMemoriesFeedSettings sharedInstance](PXMemoriesFeedSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataSourceType");

  if (v6 != 3)
  {
    v7 = -[PXMemoriesFeedViewControllerHelper _refreshRetryCount](self, "_refreshRetryCount") < 2;
    objc_initWeak(&location, self);
    v9 = v7;
    objc_copyWeak(v8, &location);
    v8[1] = (id)a3;
    px_dispatch_on_main_queue();
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

- (void)_handleRefreshCompletionWithResultInformation:(id)a3 reason:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  dispatch_time_t v19;
  _QWORD v20[4];
  id v21[2];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  PLMemoriesGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Memories refresh result: %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Memories refresh error: %@", buf, 0xCu);
  }

  +[PXMemoriesFeedSettings sharedInstance](PXMemoriesFeedSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "dataSourceType");

  objc_msgSend(v9, "domain");
  v14 = objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (v13 == 3)
  {
    if (-[NSObject isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.photoanalysis")))
    {
      v15 = objc_msgSend(v9, "code");

      if (v15 == 6)
      {
        v16 = 30;
        goto LABEL_13;
      }
LABEL_16:
      -[PXMemoriesFeedViewControllerHelper _handleFinishedRequestingNewMemoriesWithSuccess:reason:error:](self, "_handleFinishedRequestingNewMemoriesWithSuccess:reason:error:", v8 != 0, a4, 0);
      goto LABEL_17;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!-[NSObject isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.photos.test")))
    goto LABEL_15;
  v17 = objc_msgSend(v9, "code");

  if (v17 != 42)
    goto LABEL_16;
  v16 = 3;
LABEL_13:
  v18 = -[PXMemoriesFeedViewControllerHelper _refreshRetryCount](self, "_refreshRetryCount");
  -[PXMemoriesFeedViewControllerHelper _setRefreshRetryCount:](self, "_setRefreshRetryCount:", v18 + 1);
  if (v18 >= v16)
    goto LABEL_16;
  objc_initWeak((id *)buf, self);
  v19 = dispatch_time(0, 5000000000);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __97__PXMemoriesFeedViewControllerHelper__handleRefreshCompletionWithResultInformation_reason_error___block_invoke;
  v20[3] = &unk_1E51447A0;
  objc_copyWeak(v21, (id *)buf);
  v21[1] = (id)a4;
  dispatch_after(v19, MEMORY[0x1E0C80D38], v20);
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
LABEL_17:

}

- (void)_handleFinishedRequestingNewMemoriesWithSuccess:(BOOL)a3 reason:(unint64_t)a4 error:(id)a5
{
  _BOOL8 v6;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  id v13;

  v6 = a3;
  v13 = a5;
  if ((a4 | 2) == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 489, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXMemoriesFeedViewControllerHelper _setRequestingNewMemories:](self, "_setRequestingNewMemories:", 0);
  -[PXMemoriesFeedViewControllerHelper _newMemoriesRequestCompletion](self, "_newMemoriesRequestCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v13;
  if (v9)
  {
    -[PXMemoriesFeedViewControllerHelper _newMemoriesRequestCompletion](self, "_newMemoriesRequestCompletion");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _BOOL8, id))v11)[2](v11, v6, v13);

    -[PXMemoriesFeedViewControllerHelper _setNewMemoriesRequestCompletion:](self, "_setNewMemoriesRequestCompletion:", 0);
    v10 = v13;
  }

}

- (id)_memoryReferenceInsertedOnChangeToDataSource:(id)a3 withChangeDetails:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  __int128 v13;
  void *v15;
  _OWORD v16[2];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "toDataSourceIdentifier");
    if (v10 != objc_msgSend(v7, "identifier"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 503, CFSTR("data source identifier mismatch"));

    }
    v18 = 0;
    v19 = &v18;
    v20 = 0x4010000000;
    v21 = &unk_1A7E74EE7;
    v11 = *((_OWORD *)off_1E50B8778 + 1);
    v22 = *(_OWORD *)off_1E50B8778;
    v23 = v11;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __101__PXMemoriesFeedViewControllerHelper__memoryReferenceInsertedOnChangeToDataSource_withChangeDetails___block_invoke;
    v17[3] = &unk_1E512AA70;
    v17[4] = &v18;
    -[PXMemoriesFeedViewControllerHelper _enumerateInsertedItemsInChangeDetails:withDataSource:usingBlock:](self, "_enumerateInsertedItemsInChangeDetails:withDataSource:usingBlock:", v9, v7, v17);
    if (v19[4] == *(_QWORD *)off_1E50B7E98)
    {
      v12 = 0;
    }
    else
    {
      v13 = *((_OWORD *)v19 + 3);
      v16[0] = *((_OWORD *)v19 + 2);
      v16[1] = v13;
      objc_msgSend(v7, "objectReferenceAtIndexPath:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_enumerateInsertedItemsInChangeDetails:(id)a3 withDataSource:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v10 = objc_msgSend(v7, "toDataSourceIdentifier");
  objc_msgSend(v7, "sectionChanges");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasIncrementalChanges"))
  {
    objc_msgSend(v11, "insertedIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke;
  v22[3] = &unk_1E512AA98;
  v14 = v8;
  v23 = v14;
  v15 = v9;
  v24 = v15;
  v25 = &v27;
  v26 = v10;
  objc_msgSend(v12, "enumerateIndexesUsingBlock:", v22);
  if (!*((_BYTE *)v28 + 24))
  {
    objc_msgSend(v7, "sectionsWithItemChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke_2;
    v17[3] = &unk_1E512AA98;
    v18 = v7;
    v19 = v15;
    v20 = &v27;
    v21 = v10;
    objc_msgSend(v16, "enumerateIndexesUsingBlock:", v17);

  }
  _Block_object_dispose(&v27, 8);

}

- (void)_invalidateLayoutEngine
{
  self->_needsToUpdate.layoutEngine = 1;
}

- (void)_setSpec:(id)a3
{
  PXMemoriesSpec *v5;
  PXMemoriesSpec *v6;

  v5 = (PXMemoriesSpec *)a3;
  if (self->__spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__spec, a3);
    -[PXMemoriesFeedViewControllerHelper _invalidateLayoutEngine](self, "_invalidateLayoutEngine");
    v5 = v6;
  }

}

- (void)_updateIfNeeded
{
  if (-[PXMemoriesFeedViewControllerHelper _needsUpdate](self, "_needsUpdate"))
    -[PXMemoriesFeedViewControllerHelper _updateLayoutEngineIfNeeded](self, "_updateLayoutEngineIfNeeded");
}

- (BOOL)_needsUpdate
{
  return self->_needsToUpdate.layoutEngine;
}

- (void)_updateLayoutEngineIfNeeded
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  PXSectionedLayoutEngine *v11;
  PXSectionedLayoutEngine *v12;
  PXSectionedLayoutEngine *layoutEngine;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint8_t buf[16];

  if (self->_needsToUpdate.layoutEngine)
  {
    self->_needsToUpdate.layoutEngine = 0;
    PLMemoriesGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "Updating memories feed layout", buf, 2u);
    }

    -[PXMemoriesFeedViewControllerHelper dataSourceManager](self, "dataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoriesFeedViewControllerHelper _spec](self, "_spec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init((Class)objc_msgSend(v7, "feedLayoutMetricsClass"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 592, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[metrics isKindOfClass:[PXMemoriesFeedLayoutMetrics class]]"));

    }
    -[PXMemoriesFeedViewControllerHelper _configureMetrics:](self, "_configureMetrics:", v8);
    v9 = (void *)objc_msgSend(v7, "newLayoutGeneratorWithMetrics:", v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 596, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[layoutGenerator isKindOfClass:[PXMemoriesFeedLayoutGenerator class]]"));

    }
    v10 = objc_msgSend(v7, "feedAxis");
    -[PXSectionedLayoutEngine setDelegate:](self->__layoutEngine, "setDelegate:", 0);
    v11 = [PXSectionedLayoutEngine alloc];
    objc_msgSend(v7, "layoutInsets");
    v12 = -[PXSectionedLayoutEngine initWithAxis:layoutGenerator:dataSourceSnapshot:insets:](v11, "initWithAxis:layoutGenerator:dataSourceSnapshot:insets:", v10, v9, v6);
    layoutEngine = self->__layoutEngine;
    self->__layoutEngine = v12;

    -[PXSectionedLayoutEngine setDelegate:](self->__layoutEngine, "setDelegate:", self);
    -[PXSectionedLayoutEngine performChangesAndWait:](self->__layoutEngine, "performChangesAndWait:", &__block_literal_global_128642);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_delegateRespondsTo.feedIsVisible
      || (-[PXMemoriesFeedViewControllerHelper delegate](self, "delegate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "memoriesFeedViewControllerHelperFeedIsVisible:", self),
          v15,
          (v16 & 1) == 0))
    {
      -[PXMemoriesFeedViewControllerHelper _handleNewLayoutSnapshot:](self, "_handleNewLayoutSnapshot:", v14);
    }

  }
}

- (void)_configureMetrics:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PXMemoriesFeedViewControllerHelper _spec](self, "_spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSpec:", v4);
  -[PXMemoriesFeedViewControllerHelper traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutReferenceSize");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v11, "setReferenceSize:", v7, v9);
  objc_msgSend(v4, "layoutInsets");
  objc_msgSend(v11, "setContentInsets:");
  if (self->_delegateRespondsTo.configureMetrics)
  {
    -[PXMemoriesFeedViewControllerHelper delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "memoriesFeedViewControllerHelper:configureMetrics:", self, v11);

  }
}

- (void)scrollMemoryReferenceToVisible:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64x2_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  int64x2_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  _OWORD v44[12];
  int64x2_t v45;
  int64x2_t v46;
  int64x2_t v47;
  int64x2_t v48;
  CGRect v49;

  v4 = a4;
  v6 = a3;
  -[PXMemoriesFeedViewControllerHelper tilingController](self, "tilingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateIfNeeded");

  objc_msgSend(v7, "currentLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 0uLL;
    v47 = 0u;
    v48 = 0u;
    if (v10)
    {
      objc_msgSend(v10, "indexPathForObjectReference:", v6);
      if (v47.i64[0] != *(_QWORD *)off_1E50B7E98)
      {
        v13 = *MEMORY[0x1E0C9D628];
        v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        objc_msgSend(v11, "firstItemIndexPath");
        v18 = v45;
        v17 = v46;
        v12 = v47;
        v19 = v48;
LABEL_7:
        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v12, v18), (int32x4_t)vceqq_s64(v19, v17))), 0xFuLL))) & 1) != 0)
        {
          objc_msgSend(v9, "contentBounds");
          v13 = v24;
          v14 = v25;
          v15 = v26;
          v16 = 1.0;
        }
        else
        {
          memset(v44, 0, sizeof(v44));
          v37 = xmmword_1A7C0C450;
          v38 = objc_msgSend(v11, "identifier");
          v39 = v47.i64[1];
          v40 = v48;
          v41 = 0u;
          v42 = 0u;
          v43 = 0;
          if (objc_msgSend(v9, "getGeometry:group:userData:forTileWithIdentifier:", v44, 0, 0, &v37))
          {
            sub_1A7AE3F38();
            PXEdgeInsetsInsetRect();
            v13 = v20;
            v14 = v21;
            v15 = v22;
            v16 = v23;
          }
        }
        v49.origin.x = v13;
        v49.origin.y = v14;
        v49.size.width = v15;
        v49.size.height = v16;
        if (!CGRectIsNull(v49))
        {
          +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v9, "coordinateSpaceIdentifier"), objc_msgSend(v7, "contentCoordinateSpaceIdentifier"), v13, v14, v15, v16);
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v35 = v34;

          -[PXMemoriesFeedViewControllerHelper scrollViewController](self, "scrollViewController");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "scrollRectToVisible:animated:", v4, v29, v31, v33, v35);

        }
      }
    }
    else if (*(_QWORD *)off_1E50B7E98)
    {
      v13 = *MEMORY[0x1E0C9D628];
      v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v45 = 0uLL;
      v46 = 0uLL;
      v19 = 0uLL;
      v18 = 0uLL;
      v17 = 0uLL;
      goto LABEL_7;
    }

  }
}

- (void)saveAnchorMemory
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[9];
  _QWORD v25[4];
  _QWORD v26[4];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  _BYTE buf[24];
  uint64_t v50;
  uint64_t v51;
  CGPoint v52;

  v51 = *MEMORY[0x1E0C80C00];
  -[PXMemoriesFeedViewControllerHelper currentLayout](self, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleRect");
  v5 = v4;
  v7 = v6;
  v39 = 0;
  v40 = &v39;
  v41 = 0x7810000000;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v42 = &unk_1A7E74EE7;
  v48 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0xE010000000;
  v26[3] = &unk_1A7E74EE7;
  v8 = *((_OWORD *)off_1E50B8940 + 9);
  v35 = *((_OWORD *)off_1E50B8940 + 8);
  v36 = v8;
  v9 = *((_OWORD *)off_1E50B8940 + 11);
  v37 = *((_OWORD *)off_1E50B8940 + 10);
  v38 = v9;
  v10 = *((_OWORD *)off_1E50B8940 + 5);
  v31 = *((_OWORD *)off_1E50B8940 + 4);
  v32 = v10;
  v11 = *((_OWORD *)off_1E50B8940 + 7);
  v33 = *((_OWORD *)off_1E50B8940 + 6);
  v34 = v11;
  v12 = *((_OWORD *)off_1E50B8940 + 1);
  v27 = *(_OWORD *)off_1E50B8940;
  v28 = v12;
  v13 = *((_OWORD *)off_1E50B8940 + 3);
  v29 = *((_OWORD *)off_1E50B8940 + 2);
  v30 = v13;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0x7FEFFFFFFFFFFFFFLL;
  objc_msgSend(v3, "contentInset");
  objc_msgSend(v3, "visibleRect");
  PXEdgeInsetsInsetRect();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __54__PXMemoriesFeedViewControllerHelper_saveAnchorMemory__block_invoke;
  v24[3] = &unk_1E512AB28;
  *(double *)&v24[7] = v5;
  *(double *)&v24[8] = v7;
  v24[4] = v25;
  v24[5] = &v39;
  v24[6] = v26;
  objc_msgSend(v3, "enumerateTilesInRect:withOptions:usingBlock:", 0, v24);
  if (v40[4])
  {
    v14 = v40[6];
    v15 = v40[7];
    v16 = v40[8];
    v17 = v40[9];
    objc_msgSend(v3, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v14;
    *(_QWORD *)&buf[8] = v15;
    *(_QWORD *)&buf[16] = v16;
    v50 = v17;
    objc_msgSend(v18, "objectReferenceAtIndexPath:", buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "visibleRect");
    objc_msgSend(v3, "contentInset");
    PXEdgeInsetsInsetRect();
    PXPointSubtract();
    v5 = v20;
    v7 = v21;
  }
  else
  {
    v19 = 0;
  }
  PLMemoriesGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v52.x = v5;
    v52.y = v7;
    NSStringFromCGPoint(v52);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v23;
    _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEBUG, "Saving anchor memory:\r%@\rwith offset: %@", buf, 0x16u);

  }
  -[PXMemoriesFeedViewControllerHelper _setAnchorMemoryReference:](self, "_setAnchorMemoryReference:", v19);
  -[PXMemoriesFeedViewControllerHelper _setAnchorMemoryOrigin:](self, "_setAnchorMemoryOrigin:", v5, v7);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v39, 8);

}

- (void)_handleDataSourceChange
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
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  -[PXMemoriesFeedViewControllerHelper _layoutEngine](self, "_layoutEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesFeedViewControllerHelper dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXMemoriesFeedViewControllerHelper dataSourceManager](self, "dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeHistory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v4, "identifier"), objc_msgSend(v6, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[PXMemoriesFeedViewControllerHelper _handleChangeFromDataSource:toDataSource:withChangeDetails:](self, "_handleChangeFromDataSource:toDataSource:withChangeDetails:", v4, v6, v10);
  if (objc_msgSend(v6, "numberOfSections") < 1)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PXMemoriesFeedViewControllerHelper saveAnchorMemory](self, "saveAnchorMemory");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__PXMemoriesFeedViewControllerHelper__handleDataSourceChange__block_invoke;
  v16[3] = &unk_1E512AB50;
  v17 = v11;
  v18 = v6;
  v19 = v10;
  v12 = v10;
  v13 = v6;
  v14 = v11;
  objc_msgSend(v3, "performChanges:", v16);
  if (self->_hasAppeared)
  {
    -[PXMemoriesFeedViewControllerHelper dataSourceManager](self, "dataSourceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateCurrentMemoriesNonPendingAndNotificationStatus");

  }
}

- (void)_updateSelectedIndexPathsInLayout
{
  void *v3;
  id v4;
  id v5;

  -[PXMemoriesFeedViewControllerHelper currentLayout](self, "currentLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesFeedViewControllerHelper _updateSelectedIndexPathsInLayout:](self, "_updateSelectedIndexPathsInLayout:", v5);
  -[PXMemoriesFeedViewControllerHelper tilingController](self, "tilingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
    -[PXMemoriesFeedViewControllerHelper _updateSelectedIndexPathsInLayout:](self, "_updateSelectedIndexPathsInLayout:", v4);

}

- (void)_updateSelectedIndexPathsInLayout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PXMemoriesFeedViewControllerHelper selectionManager](self, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(v5, "selectedIndexPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelectedMemoryIndexPaths:", v8);

  }
}

- (void)_updateHighlightedIndexPathInLayout
{
  void *v3;
  id v4;
  id v5;

  -[PXMemoriesFeedViewControllerHelper currentLayout](self, "currentLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesFeedViewControllerHelper _updateHighlightedIndexPathInLayout:](self, "_updateHighlightedIndexPathInLayout:", v5);
  -[PXMemoriesFeedViewControllerHelper tilingController](self, "tilingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
    -[PXMemoriesFeedViewControllerHelper _updateHighlightedIndexPathInLayout:](self, "_updateHighlightedIndexPathInLayout:", v4);

}

- (void)_updateHighlightedIndexPathInLayout:(id)a3
{
  id v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = a3;
  if (v4)
  {
    v5 = *((_OWORD *)off_1E50B8778 + 1);
    v14 = *(_OWORD *)off_1E50B8778;
    v15 = v5;
    -[PXMemoriesFeedViewControllerHelper highlightedMemoryReference](self, "highlightedMemoryReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoriesFeedViewControllerHelper lastActionPresentationMemoryReference](self, "lastActionPresentationMemoryReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 0;
    else
      v8 = v6;
    v9 = v8;

    if (v9)
    {
      objc_msgSend(v4, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "indexPathForObjectReference:", v9);
      }
      else
      {
        v12 = 0u;
        v13 = 0u;
      }
      v14 = v12;
      v15 = v13;

    }
    v12 = v14;
    v13 = v15;
    objc_msgSend(v4, "setHighlightedMemoryIndexPath:", &v12);

  }
}

- (void)_handleTraitCollectionChange:(unint64_t)a3
{
  if ((a3 & 0x110) != 0)
    -[PXMemoriesFeedViewControllerHelper _invalidateLayoutEngine](self, "_invalidateLayoutEngine");
}

- (void)_handleNewLayoutSnapshot:(id)a3
{
  id v4;
  void *v5;
  PXMemoriesFeedTilingLayout *v6;
  NSObject *v7;
  void *v8;
  int v9;
  PXMemoriesFeedViewControllerHelper *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  PXMemoriesFeedTilingLayout *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXMemoriesFeedViewControllerHelper saveAnchorMemory](self, "saveAnchorMemory");
  -[PXMemoriesFeedViewControllerHelper _spec](self, "_spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXMemoriesFeedTilingLayout initWithSpec:layoutSnapshot:]([PXMemoriesFeedTilingLayout alloc], "initWithSpec:layoutSnapshot:", v5, v4);
  -[PXMemoriesFeedViewControllerHelper _configureLayout:](self, "_configureLayout:", v6);
  -[PXMemoriesFeedViewControllerHelper _updateHighlightedIndexPathInLayout:](self, "_updateHighlightedIndexPathInLayout:", v6);
  PLMemoriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412802;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "%@ layout engine did emit new snapshot:\r%@\r\rTransitioning to new layout %@", (uint8_t *)&v9, 0x20u);
  }

  -[PXMemoriesFeedViewControllerHelper tilingController](self, "tilingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transitionToLayout:", v6);
  -[PXMemoriesFeedViewControllerHelper didChangeTilingControllerLayout](self, "didChangeTilingControllerLayout");

}

- (void)_configureLayout:(id)a3
{
  objc_msgSend(a3, "setDelegate:", self);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a3;
  if ((void *)PXDataSourceManagerObservationContext_128624 == a5)
  {
    v11 = v8;
    -[PXMemoriesFeedViewControllerHelper _handleDataSourceChange](self, "_handleDataSourceChange");
    goto LABEL_9;
  }
  if ((void *)PXExtendedTraitCollectionObservationContext_128625 == a5)
  {
    v11 = v8;
    -[PXMemoriesFeedViewControllerHelper _handleTraitCollectionChange:](self, "_handleTraitCollectionChange:", a4);
    goto LABEL_9;
  }
  if ((void *)PXSpecManagerObservationContext_128626 == a5)
  {
    v11 = v8;
    -[PXMemoriesFeedViewControllerHelper specManager](self, "specManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "spec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXMemoriesFeedViewControllerHelper _setSpec:](self, "_setSpec:", v10);
    goto LABEL_9;
  }
  if ((void *)PXSelectionManagerObservationContext_128627 == a5)
  {
    v11 = v8;
    -[PXMemoriesFeedViewControllerHelper _updateSelectedIndexPathsInLayout](self, "_updateSelectedIndexPathsInLayout");
LABEL_9:
    v8 = v11;
  }

}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (void)layoutEngineDidUpdateLayoutSnapshot:(id)a3
{
  PXSectionedLayoutEngine *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXSectionedLayoutEngine *v10;

  v5 = (PXSectionedLayoutEngine *)a3;
  v10 = v5;
  if (self->__layoutEngine != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 827, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutEngine == __layoutEngine"));

    v5 = v10;
  }
  -[PXLayoutEngine layoutSnapshot](v5, "layoutSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesFeedViewControllerHelper currentLayout](self, "currentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
    -[PXMemoriesFeedViewControllerHelper _handleNewLayoutSnapshot:](self, "_handleNewLayoutSnapshot:", v6);

}

- (void)layoutEngine:(id)a3 willGenerateLayoutWithGenerator:(id)a4 forSection:(unint64_t)a5
{
  PXSectionedLayoutEngine *v9;
  id v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;

  v9 = (PXSectionedLayoutEngine *)a3;
  v10 = a4;
  if (self->__layoutEngine != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 837, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutEngine == __layoutEngine"));

  }
  v11 = v10;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 838, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("generator"), v17, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedViewControllerHelper.m"), 838, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("generator"), v17);
  }

LABEL_5:
  if (-[PXMemoriesSpec feedShouldAllowHeaders](self->__spec, "feedShouldAllowHeaders"))
  {
    -[PXLayoutEngine dataSourceSnapshot](v9, "dataSourceSnapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    if (a5)
    {
      if (v12)
        objc_msgSend(v12, "indexPathForFirstPastMemorySection");
      v13 = a5 == 0;
    }
    else
    {
      v13 = 1;
      objc_msgSend(v11, "setIsFirstHeader:", 1);
    }

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v11, "setIncludeDateHeader:", v13);

}

- (void)scrollFilterShouldRequestAdditionalContent:(id)a3
{
  void *v4;
  id v5;

  -[PXMemoriesFeedViewControllerHelper dataSourceManager](self, "dataSourceManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "generateAdditionalEntriesIfPossible");
  -[PXMemoriesFeedViewControllerHelper dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadMoreContentWithCompletionHandler:", 0);

}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  PXTileIdentifierIdentityConverter *v15;
  void *v16;
  void *v17;

  v5 = a4;
  objc_msgSend(v5, "fromLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "toLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (v7 == v10)
  {

    goto LABEL_6;
  }
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
  {
LABEL_6:
    v15 = objc_alloc_init(PXTileIdentifierIdentityConverter);
    v14 = 0;
    goto LABEL_7;
  }
  -[PXMemoriesFeedViewControllerHelper dataSourceManager](self, "dataSourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "changeHistory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v7, "identifier"), objc_msgSend(v10, "identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[PXSectionedTileIdentifierConverter initWithFromDataSource:toDataSource:changeDetails:]([PXMemoriesFeedTileIdentifierConverter alloc], "initWithFromDataSource:toDataSource:changeDetails:", v7, v10, v14);
  if (self->_delegateRespondsTo.reloadedTileKindsOnObjectChanged)
  {
    -[PXMemoriesFeedViewControllerHelper delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "memoriesFeedViewControllerHelperReloadedTileKindsOnObjectChanged:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXTileIdentifierIdentityConverter setReloadedTileKindsOnObjectChanged:](v15, "setReloadedTileKindsOnObjectChanged:", v17);
  }
LABEL_7:

  return v15;
}

- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (self->_delegateRespondsTo.feedIsVisible
    && (-[PXMemoriesFeedViewControllerHelper delegate](self, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "memoriesFeedViewControllerHelperFeedIsVisible:", self),
        v8,
        !v9))
  {
    v10 = 0;
  }
  else
  {
    -[PXMemoriesFeedViewControllerHelper _transitionAnimationCoordinator](self, "_transitionAnimationCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[4];
  uint64_t v42;
  uint8_t buf[32];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  CGPoint v55;
  CGPoint result;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "contentBounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "contentInset");
  v11 = v9 - v10;
  -[PXMemoriesFeedViewControllerHelper scrollViewController](self, "scrollViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visibleOrigin");

  v13 = PXPointApproximatelyEqualToPoint();
  -[PXMemoriesFeedViewControllerHelper anchorMemoryReference](self, "anchorMemoryReference");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if ((v13 & 1) == 0 && v14)
  {
    -[PXMemoriesFeedViewControllerHelper anchorMemoryOrigin](self, "anchorMemoryOrigin");
    v17 = v16;
    v19 = v18;
    PLMemoriesGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v55.x = v17;
      v55.y = v19;
      NSStringFromCGPoint(v55);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "Restoring layout origin for anchor memory:\r%@\rwith offset:\r%@", buf, 0x16u);

    }
    objc_msgSend(v5, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoriesFeedViewControllerHelper dataSourceManager](self, "dataSourceManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "changeHistory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "indexPath");
    objc_msgSend(v24, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v42, objc_msgSend(v22, "identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v41[2], 0, 32);
    objc_msgSend(v15, "indexPath");
    objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v25, v41, 0, 0);
    v26 = *(_QWORD *)&v41[2];
    v27 = *(_QWORD *)off_1E50B7E98;
    if (*(_QWORD *)&v41[2] == *(_QWORD *)off_1E50B7E98)
    {
      if (v22)
        objc_msgSend(v22, "indexPathForObjectReference:", v15);
      else
        memset(buf, 0, sizeof(buf));
      v41[2] = *(_OWORD *)buf;
      v41[3] = *(_OWORD *)&buf[16];
      v26 = *(_QWORD *)buf;
    }
    if (v26 != v27)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      memset(buf, 0, sizeof(buf));
      v34 = xmmword_1A7C0C450;
      v35 = v26;
      v36 = *(_OWORD *)((char *)&v41[2] + 8);
      v37 = *((_QWORD *)&v41[3] + 1);
      v38 = 0u;
      v39 = 0u;
      v40 = 0;
      if (objc_msgSend(v5, "getGeometry:group:userData:forTileWithIdentifier:", buf, 0, 0, &v34))
      {
        PXPointSubtract();
        v7 = v28;
        v30 = v29;
        objc_msgSend(v5, "contentInset");
        v11 = v30 - v31;
      }
    }

  }
  v32 = v7;
  v33 = v11;
  result.y = v33;
  result.x = v32;
  return result;
}

- (CGRect)memoriesFeedTilingLayout:(id)a3 contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a4 forAspectRatio:(double)a5
{
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _OWORD v24[2];
  CGRect result;

  objc_msgSend(a3, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a4->item;
  v24[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v24[1] = v8;
  objc_msgSend(v7, "objectAtIndexPath:", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (memoriesFeedTilingLayout_contentsRectForItemAtIndexPath_forAspectRatio__onceToken != -1)
    dispatch_once(&memoriesFeedTilingLayout_contentsRectForItemAtIndexPath_forAspectRatio__onceToken, &__block_literal_global_198_128600);
  v11 = *(double *)off_1E50B86D0;
  v12 = *((double *)off_1E50B86D0 + 1);
  v13 = *((double *)off_1E50B86D0 + 2);
  v14 = *((double *)off_1E50B86D0 + 3);
  if (v10 && memoriesFeedTilingLayout_contentsRectForItemAtIndexPath_forAspectRatio__PHAssetRespondsToBestCropRect)
  {
    objc_msgSend(v9, "assetCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 1, objc_msgSend(v15, "px_shouldUseFacesRectForSmartCropping"), a5);
    v11 = v16;
    v12 = v17;
    v13 = v18;
    v14 = v19;

  }
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)memoriesFeedTilingLayout:(id)a3 titleFontNameForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v11[2];

  objc_msgSend(a3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->item;
  v11[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v11[1] = v6;
  objc_msgSend(v5, "objectAtIndexPath:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleFontName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setScrollTargetMemoryUUID:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_scrollTargetMemoryUUID, a3);
  v5 = v6;
  if (v6)
  {
    -[PXMemoriesFeedViewControllerHelper _scrollToTargetMemoryUUIDWhenReady:](self, "_scrollToTargetMemoryUUIDWhenReady:", v6);
    v5 = v6;
  }

}

- (void)_scrollToTargetMemoryUUIDWhenReady:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *scrollTargetMemoryUUID;
  id v9;

  v4 = a3;
  -[PXMemoriesFeedViewControllerHelper tilingController](self, "tilingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLayout");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionedObjectReferenceForMemoryUUID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXMemoriesFeedViewControllerHelper scrollMemoryReferenceToVisible:animated:](self, "scrollMemoryReferenceToVisible:animated:", v7, 1);
    scrollTargetMemoryUUID = self->_scrollTargetMemoryUUID;
    self->_scrollTargetMemoryUUID = 0;

  }
}

- (PXTilingController)tilingController
{
  return self->_tilingController;
}

- (PXMemoriesFeedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXMemoriesSpecManager)specManager
{
  return self->_specManager;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (PXMemoriesFeedViewControllerHelperDelegate)delegate
{
  return (PXMemoriesFeedViewControllerHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXSectionedObjectReference)highlightedMemoryReference
{
  return self->_highlightedMemoryReference;
}

- (PXSectionedObjectReference)activatedMemoryReference
{
  return self->_activatedMemoryReference;
}

- (PXSectionedObjectReference)lastActionPresentationMemoryReference
{
  return self->_lastActionPresentationMemoryReference;
}

- (NSString)scrollTargetMemoryUUID
{
  return self->_scrollTargetMemoryUUID;
}

- (PXViewControllerEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (NSDate)_lastUserMemoryGenerationRequestDate
{
  return self->__lastUserMemoryGenerationRequestDate;
}

- (void)_setLastUserMemoryGenerationRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->__lastUserMemoryGenerationRequestDate, a3);
}

- (PXSectionedObjectReference)_memoryReferenceToScrollToVisible
{
  return self->__memoryReferenceToScrollToVisible;
}

- (void)_setMemoryReferenceToScrollToVisible:(id)a3
{
  objc_storeStrong((id *)&self->__memoryReferenceToScrollToVisible, a3);
}

- (PXSectionedObjectReference)anchorMemoryReference
{
  return self->_anchorMemoryReference;
}

- (void)_setAnchorMemoryReference:(id)a3
{
  objc_storeStrong((id *)&self->_anchorMemoryReference, a3);
}

- (CGPoint)anchorMemoryOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorMemoryOrigin.x;
  y = self->_anchorMemoryOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setAnchorMemoryOrigin:(CGPoint)a3
{
  self->_anchorMemoryOrigin = a3;
}

- (PXSectionedLayoutEngine)_layoutEngine
{
  return self->__layoutEngine;
}

- (PXMemoriesFeedScrollFilter)_scrollFilter
{
  return self->__scrollFilter;
}

- (PXMemoriesSpec)_spec
{
  return self->__spec;
}

- (PXMemoriesFeedTransitionAnimationCoordinator)_transitionAnimationCoordinator
{
  return self->__transitionAnimationCoordinator;
}

- (int64_t)_refreshRetryCount
{
  return self->__refreshRetryCount;
}

- (void)_setRefreshRetryCount:(int64_t)a3
{
  self->__refreshRetryCount = a3;
}

- (BOOL)_isRequestingNewMemories
{
  return self->__requestingNewMemories;
}

- (void)_setRequestingNewMemories:(BOOL)a3
{
  self->__requestingNewMemories = a3;
}

- (id)_newMemoriesRequestCompletion
{
  return self->__newMemoriesRequestCompletion;
}

- (void)_setNewMemoriesRequestCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__newMemoriesRequestCompletion, 0);
  objc_storeStrong((id *)&self->__transitionAnimationCoordinator, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->__scrollFilter, 0);
  objc_storeStrong((id *)&self->__layoutEngine, 0);
  objc_storeStrong((id *)&self->_anchorMemoryReference, 0);
  objc_storeStrong((id *)&self->__memoryReferenceToScrollToVisible, 0);
  objc_storeStrong((id *)&self->__lastUserMemoryGenerationRequestDate, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_scrollTargetMemoryUUID, 0);
  objc_storeStrong((id *)&self->_lastActionPresentationMemoryReference, 0);
  objc_storeStrong((id *)&self->_activatedMemoryReference, 0);
  objc_storeStrong((id *)&self->_highlightedMemoryReference, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_storeStrong(&self->_refreshResetNotification, 0);
}

uint64_t __109__PXMemoriesFeedViewControllerHelper_memoriesFeedTilingLayout_contentsRectForItemAtIndexPath_forAspectRatio___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CD1390], "instancesRespondToSelector:", sel_bestCropRectForAspectRatio_verticalContentMode_cropMode_);
  memoriesFeedTilingLayout_contentsRectForItemAtIndexPath_forAspectRatio__PHAssetRespondsToBestCropRect = result;
  return result;
}

void __61__PXMemoriesFeedViewControllerHelper__handleDataSourceChange__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setSeedItem:", v3);
  objc_msgSend(v4, "setDataSourceSnapshot:withChangeDetails:", a1[5], a1[6]);

}

void __54__PXMemoriesFeedViewControllerHelper_saveAnchorMemory__block_invoke(_QWORD *a1, uint64_t a2, __int128 *a3, uint64_t a4, void *a5)
{
  id v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;

  v8 = a5;
  if ((*(_QWORD *)(a2 + 8) | 2) == 3)
  {
    v26 = v8;
    PXDistanceBetweenPoints();
    v8 = v26;
    v10 = *(_QWORD *)(a1[4] + 8);
    if (v9 < *(double *)(v10 + 24))
    {
      *(double *)(v10 + 24) = v9;
      v11 = *(_QWORD *)(a1[5] + 8);
      v13 = *(_OWORD *)(a2 + 48);
      v12 = *(_OWORD *)(a2 + 64);
      v14 = *(_OWORD *)(a2 + 32);
      *(_QWORD *)(v11 + 112) = *(_QWORD *)(a2 + 80);
      *(_OWORD *)(v11 + 80) = v13;
      *(_OWORD *)(v11 + 96) = v12;
      *(_OWORD *)(v11 + 64) = v14;
      v15 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)(v11 + 32) = *(_OWORD *)a2;
      *(_OWORD *)(v11 + 48) = v15;
      v16 = *(_OWORD **)(a1[6] + 8);
      v17 = a3[7];
      v19 = a3[4];
      v18 = a3[5];
      v16[8] = a3[6];
      v16[9] = v17;
      v16[6] = v19;
      v16[7] = v18;
      v20 = a3[11];
      v22 = a3[8];
      v21 = a3[9];
      v16[12] = a3[10];
      v16[13] = v20;
      v16[10] = v22;
      v16[11] = v21;
      v23 = *a3;
      v24 = a3[1];
      v25 = a3[3];
      v16[4] = a3[2];
      v16[5] = v25;
      v16[2] = v23;
      v16[3] = v24;
    }
  }

}

void __65__PXMemoriesFeedViewControllerHelper__updateLayoutEngineIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CB36B0];
  v4 = a2;
  objc_msgSend(v2, "indexPathForItem:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeedItem:", v3);

  objc_msgSend(v4, "setSeedSize:", 1000000.0, 1000000.0);
}

uint64_t __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD v10[4];

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2);
  if (result >= 1)
  {
    v8 = result;
    for (i = 0; i != v8; ++i)
    {
      v10[0] = *(_QWORD *)(a1 + 56);
      v10[1] = a2;
      v10[2] = i;
      v10[3] = 0x7FFFFFFFFFFFFFFFLL;
      result = (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, v7);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a3 = 1;
    }
  }
  return result;
}

void __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "itemChangesInSection:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasIncrementalChanges"))
  {
    objc_msgSend(v9, "insertedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke_3;
  v10[3] = &unk_1E512AAC0;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = a2;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a3 = 1;

}

uint64_t __103__PXMemoriesFeedViewControllerHelper__enumerateInsertedItemsInChangeDetails_withDataSource_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  uint64_t result;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_OWORD *)(a1 + 48);
  v8 = a2;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  result = (*(uint64_t (**)(_QWORD, __int128 *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), &v7, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, a4);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

uint64_t __101__PXMemoriesFeedViewControllerHelper__memoryReferenceInsertedOnChangeToDataSource_withChangeDetails___block_invoke(uint64_t result, _OWORD *a2, _BYTE *a3)
{
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  __int128 v6;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v5 = *(_QWORD *)(v3 + 32);
  v4 = (_OWORD *)(v3 + 32);
  if (v5 == *(_QWORD *)off_1E50B7E98)
  {
    v6 = a2[1];
    *v4 = *a2;
    v4[1] = v6;
  }
  else
  {
    *a3 = 1;
  }
  return result;
}

void __97__PXMemoriesFeedViewControllerHelper__handleRefreshCompletionWithResultInformation_reason_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startRefreshForReason:", *(_QWORD *)(a1 + 40));

}

void __61__PXMemoriesFeedViewControllerHelper__startRefreshForReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  id v5;

  if (*(_BYTE *)(a1 + 48))
    v2 = 0;
  else
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v2;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.test"), 42, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRefreshCompletionWithResultInformation:reason:error:", v5, *(_QWORD *)(a1 + 40), v3);

}

@end
