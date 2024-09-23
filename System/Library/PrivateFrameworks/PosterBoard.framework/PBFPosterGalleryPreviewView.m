@implementation PBFPosterGalleryPreviewView

- (PBFPosterGalleryPreviewView)initWithFrame:(CGRect)a3
{
  PBFPosterGalleryPreviewView *v3;
  PBFPosterGalleryPreviewView *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  PBFPosterGalleryPreviewContentView *v10;
  PBFPosterGalleryPreviewContentView *posterPreviewContentView;
  PBFShadowView *v12;
  PBFShadowView *shadowView;
  PBFPosterGalleryShadowContainerView *v14;
  PBFPosterGalleryShadowContainerView *shadowContainerView;
  PBFPosterGalleryShadowContainerView *v16;
  PBFPosterGalleryPreviewComplicationContentView *v17;
  uint64_t v18;
  PBFPosterGalleryPreviewComplicationContentView *posterPreviewComplicationContentView;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PBFPosterGalleryPreviewView;
  v3 = -[PBFPosterGalleryPreviewView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBFPosterGalleryPreviewView window](v3, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "posterCornerRadius");
    v9 = v8;

    v10 = objc_alloc_init(PBFPosterGalleryPreviewContentView);
    posterPreviewContentView = v4->_posterPreviewContentView;
    v4->_posterPreviewContentView = v10;

    v12 = objc_alloc_init(PBFShadowView);
    shadowView = v4->_shadowView;
    v4->_shadowView = v12;

    -[PBFShadowView setCornerRadius:](v4->_shadowView, "setCornerRadius:", v9);
    -[PBFShadowView setShadowType:](v4->_shadowView, "setShadowType:", 2);
    v14 = -[PBFPosterGalleryShadowContainerView initWithContentView:shadowView:perspectiveEnabled:]([PBFPosterGalleryShadowContainerView alloc], "initWithContentView:shadowView:perspectiveEnabled:", v4->_posterPreviewContentView, v4->_shadowView, 0);
    shadowContainerView = v4->_shadowContainerView;
    v4->_shadowContainerView = v14;

    v16 = v4->_shadowContainerView;
    -[PBFPosterGalleryPreviewView bounds](v4, "bounds");
    -[PBFPosterGalleryShadowContainerView setFrame:](v16, "setFrame:");
    -[PBFPosterGalleryPreviewView addSubview:](v4, "addSubview:", v4->_shadowContainerView);
    v17 = [PBFPosterGalleryPreviewComplicationContentView alloc];
    -[PBFPosterGalleryPreviewView bounds](v4, "bounds");
    v18 = -[PBFPosterGalleryPreviewComplicationContentView initWithFrame:](v17, "initWithFrame:");
    posterPreviewComplicationContentView = v4->_posterPreviewComplicationContentView;
    v4->_posterPreviewComplicationContentView = (PBFPosterGalleryPreviewComplicationContentView *)v18;

    -[PBFPosterGalleryPreviewComplicationContentView setPreferredCornerRadius:](v4->_posterPreviewComplicationContentView, "setPreferredCornerRadius:", v9 != 0.0);
    -[PBFPosterGalleryPreviewView addSubview:](v4, "addSubview:", v4->_posterPreviewComplicationContentView);
  }
  return v4;
}

- (void)prepareForReuse
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8 = *MEMORY[0x1E0C9BAA8];
  v9 = v3;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PBFPosterGalleryPreviewView setTransform:](self, "setTransform:", &v8);
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v13 = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v15 = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v8 = *MEMORY[0x1E0CD2610];
  v9 = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v11 = v7;
  -[PBFPosterGalleryPreviewView setTransform3D:](self, "setTransform3D:", &v8);
  self->_posterPreviewScale = 1.0;
  self->_layoutOrientation = 1;
  -[PBFPosterGalleryPreviewContentView prepareForReuse](self->_posterPreviewContentView, "prepareForReuse");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PBFPosterGalleryPreviewView;
  -[PBFPosterGalleryPreviewView didMoveToWindow](&v14, sel_didMoveToWindow);
  -[PBFPosterGalleryPreviewView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "posterCornerRadius");
  v7 = v6;

  v8 = v7;
  if ((__CFString *)self->_previewType == PBFPreviewTypeHero)
  {
    -[PBFPosterGalleryPreviewView window](self, "window", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "posterHeroContentSize");
    v13 = v12;

    v8 = v13 / 7.0;
  }
  -[PBFShadowView setCornerRadius:](self->_shadowView, "setCornerRadius:", v8);
  -[PBFPosterGalleryPreviewComplicationContentView setPreferredCornerRadius:](self->_posterPreviewComplicationContentView, "setPreferredCornerRadius:", v7 != 0.0);
}

