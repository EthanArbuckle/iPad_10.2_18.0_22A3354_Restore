@implementation PUOneUpSelectionIndicatorTileViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpSelectionIndicatorTileViewController;
  -[PUTileViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUOneUpSelectionIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)becomeReusable
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUOneUpSelectionIndicatorTileViewController;
  -[PUTileViewController becomeReusable](&v4, sel_becomeReusable);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__PUOneUpSelectionIndicatorTileViewController_becomeReusable__block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUOneUpSelectionIndicatorTileViewController performChanges:](self, "performChanges:", v3);
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
    v7[2] = __65__PUOneUpSelectionIndicatorTileViewController_setAssetViewModel___block_invoke;
    v7[3] = &unk_1E58ABD10;
    v7[4] = self;
    -[PUOneUpSelectionIndicatorTileViewController performChanges:](self, "performChanges:", v7);
  }

}

- (void)setBrowsingViewModel:(id)a3
{
  PUBrowsingViewModel *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = (PUBrowsingViewModel *)a3;
  if (self->_browsingViewModel != v5)
  {
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    -[PUOneUpSelectionIndicatorTileViewController assetReference](self, "assetReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PUOneUpSelectionIndicatorTileViewController assetReference](self, "assetReference");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUBrowsingViewModel assetViewModelForAssetReference:](v5, "assetViewModelForAssetReference:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__PUOneUpSelectionIndicatorTileViewController_setBrowsingViewModel___block_invoke;
      v10[3] = &unk_1E58ABCA8;
      v10[4] = self;
      v11 = v8;
      v9 = v8;
      -[PUOneUpSelectionIndicatorTileViewController performChanges:](self, "performChanges:", v10);

    }
  }

}

