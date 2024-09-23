@implementation PXFeedViewController

- (PXFeedViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedViewController.m"), 114, CFSTR("%s is not available as initializer"), "-[PXFeedViewController init]");

  abort();
}

- (PXFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedViewController.m"), 118, CFSTR("%s is not available as initializer"), "-[PXFeedViewController initWithNibName:bundle:]");

  abort();
}

- (PXFeedViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedViewController.m"), 122, CFSTR("%s is not available as initializer"), "-[PXFeedViewController initWithCoder:]");

  abort();
}

- (PXFeedViewController)initWithConfiguration:(id)a3
{
  id v5;
  PXFeedViewController *v6;
  PXFeedViewController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXFeedViewController;
  v6 = -[PXFeedViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[PXFeedConfiguration viewControllerTitle](v7->_configuration, "viewControllerTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedViewController setTitle:](v7, "setTitle:", v8);

    objc_msgSend(v5, "actionPerformer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedViewController setActionPerformer:](v7, "setActionPerformer:", v9);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  PXFeedViewConfiguration *v4;
  void *v5;
  PXFeedViewConfiguration *v6;
  void *v7;
  PXFeedView *v8;
  PXFeedView *v9;
  PXFeedView *feedView;
  PXFeedViewModel *v11;
  PXFeedViewModel *viewModel;
  PXFeedViewModel *v13;
  uint64_t v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  PXFeedChromeController *v18;
  PXFeedChromeController *chromeController;
  void *v20;
  uint64_t v21;
  void *v22;
  PXUITapGestureRecognizer *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  dispatch_time_t v30;
  id v31;
  PXUpdater *v32;
  PXUpdater *updater;
  void *v34;
  void *v35;
  _QWORD block[4];
  id v37;
  PXFeedViewController *v38;
  _QWORD v39[5];
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)PXFeedViewController;
  -[PXFeedViewController viewDidLoad](&v40, sel_viewDidLoad);
  -[UIViewController px_enableExtendedTraitCollection](self, "px_enableExtendedTraitCollection");
  -[PXFeedViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PXFeedViewConfiguration alloc];
  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXFeedViewConfiguration initWithFeedConfiguration:extendedTraitCollection:](v4, "initWithFeedConfiguration:extendedTraitCollection:", v3, v5);

  -[PXFeedViewConfiguration setContainerViewController:](v6, "setContainerViewController:", self);
  -[PXFeedViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PXFeedView alloc];
  objc_msgSend(v7, "bounds");
  v9 = -[PXFeedView initWithFrame:configuration:](v8, "initWithFrame:configuration:", v6);
  feedView = self->_feedView;
  self->_feedView = v9;

  -[PXFeedView setAutoresizingMask:](self->_feedView, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "addSubview:", self->_feedView);
  -[PXFeedView viewModel](self->_feedView, "viewModel");
  v11 = (PXFeedViewModel *)objc_claimAutoreleasedReturnValue();
  viewModel = self->_viewModel;
  self->_viewModel = v11;

  v13 = self->_viewModel;
  v14 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __35__PXFeedViewController_viewDidLoad__block_invoke;
  v39[3] = &unk_1E51375E8;
  v39[4] = self;
  -[PXFeedViewModel performChanges:](v13, "performChanges:", v39);
  -[PXFeedViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, ViewModelObservationContext_217601);
  -[PXFeedConfiguration actionPerformer](self->_configuration, "actionPerformer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedViewController setActionPerformer:](self, "setActionPerformer:", v15);

  objc_msgSend(v3, "chromeControllerPromise");
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[PXFeedViewModel dataSourceManager](self->_viewModel, "dataSourceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PXFeedViewController *, void *))v16)[2](v16, self, v17);
    v18 = (PXFeedChromeController *)objc_claimAutoreleasedReturnValue();
    chromeController = self->_chromeController;
    self->_chromeController = v18;

  }
  -[PXFeedViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "px_setDisableLargeTitle:", 1);

  v21 = objc_msgSend(v3, "hidesBackButton");
  -[PXFeedViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHidesBackButton:", v21);

  v23 = -[PXUITapGestureRecognizer initWithTarget:action:]([PXUITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleScrollViewTap_);
  -[PXUITapGestureRecognizer setAllowedPressTypes:](v23, "setAllowedPressTypes:", &unk_1E53EA440);
  objc_msgSend(v7, "addGestureRecognizer:", v23);
  if (self->_actionPerformerRespondsTo.contextMenuForObjectReferenceInDataSourceSuggestedActions)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
    objc_msgSend(v7, "addInteraction:", v24);

  }
  -[PXFeedViewController configuration](self, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "gadgetSpec");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    -[PXFeedView tungstenView](self->_feedView, "tungstenView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scrollViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "layoutIfNeeded");
    -[PXFeedViewController _setObservableScrollView:forEdges:](self, "_setObservableScrollView:forEdges:", v29, 5);
    v30 = dispatch_time(0, 200000000);
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __35__PXFeedViewController_viewDidLoad__block_invoke_141;
    block[3] = &unk_1E5148D08;
    v37 = v29;
    v38 = self;
    v31 = v29;
    dispatch_after(v30, MEMORY[0x1E0C80D38], block);

  }
  v32 = (PXUpdater *)objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", self, sel__setNeedsUpdate);
  updater = self->_updater;
  self->_updater = v32;

  -[PXUpdater addUpdateSelector:needsUpdate:](self->_updater, "addUpdateSelector:needsUpdate:", sel__updatePlaceholder, 1);
  -[PXFeedViewController viewModel](self, "viewModel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dataSourceManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "registerChangeObserver:context:", self, DataSourceManagerObservationContext_217602);

}

- (void)setIsActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 isActive;
  void *v7;
  void *v8;
  id v9;

  if (self->_isActive != a3)
  {
    v3 = a3;
    self->_isActive = a3;
    -[PXFeedViewController feedView](self, "feedView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsActive:", v3);

    isActive = self->_isActive;
    -[PXFeedViewController chromeController](self, "chromeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsActive:", isActive);

    LODWORD(isActive) = self->_isActive;
    -[PXFeedViewController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (isActive)
      objc_msgSend(v8, "handleContentSeen");
    else
      objc_msgSend(v8, "handleContentDismissed");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXFeedViewController;
  -[PXFeedViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PXFeedViewController setIsActive:](self, "setIsActive:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXFeedViewController;
  -[PXFeedViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PXFeedViewController nextViewDidAppearExpectation](self, "nextViewDidAppearExpectation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fulfill");

  -[PXFeedViewController setNextViewDidAppearExpectation:](self, "setNextViewDidAppearExpectation:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXFeedViewController;
  -[PXFeedViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PXFeedViewController setIsActive:](self, "setIsActive:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXFeedViewController;
  -[PXFeedViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PXFeedViewController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)setActionPerformer:(id)a3
{
  PXFeedActionPerformer *v5;
  $F073FA098B252BAA3C3A457FF0B40FCA *p_actionPerformerRespondsTo;
  BOOL v7;
  PXFeedActionPerformer *v8;

  v5 = (PXFeedActionPerformer *)a3;
  if (self->_actionPerformer != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_actionPerformer, a3);
    p_actionPerformerRespondsTo = &self->_actionPerformerRespondsTo;
    p_actionPerformerRespondsTo->handlePrimaryActionOnItemAtIndexPathInDataSourceFromViewController = objc_opt_respondsToSelector() & 1;
    p_actionPerformerRespondsTo->navigateToObjectReferenceFromViewControllerAnimatedWillPresentHandlerCompletionHandler = objc_opt_respondsToSelector() & 1;
    p_actionPerformerRespondsTo->deleteItemsInSelectionUndoManager = objc_opt_respondsToSelector() & 1;
    v7 = objc_opt_respondsToSelector() & 1;
    v5 = v8;
    p_actionPerformerRespondsTo->contextMenuForObjectReferenceInDataSourceSuggestedActions = v7;
  }

}

- (void)a_customTapToRadar:(id)a3
{
  PXRadarConfiguration *v4;

  v4 = objc_alloc_init(PXRadarConfiguration);
  -[PXRadarConfiguration addDiagnosticProvider:](v4, "addDiagnosticProvider:", self);
  -[PXRadarConfiguration setComponent:](v4, "setComponent:", 1);
  -[PXRadarConfiguration setKeywordIDs:](v4, "setKeywordIDs:", &unk_1E53EA458);
  -[PXRadarConfiguration setAttachmentsIncludeAnyUserAsset:](v4, "setAttachmentsIncludeAnyUserAsset:", 0);
  PXFileRadarWithConfiguration(v4);

}

- (void)_handleScrollViewTap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v12;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[PXFeedViewController viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXFeedViewController viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedIndexPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0u;
    v15 = 0u;
    v9 = objc_msgSend(v5, "identifier");
    if (v8)
    {
      objc_msgSend(v8, "firstItemIndexPathForDataSourceIdentifier:", v9);
      if ((_QWORD)v14 != *(_QWORD *)off_1E50B7E98
        && (_QWORD)v15 != 0x7FFFFFFFFFFFFFFFLL
        && *((_QWORD *)&v15 + 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[PXFeedViewController actionPerformer](self, "actionPerformer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v14;
        v13[1] = v15;
        objc_msgSend(v12, "handlePrimaryActionOnItemAtIndexPath:inDataSource:fromViewController:", v13, v5, self);

      }
    }

  }
}

- (void)_setNeedsUpdate
{
  id v2;

  -[PXFeedViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)_invalidatePlaceholder
{
  id v2;

  -[PXFeedViewController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlaceholder);

}

- (void)_updatePlaceholder
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  -[PXFeedViewController placeholderView](self, "placeholderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsAnyItems");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "removeFromSuperview");

    -[PXFeedViewController feedGadget](self, "feedGadget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidatePreferredContentHeight");

    v3 = 0;
  }
  else if (!v3)
  {
    objc_msgSend(v4, "placeholderFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createPlaceholderViewForFeedWithViewModel:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PXFeedViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v9, "addSubview:", v3);
      objc_msgSend(v4, "spec");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "placeholderMargins");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      v28 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v9, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, -v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v31;
      objc_msgSend(v9, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v27;
      objc_msgSend(v9, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:constant:", v19, -v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34[2] = v20;
      objc_msgSend(v9, "bottomAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bottomAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34[3] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "activateConstraints:", v24);

      -[PXFeedViewController feedGadget](self, "feedGadget");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "invalidatePreferredContentHeight");

    }
  }
  -[PXFeedViewController setPlaceholderView:](self, "setPlaceholderView:", v3);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXFeedViewController placeholderView](self, "placeholderView");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[PXFeedViewController viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeholderFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsDynamicPlaceholderContentSize");

    if (v10)
    {
      -[PXFeedViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutIfNeeded");
      LODWORD(v12) = 1148846080;
      LODWORD(v13) = 1112014848;
      objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v12, v13);
      v15 = v14;
      v17 = v16;
LABEL_7:

      goto LABEL_8;
    }
  }
  v15 = *(double *)off_1E50B8810;
  v17 = *((double *)off_1E50B8810 + 1);
  -[PXFeedViewController feedView](self, "feedView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tungstenView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PXFeedViewController feedView](self, "feedView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tungstenView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "rootLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentSize");

    if ((PXSizeIsEmpty() & 1) == 0)
    {
      PXSizeRound();
      v17 = v22;
      v15 = width;
    }
    goto LABEL_7;
  }
LABEL_8:
  v23 = v15;
  v24 = v17;
  result.height = v24;
  result.width = v23;
  return result;
}

- (UIScrollView)ppt_scrollView
{
  void *v2;
  void *v3;
  void *v4;

  -[PXFeedViewController feedView](self, "feedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tungstenView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnosticsMainScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v4;
}

- (void)ppt_transitionToFirstItemWithWillPresentHandler:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;

  v6 = (void (**)(id, _QWORD))a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[PXFeedViewController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  if (v9)
    objc_msgSend(v9, "firstItemIndexPath");
  v13[0] = v14;
  v13[1] = v15;
  objc_msgSend(v9, "objectReferenceAtIndexPath:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_actionPerformerRespondsTo.navigateToObjectReferenceFromViewControllerAnimatedWillPresentHandlerCompletionHandler
    || (-[PXFeedViewController actionPerformer](self, "actionPerformer"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "navigateToObjectReference:originalSource:fromViewController:animated:willPresentHandler:completionHandler:", v10, CFSTR("PPT"), self, 1, v6, v7), v11, (v12 & 1) == 0))
  {
    if (v6)
      v6[2](v6, 0);
    if (v7)
      v7[2](v7, 0);
  }

}

- (void)prepareForTransitionToSelectedTabBarItemSegmentWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  -[PXFeedViewController tabBarTransitionDelegate](self, "tabBarTransitionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXFeedViewController tabBarTransitionDelegate](self, "tabBarTransitionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedViewController tabBarController](self, "tabBarController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareForTransitionToSelectedTabBarItemSegmentNumber:", objc_msgSend(v6, "selectedIndex"));

  }
  v7[2]();

}

- (BOOL)handlePrimaryActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  char v9;
  _OWORD v11[2];

  if (!self->_actionPerformerRespondsTo.handlePrimaryActionOnItemAtIndexPathInDataSourceFromViewController)
    return 0;
  v6 = a4;
  -[PXFeedViewController actionPerformer](self, "actionPerformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a3->item;
  v11[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v11[1] = v8;
  v9 = objc_msgSend(v7, "handlePrimaryActionOnItemAtIndexPath:inDataSource:fromViewController:", v11, v6, self);

  return v9;
}

- (BOOL)handleSelectActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4
{
  void *v5;
  void *v6;
  __int128 v7;
  _QWORD v9[4];
  __int128 v10;
  __int128 v11;

  -[PXFeedViewController viewModel](self, "viewModel", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PXFeedViewController_handleSelectActionOnItemAtIndexPath_inDataSource___block_invoke;
  v9[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
  v7 = *(_OWORD *)&a3->item;
  v10 = *(_OWORD *)&a3->dataSourceIdentifier;
  v11 = v7;
  objc_msgSend(v6, "performChanges:", v9);

  return 1;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _OWORD v23[2];

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXFeedViewController viewModel](self, "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataSourceManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "assetCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc((Class)off_1E50B4A38);
      v15 = *((_OWORD *)off_1E50B8778 + 1);
      v23[0] = *(_OWORD *)off_1E50B8778;
      v23[1] = v15;
      v16 = (void *)objc_msgSend(v14, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v13, 0, v23);
      objc_msgSend(v12, "objectReferenceForObjectReference:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXFeedViewController feedView](self, "feedView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        objc_msgSend(v18, "regionOfInterestForObjectReference:", v17);
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          objc_msgSend(v9, "setSourceView:", v19);
          objc_msgSend(v21, "rectInCoordinateSpace:", v19);
          objc_msgSend(v9, "setSourceRect:");

        }
      }

    }
  }
  -[UIViewController px_presentOverTopmostPresentedViewController:animated:completion:](self, "px_presentOverTopmostPresentedViewController:animated:completion:", v8, 1, 0);

  return 1;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a4, "dismissViewControllerAnimated:completion:", 1, a5);
  return 1;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXFeedViewController feedView](self, "feedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemPlacementControllerForItemReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)willBeginTransition:(id)a3 withEndPoint:(id)a4 anchorItemReference:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  __int128 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[6];
  _QWORD v28[5];
  id v29;
  _BYTE buf[32];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXFeedViewController viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataSourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__217608;
  v28[4] = __Block_byref_object_dispose__217609;
  v29 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke;
  v27[3] = &unk_1E5137610;
  v27[4] = self;
  v27[5] = v28;
  objc_msgSend(v12, "performChanges:", v27);
  v21 = v13;
  v22 = 3221225472;
  v23 = __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke_2;
  v24 = &unk_1E5148AA8;
  v14 = v12;
  v25 = v14;
  v26 = v28;
  -[PXFeedViewController setOnTransitionEnd:](self, "setOnTransitionEnd:", &v21);
  if (v10)
  {
    objc_msgSend(v14, "dataSource", v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc((Class)off_1E50B4A38);
    v17 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)buf = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&buf[16] = v17;
    v18 = (void *)objc_msgSend(v16, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v10, 0, buf);
    objc_msgSend(v15, "objectReferenceForObjectReference:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[PXFeedViewController feedView](self, "feedView");
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject scrollObjectReference:toScrollPosition:](v20, "scrollObjectReference:toScrollPosition:", v19, 64);
    }
    else
    {
      PLStoryGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Transition anchoring failed because %@ couldn't be found in %@", buf, 0x16u);
      }
    }

  }
  _Block_object_dispose(v28, 8);

}

- (void)didEndTransition:(id)a3 withEndPoint:(id)a4 finished:(BOOL)a5
{
  void (**v6)(void);

  -[PXFeedViewController onTransitionEnd](self, "onTransitionEnd", a3, a4, a5);
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXFeedViewController setOnTransitionEnd:](self, "setOnTransitionEnd:", 0);
    v6[2]();
  }

}

