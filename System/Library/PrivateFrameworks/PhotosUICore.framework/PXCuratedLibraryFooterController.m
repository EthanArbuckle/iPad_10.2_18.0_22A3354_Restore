@implementation PXCuratedLibraryFooterController

- (void)setIsFooterVisible:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isFooterVisible != a3)
  {
    self->_isFooterVisible = a3;
    -[PXCuratedLibraryFooterController footerViewModel](self, "footerViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_isFooterVisible)
      objc_msgSend(v4, "didShowFooter");
    else
      objc_msgSend(v4, "didHideFooter");

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[6];

  v9 = a3;
  if ((void *)CuratedLibraryViewModelObserverContext_157808 == a5)
  {
    if (((-[PXCuratedLibraryViewModel hideStatusFooterInSelectMode](self->_viewModel, "hideStatusFooterInSelectMode") | 0x44) & a4) != 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__PXCuratedLibraryFooterController_observable_didChange_context___block_invoke;
      v12[3] = &unk_1E512F018;
      v12[4] = self;
      v12[5] = a4;
      -[PXCuratedLibraryFooterController performChanges:](self, "performChanges:", v12);
    }
    if ((a4 & 0x10000000) != 0)
      -[PXCuratedLibraryFooterController _resetFooterViewModel](self, "_resetFooterViewModel");
  }
  else if ((void *)operator|| == a5)
  {
    if ((a4 & 0x4001) != 0)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __65__PXCuratedLibraryFooterController_observable_didChange_context___block_invoke_2;
      v11[3] = &unk_1E512EFF0;
      v11[4] = self;
      -[PXCuratedLibraryFooterController performChanges:](self, "performChanges:", v11);
    }
  }
  else
  {
    if ((void *)CuratedLibraryFooterViewModelObserverContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFooterController.m"), 665, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 0x40000) != 0)
      -[PXCuratedLibraryFooterController _footerHasImportantInformationDidChange](self, "_footerHasImportantInformationDidChange");
  }

}

uint64_t __79__PXCuratedLibraryFooterController_scrollViewControllerContentBoundsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFooter");
}

- (void)_resetFooterViewModel
{
  PXCuratedLibraryFooterViewModel *footerViewModel;
  PXCuratedLibraryFooterViewModel *v4;

  footerViewModel = self->_footerViewModel;
  if (footerViewModel)
  {
    -[PXCuratedLibraryFooterViewModel unregisterChangeObserver:context:](footerViewModel, "unregisterChangeObserver:context:", self, CuratedLibraryFooterViewModelObserverContext);
    v4 = self->_footerViewModel;
    self->_footerViewModel = 0;

    -[PXCuratedLibraryFooterController _updateFooter](self, "_updateFooter");
  }
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryFooterController;
  -[PXCuratedLibraryFooterController performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setWantsFooterMask:(BOOL)a3
{
  if (self->_wantsFooterMask != a3)
  {
    self->_wantsFooterMask = a3;
    -[PXCuratedLibraryFooterController _invalidateFooter](self, "_invalidateFooter");
  }
}

- (void)setFooterMaskVerticalOffset:(double)a3
{
  if (self->_footerMaskVerticalOffset != a3)
  {
    self->_footerMaskVerticalOffset = a3;
    -[PXCuratedLibraryFooterController _invalidateFooterMaskViewFrame](self, "_invalidateFooterMaskViewFrame");
  }
}

uint64_t __66__PXCuratedLibraryFooterController_scrollViewControllerDidScroll___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateWantsFooter");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateIsFooterVisible");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFooterMaskViewFrame");
}

- (void)_invalidateWantsFooter
{
  id v2;

  -[PXCuratedLibraryFooterController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateWantsFooter);

}

- (void)_invalidateIsFooterVisible
{
  id v2;

  -[PXCuratedLibraryFooterController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsFooterVisible);

}

- (void)_invalidateFooter
{
  id v2;

  -[PXCuratedLibraryFooterController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFooter);

}

