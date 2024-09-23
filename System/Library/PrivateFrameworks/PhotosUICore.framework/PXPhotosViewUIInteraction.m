@implementation PXPhotosViewUIInteraction

- (void)viewDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosViewUIInteraction;
  -[PXGInteraction viewDidChange](&v3, sel_viewDidChange);
  -[PXPhotosViewUIInteraction _tearDownGestures](self, "_tearDownGestures");
  -[PXPhotosViewUIInteraction _setupGestures](self, "_setupGestures");
}

- (void)scrollViewControllerDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosViewUIInteraction;
  -[PXGInteraction scrollViewControllerDidChange](&v4, sel_scrollViewControllerDidChange);
  -[PXGInteraction scrollViewController](self, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", self);

}

- (UIScrollView)scrollView
{
  void *v2;
  void *v3;

  -[PXGInteraction scrollViewController](self, "scrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v3;
}

- (void)setOneUpPresentation:(id)a3
{
  PXOneUpPresentation *v5;

  v5 = (PXOneUpPresentation *)a3;
  if (self->_oneUpPresentation != v5)
  {
    objc_storeStrong((id *)&self->_oneUpPresentation, a3);
    -[PXOneUpPresentation setDelegate:](v5, "setDelegate:", self);
    -[PXPhotosViewUIInteraction setContextMenuInteraction:](self, "setContextMenuInteraction:", 0);
    -[PXPhotosViewUIInteraction _updateContextMenuInteraction](self, "_updateContextMenuInteraction");
  }

}

- (UIViewController)presentingViewController
{
  void *v3;
  void *v4;

  -[PXPhotosViewInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForPhotosInteraction:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v4;
}

- (NSUndoManager)undoManager
{
  void *v3;
  void *v4;

  -[PXPhotosViewInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManagerForPhotosInteraction:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUndoManager *)v4;
}

- (void)setNavigatedAssetReference:(id)a3
{
  PXAssetReference *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PXAssetReference *v16;

  v16 = (PXAssetReference *)a3;
  v6 = self->_navigatedAssetReference;
  v7 = v16;
  if (v6 == v16)
  {
LABEL_8:

    goto LABEL_9;
  }
  v8 = -[PXAssetReference isEqual:](v16, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_navigatedAssetReference, a3);
    -[PXPhotosViewUIInteraction uiInteractionDelegate](self, "uiInteractionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uiInteraction:didChangeNavigatedAssetReference:", self, v16);

    if (v16)
    {
      -[PXPhotosViewInteraction viewModel](self, "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "showsOnlyAssetsInSelectedItemSectionInOneUp");

      if (v11)
      {
        -[PXPhotosViewInteraction viewModel](self, "viewModel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataSourceManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosViewInteraction viewModel](self, "viewModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "createDataSourceManagerForAssetsInSectionOfAsset:usingNewTransientAssetCollection:", v16, objc_msgSend(v14, "gridStyle") == 6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewUIInteraction.m"), 137, CFSTR("Unable to create a data source manager for the selected asset section."));

        }
        -[PXPhotosViewUIInteraction setNavigatedAssetSectionDataSourceManager:](self, "setNavigatedAssetSectionDataSourceManager:", v7);
        goto LABEL_8;
      }
    }
  }
LABEL_9:

}

- (void)setNavigatedAssetSectionDataSourceManager:(id)a3
{
  PXAssetsDataSourceManager *v4;
  PXAssetsDataSourceManager *navigatedAssetSectionDataSourceManager;
  PXAssetsDataSourceManager *v6;

  v4 = (PXAssetsDataSourceManager *)a3;
  -[PXAssetsDataSourceManager unregisterChangeObserver:context:](self->_navigatedAssetSectionDataSourceManager, "unregisterChangeObserver:context:", self, NavigatedSectionDataSourceObservationContext);
  navigatedAssetSectionDataSourceManager = self->_navigatedAssetSectionDataSourceManager;
  self->_navigatedAssetSectionDataSourceManager = v4;
  v6 = v4;

  -[PXAssetsDataSourceManager registerChangeObserver:context:](self->_navigatedAssetSectionDataSourceManager, "registerChangeObserver:context:", self, NavigatedSectionDataSourceObservationContext);
}

- (void)_setupGestures
{
  void *v3;
  void *v4;
  void *v5;
  UIHoverGestureRecognizer *v6;
  UIHoverGestureRecognizer *hoverGesture;
  UIHoverGestureRecognizer *v8;
  void *v9;
  UITapGestureRecognizer *v10;
  UITapGestureRecognizer *doubleTapGesture;
  UITapGestureRecognizer *v12;
  void *v13;
  void *v14;
  PXSwipeSelectionManager *v15;
  void *v16;
  void *v17;
  void *v18;
  PXSwipeSelectionManager *v19;
  PXSwipeSelectionManager *swipeSelectionManager;
  PXPhotosDragController *v21;
  void *v22;
  void *v23;
  PXPhotosDragController *v24;
  PXPhotosDragController *dragController;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  -[PXGInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    -[PXGInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_handleLongPress_);
    objc_msgSend(v5, "setDelegate:", self);
    objc_storeStrong((id *)&self->_longPressGesture, v5);
    objc_msgSend(v4, "addGestureRecognizer:", v5);
    if (objc_msgSend(v33, "allowsHoverBehavior"))
    {
      v6 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", self, sel__handleHover_);
      -[UIHoverGestureRecognizer setDelegate:](v6, "setDelegate:", self);
      hoverGesture = self->_hoverGesture;
      self->_hoverGesture = v6;
      v8 = v6;

      objc_msgSend(v4, "addGestureRecognizer:", v8);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
    objc_msgSend(v9, "setDelegate:", self);
    objc_msgSend(v9, "setCancelsTouchesInView:", 0);
    objc_storeStrong((id *)&self->_tapGesture, v9);
    objc_msgSend(v4, "addGestureRecognizer:", v9);
    if (objc_msgSend(v33, "allowsDoubleTapBehavior"))
    {
      v10 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDoubleTap_);
      -[UITapGestureRecognizer setNumberOfTapsRequired:](v10, "setNumberOfTapsRequired:", 2);
      -[UITapGestureRecognizer setDelegate:](v10, "setDelegate:", self);
      objc_msgSend(v9, "setCancelsTouchesInView:", 0);
      doubleTapGesture = self->_doubleTapGesture;
      self->_doubleTapGesture = v10;
      v12 = v10;

      objc_msgSend(v4, "addGestureRecognizer:", v12);
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handlePress_);
    objc_msgSend(v13, "setAllowedPressTypes:", &unk_1E53EAA10);
    objc_msgSend(v13, "setDelegate:", self);
    objc_storeStrong((id *)&self->_pressGesture, v13);
    objc_msgSend(v4, "addGestureRecognizer:", v13);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel__handlePinch_);
    objc_msgSend(v14, "_setEndsOnSingleTouch:", 1);
    objc_msgSend(v14, "setDelegate:", self);
    objc_storeStrong((id *)&self->_pinchGesture, v14);
    objc_msgSend(v4, "addGestureRecognizer:", v14);
    if (objc_msgSend(v33, "allowsSwipeToSelect"))
    {
      v15 = [PXSwipeSelectionManager alloc];
      -[PXPhotosViewInteraction viewModel](self, "viewModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "selectionManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewUIInteraction scrollView](self, "scrollView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PXSwipeSelectionManager initWithSelectionManager:scrollView:](v15, "initWithSelectionManager:scrollView:", v17, v18);

      -[PXSwipeSelectionManager setDelegate:](v19, "setDelegate:", self);
      swipeSelectionManager = self->_swipeSelectionManager;
      self->_swipeSelectionManager = v19;

    }
    if ((objc_msgSend(v33, "allowsDragOut") & 1) != 0 || objc_msgSend(v33, "allowsDragIn"))
    {
      v21 = [PXPhotosDragController alloc];
      objc_msgSend(v33, "selectionManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "assetCollectionActionManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[PXPhotosDragController initWithContentView:selectionManager:assetCollectionActionManager:delegate:](v21, "initWithContentView:selectionManager:assetCollectionActionManager:delegate:", v4, v22, v23, self);
      dragController = self->_dragController;
      self->_dragController = v24;

      v26 = objc_msgSend(v33, "allowsDragIn");
      -[PXPhotosViewUIInteraction dragController](self, "dragController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setCanDragIn:", v26);

    }
    -[PXGInteraction view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewInteraction zoomablePhotosInteraction](self, "zoomablePhotosInteraction");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setView:", v28);

    -[PXPhotosViewUIInteraction oneUpPresentation](self, "oneUpPresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "px_oneUpPresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewUIInteraction setOneUpPresentation:](self, "setOneUpPresentation:", v32);

    }
    -[PXPhotosViewUIInteraction _updateContextMenuInteraction](self, "_updateContextMenuInteraction");

  }
}

- (void)_tearDownGestures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UITapGestureRecognizer *tapGesture;
  UILongPressGestureRecognizer *longPressGesture;
  UIPinchGestureRecognizer *pinchGesture;
  UILongPressGestureRecognizer *touchGesture;
  PXTouchingUIGestureRecognizer *touchingGesture;
  PXSwipeSelectionManager *swipeSelectionManager;
  PXPhotosDragController *dragController;

  -[UITapGestureRecognizer view](self->_tapGesture, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_tapGesture);

  -[UILongPressGestureRecognizer view](self->_longPressGesture, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", self->_longPressGesture);

  -[UIPinchGestureRecognizer view](self->_pinchGesture, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", self->_pinchGesture);

  -[UILongPressGestureRecognizer view](self->_touchGesture, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", self->_touchGesture);

  -[PXTouchingUIGestureRecognizer view](self->_touchingGesture, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", self->_touchingGesture);

  -[PXSwipeSelectionManager removeFromView](self->_swipeSelectionManager, "removeFromView");
  -[PXPhotosDragController removeFromView](self->_dragController, "removeFromView");
  -[PXPhotosViewInteraction zoomablePhotosInteraction](self, "zoomablePhotosInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setView:", 0);

  tapGesture = self->_tapGesture;
  self->_tapGesture = 0;

  longPressGesture = self->_longPressGesture;
  self->_longPressGesture = 0;

  pinchGesture = self->_pinchGesture;
  self->_pinchGesture = 0;

  touchGesture = self->_touchGesture;
  self->_touchGesture = 0;

  touchingGesture = self->_touchingGesture;
  self->_touchingGesture = 0;

  swipeSelectionManager = self->_swipeSelectionManager;
  self->_swipeSelectionManager = 0;

  dragController = self->_dragController;
  self->_dragController = 0;

  -[PXPhotosViewUIInteraction setContextMenuInteraction:](self, "setContextMenuInteraction:", 0);
}

- (void)_updateContextMenuInteraction
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  if (!self->_contextMenuInteraction)
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsContextMenuCustomization");

    if (v4)
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
    }
    else
    {
      -[PXPhotosViewUIInteraction oneUpPresentation](self, "oneUpPresentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextMenuInteraction");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[PXPhotosViewUIInteraction setContextMenuInteraction:](self, "setContextMenuInteraction:", v6);

  }
}

- (BOOL)_pickNavigatedAssetReference
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[PXPhotosViewUIInteraction navigatedAssetReference](self, "navigatedAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isInSelectMode"))
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __57__PXPhotosViewUIInteraction__pickNavigatedAssetReference__block_invoke;
      v9[3] = &unk_1E51437F8;
      v10 = v3;
      objc_msgSend(v4, "performChanges:", v9);

    }
    else
    {
      if (!objc_msgSend(v4, "viewDelegateRespondsTo:", 1))
      {
        v5 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v4, "viewDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "photosViewController:didPickAssetReference:", v7, v3);

    }
    v5 = 1;
LABEL_9:

    goto LABEL_10;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

- (BOOL)presentOneUpForAssetReference:(id)a3 configurationHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  char v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXPhotosViewUIInteraction oneUpPresentation](self, "oneUpPresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "canPresentOneUp");

  if (v13)
  {
    -[PXPhotosViewUIInteraction setNavigatedAssetReference:](self, "setNavigatedAssetReference:", v8);
    v14 = objc_msgSend(v11, "startWithConfigurationHandler:", v9);
    if ((v14 & 1) == 0)
      -[PXPhotosViewUIInteraction setNavigatedAssetReference:](self, "setNavigatedAssetReference:", 0);
    if (v10)
      objc_msgSend(v11, "waitForTransitionToFinishWithTimeout:completionHandler:", v10, 5.0);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)presentOneUpForAssetReference:(id)a3 configurationHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "viewDelegateRespondsTo:", 0x80000);

  if (v9)
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photosViewController:didPresentOneUp:forAsset:", v12, 1, v6);

  }
  v13 = -[PXPhotosViewUIInteraction presentOneUpForAssetReference:configurationHandler:completionHandler:](self, "presentOneUpForAssetReference:configurationHandler:completionHandler:", v6, v7, 0);

  return v13;
}