- (void)_ifDataSourceIsEmptyPopIfSpecAllows
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;

  -[PXFeedViewController viewModel](self, "viewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsAnyItems"))
  {

  }
  else
  {
    -[PXFeedViewController configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowsPopOnEmptyBehavior");

    if (!v6)
      return;
    -[PXFeedViewController navigationController](self, "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v8, "px_popToViewControllerPrecedingViewController:animated:", self, 1);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)ViewModelObservationContext_217601 == a5)
  {
    if ((v6 & 2) != 0)
    {
      v11 = v9;
      -[PXFeedViewController _invalidatePlaceholder](self, "_invalidatePlaceholder");
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)DataSourceManagerObservationContext_217602 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedViewController.m"), 539, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      v11 = v9;
      -[PXFeedViewController _ifDataSourceIsEmptyPopIfSpecAllows](self, "_ifDataSourceIsEmptyPopIfSpecAllows");
LABEL_7:
      v9 = v11;
    }
  }

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;

  if (self->_actionPerformerRespondsTo.contextMenuForObjectReferenceInDataSourceSuggestedActions)
  {
    y = a4.y;
    x = a4.x;
    -[PXFeedView tungstenView](self->_feedView, "tungstenView", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feedHitTestResultAtPoint:", x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "objectReference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFeedViewController setNavigatedObjectReference:](self, "setNavigatedObjectReference:", v10);

      -[PXFeedViewController viewModel](self, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0DC36B8];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __78__PXFeedViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
      v17[3] = &unk_1E5137660;
      v17[4] = self;
      v18 = v9;
      v19 = v12;
      v14 = v12;
      objc_msgSend(v13, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;

  -[PXFeedViewController navigatedObjectReference](self, "navigatedObjectReference", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedViewController _targetedPreviewForObjectReference:](self, "_targetedPreviewForObjectReference:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;

  -[PXFeedViewController navigatedObjectReference](self, "navigatedObjectReference", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedViewController _targetedPreviewForObjectReference:](self, "_targetedPreviewForObjectReference:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_targetedPreviewForObjectReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;

  v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_5;
  }
  -[PXFeedView tungstenView](self->_feedView, "tungstenView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionOfInterestForObjectReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_5:
    v25 = 0;
    goto LABEL_6;
  }
  -[PXFeedViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rectInCoordinateSpace:", v7);
  objc_msgSend(v7, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v10 = (void *)MEMORY[0x1E0DC3508];
  objc_msgSend(v8, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v6, "imageViewSpec");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cornerRadius");
  objc_msgSend(v10, "bezierPathWithRoundedRect:cornerRadius:", v12, v14, v16, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVisiblePath:", v21);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v22);

  v23 = objc_alloc(MEMORY[0x1E0DC3B88]);
  PXRectGetCenter();
  v24 = (void *)objc_msgSend(v23, "initWithContainer:center:", v7);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v8, v9, v24);

LABEL_6:
  return v25;
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  void *v3;
  unint64_t v4;

  if (!self->_actionPerformerRespondsTo.navigateToObjectReferenceFromViewControllerAnimatedWillPresentHandlerCompletionHandler)
    return 0;
  -[PXFeedViewController _objectReferenceForDestination:](self, "_objectReferenceForDestination:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18[5];
  id v19;
  __int128 *p_buf;
  id v21;
  id location;
  __int128 buf;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLStoryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "navigating to destination %{public}@", (uint8_t *)&buf, 0xCu);

  }
  -[PXFeedViewController _objectReferenceForDestination:](self, "_objectReferenceForDestination:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v24 = 0x2020000000;
    v25 = 0;
    objc_initWeak(&location, self);
    v18[1] = (id)MEMORY[0x1E0C809B0];
    v18[2] = (id)3221225472;
    v18[3] = __72__PXFeedViewController_navigateToDestination_options_completionHandler___block_invoke;
    v18[4] = &unk_1E5137688;
    objc_copyWeak(&v21, &location);
    p_buf = &buf;
    v12 = v7;
    v19 = v12;
    objc_copyWeak(v18, &location);
    v15 = v12;
    v16 = v11;
    v17 = v8;
    PXIterateAsynchronously();

    objc_destroyWeak(v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    PLStoryGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "publicDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "failed to find object reference for %{public}@", (uint8_t *)&buf, 0xCu);

    }
    (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 5, 0);
  }

}

- (void)_checkCanNavigate:(BOOL *)a3 toDestination:(id)a4 iterator:(id)a5
{
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  PXExpectation *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  uint8_t buf[4];
  _BOOL4 v20;
  __int16 v21;
  PXFeedViewController *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (-[UIViewController px_isVisible](self, "px_isVisible"))
  {
    -[PXFeedViewController presentedViewController](self, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

  }
  else
  {
    v12 = 0;
  }
  *a3 = v12;
  PLStoryGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "publicDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v20 = v12;
    v21 = 2112;
    v22 = self;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_INFO, "checking whether navigation is possible %i from %@ to %{public}@", buf, 0x1Cu);

  }
  if (v12)
  {
    objc_msgSend(v10, "stop");
  }
  else
  {
    v15 = -[PXExpectation initWithLabelFormat:]([PXExpectation alloc], "initWithLabelFormat:", CFSTR("%@'s next viewDidAppear"), self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__PXFeedViewController__checkCanNavigate_toDestination_iterator___block_invoke;
    v16[3] = &unk_1E51376D8;
    v18 = a2;
    v16[4] = self;
    v17 = v10;
    -[PXExpectation performWhenFulfilled:timeout:](v15, "performWhenFulfilled:timeout:", v16, 3.0);
    -[PXFeedViewController setNextViewDidAppearExpectation:](self, "setNextViewDidAppearExpectation:", v15);

  }
}

- (void)_handleCanNavigate:(BOOL)a3 toDestination:(id)a4 objectReference:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void (**v23)(id, uint64_t, _QWORD);
  int v24;
  NSObject *v25;
  PXFeedViewController *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  _BOOL4 v31;
  __int16 v32;
  PXFeedViewController *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v8 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  PLStoryGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "publicDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v31 = v8;
    v32 = 2112;
    v33 = self;
    v34 = 2114;
    v35 = v14;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_INFO, "done waiting for navigation to be possible %i from %@ to %{public}@", buf, 0x1Cu);

  }
  if (v8)
  {
    -[PXFeedViewController actionPerformer](self, "actionPerformer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "source");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __91__PXFeedViewController__handleCanNavigate_toDestination_objectReference_completionHandler___block_invoke;
    v28[3] = &unk_1E5137700;
    v23 = (void (**)(id, uint64_t, _QWORD))v12;
    v29 = v23;
    v24 = objc_msgSend(v21, "navigateToObjectReference:originalSource:fromViewController:animated:willPresentHandler:completionHandler:", v11, v22, self, 0, 0, v28);

    if ((v24 & 1) == 0)
      v23[2](v23, 5, 0);
    PLStoryGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "publicDescription");
      v26 = (PXFeedViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v31 = v24;
      v32 = 2114;
      v33 = v26;
      _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_INFO, "navigation succeeded %i to %{public}@", buf, 0x12u);

    }
    v27 = v29;
  }
  else
  {
    PXStoryErrorCreateWithCodeDebugFormat(13, CFSTR("Couldn't navigate from %@"), v15, v16, v17, v18, v19, v20, (uint64_t)self);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v12 + 2))(v12, 5, v27);
  }

}