- (void)_invalidateFooterMaskViewFrame
{
  id v2;

  -[PXCuratedLibraryFooterController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFooterMaskViewFrame);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryFooterController;
  -[PXCuratedLibraryFooterController didPerformChanges](&v4, sel_didPerformChanges);
  -[PXCuratedLibraryFooterController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)_setNeedsUpdate
{
  -[PXCuratedLibraryFooterController signalChange:](self, "signalChange:", 0);
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__PXCuratedLibraryFooterController_scrollViewControllerDidScroll___block_invoke;
  v3[3] = &unk_1E512EFF0;
  v3[4] = self;
  -[PXCuratedLibraryFooterController performChanges:](self, "performChanges:", v3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXCuratedLibraryFooterController)initWithGridView:(id)a3 layout:(id)a4 viewModel:(id)a5 itemsCountsController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXCuratedLibraryFooterController *v15;
  PXCuratedLibraryFooterController *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PXCuratedLibraryStyleGuide *styleGuide;
  uint64_t v21;
  PXUpdater *updater;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXCuratedLibraryFooterController;
  v15 = -[PXCuratedLibraryFooterController init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_presentedZoomLevel = 0;
    objc_storeStrong((id *)&v15->_gridView, a3);
    -[PXGView scrollViewController](v16->_gridView, "scrollViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerObserver:", v16);
    objc_storeStrong((id *)&v16->_layout, a4);
    objc_storeStrong((id *)&v16->_viewModel, a5);
    -[PXCuratedLibraryViewModel registerChangeObserver:context:](v16->_viewModel, "registerChangeObserver:context:", v16, CuratedLibraryViewModelObserverContext_157808);
    -[PXCuratedLibraryViewModel zoomablePhotosViewModel](v16->_viewModel, "zoomablePhotosViewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerChangeObserver:context:", v16, operator||);

    objc_msgSend(v13, "styleGuide");
    v19 = objc_claimAutoreleasedReturnValue();
    styleGuide = v16->_styleGuide;
    v16->_styleGuide = (PXCuratedLibraryStyleGuide *)v19;

    objc_storeStrong((id *)&v16->_itemCountsController, a6);
    v21 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v16);
    updater = v16->_updater;
    v16->_updater = (PXUpdater *)v21;

    -[PXUpdater setNeedsUpdateSelector:](v16->_updater, "setNeedsUpdateSelector:", sel__setNeedsUpdate);
    -[PXUpdater addUpdateSelector:](v16->_updater, "addUpdateSelector:", sel__updateFooterMode);
    -[PXUpdater addUpdateSelector:](v16->_updater, "addUpdateSelector:", sel__updateWantsFooter);
    -[PXUpdater addUpdateSelector:](v16->_updater, "addUpdateSelector:", sel__updateFooter);
    -[PXUpdater addUpdateSelector:](v16->_updater, "addUpdateSelector:", sel__updateIsFooterVisible);
    -[PXUpdater addUpdateSelector:](v16->_updater, "addUpdateSelector:", sel__updateFooterAlpha);
    -[PXUpdater addUpdateSelector:](v16->_updater, "addUpdateSelector:", sel__updateFooterMaskViewFrame);
    -[PXUpdater addUpdateSelector:](v16->_updater, "addUpdateSelector:", sel__updateFooterAndMaskVisibility);

  }
  return v16;
}

- (void)_updateIsFooterVisible
{
  double v3;

  -[PXCuratedLibraryFooterController footerVisibleAmountIncludingSafeAreaInsets:](self, "footerVisibleAmountIncludingSafeAreaInsets:", 1);
  -[PXCuratedLibraryFooterController setIsFooterVisible:](self, "setIsFooterVisible:", v3 > 0.0);
}

- (double)footerVisibleAmountIncludingSafeAreaInsets:(BOOL)a3
{
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL IsEmpty;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  -[PXCuratedLibraryFooterController footerView](self, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXCuratedLibraryFooterController gridView](self, "gridView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "scrollViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scrollViewVisibleRect");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    if (!a3)
    {
      objc_msgSend(v6, "safeAreaInsets");
      PXEdgeInsetsInsetRect();
      v17 = v24;
      v19 = v25;
      v21 = v26;
      v23 = v27;
    }
    v41.origin.x = v17;
    v41.origin.y = v19;
    v41.size.width = v21;
    v41.size.height = v23;
    v45.origin.x = v8;
    v45.origin.y = v10;
    v45.size.width = v12;
    v45.size.height = v14;
    v42 = CGRectIntersection(v41, v45);
    x = v42.origin.x;
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
    IsEmpty = CGRectIsEmpty(v42);
    v33 = v14;
    v34 = v12;
    v35 = v10;
    v36 = v8;
    v37 = 0.0;
    if (!IsEmpty)
    {
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v38 = v33;
      v43.size.height = height;
      v39 = CGRectGetHeight(v43);
      v44.origin.x = v36;
      v44.origin.y = v35;
      v44.size.width = v34;
      v44.size.height = v38;
      v37 = v39 / CGRectGetHeight(v44);
    }

  }
  else
  {
    v37 = 0.0;
  }

  return v37;
}