- (BOOL)canToggleSelectMode
{
  void *v2;
  char v3;

  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "canEnterSelectMode") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "canExitSelectMode");

  return v3;
}

- (void)toggleSelectMode
{
  id v3;

  if (-[PXPhotosViewUIInteraction canToggleSelectMode](self, "canToggleSelectMode"))
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performChanges:", &__block_literal_global_240384);

  }
}

- (BOOL)ensureSelectMode
{
  void *v2;
  char v3;

  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "canEnterSelectMode"))
    objc_msgSend(v2, "performChanges:", &__block_literal_global_166_240383);
  v3 = objc_msgSend(v2, "isInSelectMode");

  return v3;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridActionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canPerformActionType:", v4);

  return v7;
}

- (void)performActionWithType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridActionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionPerformerForActionType:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "performActionWithCompletionHandler:", 0);
}

- (id)discoverabilityTitleForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridActionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionPerformerForActionType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedTitleForUseCase:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)keyCommandsForSelectionExtension
{
  return -[PXSwipeSelectionManager keyCommandsForSelectionExtension](self->_swipeSelectionManager, "keyCommandsForSelectionExtension");
}

- (id)targetForKeyCommands
{
  return -[PXSwipeSelectionManager targetForKeyCommands](self->_swipeSelectionManager, "targetForKeyCommands");
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  return -[PXPhotosViewUIInteraction regionOfInterestForAssetReference:image:](self, "regionOfInterestForAssetReference:image:", a3, 0);
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(id *)a4
{
  uint64_t *v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  if (a4)
    v5 = &v8;
  else
    v5 = 0;
  -[PXPhotosViewUIInteraction regionOfInterestForAssetReference:image:fallbackMediaProvider:shouldSnapshot:](self, "regionOfInterestForAssetReference:image:fallbackMediaProvider:shouldSnapshot:", a3, v5, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4 fallbackMediaProvider:(id)a5 shouldSnapshot:(BOOL)a6
{
  CGImage **v7;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  objc_super v31;
  CGImage *v32;

  v7 = a4;
  v32 = 0;
  if (!a6)
    a4 = &v32;
  v31.receiver = self;
  v31.super_class = (Class)PXPhotosViewUIInteraction;
  -[PXPhotosViewInteraction regionOfInterestForAssetReference:image:fallbackMediaProvider:shouldSnapshot:](&v31, sel_regionOfInterestForAssetReference_image_fallbackMediaProvider_shouldSnapshot_, a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && !a6)
    *v7 = v32;
  -[PXGInteraction view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rectInCoordinateSpace:", v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (a6)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __106__PXPhotosViewUIInteraction_regionOfInterestForAssetReference_image_fallbackMediaProvider_shouldSnapshot___block_invoke;
  v23[3] = &unk_1E513C0A0;
  v30 = a6;
  v26 = v12;
  v27 = v14;
  v28 = v16;
  v29 = v18;
  v24 = v10;
  v25 = v19;
  v20 = v19;
  v21 = v10;
  objc_msgSend(v9, "setPlaceholderViewFactory:", v23);

  return v9;
}

- (void)setHiddenAssetReferences:(id)a3
{
  NSSet *v4;
  void *v5;
  char v6;
  NSSet *v7;
  NSSet *hiddenAssetReferences;
  void *v9;
  NSSet *v10;

  v10 = (NSSet *)a3;
  v4 = self->_hiddenAssetReferences;
  v5 = v10;
  if (v4 == v10)
    goto LABEL_4;
  v6 = -[NSSet isEqual:](v10, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSSet *)-[NSSet copy](v10, "copy");
    hiddenAssetReferences = self->_hiddenAssetReferences;
    self->_hiddenAssetReferences = v7;

    -[PXGInteraction layout](self, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hideSpritesForObjectReferences:", v10);

LABEL_4:
  }

}

- (void)ensureSwipeDismissalInteraction
{
  UIScreenEdgePanGestureRecognizer *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  UIScreenEdgePanGestureRecognizer *edgeSwipeGesture;
  UIScreenEdgePanGestureRecognizer *v9;
  PXPhotosGridEdgeSwipeInteractiveDismissalTransition *v10;
  UIViewControllerInteractiveTransitioning *v11;
  UIViewControllerInteractiveTransitioning *edgeSwipeDismissalInteraction;
  id v13;

  if (!self->_edgeSwipeGesture)
  {
    v3 = (UIScreenEdgePanGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3C00]);
    -[PXGInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");

    if (v5 == 1)
      v6 = 8;
    else
      v6 = 2;
    -[UIScreenEdgePanGestureRecognizer setEdges:](v3, "setEdges:", v6);
    -[PXGInteraction view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addGestureRecognizer:", v3);

    edgeSwipeGesture = self->_edgeSwipeGesture;
    self->_edgeSwipeGesture = v3;
    v9 = v3;

    v10 = [PXPhotosGridEdgeSwipeInteractiveDismissalTransition alloc];
    -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v11 = -[PXPhotosGridEdgeSwipeInteractiveDismissalTransition initWithEdgeSwipeGesture:viewController:](v10, "initWithEdgeSwipeGesture:viewController:", v9, v13);
    edgeSwipeDismissalInteraction = self->_edgeSwipeDismissalInteraction;
    self->_edgeSwipeDismissalInteraction = v11;

  }
}

- (id)_createSelectionManagerForNavigatedAssetSection
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)off_1E50B4A40);
  -[PXPhotosViewUIInteraction navigatedAssetSectionDataSourceManager](self, "navigatedAssetSectionDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDataSourceManager:", v4);

  objc_msgSend(v5, "performChanges:", &__block_literal_global_175_240376);
  return v5;
}

- (id)_createActionManagerForNavigatedAssetReferenceUsingSectionDataSource:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint8_t v15[16];

  v3 = a3;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewUIInteraction navigatedAssetReference](self, "navigatedAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "assetActionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PXPhotosViewUIInteraction _createSelectionManagerForNavigatedAssetSection](self, "_createSelectionManagerForNavigatedAssetSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSelectionManager:", v8);
    }
    else
    {
      v12 = objc_alloc((Class)objc_opt_class());
      objc_msgSend(v5, "dataSourceManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "initWithSelectedObjectReference:dataSourceManager:", v6, v8);
    }
    v11 = (void *)v9;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v11, "setSupportsAirPlay:", 1);
    objc_msgSend(v11, "setPerformerDelegate:", self);
    objc_msgSend(v7, "allowedActionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowedActionTypes:", v13);

    objc_msgSend(v11, "setAdditionalPropertiesFromActionManager:", v7);
  }
  else
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Unable to retrieve asset reference for one up presentation action manager", v15, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (id)_createContextMenuActionManagerForNavigatedPreviewAssetReference
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint8_t buf[16];

  -[PXPhotosViewUIInteraction navigatedAssetReference](self, "navigatedAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetActionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v4, "selectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithSelectionManager:", v7);

    objc_msgSend(v8, "setPerformerDelegate:", self);
    v9 = objc_msgSend(v4, "allowsMultiSelectMenu");
    objc_msgSend(v8, "selectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "selectedIndexPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPath");
    v13 = objc_msgSend(v12, "containsIndexPath:", &v19);

    if (!v13 || (v9 & 1) == 0)
      objc_msgSend(v8, "setObjectReference:", v3);
    objc_msgSend(v4, "assetActionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAdditionalPropertiesFromActionManager:", v14);

  }
  else
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Unable to retrieve asset reference for one up presentation action manager", buf, 2u);
    }

    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  objc_msgSend(v4, "assetActionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allowedActionTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowedActionTypes:", v17);

  return v8;
}