- (id)nextExistingParticipantOnRouteToDestination:(id)a3
{
  return 0;
}

- (PXProgrammaticNavigationDestination)px_navigationDestination
{
  return 0;
}

- (id)_objectReferenceForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXFeedViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectReferenceForDestination:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXFeedViewController feedView](self, "feedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v5);

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v6);

}

- (PXFeedView)feedView
{
  return self->_feedView;
}

- (PXFeedConfiguration)configuration
{
  return self->_configuration;
}

- (PXFeedViewControllerTabBarTransitionDelegate)tabBarTransitionDelegate
{
  return (PXFeedViewControllerTabBarTransitionDelegate *)objc_loadWeakRetained((id *)&self->_tabBarTransitionDelegate);
}

- (void)setTabBarTransitionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_tabBarTransitionDelegate, a3);
}

- (PXFeedGadget)feedGadget
{
  return (PXFeedGadget *)objc_loadWeakRetained((id *)&self->_feedGadget);
}

- (void)setFeedGadget:(id)a3
{
  objc_storeWeak((id *)&self->_feedGadget, a3);
}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (PXFeedChromeController)chromeController
{
  return self->_chromeController;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXFeedActionPerformer)actionPerformer
{
  return self->_actionPerformer;
}

- (id)onTransitionEnd
{
  return self->_onTransitionEnd;
}

