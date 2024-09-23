@implementation PUReviewScreenScrubberBarTileViewController

- (id)loadView
{
  PUReviewScreenScrubberBar *v3;
  PUReviewScreenScrubberBar *scrubberBar;
  void *v5;

  v3 = objc_alloc_init(PUReviewScreenScrubberBar);
  scrubberBar = self->__scrubberBar;
  self->__scrubberBar = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenScrubberBar setBackgroundColor:](self->__scrubberBar, "setBackgroundColor:", v5);

  -[PUReviewScreenScrubberBarTileViewController _updateViews](self, "_updateViews");
  return self->__scrubberBar;
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
    -[PUReviewScreenScrubberBarTileViewController _updateVisibilityAnimated:](self, "_updateVisibilityAnimated:", 0);
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
    -[PUReviewScreenBarsModel unregisterChangeObserver:context:](barsModel, "unregisterChangeObserver:context:", self, PUReviewScreenScrubberBarContext);
    objc_storeStrong((id *)&self->_barsModel, a3);
    -[PUReviewScreenBarsModel registerChangeObserver:context:](self->_barsModel, "registerChangeObserver:context:", self, PUReviewScreenScrubberBarContext);
    -[PUReviewScreenScrubberBarTileViewController _updateViews](self, "_updateViews");
    v5 = v7;
  }

}

- (void)_updateViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUReviewScreenScrubberBarTileViewController barsModel](self, "barsModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenScrubberBarTileViewController _scrubberBar](self, "_scrubberBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "shouldPlaceScrubberInScrubberBar"))
  {
    -[PUReviewScreenScrubberBarTileViewController barsModel](self, "barsModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "setScrubber:", v5);

  }
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
  -[PUReviewScreenScrubberBarTileViewController browsingViewModel](self, "browsingViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[PUReviewScreenScrubberBarTileViewController _scrubberBar](self, "_scrubberBar");
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
  -[PUReviewScreenScrubberBarTileViewController _scrubberBar](self, "_scrubberBar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_10;
  v9 = PUChromeAnimationDuration(v6);
LABEL_9:
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PUReviewScreenScrubberBarTileViewController__updateVisibilityAnimated___block_invoke;
  v13[3] = &unk_1E58AACF0;
  v8 = v8;
  v14 = v8;
  v15 = v7;
  objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 6, v13, 0, v9, 0.0);

LABEL_11:
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v8;
  id v9;

  v9 = a3;
  if ((void *)PUReviewScreenScrubberBarContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewScreenScrubberBarTileViewController.m"), 101, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PUReviewScreenScrubberBarTileViewController _updateViews](self, "_updateViews");

}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUReviewScreenScrubberBarTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUReviewScreenScrubberBarTileViewController setBarsModel:](self, "setBarsModel:", 0);
  -[PUReviewScreenScrubberBarTileViewController setBrowsingViewModel:](self, "setBrowsingViewModel:", 0);
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[PUReviewScreenScrubberBarTileViewController browsingViewModel](self, "browsingViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6 && objc_msgSend(v8, "chromeVisibilityDidChange"))
    -[PUReviewScreenScrubberBarTileViewController _updateVisibilityAnimated:](self, "_updateVisibilityAnimated:", 1);

}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUReviewScreenBarsModel)barsModel
{
  return self->_barsModel;
}

- (PUReviewScreenScrubberBar)_scrubberBar
{
  return self->__scrubberBar;
}

- (void)_setScrubberBar:(id)a3
{
  objc_storeStrong((id *)&self->__scrubberBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scrubberBar, 0);
  objc_storeStrong((id *)&self->_barsModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

uint64_t __73__PUReviewScreenScrubberBarTileViewController__updateVisibilityAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

@end
