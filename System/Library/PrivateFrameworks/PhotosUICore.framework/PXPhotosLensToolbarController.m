@implementation PXPhotosLensToolbarController

- (PXPhotosLensToolbarController)initWithViewModel:(id)a3 containerView:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXPhotosLensToolbarController *v11;
  PXPhotosLensToolbarController *v12;
  PXPhotosLensControl *v13;
  PXPhotosLensControl *photosLensControl;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLensToolbarController.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLensToolbarController.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerView"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosLensToolbarController;
  v11 = -[PXSecondaryToolbarController initWithContainerView:styleGuideProvider:](&v18, sel_initWithContainerView_styleGuideProvider_, v10, self);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewModel, a3);
    objc_msgSend(v8, "registerChangeObserver:context:", v12, ViewModelObserverContext);
    v13 = objc_alloc_init(PXPhotosLensControl);
    photosLensControl = v12->_photosLensControl;
    v12->_photosLensControl = v13;

    -[PXPhotosLensControl setHideSymbols:](v12->_photosLensControl, "setHideSymbols:", 1);
    -[PXPhotosLensControl setDelegate:](v12->_photosLensControl, "setDelegate:", v12);
    -[PXPhotosLensToolbarController _updateLensControl](v12, "_updateLensControl");
    -[PXSecondaryToolbarController setContentView:](v12, "setContentView:", v12->_photosLensControl);
  }

  return v12;
}

- (void)_updateLensControl
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXPhotosLensToolbarController viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLensToolbarController photosLensControl](self, "photosLensControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableLenses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItems:", v4);

  objc_msgSend(v6, "currentLens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedItem:", v5);

}

- (void)photosLensControl:(id)a3 didSelectItem:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[PXPhotosLensToolbarController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PXPhotosLensToolbarController_photosLensControl_didSelectItem___block_invoke;
  v8[3] = &unk_1E51437F8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performChanges:", v8);

}

- (void)photosLensControl:(id)a3 didTapOnAlreadySelectedItem:(id)a4
{
  id v5;

  -[PXSecondaryToolbarController actionHandler](self, "actionHandler", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryToolbarController:scrollToBottomAnimated:", self, 1);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  id v11;

  v9 = a3;
  if ((void *)ViewModelObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLensToolbarController.m"), 73, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 0x100000000000) != 0)
  {
    v11 = v9;
    -[PXPhotosLensToolbarController _updateLensControl](self, "_updateLensControl");
    v9 = v11;
  }

}

- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *(double *)off_1E50B8020;
  v4 = *((double *)off_1E50B8020 + 1);
  v5 = *((double *)off_1E50B8020 + 2);
  v6 = *((double *)off_1E50B8020 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  PXEdgeInsetsMake();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)secondaryToolbarControllerScrollableContentPadding:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *(double *)off_1E50B8020;
  v4 = *((double *)off_1E50B8020 + 1);
  v5 = *((double *)off_1E50B8020 + 2);
  v6 = *((double *)off_1E50B8020 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3
{
  return 2;
}

- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3
{
  return 0;
}

- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 260.0;
  v4 = 40.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3
{
  return 1;
}

- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3
{
  return 0.0;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosLensControl)photosLensControl
{
  return self->_photosLensControl;
}

- (void)setPhotosLensControl:(id)a3
{
  objc_storeStrong((id *)&self->_photosLensControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLensControl, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __65__PXPhotosLensToolbarController_photosLensControl_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCurrentLens:", *(_QWORD *)(a1 + 32));
}

@end
