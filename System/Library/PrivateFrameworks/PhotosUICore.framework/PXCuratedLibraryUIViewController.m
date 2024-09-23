@implementation PXCuratedLibraryUIViewController

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  if ((void *)PXCuratedLibraryViewModelObserverContext_78120 != a5)
  {
    if ((void *)PXSharedLibraryStatusProviderObservationContext_78090 != a5)
    {
      if ((void *)PXLibraryFilterStateObservationContext_78091 != a5)
      {
        if ((void *)PXCuratedLibraryStyleGuideObserverContext == a5)
        {
          if ((a4 & 4) != 0)
          {
            -[PXCuratedLibraryUIViewController viewIfLoaded](self, "viewIfLoaded");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setNeedsLayout");

          }
        }
        else if ((void *)PXZoomablePhotosViewModelObservationContext == a5)
        {
          if ((a4 & 2) != 0)
          {
            -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "viewModel");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "singleSelectedAssetReference");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXCuratedLibraryUIViewController _requestFocusUpdateWithAssetReference:](self, "_requestFocusUpdateWithAssetReference:", v34);

          }
        }
        else
        {
          if ((void *)PXCPLUIStatusProviderObservationContext_78034 != a5)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 485, CFSTR("Code which should be unreachable has been reached"));

            abort();
          }
          -[PXCuratedLibraryUIViewController _conditionallyUpdateEmptyPlaceholder](self, "_conditionallyUpdateEmptyPlaceholder");
        }
        goto LABEL_43;
      }
      if ((a4 & 1) == 0)
        goto LABEL_43;
    }
LABEL_42:
    -[PXCuratedLibraryUIViewController _invalidateSecondaryToolbar](self, "_invalidateSecondaryToolbar");
    -[PXCuratedLibraryUIViewController _invalidateEmptyPlaceholder](self, "_invalidateEmptyPlaceholder");
    -[PXCuratedLibraryUIViewController _updateEmptyPlaceholder](self, "_updateEmptyPlaceholder");
    goto LABEL_43;
  }
  if ((a4 & 1) != 0)
  {
    -[PXCuratedLibraryUIViewController _invalidateSecondaryToolbar](self, "_invalidateSecondaryToolbar");
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clearLastVisibleAreaAnchoringInformation");

    -[PXCuratedLibraryUIViewController invalidateBoopableItemsProvider](self, "invalidateBoopableItemsProvider");
  }
  if ((a4 & 0x804) != 0)
    -[PXCuratedLibraryUIViewController _updateTrackedScrollLevelIfNeeded](self, "_updateTrackedScrollLevelIfNeeded");
  if ((a4 & 4) != 0)
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "singleSelectedAssetReference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController _requestFocusUpdateWithAssetReference:](self, "_requestFocusUpdateWithAssetReference:", v13);

  }
  if ((a4 & 0xFFFFFFFF80000040) != 0)
    -[PXCuratedLibraryUIViewController _updateEmptyPlaceholder](self, "_updateEmptyPlaceholder");
  if ((a4 & 0xFFFFFFFF81000000) != 0)
    -[PXCuratedLibraryUIViewController _updateStatusBarStyle](self, "_updateStatusBarStyle");
  if ((a4 & 0x2000) != 0)
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "zoomLevelTransitionPhase");

    if (!v16)
      -[PXCuratedLibraryUIViewController _updateSkimmingSlideshowEnabled](self, "_updateSkimmingSlideshowEnabled");
  }
  if ((a4 & 0x400000) != 0)
  {
    -[PXCuratedLibraryUIViewController viewIfLoaded](self, "viewIfLoaded");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNeedsLayout");

    if ((a4 & 0x10000000) == 0)
    {
LABEL_23:
      if ((a4 & 0x20000000) == 0)
        goto LABEL_24;
      goto LABEL_28;
    }
  }
  else if ((a4 & 0x10000000) == 0)
  {
    goto LABEL_23;
  }
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "viewModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cplUIStatusProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryUIViewController setCplUIStatusProvider:](self, "setCplUIStatusProvider:", v20);
  -[PXCuratedLibraryUIViewController _conditionallyUpdateEmptyPlaceholder](self, "_conditionallyUpdateEmptyPlaceholder");

  if ((a4 & 0x20000000) == 0)
  {
LABEL_24:
    if ((a4 & 8) == 0)
      goto LABEL_35;
    goto LABEL_32;
  }
LABEL_28:
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "viewModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "wantsSidebarVisible")
    && objc_msgSend(v22, "sidebarCanBecomeVisible"))
  {
    -[UIViewController px_splitViewController](self, "px_splitViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "toggleSidebarVisibilityAnimated");

  }
  if ((a4 & 8) != 0)
  {
LABEL_32:
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "viewModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "selectionSnapshot");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEmptySelectionAvoided");

    if (v27)
    {
      -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "viewModel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "singleSelectedAssetReference");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryUIViewController _requestFocusUpdateWithAssetReference:](self, "_requestFocusUpdateWithAssetReference:", v30);

    }
    -[PXCuratedLibraryUIViewController _requestExpansionIfNeeded](self, "_requestExpansionIfNeeded");
  }
LABEL_35:
  if (a4 >> 31)
  {
    -[PXCuratedLibraryUIViewController _invalidateIsModalInPresentation](self, "_invalidateIsModalInPresentation");
    -[PXCuratedLibraryUIViewController _updateSecondaryToolbarStyle](self, "_updateSecondaryToolbarStyle");
  }
  if ((a4 & 0xFFFFFFFF82000000) != 0)
    -[PXCuratedLibraryUIViewController _invalidateSecondaryToolbar](self, "_invalidateSecondaryToolbar");
  if ((a4 & 2) != 0)
    goto LABEL_42;
LABEL_43:

}

uint64_t __93__PXCuratedLibraryUIViewController__scrollLibraryViewToInitialPositionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ensureLastSectionHasContent");
}

uint64_t __92__PXCuratedLibraryUIViewController__navigateToZoomLevelForNavigationRequest_successHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

void __84__PXCuratedLibraryUIViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsSelecting:", 0);
  objc_msgSend(v2, "setIsNavigating:", 1);
  objc_msgSend(v2, "resetAllPhotosContentFilterState");

}

uint64_t __51__PXCuratedLibraryUIViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsAppearing:", 1);
}

uint64_t __50__PXCuratedLibraryUIViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsAppearing:", 0);
}

- (void)_prepareGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  UIHoverGestureRecognizer *v7;
  UIHoverGestureRecognizer *hoverGesture;
  UIHoverGestureRecognizer *v9;
  void *v10;
  void *v11;
  void *v12;
  PXRelaxedScreenEdgePanGestureRecognizer *v13;
  PXRelaxedScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  PXTouchingUIGestureRecognizer *v19;
  PXTouchingUIGestureRecognizer *skimmingTouchGesture;
  PXTouchingUIGestureRecognizer *v21;
  UIPanGestureRecognizer *v22;
  UIPanGestureRecognizer *panGesture;
  id v24;

  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActionTypeAllowed:", CFSTR("PXCuratedLibraryActionHover"));

  if (v6)
  {
    v7 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", self, sel__handleHover_);
    -[UIHoverGestureRecognizer setDelegate:](v7, "setDelegate:", self);
    hoverGesture = self->_hoverGesture;
    self->_hoverGesture = v7;
    v9 = v7;

    objc_msgSend(v24, "addGestureRecognizer:", v9);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setCancelsTouchesInView:", 0);
  objc_storeStrong((id *)&self->_tapGesture, v10);
  objc_msgSend(v24, "addGestureRecognizer:", v10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handlePress_);
  objc_msgSend(v11, "setAllowedPressTypes:", &unk_1E53E9180);
  objc_msgSend(v11, "setDelegate:", self);
  objc_storeStrong((id *)&self->_pressGesture, v11);
  objc_msgSend(v24, "addGestureRecognizer:", v11);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel__handlePinch_);
  objc_msgSend(v12, "_setEndsOnSingleTouch:", 1);
  objc_msgSend(v12, "setDelegate:", self);
  objc_storeStrong((id *)&self->_pinchGesture, v12);
  objc_msgSend(v24, "addGestureRecognizer:", v12);
  v13 = -[PXRelaxedScreenEdgePanGestureRecognizer initWithTarget:action:]([PXRelaxedScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleScreenEdgePan_);
  screenEdgePanGestureRecognizer = self->_screenEdgePanGestureRecognizer;
  self->_screenEdgePanGestureRecognizer = v13;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "swipeBackGestureMinAngle");
  -[PXRelaxedScreenEdgePanGestureRecognizer setMinAngleToEdge:](self->_screenEdgePanGestureRecognizer, "setMinAngleToEdge:");

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "swipeBackGestureMinTranslation");
  -[PXRelaxedScreenEdgePanGestureRecognizer setMinTranslation:](self->_screenEdgePanGestureRecognizer, "setMinTranslation:");

  -[PXRelaxedScreenEdgePanGestureRecognizer setDelegate:](self->_screenEdgePanGestureRecognizer, "setDelegate:", self);
  if (objc_msgSend(v24, "effectiveUserInterfaceLayoutDirection") == 1)
    -[PXRelaxedScreenEdgePanGestureRecognizer setEdges:](self->_screenEdgePanGestureRecognizer, "setEdges:", 8);
  objc_msgSend(v24, "addGestureRecognizer:", self->_screenEdgePanGestureRecognizer);
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "enableSkimmingInYears");

  if (v18)
  {
    v19 = -[PXTouchingUIGestureRecognizer initWithTarget:action:]([PXTouchingUIGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
    -[PXTouchingUIGestureRecognizer setDelegate:](v19, "setDelegate:", self);
    -[PXTouchingUIGestureRecognizer setTouchDelegate:](v19, "setTouchDelegate:", self);
    -[PXTouchingUIGestureRecognizer setCancelsTouchesInView:](v19, "setCancelsTouchesInView:", 0);
    -[PXTouchingUIGestureRecognizer setMaximumTouchMovement:](v19, "setMaximumTouchMovement:", 5.0);
    objc_msgSend(v24, "addGestureRecognizer:", v19);
    skimmingTouchGesture = self->_skimmingTouchGesture;
    self->_skimmingTouchGesture = v19;
    v21 = v19;

    v22 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handlePan_);
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v22, "setMinimumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v22, "setMaximumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setDelegate:](v22, "setDelegate:", self);
    -[PXTouchingUIGestureRecognizer maximumTouchMovement](v21, "maximumTouchMovement");
    -[UIPanGestureRecognizer _setHysteresis:](v22, "_setHysteresis:");
    -[UIPanGestureRecognizer requireGestureRecognizerToFail:](v22, "requireGestureRecognizerToFail:", self->_screenEdgePanGestureRecognizer);
    objc_msgSend(v24, "addGestureRecognizer:", v22);
    panGesture = self->_panGesture;
    self->_panGesture = v22;

  }
}

- (int64_t)userInterfaceFeature
{
  return 4;
}

- (void)px_willTransitionBars
{
  id v2;

  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldWorkaround18475431:", 1);

}

- (void)px_didTransitionBars
{
  id v2;

  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldWorkaround18475431:", 0);

}

- (void)_updateEmptyPlaceholder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  PXStatusController *v17;
  PXStatusController *v18;
  void (**v19)(_QWORD);
  void *v20;
  int v21;
  PXStatusViewModel *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  PXPhotoKitAssetCollectionActionManager *v32;
  PXPhotosDragController *v33;
  void *v34;
  void *v35;
  PXPhotosDragController *v36;
  void *v37;
  __int16 v38[8];
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  _QWORD aBlock[4];
  PXStatusController *v43;
  PXCuratedLibraryUIViewController *v44;

  if (-[PXCuratedLibraryUIViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "shouldShowEmptyPlaceholder"))
    {
      -[PXCuratedLibraryUIViewController emptyPlaceholderStatusController](self, "emptyPlaceholderStatusController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
        {
          -[PXCuratedLibraryUIViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "hasSharedLibraryOrPreview");

          if (v7)
          {
            -[PXCuratedLibraryUIViewController _addEmptyPlaceholderSwitchLibraryButtonForRegularSizeClass](self, "_addEmptyPlaceholderSwitchLibraryButtonForRegularSizeClass");
            -[PXCuratedLibraryUIViewController emptyPlaceholderSwitchLibraryButton](self, "emptyPlaceholderSwitchLibraryButton");
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            if (v8)
              -[PXCuratedLibraryUIViewController _updateEmptyPlaceholderSwitchLibraryButtonPosition](self, "_updateEmptyPlaceholderSwitchLibraryButtonPosition");
          }
        }
      }
      else
      {
        objc_msgSend(v3, "gridView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeFromSuperview");

        -[PXCuratedLibraryUIViewController _setObservableScrollView:forEdges:](self, "_setObservableScrollView:forEdges:", 0, 5);
        v17 = objc_alloc_init(PXStatusController);
        -[PXStatusController setDelegate:](v17, "setDelegate:", self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __59__PXCuratedLibraryUIViewController__updateEmptyPlaceholder__block_invoke;
        aBlock[3] = &unk_1E5148D08;
        v18 = v17;
        v43 = v18;
        v44 = self;
        v19 = (void (**)(_QWORD))_Block_copy(aBlock);
        -[PXCuratedLibraryUIViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "hasSharedLibraryOrPreview");

        if (v21)
        {
          v22 = objc_alloc_init(PXStatusViewModel);
          -[PXStatusController setViewModel:](v18, "setViewModel:", v22);
          -[PXCuratedLibraryUIViewController libraryFilterState](self, "libraryFilterState");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "viewMode");

          if ((unint64_t)(v24 - 1) >= 2)
          {
            if (!v24)
              v19[2](v19);
          }
          else
          {
            -[PXStatusController configuration](v18, "configuration");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "secondaryTextProperties");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXCuratedLibraryUIViewController _emptyPlaceholderMessageTextAttributesFromTextProperties:](self, "_emptyPlaceholderMessageTextAttributesFromTextProperties:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __59__PXCuratedLibraryUIViewController__updateEmptyPlaceholder__block_invoke_3;
            v39[3] = &unk_1E51426C8;
            v40 = v27;
            v41 = v24;
            v28 = v27;
            -[PXStatusViewModel performChanges:](v22, "performChanges:", v39);

          }
          if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
            -[PXCuratedLibraryUIViewController _addEmptyPlaceholderSwitchLibraryButtonForCompactSizeClass](self, "_addEmptyPlaceholderSwitchLibraryButtonForCompactSizeClass");

        }
        else
        {
          v19[2](v19);
        }
        objc_msgSend(v4, "assetsDataSourceManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dataSourceForZoomLevel:", 4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstAssetCollection");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = -[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", v31, 0);
        v33 = [PXPhotosDragController alloc];
        -[PXCuratedLibraryUIViewController view](self, "view");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "selectionManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[PXPhotosDragController initWithContentView:selectionManager:assetCollectionActionManager:delegate:](v33, "initWithContentView:selectionManager:assetCollectionActionManager:delegate:", v34, v35, v32, self);
        -[PXCuratedLibraryUIViewController setEmptyPlaceholderDragController:](self, "setEmptyPlaceholderDragController:", v36);

        -[PXCuratedLibraryUIViewController setEmptyPlaceholderStatusController:](self, "setEmptyPlaceholderStatusController:", v18);
        -[PXStatusController configuration](v18, "configuration");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCuratedLibraryUIViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v37);

      }
    }
    else if ((objc_msgSend(v4, "libraryState") & 2) != 0)
    {
      objc_msgSend(v3, "gridView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[PXCuratedLibraryUIViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
        -[PXCuratedLibraryUIViewController _invalidateEmptyPlaceholder](self, "_invalidateEmptyPlaceholder");
        objc_msgSend(v3, "gridView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCuratedLibraryUIViewController _addContentView:](self, "_addContentView:", v12);

        objc_msgSend(v3, "gridView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "scrollViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scrollView");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        -[PXCuratedLibraryUIViewController _setObservableScrollView:forEdges:](self, "_setObservableScrollView:forEdges:", v15, 5);
      }
    }
    else
    {
      PLCuratedLibraryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v38[0] = 0;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "Not showing empty placeholder or grid: No results.", (uint8_t *)v38, 2u);
      }

    }
  }
}

- (PXGView)gridView
{
  void *v2;
  void *v3;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGView *)v3;
}

- (PXCuratedLibraryViewProvider)viewProviderIfLoaded
{
  return self->_viewProvider;
}

- (void)_updateSecondaryToolbar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;

  -[PXCuratedLibraryUIViewController secondaryToolbarController](self, "secondaryToolbarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "showSecondaryToolbar"))
  {

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "wantsZoomControlVisible");

  if (!v7)
  {
LABEL_6:
    objc_msgSend(v3, "setContentView:", 0);
    goto LABEL_16;
  }
  objc_msgSend(v5, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "secondaryToolbarStyle");

  -[PXCuratedLibraryUIViewController _updateSecondaryToolbarLegibilityGradient](self, "_updateSecondaryToolbarLegibilityGradient");
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "secondaryToolbarAlwaysVisible");

  if (v11)
  {
    -[PXCuratedLibraryUIViewController zoomLevelControl](self, "zoomLevelControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v3;
    v14 = v12;
LABEL_14:
    objc_msgSend(v13, "setContentView:", v14);
    goto LABEL_15;
  }
  objc_msgSend(v4, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isSelecting");
  objc_msgSend(v12, "currentContentFilterState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isFiltering");

  if (v9)
    v18 = 0;
  else
    v18 = v17;
  if ((v15 & 1) != 0 || v18)
  {
    v13 = v3;
    v14 = 0;
    goto LABEL_14;
  }
  -[PXCuratedLibraryUIViewController zoomLevelControl](self, "zoomLevelControl");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentView:", v19);

LABEL_15:
LABEL_16:
  -[PXCuratedLibraryUIViewController _updateSecondaryToolbarStyle](self, "_updateSecondaryToolbarStyle");
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scrollViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentScrollViewController:", v21);

  objc_msgSend(v3, "updateIfNeeded");
  objc_msgSend(v3, "containerViewAdditionalEdgeInsets");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[PXCuratedLibraryUIViewController emptyPlaceholderStatusController](self, "emptyPlaceholderStatusController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v23 = *MEMORY[0x1E0DC49E8];
    v25 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v29 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAdditionalSafeAreaInsets:", v23, v25, v27, v29);

  objc_msgSend(v4, "viewModel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "styleGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "secondaryToolbarPlacement");

  objc_msgSend(v4, "footerController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __59__PXCuratedLibraryUIViewController__updateSecondaryToolbar__block_invoke;
  v37[3] = &unk_1E51221B0;
  v38 = v3;
  v39 = v34;
  v40 = v23;
  v41 = v25;
  v42 = v27;
  v43 = v29;
  v36 = v3;
  objc_msgSend(v35, "performChanges:", v37);

}

- (PXCuratedLibrarySecondaryToolbarController)secondaryToolbarController
{
  return self->_secondaryToolbarController;
}

void __59__PXCuratedLibraryUIViewController__updateSecondaryToolbar__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if ((unint64_t)(*(_QWORD *)(a1 + 40) - 1) > 1)
    v3 = 0;
  else
    v3 = objc_msgSend(*(id *)(a1 + 32), "isSecondaryToolbarVisible");
  objc_msgSend(v4, "setWantsFooterMask:", v3);
  objc_msgSend(v4, "setFooterMaskVerticalOffset:", *(double *)(a1 + 64) * 0.25);

}

- (PXCuratedLibraryZoomLevelControl)zoomLevelControl
{
  return self->_zoomLevelControl;
}

- (PXStatusController)emptyPlaceholderStatusController
{
  return self->_emptyPlaceholderStatusController;
}

- (void)setEmptyPlaceholderDragController:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPlaceholderDragController, a3);
}

- (void)_invalidateEmptyPlaceholder
{
  void *v3;

  if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    -[PXCuratedLibraryUIViewController _removeEmptyPlaceholderSwitchLibraryButton](self, "_removeEmptyPlaceholderSwitchLibraryButton");
  -[PXCuratedLibraryUIViewController setEmptyPlaceholderStatusController:](self, "setEmptyPlaceholderStatusController:", 0);
  -[PXCuratedLibraryUIViewController setStatusController:](self, "setStatusController:", 0);
  -[PXCuratedLibraryUIViewController emptyPlaceholderDragController](self, "emptyPlaceholderDragController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromView");

  -[PXCuratedLibraryUIViewController setEmptyPlaceholderDragController:](self, "setEmptyPlaceholderDragController:", 0);
}

- (void)setStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_statusController, a3);
}

- (void)setEmptyPlaceholderStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPlaceholderStatusController, a3);
}

- (void)_removeEmptyPlaceholderSwitchLibraryButton
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v3 = *MEMORY[0x1E0DC3298];
  v4 = *(double *)(MEMORY[0x1E0DC3298] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  -[PXCuratedLibraryUIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDirectionalLayoutMargins:", v3, v4, v5, v6);

  -[PXCuratedLibraryUIViewController emptyPlaceholderSwitchLibraryButtonTrailingConstraint](self, "emptyPlaceholderSwitchLibraryButtonTrailingConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 0);

  -[PXCuratedLibraryUIViewController setEmptyPlaceholderSwitchLibraryButtonTrailingConstraint:](self, "setEmptyPlaceholderSwitchLibraryButtonTrailingConstraint:", 0);
  -[PXCuratedLibraryUIViewController emptyPlaceholderSwitchLibraryButtonBottomConstraint](self, "emptyPlaceholderSwitchLibraryButtonBottomConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 0);

  -[PXCuratedLibraryUIViewController setEmptyPlaceholderSwitchLibraryButtonBottomConstraint:](self, "setEmptyPlaceholderSwitchLibraryButtonBottomConstraint:", 0);
  -[PXCuratedLibraryUIViewController emptyPlaceholderSwitchLibraryButton](self, "emptyPlaceholderSwitchLibraryButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[PXCuratedLibraryUIViewController setEmptyPlaceholderSwitchLibraryButton:](self, "setEmptyPlaceholderSwitchLibraryButton:", 0);
  -[PXCuratedLibraryUIViewController emptyPlaceholderSwitchLibraryBarButtonItem](self, "emptyPlaceholderSwitchLibraryBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v16 = v11;
    -[PXCuratedLibraryUIViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v12, "rightBarButtonItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

    if (objc_msgSend(v15, "containsObject:", v16))
      objc_msgSend(v15, "removeObject:", v16);
    objc_msgSend(v12, "setRightBarButtonItems:", v15);
    -[PXCuratedLibraryUIViewController setEmptyPlaceholderSwitchLibraryBarButtonItem:](self, "setEmptyPlaceholderSwitchLibraryBarButtonItem:", 0);

    v11 = v16;
  }

}

- (void)setEmptyPlaceholderSwitchLibraryButtonTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPlaceholderSwitchLibraryButtonTrailingConstraint, a3);
}

- (void)setEmptyPlaceholderSwitchLibraryButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPlaceholderSwitchLibraryButtonBottomConstraint, a3);
}

- (void)setEmptyPlaceholderSwitchLibraryButton:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPlaceholderSwitchLibraryButton, a3);
}

- (UIButton)emptyPlaceholderSwitchLibraryButton
{
  return self->_emptyPlaceholderSwitchLibraryButton;
}

- (NSLayoutConstraint)emptyPlaceholderSwitchLibraryButtonTrailingConstraint
{
  return self->_emptyPlaceholderSwitchLibraryButtonTrailingConstraint;
}

- (NSLayoutConstraint)emptyPlaceholderSwitchLibraryButtonBottomConstraint
{
  return self->_emptyPlaceholderSwitchLibraryButtonBottomConstraint;
}

