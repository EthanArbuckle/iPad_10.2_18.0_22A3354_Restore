@implementation PUSyndicationAttributionTileViewController

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel *v6;

  v5 = (PUAssetViewModel *)a3;
  if (self->_assetViewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUSyndicationAttributionTileViewController _setupAttributionView](self, "_setupAttributionView");
    v5 = v6;
  }

}

- (id)loadView
{
  return objc_alloc_init(_PUSyndicationAttributionTileView);
}

- (void)_setupAttributionView
{
  void *v4;
  void *v5;
  int ShouldShowAttributionViewForAsset;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  -[PUSyndicationAttributionTileViewController assetViewModel](self, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldShowAttributionViewForAsset = PXContentSyndicationShouldShowAttributionViewForAsset();

  if (ShouldShowAttributionViewForAsset)
  {
    -[PUSyndicationAttributionTileViewController assetViewModel](self, "assetViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        objc_msgSend(v8, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "copy");

        objc_msgSend(v8, "fetchPropertySetsIfNeeded");
        objc_msgSend(MEMORY[0x1E0D7B2A0], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __67__PUSyndicationAttributionTileViewController__setupAttributionView__block_invoke;
        v18[3] = &unk_1E58A6FB8;
        objc_copyWeak(&v20, &location);
        v12 = v10;
        v19 = v12;
        objc_msgSend(v11, "fetchSocialLayerHighlightForAsset:completion:", v8, v18);

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSyndicationAttributionTileViewController.m"), 79, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetViewModel.asset"), v15, v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSyndicationAttributionTileViewController.m"), 79, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetViewModel.asset"), v15);
    }

    goto LABEL_4;
  }
}

- (void)_handleHighlight:(id)a3 withAssetUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[PUSyndicationAttributionTileViewController assetViewModel](self, "assetViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if (v11)
      -[PUSyndicationAttributionTileViewController setHighlight:](self, "setHighlight:", v6);
  }
  else
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "1up nil SLHighlight from PHAsset: %{public}@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (void)setHighlight:(id)a3
{
  SLHighlight *v5;
  char v6;
  SLHighlight *v7;

  v7 = (SLHighlight *)a3;
  v5 = self->_highlight;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[SLHighlight isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      -[PUSyndicationAttributionTileViewController _invalidateAttributionView](self, "_invalidateAttributionView");
      objc_storeStrong((id *)&self->_highlight, a3);
      -[PUSyndicationAttributionTileViewController _updateAttributionView](self, "_updateAttributionView");
    }
  }

}

- (void)_invalidateAttributionView
{
  void *v3;

  -[PUSyndicationAttributionTileViewController attributionView](self, "attributionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[PUSyndicationAttributionTileViewController setAttributionView:](self, "setAttributionView:", 0);
}

- (void)_updateAttributionView
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  -[PUSyndicationAttributionTileViewController highlight](self, "highlight");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PUSyndicationAttributionTileViewController attributionView](self, "attributionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D7B2A8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "syndicated1upPillAlignment");

    if (!v3)
    {
      PXContentSyndicationAttributionViewForSocialLayerHighlight();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDelegate:", self);
      if (v5 == 1)
        v6 = 2;
      else
        v6 = 1;
      objc_msgSend(v3, "updateAlignment:", v6);
      -[PUTileViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v3);

      -[PUSyndicationAttributionTileViewController setAttributionView:](self, "setAttributionView:", v3);
    }
    -[PUTileViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;

    objc_msgSend(v3, "prepareLayoutWithMaxWidth:", v10);
    objc_msgSend(v3, "intrinsicContentSize");
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, v11, v12);

  }
  else
  {
    objc_msgSend(v3, "removeFromSuperview");

    -[PUSyndicationAttributionTileViewController setAttributionView:](self, "setAttributionView:", 0);
  }

}

- (id)contextMenuItemsForAttributionView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PUSyndicationAttributionTileViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PUSyndicationAttributionTileViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "additionalContextMenuActionsForAttributionTileViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  return v9;
}

- (BOOL)wantsVisibleRectChanges
{
  return 1;
}

- (void)didChangeVisibleRect
{
  void *v3;
  id v4;

  -[PUSyndicationAttributionTileViewController attributionView](self, "attributionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[PUSyndicationAttributionTileViewController _updateAttributionView](self, "_updateAttributionView");
    v3 = v4;
  }

}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSyndicationAttributionTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUSyndicationAttributionTileViewController _invalidateAttributionView](self, "_invalidateAttributionView");
  -[PUSyndicationAttributionTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
  -[PUSyndicationAttributionTileViewController setHighlight:](self, "setHighlight:", 0);
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUSyndicationAttributionTileViewControllerDelegate)delegate
{
  return (PUSyndicationAttributionTileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (SLAttributionView)attributionView
{
  return self->_attributionView;
}

- (void)setAttributionView:(id)a3
{
  objc_storeStrong((id *)&self->_attributionView, a3);
}

- (double)occupiedLeadingWidth
{
  return self->_occupiedLeadingWidth;
}

- (void)setOccupiedLeadingWidth:(double)a3
{
  self->_occupiedLeadingWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
}

void __67__PUSyndicationAttributionTileViewController__setupAttributionView__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleHighlight:withAssetUUID:", v4, *(_QWORD *)(a1 + 32));

}

@end