- (void)_updateFooter
{
  BOOL isUpdatingFooter;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  PXPhotosGlobalFooterView *v13;
  _BOOL4 v14;
  PXPhotosGlobalFooterView *reusableFooterView;
  PXPhotosGlobalFooterView *v16;
  PXPhotosGlobalFooterView *v17;
  PXPhotosGlobalFooterView *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _BOOL4 IsEmpty;
  void *v41;
  void *v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[5];
  CGRect v59;

  isUpdatingFooter = self->_isUpdatingFooter;
  self->_isUpdatingFooter = 1;
  -[PXCuratedLibraryFooterController layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "padding");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXCuratedLibraryFooterController gridView](self, "gridView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scrollViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryFooterController footerView](self, "footerView");
  v13 = (PXPhotosGlobalFooterView *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXCuratedLibraryFooterController wantsFooter](self, "wantsFooter");
  if (v14)
  {
    if (!v13)
    {
      reusableFooterView = self->_reusableFooterView;
      if (reusableFooterView)
      {
        -[PXPhotosGlobalFooterView setHidden:](reusableFooterView, "setHidden:", 0);
        v13 = self->_reusableFooterView;
        v16 = self->_reusableFooterView;
        self->_reusableFooterView = 0;

      }
      else
      {
        v13 = objc_alloc_init(PXPhotosGlobalFooterView);
        -[PXPhotosGlobalFooterView setDelegate:](v13, "setDelegate:", self);
        objc_msgSend(v12, "addSubview:", v13);
      }
    }
    -[PXCuratedLibraryFooterController footerViewModel](self, "footerViewModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosGlobalFooterView setViewModel:](v13, "setViewModel:", v19);

    objc_msgSend(v4, "presentedPadding");
    v21 = v20;
    objc_msgSend(v12, "scrollViewContentSize");
    v23 = v22;
    v25 = v24;
    v26 = v24 - v21;
    -[PXPhotosGlobalFooterView sizeThatFits:](v13, "sizeThatFits:");
    v28 = v27;
    if (v27 > 0.0)
    {
      objc_msgSend(v4, "bottomMargin");
      v28 = v28 + v29;
    }
    objc_msgSend(v12, "visibleRect");
    v31 = v30;
    objc_msgSend(v12, "contentInset");
    v33 = v31 - v32;
    objc_msgSend(v12, "contentInset");
    v35 = v28 + fmax(v33 - v34 - v26 - v28, 0.0);
    objc_msgSend(v4, "padding");
    if ((PXEdgeInsetsEqualToEdgeInsets() & 1) != 0)
    {
      v36 = 0;
    }
    else
    {
      -[PXCuratedLibraryFooterController footerView](self, "footerView");
      v37 = objc_claimAutoreleasedReturnValue();
      if (v37
        && (v38 = (void *)v37,
            -[PXCuratedLibraryFooterController footerView](self, "footerView"),
            v39 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v39, "frame"),
            IsEmpty = CGRectIsEmpty(v59),
            v39,
            v38,
            !IsEmpty))
      {
        -[PXCuratedLibraryFooterController footerVisibleAmountIncludingSafeAreaInsets:](self, "footerVisibleAmountIncludingSafeAreaInsets:", 1);
        v36 = PXFloatGreaterThanFloat();
        if (v36)
        {
          objc_msgSend(v4, "createCuratedLibraryLayoutAnimationIfNeededWithContext:", 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setDuration:", 0.4);

        }
        objc_msgSend(v4, "createAnchorForVisibleArea");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "createAnchorForVisibleAreaIgnoringEdges:", 15);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
      }
      v43 = (id)objc_msgSend(v41, "autoInvalidate");

      objc_msgSend(v4, "setPadding:", v6, v8, v35, v10);
    }
    -[PXPhotosGlobalFooterView frame](v13, "frame");
    v45 = v44;
    objc_msgSend(v4, "presentedPadding");
    if (v28 >= v46)
      v47 = v46;
    else
      v47 = v28;
    v48 = v25 - v47;
    if (v48 >= 0.0)
      v49 = v48;
    else
      v49 = 0.0;
    if (v36)
    {
      -[PXCuratedLibraryFooterController footerView](self, "footerView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "frame");
      if (v51 != v28)
      {
        objc_msgSend(v50, "alpha");
        if (v52 > 0.0)
        {
          self->_needsFooterFrameChangeAnimation = 1;
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __49__PXCuratedLibraryFooterController__updateFooter__block_invoke;
          v58[3] = &unk_1E512EFF0;
          v58[4] = self;
          -[PXCuratedLibraryFooterController performChanges:](self, "performChanges:", v58);
        }
      }

    }
    -[PXPhotosGlobalFooterView setFrame:](v13, "setFrame:", v45, v49, v23, v28);
  }
  else
  {
    if (v13)
    {
      v17 = self->_reusableFooterView;
      self->_reusableFooterView = v13;
      v18 = v13;

      -[PXPhotosGlobalFooterView setHidden:](self->_reusableFooterView, "setHidden:", 1);
    }
    objc_msgSend(v4, "setPadding:", v6, v8, 0.0, v10);
    v13 = 0;
  }
  -[PXCuratedLibraryFooterController setFooterView:](self, "setFooterView:", v13);
  -[PXCuratedLibraryFooterController footerMaskView](self, "footerMaskView");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  if ((v14 & -[PXCuratedLibraryFooterController wantsFooterMask](self, "wantsFooterMask")) == 1)
  {
    if (!v53)
    {
      v53 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v54, "exaggerateContrast") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "colorWithAlphaComponent:", 0.5);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setBackgroundColor:", v56);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setBackgroundColor:", v55);
      }

      objc_msgSend(v53, "setUserInteractionEnabled:", 0);
      objc_msgSend(v12, "addSubview:", v53);
    }
    -[PXCuratedLibraryFooterController setFooterMaskView:](self, "setFooterMaskView:", v53);
    -[PXCuratedLibraryFooterController _updateFooterMaskViewFrame](self, "_updateFooterMaskViewFrame");

  }
  else
  {
    objc_msgSend(v53, "removeFromSuperview");

    -[PXCuratedLibraryFooterController setFooterMaskView:](self, "setFooterMaskView:", 0);
  }
  -[PXCuratedLibraryFooterController viewModel](self, "viewModel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  self->_presentedZoomLevel = objc_msgSend(v57, "zoomLevel");

  self->_isUpdatingFooter = isUpdatingFooter;
}