- (UIBarButtonItem)emptyPlaceholderSwitchLibraryBarButtonItem
{
  return self->_emptyPlaceholderSwitchLibraryBarButtonItem;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController viewDidAppear:](&v18, sel_viewDidAppear_, a3);
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performChanges:", &__block_literal_global_205_78086);
  objc_msgSend(v4, "videoPlaybackController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsContentViewVisible:", 1);
  objc_msgSend(v6, "setIsOneUpVisible:", 0);
  objc_initWeak(&location, self);
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__PXCuratedLibraryUIViewController_viewDidAppear___block_invoke_2;
  v15[3] = &unk_1E5148D30;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "scheduleMainQueueTask:", v15);

  -[PXCuratedLibraryUIViewController userActivityController](self, "userActivityController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(v4, "eventTracker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logViewControllerDidAppear:", self);

  -[PXCuratedLibraryUIViewController filterTipController](self, "filterTipController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCuratedLibraryIsVisible:", 1);

  -[PXCuratedLibraryUIViewController _invalidateBannerView](self, "_invalidateBannerView");
  -[PXCuratedLibraryUIViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXAppIntentsRegisterViewAnnotationView(v12);

  PXRegisterAppIntentsViewAnnotationDelegate(self);
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __50__PXCuratedLibraryUIViewController_viewDidAppear___block_invoke_3;
  v14[3] = &unk_1E5149198;
  v14[4] = self;
  objc_msgSend(v13, "scheduleTaskAfterCATransactionCommits:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PXCuratedLibraryUIViewController filterTipController](self, "filterTipController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didLayoutAnchorView");

  -[PXCuratedLibraryUIViewController _updateDrawerButtonVisibility](self, "_updateDrawerButtonVisibility");
  -[PXCuratedLibraryUIViewController _invalidateBannerView](self, "_invalidateBannerView");
  -[PXCuratedLibraryUIViewController _updateEmptyPlaceholder](self, "_updateEmptyPlaceholder");
}

- (PXCuratedLibraryFilterTipController)filterTipController
{
  return self->_filterTipController;
}

- (void)_invalidateBannerView
{
  PXBannerView *bannerView;

  -[PXBannerView removeFromSuperview](self->_bannerView, "removeFromSuperview");
  bannerView = self->_bannerView;
  self->_bannerView = 0;

  -[PXCuratedLibraryUIViewController _updateBannerView](self, "_updateBannerView");
}

- (PXAssetSelectionUserActivityController)userActivityController
{
  return self->_userActivityController;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performChanges:", &__block_literal_global_202);
  -[PXCuratedLibraryUIViewController barsController](self, "barsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateIfNeeded");

  -[PXCuratedLibraryUIViewController _updateDrawerButtonVisibility](self, "_updateDrawerButtonVisibility");
}

- (PXCuratedLibraryBarsController)barsController
{
  return self->_barsController;
}

- (void)_updateBannerView
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PXBannerView *bannerView;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  PXBannerView *v34;
  PXBannerView *v35;
  void *v36;
  void *v37;
  void *v38;
  PXBannerView *v39;
  void *v40;
  void *v41;
  id v42;

  -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bannerViewConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend(v6, "window"), (v10 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v11 = (void *)v10,
        -[PXCuratedLibraryUIViewController view](self, "view"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v6 == v12))
  {
    bannerView = self->_bannerView;
    if (!bannerView)
    {
      -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 833, CFSTR("Nil navigation controller!"));

      }
      v39 = [PXBannerView alloc];
      -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "navigationBar");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bounds");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "viewModel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "specManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "spec");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "allPhotosFloatingHeaderSpec");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "contentPadding");
      v34 = -[PXBannerView initWithFrame:padding:](v39, "initWithFrame:padding:", v18, v20, v22, v24, v30, v31, v32, v33);
      v35 = self->_bannerView;
      self->_bannerView = v34;

      -[PXBannerView setDelegate:](self->_bannerView, "setDelegate:", self);
      bannerView = self->_bannerView;
    }
    -[PXBannerView setConfiguration:](bannerView, "setConfiguration:", v9);
    -[PXCuratedLibraryUIViewController _hideNavigationBarItems:](self, "_hideNavigationBarItems:", 1);
    -[PXBannerView superview](self->_bannerView, "superview");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      -[PXBannerView layoutIfNeeded](self->_bannerView, "layoutIfNeeded");
      objc_msgSend(v4, "standardAppearance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setScrollEdgeAppearance:", v37);

      objc_msgSend(v4, "addSubview:", self->_bannerView);
      v14 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    -[PXBannerView superview](self->_bannerView, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "setScrollEdgeAppearance:", 0);
      -[PXBannerView removeFromSuperview](self->_bannerView, "removeFromSuperview");
      v14 = 0;
LABEL_6:
      -[PXCuratedLibraryUIViewController _hideNavigationBarItems:](self, "_hideNavigationBarItems:", v14);
    }
  }

}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollEdgeAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a3;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidatePresentingGeometry");

  -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentViewDidScroll");

  objc_msgSend(v4, "videoPlaybackController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visibleRectDidChange");

  -[PXCuratedLibraryUIViewController hoverGesture](self, "hoverGesture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_cancel");

  objc_msgSend(v16, "visibleOrigin");
  if (v10 < 0.0 && (objc_msgSend(v16, "isManuallyChanging") & 1) == 0 && objc_msgSend(v5, "zoomLevel") == 4)
  {
    objc_msgSend(v16, "contentBounds");
    v12 = v11;
    v14 = v13;
    if ((PXSizeIsEmpty() & 1) == 0)
    {
      if (MEMORY[0x1A85CD5B8](objc_msgSend(v16, "visibleRect"), v12, v14))
      {
        objc_msgSend(v4, "assetsDataSourceManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "forceAllPhotosAccurateIfNeeded");

      }
    }
  }
  if (objc_msgSend(v16, "isDragging"))
    -[PXCuratedLibraryUIViewController _setWantsOptionalChromeVisible:changeReason:](self, "_setWantsOptionalChromeVisible:changeReason:", 0, 2);

}

- (PXCuratedLibrarySkimmingController)skimmingController
{
  void *v3;
  int v4;
  PXCuratedLibraryAssetCollectionSkimmingModel *v5;
  void *v6;
  void *v7;
  PXCuratedLibraryAssetCollectionSkimmingModel *v8;
  PXCuratedLibrarySkimmingController *v9;
  PXCuratedLibrarySkimmingController *skimmingController;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  if (!self->_skimmingController)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "enableSkimmingInYears");

    if (v4)
    {
      v5 = [PXCuratedLibraryAssetCollectionSkimmingModel alloc];
      -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PXCuratedLibraryAssetCollectionSkimmingModel initWithViewModel:](v5, "initWithViewModel:", v7);

      v9 = -[PXCuratedLibrarySkimmingController initWithSkimmingModel:]([PXCuratedLibrarySkimmingController alloc], "initWithSkimmingModel:", v8);
      skimmingController = self->_skimmingController;
      self->_skimmingController = v9;

      -[PXCuratedLibrarySkimmingController setDelegate:](self->_skimmingController, "setDelegate:", self);
      -[PXCuratedLibraryUIViewController _updateSkimmingSlideshowEnabled](self, "_updateSkimmingSlideshowEnabled");
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0DC46F0];
      v13 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke;
      v24[3] = &unk_1E51441D8;
      objc_copyWeak(&v25, &location);
      v14 = (id)objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", v12, 0, 0, v24);
      v15 = *MEMORY[0x1E0DC4608];
      v22[0] = v13;
      v22[1] = 3221225472;
      v22[2] = __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke_2;
      v22[3] = &unk_1E51441D8;
      objc_copyWeak(&v23, &location);
      v16 = (id)objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", v15, 0, 0, v22);
      v17 = *MEMORY[0x1E0DC45B0];
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke_3;
      v20[3] = &unk_1E51441D8;
      objc_copyWeak(&v21, &location);
      v18 = (id)objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", v17, 0, 0, v20);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);

      objc_destroyWeak(&location);
    }
  }
  return self->_skimmingController;
}

- (UIHoverGestureRecognizer)hoverGesture
{
  return self->_hoverGesture;
}

- (void)_updateSkimmingSlideshowEnabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableSlideshowInYears");

  if ((_DWORD)v4)
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "specManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "spec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "allowsSlideshowInYears");

    if (v9)
    {
      -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "presentedZoomLevel") == 1)
      {
        objc_msgSend(v11, "libraryBodyLayout");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "composition");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v11, "libraryBodyLayout");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "composition");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v16, "presentedNumberOfColumns");
          if (v17 != 1)
            goto LABEL_8;
        }
      }
      if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
LABEL_8:
        v4 = 0;
      else
        v4 = !UIAccessibilityIsReduceMotionEnabled();

    }
    else
    {
      v4 = 0;
    }
  }
  -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSkimmingSlideshowEnabled:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXSharedLibraryStatusProvider *v7;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  PXLibraryFilterState *v9;
  PXLibraryFilterState *libraryFilterState;
  void *v11;
  void *v12;
  PXPhotosPointerController *v13;
  PXPhotosPointerController *pointerController;
  PXSwipeSelectionManager *v15;
  void *v16;
  void *v17;
  void *v18;
  PXSwipeSelectionManager *v19;
  PXSwipeSelectionManager *swipeSelectionManager;
  void *v21;
  PXCuratedLibraryBarsController *v22;
  PXCuratedLibraryBarsController *barsController;
  void *v24;
  PXHitTestTransparentView *v25;
  void *v26;
  UIView *v27;
  UIView *secondaryToolbarContainerView;
  PXCuratedLibrarySecondaryToolbarController *v29;
  UIView *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  PXCuratedLibrarySecondaryToolbarController *v34;
  PXCuratedLibrarySecondaryToolbarController *secondaryToolbarController;
  void *v36;
  void *v37;
  PXPhotosDragController *v38;
  void *v39;
  void *v40;
  PXPhotosDragController *v41;
  PXPhotosDragController *dragController;
  PXCuratedLibraryZoomLevelControl *v43;
  PXCuratedLibraryZoomLevelControl *zoomLevelControl;
  PXAssetSelectionUserActivityController *v45;
  void *v46;
  PXAssetSelectionUserActivityController *v47;
  PXAssetSelectionUserActivityController *userActivityController;
  void *v49;
  void *v50;
  PXCuratedLibraryZoomLevelPinchFilter *v51;
  PXCuratedLibraryZoomLevelPinchFilter *zoomLevelPinchFilter;
  void *v53;
  void *v54;
  PXViewControllerDismissalInteractionController *v55;
  PXViewControllerDismissalInteractionController *dismissalInteractionController;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  PXProgrammaticNavigationDestination *v62;
  void *v63;
  void *v64;
  BOOL v65;
  PXProgrammaticNavigationDestination *v66;
  void *v67;
  uint64_t v68;
  PXProgrammaticNavigationRequest *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  PXCuratedLibraryFilterTipController *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  PXCuratedLibraryFilterTipController *v79;
  PXCuratedLibraryFilterTipController *filterTipController;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  id *v89;
  id *v90;
  void *v91;
  PXPhotoKitAssetCollectionActionManager *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[4];
  id v106;
  id location;
  objc_super v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v108.receiver = self;
  v108.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController viewDidLoad](&v108, sel_viewDidLoad);
  -[PXCuratedLibraryUIViewController _setIgnoresWrapperViewForContentOverlayInsets:](self, "_setIgnoresWrapperViewForContentOverlayInsets:", 1);
  -[PXCuratedLibraryUIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setIgnoresLayerTransformForSafeAreaInsets:", 1);

  -[PXCuratedLibraryUIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController legibilityContainerView](self, "legibilityContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleGuide");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedLibraryStatusProvider");
  v7 = (PXSharedLibraryStatusProvider *)objc_claimAutoreleasedReturnValue();
  sharedLibraryStatusProvider = self->_sharedLibraryStatusProvider;
  self->_sharedLibraryStatusProvider = v7;

  -[PXSharedLibraryStatusProvider registerChangeObserver:context:](self->_sharedLibraryStatusProvider, "registerChangeObserver:context:", self, PXSharedLibraryStatusProviderObservationContext_78090);
  objc_msgSend(v6, "libraryFilterState");
  v9 = (PXLibraryFilterState *)objc_claimAutoreleasedReturnValue();
  libraryFilterState = self->_libraryFilterState;
  self->_libraryFilterState = v9;

  -[PXLibraryFilterState registerChangeObserver:context:](self->_libraryFilterState, "registerChangeObserver:context:", self, PXLibraryFilterStateObservationContext_78091);
  -[PXCuratedLibraryUIViewController _updateBackgroundColor](self, "_updateBackgroundColor");
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController _updateEmptyPlaceholder](self, "_updateEmptyPlaceholder");
  -[UIViewController px_enableOneUpPresentation](self, "px_enableOneUpPresentation");
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  -[PXCuratedLibraryUIViewController _prepareGestureRecognizers](self, "_prepareGestureRecognizers");
  objc_msgSend(v98, "scrollViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scrollView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PXPhotosPointerController initWithContentView:delegate:]([PXPhotosPointerController alloc], "initWithContentView:delegate:", v97, self);
  pointerController = self->_pointerController;
  self->_pointerController = v13;

  v15 = [PXSwipeSelectionManager alloc];
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "selectionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PXSwipeSelectionManager initWithSelectionManager:scrollView:](v15, "initWithSelectionManager:scrollView:", v18, v97);
  swipeSelectionManager = self->_swipeSelectionManager;
  self->_swipeSelectionManager = v19;

  -[PXSwipeSelectionManager setDelegate:](self->_swipeSelectionManager, "setDelegate:", self);
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contextMenuInteraction");
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v98, "addInteraction:", v95);
  -[UIViewController px_enableBarAppearance](self, "px_enableBarAppearance");
  v22 = -[PXCuratedLibraryBarsController initWithCuratedLibraryViewController:viewModel:]([PXCuratedLibraryBarsController alloc], "initWithCuratedLibraryViewController:viewModel:", self, v6);
  barsController = self->_barsController;
  self->_barsController = v22;

  -[PXCuratedLibraryBarsController setDelegate:](self->_barsController, "setDelegate:", self);
  objc_msgSend(v6, "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v24, "enableSecondaryToolbarContainerView");

  if ((_DWORD)v17)
  {
    v25 = [PXHitTestTransparentView alloc];
    -[PXCuratedLibraryUIViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    v27 = -[PXHitTestTransparentView initWithFrame:](v25, "initWithFrame:");
    secondaryToolbarContainerView = self->_secondaryToolbarContainerView;
    self->_secondaryToolbarContainerView = v27;

  }
  v29 = [PXCuratedLibrarySecondaryToolbarController alloc];
  v30 = self->_secondaryToolbarContainerView;
  if (v30)
  {
    v31 = self->_secondaryToolbarContainerView;
  }
  else
  {
    -[PXCuratedLibraryUIViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v30 == 0;
  -[PXCuratedLibraryUIViewController legibilityContainerView](self, "legibilityContainerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PXCuratedLibrarySecondaryToolbarController initWithContainerView:legibilityContainerView:viewModel:](v29, "initWithContainerView:legibilityContainerView:viewModel:", v31, v33, v6);
  secondaryToolbarController = self->_secondaryToolbarController;
  self->_secondaryToolbarController = v34;

  if (v32)
  objc_msgSend(v6, "assetsDataSourceManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "dataSourceForZoomLevel:", 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "firstAssetCollection");
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = -[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", v93, 0);
  v38 = [PXPhotosDragController alloc];
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[PXPhotosDragController initWithContentView:selectionManager:assetCollectionActionManager:delegate:](v38, "initWithContentView:selectionManager:assetCollectionActionManager:delegate:", v39, v40, v92, self);
  dragController = self->_dragController;
  self->_dragController = v41;

  v43 = -[PXCuratedLibraryZoomLevelControl initWithViewModel:styleGuide:]([PXCuratedLibraryZoomLevelControl alloc], "initWithViewModel:styleGuide:", v6, v94);
  zoomLevelControl = self->_zoomLevelControl;
  self->_zoomLevelControl = v43;

  -[PXCuratedLibraryZoomLevelControl setDelegate:](self->_zoomLevelControl, "setDelegate:", self);
  -[PXCuratedLibraryUIViewController _updateSecondaryToolbar](self, "_updateSecondaryToolbar");
  -[PXCuratedLibraryUIViewController _updateSecondaryToolbarAccessoryViews](self, "_updateSecondaryToolbarAccessoryViews");
  v45 = [PXAssetSelectionUserActivityController alloc];
  objc_msgSend(v6, "selectionManager");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[PXAssetSelectionUserActivityController initWithSelectionManager:](v45, "initWithSelectionManager:", v46);
  userActivityController = self->_userActivityController;
  self->_userActivityController = v47;

  objc_msgSend(v98, "scrollViewController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "registerObserver:", self);

  objc_msgSend(v96, "footerController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setDelegate:", self);

  v51 = objc_alloc_init(PXCuratedLibraryZoomLevelPinchFilter);
  zoomLevelPinchFilter = self->_zoomLevelPinchFilter;
  self->_zoomLevelPinchFilter = v51;

  objc_msgSend(v6, "actionManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setPerformerDelegate:", self);

  objc_msgSend(v6, "configuration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v45) = objc_msgSend(v54, "allowedInteractiveDismissBehaviors") == 0;

  if ((v45 & 1) == 0)
  {
    v55 = -[PXViewControllerDismissalInteractionController initWithViewController:]([PXViewControllerDismissalInteractionController alloc], "initWithViewController:", self);
    dismissalInteractionController = self->_dismissalInteractionController;
    self->_dismissalInteractionController = v55;

    -[PXCuratedLibraryUIViewController _updateDismissalInteractionControllerProperties](self, "_updateDismissalInteractionControllerProperties");
  }
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = PXCuratedLibrarySaveCurrentAllPhotosScrollPositionNotificationName;
  v59 = MEMORY[0x1E0C809B0];
  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = __47__PXCuratedLibraryUIViewController_viewDidLoad__block_invoke;
  v105[3] = &unk_1E51441D8;
  v89 = &v106;
  objc_copyWeak(&v106, &location);
  v60 = (id)objc_msgSend(v57, "addObserverForName:object:queue:usingBlock:", v58, 0, 0, v105);

  -[PXCuratedLibraryUIViewController setIsGridViewReady:](self, "setIsGridViewReady:", 1);
  -[PXCuratedLibraryUIViewController initialNavigationRequest](self, "initialNavigationRequest");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "destination");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v91, "type") == 1 && !objc_msgSend(v91, "revealMode", &v106)
    || !v61
    || !-[PXCuratedLibraryUIViewController routingOptionsForDestination:](self, "routingOptionsForDestination:", v91))
  {
    v62 = -[PXProgrammaticNavigationDestination initWithType:revealMode:]([PXProgrammaticNavigationDestination alloc], "initWithType:revealMode:", 1, 3);
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "launchToSavedAllPhotosScrollPosition"))
    {
      objc_msgSend(v63, "savedAllPhotosScrollPositionAnchorAssetIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v64 == 0;

      if (!v65)
      {
        v66 = [PXProgrammaticNavigationDestination alloc];
        objc_msgSend(v63, "savedAllPhotosScrollPositionAnchorAssetIdentifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = -[PXProgrammaticNavigationDestination initWithType:revealMode:assetUUID:assetCollectionUUID:](v66, "initWithType:revealMode:assetUUID:assetCollectionUUID:", 5, 2, v67, 0);

        v62 = (PXProgrammaticNavigationDestination *)v68;
      }
    }
    v69 = -[PXProgrammaticNavigationRequest initWithDestination:options:completionHandler:]([PXProgrammaticNavigationRequest alloc], "initWithDestination:options:completionHandler:", v62, 0, 0);

    v61 = v69;
  }
  -[PXCuratedLibraryUIViewController setInitialNavigationRequest:](self, "setInitialNavigationRequest:", 0, v89);
  PXProgrammaticNavigationRequestExecute(v61, self);
  -[UIViewController px_splitViewController](self, "px_splitViewController");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "registerChangeObserver:", self);
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "viewModel");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v59;
  v103[1] = 3221225472;
  v103[2] = __47__PXCuratedLibraryUIViewController_viewDidLoad__block_invoke_2;
  v103[3] = &unk_1E5143468;
  v73 = v70;
  v104 = v73;
  objc_msgSend(v72, "performChanges:", v103);

  v74 = [PXCuratedLibraryFilterTipController alloc];
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "viewModel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "layout");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = -[PXCuratedLibraryFilterTipController initWithViewModel:layout:](v74, "initWithViewModel:layout:", v76, v78);
  filterTipController = self->_filterTipController;
  self->_filterTipController = v79;

  -[PXCuratedLibraryFilterTipController setDelegate:](self->_filterTipController, "setDelegate:", self);
  -[PXCuratedLibraryUIViewController traitCollection](self, "traitCollection");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryFilterTipController setTraitCollection:](self->_filterTipController, "setTraitCollection:", v81);

  +[PXGridTipsHelper setTipsPresentationDelegate:](PXGridTipsHelper, "setTipsPresentationDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 0x100000, sel_openParentWithCommandUpArrow_);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController addKeyCommand:](self, "addKeyCommand:", v82);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4D90], 0x100000, sel_openSelectionWithCommandDownArrow_);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController addKeyCommand:](self, "addKeyCommand:", v83);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_cancelSelectMode_);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController addKeyCommand:](self, "addKeyCommand:", v84);

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  -[PXSwipeSelectionManager keyCommandsForSelectionExtension](self->_swipeSelectionManager, "keyCommandsForSelectionExtension");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
  if (v86)
  {
    v87 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v86; ++i)
      {
        if (*(_QWORD *)v100 != v87)
          objc_enumerationMutation(v85);
        -[PXCuratedLibraryUIViewController addKeyCommand:](self, "addKeyCommand:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i));
      }
      v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
    }
    while (v86);
  }

  objc_destroyWeak(v90);
  objc_destroyWeak(&location);

}

- (PXCuratedLibraryViewProvider)viewProvider
{
  PXCuratedLibraryViewProvider *viewProvider;
  PXCuratedLibraryViewProvider *v4;
  void *v5;
  void *v6;
  PXCuratedLibraryViewProvider *v7;
  PXCuratedLibraryViewProvider *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  viewProvider = self->_viewProvider;
  if (!viewProvider)
  {
    v4 = [PXCuratedLibraryViewProvider alloc];
    -[PXCuratedLibraryUIViewController configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXCuratedLibraryViewProvider initWithConfiguration:extendedTraitCollection:](v4, "initWithConfiguration:extendedTraitCollection:", v5, v6);
    v8 = self->_viewProvider;
    self->_viewProvider = v7;

    -[PXCuratedLibraryViewProvider setAxNextResponder:](self->_viewProvider, "setAxNextResponder:", self);
    -[PXCuratedLibraryViewProvider viewModel](self->_viewProvider, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performInitialChanges:", &__block_literal_global_78124);
    objc_msgSend(v9, "registerChangeObserver:context:", self, PXCuratedLibraryViewModelObserverContext_78120);
    objc_msgSend(v9, "styleGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerChangeObserver:context:", self, PXCuratedLibraryStyleGuideObserverContext);

    objc_msgSend(v9, "zoomablePhotosViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerChangeObserver:context:", self, PXZoomablePhotosViewModelObservationContext);

    objc_msgSend(v9, "cplUIStatusProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController setCplUIStatusProvider:](self, "setCplUIStatusProvider:", v12);

    viewProvider = self->_viewProvider;
  }
  return viewProvider;
}

- (void)_updateDrawerButtonVisibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  -[UIViewController px_splitViewController](self, "px_splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v18 = v3;
    -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v18, "isSidebarVisible");
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "wantsNavigationBarVisible");

    objc_msgSend(v8, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldShowEmptyPlaceholder");

    objc_msgSend(v6, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[PXCuratedLibraryUIViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (v6 == v14) & ~v7 & v10 & (v12 ^ 1u);

    }
    else
    {
      v15 = 0;
    }

    if (objc_msgSend(v18, "displayModeButtonVisibility") != v15)
    {
      objc_msgSend(v18, "setDisplayModeButtonVisibility:", v15);
      -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "navigationBar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setNeedsLayout");

    }
    v3 = v18;
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[PXCuratedLibraryUIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  -[PXCuratedLibraryUIViewController legibilityClipInsets](self, "legibilityClipInsets");
  PXEdgeInsetsInsetRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXCuratedLibraryUIViewController legibilityContainerView](self, "legibilityContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[PXCuratedLibraryUIViewController _invalidateSecondaryToolbar](self, "_invalidateSecondaryToolbar");
  -[PXCuratedLibraryUIViewController dismissalInteractionController](self, "dismissalInteractionController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewControllerViewWillLayoutSubviews");

}

- (void)setIsGridViewReady:(BOOL)a3
{
  self->_isGridViewReady = a3;
}

- (void)setInitialNavigationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_initialNavigationRequest, a3);
}

- (void)setCplUIStatusProvider:(id)a3
{
  PXCPLUIStatusProvider *v5;
  PXCPLUIStatusProvider *cplUIStatusProvider;
  void *v7;
  PXCPLUIStatusProvider *v8;

  v5 = (PXCPLUIStatusProvider *)a3;
  cplUIStatusProvider = self->_cplUIStatusProvider;
  v8 = v5;
  if (cplUIStatusProvider != v5)
  {
    -[PXCPLUIStatusProvider unregisterChangeObserver:context:](cplUIStatusProvider, "unregisterChangeObserver:context:", self, PXCPLUIStatusProviderObservationContext_78034);
    objc_storeStrong((id *)&self->_cplUIStatusProvider, a3);
    -[PXCPLUIStatusProvider registerChangeObserver:context:](self->_cplUIStatusProvider, "registerChangeObserver:context:", self, PXCPLUIStatusProviderObservationContext_78034);
    -[PXCuratedLibraryUIViewController statusController](self, "statusController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStatusProvider:", v8);

  }
}

- (PXCPLStatusController)statusController
{
  return self->_statusController;
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "zoomLevel");
  if ((unint64_t)(v5 - 2) >= 5)
  {
    if (v5 == 1)
    {
      v11 = v8;

      if (v11)
      {
        v9 = 1;
        goto LABEL_5;
      }
    }
    else
    {

    }
    if (!objc_msgSend(v4, "isTargetingAsset")
      || (objc_msgSend(v4, "isTargetingAlbum") & 1) != 0
      || !+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      v9 = 0;
      goto LABEL_5;
    }
    objc_msgSend(v4, "assetCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (v12)
    {
      v9 = objc_msgSend(v12, "px_isAllPhotosSmartAlbum");
      goto LABEL_4;
    }
  }
  else
  {

  }
  v9 = 1;
LABEL_4:

LABEL_5:
  return v9;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  PXProgrammaticNavigationRequest *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a5;
  v10 = -[PXProgrammaticNavigationRequest initWithDestination:options:completionHandler:]([PXProgrammaticNavigationRequest alloc], "initWithDestination:options:completionHandler:", v8, a4, v9);
  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performChanges:", &__block_literal_global_415);

  if (objc_msgSend(v8, "isTargetingAsset"))
  {
    -[PXCuratedLibraryUIViewController _navigateToRevealAssetForNavigationRequest:](self, "_navigateToRevealAssetForNavigationRequest:", v10);
  }
  else if (objc_msgSend(v8, "revealMode") == 3)
  {
    -[PXCuratedLibraryUIViewController _navigateToInitialScrollPositionForNavigationRequest:](self, "_navigateToInitialScrollPositionForNavigationRequest:", v10);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__PXCuratedLibraryUIViewController_navigateToDestination_options_completionHandler___block_invoke_2;
    v13[3] = &unk_1E5148A40;
    v14 = v9;
    -[PXCuratedLibraryUIViewController _navigateToZoomLevelForNavigationRequest:successHandler:](self, "_navigateToZoomLevelForNavigationRequest:successHandler:", v10, v13);

  }
}

- (PXProgrammaticNavigationRequest)initialNavigationRequest
{
  return self->_initialNavigationRequest;
}

- (void)_navigateToZoomLevelForNavigationRequest:(id)a3 successHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[PXCuratedLibraryUIViewController isGridViewReady](self, "isGridViewReady"))
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "zoomLevel");
    objc_msgSend(v6, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
    switch(objc_msgSend(v11, "type"))
    {
      case 1:

        v12 = v10;
        if (v10)
          goto LABEL_13;
        goto LABEL_7;
      case 2:
        goto LABEL_12;
      case 3:
        v12 = 2;
        goto LABEL_12;
      case 4:
        v12 = 3;
        goto LABEL_12;
      case 5:
      case 6:
        v12 = 4;
LABEL_12:

LABEL_13:
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __92__PXCuratedLibraryUIViewController__navigateToZoomLevelForNavigationRequest_successHandler___block_invoke;
        v16[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
        v16[4] = v12;
        objc_msgSend(v9, "performChanges:", v16);
        if (v12 == v10)
          v7[2](v7);
        else
          dispatch_async(MEMORY[0x1E0C80D38], v7);
        break;
      default:

LABEL_7:
        PXAssertGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "destination");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v18 = v15;
          _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Curated library couldn't navigate to destination %@", buf, 0xCu);

        }
        objc_msgSend(v6, "completionHandler");
        v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v14[2](v14, 2, 0);

        break;
    }

  }
  else
  {
    -[PXCuratedLibraryUIViewController _rescheduleNavigationRequest:](self, "_rescheduleNavigationRequest:", v6);
  }

}