- (id)_createContextMenuActionManagerForSelection
{
  void *v3;
  void *v4;
  PXAssetActionManager *v5;

  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PXAssetActionManager initWithSelectionManager:]([PXAssetActionManager alloc], "initWithSelectionManager:", v4);
  -[PXActionManager setPerformerDelegate:](v5, "setPerformerDelegate:", self);

  return v5;
}

- (void)setContextMenuInteraction:(id)a3
{
  UIContextMenuInteraction *v5;
  UIContextMenuInteraction **p_contextMenuInteraction;
  UIContextMenuInteraction *contextMenuInteraction;
  void *v8;
  void *v9;
  UIContextMenuInteraction *v10;

  v5 = (UIContextMenuInteraction *)a3;
  p_contextMenuInteraction = &self->_contextMenuInteraction;
  contextMenuInteraction = self->_contextMenuInteraction;
  if (contextMenuInteraction != v5)
  {
    v10 = v5;
    if (!v5 && contextMenuInteraction)
    {
      -[UIContextMenuInteraction view](contextMenuInteraction, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeInteraction:", *p_contextMenuInteraction);

    }
    objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
    v5 = v10;
    if (*p_contextMenuInteraction)
    {
      -[PXGInteraction view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addInteraction:", *p_contextMenuInteraction);

      v5 = v10;
    }
  }

}

- (void)_handleHover:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v4 = a3;
  -[PXGInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[PXGInteraction view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hitTestResultsAtPoint:", v7, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosViewUIInteraction _handleHoverWithHitTestResults:hoverGesture:](self, "_handleHoverWithHitTestResults:hoverGesture:", v11, v4);
}

- (void)_handleHoverWithHitTestResults:(id)a3 hoverGesture:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "state") != 1 && objc_msgSend(v7, "state") != 2)
    goto LABEL_12;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v9)
  {
LABEL_11:

LABEL_12:
    -[PXPhotosViewInteraction viewModel](self, "viewModel", (_QWORD)v14);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performChanges:", &__block_literal_global_178_240370);

    goto LABEL_13;
  }
  v10 = v9;
  v11 = *(_QWORD *)v15;
LABEL_5:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v11)
      objc_enumerationMutation(v8);
    if (-[PXPhotosViewUIInteraction _handleHoverWithHitTestResult:](self, "_handleHoverWithHitTestResult:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14))
    {
      break;
    }
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
LABEL_13:

}

- (BOOL)_handleHoverWithHitTestResult:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;
  id location;
  __int128 v19;
  __int128 v20;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("PXPhotosLayoutHitTestIdentifierAsset");
  if (v5 == CFSTR("PXPhotosLayoutHitTestIdentifierAsset"))
  {

  }
  else
  {
    v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("PXPhotosLayoutHitTestIdentifierAsset"));

    if (!v7)
    {
      v8 = 0;
      goto LABEL_9;
    }
  }
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v9, "currentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "indexPathForAssetReference:", v10);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
  }

  objc_initWeak(&location, self);
  objc_msgSend(v9, "selectionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__PXPhotosViewUIInteraction__handleHoverWithHitTestResult___block_invoke;
  v15[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
  v16 = v19;
  v17 = v20;
  objc_msgSend(v13, "performChanges:", v15);

  objc_destroyWeak(&location);
  v8 = 1;
LABEL_9:

  return v8;
}

- (void)_handleTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[PXGInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[PXGInteraction view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hitTestResultsAtPoint:", v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          if (-[PXPhotosViewUIInteraction _handleTapWithHitTestResult:keyModifierFlags:](self, "_handleTapWithHitTestResult:keyModifierFlags:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16), objc_msgSend(v4, "modifierFlags", (_QWORD)v23)))
          {
            v17 = 1;
            goto LABEL_12;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_12:

    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((v17 & 1) == 0
      && (objc_msgSend(v18, "handlePrimaryAction:", v4) & 1) == 0
      && objc_msgSend(v19, "allowsMacStyleSelection"))
    {
      objc_msgSend(v19, "selectionManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "performChanges:", &__block_literal_global_179);

    }
    if (objc_msgSend(v4, "state", (_QWORD)v23) == 3
      && objc_msgSend(v19, "viewDelegateRespondsTo:", 0x40000))
    {
      objc_msgSend(v19, "viewDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "photosViewController:didReceiveUserInteraction:", v22, 1);

    }
  }

}

- (BOOL)_handleTapWithHitTestResult:(id)a3 keyModifierFlags:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  char v15;
  __CFString *v16;
  __CFString *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t (**v36)(_QWORD, _QWORD, _QWORD);
  void *v37;
  char v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, void *);
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _OWORD v55[2];
  uint8_t buf[16];
  __int128 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 0x100000) != 0 && (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) != 0)
  {
    v8 = 0;
    v9 = 1;
  }
  else if ((a4 & 0x20000) != 0)
  {
    v8 = objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode");
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  objc_msgSend(v6, "identifier");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("PXPhotosLayoutHitTestIdentifierAsset");
  if (v10 == CFSTR("PXPhotosLayoutHitTestIdentifierAsset"))
  {

LABEL_16:
    objc_msgSend(v6, "userData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewInteraction zoomablePhotosInteraction](self, "zoomablePhotosInteraction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "handleTapOnAssetReference:", v26);

    if (v28)
    {
      -[PXGInteraction layout](self, "layout");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "clearLastVisibleAreaAnchoringInformation");
    }
    else
    {
      if (!v8 || !-[PXPhotosViewUIInteraction ensureSelectMode](self, "ensureSelectMode"))
      {
        if (objc_msgSend(v7, "isInSelectMode"))
        {
          if (objc_msgSend(v7, "allowsMacStyleSelection"))
          {
            if (v9)
            {
              v53[0] = MEMORY[0x1E0C809B0];
              v53[1] = 3221225472;
              v53[2] = __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke;
              v53[3] = &unk_1E51437F8;
              v54 = v26;
              objc_msgSend(v7, "performChanges:", v53);
              v33 = v54;
            }
            else
            {
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_2;
              v51[3] = &unk_1E51437F8;
              v52 = v26;
              objc_msgSend(v7, "performChanges:", v51);
              v33 = v52;
            }
          }
          else
          {
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_3;
            v49[3] = &unk_1E51437F8;
            v50 = v26;
            objc_msgSend(v7, "performChanges:", v49);
            v33 = v50;
          }
        }
        else
        {
          if (!v9
            || (objc_msgSend(v7, "allowsMacStyleSelection") & 1) != 0
            || !-[PXPhotosViewUIInteraction ensureSelectMode](self, "ensureSelectMode"))
          {
            if (!objc_msgSend(v7, "canPresentOneUp"))
            {
              objc_msgSend(v7, "customAssetSelectionHandler");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                objc_msgSend(v7, "customAssetSelectionHandler");
                v36 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "dataSourceManager");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = ((uint64_t (**)(_QWORD, void *, void *))v36)[2](v36, v26, v37);
              }
              else
              {
                if (!objc_msgSend(v7, "viewDelegateRespondsTo:", 1))
                {
                  v39 = 0;
                  goto LABEL_51;
                }
                objc_msgSend(v7, "viewDelegate");
                v36 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v36, "photosViewController:didPickAssetReference:", v37, v26);
              }
              v39 = v38;

LABEL_51:
              goto LABEL_52;
            }
            -[PXPhotosViewUIInteraction presentOneUpForAssetReference:configurationHandler:](self, "presentOneUpForAssetReference:configurationHandler:", v26, 0);
LABEL_50:
            v39 = 1;
            goto LABEL_51;
          }
          PLUIGetLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67110144;
            *(_DWORD *)&buf[4] = 1;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = objc_msgSend(v7, "allowsMacStyleSelection");
            *(_WORD *)&buf[14] = 1024;
            LODWORD(v57) = objc_msgSend(v7, "isInSelectMode");
            WORD2(v57) = 2048;
            *(_QWORD *)((char *)&v57 + 6) = a4;
            HIWORD(v57) = 1024;
            v58 = objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode");
            _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_DEFAULT, "[PXPhotosViewUIInteraction] Handling tap wants toggle selection: %i. Allows mac style selection: %i. Select mode enabled: %i. Key modifier flags: %lu. Connected to hardware keyboard: %i.", buf, 0x24u);
          }

          v44 = MEMORY[0x1E0C809B0];
          v45 = 3221225472;
          v46 = __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_181;
          v47 = &unk_1E51437F8;
          v48 = v26;
          objc_msgSend(v7, "performChanges:", &v44);
          v33 = v48;
        }