- (PXPhotosGlobalFooterView)footerView
{
  return self->_footerView;
}

- (void)_updateFooterMaskViewFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MaxY;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[PXCuratedLibraryFooterController footerMaskView](self, "footerMaskView");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[PXCuratedLibraryFooterController gridView](self, "gridView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scrollViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "visibleRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[PXCuratedLibraryFooterController styleGuide](self, "styleGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "secondaryToolbarPadding");
    v15 = v14;
    v17 = v16;

    v18 = v10 - (v15 + v17);
    v19 = v6 + v15;
    v37.origin.x = v6;
    v37.origin.y = v8;
    v37.size.width = v10;
    v37.size.height = v12;
    MaxY = CGRectGetMaxY(v37);
    objc_msgSend(v4, "contentInset");
    v22 = MaxY - v21;
    -[PXCuratedLibraryFooterController footerMaskVerticalOffset](self, "footerMaskVerticalOffset");
    v24 = v23 + v22;
    v38.origin.x = v6;
    v38.origin.y = v8;
    v38.size.width = v10;
    v38.size.height = v12;
    v25 = CGRectGetMaxY(v38);
    v39.origin.x = v19;
    v39.origin.y = v24;
    v39.size.width = v18;
    v39.size.height = v12;
    v26 = v25 - CGRectGetMinY(v39);
    objc_msgSend(v4, "contentBounds");
    v27 = CGRectGetMaxY(v40);
    -[PXCuratedLibraryFooterController layout](self, "layout");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "padding");
    v30 = v27 - v29;

    if (v24 >= v30)
      v31 = v24;
    else
      v31 = v30;
    v32 = v31 + 1.0;
    objc_msgSend(v36, "setFrame:", v19, v31 + 1.0, v18, v26);
    -[PXCuratedLibraryFooterController footerView](self, "footerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = v34;

    -[PXCuratedLibraryFooterController setFooterFullyMasked:](self, "setFooterFullyMasked:", v35 + 1.0 >= v32, v35 + 1.0);
  }
  else
  {
    -[PXCuratedLibraryFooterController setFooterFullyMasked:](self, "setFooterFullyMasked:", 0);
  }

}

- (UIView)footerMaskView
{
  return self->_footerMaskView;
}

- (void)setFooterFullyMasked:(BOOL)a3
{
  if (self->_footerFullyMasked != a3)
  {
    self->_footerFullyMasked = a3;
    -[PXCuratedLibraryFooterController _invalidateFooterAndMaskVisibility](self, "_invalidateFooterAndMaskVisibility");
  }
}

- (BOOL)wantsFooter
{
  return self->_wantsFooter;
}

- (BOOL)wantsFooterMask
{
  return self->_wantsFooterMask;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setFooterView:(id)a3
{
  PXPhotosGlobalFooterView *v5;
  PXPhotosGlobalFooterView *v6;

  v5 = (PXPhotosGlobalFooterView *)a3;
  if (self->_footerView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_footerView, a3);
    -[PXCuratedLibraryFooterController _invalidateIsFooterVisible](self, "_invalidateIsFooterVisible");
    -[PXCuratedLibraryFooterController _invalidateFooterAlpha](self, "_invalidateFooterAlpha");
    v5 = v6;
  }

}