- (void)setAssetReference:(id)a3
{
  PUAssetReference *v5;
  PUAssetReference *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = (PUAssetReference *)a3;
  v6 = v5;
  if (self->_assetReference != v5 && !-[PUAssetReference isEqual:](v5, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_assetReference, a3);
    if (v6)
    {
      -[PUOneUpSelectionIndicatorTileViewController browsingViewModel](self, "browsingViewModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assetViewModelForAssetReference:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__PUOneUpSelectionIndicatorTileViewController_setAssetReference___block_invoke;
    v10[3] = &unk_1E58ABCA8;
    v10[4] = self;
    v11 = v8;
    v9 = v8;
    -[PUOneUpSelectionIndicatorTileViewController performChanges:](self, "performChanges:", v10);

  }
}

- (void)setActionManager:(id)a3
{
  PUAssetActionManager *v4;
  PUAssetActionManager *v5;
  _QWORD v6[5];
  PUAssetActionManager *v7;

  v4 = (PUAssetActionManager *)a3;
  v5 = v4;
  if (self->_actionManager != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__PUOneUpSelectionIndicatorTileViewController_setActionManager___block_invoke;
    v6[3] = &unk_1E58ABCA8;
    v6[4] = self;
    v7 = v4;
    -[PUOneUpSelectionIndicatorTileViewController performChanges:](self, "performChanges:", v6);

  }
}

- (id)_reviewActionManager
{
  void *v2;
  void *v3;
  id v4;

  -[PUOneUpSelectionIndicatorTileViewController actionManager](self, "actionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_selectionManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUOneUpSelectionIndicatorTileViewController _reviewActionManager](self, "_reviewActionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "selectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUOneUpSelectionIndicatorTileViewController actionManager](self, "actionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_selectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_handleButton:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[PUOneUpSelectionIndicatorTileViewController assetReference](self, "assetReference", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollection");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    -[PUOneUpSelectionIndicatorTileViewController actionManager](self, "actionManager");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject actionPerformerForSimpleActionType:onAssetReferences:](v8, "actionPerformerForSimpleActionType:onAssetReferences:", 41, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "performWithCompletionHandler:", &__block_literal_global_50999);
  }
  else
  {
    PLOneUpGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Attempted to toggle selection but could not find one of asset or assetCollection", v11, 2u);
    }
  }

}

- (void)performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[PUOneUpSelectionIndicatorTileViewController _isPerformingChanges](self, "_isPerformingChanges");
  -[PUOneUpSelectionIndicatorTileViewController _setPerformingChanges:](self, "_setPerformingChanges:", 1);
  v4[2](v4);

  -[PUOneUpSelectionIndicatorTileViewController _setPerformingChanges:](self, "_setPerformingChanges:", v5);
  if (!v5)
    -[PUOneUpSelectionIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUOneUpSelectionIndicatorTileViewController _needsUpdate](self, "_needsUpdate"))
  {
    -[PUOneUpSelectionIndicatorTileViewController _updateButtonIfNeeded](self, "_updateButtonIfNeeded");
    if (-[PUOneUpSelectionIndicatorTileViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpSelectionIndicatorTileViewController.m"), 202, CFSTR("update still needed after update pass"));

    }
  }
}

- (void)_invalidateButton
{
  -[PUOneUpSelectionIndicatorTileViewController _setNeedsUpdateButton:](self, "_setNeedsUpdateButton:", 1);
}

- (void)_updateButtonIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  PUOneUpSelectionIndicatorTileViewController *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if (-[PUOneUpSelectionIndicatorTileViewController _needsUpdateButton](self, "_needsUpdateButton"))
  {
    -[PUOneUpSelectionIndicatorTileViewController _setNeedsUpdateButton:](self, "_setNeedsUpdateButton:", 0);
    -[PUOneUpSelectionIndicatorTileViewController assetReference](self, "assetReference");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[PUOneUpSelectionIndicatorTileViewController _selectionManager](self, "_selectionManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpSelectionIndicatorTileViewController assetViewModel](self, "assetViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 && v3 && -[PUTileViewController isViewLoaded](self, "isViewLoaded") && !objc_msgSend(v4, "importState"))
    {
      -[PUOneUpSelectionIndicatorTileViewController actionManager](self, "actionManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "assetCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "canPerformActionType:onAsset:inAssetCollection:", 41, v10, v11);

      -[PUOneUpSelectionIndicatorTileViewController _button](self, "_button");
      v13 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v13;
      if (v12)
      {
        if (!v13)
        {
          -[PUTileViewController view](self, "view");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "imageWithSymbolConfiguration:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "px_tintedCircularImageWithColor:backgroundColor:", v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "imageWithSymbolConfiguration:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "px_tintedCircularImageWithColor:backgroundColor:", v15, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setImage:forState:", v23, 0);
          objc_msgSend(v5, "setImage:forState:", v23, 1);
          objc_msgSend(v5, "setImage:forState:", v20, 4);
          objc_msgSend(v5, "setImage:forState:", v20, 5);
          objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__handleButton_, 64);
          objc_msgSend(v5, "setAutoresizingMask:", 18);
          objc_msgSend(v24, "bounds");
          objc_msgSend(v5, "setFrame:");
          objc_msgSend(v24, "addSubview:", v5);
          objc_msgSend(v5, "setAlpha:", 0.0);
          -[PUOneUpSelectionIndicatorTileViewController _setButton:](self, "_setButton:", v5);

        }
        objc_msgSend(v5, "setSelected:", objc_msgSend(v3, "pu_isAssetReferenceSelected:", v25));
        v6 = self;
        v7 = 1;
        v8 = 1;
        goto LABEL_8;
      }
    }
    else
    {
      -[PUOneUpSelectionIndicatorTileViewController _button](self, "_button");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = self;
    v7 = 0;
    v8 = 0;
LABEL_8:
    -[PUOneUpSelectionIndicatorTileViewController _setButtonVisible:animated:](v6, "_setButtonVisible:animated:", v7, v8);

  }
}

- (void)_setButtonVisible:(BOOL)a3
{
  -[PUOneUpSelectionIndicatorTileViewController _setButtonVisible:animated:](self, "_setButtonVisible:animated:", a3, 0);
}

