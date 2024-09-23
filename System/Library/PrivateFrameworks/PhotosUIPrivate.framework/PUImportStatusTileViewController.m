@implementation PUImportStatusTileViewController

- (void)becomeReusable
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUImportStatusTileViewController;
  -[PUTileViewController becomeReusable](&v4, sel_becomeReusable);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PUImportStatusTileViewController_becomeReusable__block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUImportStatusTileViewController performChanges:](self, "performChanges:", v3);
}

- (void)viewDidLoad
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUImportStatusTileViewController;
  -[PUTileViewController viewDidLoad](&v5, sel_viewDidLoad);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PUImportStatusTileViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E58ABD10;
  v4[4] = self;
  -[PUImportStatusTileViewController performChanges:](self, "performChanges:", v4);
  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel *assetViewModel;
  _QWORD v7[5];

  v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    -[PUAssetViewModel unregisterChangeObserver:](assetViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUAssetViewModel registerChangeObserver:](self->_assetViewModel, "registerChangeObserver:", self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__PUImportStatusTileViewController_setAssetViewModel___block_invoke;
    v7[3] = &unk_1E58ABD10;
    v7[4] = self;
    -[PUImportStatusTileViewController performChanges:](self, "performChanges:", v7);
  }

}

- (void)performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[PUImportStatusTileViewController _isPerformingChanges](self, "_isPerformingChanges");
  -[PUImportStatusTileViewController set_isPerformingChanges:](self, "set_isPerformingChanges:", 1);
  v4[2](v4);

  -[PUImportStatusTileViewController set_isPerformingChanges:](self, "set_isPerformingChanges:", v5);
  if (!v5)
    -[PUImportStatusTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PUImportStatusTileViewController _updateIfNeeded]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PUImportStatusTileViewController.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PUImportStatusTileViewController _updateStatusView](self, "_updateStatusView");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PUImportStatusTileViewController _updateIfNeeded]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PUImportStatusTileViewController.m"), 86, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
}

- (void)_updateStatusView
{
  void *v3;
  uint64_t v4;
  double MidX;
  double MidY;
  UIView *successView;
  UIView *v8;
  UIView *v9;
  id *p_progressIndicatorView;
  UIActivityIndicatorView *progressIndicatorView;
  uint64_t v12;
  id v13;
  void *v14;
  UIView *errorView;
  UIView *v16;
  UIView *v17;
  uint64_t v18;
  id v19;
  CGRect v20;
  CGRect v21;

  if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUImportStatusTileViewController assetViewModel](self, "assetViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "importState");

    -[PUTileViewController view](self, "view");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    MidX = CGRectGetMidX(v20);
    objc_msgSend(v19, "bounds");
    MidY = CGRectGetMidY(v21);
    successView = self->_successView;
    if (v4 == 2)
    {
      if (!successView)
      {
        PXImportBadgeViewForTypeAndSelectable();
        v8 = (UIView *)objc_claimAutoreleasedReturnValue();
        v9 = self->_successView;
        self->_successView = v8;

        -[UIView setCenter:](self->_successView, "setCenter:", MidX, MidY);
        objc_msgSend(v19, "addSubview:", self->_successView);
        successView = self->_successView;
      }
      -[UIView setHidden:](successView, "setHidden:", 0);
      p_progressIndicatorView = (id *)&self->_progressIndicatorView;
      progressIndicatorView = self->_progressIndicatorView;
    }
    else
    {
      -[UIView setHidden:](successView, "setHidden:", 1);
      p_progressIndicatorView = (id *)&self->_progressIndicatorView;
      progressIndicatorView = self->_progressIndicatorView;
      if (v4 == 1)
      {
        if (!progressIndicatorView)
        {
          v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
          v13 = *p_progressIndicatorView;
          *p_progressIndicatorView = (id)v12;

          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*p_progressIndicatorView, "setColor:", v14);

          objc_msgSend(v19, "bounds");
          objc_msgSend(*p_progressIndicatorView, "setFrame:");
          objc_msgSend(*p_progressIndicatorView, "setAutoresizingMask:", 18);
          objc_msgSend(v19, "addSubview:", *p_progressIndicatorView);
          progressIndicatorView = (UIActivityIndicatorView *)*p_progressIndicatorView;
        }
        -[UIActivityIndicatorView setHidden:](progressIndicatorView, "setHidden:", 0);
        objc_msgSend(*p_progressIndicatorView, "startAnimating");
        errorView = self->_errorView;
        goto LABEL_15;
      }
    }
    -[UIActivityIndicatorView setHidden:](progressIndicatorView, "setHidden:", 1);
    objc_msgSend(*p_progressIndicatorView, "stopAnimating");
    errorView = self->_errorView;
    if (v4 == 3)
    {
      if (!errorView)
      {
        PXImportBadgeViewForTypeAndSelectable();
        v16 = (UIView *)objc_claimAutoreleasedReturnValue();
        v17 = self->_errorView;
        self->_errorView = v16;

        -[UIView setCenter:](self->_errorView, "setCenter:", MidX, MidY);
        objc_msgSend(v19, "addSubview:", self->_errorView);
        errorView = self->_errorView;
      }
      v18 = 0;
      goto LABEL_16;
    }