- (void)setFooterMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_footerMaskView, a3);
}

- (PXCuratedLibraryLayout)layout
{
  return self->_layout;
}

- (PXGView)gridView
{
  return self->_gridView;
}

- (void)_updateWantsFooter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  if (-[PXCuratedLibraryFooterController hasAppearedOnce](self, "hasAppearedOnce"))
  {
    -[PXCuratedLibraryFooterController viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "enableFooter")
      && -[PXCuratedLibraryFooterController _shouldShowFooterForPresentedZoomLevel](self, "_shouldShowFooterForPresentedZoomLevel"))
    {
      if (-[PXCuratedLibraryFooterController _shouldShowFooterForGridViewState](self, "_shouldShowFooterForGridViewState"))
      {
        goto LABEL_7;
      }
      if (-[PXCuratedLibraryFooterController wantsFooter](self, "wantsFooter"))
      {
        objc_msgSend(v3, "zoomablePhotosViewModel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v6;
        if (!v6)
        {
          v4 = 0;
          v14 = 0;
          v12 = 0u;
          v13 = 0u;
          v10 = 0u;
          v11 = 0u;
          v8 = 0u;
          v9 = 0u;
          goto LABEL_16;
        }
        objc_msgSend(v6, "zoomState");
        v7 = BYTE8(v11);

        if (v7)
        {
LABEL_7:
          if ((PXCuratedLibraryStateIsEmptyLibrary(objc_msgSend(v3, "libraryState")) & 1) == 0
            && (!objc_msgSend(v3, "isSelecting")
             || (objc_msgSend(v3, "hideStatusFooterInSelectMode") & 1) == 0))
          {
            +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = (void *)(objc_msgSend(v4, "hideStatusFooter") ^ 1);
LABEL_16:

            goto LABEL_13;
          }
        }
      }
    }
    v5 = 0;
LABEL_13:
    -[PXCuratedLibraryFooterController setWantsFooter:](self, "setWantsFooter:", v5, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (BOOL)hasAppearedOnce
{
  return self->_hasAppearedOnce;
}

- (void)scrollViewControllerContentBoundsDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__PXCuratedLibraryFooterController_scrollViewControllerContentBoundsDidChange___block_invoke;
  v3[3] = &unk_1E512EFF0;
  v3[4] = self;
  -[PXCuratedLibraryFooterController performChanges:](self, "performChanges:", v3);
}

- (PXCuratedLibraryFooterController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFooterController.m"), 76, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryFooterController init]");

  abort();
}

- (id)footerViewModel
{
  PXCuratedLibraryFooterViewModel *footerViewModel;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXCuratedLibraryFooterViewModel *v8;
  PXCuratedLibraryFooterViewModel *v9;

  footerViewModel = self->_footerViewModel;
  if (!footerViewModel)
  {
    -[PXCuratedLibraryFooterController itemCountsController](self, "itemCountsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryFooterController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cplUIStatusProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "analysisStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXCuratedLibraryFooterViewModel initWithItemCountsController:cplUIStatusProvider:analysisStatus:mode:viewModel:]([PXCuratedLibraryFooterViewModel alloc], "initWithItemCountsController:cplUIStatusProvider:analysisStatus:mode:viewModel:", v4, v6, v7, objc_msgSend((id)objc_opt_class(), "_modeForZoomLevel:", objc_msgSend(v5, "zoomLevel")), v5);
    v9 = self->_footerViewModel;
    self->_footerViewModel = v8;

    -[PXCuratedLibraryFooterViewModel setPresentingDelegate:](self->_footerViewModel, "setPresentingDelegate:", self);
    -[PXCuratedLibraryFooterViewModel registerChangeObserver:context:](self->_footerViewModel, "registerChangeObserver:context:", self, CuratedLibraryFooterViewModelObserverContext);

    footerViewModel = self->_footerViewModel;
  }
  return footerViewModel;
}

- (PXCuratedLibraryFooterViewModel)footerViewModelIfLoaded
{
  return self->_footerViewModel;
}

- (void)setHasAppearedOnce:(BOOL)a3
{
  if (self->_hasAppearedOnce != a3)
  {
    self->_hasAppearedOnce = a3;
    -[PXCuratedLibraryFooterController _invalidateWantsFooter](self, "_invalidateWantsFooter");
  }
}

- (void)setFooterNeedsReveal:(BOOL)a3
{
  if (self->_footerNeedsReveal != a3)
  {
    self->_footerNeedsReveal = a3;
    -[PXCuratedLibraryFooterController _invalidateWantsFooter](self, "_invalidateWantsFooter");
  }
}

