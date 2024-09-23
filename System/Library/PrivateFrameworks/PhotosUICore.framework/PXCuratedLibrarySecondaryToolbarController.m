@implementation PXCuratedLibrarySecondaryToolbarController

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if ((void *)PXStyleGuideObservationContext == a5)
  {
    if ((v6 & 0x84) != 0)
      -[PXSecondaryToolbarController invalidatePositioning](self, "invalidatePositioning");
    if ((v6 & 0x18) != 0)
      -[PXSecondaryToolbarController invalidateSecondaryToolbarLayout](self, "invalidateSecondaryToolbarLayout");
  }
  else
  {
    if ((void *)PXViewModelObservationContext_272203 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySecondaryToolbarController.m"), 63, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 0x400000) != 0)
      -[PXSecondaryToolbarController invalidateSecondaryToolbarLayout](self, "invalidateSecondaryToolbarLayout");
    if ((*(_QWORD *)&v6 & 0x400040) != 0)
      -[PXSecondaryToolbarController setNeedsUpdate](self, "setNeedsUpdate");
  }

}

- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3
{
  void *v3;
  char v4;

  -[PXCuratedLibrarySecondaryToolbarController viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsSecondaryToolbarVisible");

  return v4;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PXCuratedLibrarySecondaryToolbarController styleGuide](self, "styleGuide", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryToolbarSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (PXCuratedLibraryStyleGuide)styleGuide
{
  return self->_styleGuide;
}

- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXCuratedLibrarySecondaryToolbarController styleGuide](self, "styleGuide", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "secondaryToolbarPlacement");

  if ((unint64_t)(v4 - 1) >= 3)
    return 0;
  else
    return v4;
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3
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
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[PXCuratedLibrarySecondaryToolbarController styleGuide](self, "styleGuide", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryToolbarPadding");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (PXCuratedLibrarySecondaryToolbarController)initWithContainerView:(id)a3 legibilityContainerView:(id)a4 viewModel:(id)a5
{
  id v8;
  id v9;
  PXCuratedLibrarySecondaryToolbarController *v10;
  PXCuratedLibrarySecondaryToolbarController *v11;
  uint64_t v12;
  PXCuratedLibraryStyleGuide *styleGuide;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXCuratedLibrarySecondaryToolbarController;
  v10 = -[PXSecondaryToolbarController initWithContainerView:styleGuideProvider:](&v15, sel_initWithContainerView_styleGuideProvider_, a3, self);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_viewModel, a5);
    -[PXCuratedLibraryViewModel registerChangeObserver:context:](v11->_viewModel, "registerChangeObserver:context:", v11, PXViewModelObservationContext_272203);
    objc_msgSend(v9, "styleGuide");
    v12 = objc_claimAutoreleasedReturnValue();
    styleGuide = v11->_styleGuide;
    v11->_styleGuide = (PXCuratedLibraryStyleGuide *)v12;

    -[PXCuratedLibraryStyleGuide registerChangeObserver:context:](v11->_styleGuide, "registerChangeObserver:context:", v11, PXStyleGuideObservationContext);
    -[PXSecondaryToolbarController setLegibilityContainerView:](v11, "setLegibilityContainerView:", v8);
  }

  return v11;
}

- (void)isShowingGradientDidChange
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibrarySecondaryToolbarController;
  -[PXSecondaryToolbarController isShowingGradientDidChange](&v5, sel_isShowingGradientDidChange);
  -[PXCuratedLibrarySecondaryToolbarController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__PXCuratedLibrarySecondaryToolbarController_isShowingGradientDidChange__block_invoke;
  v4[3] = &unk_1E5143468;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3
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
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[PXCuratedLibrarySecondaryToolbarController styleGuide](self, "styleGuide", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryToolbarContentInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
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

- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3
{
  void *v3;
  char v4;

  -[PXCuratedLibrarySecondaryToolbarController styleGuide](self, "styleGuide", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "secondaryToolbarRenderedExternally");

  return v4;
}

- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[PXCuratedLibrarySecondaryToolbarController styleGuide](self, "styleGuide", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumAccessoryViewPadding");
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleGuide, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __72__PXCuratedLibrarySecondaryToolbarController_isShowingGradientDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setSecondaryToolbarLegibilityGradientIsVisible:", objc_msgSend(v2, "isShowingGradient"));

}

@end