void __89__PXCuratedLibraryUIViewController__navigateToInitialScrollPositionForNavigationRequest___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __89__PXCuratedLibraryUIViewController__navigateToInitialScrollPositionForNavigationRequest___block_invoke_2;
  v2[3] = &unk_1E5148B78;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_scrollLibraryViewToInitialPositionWithCompletionHandler:", v2);

}

- (void)_scrollLibraryViewToInitialPositionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  if (-[PXCuratedLibraryUIViewController isGridViewReady](self, "isGridViewReady"))
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetsDataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performChanges:", &__block_literal_global_319);
    -[PXCuratedLibraryUIViewController gridView](self, "gridView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopScrollingAndZoomingAnimations");

    objc_msgSend(v5, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createAnchorForScrollingToInitialPosition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "autoInvalidate");

    objc_msgSend(v5, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "zoomLevel") == 4)
    {
      objc_msgSend(v12, "zoomablePhotosViewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "performChanges:", &__block_literal_global_321_78002);

    }
    if (v4)
    {
      -[PXCuratedLibraryUIViewController gridView](self, "gridView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __93__PXCuratedLibraryUIViewController__scrollLibraryViewToInitialPositionWithCompletionHandler___block_invoke_3;
      v15[3] = &unk_1E5148A40;
      v16 = v4;
      objc_msgSend(v14, "installLayoutCompletionHandler:", v15);

    }
    goto LABEL_9;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Can't scroll library view to initial position"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v5);
LABEL_9:

  }
}

- (BOOL)isGridViewReady
{
  return self->_isGridViewReady;
}

- (void)_navigateToInitialScrollPositionForNavigationRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__PXCuratedLibraryUIViewController__navigateToInitialScrollPositionForNavigationRequest___block_invoke;
  v6[3] = &unk_1E5148D08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXCuratedLibraryUIViewController _navigateToZoomLevelForNavigationRequest:successHandler:](self, "_navigateToZoomLevelForNavigationRequest:successHandler:", v5, v6);

}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;

  -[PXCuratedLibraryUIViewController _contentUnavailableConfiguration](self, "_contentUnavailableConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "wantsDarkStatusBar"))
    v7 = 3;
  else
    v7 = 1;

  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle");

  if (v9 == 2)
    return 1;
  else
    return v7;
}

- (id)px_navigationDestination
{
  return -[PXProgrammaticNavigationDestination initWithType:revealMode:]([PXProgrammaticNavigationDestination alloc], "initWithType:revealMode:", 1, 0);
}

- (void)_addContentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[PXCuratedLibraryUIViewController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  objc_msgSend(v4, "setFrame:");
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v9);

  objc_msgSend(v4, "setAutoresizingMask:", 18);
  -[PXCuratedLibraryUIViewController legibilityContainerView](self, "legibilityContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSubview:belowSubview:", v4, v10);

}

uint64_t __93__PXCuratedLibraryUIViewController__scrollLibraryViewToInitialPositionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__PXCuratedLibraryUIViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "splitBehavior") == 2)
    v3 = 1;
  else
    v3 = objc_msgSend(*(id *)(a1 + 32), "isSidebarVisible") ^ 1;
  objc_msgSend(v4, "setSidebarCanBecomeVisible:", v3);

}

void __89__PXCuratedLibraryUIViewController__navigateToInitialScrollPositionForNavigationRequest___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "completionHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v6;
  if (a2)
    v7 = 1;
  else
    v7 = 2;
  (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v7, v5);

}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController viewLayoutMarginsDidChange](&v4, sel_viewLayoutMarginsDidChange);
  -[PXCuratedLibraryUIViewController secondaryToolbarController](self, "secondaryToolbarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

void __48__PXCuratedLibraryUIViewController_viewProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setCplActionManagerClass:", objc_opt_class());

}

- (PXCuratedLibraryUIViewController)initWithPhotoLibrary:(id)a3
{
  return -[PXCuratedLibraryUIViewController initWithPhotoLibrary:initialZoomLevel:](self, "initWithPhotoLibrary:initialZoomLevel:", a3, 0);
}

- (PXCuratedLibraryUIViewController)initWithConfiguration:(id)a3
{
  id v4;
  PXCuratedLibraryUIViewController *v5;
  uint64_t v6;
  PXCuratedLibraryViewConfiguration *configuration;
  UIView *v8;
  UIView *legibilityContainerView;
  uint64_t v10;
  PHPhotoLibrary *photoLibrary;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXCuratedLibraryUIViewController;
  v5 = -[PXCuratedLibraryUIViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (PXCuratedLibraryViewConfiguration *)v6;

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    legibilityContainerView = v5->_legibilityContainerView;
    v5->_legibilityContainerView = v8;

    -[UIView setClipsToBounds:](v5->_legibilityContainerView, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v5->_legibilityContainerView, "setUserInteractionEnabled:", 0);
    objc_msgSend(v4, "photoLibrary");
    v10 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v10;

    -[UIViewController px_enableExtendedTraitCollection](v5, "px_enableExtendedTraitCollection");
    -[UIViewController px_extendedTraitCollection](v5, "px_extendedTraitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "swift_propagateEnvironmentValuesToExtendedTraitCollection:", v12);

  }
  return v5;
}

- (PXCuratedLibraryUIViewController)initWithPhotoLibrary:(id)a3 initialZoomLevel:(int64_t)a4
{
  id v6;
  PXCuratedLibraryViewConfiguration *v7;
  PXCuratedLibraryUIViewController *v8;

  v6 = a3;
  v7 = -[PXCuratedLibraryViewConfiguration initWithPhotoLibrary:]([PXCuratedLibraryViewConfiguration alloc], "initWithPhotoLibrary:", v6);

  -[PXCuratedLibraryViewConfiguration setInitialZoomLevel:](v7, "setInitialZoomLevel:", a4);
  v8 = -[PXCuratedLibraryUIViewController initWithConfiguration:](self, "initWithConfiguration:", v7);

  return v8;
}

- (PXCuratedLibraryUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 303, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryUIViewController initWithNibName:bundle:]");

  abort();
}

- (PXCuratedLibraryUIViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 307, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryUIViewController initWithCoder:]");

  abort();
}

- (void)setNavigatedAssetReference:(id)a3
{
  PXAssetReference *v5;
  char v6;
  PXAssetReference *v7;

  v7 = (PXAssetReference *)a3;
  v5 = self->_navigatedAssetReference;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXAssetReference isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_navigatedAssetReference, a3);
      -[PXCuratedLibraryUIViewController setPreferredFocusAssetReference:](self, "setPreferredFocusAssetReference:", v7);
    }
  }

}

- (void)setLegibilityClipInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_legibilityClipInsets;
  id v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_legibilityClipInsets = &self->_legibilityClipInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_legibilityClipInsets->top = top;
    p_legibilityClipInsets->left = left;
    p_legibilityClipInsets->bottom = bottom;
    p_legibilityClipInsets->right = right;
    -[PXCuratedLibraryUIViewController viewIfLoaded](self, "viewIfLoaded");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
}

- (void)setIsCollapsed:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  if (self->_isCollapsed != a3)
  {
    v3 = a3;
    self->_isCollapsed = a3;
    -[PXCuratedLibraryUIViewController _updateSecondaryToolbarLegibilityGradient](self, "_updateSecondaryToolbarLegibilityGradient");
    if (v3)
    {
      +[PXGridTipsHelper filterAllPhotosTipID](PXGridTipsHelper, "filterAllPhotosTipID");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      +[PXGridTipsHelper setTip:isPresentable:](PXGridTipsHelper, "setTip:isPresentable:", v4, 0);

    }
  }
}

- (void)_conditionallyUpdateEmptyPlaceholder
{
  void *v3;

  -[PXCuratedLibraryUIViewController emptyPlaceholderStatusController](self, "emptyPlaceholderStatusController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PXCuratedLibraryUIViewController _updateEmptyPlaceholder](self, "_updateEmptyPlaceholder");
}

- (id)_emptyPlaceholderMessageTextAttributesFromTextProperties:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC1290];
  v4 = a3;
  objc_msgSend(v3, "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setAlignment:", 1);
  objc_msgSend(v6, "setLineBreakMode:", objc_msgSend(v4, "lineBreakMode"));
  v11[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(v4, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(v4, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[2] = *MEMORY[0x1E0DC1178];
  v12[1] = v8;
  v12[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)_emptyPlaceholderswitchLibraryButtonTrailingInset
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allPhotosFloatingHeaderSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentPadding");
  v8 = v7;

  return v8;
}

- (double)_emptyPlaceholderswitchLibraryButtonVerticalSpacing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[PXCuratedLibraryUIViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarFrame");
  if (v6 <= 0.0)
    v7 = 2.0;
  else
    v7 = 8.0;

  return v7;
}

- (void)_updateViewLayoutMarginsForEmptyPlaceholder
{
  double v3;
  double v4;
  id v5;

  -[PXCuratedLibraryUIViewController _emptyPlaceholderswitchLibraryButtonVerticalSpacing](self, "_emptyPlaceholderswitchLibraryButtonVerticalSpacing");
  v4 = v3 * 2.0 + 28.0;
  -[PXCuratedLibraryUIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDirectionalLayoutMargins:", v4, 0.0, 0.0, 0.0);

}

- (void)_updateEmptyPlaceholderSwitchLibraryButtonPosition
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  -[PXCuratedLibraryUIViewController _updateViewLayoutMarginsForEmptyPlaceholder](self, "_updateViewLayoutMarginsForEmptyPlaceholder");
  -[PXCuratedLibraryUIViewController _emptyPlaceholderswitchLibraryButtonTrailingInset](self, "_emptyPlaceholderswitchLibraryButtonTrailingInset");
  v4 = -v3;
  -[PXCuratedLibraryUIViewController emptyPlaceholderSwitchLibraryButtonTrailingConstraint](self, "emptyPlaceholderSwitchLibraryButtonTrailingConstraint");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constant");
  v6 = v5;
  if (v5 != v4)
    objc_msgSend(v12, "setConstant:", v4);
  -[PXCuratedLibraryUIViewController _emptyPlaceholderswitchLibraryButtonVerticalSpacing](self, "_emptyPlaceholderswitchLibraryButtonVerticalSpacing");
  v8 = -v7;
  -[PXCuratedLibraryUIViewController emptyPlaceholderSwitchLibraryButtonBottomConstraint](self, "emptyPlaceholderSwitchLibraryButtonBottomConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constant");
  if (v10 != v8)
  {
    objc_msgSend(v9, "setConstant:", v8);
LABEL_6:
    -[PXCuratedLibraryUIViewController viewIfLoaded](self, "viewIfLoaded");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

    goto LABEL_7;
  }
  if (v6 != v4)
    goto LABEL_6;
LABEL_7:

}

- (void)_addEmptyPlaceholderSwitchLibraryButtonForCompactSizeClass
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
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "sizeClass") == 1)
  {
    -[PXCuratedLibraryUIViewController _updateViewLayoutMarginsForEmptyPlaceholder](self, "_updateViewLayoutMarginsForEmptyPlaceholder");
    -[PXCuratedLibraryUIViewController view](self, "view");
    v26 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController libraryFilterState](self, "libraryFilterState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryCreateSwitchLibraryButton(v8, objc_msgSend(v9, "hasPreview"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "addSubview:", v10);
    v11 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v10, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintGreaterThanOrEqualToConstant:", 28.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    objc_msgSend(v10, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintGreaterThanOrEqualToConstant:", 28.0);
    v27 = v3;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v16);

    objc_msgSend(v10, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController _emptyPlaceholderswitchLibraryButtonTrailingInset](self, "_emptyPlaceholderswitchLibraryButtonTrailingInset");
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setActive:", 1);
    objc_msgSend(v10, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController _emptyPlaceholderswitchLibraryButtonVerticalSpacing](self, "_emptyPlaceholderswitchLibraryButtonVerticalSpacing");
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, -v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v27;
    objc_msgSend(v25, "setActive:", 1);
    -[PXCuratedLibraryUIViewController setEmptyPlaceholderSwitchLibraryButton:](self, "setEmptyPlaceholderSwitchLibraryButton:", v10);
    -[PXCuratedLibraryUIViewController setEmptyPlaceholderSwitchLibraryButtonTrailingConstraint:](self, "setEmptyPlaceholderSwitchLibraryButtonTrailingConstraint:", v20);
    -[PXCuratedLibraryUIViewController setEmptyPlaceholderSwitchLibraryButtonBottomConstraint:](self, "setEmptyPlaceholderSwitchLibraryButtonBottomConstraint:", v25);

    v4 = v26;
  }

}

- (void)_addEmptyPlaceholderSwitchLibraryButtonForRegularSizeClass
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
  id v13;
  void *v14;
  void *v15;
  id v16;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "sizeClass") == 2)
  {
    -[PXCuratedLibraryUIViewController emptyPlaceholderSwitchLibraryBarButtonItem](self, "emptyPlaceholderSwitchLibraryBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[PXCuratedLibraryUIViewController libraryFilterState](self, "libraryFilterState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryUIViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PXSharedLibraryCreateSwitchLibraryButton(v7, objc_msgSend(v8, "hasPreview"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v9);
      -[PXCuratedLibraryUIViewController setEmptyPlaceholderSwitchLibraryBarButtonItem:](self, "setEmptyPlaceholderSwitchLibraryBarButtonItem:", v10);

    }
    -[PXCuratedLibraryUIViewController emptyPlaceholderSwitchLibraryBarButtonItem](self, "emptyPlaceholderSwitchLibraryBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v12, "rightBarButtonItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

    if ((objc_msgSend(v15, "containsObject:", v11) & 1) == 0)
    {
      objc_msgSend(v15, "addObject:", v11);
      objc_msgSend(v12, "setRightBarButtonItems:", v15);
    }

  }
}

- (void)_setContentUnavailableConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController _setContentUnavailableConfiguration:](&v4, sel__setContentUnavailableConfiguration_, a3);
  -[PXCuratedLibraryUIViewController _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_updateBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryUIViewController _contentUnavailableConfiguration](self, "_contentUnavailableConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v9, "contentUnavailableBackgroundColor");
  else
    objc_msgSend(v9, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

}

- (void)_hideNavigationBarItems:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForceFullHeightInLandscape:", v3);

  if (v3)
    v7 = 3;
  else
    v7 = 0;
  -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequestedContentSize:", v7);

  -[PXCuratedLibraryUIViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v10, "setTitleView:", v11);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v10, "leftBarButtonItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "setHidden:", v3);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v10, "rightBarButtonItems", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "setHidden:", v3);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController viewWillDisappear:](&v13, sel_viewWillDisappear_, a3);
  v4 = -[PXCuratedLibraryUIViewController isViewLoaded](self, "isViewLoaded");
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isDecelerating") & 1) != 0 || objc_msgSend(v6, "isDragging"))
  {
    v7 = -[PXCuratedLibraryUIViewController trackedScrollContext](self, "trackedScrollContext");
    +[PXCuratedLibraryAnimationTracker scrollAnimationDidEndWithScrollContext:](PXCuratedLibraryAnimationTracker, "scrollAnimationDidEndWithScrollContext:", v7, v8);
  }
  +[PXCuratedLibraryAnimationTracker sharedTracker](PXCuratedLibraryAnimationTracker, "sharedTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoomLevelTransitionsDidEndEarly");

  -[PXCuratedLibraryUIViewController filterTipController](self, "filterTipController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCuratedLibraryIsVisible:", 0);

  if (-[PXCuratedLibraryUIViewController isViewLoaded](self, "isViewLoaded"))
    -[PXCuratedLibraryUIViewController _updateDrawerButtonVisibility](self, "_updateDrawerButtonVisibility");
  if (v4 != -[PXCuratedLibraryUIViewController isViewLoaded](self, "isViewLoaded"))
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_1A6789000, v11, OS_LOG_TYPE_FAULT, "viewWillDisappear should not cause the view to load", v12, 2u);
    }

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController viewDidDisappear:](&v11, sel_viewDidDisappear_, a3);
  v4 = -[PXCuratedLibraryUIViewController isViewLoaded](self, "isViewLoaded");
  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoPlaybackController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsContentViewVisible:", 0);

  -[PXCuratedLibraryUIViewController userActivityController](self, "userActivityController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 0);

  objc_msgSend(v5, "eventTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logViewControllerDidDisappear:", self);

  if (-[PXCuratedLibraryUIViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (-[PXCuratedLibraryUIViewController isInUnselectedTab](self, "isInUnselectedTab"))
      -[PXCuratedLibraryUIViewController _setWantsOptionalChromeVisible:changeReason:](self, "_setWantsOptionalChromeVisible:changeReason:", 1, 0);
    -[PXCuratedLibraryUIViewController _invalidateBannerView](self, "_invalidateBannerView");
  }
  PXUnregisterAppIntentsViewAnnotationDelegate(self);
  if (v4 != -[PXCuratedLibraryUIViewController isViewLoaded](self, "isViewLoaded"))
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_fault_impl(&dword_1A6789000, v9, OS_LOG_TYPE_FAULT, "viewDidDisappear should not cause the view to load", v10, 2u);
    }

  }
}

- (BOOL)isInUnselectedTab
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;

  -[PXCuratedLibraryUIViewController tabBarController](self, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "selectedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !-[UIViewController px_isDescendantOfViewController:](self, "px_isDescendantOfViewController:", v5);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryUIViewController;
  -[PXCuratedLibraryUIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PXCuratedLibraryUIViewController _setWantsOptionalChromeVisible:changeReason:](self, "_setWantsOptionalChromeVisible:changeReason:", 0, 3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXCuratedLibraryUIViewController;
  v4 = a3;
  -[PXCuratedLibraryUIViewController traitCollectionDidChange:](&v15, sel_traitCollectionDidChange_, v4);
  -[PXCuratedLibraryUIViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[PXCuratedLibraryUIViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "zoomLevel");

  if (v9 == 1)
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gridView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__PXCuratedLibraryUIViewController_traitCollectionDidChange___block_invoke;
    v14[3] = &unk_1E5149198;
    v14[4] = self;
    objc_msgSend(v11, "installLayoutCompletionHandler:", v14);

  }
  -[PXCuratedLibraryUIViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController filterTipController](self, "filterTipController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTraitCollection:", v12);

  if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    -[PXCuratedLibraryUIViewController _invalidateEmptyPlaceholder](self, "_invalidateEmptyPlaceholder");
    -[PXCuratedLibraryUIViewController _updateEmptyPlaceholder](self, "_updateEmptyPlaceholder");
  }
}

- (void)px_containedViewControllerModalStateChanged
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUIViewController;
  -[UIViewController px_containedViewControllerModalStateChanged](&v4, sel_px_containedViewControllerModalStateChanged);
  -[PXCuratedLibraryUIViewController dismissalInteractionController](self, "dismissalInteractionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containedViewControllerModalStateChanged");

}

- (void)setDidAppearInitially:(BOOL)a3
{
  if (self->_didAppearInitially != a3)
  {
    self->_didAppearInitially = a3;
    -[PXCuratedLibraryUIViewController _updateSecondaryToolbarAccessoryViews](self, "_updateSecondaryToolbarAccessoryViews");
  }
}

- (void)setCanShowFooter:(BOOL)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 canShowFooter;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_canShowFooter != a3)
  {
    self->_canShowFooter = a3;
    PLCuratedLibraryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v6 = v4;
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      canShowFooter = self->_canShowFooter;
      v13[0] = 67109120;
      v13[1] = canShowFooter;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "canShowFooter", "value: %i", (uint8_t *)v13, 8u);
    }

    if (self->_canShowFooter)
    {
      -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "footerController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performChanges:", &__block_literal_global_225);

    }
    v11 = v7;
    v12 = v11;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(v13[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_END, v5, "canShowFooter", ", (uint8_t *)v13, 2u);
    }

  }
}

- (void)_updateIsModalInPresentation
{
  void *v3;
  id v4;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController px_setModalInPresentation:](self, "px_setModalInPresentation:", objc_msgSend(v3, "isModalInPresentation"));

}

- (void)_updateSecondaryToolbarLegibilityGradient
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (-[PXCuratedLibraryUIViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "secondaryToolbarStyle");

    if (v6)
      v7 = -[PXCuratedLibraryUIViewController isCollapsed](self, "isCollapsed") ^ 1;
    else
      v7 = 0;
    -[PXCuratedLibraryUIViewController secondaryToolbarController](self, "secondaryToolbarController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLegibilityGradientEnabled:", v7);

  }
}

