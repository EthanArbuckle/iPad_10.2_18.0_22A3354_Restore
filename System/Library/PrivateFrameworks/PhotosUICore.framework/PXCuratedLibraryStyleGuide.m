@implementation PXCuratedLibraryStyleGuide

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
}

- (PXCuratedLibraryStyleGuide)initWithExtendedTraitCollection:(id)a3
{
  return -[PXCuratedLibraryStyleGuide initWithExtendedTraitCollection:secondaryToolbarStyle:](self, "initWithExtendedTraitCollection:secondaryToolbarStyle:", a3, 0);
}

- (void)_update
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PXFeatureSpec *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  id v40;
  double v41;
  _QWORD v42[5];
  id v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  BOOL v55;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryStyleGuide extendedTraitCollection](self, "extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutSizeClass");
  v7 = v6;
  if (v6 <= 1)
    v8 = 1;
  else
    v8 = v6;
  v9 = objc_msgSend(v5, "userInterfaceIdiom");
  if (objc_msgSend(v4, "enableAspectFitButton"))
    v10 = v9 == 4;
  else
    v10 = 1;
  if (!v10 && v7 >= 2)
  {
    objc_msgSend(v5, "layoutOrientation");
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v4, "enableZoomInOutButton"))
    v13 = v9 == 4;
  else
    v13 = 1;
  if (v13)
  {
    v14 = 0;
    v15 = 0;
    if (v9 == 4)
      goto LABEL_34;
  }
  else if (v7 >= 2)
  {
    if (objc_msgSend(v5, "layoutOrientation") == 2)
      v14 = 1;
    else
      v14 = 2;
  }
  else
  {
    v14 = 2;
  }
  if (v8 == 2)
  {
    if ((objc_msgSend(v3, "alwaysShowSecondaryToolbarAtBottom") & 1) == 0)
    {
      v16 = 3;
      goto LABEL_31;
    }
LABEL_29:
    v15 = 2;
    goto LABEL_34;
  }
  if (objc_msgSend(v5, "layoutOrientation") == 2)
    goto LABEL_29;
  v16 = 1;
LABEL_31:
  if (-[PXCuratedLibraryStyleGuide secondaryToolbarStyle](self, "secondaryToolbarStyle") == 1)
    v15 = 2;
  else
    v15 = v16;
LABEL_34:
  v17 = -[PXFeatureSpec initWithExtendedTraitCollection:]([PXFeatureSpec alloc], "initWithExtendedTraitCollection:", v5);
  -[PXFeatureSpec contentGuideInsetsForScrollAxis:](v17, "contentGuideInsetsForScrollAxis:", 1);
  v19 = v18;
  v41 = v20;
  v21 = objc_msgSend(v5, "curatedLibraryLayoutStyle");
  +[PXPhotosChromeSpec secondaryToolbarSize](PXPhotosChromeSpec, "secondaryToolbarSize");
  v24 = v23;
  if (v15 == 3)
  {
    v25 = 0x4075400000000000;
  }
  else
  {
    v25 = 0;
    if (v15 == 2)
    {
      v26 = v22;
      if (-[PXCuratedLibraryStyleGuide secondaryToolbarStyle](self, "secondaryToolbarStyle") == 1)
      {
        v25 = v26;
      }
      else
      {
        objc_msgSend(v3, "bottomCenterSecondaryToolbarWidth");
        v25 = v27;
      }
    }
  }
  +[PXPhotosChromeSpec maximumAccessoryViewPadding](PXPhotosChromeSpec, "maximumAccessoryViewPadding");
  v29 = v28;
  if (v21 == 1)
  {
    v30 = objc_msgSend(v5, "layoutSizeClass");
    objc_msgSend(v5, "safeAreaInsets");
    +[PXPhotosChromeSpec secondaryToolbarPaddingForSizeClass:safeAreaInsets:](PXPhotosChromeSpec, "secondaryToolbarPaddingForSizeClass:safeAreaInsets:", v30);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
  }
  else
  {
    v34 = 16.0;
    v32 = 8.0;
    v24 = 0x4044000000000000;
    v36 = 8.0;
    v38 = 16.0;
  }
  v39 = objc_msgSend(v5, "userInterfaceIdiom");
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __37__PXCuratedLibraryStyleGuide__update__block_invoke;
  v42[3] = &unk_1E5119AA0;
  v44 = (v19 + v41) * 0.5;
  v45 = v15;
  v46 = v25;
  v47 = v24;
  v42[4] = self;
  v43 = v5;
  v48 = v12;
  v49 = v14;
  v55 = v39 == 5;
  v50 = v32;
  v51 = v34;
  v52 = v36;
  v53 = v38;
  v54 = v29;
  v40 = v5;
  -[PXCuratedLibraryStyleGuide performChanges:](self, "performChanges:", v42);

}