LABEL_49:
        -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController", v44, v45, v46, v47);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "px_splitViewController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "requestFocusUpdateWithPreferredFocusEnvironment:", v41);

        goto LABEL_50;
      }
      PLUIGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = 1;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = objc_msgSend(v7, "isInSelectMode");
        *(_WORD *)&buf[14] = 2048;
        *(_QWORD *)&v57 = a4;
        WORD4(v57) = 1024;
        *(_DWORD *)((char *)&v57 + 10) = objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode");
        _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEFAULT, "[PXPhotosViewUIInteraction] Handling tap wants range selection: %i. Select mode enabled: %i. Key modifier flags: %lu. Connected to hardware keyboard: %i.", buf, 0x1Eu);
      }

      *(_OWORD *)buf = 0u;
      v57 = 0u;
      objc_msgSend(v7, "currentDataSource");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        objc_msgSend(v31, "indexPathForAssetReference:", v26);
      }
      else
      {
        *(_OWORD *)buf = 0u;
        v57 = 0u;
      }

      objc_msgSend(v7, "selectionManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewInteraction contentController](self, "contentController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = *(_OWORD *)buf;
      v55[1] = v57;
      objc_msgSend(v29, "extendSelectionToItemIndexPath:withDelegate:", v55, v40);

    }
    goto LABEL_49;
  }
  v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("PXPhotosLayoutHitTestIdentifierAsset"));

  if (v12)
    goto LABEL_16;
  objc_msgSend(v6, "identifier");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("PXGHitTestResultGenericSingleView");
  if (v13 == CFSTR("PXGHitTestResultGenericSingleView"))
  {
    v24 = CFSTR("PXGHitTestResultGenericSingleView");
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("PXGHitTestResultGenericSingleView"));

  if ((v15 & 1) != 0)
    goto LABEL_43;
  objc_msgSend(v6, "identifier");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("PXPhotosLayoutHitTestIdentifierAccessoryCell");
  if (v16 == CFSTR("PXPhotosLayoutHitTestIdentifierAccessoryCell"))
  {
    v24 = CFSTR("PXPhotosLayoutHitTestIdentifierAccessoryCell");
    goto LABEL_41;
  }
  v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("PXPhotosLayoutHitTestIdentifierAccessoryCell"));

  if ((v18 & 1) == 0)
  {
    -[PXPhotosViewInteraction contentController](self, "contentController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "overlayController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "spriteReference");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectReference");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "canHandleObjectReference:", v22);

    if (!v23)
    {
      v39 = 0;
      goto LABEL_52;
    }
    -[PXPhotosViewInteraction contentController](self, "contentController");
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString overlayController](v24, "overlayController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleTapWithHitTestResult:", v6);

    goto LABEL_42;
  }
LABEL_43:
  v39 = 1;
LABEL_52:

  return v39;
}

- (void)_handleDoubleTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "viewDelegateRespondsTo:", 16))
    {
      -[PXGInteraction view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v6);
      v8 = v7;
      v10 = v9;

      -[PXGInteraction view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hitTestResultsAtPoint:", v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v27;
        v25 = v5;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v18, "identifier");
            v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            if (v19 == CFSTR("PXPhotosLayoutHitTestIdentifierAsset"))
            {

LABEL_14:
              objc_msgSend(v18, "userData");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = v25;
              objc_msgSend(v25, "viewDelegate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "photosViewController:didDoubleTapAssetReference:", v24, v22);

              goto LABEL_15;
            }
            v20 = v19;
            v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("PXPhotosLayoutHitTestIdentifierAsset"));

            if (v21)
              goto LABEL_14;
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          v5 = v25;
          if (v15)
            continue;
          break;
        }
      }
LABEL_15:

    }
  }

}

- (void)handleLongPress:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v20 = a3;
  if (objc_msgSend(v20, "state") == 1)
  {
    -[PXGInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "locationInView:", v4);
    v6 = v5;
    v8 = v7;
    -[PXPhotosViewInteraction assetReferenceAtLocation:withPadding:inCoordinateSpace:](self, "assetReferenceAtLocation:withPadding:inCoordinateSpace:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "canPerformAction:withSender:", sel_paste_, v20);

    if (v11)
    {
      -[PXPhotosViewInteraction viewModel](self, "viewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isInSelectMode");

      if ((v13 & 1) == 0)
      {
        objc_msgSend(v4, "becomeFirstResponder");
        v14 = *MEMORY[0x1E0C9D820];
        v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        if (v9)
        {
          -[PXPhotosViewUIInteraction regionOfInterestForAssetReference:](self, "regionOfInterestForAssetReference:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "rectInCoordinateSpace:", v4);
          PXRectGetCenter();
          v6 = v17;
          v8 = v18;

        }
        objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "showMenuFromView:rect:", v4, v6, v8, v14, v15);

      }
    }

  }
}

- (void)_handlePress:(id)a3
{
  void *v4;
  id v5;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "singleSelectedAssetReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_msgSend(v5, "isInSelectMode") & 1) == 0)
    {
      if (objc_msgSend(v5, "canPresentOneUp"))
        -[PXPhotosViewUIInteraction presentOneUpForAssetReference:configurationHandler:](self, "presentOneUpForAssetReference:configurationHandler:", v4, &__block_literal_global_186_240363);
    }

  }
}