- (void)_updateSecondaryToolbarStyle
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  __int128 v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryUIViewController secondaryToolbarController](self, "secondaryToolbarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXCuratedLibraryUIViewController _updateSecondaryToolbarAccessoryViewStyles](self, "_updateSecondaryToolbarAccessoryViewStyles");
    objc_msgSend(v5, "secondaryToolbarVisibility");
    v7 = v6;
    objc_msgSend(v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0.0001;
    if (v7 >= 0.0001)
      v9 = v7;
    if (!v8)
      v9 = 0.0;
    objc_msgSend(v3, "setAlpha:", v9);
    objc_msgSend(v5, "specManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "wantsBlurredSecondaryToolbarTransition");

    if (v12)
    {
      PXFloatByLinearlyInterpolatingFloats();
      v14 = v13;
      PXFloatByLinearlyInterpolatingFloats();
      v16 = v15;
      objc_msgSend(v3, "toolbarContainerView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "filters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setName:", CFSTR("gaussianBlur"));
        objc_msgSend(v21, "setValue:forKey:", CFSTR("default"), *MEMORY[0x1E0CD2D88]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValue:forKey:", v22, *MEMORY[0x1E0CD2D90]);

        v32[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFilters:", v23);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValue:forKeyPath:", v24, CFSTR("filters.gaussianBlur.inputRadius"));

      objc_msgSend(v3, "height");
      v26 = v25 * 0.5;
      v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v31.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v31.c = v27;
      *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      *(_OWORD *)&v30.a = *(_OWORD *)&v31.a;
      *(_OWORD *)&v30.c = v27;
      *(_OWORD *)&v30.tx = *(_OWORD *)&v31.tx;
      CGAffineTransformTranslate(&v31, &v30, 0.0, -(v25 * 0.5));
      v29 = v31;
      CGAffineTransformScale(&v30, &v29, v14, v14);
      v31 = v30;
      v29 = v30;
      CGAffineTransformTranslate(&v30, &v29, 0.0, v26);
      v31 = v30;
      v28 = v30;
      objc_msgSend(v17, "setTransform:", &v28);

    }
  }

}

- (void)_updateSecondaryToolbarAccessoryViews
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (-[PXCuratedLibraryUIViewController didAppearInitially](self, "didAppearInitially"))
    goto LABEL_3;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExpandedInitially");

  if (v6)
  {
LABEL_3:
    -[PXCuratedLibraryUIViewController configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "secondaryToolbarStyle");

    if (v8 == 1)
    {
      -[PXCuratedLibraryUIViewController filterButtonController](self, "filterButtonController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "button");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      -[PXCuratedLibraryUIViewController closeButtonController](self, "closeButtonController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "button");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
      v11 = 0;
    }
    -[PXCuratedLibraryUIViewController secondaryToolbarController](self, "secondaryToolbarController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLeadingAccessoryView:", v13);
    objc_msgSend(v12, "setTrailingAccessoryView:", v11);
    -[PXCuratedLibraryUIViewController _updateSecondaryToolbarAccessoryViewStyles](self, "_updateSecondaryToolbarAccessoryViewStyles");

  }
}

- (void)_updateSecondaryToolbarAccessoryViewStyles
{
  void *v3;
  void *v4;
  id v5;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[PXCuratedLibraryFilterToggleButtonController foregroundColorOverLegibilityGradient:](PXCuratedLibraryFilterToggleButtonController, "foregroundColorOverLegibilityGradient:", objc_msgSend(v5, "secondaryToolbarLegibilityGradientIsVisible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosCloseButtonController setForegroundColor:](self->_closeButtonController, "setForegroundColor:", v4);

}

- (void)_updateStatusBarStyle
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v3, "statusBarGradientAndStyleFadeDuration");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PXCuratedLibraryUIViewController__updateStatusBarStyle__block_invoke;
  v5[3] = &unk_1E5149198;
  v5[4] = self;
  objc_msgSend(v4, "animateWithDuration:animations:", v5);

}

- (void)_updateDismissalInteractionControllerProperties
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;

  -[PXCuratedLibraryUIViewController dismissalInteractionController](self, "dismissalInteractionController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowedInteractiveDismissBehaviors");

  objc_msgSend(v7, "setSwipeDownAllowed:", v6 & 1);
  objc_msgSend(v7, "setSwipeUpAllowed:", (v6 >> 1) & 1);

}

- (void)_updateTrackedScrollLevelIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = -[PXCuratedLibraryUIViewController trackedScrollContext](self, "trackedScrollContext");
  v5 = v4;
  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "zoomLevel");
  v8 = objc_msgSend(v9, "scrollRegime");
  if (v3)
    +[PXCuratedLibraryAnimationTracker scrollAnimationDidEndWithScrollContext:](PXCuratedLibraryAnimationTracker, "scrollAnimationDidEndWithScrollContext:", v3, v5);
  if (v7)
    +[PXCuratedLibraryAnimationTracker scrollAnimationDidBeginWithScrollContext:](PXCuratedLibraryAnimationTracker, "scrollAnimationDidBeginWithScrollContext:", v7, v8);
  -[PXCuratedLibraryUIViewController setTrackedScrollContext:](self, "setTrackedScrollContext:", v7, v8);

}

- (void)_requestFocusUpdateForCursorAsset
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0u;
  v11 = 0u;
  if (v5)
  {
    objc_msgSend(v5, "cursorIndexPath");
    v6 = v10;
  }
  else
  {
    v6 = 0;
  }
  if (v6 != *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(v5, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v10;
    v9[1] = v11;
    objc_msgSend(v7, "objectReferenceAtIndexPath:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXCuratedLibraryUIViewController _requestFocusUpdateWithAssetReference:](self, "_requestFocusUpdateWithAssetReference:", v8);
  }

}

- (void)_requestFocusUpdateWithAssetReference:(id)a3
{
  id v4;

  -[PXCuratedLibraryUIViewController setPreferredFocusAssetReference:](self, "setPreferredFocusAssetReference:", a3);
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestFocusUpdateToEnvironment:", self);

}

- (void)_requestExpansionIfNeeded
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isSelecting") & 1) == 0)
  {
    -[PXCuratedLibraryUIViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v8, "selectionSnapshot");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PXCuratedLibraryUIViewController wasAnyItemSelected](self, "wasAnyItemSelected")
        && objc_msgSend(v6, "isAnyItemSelected"))
      {
        -[PXCuratedLibraryUIViewController delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "curatedLibraryViewControllerExpand:", self);

      }
      -[PXCuratedLibraryUIViewController setWasAnyItemSelected:](self, "setWasAnyItemSelected:", objc_msgSend(v6, "isAnyItemSelected"));

    }
  }

}

- (id)_scrollView
{
  void *v2;
  void *v3;
  void *v4;

  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_regionOfInterestForAssetReference:(id)a3 image:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v15 = 0;
  v6 = a3;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    v10 = &v15;
  else
    v10 = 0;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXRegionOfInterestForAssetReference(v7, v9, v6, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v15)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (void)_saveCurrentAllPhotosScrollPosition
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PXCuratedLibraryUIViewController *v11;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "zoomLevel");

  if (v5 == 4)
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__PXCuratedLibraryUIViewController__saveCurrentAllPhotosScrollPosition__block_invoke;
    v9[3] = &unk_1E5126A20;
    v10 = v7;
    v11 = self;
    v8 = v7;
    objc_msgSend(v8, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v9);

  }
}

- (CGRect)_rectForEllipsisActionPerformerButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingHeaderLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ellipsisButtonActionPerformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonSpriteReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "regionOfInterestForSpriteReference:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rectInCoordinateSpace:", v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)_buttonForEllipsisButtonAction
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingHeaderLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ellipsisButtonActionPerformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spriteReferenceForObjectReference:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewForSpriteReference:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 1560, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[self.gridView viewForSpriteReference:spriteReference]"), v14, v13);

    }
  }

  return v10;
}

- (PXCuratedLibraryFilterToggleButtonController)filterButtonController
{
  PXCuratedLibraryFilterToggleButtonController *filterButtonController;
  void *v4;
  PXCuratedLibraryFilterToggleButtonController *v5;
  void *v6;
  void *v7;
  PXCuratedLibraryFilterToggleButtonController *v8;
  PXCuratedLibraryFilterToggleButtonController *v9;

  filterButtonController = self->_filterButtonController;
  if (!filterButtonController)
  {
    -[PXCuratedLibraryUIViewController _toolbarButtonConfigurationWithSymbolName:](self, "_toolbarButtonConfigurationWithSymbolName:", CFSTR("line.3.horizontal.decrease"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [PXCuratedLibraryFilterToggleButtonController alloc];
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXCuratedLibraryFilterToggleButtonController initWithViewModel:buttonConfiguration:](v5, "initWithViewModel:buttonConfiguration:", v7, v4);
    v9 = self->_filterButtonController;
    self->_filterButtonController = v8;

    filterButtonController = self->_filterButtonController;
  }
  return filterButtonController;
}

- (PXPhotosCloseButtonController)closeButtonController
{
  PXPhotosCloseButtonController *closeButtonController;
  void *v4;
  PXPhotosCloseButtonController *v5;
  PXPhotosCloseButtonController *v6;

  closeButtonController = self->_closeButtonController;
  if (!closeButtonController)
  {
    -[PXCuratedLibraryUIViewController _toolbarButtonConfigurationWithSymbolName:](self, "_toolbarButtonConfigurationWithSymbolName:", CFSTR("xmark"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PXPhotosCloseButtonController initWithButtonConfiguration:]([PXPhotosCloseButtonController alloc], "initWithButtonConfiguration:", v4);
    v6 = self->_closeButtonController;
    self->_closeButtonController = v5;

    -[PXPhotosCloseButtonController setDelegate:](self->_closeButtonController, "setDelegate:", self);
    closeButtonController = self->_closeButtonController;
  }
  return closeButtonController;
}

- (id)_toolbarButtonConfigurationWithSymbolName:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3518], "photosViewRoundedAccessoryConfigurationWithSymbolName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PXCuratedLibraryToolbarBackdropGroupName;
  objc_msgSend(v3, "background");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setVisualEffectGroupName:", v4);

  return v3;
}

- (id)pu_debugCurrentlySelectedAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allItemsEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)pu_handleSecondTabTap
{
  -[PXCuratedLibraryUIViewController _scrollToBottomAnimated:](self, "_scrollToBottomAnimated:", 1);
  return 1;
}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  -[PXCuratedLibraryUIViewController _scrollLibraryViewToInitialPositionWithCompletionHandler:](self, "_scrollLibraryViewToInitialPositionWithCompletionHandler:", 0);
  return 1;
}

- (void)_scrollToBottomAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableCustomScrollToTopOrBottom");

  if (!v6
    || !-[PXCuratedLibraryUIViewController _scrollToNextSectionInDirection:animated:](self, "_scrollToNextSectionInDirection:animated:", 1, v3))
  {
    -[PXCuratedLibraryUIViewController _scrollView](self, "_scrollView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_scrollToEdge:animated:", 3, v3);

  }
}

- (void)_handleHover:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  objc_msgSend(v6, "hitTestResultsAtPoint:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController _handleHoverWithHitTestResults:hoverGesture:](self, "_handleHoverWithHitTestResults:hoverGesture:", v5, v4);

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
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "state") != 1 && objc_msgSend(v7, "state") != 2)
    goto LABEL_12;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v9)
  {
LABEL_11:

LABEL_12:
    -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", (_QWORD)v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewModel");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "selectionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performChanges:", &__block_literal_global_279);

    goto LABEL_13;
  }
  v10 = v9;
  v11 = *(_QWORD *)v16;
LABEL_5:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v16 != v11)
      objc_enumerationMutation(v8);
    if (-[PXCuratedLibraryUIViewController _handleHoverWithHitTestResult:](self, "_handleHoverWithHitTestResult:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15))
    {
      break;
    }
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((unint64_t)(objc_msgSend(v5, "control") - 1) > 2)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      objc_msgSend(v5, "assetReference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        || (objc_msgSend(v5, "assetCollectionReference"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "viewModel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = 0u;
        v17 = 0u;
        objc_msgSend(v8, "currentDataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "indexPathForObjectReference:", v6);
        }
        else
        {
          v16 = 0u;
          v17 = 0u;
        }

        objc_msgSend(v8, "selectionManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __66__PXCuratedLibraryUIViewController__handleHoverWithHitTestResult___block_invoke;
        v13[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
        v14 = v16;
        v15 = v17;
        objc_msgSend(v11, "performChanges:", v13);

        LOBYTE(v6) = 1;
      }
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (void)_handleTap:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "state");

    if (v6 != 2
      && !-[PXCuratedLibraryUIViewController _handleTapToToggleChromeWithGestureRecognizer:](self, "_handleTapToToggleChromeWithGestureRecognizer:", v4))
    {
      -[PXCuratedLibraryUIViewController gridView](self, "gridView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v7);
      objc_msgSend(v7, "hitTestResultsAtPoint:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryUIViewController filterTipController](self, "filterTipController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isPresentingTipView"))
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __47__PXCuratedLibraryUIViewController__handleTap___block_invoke;
        v10[3] = &unk_1E51457C8;
        v10[4] = self;
        v11 = v8;
        v12 = v4;
        objc_msgSend(v9, "dismissTipViewWithCompletion:", v10);

      }
      else
      {
        -[PXCuratedLibraryUIViewController _handleTapWithHitTestResults:tapGesture:](self, "_handleTapWithHitTestResults:tapGesture:", v8, v4);
      }

    }
  }

}

- (void)_handleTapWithHitTestResults:(id)a3 tapGesture:(id)a4
{
  id v6;
  id v7;
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
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      if (-[PXCuratedLibraryUIViewController _handleTapWithHitTestResult:keyModifierFlags:](self, "_handleTapWithHitTestResult:keyModifierFlags:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), objc_msgSend(v7, "modifierFlags", (_QWORD)v13)))
      {
        break;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_handlePress:(id)a3
{
  if (!-[PXCuratedLibraryUIViewController _handleGestureForFilterTipController](self, "_handleGestureForFilterTipController", a3))-[PXCuratedLibraryUIViewController _presentOneUpForSingleSelectedAssetWithActivity:](self, "_presentOneUpForSingleSelectedAssetWithActivity:", 1);
}

- (BOOL)_handleTapToToggleChromeWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  int v20;
  int v22;
  char v23;
  CGRect v25;

  v4 = a3;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;

  objc_msgSend(v5, "safeAreaInsets");
  v9 = v8;
  v11 = v10 + 12.5;
  objc_msgSend(v5, "bounds");
  v12 = CGRectGetMaxY(v25) + -12.5 - v9;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "specManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "spec");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "layoutOrientation");
  v18 = objc_msgSend(v16, "sizeClass");
  v19 = v7 <= v12 && v7 >= v11;
  v20 = objc_msgSend(v14, "isSelecting");
  v22 = v17 != 2 || v18 != 1 || v19;
  v23 = v22 | v20;
  if (((v22 | v20) & 1) == 0)
    -[PXCuratedLibraryUIViewController _setWantsOptionalChromeVisible:changeReason:](self, "_setWantsOptionalChromeVisible:changeReason:", objc_msgSend(v14, "wantsOptionalChromeVisible") ^ 1, 1);

  return v23 ^ 1;
}

- (void)_setWantsOptionalChromeVisible:(BOOL)a3 changeReason:(int64_t)a4
{
  double v7;
  _QWORD v8[6];
  BOOL v9;

  if (a3 || !-[PXCuratedLibraryUIViewController isInUnselectedTab](self, "isInUnselectedTab"))
  {
    v7 = *MEMORY[0x1E0DC51A0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__PXCuratedLibraryUIViewController__setWantsOptionalChromeVisible_changeReason___block_invoke;
    v8[3] = &unk_1E512C5E8;
    v9 = a3;
    v8[4] = self;
    v8[5] = a4;
    objc_msgSend(MEMORY[0x1E0DC3F10], "px_animateUsingDefaultDampedEaseInEaseOutWithDuration:animations:completion:", v8, 0, v7);
  }
}

- (BOOL)_handleTapWithHitTestResult:(id)a3 keyModifierFlags:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  char v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v29;
  _QWORD v30[4];
  id v31;
  _OWORD v32[2];
  uint8_t buf[16];
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 0x100000) != 0 && (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      if ((a4 & 0x20000) != 0)
      {
        v10 = 0;
        v12 = objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") ^ 1;
LABEL_10:
        v13 = objc_msgSend(v7, "control");
        if (v13 == 6)
        {
          v11 = -[PXCuratedLibraryUIViewController _handleTapOnTitleWithHitTestResult:](self, "_handleTapOnTitleWithHitTestResult:", v7);
LABEL_40:

          goto LABEL_41;
        }
        if (v13 != 1)
        {
          objc_msgSend(v9, "actionManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "actionPerformerForHitTestResult:", v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v18 != 0;
          if (v18)
            objc_msgSend(v18, "performActionWithCompletionHandler:", 0);

          goto LABEL_40;
        }
        -[PXCuratedLibraryUIViewController dragController](self, "dragController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isDragSessionActive");

        if (v15)
        {
          PLCuratedLibraryGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEBUG, "Ignoring tap since it is handled by the drag interaction.", buf, 2u);
          }
        }
        else
        {
          objc_msgSend(v9, "allowedActions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsObject:", CFSTR("PXCuratedLibraryActionAllPhotosZoomIn"));

          if (v20
            && (objc_msgSend(v8, "zoomablePhotosInteraction"),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v7, "assetReference"),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v29 = objc_msgSend(v21, "handleTapOnAssetReference:", v22),
                v22,
                v21,
                v29))
          {
            objc_msgSend(v8, "layout");
            v16 = objc_claimAutoreleasedReturnValue();
            -[NSObject clearLastVisibleAreaAnchoringInformation](v16, "clearLastVisibleAreaAnchoringInformation");
          }
          else
          {
            if ((v12 & 1) != 0 || !objc_msgSend(v8, "ensureSelectMode"))
            {
              if ((objc_msgSend(v9, "isSelecting") & 1) == 0
                && (!v10 || !objc_msgSend(v8, "ensureSelectMode")))
              {
                objc_msgSend(v7, "assetReference");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[PXCuratedLibraryUIViewController _presentOneUpForAssetReference:configurationHandler:](self, "_presentOneUpForAssetReference:configurationHandler:", v27, 0);
LABEL_39:

                v11 = 1;
                goto LABEL_40;
              }
              PLCuratedLibraryGetLog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109888;
                *(_DWORD *)&buf[4] = v10;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = objc_msgSend(v9, "isSelecting");
                *(_WORD *)&buf[14] = 2048;
                *(_QWORD *)&v34 = a4;
                WORD4(v34) = 1024;
                *(_DWORD *)((char *)&v34 + 10) = objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode");
                _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEBUG, "[PXCuratedLibraryUIViewController] Handling tap wants toggle selection: %i. Select mode enabled: %i. Key modifier flags: %lu. Connected to hardware keyboard: %i.", buf, 0x1Eu);
              }

              v30[0] = MEMORY[0x1E0C809B0];
              v30[1] = 3221225472;
              v30[2] = __81__PXCuratedLibraryUIViewController__handleTapWithHitTestResult_keyModifierFlags___block_invoke;
              v30[3] = &unk_1E5143468;
              v31 = v7;
              objc_msgSend(v9, "performChanges:", v30);

LABEL_38:
              -[UIViewController px_splitViewController](self, "px_splitViewController");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "requestFocusUpdateWithPreferredFocusEnvironment:", self);
              goto LABEL_39;
            }
            PLCuratedLibraryGetLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)&buf[4] = 1;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = objc_msgSend(v9, "isSelecting");
              *(_WORD *)&buf[14] = 2048;
              *(_QWORD *)&v34 = a4;
              WORD4(v34) = 1024;
              *(_DWORD *)((char *)&v34 + 10) = objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode");
              _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEBUG, "[PXCuratedLibraryUIViewController] Handling tap wants range selection: %i. Select mode enabled: %i. Key modifier flags: %lu. Connected to hardware keyboard: %i.", buf, 0x1Eu);
            }

            *(_OWORD *)buf = 0u;
            v34 = 0u;
            objc_msgSend(v7, "assetReference");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v24)
            {
              objc_msgSend(v24, "indexPath");
            }
            else
            {
              *(_OWORD *)buf = 0u;
              v34 = 0u;
            }

            objc_msgSend(v9, "selectionManager");
            v16 = objc_claimAutoreleasedReturnValue();
            v32[0] = *(_OWORD *)buf;
            v32[1] = v34;
            -[NSObject extendSelectionToItemIndexPath:withDelegate:](v16, "extendSelectionToItemIndexPath:withDelegate:", v32, v8);
          }
        }

        goto LABEL_38;
      }
      v10 = 0;
    }
    v12 = 1;
    goto LABEL_10;
  }
  v11 = 0;
LABEL_41:

  return v11;
}

- (BOOL)_handleTapOnTitleWithHitTestResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  double x;
  double y;
  double width;
  double height;
  BOOL IsNull;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  CGRect v28;

  v4 = a3;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollectionReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (objc_msgSend(v6, "presentedZoomLevel") == 3 && v7)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "enableTapOnTitleToScroll");

    if (v10)
    {
      objc_msgSend(v6, "sectionBoundariesForAssetCollectionReference:", v7);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
      IsNull = CGRectIsNull(v28);
      if (!IsNull)
      {
        objc_msgSend(v5, "gridView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "rootLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "convertRect:fromDescendantLayout:", v6, x, y, width, height);
        v19 = v18;
        v21 = v20;

        objc_msgSend(v16, "visibleBounds");
        v23 = v22;
        v25 = v24;
        objc_msgSend(v16, "scrollViewController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "scrollRectToVisible:avoidingContentInsetEdges:animated:", 4, 1, v19, v21, v23, v25);

      }
      v8 = !IsNull;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_scrollToNextSectionInDirection:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  __int128 v17;
  BOOL IsNull;
  void *v19;
  void *v20;
  _QWORD *p_x;
  CGFloat v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double x;
  double y;
  void *v28;
  BOOL v29;
  _QWORD v31[6];
  CGRect v32;
  uint64_t v33;
  CGRect *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  CGRect v39;
  CGRect v40;

  if (!a3)
    return 0;
  v4 = a4;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "presentedZoomLevel") == 3)
  {
    objc_msgSend(v7, "visibleRect");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "safeAreaInsets");
    v39.size.height = v16;
    v39.origin.x = v9;
    v39.origin.y = v11;
    v39.size.width = v13;
    v40 = CGRectInset(v39, 0.0, -1.0);
    v33 = 0;
    v34 = (CGRect *)&v33;
    v35 = 0x4010000000;
    v36 = &unk_1A7E74EE7;
    v17 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v37 = *MEMORY[0x1E0C9D628];
    v38 = v17;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __77__PXCuratedLibraryUIViewController__scrollToNextSectionInDirection_animated___block_invoke;
    v31[3] = &unk_1E5122218;
    v32 = v40;
    v31[4] = &v33;
    v31[5] = a3;
    objc_msgSend(v7, "enumerateSectionBoundariesWithOptions:usingBlock:", ((unint64_t)a3 >> 62) & 2, v31);
    IsNull = CGRectIsNull(v34[1]);
    if (!IsNull)
    {
      objc_msgSend(v6, "gridView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rootLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "convertRect:fromDescendantLayout:", v7, v34[1].origin.x, v34[1].origin.y, v34[1].size.width, v34[1].size.height);
      p_x = (_QWORD *)&v34->origin.x;
      v34[1].origin.x = v22;
      p_x[5] = v23;
      p_x[6] = v24;
      p_x[7] = v25;

      x = v34[1].origin.x;
      y = v34[1].origin.y;
      objc_msgSend(v19, "scrollViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "scrollRectToVisible:avoidingContentInsetEdges:animated:", 4, v4, x, y, v13, v15);

    }
    v29 = !IsNull;
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)_handlePinch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  PXCuratedLibraryUIViewController *v31;

  v24 = a3;
  if (objc_msgSend(v24, "state") == 1)
  {
    -[PXCuratedLibraryUIViewController _scrollView](self, "_scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_cancel");

  }
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allowedActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("PXCuratedLibraryActionNavigateToOneUp"));
  if (!v9
    || (-[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "handlePresentingPinchGestureRecognizer:", v24),
        v10,
        (v11 & 1) == 0))
  {
    v12 = objc_msgSend(v24, "state") != 1 && objc_msgSend(v24, "state") != 2;
    -[PXCuratedLibraryUIViewController zoomLevelPinchFilter](self, "zoomLevelPinchFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController gridView](self, "gridView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "zoomablePhotosInteraction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "handlePinch:", v24);

    if ((v17 & 1) == 0 && !v12)
    {
      objc_msgSend(v24, "velocity");
      if (v18 <= 0.0)
      {
        v17 = 0;
      }
      else
      {
        v17 = 0;
        if ((objc_msgSend(v13, "isTrackingPinch") & 1) == 0 && ((v9 ^ 1) & 1) == 0)
        {
          objc_msgSend(v24, "locationInView:", v14);
          -[PXCuratedLibraryUIViewController _hitTestAssetReferenceAtLocation:inCoordinateSpace:](self, "_hitTestAssetReferenceAtLocation:inCoordinateSpace:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v19 != 0;
          if (v19)
            -[PXCuratedLibraryUIViewController _presentOneUpForAssetReference:configurationHandler:](self, "_presentOneUpForAssetReference:configurationHandler:", v19, &__block_literal_global_286);

        }
      }
    }
    v20 = objc_msgSend(v8, "containsObject:", CFSTR("PXCuratedLibraryActionPinchToSwitchZoomLevel"));
    if (((v17 | v12) & 1) != 0 || !v20)
    {
      objc_msgSend(v13, "reset");
    }
    else
    {
      objc_msgSend(v24, "scale");
      v22 = v21;
      v23 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_2;
      v27[3] = &unk_1E5122288;
      v28 = v14;
      v29 = v24;
      v30 = v7;
      v31 = self;
      v25[0] = v23;
      v25[1] = 3221225472;
      v25[2] = __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_3;
      v25[3] = &unk_1E51438B0;
      v26 = v30;
      objc_msgSend(v13, "filterPinchGestureWithScale:initialPinchHandler:subsequentDirectionChangeHandler:", v27, v25, v22);

    }
  }

}

- (void)_handlePan:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v11, "state");
  if ((unint64_t)(v5 - 3) < 3)
  {
    -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endPanning");
LABEL_9:

    goto LABEL_10;
  }
  if (v5 == 2)
  {
    objc_msgSend(v11, "translationInView:", v4);
    v8 = v7;
    v10 = v9;
    if (objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection") == 1)
      v8 = -v8;
    -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatePanningWithTranslation:", v8, v10);
    goto LABEL_9;
  }
  if (v5 == 1)
  {
    objc_msgSend(v11, "locationInView:", v4);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__PXCuratedLibraryUIViewController__handlePan___block_invoke;
    v12[3] = &unk_1E51222B0;
    v12[4] = self;
    objc_msgSend(v4, "enumerateCuratedLibraryHitTestResultsAtPoint:withControls:usingBlock:", &unk_1E53E91B0, v12);
  }
LABEL_10:

}