LABEL_15:
    v18 = 1;
LABEL_16:
    -[UIView setHidden:](errorView, "setHidden:", v18);

  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];

  v6 = a4;
  v7 = a3;
  -[PUImportStatusTileViewController assetViewModel](self, "assetViewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7 && objc_msgSend(v6, "importStateChanged"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__PUImportStatusTileViewController_viewModel_didChange___block_invoke;
    v9[3] = &unk_1E58ABD10;
    v9[4] = self;
    -[PUImportStatusTileViewController performChanges:](self, "performChanges:", v9);
  }

}

- (void)applyLayoutInfo:(id)a3
{
  void *v4;
  double MidX;
  double MidY;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = self;
  v7.super_class = (Class)PUImportStatusTileViewController;
  -[PUTileViewController applyLayoutInfo:](&v7, sel_applyLayoutInfo_, a3);
  -[PUTileViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  MidX = CGRectGetMidX(v8);
  objc_msgSend(v4, "bounds");
  MidY = CGRectGetMidY(v9);
  -[UIView setCenter:](self->_successView, "setCenter:", MidX, MidY);
  -[UIView setCenter:](self->_errorView, "setCenter:", MidX, MidY);

}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (void)set_isPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_successView, 0);
}

uint64_t __56__PUImportStatusTileViewController_viewModel_didChange___block_invoke(uint64_t result)
{
  void *v1;
  void *v2;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 168) && (*(_BYTE *)(*(_QWORD *)(result + 32) + 160) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PUImportStatusTileViewController viewModel:didChange:]_block_invoke");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PUImportStatusTileViewController.m"), 162, CFSTR("invalidating %lu after it already has been updated"), 1);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(result + 32) + 152) |= 1uLL;
  return result;
}

uint64_t __54__PUImportStatusTileViewController_setAssetViewModel___block_invoke(uint64_t result)
{
  void *v1;
  void *v2;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 168) && (*(_BYTE *)(*(_QWORD *)(result + 32) + 160) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PUImportStatusTileViewController setAssetViewModel:]_block_invoke");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PUImportStatusTileViewController.m"), 63, CFSTR("invalidating %lu after it already has been updated"), 1);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(result + 32) + 152) |= 1uLL;
  return result;
}

uint64_t __47__PUImportStatusTileViewController_viewDidLoad__block_invoke(uint64_t result)
{
  void *v1;
  void *v2;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 168) && (*(_BYTE *)(*(_QWORD *)(result + 32) + 160) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PUImportStatusTileViewController viewDidLoad]_block_invoke");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PUImportStatusTileViewController.m"), 48, CFSTR("invalidating %lu after it already has been updated"), 1);

    abort();
  }
  *(_QWORD *)(*(_QWORD *)(result + 32) + 152) |= 1uLL;
  return result;
}

uint64_t __50__PUImportStatusTileViewController_becomeReusable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssetViewModel:", 0);
}

@end
