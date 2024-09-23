@implementation PUReviewScreenControlBarTileViewController

- (id)loadView
{
  PUReviewScreenControlBar *v3;
  PUReviewScreenControlBar *controlBar;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(PUReviewScreenControlBar);
  controlBar = self->__controlBar;
  self->__controlBar = v3;

  -[PUReviewScreenControlBar sendButton](self->__controlBar, "sendButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__handleSendButtonTapped_, 64);

  -[PUReviewScreenControlBar editButton](self->__controlBar, "editButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__handleEditButtonTapped_, 64);

  -[PUReviewScreenControlBar markupButton](self->__controlBar, "markupButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__handleMarkupButtonTapped_, 64);

  -[PUReviewScreenControlBar funEffectsButton](self->__controlBar, "funEffectsButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__handleFunEffectsButtonTapped_, 64);

  -[PUReviewScreenControlBarTileViewController _updateControls](self, "_updateControls");
  return self->__controlBar;
}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUReviewScreenControlBarTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUReviewScreenControlBarTileViewController setBrowsingViewModel:](self, "setBrowsingViewModel:", 0);
  -[PUReviewScreenControlBarTileViewController setBarsModel:](self, "setBarsModel:", 0);
}

- (void)_handleEditButtonTapped:(id)a3
{
  id v3;

  -[PUReviewScreenControlBarTileViewController barsModel](self, "barsModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invokeCallbackForBarButtonItemWithIdentifier:", 25);

}

- (void)_handleMarkupButtonTapped:(id)a3
{
  id v3;

  -[PUReviewScreenControlBarTileViewController barsModel](self, "barsModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invokeCallbackForBarButtonItemWithIdentifier:", 23);

}

- (void)_handleFunEffectsButtonTapped:(id)a3
{
  id v3;

  -[PUReviewScreenControlBarTileViewController barsModel](self, "barsModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invokeCallbackForBarButtonItemWithIdentifier:", 26);

}

- (void)_handleSendButtonTapped:(id)a3
{
  id v3;

  -[PUReviewScreenControlBarTileViewController barsModel](self, "barsModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invokeCallbackForBarButtonItemWithIdentifier:", 27);

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
    -[PUReviewScreenControlBarTileViewController _updateVisibilityAnimated:](self, "_updateVisibilityAnimated:", 0);
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
    -[PUReviewScreenBarsModel unregisterChangeObserver:context:](barsModel, "unregisterChangeObserver:context:", self, PUReviewScreenControlBarContext);
    objc_storeStrong((id *)&self->_barsModel, a3);
    -[PUReviewScreenBarsModel registerChangeObserver:context:](self->_barsModel, "registerChangeObserver:context:", self, PUReviewScreenControlBarContext);
    -[PUReviewScreenControlBarTileViewController _updateControls](self, "_updateControls");
    -[PUReviewScreenControlBarTileViewController _updateBarLayout](self, "_updateBarLayout");
    v5 = v7;
  }

}

- (id)_barControlsForModelControls:(id)a3 transitioning:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4 && (objc_msgSend(v5, "containsObject:", &unk_1E59BC000) & 1) != 0)
  {
    v7 = (id)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "removeObject:", &unk_1E59BC000);
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (void)_updateControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[PUReviewScreenControlBarTileViewController barsModel](self, "barsModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenControlBarTileViewController _controlBar](self, "_controlBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "availableControls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenControlBarTileViewController _barControlsForModelControls:transitioning:](self, "_barControlsForModelControls:transitioning:", v4, objc_msgSend(v9, "isTransitioningWithCamera"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAvailableButtons:", v5);

  objc_msgSend(v9, "enabledControls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabledButtons:", v6);

  if (objc_msgSend(v9, "shouldPlaceScrubberInScrubberBar"))
  {
    objc_msgSend(v3, "setAccessoryView:", 0);
  }
  else
  {
    objc_msgSend(v9, "accessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessoryView:", v7);

  }
  v8 = objc_msgSend(v9, "useVerticalControlLayout");
  objc_msgSend(v3, "setUseTransparentBackground:", v8);
  objc_msgSend(v3, "setShouldLayoutVertically:", v8);

}

- (void)_updateBarLayout
{
  void *v3;
  id v4;

  -[PUReviewScreenControlBarTileViewController barsModel](self, "barsModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenControlBarTileViewController _controlBar](self, "_controlBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlCenterAlignmentPoint");
  objc_msgSend(v3, "setLayoutCenterAlignmentPoint:");
  if (objc_msgSend(v4, "lastControlAlignmentChangeForcedLayout"))
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
  -[PUReviewScreenControlBarTileViewController browsingViewModel](self, "browsingViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[PUReviewScreenControlBarTileViewController _controlBar](self, "_controlBar");
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
  -[PUReviewScreenControlBarTileViewController _controlBar](self, "_controlBar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_10;
  v9 = PUChromeAnimationDuration(v6);
LABEL_9:
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PUReviewScreenControlBarTileViewController__updateVisibilityAnimated___block_invoke;
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

  if ((void *)PUReviewScreenControlBarContext == a5)
  {
    v5 = a4;
    -[PUReviewScreenControlBarTileViewController _updateControls](self, "_updateControls", a3);
    if ((v5 & 0x20) != 0)
      -[PUReviewScreenControlBarTileViewController _updateBarLayout](self, "_updateBarLayout");
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[PUReviewScreenControlBarTileViewController browsingViewModel](self, "browsingViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6 && objc_msgSend(v8, "chromeVisibilityDidChange"))
    -[PUReviewScreenControlBarTileViewController _updateVisibilityAnimated:](self, "_updateVisibilityAnimated:", 1);

}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUReviewScreenBarsModel)barsModel
{
  return self->_barsModel;
}

- (PUReviewScreenControlBar)_controlBar
{
  return self->__controlBar;
}

- (void)_setControlBar:(id)a3
{
  objc_storeStrong((id *)&self->__controlBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__controlBar, 0);
  objc_storeStrong((id *)&self->_barsModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

uint64_t __72__PUReviewScreenControlBarTileViewController__updateVisibilityAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

@end