- (void)_handlePinch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  int v11;
  void *v12;
  _BOOL4 v13;
  char v14;
  double v15;
  void *v16;
  id v17;

  v17 = a3;
  if (objc_msgSend(v17, "state") == 1)
  {
    -[PXPhotosViewUIInteraction scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_cancel");

  }
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGInteraction view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isInSelectMode") & 1) != 0 || !objc_msgSend(v6, "canPresentOneUp"))
  {
    v10 = 0;
    goto LABEL_8;
  }
  -[PXPhotosViewUIInteraction oneUpPresentation](self, "oneUpPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "handlePresentingPinchGestureRecognizer:", v17);

  v10 = 1;
  v11 = 1;
  if ((v9 & 1) == 0)
  {
LABEL_8:
    -[PXPhotosViewInteraction zoomablePhotosInteraction](self, "zoomablePhotosInteraction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "handlePinch:", v17);

  }
  v13 = objc_msgSend(v17, "state") != 1 && objc_msgSend(v17, "state") != 2;
  if (((v11 | v13) & 1) == 0)
  {
    objc_msgSend(v17, "velocity");
    v14 = v10 ^ 1;
    if (v15 <= 0.0)
      v14 = 1;
    if ((v14 & 1) == 0)
    {
      objc_msgSend(v17, "locationInView:", v7);
      -[PXPhotosViewInteraction assetReferenceAtLocation:withPadding:inCoordinateSpace:](self, "assetReferenceAtLocation:withPadding:inCoordinateSpace:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        -[PXPhotosViewUIInteraction presentOneUpForAssetReference:configurationHandler:](self, "presentOneUpForAssetReference:configurationHandler:", v16, &__block_literal_global_187_240362);

    }
  }

}

- (void)_handleTouch:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t i;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  PXPhotosViewUIInteraction *v35;
  uint64_t v36;
  BOOL v37;
  void *v38;
  id v39;
  id obj;
  void *v41;
  _QWORD v42[4];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 3) < 3)
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performChanges:", &__block_literal_global_188_240361);

    goto LABEL_24;
  }
  if (v5 != 1)
    goto LABEL_24;
  -[PXGInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v4;
  objc_msgSend(v4, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  -[PXGInteraction view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hitTestResultsAtPoint:", v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (!v15)
    goto LABEL_23;
  v16 = v15;
  v17 = *(_QWORD *)v48;
  v18 = *(_QWORD *)off_1E50B7E98;
  v19 = CFSTR("PXPhotosLayoutHitTestIdentifierAsset");
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v48 != v17)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      objc_msgSend(v21, "identifier");
      v22 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      if (v22 == v19)
      {

      }
      else
      {
        v23 = v22;
        v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", v19);

        if (!v24)
          continue;
      }
      -[PXPhotosViewInteraction viewModel](self, "viewModel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v25, "currentDataSource");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        objc_msgSend(v27, "indexPathForAssetReference:", v26);
      }
      else
      {
        v45 = 0u;
        v46 = 0u;
      }

      if ((_QWORD)v45 != v18)
      {
        objc_msgSend(v25, "currentDataSource");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v25;
        v30 = v26;
        v31 = v19;
        v32 = v16;
        v33 = v17;
        v34 = v18;
        v35 = self;
        v36 = objc_msgSend(v29, "identifier");

        v37 = (_QWORD)v45 == v36;
        self = v35;
        v18 = v34;
        v17 = v33;
        v16 = v32;
        v19 = v31;
        v26 = v30;
        v25 = v41;
        if (v37)
        {
          objc_msgSend(v41, "selectionManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __42__PXPhotosViewUIInteraction__handleTouch___block_invoke;
          v42[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
          v43 = v45;
          v44 = v46;
          objc_msgSend(v38, "performChanges:", v42);

          goto LABEL_23;
        }
      }

    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v16)
      continue;
    break;
  }
LABEL_23:

  v4 = v39;
LABEL_24:

}

- (void)setCurrentTouchAction:(id)a3
{
  void (**v4)(void);
  void (**currentTouchAction)(void);
  void *v6;
  id v7;
  void (**v8)(void);

  v4 = (void (**)(void))a3;
  currentTouchAction = (void (**)(void))self->_currentTouchAction;
  if (currentTouchAction != v4)
  {
    v8 = v4;
    if (currentTouchAction)
    {
      currentTouchAction[2]();
      v4 = v8;
    }
    v6 = _Block_copy(v4);
    v7 = self->_currentTouchAction;
    self->_currentTouchAction = v6;

    v4 = v8;
  }

}

- (void)touchingUIGestureRecognizerDidBeginTouching:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void (**v11)(void);
  void *v12;
  id v13;

  v4 = a3;
  -[PXGInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[PXGInteraction view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hitTestResultAtPoint:", v7, v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "px_photosViewTouchableHitTestResultTouchAction");
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11[2]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewUIInteraction setCurrentTouchAction:](self, "setCurrentTouchAction:", v12);

  }
}

- (void)touchingUIGestureRecognizerDidEndTouching:(id)a3
{
  -[PXPhotosViewUIInteraction setCurrentTouchAction:](self, "setCurrentTouchAction:", 0);
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "oneUpPresentationOrigin");

  return v4;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsOnlyAssetsInSelectedItemSectionInOneUp");

  if (v5)
  {
    -[PXPhotosViewUIInteraction navigatedAssetSectionDataSourceManager](self, "navigatedAssetSectionDataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  void *v3;
  void *v4;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)oneUpPresentationPrivacyController:(id)a3
{
  void *v3;
  void *v4;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privacyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)oneUpPresentation:(id)a3 canStartPreviewingForContextMenuInteraction:(id)a4
{
  return -[PXPhotosViewUIInteraction canStartContextMenuInteraction:](self, "canStartContextMenuInteraction:", a4);
}

- (BOOL)oneUpPresentation:(id)a3 allowsActionsForContextMenuInteraction:(id)a4
{
  return -[PXPhotosViewUIInteraction allowsActionsForContextMenuInteraction:](self, "allowsActionsForContextMenuInteraction:", a4);
}

- (BOOL)oneUpPresentation:(id)a3 allowsMultiSelectMenuForInteraction:(id)a4
{
  void *v4;
  char v5;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "allowsMultiSelectMenu"))
    v5 = objc_msgSend(v4, "isInSelectMode");
  else
    v5 = 0;

  return v5;
}

- (BOOL)oneUpPresentation:(id)a3 allowsPreviewCommittingForContextMenuInteraction:(id)a4
{
  return -[PXPhotosViewUIInteraction allowsPreviewCommittingForContextMenuInteraction:](self, "allowsPreviewCommittingForContextMenuInteraction:", a4);
}

- (BOOL)oneUpPresentation:(id)a3 commitPreviewForContextMenuInteraction:(id)a4
{
  return -[PXPhotosViewUIInteraction _commitPreviewForContextMenuInteraction:](self, "_commitPreviewForContextMenuInteraction:", a4);
}

- (void)oneUpPresentation:(id)a3 willEndPreviewingForContextMenuInteraction:(id)a4 configuration:(id)a5
{
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[PXPhotosViewUIInteraction willEndPreviewingForContextMenuInteraction:](self, "willEndPreviewingForContextMenuInteraction:", v10);
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowsAccessoriesContextMenuCustomization");

  if (v9)
    -[PXPhotosViewUIInteraction contextMenuInteraction:willEndForConfiguration:animator:](self, "contextMenuInteraction:willEndForConfiguration:animator:", v10, v7, 0);

}