- (void)_handleScreenEdgePan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  PXChangeDirectionNumberFilter *v21;
  PXChangeDirectionNumberFilter *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  float v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  _QWORD v41[4];
  id v42;
  _QWORD v43[5];
  _QWORD v44[4];
  PXChangeDirectionNumberFilter *v45;
  _QWORD v46[6];

  v4 = a3;
  if (!-[PXCuratedLibraryUIViewController _handleGestureForFilterTipController](self, "_handleGestureForFilterTipController"))
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController gridView](self, "gridView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController backNavigationTransition](self, "backNavigationTransition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "state");
    if ((unint64_t)(v10 - 3) < 3)
    {
      if (v9)
      {
        -[PXCuratedLibraryUIViewController backNavigationGestureDirectionFilter](self, "backNavigationGestureDirectionFilter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "output");
        v13 = v12;

        if (v13 < 0.0)
        {
          v14 = MEMORY[0x1E0C809B0];
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_7;
          v40[3] = &unk_1E5143468;
          v40[4] = self;
          objc_msgSend(v6, "performChanges:", v40);
          v38[0] = v14;
          v38[1] = 3221225472;
          v38[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_8;
          v38[3] = &unk_1E5149198;
          v39 = v6;
          objc_msgSend(v9, "animateToInitialStateWithCompletionBlock:", v38);
          -[PXCuratedLibraryUIViewController setBackNavigationTransition:](self, "setBackNavigationTransition:", 0);
          v15 = v39;
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        objc_msgSend(v6, "performChanges:", &__block_literal_global_302);
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_5;
        v41[3] = &unk_1E5149198;
        v42 = v6;
        objc_msgSend(v9, "animateToFinalStateWithCompletionBlock:", v41);
        -[PXCuratedLibraryUIViewController setBackNavigationTransition:](self, "setBackNavigationTransition:", 0);
        v15 = v42;
        goto LABEL_17;
      }
LABEL_18:

      goto LABEL_19;
    }
    if (v10 != 2)
    {
      if (v10 == 1)
      {
        v16 = objc_msgSend(v6, "zoomLevel");
        -[PXCuratedLibraryUIViewController setZoomLevelBeforeBackNavigationTransition:](self, "setZoomLevelBeforeBackNavigationTransition:", v16);
        -[PXCuratedLibraryUIViewController zoomLevelControl](self, "zoomLevelControl");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "zoomLevelDisplayedBeforeZoomLevel:", v16);

        objc_msgSend(v7, "createCuratedLibraryLayoutTransitionIfNeededWithContext:", objc_msgSend(v7, "curatedLibraryLayoutAnimationContextForTransitionToZoomLevel:", v18));
        v19 = objc_claimAutoreleasedReturnValue();

        -[PXCuratedLibraryUIViewController setBackNavigationTransition:](self, "setBackNavigationTransition:", v19);
        v20 = MEMORY[0x1E0C809B0];
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke;
        v46[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
        v46[4] = v18;
        objc_msgSend(v6, "performChanges:", v46);
        v21 = objc_alloc_init(PXChangeDirectionNumberFilter);
        -[PXChangeDirectionNumberFilter setMinimumChange:](v21, "setMinimumChange:", 8.0);
        v44[0] = v20;
        v44[1] = 3221225472;
        v44[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_2;
        v44[3] = &unk_1E51222D8;
        v45 = v21;
        v22 = v21;
        -[PXNumberFilter performChanges:](v22, "performChanges:", v44);
        -[PXCuratedLibraryUIViewController setBackNavigationGestureDirectionFilter:](self, "setBackNavigationGestureDirectionFilter:", v22);

        v9 = (void *)v19;
      }
      goto LABEL_18;
    }
    if (!v9)
      goto LABEL_18;
    -[PXCuratedLibraryUIViewController screenEdgePanGestureRecognizer](self, "screenEdgePanGestureRecognizer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "translationDistanceInView:", v8);
    v25 = v24;

    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "enableInteractiveTransition");

    if (v27)
    {
      if (v25 < 100.0)
      {
        -[PXCuratedLibraryUIViewController backNavigationTransition](self, "backNavigationTransition");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v25 / 2000.0;
        *(float *)&v30 = v28;
        objc_msgSend(v29, "setFractionCompleted:", v30);

LABEL_14:
        -[PXCuratedLibraryUIViewController backNavigationGestureDirectionFilter](self, "backNavigationGestureDirectionFilter");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_3;
        v43[3] = &__block_descriptor_40_e33_v16__0___PXMutableNumberFilter__8l;
        *(double *)&v43[4] = v25;
        objc_msgSend(v34, "performChanges:", v43);

        goto LABEL_18;
      }
    }
    else
    {
      +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "swipeBackGestureMinTranslation");
      v33 = v32;

      if (v25 < v33)
        goto LABEL_14;
    }
    -[PXCuratedLibraryUIViewController backNavigationGestureDirectionFilter](self, "backNavigationGestureDirectionFilter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "output");
    v37 = v36;

    if (v37 >= 0.0)
      goto LABEL_16;
    goto LABEL_18;
  }
LABEL_19:

}

- (BOOL)_handleGestureForFilterTipController
{
  void *v2;
  int v3;

  -[PXCuratedLibraryUIViewController filterTipController](self, "filterTipController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresentingTipView");
  if (v3)
    objc_msgSend(v2, "dismissTipViewWithCompletion:", 0);

  return v3;
}

- (void)touchingUIGestureRecognizerDidBeginTouching:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  v14 = a3;
  -[PXCuratedLibraryUIViewController skimmingTouchGesture](self, "skimmingTouchGesture");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("touchingRecognizer == self.skimmingTouchGesture"));

  }
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locationInView:", v6);
  v8 = v7;
  v10 = v9;
  -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "canStartSkimming") & 1) != 0)
  {
    -[PXCuratedLibraryUIViewController _buttonHitTestResultAtPoint:inCoordinateSpace:](self, "_buttonHitTestResultAtPoint:inCoordinateSpace:", v6, v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __80__PXCuratedLibraryUIViewController_touchingUIGestureRecognizerDidBeginTouching___block_invoke;
      v15[3] = &unk_1E51222B0;
      v15[4] = self;
      objc_msgSend(v6, "enumerateCuratedLibraryHitTestResultsAtPoint:withControls:usingBlock:", &unk_1E53E91C8, v15, v8, v10);
    }
  }
  else
  {

  }
}

- (void)touchingUIGestureRecognizerDidEndTouching:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PXCuratedLibraryUIViewController skimmingTouchGesture](self, "skimmingTouchGesture");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("touchingRecognizer == self.skimmingTouchGesture"));

  }
  -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "endTouchingGestureEnded:", objc_msgSend(v10, "state") != 4);

  if (v7)
  {
    -[PXCuratedLibraryUIViewController tapGesture](self, "tapGesture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_cancel");

  }
}

- (id)_hitTestAssetReferenceAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v8, "firstCuratedLibraryHitTestResultsAtPoint:withControl:", 1, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetReference");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_buttonHitTestResultAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__77911;
  v16 = __Block_byref_object_dispose__77912;
  v17 = 0;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__PXCuratedLibraryUIViewController__buttonHitTestResultAtPoint_inCoordinateSpace___block_invoke;
  v11[3] = &unk_1E5122260;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v11);
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allowedActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController panGesture](self, "panGesture");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v4)
  {
    if (objc_msgSend(v7, "containsObject:", CFSTR("PXCuratedLibraryActionSkim")))
    {
      -[PXCuratedLibraryUIViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "velocityInView:", v14);
      v16 = v15;
      v18 = v17;

      v19 = MEMORY[0x1A85CCC64](fabs(v18), fabs(v16));
      +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "horizontalGesturesAngularToleranceInDegrees");
      PXDegreesToRadians();
      v13 = v19 < v21;
LABEL_16:

      goto LABEL_17;
    }
LABEL_11:
    v13 = 0;
    goto LABEL_17;
  }
  -[PXCuratedLibraryUIViewController screenEdgePanGestureRecognizer](self, "screenEdgePanGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    if (objc_msgSend(v7, "containsObject:", CFSTR("PXCuratedLibraryActionNavigateToPreviousZoomLevel")))
    {
      -[PXCuratedLibraryUIViewController zoomLevelControl](self, "zoomLevelControl");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "viewModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v20, "zoomLevelDisplayedBeforeZoomLevel:", objc_msgSend(v23, "zoomLevel")) != 0;

LABEL_14:
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  -[PXCuratedLibraryUIViewController tapGesture](self, "tapGesture");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
    -[PXCuratedLibraryUIViewController gridView](self, "gridView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v20);
    -[PXCuratedLibraryUIViewController _buttonHitTestResultAtPoint:inCoordinateSpace:](self, "_buttonHitTestResultAtPoint:inCoordinateSpace:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24 == 0;

    goto LABEL_16;
  }
  -[PXCuratedLibraryUIViewController pressGesture](self, "pressGesture");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    v25 = (void *)MEMORY[0x1E0DC37E0];
    -[PXCuratedLibraryUIViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "focusSystemForEnvironment:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "focusedItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v26 != 0;

    goto LABEL_14;
  }
  -[PXCuratedLibraryUIViewController pinchGesture](self, "pinchGesture");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    -[PXCuratedLibraryUIViewController swipeSelectionManager](self, "swipeSelectionManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v20, "state") == 0;
    goto LABEL_16;
  }
  v13 = 1;
LABEL_17:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PXCuratedLibraryUIViewController skimmingTouchGesture](self, "skimmingTouchGesture");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[PXCuratedLibraryUIViewController tapGesture](self, "tapGesture");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v10 != v7;

  }
  else
  {
    v9 = 0;
  }
  -[PXCuratedLibraryUIViewController pinchGesture](self, "pinchGesture");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v6)
  {
    -[PXCuratedLibraryUIViewController _scrollView](self, "_scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "panGestureRecognizer");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v7)
      v9 = 1;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  char v12;
  BOOL v13;
  id v15;

  v6 = a3;
  v7 = a4;
  -[PXCuratedLibraryUIViewController panGesture](self, "panGesture");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6)
  {
    v9 = 0;
LABEL_6:

    goto LABEL_7;
  }
  v15 = 0;
  v10 = objc_msgSend(v7, "px_isPanGestureRecognizerOfScrollView:", &v15);
  v11 = v15;
  v9 = v11;
  if (!v10)
    goto LABEL_6;
  v12 = objc_msgSend(v11, "px_scrollableAxis");

  if ((v12 & 1) == 0)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v13 = 1;
LABEL_8:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  void *v4;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  char v20;
  int v21;
  void *v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  -[PXCuratedLibraryUIViewController tapGesture](self, "tapGesture");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v7)
  {
    -[PXCuratedLibraryUIViewController skimmingTouchGesture](self, "skimmingTouchGesture");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v11 == v8;

  }
  else
  {
    v10 = 0;
  }

  -[PXCuratedLibraryUIViewController screenEdgePanGestureRecognizer](self, "screenEdgePanGestureRecognizer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v7)
  {
    -[PXCuratedLibraryUIViewController _scrollView](self, "_scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "panGestureRecognizer");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v8)
      v10 = 1;
  }

  -[PXCuratedLibraryUIViewController hoverGesture](self, "hoverGesture");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 == v7)
  {
    -[PXCuratedLibraryUIViewController _scrollView](self, "_scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "panGestureRecognizer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v16 == v8;

  }
  else
  {
    v15 = 0;
  }

  -[PXCuratedLibraryUIViewController pinchGesture](self, "pinchGesture");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17 == v7)
  {
    v21 = 0;
  }
  else
  {
    -[PXCuratedLibraryUIViewController panGesture](self, "panGesture");
    v18 = objc_claimAutoreleasedReturnValue();
    if ((id)v18 == v7)
    {
      v21 = 0;
      v4 = v7;
    }
    else
    {
      v4 = (void *)v18;
      -[PXCuratedLibraryUIViewController screenEdgePanGestureRecognizer](self, "screenEdgePanGestureRecognizer");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v19 != v7)
      {

        v20 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v21 = 1;
    }
  }
  -[PXCuratedLibraryUIViewController swipeSelectionManager](self, "swipeSelectionManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "gesturesForFailureRequirements");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v23, "containsObject:", v8);

  if (v21)
  if (v17 != v7)
    goto LABEL_20;
LABEL_21:

  return v20 | (v15 || v10);
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  id v4;

  -[PXCuratedLibraryUIViewController setCanShowFooter:](self, "setCanShowFooter:", 1);
  -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentViewWillScroll");

}

- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;

  y = a4.y;
  v9 = a3;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gridView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rootLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:toDescendantLayout:", v11, a5->x, a5->y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v15 = v14;

  v18 = objc_msgSend(v9, "decelerationRate");
  objc_msgSend(v11, "adjustedTargetVisibleTopForProposedTargetVisibleTop:scrollingVelocity:decelerationRate:", &v18, v15, y);
  a5->y = a5->y + v16 - v15;
  objc_msgSend(v9, "setDecelerationRate:", v18);

  +[PXGridTipsHelper filterAllPhotosTipID](PXGridTipsHelper, "filterAllPhotosTipID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXGridTipsHelper setTip:isPresentable:](PXGridTipsHelper, "setTip:isPresentable:", v17, -[PXCuratedLibraryUIViewController isCollapsed](self, "isCollapsed") ^ 1);

}

- (BOOL)scrollViewControllerShouldScrollToTop:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "zoomLevel");

  if (v6 == 4)
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetsDataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceAllPhotosAccurateIfNeeded");

  }
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enableCustomScrollToTopOrBottom");

  if (v10)
    return !-[PXCuratedLibraryUIViewController _scrollToNextSectionInDirection:animated:](self, "_scrollToNextSectionInDirection:animated:", -1, 1);
  else
    return 1;
}

- (BOOL)canResetToInitialState
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v12;

  if (!-[PXCuratedLibraryUIViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAnyItemSelected");

  if ((v6 & 1) != 0)
    return 0;
  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNavigating");

  if ((v9 & 1) != 0
    || -[UIViewController px_containsViewControllerModalInPresentation](self, "px_containsViewControllerModalInPresentation"))
  {
    return 0;
  }
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v12, "state") == 0;

  return v10;
}

- (BOOL)isResetToInitialState
{
  void *v3;
  void *v4;
  char v5;

  if (!-[PXCuratedLibraryUIViewController isViewLoaded](self, "isViewLoaded"))
    return 1;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PXCuratedLibraryUIViewController canResetToInitialState](self, "canResetToInitialState"))
    v5 = objc_msgSend(v4, "isResetToInitialState");
  else
    v5 = 0;

  return v5;
}

- (void)resetToInitialStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (-[PXCuratedLibraryUIViewController canResetToInitialState](self, "canResetToInitialState"))
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "performChanges:", &__block_literal_global_312);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__PXCuratedLibraryUIViewController_resetToInitialStateWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E51417E8;
    v8 = v4;
    -[PXCuratedLibraryUIViewController _scrollLibraryViewToInitialPositionWithCompletionHandler:](self, "_scrollLibraryViewToInitialPositionWithCompletionHandler:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (BOOL)_presentOneUpForAssetReference:(id)a3 configurationHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;

  v6 = a3;
  v7 = a4;
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "canStart"))
    goto LABEL_4;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allowedActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", CFSTR("PXCuratedLibraryActionNavigateToOneUp"));

  if (v12)
  {
    -[PXCuratedLibraryUIViewController setNavigatedAssetReference:](self, "setNavigatedAssetReference:", v6);
    v13 = objc_msgSend(v8, "startWithConfigurationHandler:", v7);
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "videoPlaybackController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIsOneUpVisible:", v13);

    v16 = 1;
  }
  else
  {
LABEL_4:
    v16 = 0;
  }

  return v16;
}

- (void)_presentOneUpForSingleSelectedAssetWithActivity:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isSelecting") & 1) == 0)
  {
    objc_msgSend(v6, "singleSelectedAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __84__PXCuratedLibraryUIViewController__presentOneUpForSingleSelectedAssetWithActivity___block_invoke;
      v8[3] = &__block_descriptor_40_e44_v16__0___PXOneUpPresentationConfiguration__8l;
      v8[4] = a3;
      -[PXCuratedLibraryUIViewController _presentOneUpForAssetReference:configurationHandler:](self, "_presentOneUpForAssetReference:configurationHandler:", v7, v8);
    }

  }
}

- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isSelecting"))
  {
    objc_msgSend(v4, "zoomablePhotosViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isDisplayingIndividualItems");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)swipeSelectionManager:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allowedActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("PXCuratedLibraryActionEnterSelectMode"));

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "zoomLevel");

  if (v11 == 4)
    return 0;
  else
    return v8;
}

- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isSelecting") & 1) == 0)
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performChanges:", &__block_literal_global_322);

  }
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4
{
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  return -[PXCuratedLibraryUIViewController _indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:](self, "_indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:", a4, a5.x, a5.y, *(double *)off_1E50B8010, *((double *)off_1E50B8010 + 1), *((double *)off_1E50B8010 + 2), *((double *)off_1E50B8010 + 3));
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
  -[PXCuratedLibraryUIViewController _indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:](self, "_indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:", v16, x, y, v11, v12, v13, v14);

  return result;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4
{
  double y;
  double x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PXSimpleIndexPath *result;
  id v16;

  y = a5.y;
  x = a5.x;
  v16 = a4;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "padding");

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
  -[PXCuratedLibraryUIViewController _indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:](self, "_indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:", v16, x, y, v11, v12, v13, v14);

  return result;
}

- (PXSimpleIndexPath)_indexPathForAssetAtLocation:(SEL)a3 withPadding:(CGPoint)a4 forSwipeSelectionManager:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double y;
  double x;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  PXSimpleIndexPath *result;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  id v28;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  y = a4.y;
  x = a4.x;
  v28 = a6;
  -[PXCuratedLibraryUIViewController _hitTestResultAtLocation:withPadding:swipeSelectionManager:](self, "_hitTestResultAtLocation:withPadding:swipeSelectionManager:", x, y, top, left, bottom, right);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assetReference");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_6;
  objc_msgSend(v28, "selectionManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dataSourceManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_descriptionForAssertionMessage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2498, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("swipeSelectionManager.selectionManager.dataSourceManager.dataSource"), v25, v27);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2498, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("swipeSelectionManager.selectionManager.dataSourceManager.dataSource"), v25);
  }

LABEL_4:
  objc_msgSend(v19, "assetReferenceForAssetReference:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_6:
    v21 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&retstr->item = v21;
    goto LABEL_7;
  }
  objc_msgSend(v20, "indexPath");

LABEL_7:
  return result;
}

