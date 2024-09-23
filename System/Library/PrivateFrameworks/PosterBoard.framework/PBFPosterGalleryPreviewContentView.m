@implementation PBFPosterGalleryPreviewContentView

- (PBFPosterGalleryPreviewContentView)initWithFrame:(CGRect)a3
{
  PBFPosterGalleryPreviewContentView *v3;
  uint64_t v4;
  UIView *contentContainerView;
  UIView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBFPosterGalleryPreviewContentView;
  v3 = -[PBFPosterGalleryPreviewContentView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    contentContainerView = v3->_contentContainerView;
    v3->_contentContainerView = (UIView *)v4;

    -[UIView setClipsToBounds:](v3->_contentContainerView, "setClipsToBounds:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = v3->_contentContainerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[PBFPosterGalleryPreviewContentView addSubview:](v3, "addSubview:", v3->_contentContainerView);
  }
  return v3;
}

- (void)prepareForReuse
{
  UIView *fullScreenTransitionView;

  if (-[UIView isDescendantOfView:](self->_fullScreenTransitionView, "isDescendantOfView:", self))
    -[UIView removeFromSuperview](self->_fullScreenTransitionView, "removeFromSuperview");
  fullScreenTransitionView = self->_fullScreenTransitionView;
  self->_fullScreenTransitionView = 0;

}

- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7
{
  id v12;
  NSString *v13;

  v13 = (NSString *)a3;
  v12 = a5;
  if (self->_previewType != v13
    || !BSEqualObjects()
    || self->_layoutOrientation != a6
    || self->_index != a7)
  {
    objc_storeStrong((id *)&self->_previewType, a3);
    -[PBFPosterGalleryPreviewContentView setPosterPreviewView:](self, "setPosterPreviewView:", v12);
    self->_layoutOrientation = a6;
    self->_index = a7;
    -[PBFPosterGalleryPreviewContentView _createHiddenViewsIfNeeded](self, "_createHiddenViewsIfNeeded");
    -[PBFPosterGalleryPreviewContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PBFPosterGalleryPreviewContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  void *v12;
  __CFString *previewType;
  __CFString *v14;
  double v15;
  __CFString *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  _UIPortalView *portalView;
  UIView *fullScreenTransitionView;
  UIView *v30;
  double v31;
  UIView *contentContainerView;
  double v33;
  double v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PBFPosterGalleryPreviewContentView;
  -[PBFPosterGalleryPreviewContentView layoutSubviews](&v35, sel_layoutSubviews);
  -[PBFPosterGalleryPreviewContentView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  if (v3 != *MEMORY[0x1E0C9D820] || v4 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v10 = v3;
    v11 = v4;
    -[PBFPosterGalleryPreviewContentView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayScale");

    previewType = (__CFString *)self->_previewType;
    v14 = PBFPreviewTypeSmartAlbum;
    v15 = v11;
    v16 = PBFPreviewTypeHero;
    v17 = v10;
    v18 = v8;
    v19 = v6;
    if (previewType == PBFPreviewTypeSmartAlbum)
    {
      UIRectRoundToScale();
      v19 = v20;
      v18 = v21;
      v17 = v22;
      v15 = v23;
    }
    -[PBFPosterGalleryPreviewContentView window](self, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "screen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "posterCornerRadius");
    v34 = v27;
    -[UIView setFrame:](self->_contentContainerView, "setFrame:", v19, v18, v17, v15);
    portalView = self->_portalView;
    -[UIView bounds](self->_contentContainerView, "bounds");
    -[_UIPortalView setFrame:](portalView, "setFrame:");
    fullScreenTransitionView = self->_fullScreenTransitionView;
    -[UIView bounds](self->_contentContainerView, "bounds");
    -[UIView setFrame:](fullScreenTransitionView, "setFrame:");
    if (self->_fullScreenTransitionView)
      -[UIView bringSubviewToFront:](self->_contentContainerView, "bringSubviewToFront:");
    if (previewType == v14)
    {
      -[UIImageView setFrame:](self->_frontHiddenImageView, "setFrame:", v6, v8, v10, v11);
      UIRectRoundToScale();
      -[UIImageView setFrame:](self->_frontHiddenImageView, "setFrame:");
      -[UIImageView _setContinuousCornerRadius:](self->_frontHiddenImageView, "_setContinuousCornerRadius:", v34 * 0.839999974);
      UIRectRoundToScale();
      -[UIImageView setFrame:](self->_backHiddenImageView, "setFrame:");
      -[UIImageView _setContinuousCornerRadius:](self->_backHiddenImageView, "_setContinuousCornerRadius:", v34 * 0.720000029);
      contentContainerView = self->_contentContainerView;
      v31 = v34 * 0.964999974;
    }
    else
    {
      v30 = self->_contentContainerView;
      if (previewType == v16)
      {
        objc_msgSend(v26, "posterHeroContentSize");
        -[UIView _setCornerRadius:](v30, "_setCornerRadius:", v33 * 0.5);
        goto LABEL_15;
      }
      objc_msgSend(v26, "posterCornerRadius");
      contentContainerView = v30;
    }
    -[UIView _setContinuousCornerRadius:](contentContainerView, "_setContinuousCornerRadius:", v31);
LABEL_15:

  }
}

- (void)setPosterPreviewView:(id)a3
{
  UIView *v5;
  UIView **p_posterPreviewView;
  void *v7;
  _UIPortalView *portalView;
  _UIPortalView *v9;
  _UIPortalView *v10;
  BOOL v11;
  UIView *v12;

  v5 = (UIView *)a3;
  p_posterPreviewView = &self->_posterPreviewView;
  if (self->_posterPreviewView != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_posterPreviewView, a3);
    -[UIView accessibilityIdentifier](v12, "accessibilityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterGalleryPreviewContentView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);

    portalView = self->_portalView;
    if (portalView)
    {
      -[_UIPortalView setSourceView:](portalView, "setSourceView:", v12);
    }
    else
    {
      v9 = (_UIPortalView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D8]), "initWithSourceView:", v12);
      v10 = self->_portalView;
      self->_portalView = v9;

      -[_UIPortalView setHidesSourceView:](self->_portalView, "setHidesSourceView:", 0);
      -[_UIPortalView setMatchesPosition:](self->_portalView, "setMatchesPosition:", 0);
      -[_UIPortalView setMatchesTransform:](self->_portalView, "setMatchesTransform:", 0);
      -[_UIPortalView setAllowsBackdropGroups:](self->_portalView, "setAllowsBackdropGroups:", 1);
      -[UIView addSubview:](self->_contentContainerView, "addSubview:", self->_portalView);
    }
    v5 = v12;
    if (*p_posterPreviewView)
    {
      if (self->_portalView)
      {
        v11 = -[UIView isHidden](*p_posterPreviewView, "isHidden", v12);
        v5 = v12;
        if (!v11)
        {
          -[PBFPosterGalleryPreviewContentView setNeedsLayout](self, "setNeedsLayout", v12);
          -[PBFPosterGalleryPreviewContentView layoutIfNeeded](self, "layoutIfNeeded");
          v5 = v12;
        }
      }
    }
  }

}

- (void)prepareForFullScreenTransitionWithContentView:(id)a3
{
  UIView **p_fullScreenTransitionView;
  UIView *v6;
  id v7;

  p_fullScreenTransitionView = &self->_fullScreenTransitionView;
  objc_storeStrong((id *)&self->_fullScreenTransitionView, a3);
  v7 = a3;
  v6 = *p_fullScreenTransitionView;
  -[UIView bounds](self->_contentContainerView, "bounds");
  -[UIView setFrame:](v6, "setFrame:");
  -[UIView addSubview:](self->_contentContainerView, "addSubview:", v7);

}

- (CGRect)previewImageFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_contentContainerView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIView)contentView
{
  return self->_fullScreenTransitionView;
}

- (void)_createHiddenViewsIfNeeded
{
  UIImageView *v3;
  UIImageView *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *frontHiddenImageView;
  UIImageView *v9;
  UIImageView *v10;
  UIImageView *backHiddenImageView;
  UIImageView *v12;
  UIImageView *v13;

  if ((__CFString *)self->_previewType == PBFPreviewTypeSmartAlbum)
  {
    -[PBFPosterGalleryPreviewContentView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v6);
    v13 = (UIImageView *)objc_claimAutoreleasedReturnValue();

    if (!self->_frontHiddenImageView)
    {
      v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
      frontHiddenImageView = self->_frontHiddenImageView;
      self->_frontHiddenImageView = v7;

      -[UIImageView setContentMode:](self->_frontHiddenImageView, "setContentMode:", 0);
      -[UIImageView setClipsToBounds:](self->_frontHiddenImageView, "setClipsToBounds:", 1);
      v9 = self->_frontHiddenImageView;
      -[UIImageView posterCornerRadius](v13, "posterCornerRadius");
      -[UIImageView _setContinuousCornerRadius:](v9, "_setContinuousCornerRadius:");
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_frontHiddenImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PBFPosterGalleryPreviewContentView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_frontHiddenImageView, self->_contentContainerView);
    }
    if (!self->_backHiddenImageView)
    {
      v10 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
      backHiddenImageView = self->_backHiddenImageView;
      self->_backHiddenImageView = v10;

      -[UIImageView setContentMode:](self->_backHiddenImageView, "setContentMode:", 0);
      -[UIImageView setClipsToBounds:](self->_backHiddenImageView, "setClipsToBounds:", 1);
      v12 = self->_backHiddenImageView;
      -[UIImageView posterCornerRadius](v13, "posterCornerRadius");
      -[UIImageView _setContinuousCornerRadius:](v12, "_setContinuousCornerRadius:");
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_backHiddenImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setAlpha:](self->_backHiddenImageView, "setAlpha:", 0.959999979);
      -[PBFPosterGalleryPreviewContentView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_backHiddenImageView, self->_frontHiddenImageView);
    }
    -[PBFPosterGalleryPreviewContentView _updateHiddenImages](self, "_updateHiddenImages");
    v4 = v13;
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_frontHiddenImageView, "removeFromSuperview");
    v3 = self->_frontHiddenImageView;
    self->_frontHiddenImageView = 0;

    -[UIImageView removeFromSuperview](self->_backHiddenImageView, "removeFromSuperview");
    v4 = self->_backHiddenImageView;
    self->_backHiddenImageView = 0;
  }

}

- (void)_updateHiddenImages
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = 2 * self->_index % 6;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shuffle-top-%tu"), v3 | 1);
  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v11, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[UIImageView setImage:](self->_frontHiddenImageView, "setImage:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shuffle-top-%tu"), v3 + 2);
  v8 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[UIImageView setImage:](self->_backHiddenImageView, "setImage:", v10);

}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_contentContainerView, a3);
}

- (UIView)posterPreviewView
{
  return self->_posterPreviewView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_posterPreviewView, 0);
  objc_storeStrong((id *)&self->_previewType, 0);
  objc_storeStrong((id *)&self->_fullScreenTransitionView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_backHiddenImageView, 0);
  objc_storeStrong((id *)&self->_frontHiddenImageView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end