- (void)setOnTransitionEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (PXExpectation)nextViewDidAppearExpectation
{
  return self->_nextViewDidAppearExpectation;
}

- (void)setNextViewDidAppearExpectation:(id)a3
{
  objc_storeStrong((id *)&self->_nextViewDidAppearExpectation, a3);
}

- (PXSectionedObjectReference)navigatedObjectReference
{
  return self->_navigatedObjectReference;
}

- (void)setNavigatedObjectReference:(id)a3
{
  objc_storeStrong((id *)&self->_navigatedObjectReference, a3);
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_navigatedObjectReference, 0);
  objc_storeStrong((id *)&self->_nextViewDidAppearExpectation, 0);
  objc_storeStrong(&self->_onTransitionEnd, 0);
  objc_storeStrong((id *)&self->_actionPerformer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_chromeController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_feedGadget);
  objc_destroyWeak((id *)&self->_tabBarTransitionDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_feedView, 0);
}

uint64_t __91__PXFeedViewController__handleCanNavigate_toDestination_objectReference_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__PXFeedViewController__checkCanNavigate_toDestination_iterator___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    PXAssertGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_error_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "%@ expected its view to become visible for programmatic navigation to continue, but this did not occur!", (uint8_t *)&v6, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "next");
}

void __72__PXFeedViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_checkCanNavigate:toDestination:iterator:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, *(_QWORD *)(a1 + 32), v4);

}