- (id)oneUpPresentation:(id)a3 accessoriesForContextMenuInteraction:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowsAccessoriesContextMenuCustomization");

  if (v10)
  {
    -[PXPhotosViewUIInteraction _contextMenuInteraction:accessoriesForMenuWithConfiguration:](self, "_contextMenuInteraction:accessoriesForMenuWithConfiguration:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)oneUpPresentation:(id)a3 styleForContextMenuInteraction:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowsAccessoriesContextMenuCustomization");

  if (v10)
  {
    -[PXPhotosViewUIInteraction _contextMenuInteraction:styleForMenuWithConfiguration:](self, "_contextMenuInteraction:styleForMenuWithConfiguration:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  return -[PXPhotosViewUIInteraction regionOfInterestForAssetReference:image:](self, "regionOfInterestForAssetReference:image:", a4, 0);
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  id v4;
  id v6;

  v6 = 0;
  v4 = -[PXPhotosViewUIInteraction regionOfInterestForAssetReference:image:](self, "regionOfInterestForAssetReference:image:", a4, &v6);
  return v6;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[PXPhotosViewInteraction contentController](self, "contentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollToRevealAssetReference:completionHandler:", v6, 0);

  -[PXPhotosViewUIInteraction setNavigatedAssetReference:](self, "setNavigatedAssetReference:", v6);
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  -[PXPhotosViewUIInteraction setHiddenAssetReferences:](self, "setHiddenAssetReferences:", a4);
}

- (id)oneUpPresentationActionManager:(id)a3
{
  void *v4;
  uint64_t v5;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsOnlyAssetsInSelectedItemSectionInOneUp");

  -[PXPhotosViewUIInteraction _createActionManagerForNavigatedAssetReferenceUsingSectionDataSource:](self, "_createActionManagerForNavigatedAssetReferenceUsingSectionDataSource:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)oneUpPresentationActionContext:(id)a3
{
  void *v4;
  char v5;
  void *v7;
  int v8;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsCMMActions");

  if ((v5 & 1) != 0)
    return 4;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsPickAssetAction");

  if (v8)
    return 6;
  else
    return 0;
}

- (BOOL)oneUpPresentationShouldPreventShowInAllPhotosAction:(id)a3
{
  void *v3;
  char v4;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventShowInAllPhotosAction");

  return v4;
}

- (BOOL)oneUpPresentationWantsShowInLibraryButton:(id)a3
{
  void *v3;
  char v4;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsOneUpShowInLibraryButton");

  return v4;
}

- (id)oneUpPresentationSearchQueryMatchInfo:(id)a3
{
  void *v3;
  void *v4;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchQueryMatchInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canStartContextMenuInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  BOOL v16;

  v4 = a3;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "viewDelegateRespondsTo:", 32))
  {
    objc_msgSend(v5, "viewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "allowsContextMenuInteractionForPhotosViewController:", v7);

    if (!v8)
      goto LABEL_8;
  }
  -[PXPhotosViewInteraction zoomablePhotosInteraction](self, "zoomablePhotosInteraction");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_5;
  v10 = (void *)v9;
  -[PXPhotosViewInteraction zoomablePhotosInteraction](self, "zoomablePhotosInteraction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDisplayingIndividualItems");

  if (!v13)
  {
LABEL_8:
    v16 = 0;
  }
  else
  {
LABEL_5:
    -[PXGInteraction view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v14);
    -[PXPhotosViewInteraction assetReferenceAtLocation:withPadding:inCoordinateSpace:](self, "assetReferenceAtLocation:withPadding:inCoordinateSpace:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;
    if (v15)
      -[PXPhotosViewUIInteraction setNavigatedAssetReference:](self, "setNavigatedAssetReference:", v15);

  }
  return v16;
}

- (BOOL)allowsActionsForContextMenuInteraction:(id)a3
{
  void *v3;
  int v4;
  char v5;
  char v6;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInSelectMode");
  if ((objc_msgSend(v3, "allowsPickAssetAction") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "allowsQuickLookAction");
    v5 = 1;
    if (v4 && (v6 & 1) == 0 && (objc_msgSend(v3, "allowsMacStyleSelection") & 1) == 0)
      v5 = objc_msgSend(v3, "allowsMultiSelectMenu");
  }

  return v5;
}

- (BOOL)allowsPreviewCommittingForContextMenuInteraction:(id)a3
{
  void *v3;
  char v4;
  char v5;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsOneUpPresentation");
  v5 = v4 | objc_msgSend(v3, "allowsPickAssetAction");

  return v5;
}

- (BOOL)_commitPreviewForContextMenuInteraction:(id)a3
{
  void *v4;
  int v5;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsPickAssetAction");

  return v5 && -[PXPhotosViewUIInteraction _pickNavigatedAssetReference](self, "_pickNavigatedAssetReference");
}

- (void)willEndPreviewingForContextMenuInteraction:(id)a3
{
  id v3;

  -[PXPhotosViewInteraction contentController](self, "contentController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopForceIncludingAllAssetsInDataSource");

}

- (id)oneUpPresentation:(id)a3 previewForHighlightingSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5
{
  return -[PXPhotosViewUIInteraction _targetedPreviewForSecondaryAssetReference:](self, "_targetedPreviewForSecondaryAssetReference:", a4);
}

- (id)oneUpPresentation:(id)a3 previewForDismissingToSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5
{
  return -[PXPhotosViewUIInteraction _targetedPreviewForSecondaryAssetReference:](self, "_targetedPreviewForSecondaryAssetReference:", a4);
}

- (id)_targetedPreviewForSecondaryAssetReference:(id)a3
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
  uint64_t v14;

  v4 = a3;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v4)
  {
    v11 = 0;
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v8, "assetReferenceForAssetReference:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_6;
  objc_msgSend(v10, "indexPath");
  if (!objc_msgSend(v7, "isIndexPathSelected:", &v14))
    goto LABEL_6;
  -[PXPhotosViewUIInteraction targetedPreviewForAssetReference:](self, "targetedPreviewForAssetReference:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v12;
}

- (id)targetedPreviewForAssetReference:(id)a3
{
  void *v4;
  id v5;
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
  void (**v18)(_QWORD, _QWORD);
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v25;

  v25 = 0;
  -[PXPhotosViewUIInteraction regionOfInterestForAssetReference:image:](self, "regionOfInterestForAssetReference:image:", a3, &v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;
  -[PXPhotosViewUIInteraction scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinateSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rectInCoordinateSpace:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (v5)
  {
    PXPreviewImageViewForImage(v5, v4, v9, v11, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_7:
      v23 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v4, "placeholderViewFactory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_7;
    objc_msgSend(v4, "placeholderViewFactory");
    v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v18)[2](v18, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_7;
  }
  v19 = objc_alloc(MEMORY[0x1E0DC3B88]);
  PXRectGetCenter();
  v20 = (void *)objc_msgSend(v19, "initWithContainer:center:", v6);
  v21 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v22);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v16, v21, v20);
LABEL_8:

  return v23;
}

- (id)oneUpPresentation:(id)a3 secondaryIdentifiersForConfiguration:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInSelectMode") && objc_msgSend(v5, "allowsMultiSelectMenu"))
  {
    objc_msgSend(v5, "selectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    -[PXPhotosViewUIInteraction navigatedAssetReference](self, "navigatedAssetReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[PXPhotosViewUIInteraction navigatedAssetReference](self, "navigatedAssetReference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v8, "indexPathForAssetReference:", v10);
      }
      else
      {
        v21 = 0u;
        v22 = 0u;
      }

    }
    else
    {
      v12 = *((_OWORD *)off_1E50B8778 + 1);
      v21 = *(_OWORD *)off_1E50B8778;
      v22 = v12;
    }

    objc_msgSend(v7, "selectedIndexPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v20[0] = v21;
    v20[1] = v22;
    if (objc_msgSend(v13, "containsIndexPath:", v20))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __84__PXPhotosViewUIInteraction_oneUpPresentation_secondaryIdentifiersForConfiguration___block_invoke;
      v15[3] = &unk_1E513C1C0;
      v18 = v21;
      v19 = v22;
      v16 = v8;
      v17 = v11;
      objc_msgSend(v13, "enumerateAllIndexPathsUsingBlock:", v15);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (-[PXPhotosViewUIInteraction canStartContextMenuInteraction:](self, "canStartContextMenuInteraction:", v5))
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "viewDelegateRespondsTo:", 64))
    {
      objc_msgSend(v6, "viewDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewUIInteraction navigatedAssetReference](self, "navigatedAssetReference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photosViewController:configurationForContextMenuInteraction:assetReference:", v8, v5, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;

  -[PXPhotosViewUIInteraction navigatedAssetReference](self, "navigatedAssetReference", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewUIInteraction targetedPreviewForAssetReference:](self, "targetedPreviewForAssetReference:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v7 = a3;
  v8 = a5;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "viewDelegateRespondsTo:", 128))
  {
    -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredCommitStyle:", 1);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __110__PXPhotosViewUIInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v12[3] = &unk_1E51457C8;
    v13 = v9;
    v14 = v10;
    v15 = v7;
    v11 = v10;
    objc_msgSend(v8, "addCompletion:", v12);

  }
}

- (id)_contextMenuInteraction:(id)a3 accessoriesForMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "viewDelegateRespondsTo:", 256) && (objc_msgSend(v6, "isInSelectMode") & 1) == 0)
  {
    objc_msgSend(v6, "viewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewUIInteraction navigatedAssetReference](self, "navigatedAssetReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photosViewController:accessoriesForContextMenuInteraction:assetReference:", v9, v5, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "viewDelegateRespondsTo:", 512))
  {
    objc_msgSend(v10, "viewDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photosViewController:contextMenuInteraction:willEndForConfiguration:animator:", v12, v13, v8, v9);

  }
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "viewDelegateRespondsTo:", 1024))
  {
    objc_msgSend(v8, "viewDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photosViewController:contextMenuInteraction:styleForMenuWithConfiguration:", v10, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dragController:(id)a3 regionOfInterestForAssetReference:(id)a4 image:(id *)a5
{
  return -[PXPhotosViewUIInteraction regionOfInterestForAssetReference:image:](self, "regionOfInterestForAssetReference:image:", a4, a5);
}

- (id)dragController:(id)a3 draggableAssetReferenceAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;

  y = a4.y;
  x = a4.x;
  objc_msgSend(a3, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewInteraction assetReferenceAtLocation:withPadding:inCoordinateSpace:](self, "assetReferenceAtLocation:withPadding:inCoordinateSpace:", v7, x, y, *(double *)off_1E50B8010, *((double *)off_1E50B8010 + 1), *((double *)off_1E50B8010 + 2), *((double *)off_1E50B8010 + 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dragController:(id)a3 dropTargetAssetReferenceForLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;

  y = a4.y;
  x = a4.x;
  -[PXGInteraction view](self, "view", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dropTargetObjectReferenceForLocation:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (id)dragControllerAssetReferenceForBeginningSession:(id)a3
{
  void *v4;
  void *v5;

  -[PXPhotosViewUIInteraction oneUpPresentation](self, "oneUpPresentation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isContextMenuInteractionActive"))
  {
    -[PXPhotosViewUIInteraction navigatedAssetReference](self, "navigatedAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)dragController:(id)a3 shouldSelectRearrangedAssetReferences:(id)a4
{
  void *v4;
  char v5;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInSelectMode");

  return v5;
}

- (BOOL)dragController:(id)a3 shouldResizeCancelledPreviewForAssetReference:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  -[PXGInteraction layout](self, "layout", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hiddenSpriteIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 0;

  return v6;
}

- (void)dragController:(id)a3 draggedAssetReferencesDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "draggedAssetReferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v5, "count");

  if (v8 > v9)
  {
    -[PXGInteraction layout](self, "layout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "createFenceWithType:", 2);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__PXPhotosViewUIInteraction_dragController_draggedAssetReferencesDidChange___block_invoke;
  v13[3] = &unk_1E51437F8;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v6, "performChanges:", v13);

}

- (void)dragController:(id)a3 dropTargetAssetReferenceDidChange:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PXPhotosViewUIInteraction_dragController_dropTargetAssetReferenceDidChange___block_invoke;
  v8[3] = &unk_1E51437F8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performChanges:", v8);

}

- (id)dragController:(id)a3 itemProviderForAssetReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "viewDelegateRespondsTo:", 2048))
  {
    objc_msgSend(v6, "viewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photosViewController:dragItemProviderForAssetReference:", v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3
{
  void *v3;
  char v4;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canSwipeSelect");

  return v4;
}

- (BOOL)swipeSelectionManager:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4
{
  return 0;
}

- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3
{
  id v3;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isInSelectMode") & 1) == 0 && objc_msgSend(v3, "canEnterSelectMode"))
    objc_msgSend(v3, "performChanges:", &__block_literal_global_199_240351);

}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4
{
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  return -[PXPhotosViewUIInteraction _indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:](self, "_indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:", a4, a5.x, a5.y, *(double *)off_1E50B8010, *((double *)off_1E50B8010 + 1), *((double *)off_1E50B8010 + 2), *((double *)off_1E50B8010 + 3));
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4
{
  double y;
  double x;
  PXSwipeSelectionManager *swipeSelectionManager;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PXSimpleIndexPath *result;
  id v16;

  y = a5.y;
  x = a5.x;
  swipeSelectionManager = self->_swipeSelectionManager;
  v16 = a4;
  -[PXSwipeSelectionManager scrollView](swipeSelectionManager, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
  -[PXPhotosViewUIInteraction _indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:](self, "_indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:", v16, x, y, v11, v12, v13, v14);

  return result;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4
{
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PXSimpleIndexPath *result;
  id v15;

  y = a5.y;
  x = a5.x;
  v15 = a4;
  -[PXGInteraction layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "padding");

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
  -[PXPhotosViewUIInteraction _indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:](self, "_indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:", v15, x, y, v10, v11, v12, v13);

  return result;
}

- (id)swipeSelectionManager:(id)a3 indexPathSetFromIndexPath:(PXSimpleIndexPath *)a4 toIndexPath:(PXSimpleIndexPath *)a5
{
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  _OWORD v21[2];
  _OWORD v22[2];

  objc_msgSend(a3, "selectionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewUIInteraction.m"), 1384, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("swipeSelectionManager.selectionManager.dataSourceManager.dataSource"), v18);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewUIInteraction.m"), 1384, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("swipeSelectionManager.selectionManager.dataSourceManager.dataSource"), v18, v20);

    goto LABEL_6;
  }
LABEL_3:
  v12 = *(_OWORD *)&a4->item;
  v22[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v22[1] = v12;
  v13 = *(_OWORD *)&a5->item;
  v21[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v21[1] = v13;
  objc_msgSend(v11, "indexPathSetFromIndexPath:toIndexPath:", v22, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)swipeSelectionManager:(id)a3 extendSelectionInDirection:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (-[PXPhotosViewUIInteraction ensureSelectMode](self, "ensureSelectMode"))
    {
      -[PXPhotosViewInteraction contentController](self, "contentController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "extendSelectionInDirection:", a4);

      -[PXPhotosViewUIInteraction uiInteractionDelegate](self, "uiInteractionDelegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uiInteractionDidExtendSelection:", self);

    }
  }
}

- (PXSimpleIndexPath)_indexPathForAssetAtLocation:(SEL)a3 withPadding:(CGPoint)a4 forSwipeSelectionManager:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double y;
  double x;
  void *v14;
  void *v15;
  PXSimpleIndexPath *result;
  void *v17;
  void *v18;
  __int128 v19;
  id v20;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  y = a4.y;
  x = a4.x;
  objc_msgSend(a6, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewInteraction assetReferenceAtLocation:withPadding:inCoordinateSpace:](self, "assetReferenceAtLocation:withPadding:inCoordinateSpace:", v14, x, y, top, left, bottom, right);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_4;
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "assetReferenceForAssetReference:", v15);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "indexPath");

  }
  else
  {
LABEL_4:
    v19 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&retstr->item = v19;
  }
  return result;
}

- (void)swipeSelectionManagerDidAutoScroll:(id)a3
{
  id v3;

  -[PXGInteraction layout](self, "layout", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearLastVisibleAreaAnchoringInformation");

}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  id v15;

  v6 = a3;
  v7 = v6;
  v15 = v6;
  if (a4 == 10)
  {
    v8 = objc_msgSend(v6, "shouldPreventTargetedDismissalAnimation");
    v7 = v15;
    if (v8)
    {
      -[PXPhotosViewUIInteraction oneUpPresentation](self, "oneUpPresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preventTargetedContextMenuDismissalAnimation");

      v7 = v15;
    }
  }
  objc_msgSend(v7, "actionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("PXAssetActionTypePickAsset"));

  if (a4 == 30 && v11)
    -[PXPhotosViewUIInteraction _pickNavigatedAssetReference](self, "_pickNavigatedAssetReference");
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "allowsMultiSelectMenu");
  v14 = objc_msgSend(v12, "isInSelectMode");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v15, "shouldExitSelectModeForState:", a4) & v13 & v14) == 1)
  {
    -[PXPhotosViewUIInteraction toggleSelectMode](self, "toggleSelectMode");
  }

}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v6);

  return v8 != 0;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXPhotosViewInteraction contentController](self, "contentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "presentationEnvironmentForActionPerformer:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXPhotosViewUIInteraction presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3
{
  return 0.0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;

  v4 = a3;
  -[PXPhotosViewUIInteraction pinchGesture](self, "pinchGesture");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PXPhotosViewUIInteraction swipeSelectionManager](self, "swipeSelectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v7, "state") == 0;

  }
  else
  {
    LOBYTE(v6) = 1;
  }
  -[PXPhotosViewUIInteraction doubleTapGesture](self, "doubleTapGesture");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isInSelectMode");

    LOBYTE(v6) = v6 & ~v10;
  }
  -[PXGInteraction view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v11);
  objc_msgSend(v11, "hitTest:withEvent:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEmbedded");

  if (v14)
  {
    if (v12 == v11)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      -[PXPhotosViewUIInteraction scrollView](self, "scrollView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v15)
        LOBYTE(v6) = 1;
      else
        v6 = objc_msgSend(v12, "isUserInteractionEnabled") ^ 1;

    }
  }
  objc_opt_class();
  v16 = v6 & ~objc_opt_isKindOfClass();

  return v16;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  UILongPressGestureRecognizer *v7;
  id v8;
  BOOL v9;
  void *v10;
  UILongPressGestureRecognizer *v11;
  id v12;
  BOOL v13;
  UILongPressGestureRecognizer *v14;
  UILongPressGestureRecognizer *v15;
  id v16;
  BOOL v17;
  int v18;
  id v19;
  void *v20;
  id v22;

  v6 = a3;
  v7 = (UILongPressGestureRecognizer *)a4;
  -[PXPhotosViewUIInteraction pinchGesture](self, "pinchGesture");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    -[PXPhotosViewUIInteraction scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "panGestureRecognizer");
    v11 = (UILongPressGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    v9 = v11 == v7 || self->_longPressGesture == v7;

  }
  else
  {
    v9 = 0;
  }

  -[PXPhotosViewUIInteraction tapGesture](self, "tapGesture");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v6)
  {
    -[PXPhotosViewUIInteraction touchGesture](self, "touchGesture");
    v14 = (UILongPressGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    if (v14 == v7)
    {
      v13 = 1;
    }
    else
    {
      -[PXPhotosViewUIInteraction touchingGesture](self, "touchingGesture");
      v15 = (UILongPressGestureRecognizer *)objc_claimAutoreleasedReturnValue();
      v13 = v15 == v7;

    }
  }
  else
  {
    v13 = 0;
  }

  -[PXPhotosViewUIInteraction touchingGesture](self, "touchingGesture");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v6)
  {
    v22 = 0;
    v18 = -[UILongPressGestureRecognizer px_isPanGestureRecognizerOfScrollView:](v7, "px_isPanGestureRecognizerOfScrollView:", &v22);
    v19 = v22;
    v20 = v19;
    v17 = !v18 || (objc_msgSend(v19, "px_isDecelerating") & 1) == 0;

  }
  else
  {
    v17 = v13 || v9;
  }

  return v17;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[PXPhotosViewUIInteraction tapGesture](self, "tapGesture");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7
    && (-[PXPhotosViewUIInteraction doubleTapGesture](self, "doubleTapGesture"),
        v9 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        v9 == v6))
  {
    -[PXPhotosViewInteraction viewModel](self, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "allowsMacStyleSelection") & 1) != 0)
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      -[PXPhotosViewInteraction viewModel](self, "viewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "isInSelectMode") ^ 1;

    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  uint64_t v5;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowedGesturesKind");

  return v5 != 1;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PXPhotosViewUIInteraction dragController](self, "dragController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDragSessionActive");

  if (v5)
  {
    -[PXGInteraction layout](self, "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearLastVisibleAreaAnchoringInformation");

  }
  -[PXPhotosViewUIInteraction oneUpPresentation](self, "oneUpPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidatePresentingGeometry");

  -[PXPhotosViewUIInteraction hoverGesture](self, "hoverGesture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_cancel");

  -[PXPhotosViewUIInteraction _updateScrolledToStates:](self, "_updateScrolledToStates:", v9);
}