- (void)_setButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  double v12;

  if (self->__buttonVisible != a3)
  {
    v5 = a3;
    self->__buttonVisible = a3;
    -[PUOneUpSelectionIndicatorTileViewController _button](self, "_button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = 1.0;
    else
      v8 = 0.0;
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __74__PUOneUpSelectionIndicatorTileViewController__setButtonVisible_animated___block_invoke;
      v10[3] = &unk_1E58AACF0;
      v11 = v6;
      v12 = v8;
      objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 4, v10, 0, 0.15, 0.0);

    }
    else
    {
      objc_msgSend(v6, "setAlpha:", v8);
    }

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  SEL v13;
  PUOneUpSelectionIndicatorTileViewController *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[5];

  v6 = a4;
  v9 = a3;
  if ((void *)AssetExplorerSelectionManagerObservationContext == a5)
  {
    -[PUOneUpSelectionIndicatorTileViewController _selectionManager](self, "_selectionManager");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16 != v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = a2;
      v14 = self;
      v15 = 334;
LABEL_10:
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("PUOneUpSelectionIndicatorTileViewController.m"), v15, CFSTR("Expecting observable to match the current selection manager"));

      if ((v6 & 1) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)PhotosUICoreSelectionManagerObservationContext_50980 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpSelectionIndicatorTileViewController.m"), 342, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PUOneUpSelectionIndicatorTileViewController _selectionManager](self, "_selectionManager");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = a2;
      v14 = self;
      v15 = 338;
      goto LABEL_10;
    }
  }
  if ((v6 & 1) != 0)
  {
LABEL_7:
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__PUOneUpSelectionIndicatorTileViewController_observable_didChange_context___block_invoke;
    v18[3] = &unk_1E58ABD10;
    v18[4] = self;
    -[PUOneUpSelectionIndicatorTileViewController performChanges:](self, "performChanges:", v18);
  }
LABEL_8:

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];

  v6 = a4;
  v7 = a3;
  -[PUOneUpSelectionIndicatorTileViewController assetViewModel](self, "assetViewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7 && objc_msgSend(v6, "importStateChanged"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__PUOneUpSelectionIndicatorTileViewController_viewModel_didChange___block_invoke;
    v9[3] = &unk_1E58ABD10;
    v9[4] = self;
    -[PUOneUpSelectionIndicatorTileViewController performChanges:](self, "performChanges:", v9);
  }

}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (PUAssetActionManager)actionManager
{
  return self->_actionManager;
}

- (BOOL)_isPerformingChanges
{
  return self->__performingChanges;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__performingChanges = a3;
}

- (BOOL)_needsUpdateButton
{
  return self->__needsUpdateButton;
}

- (void)_setNeedsUpdateButton:(BOOL)a3
{
  self->__needsUpdateButton = a3;
}

- (UIButton)_button
{
  return self->__button;
}

- (void)_setButton:(id)a3
{
  objc_storeStrong((id *)&self->__button, a3);
}

- (BOOL)_isButtonVisible
{
  return self->__buttonVisible;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->__button, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

uint64_t __67__PUOneUpSelectionIndicatorTileViewController_viewModel_didChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateButton");
}

uint64_t __76__PUOneUpSelectionIndicatorTileViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateButton");
}

uint64_t __74__PUOneUpSelectionIndicatorTileViewController__setButtonVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

void __61__PUOneUpSelectionIndicatorTileViewController__handleButton___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Failed to perform selection action with error %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __64__PUOneUpSelectionIndicatorTileViewController_setActionManager___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_selectionManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_unregisterSelectionIndicatorObserver:", *(_QWORD *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_selectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_registerSelectionIndicatorObserver:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_invalidateButton");

}

uint64_t __65__PUOneUpSelectionIndicatorTileViewController_setAssetReference___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAssetViewModel:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateButton");
}

uint64_t __68__PUOneUpSelectionIndicatorTileViewController_setBrowsingViewModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssetViewModel:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__PUOneUpSelectionIndicatorTileViewController_setAssetViewModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateButton");
}

uint64_t __61__PUOneUpSelectionIndicatorTileViewController_becomeReusable__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAssetViewModel:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setBrowsingViewModel:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAssetReference:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setActionManager:", 0);
}

@end
