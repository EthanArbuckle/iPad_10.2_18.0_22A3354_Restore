@implementation PUReviewScreenTopBarTileViewController

- (id)loadView
{
  PUReviewScreenTopBar *v3;
  PUReviewScreenTopBar *topBar;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(PUReviewScreenTopBar);
  topBar = self->__topBar;
  self->__topBar = v3;

  -[PUReviewScreenTopBar doneButton](self->__topBar, "doneButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__handleDoneButtonTapped_, 64);

  -[PUReviewScreenTopBar retakeButton](self->__topBar, "retakeButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__handleRetakeButtonTapped_, 64);

  -[PUReviewScreenTopBarTileViewController _updateControls](self, "_updateControls");
  return self->__topBar;
}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUReviewScreenTopBarTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUReviewScreenTopBarTileViewController setBrowsingViewModel:](self, "setBrowsingViewModel:", 0);
  -[PUReviewScreenTopBarTileViewController setBarsModel:](self, "setBarsModel:", 0);
}

- (void)_handleDoneButtonTapped:(id)a3
{
  id v3;

  -[PUReviewScreenTopBarTileViewController barsModel](self, "barsModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invokeCallbackForBarButtonItemWithIdentifier:", 22);

}

- (void)_handleRetakeButtonTapped:(id)a3
{
  id v3;

  -[PUReviewScreenTopBarTileViewController barsModel](self, "barsModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invokeCallbackForBarButtonItemWithIdentifier:", 24);

}

- (void)setBrowsingViewModel:(id)a3
{
  PUBrowsingViewModel *v5;
  PUBrowsingViewModel *browsingViewModel;
  PUBrowsingViewModel *v7;

  v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    v7 = v5;
    -[PUBrowsingViewModel unregisterChangeObserver:](browsingViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](self->_browsingViewModel, "registerChangeObserver:", self);
    -[PUReviewScreenTopBarTileViewController _updateVisibilityAnimated:](self, "_updateVisibilityAnimated:", 0);
    v5 = v7;
  }

}

- (void)setBarsModel:(id)a3
{
  PUReviewScreenBarsModel *v5;
  PUReviewScreenBarsModel *barsModel;
  PUReviewScreenBarsModel *v7;

  v5 = (PUReviewScreenBarsModel *)a3;
  barsModel = self->_barsModel;
  if (barsModel != v5)
  {
    v7 = v5;
    -[PUReviewScreenBarsModel unregisterChangeObserver:context:](barsModel, "unregisterChangeObserver:context:", self, PUReviewScreenTopBarContext);
    objc_storeStrong((id *)&self->_barsModel, a3);
    -[PUReviewScreenBarsModel registerChangeObserver:context:](self->_barsModel, "registerChangeObserver:context:", self, PUReviewScreenTopBarContext);
    -[PUReviewScreenTopBarTileViewController _updateControls](self, "_updateControls");
    -[PUReviewScreenTopBarTileViewController _updateBarLayout](self, "_updateBarLayout");
    v5 = v7;
  }

}

- (void)_updateControls
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUReviewScreenTopBarTileViewController _topBar](self, "_topBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenTopBarTileViewController barsModel](self, "barsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableControls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAvailableButtons:", v4);

  objc_msgSend(v3, "enabledControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabledButtons:", v5);

  objc_msgSend(v6, "setBackgroundStyle:", objc_msgSend(v3, "useVerticalControlLayout") ^ 1);
}

- (void)_updateBarLayout
{
  void *v3;
  int v4;
  double v5;
  double v6;
  id v7;

  -[PUReviewScreenTopBarTileViewController barsModel](self, "barsModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenTopBarTileViewController _topBar](self, "_topBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "useVerticalControlLayout");
  if (v4)
  {
    objc_msgSend(v7, "controlCenterAlignmentPoint");
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  objc_msgSend(v3, "setDoneButtonCenterAlignmentPoint:", v5, v6);
  if ((v4 & objc_msgSend(v7, "lastControlAlignmentChangeForcedLayout")) == 1)
    objc_msgSend(v3, "layoutIfNeeded");

}

- (void)_updateVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  id v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  double v15;

  v3 = a3;
  -[PUReviewScreenTopBarTileViewController browsingViewModel](self, "browsingViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[PUReviewScreenTopBarTileViewController _topBar](self, "_topBar");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 1.0;
    if (v3)
    {
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "chromeDefaultAnimationDuration");
      v9 = v11;

      goto LABEL_9;
    }
LABEL_10:
    objc_msgSend(v8, "setAlpha:", v7);
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isChromeVisible"))
    v7 = 1.0;
  else
    v7 = 0.0;
  -[PUReviewScreenTopBarTileViewController _topBar](self, "_topBar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_10;
  v9 = PUChromeAnimationDuration(v6);
LABEL_9:
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PUReviewScreenTopBarTileViewController__updateVisibilityAnimated___block_invoke;
  v13[3] = &unk_1E58AACF0;
  v8 = v8;
  v14 = v8;
  v15 = v7;
  objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 6, v13, 0, v9, 0.0);

LABEL_11:
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5;

  if ((void *)PUReviewScreenTopBarContext == a5)
  {
    v5 = a4;
    -[PUReviewScreenTopBarTileViewController _updateControls](self, "_updateControls", a3);
    if ((v5 & 0x20) != 0)
      -[PUReviewScreenTopBarTileViewController _updateBarLayout](self, "_updateBarLayout");
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[PUReviewScreenTopBarTileViewController browsingViewModel](self, "browsingViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6 && objc_msgSend(v8, "chromeVisibilityDidChange"))
    -[PUReviewScreenTopBarTileViewController _updateVisibilityAnimated:](self, "_updateVisibilityAnimated:", 1);

}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUReviewScreenBarsModel)barsModel
{
  return self->_barsModel;
}

- (PUReviewScreenTopBar)_topBar
{
  return self->__topBar;
}

- (void)_setTopBar:(id)a3
{
  objc_storeStrong((id *)&self->__topBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__topBar, 0);
  objc_storeStrong((id *)&self->_barsModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

uint64_t __68__PUReviewScreenTopBarTileViewController__updateVisibilityAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

@end