- (void)_updateScrolledToStates:(id)a3
{
  id v4;
  char v5;
  char v6;
  void *v7;
  _QWORD v8[4];
  char v9;
  char v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "isScrolledAtEdge:tolerance:", 1, 0.0);
  v6 = objc_msgSend(v4, "isScrolledAtEdge:tolerance:", 3, 10.0);

  -[PXPhotosViewInteraction viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PXPhotosViewUIInteraction__updateScrolledToStates___block_invoke;
  v8[3] = &__block_descriptor_34_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "performChanges:", v8);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((void *)NavigatedSectionDataSourceObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewUIInteraction.m"), 1590, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXPhotosViewUIInteraction navigatedAssetSectionDataSourceManager](self, "navigatedAssetSectionDataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsAnyItems");

  if ((v10 & 1) == 0)
  {
    -[PXPhotosViewUIInteraction oneUpPresentation](self, "oneUpPresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopAnimated:", 1);

  }
}

- (PXPhotosViewUIInteractionDelegate)uiInteractionDelegate
{
  return (PXPhotosViewUIInteractionDelegate *)objc_loadWeakRetained((id *)&self->_uiInteractionDelegate);
}

- (void)setUiInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_uiInteractionDelegate, a3);
}

- (PXOneUpPresentation)oneUpPresentation
{
  return self->_oneUpPresentation;
}