- (void)setWantsFooter:(BOOL)a3
{
  if (self->_wantsFooter != a3)
  {
    self->_wantsFooter = a3;
    -[PXCuratedLibraryFooterController _invalidateFooter](self, "_invalidateFooter");
  }
}

- (void)viewDidAppear
{
  -[PXCuratedLibraryFooterController setHasAppearedOnce:](self, "setHasAppearedOnce:", 1);
  -[PXCuratedLibraryFooterController _footerHasImportantInformationDidChange](self, "_footerHasImportantInformationDidChange");
}

- (void)_viewDidStartScrolling
{
  double v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_lastUserScrollTime = v3;
}

- (BOOL)isGridViewVisible
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXCuratedLibraryFooterController gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isPullingFooter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  char v9;

  -[PXCuratedLibraryFooterController gridView](self, "gridView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryFooterController gridView](self, "gridView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollViewSpeedometer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isScrolledAtEdge:tolerance:", 3, 1.0)
    && (objc_msgSend(v7, "lastScrollDirection"), v8 > 0.0))
  {
    v9 = objc_msgSend(v4, "isTracking");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldShowFooterForGridViewState
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[PXCuratedLibraryFooterController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 4)
    return 1;
  -[PXCuratedLibraryFooterController footerVisibleAmountIncludingSafeAreaInsets:](self, "footerVisibleAmountIncludingSafeAreaInsets:", 1);
  return (PXFloatGreaterThanFloat() & 1) != 0
      || -[PXCuratedLibraryFooterController isPullingFooter](self, "isPullingFooter")
      || -[PXCuratedLibraryFooterController footerNeedsReveal](self, "footerNeedsReveal");
}

- (BOOL)_shouldShowFooterForPresentedZoomLevel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t presentedZoomLevel;
  void *v8;
  BOOL v9;

  -[PXCuratedLibraryFooterController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 4)
    return 1;
  presentedZoomLevel = self->_presentedZoomLevel;
  if (!presentedZoomLevel)
    return 1;
  -[PXCuratedLibraryFooterController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = presentedZoomLevel == objc_msgSend(v8, "zoomLevel");

  return v9;
}

- (BOOL)_shouldRevealPhotosFooterView
{
  NSObject *v3;
  const char *v4;
  BOOL v5;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  int v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[PXCuratedLibraryFooterController isGridViewVisible](self, "isGridViewVisible"))
  {
    if (self->_footerAutoScrollMinimumIdleTimer)
    {
      PLUserStatusUIGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v18) = 0;
        v4 = "[Footer] Suppressing auto-scroll: Waiting for idle timer";
LABEL_7:
        _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v18, 2u);
        goto LABEL_8;
      }
      goto LABEL_8;
    }
    -[PXCuratedLibraryFooterController footerViewModel](self, "footerViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasImportantInformation");

    if ((v8 & 1) == 0)
    {
      PLUserStatusUIGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
      LOWORD(v18) = 0;
      v4 = "[Footer] Suppressing auto-scroll: No important information";
      goto LABEL_7;
    }
    -[PXCuratedLibraryFooterController gridView](self, "gridView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrollViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryFooterController layout](self, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "padding");
    v13 = objc_msgSend(v10, "isScrolledAtEdge:tolerance:", 3, v12 + 1.0);

    -[PXCuratedLibraryFooterController footerVisibleAmountIncludingSafeAreaInsets:](self, "footerVisibleAmountIncludingSafeAreaInsets:", 0);
    v14 = PXFloatEqualToFloatWithTolerance();
    if (!v13 || v14)
    {
      PLUserStatusUIGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
      LOWORD(v18) = 0;
      v4 = "[Footer] Suppressing auto-scroll: Not at bottom, or footer already fully visible";
      goto LABEL_7;
    }
    if (self->_footerDidAutoScroll)
    {
      PLUserStatusUIGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
      LOWORD(v18) = 0;
      v4 = "[Footer] Suppressing auto-scroll: Already scrolled once";
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentMode");
    v3 = objc_claimAutoreleasedReturnValue();

    if ((-[NSObject isEqualToString:](v3, "isEqualToString:", *MEMORY[0x1E0C99748]) & 1) != 0)
    {
      -[PXCuratedLibraryFooterController viewModel](self, "viewModel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!-[NSObject isSelecting](v16, "isSelecting")
        || !-[NSObject hideStatusFooterInSelectMode](v16, "hideStatusFooterInSelectMode"))
      {
        v5 = 1;
        goto LABEL_30;
      }
      PLUserStatusUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEBUG, "[Footer] Suppressing auto-scroll: In selection mode", (uint8_t *)&v18, 2u);
      }

    }
    else
    {
      PLUserStatusUIGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v18 = 138412290;
        v19 = v3;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEBUG, "[Footer] Suppressing auto-scroll: In \"%@\" run loop mode (default mode required)", (uint8_t *)&v18, 0xCu);
      }
    }
    v5 = 0;