- (id)_hitTestResultAtLocation:(CGPoint)a3 withPadding:(UIEdgeInsets)a4 swipeSelectionManager:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double y;
  double x;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  y = a3.y;
  x = a3.x;
  v12 = a5;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertPoint:fromCoordinateSpace:", v14, x, y);
  v16 = v15;
  v18 = v17;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__77911;
  v27 = __Block_byref_object_dispose__77912;
  v28 = 0;
  objc_msgSend(v13, "hitTestResultsAtPoint:padding:passingTest:", 0, v16, v18, top, left, bottom, right);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __95__PXCuratedLibraryUIViewController__hitTestResultAtLocation_withPadding_swipeSelectionManager___block_invoke;
  v22[3] = &unk_1E5133CA0;
  v22[4] = &v23;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v22);

  v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (id)swipeSelectionManager:(id)a3 indexPathSetFromIndexPath:(PXSimpleIndexPath *)a4 toIndexPath:(PXSimpleIndexPath *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  _OWORD v22[2];
  _OWORD v23[2];

  objc_msgSend(a3, "selectionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2521, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("swipeSelectionManager.selectionManager.dataSourceManager.dataSource"), v19);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2521, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("swipeSelectionManager.selectionManager.dataSourceManager.dataSource"), v19, v21);

    goto LABEL_6;
  }
LABEL_3:
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&a4->item;
  v23[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v23[1] = v13;
  v14 = *(_OWORD *)&a5->item;
  v22[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v22[1] = v14;
  objc_msgSend(v12, "indexPathsFromIndexPath:toIndexPath:inDataSource:", v23, v22, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)swipeSelectionManager:(id)a3 extendSelectionInDirection:(unint64_t)a4
{
  void *v6;
  id v7;

  -[PXCuratedLibraryUIViewController presentedViewController](self, "presentedViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "ensureSelectMode"))
    {
      objc_msgSend(v7, "extendSelectionInDirection:", a4);
      -[PXCuratedLibraryUIViewController _requestFocusUpdateForCursorAsset](self, "_requestFocusUpdateForCursorAsset");
    }

  }
}

- (void)swipeSelectionManagerDidAutoScroll:(id)a3
{
  void *v3;
  id v4;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearLastVisibleAreaAnchoringInformation");

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  char v14;
  const __CFString *v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  void *v21;
  __CFString *v22;
  objc_super v23;

  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PXCuratedLibraryUIViewController;
  if (-[PXCuratedLibraryUIViewController canPerformAction:withSender:](&v23, sel_canPerformAction_withSender_, a3, v6))
  {
    -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allowedActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (sel_openParentWithCommandUpArrow_ == a3)
    {
      v15 = CFSTR("PXCuratedLibraryActionNavigateToPreviousZoomLevel");
      goto LABEL_34;
    }
    if (sel_openSelectionWithCommandDownArrow_ != a3)
    {
      if (sel_navigateToSegment_ == a3)
      {
        if (objc_msgSend(v9, "containsObject:", CFSTR("PXCuratedLibraryActionNavigateToYearsMonthsOrDays")))v16 = objc_msgSend(v8, "isSelecting") ^ 1;
        else
          v16 = 0;
        PXNumberPropertyFromCommand(v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToNumber:", &unk_1E53EC648);

        if (v16)
        {
          PXNumberPropertyFromCommand(v6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!PXCuratedLibraryZoomLevelFromNumber(v19))
            v18 = 1;

          v14 = v18 ^ 1;
          goto LABEL_35;
        }
        goto LABEL_39;
      }
      if (sel_zoomIn_ == a3)
      {
        v15 = CFSTR("PXCuratedLibraryActionAllPhotosZoomIn");
        goto LABEL_34;
      }
      if (sel_zoomOut_ == a3)
      {
        v15 = CFSTR("PXCuratedLibraryActionAllPhotosZoomOut");
        goto LABEL_34;
      }
      if (sel_deselectAll_ == a3)
      {
        objc_msgSend(v8, "selectionSnapshot");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isAnyItemSelected");
LABEL_30:

        goto LABEL_35;
      }
      if (sel_cancelSelectMode_ != a3)
      {
        if (sel_toggleEditMode_ != a3)
        {
          if (sel_toggleViewMode_ != a3)
          {
            if (sel_toggleViewer_ != a3)
            {
              if (sel_toggleFilter_ == a3)
              {
                PXNumberPropertyFromCommand(v6);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = objc_msgSend(v11, "integerValue");
                if ((unint64_t)(v12 - 1) > 3)
                  v13 = &stru_1E5149688;
                else
                  v13 = off_1E5125468[v12 - 1];
                v22 = v13;
                v14 = objc_msgSend(v10, "containsObject:", v22);

                goto LABEL_30;
              }
LABEL_18:
              v14 = 1;
LABEL_35:

              goto LABEL_36;
            }
            if (objc_msgSend(v9, "containsObject:", CFSTR("PXCuratedLibraryActionNavigateToOneUp")))
            {
              objc_msgSend(v8, "singleSelectedAssetReference");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v21 != 0;

              goto LABEL_35;
            }
LABEL_39:
            v14 = 0;
            goto LABEL_35;
          }
          v15 = CFSTR("PXCuratedLibraryActionAllPhotosToggleAspectFit");
LABEL_34:
          v14 = objc_msgSend(v10, "containsObject:", v15);
          goto LABEL_35;
        }
        if ((objc_msgSend(v9, "containsObject:", CFSTR("PXCuratedLibraryActionEnterSelectMode")) & 1) != 0)
          goto LABEL_18;
      }
      v15 = CFSTR("PXCuratedLibraryActionCancelSelectMode");
      goto LABEL_34;
    }
    if ((objc_msgSend(v9, "containsObject:", CFSTR("PXCuratedLibraryActionNavigateToNextZoomLevel")) & 1) != 0)
      goto LABEL_18;
    v15 = CFSTR("PXCuratedLibraryActionNavigateToOneUp");
    goto LABEL_34;
  }
  v14 = 0;
LABEL_36:

  return v14 & 1;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  -[PXSwipeSelectionManager targetForKeyCommands](self->_swipeSelectionManager, "targetForKeyCommands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PXSwipeSelectionManager targetForKeyCommands](self->_swipeSelectionManager, "targetForKeyCommands");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXCuratedLibraryUIViewController;
    -[PXCuratedLibraryUIViewController targetForAction:withSender:](&v12, sel_targetForAction_withSender_, a3, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)validateCommand:(id)a3
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  if ((char *)objc_msgSend(v14, "action") == sel_navigateToSegment_)
  {
    PXNumberPropertyFromCommand(v14);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = PXCuratedLibraryZoomLevelFromNumber(v7);
    PXCuratedLibraryZoomLevelDiscoverabilityTitle(v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v10 = (void *)v9;
    objc_msgSend(v14, "setDiscoverabilityTitle:", v9);
LABEL_17:

    goto LABEL_18;
  }
  if ((char *)objc_msgSend(v14, "action") == sel_toggleEditMode_)
  {
    -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString viewModel](v7, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isSelecting"))
      v11 = CFSTR("PXCuratedLibraryCancelSelectionButtonTitle");
    else
      v11 = CFSTR("PXCuratedLibrarySelectButtonTitle");
    PXLocalizedStringFromTable(v11, CFSTR("PhotosUICore"));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((char *)objc_msgSend(v14, "action") == sel_toggleViewMode_)
  {
    -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString discoverabilityTitleForActionType:](v7, "discoverabilityTitleForActionType:", CFSTR("PXCuratedLibraryActionAllPhotosToggleAspectFit"));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if ((char *)objc_msgSend(v14, "action") == sel_toggleFilter_)
  {
    PXNumberPropertyFromCommand(v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");
    if ((unint64_t)(v5 - 1) > 3)
      v6 = &stru_1E5149688;
    else
      v6 = off_1E5125468[v5 - 1];
    v7 = v6;

    -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "discoverabilityTitleForActionType:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v13 = (void *)v12;
    objc_msgSend(v14, "setDiscoverabilityTitle:", v12);

    goto LABEL_17;
  }
LABEL_18:

}

- (void)openParentWithCommandUpArrow:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "zoomLevel");
  v7 = 2;
  if (v6 > 2)
    v7 = v6;
  v8 = v7 - 1;
  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PXCuratedLibraryUIViewController_openParentWithCommandUpArrow___block_invoke;
  v11[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
  v11[4] = v8;
  objc_msgSend(v10, "performChanges:", v11);

}

- (void)openSelectionWithCommandDownArrow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionPerformerForNavigatingToNextZoomLevelInLayout:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "performActionWithCompletionHandler:", 0);
  else
    -[PXCuratedLibraryUIViewController _presentOneUpForSingleSelectedAssetWithActivity:](self, "_presentOneUpForSingleSelectedAssetWithActivity:", 0);

}

- (void)deselectAll:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performChanges:", &__block_literal_global_358_77984);

}

- (void)cancelSelectMode:(id)a3
{
  void *v3;
  id v4;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isSelecting"))
    objc_msgSend(v4, "performChanges:", &__block_literal_global_359);

}

- (void)toggleViewer:(id)a3
{
  -[PXCuratedLibraryUIViewController _presentOneUpForSingleSelectedAssetWithActivity:](self, "_presentOneUpForSingleSelectedAssetWithActivity:", 0);
}

- (void)navigateToSegment:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  PXNumberPropertyFromCommand(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PXCuratedLibraryZoomLevelFromNumber(v4);
  if (v5)
  {
    v6 = v5;
    if (((v5 == 3) & +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")) != 0)
      v7 = 4;
    else
      v7 = v6;
    -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__PXCuratedLibraryUIViewController_navigateToSegment___block_invoke;
    v10[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
    v10[4] = v7;
    objc_msgSend(v9, "performChanges:", v10);

  }
}

- (void)zoomIn:(id)a3
{
  id v3;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomInAllPhotos");

}

- (void)zoomOut:(id)a3
{
  id v3;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomOutAllPhotos");

}

- (void)toggleEditMode:(id)a3
{
  id v3;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleSelectMode");

}

- (void)toggleViewMode:(id)a3
{
  id v3;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performActionWithType:", CFSTR("PXCuratedLibraryActionAllPhotosToggleAspectFit"));

}

- (void)toggleFilter:(id)a3
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;

  PXNumberPropertyFromCommand(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if ((unint64_t)(v5 - 1) > 3)
    v6 = &stru_1E5149688;
  else
    v6 = off_1E5125468[v5 - 1];
  v8 = v6;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performActionWithType:", v8);

}

- (PXActionManager)assetActionManager
{
  void *v2;
  void *v3;
  void *v4;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "assetActionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXActionManager *)v4;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryUIViewController preferredFocusAssetReference](self, "preferredFocusAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "axLeafForObjectReference:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "axGroup");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    v16 = v7;
    v17 = v8;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = (uint64_t *)&v16;
    v12 = 2;
  }
  else
  {
    v15 = v8;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v15;
    v12 = 1;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)barsControllerActionsForSelectionContextMenu:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isAnyItemSelected"))
  {
    if (v6)
      objc_msgSend(v6, "firstSelectedIndexPath");
    PXIndexPathFromSimpleIndexPath();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController assetReferenceForIndexPath:](self, "assetReferenceForIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController setNavigatedAssetReference:](self, "setNavigatedAssetReference:", v9);
    objc_msgSend(v5, "assetActionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = CFSTR("PXAssetActionTypeShare");
    v13[1] = CFSTR("PXAssetActionTypeTrash");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXAssetActionMenuBuilder menuElementsForActionManager:excludedActionTypes:](PXAssetActionMenuBuilder, "menuElementsForActionManager:excludedActionTypes:", v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)curatedLibraryBarsControllerDidUpdateBars:(id)a3
{
  id v4;

  -[PXCuratedLibraryUIViewController barsDelgate](self, "barsDelgate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "curatedLibraryViewDidUpdateBars:", self);

}

- (void)photosCloseButtonControllerHandleAction:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryUIViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v4, "curatedLibraryViewControllerDismiss:", self) & 1) == 0)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unable to dismiss CuratedLibraryViewController, delegate:%@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)curatedLibraryActionPerformer:(id)a3 presentContextMenuActionsWithPerformers:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  int v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  __CFString *v29;
  void *v30;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  PXCuratedLibraryUIViewController *v44;
  id v45;
  void *v46;
  void (**v47)(void *, void *);
  id v48;
  id obj;
  _QWORD v50[4];
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD aBlock[4];
  id v62;
  _QWORD *v63;
  _QWORD v64[3];
  char v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v6 = a4;
  v44 = self;
  -[PXCuratedLibraryUIViewController px_sharePresentation](self, "px_sharePresentation");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v46;
  if (!v46)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v44, CFSTR("PXCuratedLibraryUIViewController.m"), 2757, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharePresentation"));

    v7 = 0;
  }
  v8 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(v7, "defaultActivityTypeOrder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v44, CFSTR("PXCuratedLibraryUIViewController.m"), 2759, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("defaultActivityTypeOrder"));

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v65 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_presentContextMenuActionsWithPerformers___block_invoke;
  aBlock[3] = &unk_1E5122440;
  v48 = v11;
  v62 = v48;
  v63 = v64;
  v47 = (void (**)(void *, void *))_Block_copy(aBlock);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v6;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v58 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v17, "menuElement");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "activityType");
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v20 = v13;
        if (!v19
          || (v21 = objc_msgSend(v10, "containsObject:", v19), v20 = v13, !v21)
          || ((objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v19),
               v19 != CFSTR("PXActivityTypeSetAllLibrariesFilter"))
            ? (v22 = v19 == CFSTR("PXActivityTypeSetPersonalLibraryFilter"))
            : (v22 = 1),
              !v22 ? (v23 = v19 == CFSTR("PXActivityTypeSetSharedLibraryFilter")) : (v23 = 1),
              v20 = v48,
              v23))
        {
          objc_msgSend(v20, "addObject:", v18);
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    }
    while (v14);
  }

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v25 = v10;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v54 != v27)
          objc_enumerationMutation(v25);
        v29 = *(__CFString **)(*((_QWORD *)&v53 + 1) + 8 * j);
        objc_msgSend(v12, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          if (v29 == CFSTR("PXActivityTypeSetAllLibrariesFilter")
            || v29 == CFSTR("PXActivityTypeSetPersonalLibraryFilter")
            || v29 == CFSTR("PXActivityTypeSetSharedLibraryFilter"))
          {
            v47[2](v47, v24);
          }
          else
          {
            objc_msgSend(v24, "addObject:", v30);
          }
        }

      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v26);
  }

  objc_msgSend(v24, "addObjectsFromArray:", v13);
  objc_msgSend(v45, "sender");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "px_descriptionForAssertionMessage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v44, CFSTR("PXCuratedLibraryUIViewController.m"), 2803, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("actionPerformer.sender"), v40, v42);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v44, CFSTR("PXCuratedLibraryUIViewController.m"), 2803, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("actionPerformer.sender"), v40);
  }

LABEL_42:
  -[PXCuratedLibraryUIViewController filterTipController](v44, "filterTipController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "isPresentingTipView"))
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __106__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_presentContextMenuActionsWithPerformers___block_invoke_2;
    v50[3] = &unk_1E5148D08;
    v51 = v33;
    v52 = v24;
    objc_msgSend(v34, "dismissTipViewWithCompletion:", v50);

    v35 = v51;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v24);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMenu:", v35);
  }

  _Block_object_dispose(v64, 8);
}

- (void)curatedLibraryActionPerformer:(id)a3 presentShareSheetWithSharingContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;

  v16 = a4;
  -[PXCuratedLibraryUIViewController px_sharePresentation](self, "px_sharePresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2820, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharePresentation"));

  }
  objc_msgSend(v6, "createActivitySharingControllerWithContext:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2822, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activitySharingController"));

  }
  objc_msgSend(v7, "activityViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2823, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController.activityViewController"), v13);
LABEL_10:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2823, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController.activityViewController"), v13, v15);

    goto LABEL_10;
  }
LABEL_7:
  -[PXCuratedLibraryUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (BOOL)_actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
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
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  objc_class *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  objc_class *v52;
  objc_class *v53;
  objc_class *v54;
  objc_class *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXCuratedLibraryUIViewController gridView](self, "gridView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v7;
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_5:
          v11 = v8;
          objc_msgSend(v11, "popoverPresentationController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setSourceView:", v9);

          objc_msgSend(v10, "buttonSpriteReference");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "regionOfInterestForSpriteReference:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v14, "rectInCoordinateSpace:", v9);
            v16 = v15;
            v18 = v17;
            v20 = v19;
            v22 = v21;
            objc_msgSend(v11, "popoverPresentationController");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setSourceRect:", v16, v18, v20, v22);

          }
          LOBYTE(v24) = 1;
          -[PXCuratedLibraryUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

          goto LABEL_36;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "px_descriptionForAssertionMessage");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2832, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("actionPerformer"), v49, v51);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2832, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("actionPerformer"), v49);
      }

      goto LABEL_5;
    }
  }
  objc_msgSend(v7, "actionType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("PXCuratedLibraryActionShowFilters"));

  if (v26)
  {
    v9 = v8;
    objc_msgSend(v9, "popoverPresentationController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = v10 != 0;
    if (!v10)
    {
LABEL_36:

      goto LABEL_37;
    }
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "enableFilterViewControllerAnchoringToSender");

    if (v28)
    {
      objc_msgSend(v7, "sender");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = v29;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = (objc_class *)objc_opt_class();
            NSStringFromClass(v55);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "px_descriptionForAssertionMessage");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2853, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("sender"), v59, v56);

          }
          objc_msgSend(v10, "setSourceView:", v29);

          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "sender");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = (objc_class *)objc_opt_class();
              NSStringFromClass(v57);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "px_descriptionForAssertionMessage");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2856, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("actionPerformer.sender"), v60, v58);

            }
          }
          objc_msgSend(v10, "setBarButtonItem:", v44);

          goto LABEL_35;
        }
      }
      -[PXCuratedLibraryUIViewController view](self, "view");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSourceView:", v45);

    }
    else
    {
      -[PXCuratedLibraryUIViewController view](self, "view");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSourceView:", v29);
    }
LABEL_35:

    -[PXCuratedLibraryUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
    goto LABEL_36;
  }
  objc_msgSend(v7, "actionType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("PXCuratedLibraryActionTapToRadar"));

  if (v31)
  {
    v32 = v8;
    if (v32)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "px_descriptionForAssertionMessage");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2872, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("UIViewControllerFromPXViewController(pxViewController)"), v35, v36);
LABEL_44:

        goto LABEL_45;
      }
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (objc_class *)objc_opt_class();
    NSStringFromClass(v52);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2872, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("UIViewControllerFromPXViewController(pxViewController)"), v35);
    goto LABEL_45;
  }
  objc_msgSend(v7, "actionType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("PXCuratedLibraryActionCurationDebug"));

  if (v38)
  {
    v32 = v8;
    if (v32)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "px_descriptionForAssertionMessage");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2876, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("UIViewControllerFromPXViewController(pxViewController)"), v35, v36);
        goto LABEL_44;
      }
LABEL_23:
      -[PXCuratedLibraryUIViewController gridView](self, "gridView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "diagnosticDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setHostViewDiagnosticDescription:", v40);

      -[UIViewController px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:](self, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v32, 1, 0, 0);
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2876, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("UIViewControllerFromPXViewController(pxViewController)"), v35);
LABEL_45:

    goto LABEL_23;
  }
  objc_msgSend(v7, "actionType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v41, "isEqualToString:", CFSTR("PXCuratedLibraryActionShare"));

  if (!v24)
  {
    v42 = v8;
    -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "pushViewController:animated:", v42, 1);

    goto LABEL_37;
  }
  -[PXCuratedLibraryUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
LABEL_24:
  LOBYTE(v24) = 0;
LABEL_37:

  return v24;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v15;

  v9 = a3;
  v10 = a4;
  switch(a5)
  {
    case 1:
      -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v11 = v12 != 0;
      if (v12)
        objc_msgSend(v12, "pushViewController:animated:", v10, 1);

      break;
    case 2:
      v11 = -[PXCuratedLibraryUIViewController _actionPerformer:presentViewController:](self, "_actionPerformer:presentViewController:", v9, v10);
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2904, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  PXCuratedLibraryUIViewController *v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  PXCuratedLibraryUIViewController *v11;
  PXCuratedLibraryUIViewController *v12;

  v7 = (PXCuratedLibraryUIViewController *)a4;
  v8 = (void (**)(_QWORD))a5;
  -[UIViewController px_topmostPresentedViewController](self, "px_topmostPresentedViewController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (PXCuratedLibraryUIViewController *)v9;
  else
    v11 = self;
  v12 = v11;

  if (v12 == v7)
  {
    -[PXCuratedLibraryUIViewController dismissViewControllerAnimated:completion:](v7, "dismissViewControllerAnimated:completion:", 1, v8);
  }
  else if (v8)
  {
    v8[2](v8);
  }

  return v12 == v7;
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2930, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("displayAssetCollection"), v18, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2930, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("displayAssetCollection"), v18);
  }

LABEL_3:
  -[PXCuratedLibraryUIViewController moviePresenter](self, "moviePresenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[PXMoviePresenter moviePresenterWithPresentingViewController:](PXMoviePresenter, "moviePresenterWithPresentingViewController:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController setMoviePresenter:](self, "setMoviePresenter:", v9);
  }
  if (objc_msgSend(v9, "presentMovieViewControllerForAssetCollection:keyAssetFetchResult:preferredTransitionType:", v8, 0, 1))
  {
    v10 = (void *)MEMORY[0x1E0D09910];
    v11 = *MEMORY[0x1E0D09818];
    v22[0] = v8;
    v12 = *MEMORY[0x1E0D09830];
    v21[0] = v11;
    v21[1] = v12;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionMoviePlayed"), v15);

  }
}

- (void)curatedLibraryActionPerformer:(id)a3 libraryFilterStateChanged:(id)a4
{
  id v4;

  -[PXCuratedLibraryUIViewController filterTipController](self, "filterTipController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDidChangeLibraryFilterState");

}

- (void)curatedLibraryActionPerformer:(id)a3 contentFilterStateChanged:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_contentFilterStateChanged___block_invoke;
  v10[3] = &unk_1E5143468;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v7, "performChanges:", v10);

  -[PXCuratedLibraryUIViewController filterTipController](self, "filterTipController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didChangeFilterState:", v8);

}

- (id)sourceItemForTipID:(id)a3
{
  void *v3;
  void *v4;

  -[PXCuratedLibraryUIViewController filterButtonController](self, "filterButtonController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)prepareTipPopover:(id)a3 tipID:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a3;
  -[PXCuratedLibraryUIViewController view](self, "view");
  v7 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 2973, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

    v7 = 0;
  }
  objc_msgSend(v6, "setSourceView:", v7);
  objc_msgSend(v6, "setPermittedArrowDirections:", 3);

}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "zoomLevel");
  if (v5 == 3)
  {
    v9 = 39;
    goto LABEL_10;
  }
  if (v5 != 4)
  {
    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "zoomablePhotosViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v17 = 0;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    goto LABEL_9;
  }
  v7 = v6;
  objc_msgSend(v6, "zoomState");
  v8 = v13;

  if ((unint64_t)(v8 - 1) >= 5)
  {
LABEL_9:
    v9 = 43;
    goto LABEL_10;
  }
  v9 = qword_1A7C096A8[v8 - 1];
LABEL_10:

  return v9;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetsDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPhotoKitAssetsDataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 3012, CFSTR("PhotoKit data source manager is missing"));

  }
  return v7;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  void *v3;
  void *v4;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)oneUpPresentation:(id)a3 previewForHighlightingSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5
{
  void *v6;
  void *v7;

  -[PXCuratedLibraryUIViewController assetReferenceForIndexPath:](self, "assetReferenceForIndexPath:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXCuratedLibraryUIViewController targetedPreviewForAssetReference:](self, "targetedPreviewForAssetReference:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)oneUpPresentation:(id)a3 previewForDismissingToSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5
{
  void *v6;
  void *v7;

  -[PXCuratedLibraryUIViewController assetReferenceForIndexPath:](self, "assetReferenceForIndexPath:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXCuratedLibraryUIViewController targetedPreviewForAssetReference:](self, "targetedPreviewForAssetReference:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)assetReferenceForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];

  v4 = a3;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "selectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "identifier");
  v11 = objc_msgSend(v4, "section");
  v12 = objc_msgSend(v4, "item");

  v15[0] = v10;
  v15[1] = v11;
  v15[2] = v12;
  v15[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v9, "objectReferenceAtIndexPath:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)targetedPreviewForAssetReference:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v27;

  v27 = 0;
  -[PXCuratedLibraryUIViewController _regionOfInterestForAssetReference:image:](self, "_regionOfInterestForAssetReference:image:", a3, &v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rectInCoordinateSpace:", v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  if (v5)
  {
    PXPreviewImageViewForImage(v5, v4, v11, v13, v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
LABEL_7:
      v25 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v4, "placeholderViewFactory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_7;
    objc_msgSend(v4, "placeholderViewFactory");
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v20)[2](v20, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_7;
  }
  v21 = objc_alloc(MEMORY[0x1E0DC3B88]);
  PXRectGetCenter();
  v22 = (void *)objc_msgSend(v21, "initWithContainer:center:", v8);
  v23 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v24);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v18, v23, v22);
LABEL_8:

  return v25;
}

- (id)oneUpPresentation:(id)a3 secondaryIdentifiersForConfiguration:(id)a4
{
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
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isSelecting"))
  {
    -[PXCuratedLibraryUIViewController navigatedAssetReference](self, "navigatedAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "indexPath");
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
    }
    PXIndexPathFromSimpleIndexPath();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "currentDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");

    v21 = 0u;
    v22 = 0u;
    PXSimpleIndexPathFromIndexPath();
    objc_msgSend(v6, "selectionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectionSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "selectedIndexPaths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v14, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v20, 0, sizeof(v20));
    if (objc_msgSend(v14, "containsIndexPath:", v20))
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __91__PXCuratedLibraryUIViewController_oneUpPresentation_secondaryIdentifiersForConfiguration___block_invoke;
      v16[3] = &unk_1E5122468;
      v18 = v21;
      v19 = v22;
      v17 = v9;
      objc_msgSend(v14, "enumerateAllIndexPathsUsingBlock:", v16);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)oneUpPresentation:(id)a3 allowsMultiSelectMenuForInteraction:(id)a4
{
  void *v4;
  void *v5;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isSelecting");
  return (char)v4;
}

- (BOOL)oneUpPresentation:(id)a3 canStartPreviewingForContextMenuInteraction:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v5 = a4;
  if (-[PXCuratedLibraryUIViewController _handleGestureForFilterTipController](self, "_handleGestureForFilterTipController"))
  {
    v6 = 0;
  }
  else
  {
    -[PXCuratedLibraryUIViewController gridView](self, "gridView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "zoomablePhotosViewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isDisplayingIndividualItems");

    if (v11)
    {
      objc_msgSend(v5, "locationInView:", v7);
      -[PXCuratedLibraryUIViewController _hitTestAssetReferenceAtLocation:inCoordinateSpace:](self, "_hitTestAssetReferenceAtLocation:inCoordinateSpace:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v12 != 0;
      if (v12)
        -[PXCuratedLibraryUIViewController setNavigatedAssetReference:](self, "setNavigatedAssetReference:", v12);

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)oneUpPresentation:(id)a3 allowsActionsForContextMenuInteraction:(id)a4
{
  return 1;
}

- (void)oneUpPresentation:(id)a3 willStartPreviewingForContextMenuInteraction:(id)a4
{
  void *v4;
  id v5;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoPlaybackController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsContextMenuInteractionActive:", 1);

}

- (void)oneUpPresentation:(id)a3 willEndPreviewingForContextMenuInteraction:(id)a4 configuration:(id)a5
{
  void *v5;
  id v6;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoPlaybackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsContextMenuInteractionActive:", 0);

}

- (BOOL)oneUpPresentation:(id)a3 commitPreviewForContextMenuInteraction:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;

  v5 = a4;
  -[PXCuratedLibraryUIViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();
  if ((v7 & 1) != 0)
  {
    -[PXCuratedLibraryUIViewController navigatedAssetReference](self, "navigatedAssetReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "curatedLibraryViewController:commitPreviewForContextMenuInteraction:withAssetReference:", self, v5, v8);

  }
  return v7 & 1;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  -[PXCuratedLibraryUIViewController _regionOfInterestForAssetReference:image:](self, "_regionOfInterestForAssetReference:image:", a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__PXCuratedLibraryUIViewController_oneUpPresentation_regionOfInterestForAssetReference___block_invoke;
  v9[3] = &unk_1E51475B8;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "setPlaceholderViewFactory:", v9);

  return v5;
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  id v15;

  v6 = a4;
  if ((objc_msgSend(a3, "isContextMenuInteractionActive") & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "playbackStyle") != 3)
  {

    goto LABEL_6;
  }
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "videoPlaybackController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isPlayingDisplayAsset:", v10);

  if ((v11 & 1) == 0)
  {
LABEL_6:
    v15 = 0;
    v13 = -[PXCuratedLibraryUIViewController _regionOfInterestForAssetReference:image:](self, "_regionOfInterestForAssetReference:image:", v6, &v15);
    v12 = v15;
    goto LABEL_7;
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollLibraryViewToAssetReference:scrollPosition:completionHandler:", v6, 64, 0);

  -[PXCuratedLibraryUIViewController setNavigatedAssetReference:](self, "setNavigatedAssetReference:", v6);
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hideSpritesForObjectReferences:", v5);

}

- (id)oneUpPresentationActionManagerForPreviewing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  uint8_t buf[16];

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryUIViewController navigatedAssetReference](self, "navigatedAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!objc_msgSend(v5, "isSelecting") || (objc_msgSend(v7, "isAnyItemSelected") & 1) == 0)
    {
      -[PXCuratedLibraryUIViewController barsController](self, "barsController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "createAssetActionManagerForAssetReference:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    objc_msgSend(v7, "selectedIndexPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPath");
  }
  else
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Unable to retrieve asset reference for one up presentation action manager", buf, 2u);
    }

    objc_msgSend(v7, "selectedIndexPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
  }
  v13 = objc_msgSend(v9, "containsIndexPath:", &v16);

  if (!v8 || (v13 & 1) != 0)
  {
    objc_msgSend(v5, "assetActionManager", v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXCuratedLibraryUIViewController barsController](self, "barsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createAssetActionManagerForAssetReference:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setObjectReference:", v8);
  }
LABEL_13:

  return v11;
}

- (BOOL)oneUpPresentationShouldPreventShowInAllPhotosAction:(id)a3
{
  return 1;
}

- (id)dragController:(id)a3 draggableAssetReferenceAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__77911;
  v16 = __Block_byref_object_dispose__77912;
  v17 = 0;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PXCuratedLibraryUIViewController_dragController_draggableAssetReferenceAtLocation___block_invoke;
  v11[3] = &unk_1E5122260;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v11, x, y);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)dragControllerAssetReferenceForBeginningSession:(id)a3
{
  void *v4;
  void *v5;

  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isContextMenuInteractionActive"))
  {
    -[PXCuratedLibraryUIViewController navigatedAssetReference](self, "navigatedAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dragController:(id)a3 isDragSessionActiveDidChange:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a4;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoPlaybackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsDragSessionActive:", v4);

}

- (id)dragController:(id)a3 regionOfInterestForAssetReference:(id)a4 image:(id *)a5
{
  return -[PXCuratedLibraryUIViewController _regionOfInterestForAssetReference:image:](self, "_regionOfInterestForAssetReference:image:", a4, a5);
}

- (id)dragController:(id)a3 dropTargetAssetReferenceForLocation:(CGPoint)a4
{
  return 0;
}

- (void)dragController:(id)a3 draggedAssetReferencesDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "draggedAssetReferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(v5, "count");

  if (v9 > v10)
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "createFenceWithType:", 2);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__PXCuratedLibraryUIViewController_dragController_draggedAssetReferencesDidChange___block_invoke;
  v15[3] = &unk_1E5143468;
  v16 = v5;
  v14 = v5;
  objc_msgSend(v7, "performChanges:", v15);

}

- (BOOL)dragController:(id)a3 shouldSelectRearrangedAssetReferences:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSelecting");

  return v6;
}