- (PXAssetReference)navigatedAssetReference
{
  return self->_navigatedAssetReference;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (UIViewControllerInteractiveTransitioning)edgeSwipeDismissalInteraction
{
  return self->_edgeSwipeDismissalInteraction;
}

- (NSSet)hiddenAssetReferences
{
  return self->_hiddenAssetReferences;
}

- (UIHoverGestureRecognizer)hoverGesture
{
  return self->_hoverGesture;
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (UITapGestureRecognizer)doubleTapGesture
{
  return self->_doubleTapGesture;
}

- (UITapGestureRecognizer)pressGesture
{
  return self->_pressGesture;
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return self->_pinchGesture;
}

- (UILongPressGestureRecognizer)touchGesture
{
  return self->_touchGesture;
}

- (UIScreenEdgePanGestureRecognizer)edgeSwipeGesture
{
  return self->_edgeSwipeGesture;
}

- (PXTouchingUIGestureRecognizer)touchingGesture
{
  return self->_touchingGesture;
}

- (PXSwipeSelectionManager)swipeSelectionManager
{
  return self->_swipeSelectionManager;
}

- (PXPhotosDragController)dragController
{
  return self->_dragController;
}

- (PXAssetsDataSourceManager)navigatedAssetSectionDataSourceManager
{
  return self->_navigatedAssetSectionDataSourceManager;
}

- (id)currentTouchAction
{
  return self->_currentTouchAction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentTouchAction, 0);
  objc_storeStrong((id *)&self->_navigatedAssetSectionDataSourceManager, 0);
  objc_storeStrong((id *)&self->_dragController, 0);
  objc_storeStrong((id *)&self->_swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->_touchingGesture, 0);
  objc_storeStrong((id *)&self->_edgeSwipeGesture, 0);
  objc_storeStrong((id *)&self->_touchGesture, 0);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_pressGesture, 0);
  objc_storeStrong((id *)&self->_doubleTapGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_hoverGesture, 0);
  objc_storeStrong((id *)&self->_hiddenAssetReferences, 0);
  objc_storeStrong((id *)&self->_edgeSwipeDismissalInteraction, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_navigatedAssetReference, 0);
  objc_storeStrong((id *)&self->_oneUpPresentation, 0);
  objc_destroyWeak((id *)&self->_uiInteractionDelegate);
}

void __53__PXPhotosViewUIInteraction__updateScrolledToStates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setScrolledToTop:", v3);
  objc_msgSend(v4, "setScrolledToBottom:", *(unsigned __int8 *)(a1 + 33));

}

uint64_t __91__PXPhotosViewUIInteraction_swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attemptSetInSelectMode:", 1);
}

uint64_t __78__PXPhotosViewUIInteraction_dragController_dropTargetAssetReferenceDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDropTargetAssetReference:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__PXPhotosViewUIInteraction_dragController_draggedAssetReferencesDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDraggedAssetReferences:", *(_QWORD *)(a1 + 32));
}

void __110__PXPhotosViewUIInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosViewController:commitPreviewViewControllerForContextMenuInteraction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __84__PXPhotosViewUIInteraction_oneUpPresentation_secondaryIdentifiersForConfiguration___block_invoke(uint64_t a1, int64x2_t *a2)
{
  void *v3;
  int64x2_t v4;
  void *v5;
  _OWORD v6[2];

  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*a2, *(int64x2_t *)(a1 + 48)), (int32x4_t)vceqq_s64(a2[1], *(int64x2_t *)(a1 + 64)))), 0xFuLL))) & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2[1];
    v6[0] = *a2;
    v6[1] = v4;
    objc_msgSend(v3, "assetReferenceAtItemIndexPath:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
}

uint64_t __42__PXPhotosViewUIInteraction__handleTouch___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setPressedIndexPath:", v4);
}

uint64_t __42__PXPhotosViewUIInteraction__handleTouch___block_invoke_2(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *((_OWORD *)off_1E50B8778 + 1);
  v4[0] = *(_OWORD *)off_1E50B8778;
  v4[1] = v2;
  return objc_msgSend(a2, "setPressedIndexPath:", v4);
}

uint64_t __42__PXPhotosViewUIInteraction__handlePinch___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInteractiveMode:", 1);
}

uint64_t __42__PXPhotosViewUIInteraction__handlePress___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActivity:", 1);
}

uint64_t __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleSelectionForAssetReference:updateCursorIndexPath:", *(_QWORD *)(a1 + 32), 1);
}

uint64_t __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clickSelectAssetReference:updateCursorIndexPath:", *(_QWORD *)(a1 + 32), 1);
}

uint64_t __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleSelectionForAssetReference:updateCursorIndexPath:", *(_QWORD *)(a1 + 32), 1);
}

uint64_t __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_181(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleSelectionForAssetReference:updateCursorIndexPath:", *(_QWORD *)(a1 + 32), 1);
}

uint64_t __40__PXPhotosViewUIInteraction__handleTap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __59__PXPhotosViewUIInteraction__handleHoverWithHitTestResult___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setPendingIndexPath:", v4);
}

uint64_t __73__PXPhotosViewUIInteraction__handleHoverWithHitTestResults_hoverGesture___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *((_OWORD *)off_1E50B8778 + 1);
  v4[0] = *(_OWORD *)off_1E50B8778;
  v4[1] = v2;
  return objc_msgSend(a2, "setPendingIndexPath:", v4);
}

uint64_t __76__PXPhotosViewUIInteraction__createSelectionManagerForNavigatedAssetSection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

id __106__PXPhotosViewUIInteraction_regionOfInterestForAssetReference_image_fallbackMediaProvider_shouldSnapshot___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  v5 = *(double *)(a1 + 72);
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 32), "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v2, v3, v4, v5, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  else
    PXPreviewImageViewForImage(*(void **)(a1 + 40), a2, v2, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __45__PXPhotosViewUIInteraction_ensureSelectMode__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsInSelectMode:", 1);
}

void __45__PXPhotosViewUIInteraction_toggleSelectMode__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "attemptSetInSelectMode:", objc_msgSend(v2, "isInSelectMode") ^ 1);

}

uint64_t __57__PXPhotosViewUIInteraction__pickNavigatedAssetReference__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleSelectionForAssetReference:updateCursorIndexPath:", *(_QWORD *)(a1 + 32), 1);
}

@end