- (void)prepareForFullScreenTransitionWithContentView:(id)a3
{
  -[PBFPosterGalleryPreviewContentView prepareForFullScreenTransitionWithContentView:](self->_posterPreviewContentView, "prepareForFullScreenTransitionWithContentView:", a3);
}

- (void)layoutSubviews
{
  PBFPosterGalleryShadowContainerView *shadowContainerView;
  PBFPosterGalleryPreviewComplicationContentView *posterPreviewComplicationContentView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBFPosterGalleryPreviewView;
  -[PBFPosterGalleryPreviewView layoutSubviews](&v5, sel_layoutSubviews);
  shadowContainerView = self->_shadowContainerView;
  -[PBFPosterGalleryPreviewView bounds](self, "bounds");
  -[PBFPosterGalleryShadowContainerView setFrame:](shadowContainerView, "setFrame:");
  posterPreviewComplicationContentView = self->_posterPreviewComplicationContentView;
  -[PBFPosterGalleryPreviewView bounds](self, "bounds");
  -[PBFPosterGalleryPreviewComplicationContentView setFrame:](posterPreviewComplicationContentView, "setFrame:");
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PBFPosterGalleryPreviewView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[PBFPosterGalleryPreviewView intrinsicContentSize](self, "intrinsicContentSize");
  -[PBFPosterGalleryPreviewView setFrame:](self, "setFrame:", v4, v6, v7, v8);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
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
  CGSize result;

  -[PBFPosterGalleryPreviewView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((__CFString *)self->_previewType == PBFPreviewTypeHero)
    objc_msgSend(v5, "posterHeroContentSize");
  else
    objc_msgSend(v5, "posterContentSizeForOrientation:", -[PBFPosterGalleryPreviewView layoutOrientation](self, "layoutOrientation"));
  v8 = v6;
  v9 = v7;
  -[PBFPosterGalleryPreviewView posterPreviewScale](self, "posterPreviewScale");
  v11 = v8 * v10;
  -[PBFPosterGalleryPreviewView posterPreviewScale](self, "posterPreviewScale");
  v13 = v9 * v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7
{
  id v12;
  id v13;
  unint64_t index;
  NSString *v15;

  v15 = (NSString *)a3;
  v12 = a5;
  -[PBFPosterGalleryPreviewContentView updatePreviewType:scale:posterPreviewView:layoutOrientation:index:](self->_posterPreviewContentView, "updatePreviewType:scale:posterPreviewView:layoutOrientation:index:", v15, v12, a6, a7, a4);
  if (self->_layoutOrientation == a6)
  {
    -[PBFPosterGalleryPreviewContentView posterPreviewView](self->_posterPreviewContentView, "posterPreviewView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13 == v12 && BSFloatEqualToFloat() && self->_previewType == v15)
    {
      index = self->_index;

      if (index == a7)
        goto LABEL_7;
    }
    else
    {

    }
  }
  self->_previewType = v15;
  self->_posterPreviewScale = a4;
  self->_layoutOrientation = a6;
  self->_index = a7;
  -[PBFPosterGalleryPreviewComplicationContentView setLayoutOrientation:](self->_posterPreviewComplicationContentView, "setLayoutOrientation:", a6);
  -[PBFPosterGalleryPreviewView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[PBFPosterGalleryPreviewView setNeedsLayout](self, "setNeedsLayout");
LABEL_7:

}

- (CGRect)posterPreviewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PBFPosterGalleryPreviewContentView previewImageFrame](self->_posterPreviewContentView, "previewImageFrame");
  -[PBFPosterGalleryPreviewView convertRect:fromView:](self, "convertRect:fromView:", self->_posterPreviewContentView);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIView *v18;
  UIView *loadingIndicatorContainerView;
  UIView *v20;
  UIView *v21;
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
  void *v34;
  _QWORD v35[4];
  UIView *v36;
  _QWORD v37[8];

  v37[6] = *MEMORY[0x1E0C80C00];
  if (self->_showsLoadingIndicator != a3)
  {
    self->_showsLoadingIndicator = a3;
    if (a3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBackgroundColor:", v5);

      objc_msgSend(v4, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCompositingFilter:", *MEMORY[0x1E0CD2EC0]);

      objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setColor:", v8);

      objc_msgSend(v7, "startAnimating");
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v4, "addSubview:", v7);
      objc_msgSend(v4, "setAlpha:", 0.0);
      -[PBFPosterGalleryPreviewView addSubview:](self, "addSubview:", v4);
      v25 = (void *)MEMORY[0x1E0CB3718];
      v34 = v7;
      objc_msgSend(v7, "centerXAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerXAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v31;
      objc_msgSend(v7, "centerYAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerYAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v28;
      objc_msgSend(v4, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterGalleryPreviewView topAnchor](self, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v24;
      objc_msgSend(v4, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterGalleryPreviewView bottomAnchor](self, "bottomAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v37[3] = v9;
      objc_msgSend(v4, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterGalleryPreviewView leadingAnchor](self, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37[4] = v12;
      objc_msgSend(v4, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterGalleryPreviewView trailingAnchor](self, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v37[5] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "activateConstraints:", v16);

      v17 = (void *)MEMORY[0x1E0DC3F10];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __56__PBFPosterGalleryPreviewView_setShowsLoadingIndicator___block_invoke;
      v35[3] = &unk_1E86F2518;
      v18 = (UIView *)v4;
      v36 = v18;
      objc_msgSend(v17, "animateWithDuration:animations:", v35, 0.2);
      loadingIndicatorContainerView = self->_loadingIndicatorContainerView;
      self->_loadingIndicatorContainerView = v18;
      v20 = v18;

    }
    else
    {
      -[UIView removeFromSuperview](self->_loadingIndicatorContainerView, "removeFromSuperview");
      v21 = self->_loadingIndicatorContainerView;
      self->_loadingIndicatorContainerView = 0;

    }
  }
}

uint64_t __56__PBFPosterGalleryPreviewView_setShowsLoadingIndicator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (id)pbf_displayContext
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGalleryPreviewView;
  -[UIView pbf_displayContext](&v6, sel_pbf_displayContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayContextWithUpdatedInterfaceOrientation:", -[PBFPosterGalleryPreviewView layoutOrientation](self, "layoutOrientation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makeComplicationsPortalView
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D8]), "initWithSourceView:", self->_posterPreviewComplicationContentView);
  objc_msgSend(v2, "setHidesSourceView:", 0);
  objc_msgSend(v2, "setMatchesPosition:", 0);
  objc_msgSend(v2, "setMatchesTransform:", 0);
  objc_msgSend(v2, "setAllowsBackdropGroups:", 1);
  return v2;
}

- (UIView)contentView
{
  return -[PBFPosterGalleryPreviewContentView contentView](self->_posterPreviewContentView, "contentView");
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (PBFPosterGalleryPreviewComplicationContentView)complicationContentView
{
  return self->_posterPreviewComplicationContentView;
}

- (unint64_t)index
{
  return self->_index;
}

- (NSString)previewType
{
  return self->_previewType;
}

- (double)posterPreviewScale
{
  return self->_posterPreviewScale;
}

- (UIView)posterPreviewView
{
  return self->_posterPreviewView;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterPreviewView, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorContainerView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_shadowContainerView, 0);
  objc_storeStrong((id *)&self->_posterPreviewContentView, 0);
  objc_storeStrong((id *)&self->_posterPreviewComplicationContentView, 0);
}

@end