- (BOOL)dragController:(id)a3 shouldResizeCancelledPreviewForAssetReference:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hiddenSpriteIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;

  return v7;
}

- (id)pointerController:(id)a3 regionOfInterestForCursorAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentCoordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if (v12 && -[PXCuratedLibraryUIViewController _shouldExposeCursorAnimations](self, "_shouldExposeCursorAnimations"))
  {
    -[PXCuratedLibraryUIViewController gridView](self, "gridView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v13, x, y);
    v15 = v14;
    v17 = v16;

    -[PXCuratedLibraryUIViewController _bestHitTestResultForCursorAtLocation:](self, "_bestHitTestResultForCursorAtLocation:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v18, "control") - 1) > 2)
    {
      v21 = 0;
    }
    else
    {
      -[PXCuratedLibraryUIViewController gridView](self, "gridView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "spriteReference");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "regionOfInterestForSpriteReference:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)_shouldExposeCursorAnimations
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "zoomablePhotosViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "zoomLevel");
  v12 = 0u;
  v13 = 0u;
  if (v4)
    objc_msgSend(v4, "zoomState", (unsigned __int128)0, (unsigned __int128)0);
  v6 = objc_msgSend(v4, "isDisplayingIndividualItems", v12, v13);
  v7 = objc_msgSend(v3, "zoomLevelTransitionPhase");
  v8 = v5 != 4;
  v9 = v6 ^ 1;
  if (v5 != 4)
    v9 = 1;
  if (!v9)
    v8 = 1;
  if (v5 == 3)
    v8 = 0;
  if (v7)
    v10 = 0;
  else
    v10 = v8;

  return v10;
}

- (id)pointerController:(id)a3 identifierForRegionAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentCoordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if (v12)
  {
    -[PXCuratedLibraryUIViewController gridView](self, "gridView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v13, x, y);
    v15 = v14;
    v17 = v16;

    -[PXCuratedLibraryUIViewController _bestHitTestResultForCursorAtLocation:](self, "_bestHitTestResultForCursorAtLocation:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "control");
    if ((unint64_t)(v19 - 2) >= 2)
    {
      if (v19 == 1)
      {
        objc_msgSend(v18, "assetReference");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "asset");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      objc_msgSend(v18, "assetCollectionReference");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)pointerController:(id)a3 viewForCursorInteractionAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentCoordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if (v12)
  {
    -[PXCuratedLibraryUIViewController gridView](self, "gridView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v13, x, y);
    v15 = v14;
    v17 = v16;

    -[PXCuratedLibraryUIViewController _bestHitTestResultForCursorAtLocation:](self, "_bestHitTestResultForCursorAtLocation:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[PXCuratedLibraryUIViewController _createPreviewViewForHitTestResult:](self, "_createPreviewViewForHitTestResult:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (int64_t)pointerController:(id)a3 interactionOptionsForRegionAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", a3, a5, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "zoomLevel");
  +[PXCursorInteractionSettings sharedInstance](PXCursorInteractionSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoomablePhotosViewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "interactionOptionsForZoomLevel:isAllPhotosAspectFit:", v7, objc_msgSend(v9, "aspectFit"));

  return v10;
}

- (void)pointerController:(id)a3 willEnterRegionWithRect:(CGRect)a4 inCoordinateSpace:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v6 = a5;
  PXRectGetCenter();
  v8 = v7;
  v10 = v9;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v11, v8, v10);
  v13 = v12;
  v15 = v14;

  -[PXCuratedLibraryUIViewController _bestHitTestResultForCursorAtLocation:](self, "_bestHitTestResultForCursorAtLocation:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetReference");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17
    || (objc_msgSend(v16, "assetCollectionReference"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "viewModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v19, "currentDataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "indexPathForObjectReference:", v17);
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
    }

    objc_msgSend(v19, "selectionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __96__PXCuratedLibraryUIViewController_pointerController_willEnterRegionWithRect_inCoordinateSpace___block_invoke;
    v23[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    v24 = v26;
    v25 = v27;
    objc_msgSend(v22, "performChanges:", v23);

  }
}

- (void)pointerController:(id)a3 didExitRegionWithRect:(CGRect)a4 inCoordinateSpace:(id)a5
{
  void *v5;
  void *v6;
  id v7;

  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "performChanges:", &__block_literal_global_409);
}

- (id)_bestHitTestResultForCursorAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  y = a3.y;
  x = a3.x;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__77911;
  v13 = __Block_byref_object_dispose__77912;
  v14 = 0;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PXCuratedLibraryUIViewController__bestHitTestResultForCursorAtLocation___block_invoke;
  v8[3] = &unk_1E5122260;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v8, x, y);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_createPreviewViewForHitTestResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((unint64_t)(objc_msgSend(v4, "control") - 1) > 2)
  {
    v6 = 0;
  }
  else
  {
    if (objc_msgSend(v4, "control") == 1)
    {
      objc_msgSend(v4, "assetReference");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "assetCollectionReference");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "assetCollectionReference");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "keyAssetReference");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    -[PXCuratedLibraryUIViewController _createPreviewViewForAssetReference:](self, "_createPreviewViewForAssetReference:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_createPreviewViewForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v29;

  v4 = a3;
  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "zoomLevel");

  if (v4)
  {
    v29 = 0;
    -[PXCuratedLibraryUIViewController _regionOfInterestForAssetReference:image:](self, "_regionOfInterestForAssetReference:image:", v4, &v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v29;
    -[PXCuratedLibraryUIViewController gridView](self, "gridView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scrollViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentCoordinateSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rectInCoordinateSpace:", v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v14, v16, v18, v20);
    v22 = 0.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v23);

    if ((unint64_t)(v7 - 1) < 2)
      v22 = 10.0;
    objc_msgSend(v21, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", v22);

    v25 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(v21, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCornerCurve:", v25);

  }
  else
  {
    v9 = 0;
    v8 = 0;
    v21 = 0;
  }
  v27 = v21;

  return v27;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  PXDiagnosticsItemProvider *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  objc_super v52;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)PXCuratedLibraryUIViewController;
  -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v52, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v8, "mutableCopy");

  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(PXDiagnosticsItemProvider);
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__77911;
  v50 = __Block_byref_object_dispose__77912;
  v51 = 0;
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v11 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
  v45[3] = &unk_1E5122260;
  v45[4] = &v46;
  objc_msgSend(v9, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v45);
  objc_msgSend((id)v47[5], "assetCollectionReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;

    if (!v14)
      goto LABEL_7;
    v43[0] = v11;
    v43[1] = 3221225472;
    v43[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2;
    v43[3] = &unk_1E5148158;
    v15 = v14;
    v44 = v15;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v10, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierAssetCollection"), v43);
    v41[0] = v11;
    v41[1] = 3221225472;
    v41[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_3;
    v41[3] = &unk_1E5148158;
    v14 = v15;
    v42 = v14;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v10, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierHighlight"), v41);
    objc_msgSend(v9, "diagnosticDescription");
    v39[0] = v11;
    v39[1] = 3221225472;
    v39[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_4;
    v39[3] = &unk_1E5148158;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v40 = v16;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v10, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierViewDescription"), v39);
    objc_msgSend((id)v47[5], "layout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "diagnosticDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v37[0] = v11;
    v37[1] = 3221225472;
    v37[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_5;
    v37[3] = &unk_1E5148158;
    v19 = v18;
    v38 = v19;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v10, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierLayoutDescription"), v37);

    v13 = v44;
  }
  else
  {
    v14 = 0;
  }

LABEL_7:
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__77911;
  v35 = __Block_byref_object_dispose__77912;
  v36 = 0;
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v7, x, y, v25);
  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_6;
  v30[3] = &unk_1E5122260;
  v30[4] = &v31;
  objc_msgSend(v9, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v30);
  objc_msgSend((id)v32[5], "assetReference");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "asset");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_7;
    v28[3] = &unk_1E5148158;
    v29 = v21;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v10, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierAsset"), v28);

  }
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_8;
  v27[3] = &unk_1E5148158;
  v27[4] = self;
  -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v10, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierViewController"), v27);
  -[PXDiagnosticsItemProvider registeredIdentifiers](v10, "registeredIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
    objc_msgSend(v26, "addObject:", v10);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v46, 8);

  return v26;
}

- (id)_dominantAssetCollectionReferenceForSkimming
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryBodyLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dominantSectionLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "zoomLevel");
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == objc_msgSend(v9, "zoomLevel"))
  {
    objc_msgSend(v6, "assetCollectionReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)skimmingController:(id)a3 willShowSkimmingHintsForAssetCollectionReference:(id)a4 animationDuration:(double)a5
{
  -[PXCuratedLibraryUIViewController _createAnimationForSkimmingWithDuration:indicatorsDidChangeVisibility:](self, "_createAnimationForSkimmingWithDuration:indicatorsDidChangeVisibility:", 1, a4, a5);
}

- (void)skimmingController:(id)a3 willHideSkimmingHintsForAssetCollectionReference:(id)a4 animationDuration:(double)a5
{
  -[PXCuratedLibraryUIViewController _createAnimationForSkimmingWithDuration:indicatorsDidChangeVisibility:](self, "_createAnimationForSkimmingWithDuration:indicatorsDidChangeVisibility:", 1, a4, a5);
}

- (void)skimmingController:(id)a3 willStartSkimmingAssetCollectionReference:(id)a4 animationDuration:(double)a5
{
  void *v7;
  void *v8;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearLastVisibleAreaAnchoringInformation");

  -[PXCuratedLibraryUIViewController _createAnimationForSkimmingWithDuration:indicatorsDidChangeVisibility:](self, "_createAnimationForSkimmingWithDuration:indicatorsDidChangeVisibility:", 0, a5);
}

- (void)skimmingControllerDidStopSkimming:(id)a3 animationDuration:(double)a4
{
  -[PXCuratedLibraryUIViewController _createAnimationForSkimmingWithDuration:indicatorsDidChangeVisibility:](self, "_createAnimationForSkimmingWithDuration:indicatorsDidChangeVisibility:", 0, a4);
}

- (void)_createAnimationForSkimmingWithDuration:(double)a3 indicatorsDidChangeVisibility:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layout");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    v7 = 3;
  else
    v7 = 1;
  objc_msgSend(v10, "secondSublayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createCuratedLibraryLayoutAnimationIfNeededWithContext:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDuration:", a3);
}

- (void)zoomLevelControl:(id)a3 didTapOnAlreadySelectedZoomLevel:(int64_t)a4
{
  -[PXCuratedLibraryUIViewController _scrollToBottomAnimated:](self, "_scrollToBottomAnimated:", 1, a4);
}

- (void)_navigateToRevealAssetForNavigationRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  __int128 *v25;
  id v26[2];
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  void (*v34)(uint64_t);
  id v35;
  id location[2];
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsDataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (objc_msgSend(v7, "zoomLevel") != 4)
    {
      objc_msgSend(v7, "performChanges:", &__block_literal_global_416);
      objc_msgSend(v8, "forceAllPhotosAccurateIfNeeded");
      objc_msgSend(v6, "layout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateIfNeeded");

    }
    objc_msgSend(v5, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc((Class)off_1E50B1688);
      v13 = *((_OWORD *)off_1E50B8778 + 1);
      v32 = *(_OWORD *)off_1E50B8778;
      v33 = v13;
      v14 = (void *)objc_msgSend(v12, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v11, 0, &v32);
    }
    else
    {
      objc_msgSend(v8, "dataSourceForZoomLevel:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v32 = 0u;
      v33 = 0u;
      if (v15)
      {
        objc_msgSend(v15, "lastItemIndexPath");
        v17 = v32;
      }
      else
      {
        v17 = 0;
      }
      if (v17 == *(_QWORD *)off_1E50B7E98)
      {
        PXAssertGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v16;
          _os_log_error_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "Couldn't get last asset index path in data source: %@", (uint8_t *)location, 0xCu);
        }

        v14 = 0;
      }
      else
      {
        *(_OWORD *)location = v32;
        v37 = v33;
        objc_msgSend(v16, "assetReferenceAtItemIndexPath:", location);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    objc_initWeak(location, self);
    *(_QWORD *)&v32 = 0;
    *((_QWORD *)&v32 + 1) = &v32;
    *(_QWORD *)&v33 = 0x3032000000;
    *((_QWORD *)&v33 + 1) = __Block_byref_object_copy__77911;
    v34 = __Block_byref_object_dispose__77912;
    v35 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __79__PXCuratedLibraryUIViewController__navigateToRevealAssetForNavigationRequest___block_invoke_417;
    v27[3] = &unk_1E51224F0;
    v28 = v14;
    v20 = v8;
    v31 = 4;
    v29 = v20;
    v30 = &v32;
    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __79__PXCuratedLibraryUIViewController__navigateToRevealAssetForNavigationRequest___block_invoke_2;
    v22[3] = &unk_1E5122518;
    v26[1] = (id)a2;
    v22[4] = self;
    v21 = v28;
    v23 = v21;
    v24 = v5;
    objc_copyWeak(v26, location);
    v25 = &v32;
    objc_msgSend(v20, "waitForCondition:timeout:completionHandler:", v27, v22, 1.0);
    objc_destroyWeak(v26);

    _Block_object_dispose(&v32, 8);
    objc_destroyWeak(location);

  }
  else
  {
    -[PXCuratedLibraryUIViewController _rescheduleNavigationRequest:](self, "_rescheduleNavigationRequest:", v5);
  }

}

- (void)_handleNavigationRequestConditionCompletionForNavigationRequest:(id)a3 withAssetReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  PXCuratedLibraryUIViewController *v13;

  v6 = a3;
  v7 = a4;
  if (-[PXCuratedLibraryUIViewController isGridViewReady](self, "isGridViewReady"))
  {
    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prepareForNavigationToObjectReference:", v7);

    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke;
    v10[3] = &unk_1E5146AF0;
    v11 = v6;
    v12 = v7;
    v13 = self;
    objc_msgSend(v9, "scrollLibraryViewToAssetReference:scrollPosition:completionHandler:", v12, 64, v10);

  }
  else
  {
    -[PXCuratedLibraryUIViewController _rescheduleNavigationRequest:](self, "_rescheduleNavigationRequest:", v6);
  }

}

- (void)_rescheduleNavigationRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PXCuratedLibraryUIViewController isGridViewReady](self, "isGridViewReady"))
  {
    PLCuratedLibraryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Impossible to reschedule the programmatic navigation %@ because the view has already been loaded", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v4, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 2, 0);

  }
  else
  {
    -[PXCuratedLibraryUIViewController setInitialNavigationRequest:](self, "setInitialNavigationRequest:", v4);
  }

}

- (void)px_navigateToStateAllowingTabSwitchingWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performChanges:", &__block_literal_global_420_77923);

  v7[2](v7, 1, 0);
}

- (void)ppt_navigateToAsset:(id)a3 inAssetContainer:(id)a4 revealInOneUp:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  PXProgrammaticNavigationDestination *v13;

  if (a5)
    v9 = 1;
  else
    v9 = 2;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[PXProgrammaticNavigationDestination initWithType:revealMode:asset:assetCollection:]([PXProgrammaticNavigationDestination alloc], "initWithType:revealMode:asset:assetCollection:", 7, v9, v12, v11);

  -[PXCuratedLibraryUIViewController navigateToDestination:options:completionHandler:](self, "navigateToDestination:options:completionHandler:", v13, 2, v10);
}

- (BOOL)ppt_dismiss
{
  PXCuratedLibraryUIViewController *v2;
  void *v3;

  v2 = self;
  -[PXCuratedLibraryUIViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "curatedLibraryViewControllerDismiss:", v2);

  return (char)v2;
}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = v5;
  if (v5)
    -[PXCuratedLibraryUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  else
    -[PXCuratedLibraryUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)statusController:(id)a3 configurationDidChange:(id)a4
{
  -[PXCuratedLibraryUIViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", a4);
}

- (id)presentationEnvironmentForStatusController:(id)a3
{
  return +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", self);
}

- (id)passthroughViewsForTipForController:(id)a3
{
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

  -[PXCuratedLibraryUIViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryUIViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolbar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryUIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController tabBarController](self, "tabBarController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tabBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "addObject:", v11);
  if (v5)
    objc_msgSend(v13, "addObject:", v5);
  if (v7)
    objc_msgSend(v13, "addObject:", v7);
  if (v8)
    objc_msgSend(v13, "addObject:", v8);
  if (v9)
    objc_msgSend(v13, "addObject:", v9);

  return v13;
}

- (void)willPresentTipForController:(id)a3
{
  id v3;

  -[PXCuratedLibraryUIViewController _buttonForEllipsisButtonAction](self, "_buttonForEllipsisButtonAction", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsMenuAsPrimaryAction:", 0);

}

- (void)didDismissTipForController:(id)a3
{
  id v3;

  -[PXCuratedLibraryUIViewController _buttonForEllipsisButtonAction](self, "_buttonForEllipsisButtonAction", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsMenuAsPrimaryAction:", 1);

}

- (void)footerControllerRevealFooter:(id)a3
{
  -[PXCuratedLibraryUIViewController _scrollToBottomAnimated:](self, "_scrollToBottomAnimated:", 1);
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 3924, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[PXCuratedLibraryUIViewController axNextResponder](self, "axNextResponder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "axGroup:didChange:userInfo:", v9, a4, v8);

}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  char v16;
  void *v17;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;

  v9 = a3;
  v10 = a5;
  PXGAXGetElementForUserInfo(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 3939, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("axGroup"), v21, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 3939, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("axGroup"), v21);
  }

LABEL_3:
  -[PXCuratedLibraryUIViewController viewProviderIfLoaded](self, "viewProviderIfLoaded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "zoomLevel") != 1)
    goto LABEL_12;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a4 != 4 || (isKindOfClass & 1) == 0)
  {
    if (a4 == 2 && (isKindOfClass & 1) != 0)
    {
      -[PXCuratedLibraryUIViewController _handleShowAlternateUIForGroup:](self, "_handleShowAlternateUIForGroup:", v12);
      goto LABEL_11;
    }
    if (a4 == 3 && (isKindOfClass & 1) != 0)
    {
      -[PXCuratedLibraryUIViewController _handleShowDefaultUIForGroup:](self, "_handleShowDefaultUIForGroup:", v12);
      goto LABEL_11;
    }
LABEL_12:
    -[PXCuratedLibraryUIViewController axNextResponder](self, "axNextResponder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v17, "axGroup:didRequestToPerformAction:userInfo:", v12, a4, v10);

    goto LABEL_13;
  }
  -[PXCuratedLibraryUIViewController _handleScrollToRevealInfo:inGroup:](self, "_handleScrollToRevealInfo:inGroup:", v11, v12);
LABEL_11:
  v16 = 0;
LABEL_13:

  return v16;
}

- (void)_handleScrollToRevealInfo:(id)a3 inGroup:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  -[PXCuratedLibraryUIViewController _assetCollectionReferenceForGroup:](self, "_assetCollectionReferenceForGroup:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "axFrame");
    v9 = v8;
    v10 = -15.0;
    if (v9 < 0.0 || (v10 = 15.0, v9 > 0.0))
      objc_msgSend(v7, "updatePanningWithTranslation:", v10, 0.0);

  }
}

- (void)_handleShowAlternateUIForGroup:(id)a3
{
  void *v4;
  id v5;

  -[PXCuratedLibraryUIViewController _assetCollectionReferenceForGroup:](self, "_assetCollectionReferenceForGroup:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startPanningForAssetCollectionReference:", v5);

  }
}

- (void)_handleShowDefaultUIForGroup:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PXCuratedLibraryUIViewController _assetCollectionReferenceForGroup:](self, "_assetCollectionReferenceForGroup:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    -[PXCuratedLibraryUIViewController skimmingController](self, "skimmingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endPanning");

    v4 = v6;
  }

}

- (id)_assetCollectionReferenceForGroup:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 3984, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("axGroup"), v24, v26);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 3984, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("axGroup"), v24);
  }

LABEL_3:
  objc_msgSend(v5, "axRootParent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axGroupSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axParent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axFrame");
  if (v8)
    objc_msgSend(v7, "axConvertRect:fromDescendantGroup:", v8);
  PXRectGetCenter();
  v10 = v9;
  v12 = v11;
  -[PXCuratedLibraryUIViewController gridView](self, "gridView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scrollViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentCoordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertPoint:fromCoordinateSpace:", v15, v10, v12);
  v17 = v16;
  v19 = v18;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__77911;
  v32 = __Block_byref_object_dispose__77912;
  v33 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __70__PXCuratedLibraryUIViewController__assetCollectionReferenceForGroup___block_invoke;
  v27[3] = &unk_1E5122260;
  v27[4] = &v28;
  objc_msgSend(v13, "enumerateCuratedLibraryHitTestResultsAtPoint:withControls:usingBlock:", &unk_1E53E91E0, v27, v17, v19);
  v20 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v20;
}

- (void)splitViewController:(id)a3 willChangeSidebarVisibility:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v6 = a3;
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PXCuratedLibraryUIViewController_splitViewController_willChangeSidebarVisibility___block_invoke;
  v10[3] = &unk_1E5122588;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  objc_msgSend(v8, "performChanges:", v10);

}

- (void)splitViewController:(id)a3 didChangeSidebarVisibility:(BOOL)a4
{
  -[PXCuratedLibraryUIViewController _updateDrawerButtonVisibility](self, "_updateDrawerButtonVisibility", a3, a4);
  -[PXCuratedLibraryUIViewController _updateBannerView](self, "_updateBannerView");
}