LABEL_30:

    goto LABEL_9;
  }
  PLUserStatusUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v18) = 0;
    v4 = "[Footer] Suppressing auto-scroll: Not visible";
    goto LABEL_7;
  }
LABEL_8:
  v5 = 0;
LABEL_9:

  return v5;
}

- (void)_conditionallyRevealPhotosFooterViewWithLastUserScrollTime:(double)a3
{
  NSTimer *footerAutoScrollMinimumIdleTimer;
  NSObject *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[16];

  footerAutoScrollMinimumIdleTimer = self->_footerAutoScrollMinimumIdleTimer;
  self->_footerAutoScrollMinimumIdleTimer = 0;

  if (self->_lastUserScrollTime == a3)
  {
    if (-[PXCuratedLibraryFooterController _shouldRevealPhotosFooterView](self, "_shouldRevealPhotosFooterView"))
    {
      self->_footerDidAutoScroll = 1;
      -[PXCuratedLibraryFooterController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "footerControllerRevealFooter:", self);

      v10 = MEMORY[0x1E0C809B0];
      v7 = __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke_3;
      v8 = &v10;
    }
    else
    {
      v11 = MEMORY[0x1E0C809B0];
      v7 = __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke_2;
      v8 = &v11;
    }
  }
  else
  {
    PLUserStatusUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "[Footer] Suppressing auto-scroll: user scrolled", buf, 2u);
    }

    v12 = MEMORY[0x1E0C809B0];
    v7 = __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke;
    v8 = &v12;
  }
  v8[1] = 3221225472;
  v8[2] = (uint64_t)v7;
  v8[3] = (uint64_t)&unk_1E512EFF0;
  v8[4] = (uint64_t)self;
  -[PXCuratedLibraryFooterController performChanges:](self, "performChanges:");
}

- (void)_conditionallyRevealPhotosFooterView
{
  NSObject *v3;
  uint64_t v4;
  double lastUserScrollTime;
  void *v6;
  NSTimer *v7;
  NSTimer *footerAutoScrollMinimumIdleTimer;
  _QWORD v9[4];
  id v10[2];
  id buf;
  _QWORD v12[5];

  if (-[PXCuratedLibraryFooterController _shouldRevealPhotosFooterView](self, "_shouldRevealPhotosFooterView"))
  {
    PLUserStatusUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "[Footer] Should auto-scroll, waiting for idle timer", (uint8_t *)&buf, 2u);
    }

    v4 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterView__block_invoke;
    v12[3] = &unk_1E512EFF0;
    v12[4] = self;
    -[PXCuratedLibraryFooterController performChanges:](self, "performChanges:", v12);
    lastUserScrollTime = self->_lastUserScrollTime;
    objc_initWeak(&buf, self);
    v6 = (void *)MEMORY[0x1E0C99E88];
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __72__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterView__block_invoke_2;
    v9[3] = &unk_1E5141020;
    objc_copyWeak(v10, &buf);
    v10[1] = *(id *)&lastUserScrollTime;
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, 2.0);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    footerAutoScrollMinimumIdleTimer = self->_footerAutoScrollMinimumIdleTimer;
    self->_footerAutoScrollMinimumIdleTimer = v7;

    objc_destroyWeak(v10);
    objc_destroyWeak(&buf);
  }
}

- (void)_footerHasImportantInformationDidChange
{
  void *v3;
  int v4;

  -[PXCuratedLibraryFooterController footerViewModel](self, "footerViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasImportantInformation");

  if (v4)
    -[PXCuratedLibraryFooterController _conditionallyRevealPhotosFooterView](self, "_conditionallyRevealPhotosFooterView");
}

- (void)_invalidateFooterMode
{
  id v2;

  -[PXCuratedLibraryFooterController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFooterMode);

}

- (void)_updateFooterMode
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[PXCuratedLibraryFooterController footerViewModelIfLoaded](self, "footerViewModelIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    v4 = objc_msgSend(v3, "mode");
    -[PXCuratedLibraryFooterController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "zoomLevel");

    v7 = objc_msgSend((id)objc_opt_class(), "_modeForZoomLevel:", v6);
    v3 = v8;
    if (v4 != v7)
    {
      objc_msgSend(v8, "setMode:");
      -[PXCuratedLibraryFooterController _invalidateFooter](self, "_invalidateFooter");
      v3 = v8;
    }
  }

}