uint64_t __37__PXCuratedLibraryStyleGuide__update__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "setLateralMargin:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setSecondaryToolbarPlacement:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setSecondaryToolbarSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (*(_QWORD *)(a1 + 56) == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "safeAreaInsets");
    objc_msgSend(*(id *)(a1 + 32), "secondaryToolbarSize");
    PXEdgeInsetsMake();
  }
  else
  {
    v2 = *(double *)off_1E50B8020;
    v3 = *((double *)off_1E50B8020 + 1);
    v4 = *((double *)off_1E50B8020 + 2);
    v5 = *((double *)off_1E50B8020 + 3);
  }
  objc_msgSend(*(id *)(a1 + 32), "setSecondaryToolbarContentInsets:", v2, v3, v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "setToggleAspectFitButtonPlacement:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setZoomButtonsButtonPlacement:", *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "setSecondaryToolbarRenderedExternally:", *(unsigned __int8 *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 32), "setSecondaryToolbarPadding:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  return objc_msgSend(*(id *)(a1 + 32), "setMaximumAccessoryViewPadding:", *(double *)(a1 + 128));
}

- (void)setZoomButtonsButtonPlacement:(int64_t)a3
{
  if (self->_zoomButtonsButtonPlacement != a3)
  {
    self->_zoomButtonsButtonPlacement = a3;
    -[PXCuratedLibraryStyleGuide signalChange:](self, "signalChange:", 64);
  }
}

- (void)setToggleAspectFitButtonPlacement:(int64_t)a3
{
  if (self->_toggleAspectFitButtonPlacement != a3)
  {
    self->_toggleAspectFitButtonPlacement = a3;
    -[PXCuratedLibraryStyleGuide signalChange:](self, "signalChange:", 32);
  }
}

- (void)setSecondaryToolbarSize:(CGSize)a3
{
  if (a3.width != self->_secondaryToolbarSize.width || a3.height != self->_secondaryToolbarSize.height)
  {
    self->_secondaryToolbarSize = a3;
    -[PXCuratedLibraryStyleGuide signalChange:](self, "signalChange:", 8);
  }
}

- (void)setSecondaryToolbarPlacement:(int64_t)a3
{
  if (self->_secondaryToolbarPlacement != a3)
  {
    self->_secondaryToolbarPlacement = a3;
    -[PXCuratedLibraryStyleGuide signalChange:](self, "signalChange:", 4);
  }
}

- (void)setSecondaryToolbarContentInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_secondaryToolbarContentInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_secondaryToolbarContentInsets = &self->_secondaryToolbarContentInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_secondaryToolbarContentInsets->top = top;
    p_secondaryToolbarContentInsets->left = left;
    p_secondaryToolbarContentInsets->bottom = bottom;
    p_secondaryToolbarContentInsets->right = right;
    -[PXCuratedLibraryStyleGuide signalChange:](self, "signalChange:", 16);
  }
}