- (PXSelectionContainer)selectionContainer
{
  void *v3;
  void *v4;
  void *v5;

  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionContainerWithUndoManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXSelectionContainer *)v5;
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  void *v3;
  PXBoopableItemsProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PXCuratedLibraryUIViewController boopableItemsProvider](self, "boopableItemsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(PXBoopableItemsProvider);
    -[PXCuratedLibraryUIViewController setBoopableItemsProvider:](self, "setBoopableItemsProvider:", v4);

    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController boopableItemsProvider](self, "boopableItemsProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelectionManager:", v7);

    -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryUIViewController boopableItemsProvider](self, "boopableItemsProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImagePreviewMediaProvider:", v10);

  }
  return (UIActivityItemsConfigurationReading *)-[PXCuratedLibraryUIViewController boopableItemsProvider](self, "boopableItemsProvider");
}

- (void)invalidateBoopableItemsProvider
{
  -[PXCuratedLibraryUIViewController setBoopableItemsProvider:](self, "setBoopableItemsProvider:", 0);
}

- (void)preparePresentationEnvironmentForBannerView:(id)a3 actionIdentifier:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a5;
  +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryUIViewController filterTipController](self, "filterTipController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isPresentingTipView"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __115__PXCuratedLibraryUIViewController_preparePresentationEnvironmentForBannerView_actionIdentifier_completionHandler___block_invoke;
    v9[3] = &unk_1E5148CE0;
    v11 = v6;
    v10 = v7;
    objc_msgSend(v8, "dismissTipViewWithCompletion:", v9);

  }
  else
  {
    (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v7, 0);
  }

}

- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  PXCuratedLibraryUIViewController *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 4086, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollectionHandler"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 4087, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visibleRect");
  objc_msgSend(v12, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  objc_msgSend(v12, "assetCollectionsIteratorForContentInRect:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    _AppIntentsQueue_77895();
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke;
    block[3] = &unk_1E5122600;
    v19 = v11;
    v20 = v13;
    v21 = v7;
    v22 = v8;
    dispatch_async(v14, block);

  }
  else
  {
    PLAppIntentsGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v24 = objc_opt_class();
      v25 = 2048;
      v26 = self;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "No asset collections iterator for <%{public}@: %p>", buf, 0x16u);
    }

    v8[2](v8);
  }

}

- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  PXCuratedLibraryUIViewController *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 4131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetHandler"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryUIViewController.m"), 4132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  -[PXCuratedLibraryUIViewController viewProvider](self, "viewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visibleRect");
  objc_msgSend(v12, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  objc_msgSend(v12, "assetsIteratorForContentInRect:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    _AppIntentsQueue_77895();
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke;
    block[3] = &unk_1E5122600;
    v19 = v11;
    v20 = v13;
    v21 = v7;
    v22 = v8;
    dispatch_async(v14, block);

  }
  else
  {
    PLAppIntentsGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v24 = objc_opt_class();
      v25 = 2048;
      v26 = self;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "No assets iterator for <%{public}@: %p>", buf, 0x16u);
    }

    v8[2](v8);
  }

}

- (PXBannerView)bannerView
{
  return self->_bannerView;
}

- (PXGAXResponder)axNextResponder
{
  return (PXGAXResponder *)objc_loadWeakRetained((id *)&self->axNextResponder);
}

- (void)setAxNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->axNextResponder, a3);
}

- (PXCuratedLibraryViewConfiguration)configuration
{
  return self->_configuration;
}

- (PXPhotosDragController)dragController
{
  return self->_dragController;
}

- (PXPhotosDragController)emptyPlaceholderDragController
{
  return self->_emptyPlaceholderDragController;
}

- (PXViewControllerDismissalInteractionController)dismissalInteractionController
{
  return self->_dismissalInteractionController;
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (UITapGestureRecognizer)pressGesture
{
  return self->_pressGesture;
}

- (PXTouchingUIGestureRecognizer)skimmingTouchGesture
{
  return self->_skimmingTouchGesture;
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return self->_pinchGesture;
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (PXChangeDirectionNumberFilter)backNavigationGestureDirectionFilter
{
  return self->_backNavigationGestureDirectionFilter;
}

- (void)setBackNavigationGestureDirectionFilter:(id)a3
{
  objc_storeStrong((id *)&self->_backNavigationGestureDirectionFilter, a3);
}

- (int64_t)zoomLevelBeforeBackNavigationTransition
{
  return self->_zoomLevelBeforeBackNavigationTransition;
}

- (void)setZoomLevelBeforeBackNavigationTransition:(int64_t)a3
{
  self->_zoomLevelBeforeBackNavigationTransition = a3;
}

- (PXGTransition)backNavigationTransition
{
  return self->_backNavigationTransition;
}

- (void)setBackNavigationTransition:(id)a3
{
  objc_storeStrong((id *)&self->_backNavigationTransition, a3);
}

- (PXRelaxedScreenEdgePanGestureRecognizer)screenEdgePanGestureRecognizer
{
  return self->_screenEdgePanGestureRecognizer;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)trackedScrollContext
{
  $7112E6B4DD103BEC9D79B647C3B0BF46 *p_trackedScrollContext;
  int64_t zoomLevel;
  int64_t scrollRegime;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_trackedScrollContext = &self->_trackedScrollContext;
  zoomLevel = self->_trackedScrollContext.zoomLevel;
  scrollRegime = p_trackedScrollContext->scrollRegime;
  result.var1 = scrollRegime;
  result.var0 = zoomLevel;
  return result;
}

- (void)setTrackedScrollContext:(id)a3
{
  self->_trackedScrollContext = ($7112E6B4DD103BEC9D79B647C3B0BF46)a3;
}

- (PXSwipeSelectionManager)swipeSelectionManager
{
  return self->_swipeSelectionManager;
}

- (PXAssetReference)navigatedAssetReference
{
  return self->_navigatedAssetReference;
}

- (PXAssetReference)preferredFocusAssetReference
{
  return self->_preferredFocusAssetReference;
}

- (void)setPreferredFocusAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFocusAssetReference, a3);
}

- (PXPhotosPointerController)pointerController
{
  return self->_pointerController;
}

- (PXCuratedLibraryZoomLevelPinchFilter)zoomLevelPinchFilter
{
  return self->_zoomLevelPinchFilter;
}

- (void)setIsInUnselectedTab:(BOOL)a3
{
  self->_isInUnselectedTab = a3;
}

- (BOOL)wasAnyItemSelected
{
  return self->_wasAnyItemSelected;
}

- (void)setWasAnyItemSelected:(BOOL)a3
{
  self->_wasAnyItemSelected = a3;
}

- (PXCPLUIStatusProvider)cplUIStatusProvider
{
  return self->_cplUIStatusProvider;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (void)setSharedLibraryStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, a3);
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setLibraryFilterState:(id)a3
{
  objc_storeStrong((id *)&self->_libraryFilterState, a3);
}

- (void)setEmptyPlaceholderSwitchLibraryBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPlaceholderSwitchLibraryBarButtonItem, a3);
}

- (PXBoopableItemsProvider)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (void)setBoopableItemsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_boopableItemsProvider, a3);
}

- (PXMoviePresenter)moviePresenter
{
  return self->_moviePresenter;
}

- (void)setMoviePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_moviePresenter, a3);
}

- (UIView)legibilityContainerView
{
  return self->_legibilityContainerView;
}

- (BOOL)canShowFooter
{
  return self->_canShowFooter;
}

- (BOOL)didAppearInitially
{
  return self->_didAppearInitially;
}

- (UIView)secondaryToolbarContainerView
{
  return self->_secondaryToolbarContainerView;
}

- (PXCuratedLibraryViewDelegate)delegate
{
  return (PXCuratedLibraryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXCuratedLibraryViewBarsDelegate)barsDelgate
{
  return (PXCuratedLibraryViewBarsDelegate *)objc_loadWeakRetained((id *)&self->_barsDelgate);
}

- (void)setBarsDelgate:(id)a3
{
  objc_storeWeak((id *)&self->_barsDelgate, a3);
}

- (UIEdgeInsets)legibilityClipInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_legibilityClipInsets.top;
  left = self->_legibilityClipInsets.left;
  bottom = self->_legibilityClipInsets.bottom;
  right = self->_legibilityClipInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isCollapsed
{
  return self->_isCollapsed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_barsDelgate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryToolbarContainerView, 0);
  objc_storeStrong((id *)&self->_legibilityContainerView, 0);
  objc_storeStrong((id *)&self->_moviePresenter, 0);
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
  objc_storeStrong((id *)&self->_filterTipController, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderStatusController, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderSwitchLibraryBarButtonItem, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderSwitchLibraryButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderSwitchLibraryButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderSwitchLibraryButton, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_initialNavigationRequest, 0);
  objc_storeStrong((id *)&self->_zoomLevelPinchFilter, 0);
  objc_storeStrong((id *)&self->_pointerController, 0);
  objc_storeStrong((id *)&self->_preferredFocusAssetReference, 0);
  objc_storeStrong((id *)&self->_navigatedAssetReference, 0);
  objc_storeStrong((id *)&self->_swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->_screenEdgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backNavigationTransition, 0);
  objc_storeStrong((id *)&self->_backNavigationGestureDirectionFilter, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_skimmingTouchGesture, 0);
  objc_storeStrong((id *)&self->_pressGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_hoverGesture, 0);
  objc_storeStrong((id *)&self->_dismissalInteractionController, 0);
  objc_storeStrong((id *)&self->_zoomLevelControl, 0);
  objc_storeStrong((id *)&self->_secondaryToolbarController, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderDragController, 0);
  objc_storeStrong((id *)&self->_dragController, 0);
  objc_storeStrong((id *)&self->_userActivityController, 0);
  objc_storeStrong((id *)&self->_barsController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->axNextResponder);
  objc_storeStrong((id *)&self->_skimmingController, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_closeButtonController, 0);
  objc_storeStrong((id *)&self->_filterButtonController, 0);
}

void __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "fetchSelectedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5122628;
  v11 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke_3;
  v8[3] = &unk_1E51225D8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v5;

    if (v3)
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v3);
      if (v4 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v4);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {

    v3 = 0;
  }

}

void __80__PXCuratedLibraryUIViewController_appIntentsEnumerateAssets_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;

    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {

    v3 = 0;
  }

}

void __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "fetchSelectedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2;
  v10[3] = &unk_1E51225B0;
  v11 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3;
  v8[3] = &unk_1E51225D8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v5;

    if (v3)
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v3);
      if (v4 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v4);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {

    v3 = 0;
  }

}

void __90__PXCuratedLibraryUIViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;

    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {

    v3 = 0;
  }

}

uint64_t __115__PXCuratedLibraryUIViewController_preparePresentationEnvironmentForBannerView_actionIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __84__PXCuratedLibraryUIViewController_splitViewController_willChangeSidebarVisibility___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  v4 = objc_msgSend(v3, "splitBehavior") == 2 || *(_BYTE *)(a1 + 40) == 0;
  objc_msgSend(v5, "setSidebarCanBecomeVisible:", v4);

}

void __70__PXCuratedLibraryUIViewController__assetCollectionReferenceForGroup___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "assetCollectionReference");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a3 = 1;
}

uint64_t __104__PXCuratedLibraryUIViewController_px_navigateToStateAllowingTabSwitchingWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsSelecting:", 0);
}

void __119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "revealMode");

  if (v8 == 1 && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "wantsEditMode");

    objc_msgSend(*(id *)(a1 + 32), "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "completionKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke_2;
    v20[3] = &unk_1E5122540;
    v15 = *(id *)(a1 + 32);
    v22 = v12;
    v23 = v10;
    v21 = v15;
    v16 = v12;
    objc_msgSend(v13, "_presentOneUpForAssetReference:configurationHandler:", v14, v20);

  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (a2)
    v19 = 1;
  else
    v19 = 2;
  (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, v19, v6);

}

void __119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAnimated:", ((unint64_t)objc_msgSend(v3, "options") >> 1) & 1);
  objc_msgSend(v4, "setActivity:", *(_QWORD *)(a1 + 48));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke_3;
  v5[3] = &unk_1E5149198;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setActivityCompletion:", v5);

}

void *__119__PXCuratedLibraryUIViewController__handleNavigationRequestConditionCompletionForNavigationRequest_withAssetReference___block_invoke_3(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)notify_post((const char *)objc_msgSend(objc_retainAutorelease(result), "UTF8String"));
  return result;
}

BOOL __79__PXCuratedLibraryUIViewController__navigateToRevealAssetForNavigationRequest___block_invoke_417(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(*(id *)(a1 + 40), "dataSourceForZoomLevel:", *(_QWORD *)(a1 + 56)),
        v4 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 == v3))
  {
    objc_msgSend(v3, "assetReferenceForAssetReference:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v5 = v6 != 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __79__PXCuratedLibraryUIViewController__navigateToRevealAssetForNavigationRequest___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleNavigationRequestConditionCompletionForNavigationRequest:withAssetReference:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  }
  else
  {
    PXAssertGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "destination");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Curated library timed out waiting for asset reference %@ to navigate to destination %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 2, 0);

  }
}

uint64_t __79__PXCuratedLibraryUIViewController__navigateToRevealAssetForNavigationRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevel:", 4);
}

uint64_t __84__PXCuratedLibraryUIViewController_navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_6(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "assetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_7(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __90__PXCuratedLibraryUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __74__PXCuratedLibraryUIViewController__bestHitTestResultForCursorAtLocation___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((unint64_t)(objc_msgSend(v6, "control") - 1) <= 2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __94__PXCuratedLibraryUIViewController_pointerController_didExitRegionWithRect_inCoordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *((_OWORD *)off_1E50B8778 + 1);
  v4[0] = *(_OWORD *)off_1E50B8778;
  v4[1] = v2;
  return objc_msgSend(a2, "setPendingIndexPath:", v4);
}

uint64_t __96__PXCuratedLibraryUIViewController_pointerController_willEnterRegionWithRect_inCoordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setPendingIndexPath:", v4);
}

uint64_t __83__PXCuratedLibraryUIViewController_dragController_draggedAssetReferencesDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDraggedAssetReferences:", *(_QWORD *)(a1 + 32));
}

void __85__PXCuratedLibraryUIViewController_dragController_draggableAssetReferenceAtLocation___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = objc_msgSend(v10, "control");
  if ((unint64_t)(v5 - 7) >= 0xA)
  {
    if (v5 != 1)
      goto LABEL_4;
    objc_msgSend(v10, "assetReference");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;
  }

  *a3 = 1;
LABEL_4:

}

uint64_t __88__PXCuratedLibraryUIViewController_oneUpPresentation_regionOfInterestForAssetReference___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "rectInCoordinateSpace:", v2);
  return objc_msgSend(v2, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
}

void __91__PXCuratedLibraryUIViewController_oneUpPresentation_secondaryIdentifiersForConfiguration___block_invoke(uint64_t a1, int64x2_t *a2)
{
  void *v2;
  id v3;

  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*a2, *(int64x2_t *)(a1 + 40)), (int32x4_t)vceqq_s64(a2[1], *(int64x2_t *)(a1 + 56)))), 0xFuLL))) & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2[1].i64[0], a2->i64[1]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

uint64_t __92__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_contentFilterStateChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userDidSetAllPhotosContentFilterState:", *(_QWORD *)(a1 + 32));
}

void __106__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_presentContextMenuActionsWithPerformers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __106__PXCuratedLibraryUIViewController_curatedLibraryActionPerformer_presentContextMenuActionsWithPerformers___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMenu:", v2);

  objc_msgSend(*(id *)(a1 + 32), "contextMenuInteraction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_presentMenuAtLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

uint64_t __54__PXCuratedLibraryUIViewController_navigateToSegment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__PXCuratedLibraryUIViewController_cancelSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsSelecting:", 0);
}

uint64_t __48__PXCuratedLibraryUIViewController_deselectAll___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __65__PXCuratedLibraryUIViewController_openParentWithCommandUpArrow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

void __95__PXCuratedLibraryUIViewController__hitTestResultAtLocation_withPadding_swipeSelectionManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "control") == 1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __98__PXCuratedLibraryUIViewController_swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsSelecting:", 1);
}

uint64_t __93__PXCuratedLibraryUIViewController__scrollLibraryViewToInitialPositionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetColumns");
}

uint64_t __84__PXCuratedLibraryUIViewController__presentOneUpForSingleSelectedAssetWithActivity___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActivity:", *(_QWORD *)(a1 + 32));
}

void __77__PXCuratedLibraryUIViewController_resetToInitialStateWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLCuratedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to reset to initial state, error:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __77__PXCuratedLibraryUIViewController_resetToInitialStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetToInitialState");
}

void __82__PXCuratedLibraryUIViewController__buttonHitTestResultAtPoint_inCoordinateSpace___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((unint64_t)(objc_msgSend(v6, "control") - 7) <= 0xB)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __80__PXCuratedLibraryUIViewController_touchingUIGestureRecognizerDidBeginTouching___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;

  objc_msgSend(a2, "assetCollectionReference");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "skimmingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startTouchingForAssetCollectionReference:", v6);

    *a3 = 1;
  }

}

void __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setZoomLevel:", v2);
  objc_msgSend(v3, "setZoomLevelTransitionPhase:", 1);

}

void __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "minimumChange");
  objc_msgSend(v4, "setInput:", v3 + 1.0);

}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 32));
}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_303_78016);
}

void __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setZoomLevel:", objc_msgSend(v2, "zoomLevelBeforeBackNavigationTransition"));

}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_304_78015);
}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevelTransitionPhase:", 0);
}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevelTransitionPhase:", 0);
}

uint64_t __57__PXCuratedLibraryUIViewController__handleScreenEdgePan___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevelTransitionPhase:", 2);
}

void __47__PXCuratedLibraryUIViewController__handlePan___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "skimmingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetCollectionReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startPanningForAssetCollectionReference:", v7);

    *a3 = 1;
  }

}

BOOL __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (a2 < 1)
  {
    objc_msgSend(*(id *)(a1 + 56), "zoomLevelControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "zoomLevelDisplayedBeforeZoomLevel:", objc_msgSend(*(id *)(a1 + 48), "zoomLevel"));

    if (v10)
    {
      v11 = *(void **)(a1 + 48);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_2_293;
      v13[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
      v13[4] = v10;
      objc_msgSend(v11, "performChanges:", v13);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__77911;
    v19 = __Block_byref_object_dispose__77912;
    v20 = 0;
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "locationInView:", v3);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_291;
    v14[3] = &unk_1E5122260;
    v14[4] = &v15;
    objc_msgSend(v3, "enumerateCuratedLibraryHitTestResultsAtPoint:withControls:usingBlock:", &unk_1E53E9198, v14);
    if (v16[5])
    {
      objc_msgSend(*(id *)(a1 + 48), "actionManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "actionPerformerForHitTestResult:", v16[5]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "actionType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PXCuratedLibraryActionNavigateToNextZoomLevel"));

      if (v7)
      {
        objc_msgSend(v5, "performActionWithCompletionHandler:", 0);
        v8 = 1;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
    _Block_object_dispose(&v15, 8);

    return v8 != 0;
  }
}

uint64_t __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v4;
  _QWORD v5[5];

  result = objc_msgSend(*(id *)(a1 + 32), "zoomLevelInDirection:fromZoomLevel:", a2, objc_msgSend(*(id *)(a1 + 32), "zoomLevel"));
  if ((unint64_t)(result - 1) <= 2)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_4;
    v5[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
    v5[4] = result;
    return objc_msgSend(v4, "performChanges:", v5);
  }
  return result;
}

uint64_t __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

void __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_291(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke_2_293(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

uint64_t __49__PXCuratedLibraryUIViewController__handlePinch___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInteractiveMode:", 1);
}

void __77__PXCuratedLibraryUIViewController__scrollToNextSectionInDirection_animated___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  double MinY;
  uint64_t v15;
  double *v16;

  MinY = CGRectGetMinY(*(CGRect *)&a2);
  v15 = *(_QWORD *)(a1 + 40);
  if (v15 < 0)
  {
    if (MinY < CGRectGetMinY(*(CGRect *)(a1 + 48)))
    {
LABEL_6:
      v16 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
      v16[4] = a2;
      v16[5] = a3;
      v16[6] = a4;
      v16[7] = a5;
      *a8 = 1;
      return;
    }
    v15 = *(_QWORD *)(a1 + 40);
  }
  if (v15 >= 1 && MinY > CGRectGetMaxY(*(CGRect *)(a1 + 48)))
    goto LABEL_6;
}

void __81__PXCuratedLibraryUIViewController__handleTapWithHitTestResult_keyModifierFlags___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "assetReference");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleSelectionForAssetReference:updateCursorIndexPath:", v4, 1);

}

void __80__PXCuratedLibraryUIViewController__setWantsOptionalChromeVisible_changeReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  char v5;

  objc_msgSend(*(id *)(a1 + 32), "viewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__PXCuratedLibraryUIViewController__setWantsOptionalChromeVisible_changeReason___block_invoke_2;
  v4[3] = &__block_descriptor_41_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
  v5 = *(_BYTE *)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "performChanges:", v4);

}

uint64_t __80__PXCuratedLibraryUIViewController__setWantsOptionalChromeVisible_changeReason___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsOptionalChromeVisible:changeReason:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __47__PXCuratedLibraryUIViewController__handleTap___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTapWithHitTestResults:tapGesture:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66__PXCuratedLibraryUIViewController__handleHoverWithHitTestResult___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setPendingIndexPath:", v4);
}

uint64_t __80__PXCuratedLibraryUIViewController__handleHoverWithHitTestResults_hoverGesture___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *((_OWORD *)off_1E50B8778 + 1);
  v4[0] = *(_OWORD *)off_1E50B8778;
  v4[1] = v2;
  return objc_msgSend(a2, "setPendingIndexPath:", v4);
}

void __71__PXCuratedLibraryUIViewController__saveCurrentAllPhotosScrollPosition__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "objectReferenceForSpriteIndex:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSavedAllPhotosScrollPositionAnchorAssetIdentifier:", v9);
      objc_msgSend(v10, "save");
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Scroll Position Saved"), CFSTR("The current (approximate) scroll position will be restored on launch."), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v12);

      objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v11, 1, 0);
    }

    v7 = v13;
  }
  *a4 = 1;

}

uint64_t __57__PXCuratedLibraryUIViewController__updateStatusBarStyle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

uint64_t __53__PXCuratedLibraryUIViewController_setCanShowFooter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "viewDidAppear");
}

uint64_t __61__PXCuratedLibraryUIViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSkimmingSlideshowEnabled");
}

void __50__PXCuratedLibraryUIViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCanShowFooter:", 1);

}

uint64_t __50__PXCuratedLibraryUIViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDidAppearInitially:", 1);
}

void __47__PXCuratedLibraryUIViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_saveCurrentAllPhotosScrollPosition");

}

void __59__PXCuratedLibraryUIViewController__updateEmptyPlaceholder__block_invoke(uint64_t a1)
{
  PXCPLStatusController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXCPLStatusController *v8;

  v2 = [PXCPLStatusController alloc];
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXCPLStatusController initWithViewModel:](v2, "initWithViewModel:", v3);

  objc_msgSend(*(id *)(a1 + 40), "cplUIStatusProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCPLStatusController setStatusProvider:](v8, "setStatusProvider:", v4);
  +[PXLocalization titleForEmptyPhotoLibrary](PXLocalization, "titleForEmptyPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCPLStatusController setFallbackTitle:](v8, "setFallbackTitle:", v5);

  +[PXLocalization messageForEmptyPhotoLibrary](PXLocalization, "messageForEmptyPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCPLStatusController setFallbackMessage:](v8, "setFallbackMessage:", v6);

  +[PXLocalization openCameraButtonTitleForEmptyPhotoLibrary](PXLocalization, "openCameraButtonTitleForEmptyPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCPLStatusController setFallbackActionTitle:](v8, "setFallbackActionTitle:", v7);

  -[PXCPLStatusController setFallbackAction:](v8, "setFallbackAction:", &__block_literal_global_167);
  objc_msgSend(*(id *)(a1 + 40), "setStatusController:", v8);

}

void __59__PXCuratedLibraryUIViewController__updateEmptyPlaceholder__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  PXSharedLibraryEmptyLibraryTitleForViewMode(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  PXSharedLibraryEmptyLibraryMessageForViewMode(*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedMessage:", v6);

}

void __59__PXCuratedLibraryUIViewController__updateEmptyPlaceholder__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "px_openCameraAppURL");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, MEMORY[0x1E0C9AA70]);

}

void __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSkimmingSlideshowEnabled");

}

void __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSkimmingSlideshowEnabled");

}

void __54__PXCuratedLibraryUIViewController_skimmingController__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSkimmingSlideshowEnabled");

}

@end