- (void)_invalidateFooterAlpha
{
  id v2;

  -[PXCuratedLibraryFooterController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFooterAlpha);

}

- (void)_updateFooterAlpha
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v12[6];

  if (self->_needsFooterFrameChangeAnimation)
  {
    -[PXCuratedLibraryFooterController footerView](self, "footerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    self->_needsFooterFrameChangeAnimation = 0;
    v4 = 1.0;
    v5 = 0.4;
  }
  else
  {
    -[PXCuratedLibraryFooterController viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoomablePhotosViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldHideSurroundingContent");

    if (v8)
      v4 = 0.0;
    else
      v4 = 1.0;
    v5 = 0.2;
  }
  -[PXCuratedLibraryFooterController footerView](self, "footerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alpha");
  v11 = v10;

  if (v11 != v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PXCuratedLibraryFooterController__updateFooterAlpha__block_invoke;
    v12[3] = &unk_1E5144EB8;
    v12[4] = self;
    *(double *)&v12[5] = v4;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, v5);
  }
}

- (void)_invalidateFooterAndMaskVisibility
{
  id v2;

  -[PXCuratedLibraryFooterController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFooterAndMaskVisibility);

}

- (void)_updateFooterAndMaskVisibility
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[PXCuratedLibraryFooterController isFooterFullyMasked](self, "isFooterFullyMasked");
  -[PXCuratedLibraryFooterController footerMaskView](self, "footerMaskView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[PXCuratedLibraryFooterController footerView](self, "footerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[PXCuratedLibraryFooterController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerForFooterController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);
  else
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)photosGlobalFooterViewDidChangeHeight:(id)a3
{
  _QWORD v3[5];

  if (!self->_isUpdatingFooter)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __74__PXCuratedLibraryFooterController_photosGlobalFooterViewDidChangeHeight___block_invoke;
    v3[3] = &unk_1E512EFF0;
    v3[4] = self;
    -[PXCuratedLibraryFooterController performChanges:](self, "performChanges:", v3);
  }
}

- (id)presentingViewControllerForFooterViewModel:(id)a3
{
  void *v4;
  void *v5;

  -[PXCuratedLibraryFooterController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForFooterController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXCuratedLibraryFooterControllerDelegate)delegate
{
  return (PXCuratedLibraryFooterControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)footerMaskVerticalOffset
{
  return self->_footerMaskVerticalOffset;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (PXCuratedLibraryStyleGuide)styleGuide
{
  return self->_styleGuide;
}

- (PXAssetsDataSourceCountsController)itemCountsController
{
  return self->_itemCountsController;
}

- (BOOL)isFooterVisible
{
  return self->_isFooterVisible;
}

- (BOOL)footerNeedsReveal
{
  return self->_footerNeedsReveal;
}

- (void)setFooterViewModelIfLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_footerViewModelIfLoaded, a3);
}

- (BOOL)isFooterFullyMasked
{
  return self->_footerFullyMasked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerMaskView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_footerViewModelIfLoaded, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_itemCountsController, 0);
  objc_storeStrong((id *)&self->_styleGuide, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reusableFooterView, 0);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_footerAutoScrollMinimumIdleTimer, 0);
}

uint64_t __74__PXCuratedLibraryFooterController_photosGlobalFooterViewDidChangeHeight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFooter");
}

uint64_t __65__PXCuratedLibraryFooterController_observable_didChange_context___block_invoke(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 40) & 4) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateFooterMode");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWantsFooter");
}

uint64_t __65__PXCuratedLibraryFooterController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateWantsFooter");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFooterAlpha");
}

void __54__PXCuratedLibraryFooterController__updateFooterAlpha__block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "footerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

uint64_t __49__PXCuratedLibraryFooterController__updateFooter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFooterAlpha");
}

uint64_t __72__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFooterNeedsReveal:", 1);
}

void __72__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_conditionallyRevealPhotosFooterViewWithLastUserScrollTime:", *(double *)(a1 + 40));

}

uint64_t __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFooterNeedsReveal:", 0);
}

uint64_t __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFooterNeedsReveal:", 0);
}

uint64_t __95__PXCuratedLibraryFooterController__conditionallyRevealPhotosFooterViewWithLastUserScrollTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFooterNeedsReveal:", 0);
}

+ (int64_t)_modeForZoomLevel:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if ((unint64_t)(a3 - 1) < 2)
    return 2;
  if (a3 == 3)
    return 1;
  if (!a3)
  {
    v13 = v4;
    v14 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v6, v5, v13, v14, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCuratedLibraryFooterController.m"), 286, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 0;
}

@end