- (void)setLateralMargin:(double)a3
{
  if (self->_lateralMargin != a3)
  {
    self->_lateralMargin = a3;
    -[PXCuratedLibraryStyleGuide signalChange:](self, "signalChange:", 1);
  }
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXExtendedTraitCollectionObservationContext_21757 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryStyleGuide.m"), 263, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x14A) != 0)
  {
    v11 = v9;
    -[PXCuratedLibraryStyleGuide _invalidate](self, "_invalidate");
    v9 = v11;
  }

}

- (int64_t)secondaryToolbarPlacement
{
  return self->_secondaryToolbarPlacement;
}

- (int64_t)zoomButtonsButtonPlacement
{
  return self->_zoomButtonsButtonPlacement;
}

- (int64_t)toggleAspectFitButtonPlacement
{
  return self->_toggleAspectFitButtonPlacement;
}

- (double)lateralMargin
{
  return self->_lateralMargin;
}

- (CGSize)secondaryToolbarSize
{
  double width;
  double height;
  CGSize result;

  width = self->_secondaryToolbarSize.width;
  height = self->_secondaryToolbarSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)secondaryToolbarPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_secondaryToolbarPadding.top;
  left = self->_secondaryToolbarPadding.left;
  bottom = self->_secondaryToolbarPadding.bottom;
  right = self->_secondaryToolbarPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXCuratedLibraryStyleGuide)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryStyleGuide.m"), 41, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryStyleGuide init]");

  abort();
}

- (PXCuratedLibraryStyleGuide)initWithExtendedTraitCollection:(id)a3 secondaryToolbarStyle:(unint64_t)a4
{
  id v7;
  PXCuratedLibraryStyleGuide *v8;
  PXCuratedLibraryStyleGuide *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryStyleGuide;
  v8 = -[PXCuratedLibraryStyleGuide init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_extendedTraitCollection, a3);
    v9->_secondaryToolbarStyle = a4;
    -[PXExtendedTraitCollection registerChangeObserver:context:](v9->_extendedTraitCollection, "registerChangeObserver:context:", v9, PXExtendedTraitCollectionObservationContext_21757);
    -[PXCuratedLibraryStyleGuide _update](v9, "_update");
  }

  return v9;
}

- (id)zoomLevelControlTextColorOverLegibilityGradient:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setButtonStyle:(int64_t)a3
{
  if (self->_buttonStyle != a3)
  {
    self->_buttonStyle = a3;
    -[PXCuratedLibraryStyleGuide signalChange:](self, "signalChange:", 2);
  }
}

- (void)setSecondaryToolbarPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_secondaryToolbarPadding;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_secondaryToolbarPadding = &self->_secondaryToolbarPadding;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_secondaryToolbarPadding->top = top;
    p_secondaryToolbarPadding->left = left;
    p_secondaryToolbarPadding->bottom = bottom;
    p_secondaryToolbarPadding->right = right;
    -[PXCuratedLibraryStyleGuide signalChange:](self, "signalChange:", 128);
  }
}

- (UIEdgeInsets)secondaryToolbarContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_secondaryToolbarContentInsets.top;
  left = self->_secondaryToolbarContentInsets.left;
  bottom = self->_secondaryToolbarContentInsets.bottom;
  right = self->_secondaryToolbarContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)maximumAccessoryViewPadding
{
  return self->_maximumAccessoryViewPadding;
}

- (void)setMaximumAccessoryViewPadding:(double)a3
{
  self->_maximumAccessoryViewPadding = a3;
}

- (BOOL)secondaryToolbarRenderedExternally
{
  return self->_secondaryToolbarRenderedExternally;
}

- (void)setSecondaryToolbarRenderedExternally:(BOOL)a3
{
  self->_secondaryToolbarRenderedExternally = a3;
}

- (unint64_t)secondaryToolbarStyle
{
  return self->_secondaryToolbarStyle;
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

@end