void __72__PXFeedViewController_navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleCanNavigate:toDestination:objectReference:completionHandler:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

id __78__PXFeedViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "actionPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextMenuForObjectReference:inDataSource:suggestedActions:fromViewController:", a1[5], a1[6], v4, a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pauseChangeDeliveryWithTimeout:identifier:", v8, 3.0);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke_3;
  v3[3] = &unk_1E5137638;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resumeChangeDeliveryAndBackgroundLoading:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t __73__PXFeedViewController_handleSelectActionOnItemAtIndexPath_inDataSource___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedIndexPath:", v4);
}

void __35__PXFeedViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setActionPerformer:", v3);
  objc_msgSend(v4, "setAssetCollectionActionPerformerDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setPresentingViewController:", *(_QWORD *)(a1 + 32));

}

void __35__PXFeedViewController_viewDidLoad__block_invoke_141(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__217608;
  v8 = __Block_byref_object_dispose__217609;
  v9 = *(id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PXFeedViewController_viewDidLoad__block_invoke_142;
  v3[3] = &unk_1E513DA10;
  v3[4] = &v4;
  objc_msgSend(v2, "px_enumerateDescendantSubviewsUsingBlock:", v3);
  objc_msgSend(*(id *)(a1 + 40), "_setObservableScrollView:forEdges:", v5[5], 5);
  _Block_object_dispose(&v4, 8);

}

void __35__PXFeedViewController_viewDidLoad__block_invoke_142(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

@end
