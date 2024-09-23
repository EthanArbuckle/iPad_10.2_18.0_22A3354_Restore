@implementation PXImageUIView

- (PXImageUIView)initWithFrame:(CGRect)a3
{
  PXImageUIView *v3;
  PXImageUIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXImageUIView;
  v3 = -[PXImageUIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXImageUIView _PXImageUIViewInitialization](v3, "_PXImageUIViewInitialization");
  return v4;
}

- (PXImageUIView)initWithCoder:(id)a3
{
  PXImageUIView *v3;
  PXImageUIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXImageUIView;
  v3 = -[PXImageUIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PXImageUIView _PXImageUIViewInitialization](v3, "_PXImageUIViewInitialization");
  return v4;
}

- (void)setSpec:(id)a3
{
  PXImageViewSpec *v5;
  PXImageViewSpec **p_spec;
  void *v7;
  PXImageViewSpec *v8;

  v5 = (PXImageViewSpec *)a3;
  p_spec = &self->_spec;
  if (self->_spec != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXImageUIView setFloatingViewEnabled:](self, "setFloatingViewEnabled:", -[PXImageViewSpec shouldEnableFocus](*p_spec, "shouldEnableFocus"));
    -[PXImageUIView _updateFloatingOverlay](self, "_updateFloatingOverlay");
    -[PXImageUIView _updateCorners](self, "_updateCorners");
    -[PXImageViewSpec overlaySpecs](*p_spec, "overlaySpecs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageUIView _setOverlaySpecs:](self, "_setOverlaySpecs:", v7);

    v5 = v8;
  }

}

- (void)setImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_image != v6)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[PXImageUIView _imageView](self, "_imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

    -[PXImageUIView _updateFloatingOverlay](self, "_updateFloatingOverlay");
    -[PXImageUIView _updateCorners](self, "_updateCorners");
  }

}

- (void)setContentMode:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXImageUIView;
  -[PXImageUIView setContentMode:](&v6, sel_setContentMode_);
  -[PXImageUIView _imageView](self, "_imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", a3);

}

- (id)focusEffect
{
  void *v3;
  void *v4;
  void *v5;

  -[PXImageUIView _cornerView](self, "_cornerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "focusInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "makeHaloEffectForSourceView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)allowsFocus
{
  void *v2;
  char v3;

  -[PXImageUIView _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsFocus");

  return v3;
}

- (void)setAllowsFocus:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXImageUIView _imageView](self, "_imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsFocus:", v3);

}

- (BOOL)drawsFocusRing
{
  void *v2;
  char v3;

  -[PXImageUIView _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "drawsFocusRing");

  return v3;
}

- (void)setDrawsFocusRing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXImageUIView _imageView](self, "_imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDrawsFocusRing:", v3);

}

- (void)_PXImageUIViewInitialization
{
  void *v3;
  PXFocusableUIImageView *v4;
  PXFocusableUIImageView *imageView;
  PXFocusableUIImageView *v6;
  PXFocusableUIImageView *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *overlayViews;

  -[PXImageUIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 0);

  v4 = objc_alloc_init(PXFocusableUIImageView);
  imageView = self->__imageView;
  self->__imageView = v4;

  v6 = self->__imageView;
  -[PXImageUIView bounds](self, "bounds");
  -[PXFocusableUIImageView setFrame:](v6, "setFrame:");
  -[PXFocusableUIImageView setUserInteractionEnabled:](self->__imageView, "setUserInteractionEnabled:", 1);
  -[PXFocusableUIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->__imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[PXFocusableUIImageView setClipsToBounds:](self->__imageView, "setClipsToBounds:", 1);
  -[PXFocusableUIImageView setAutoresizingMask:](self->__imageView, "setAutoresizingMask:", 18);
  v7 = self->__imageView;
  objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFocusableUIImageView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[PXImageUIView addSubview:](self, "addSubview:", self->__imageView);
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  overlayViews = self->_overlayViews;
  self->_overlayViews = v9;

  -[PXImageUIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[PXImageUIView setFloatingRotationEnabled:](self, "setFloatingRotationEnabled:", 1);
}

- (UIView)contentView
{
  return (UIView *)self->__imageView;
}

- (void)setFloatingViewEnabled:(BOOL)a3
{
  if (self->_floatingViewEnabled != a3)
  {
    self->_floatingViewEnabled = a3;
    -[PXImageUIView _updateCorners](self, "_updateCorners");
  }
}

- (void)_setOverlaySpecs:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *overlaySpecs;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  void *v29;
  NSArray *v30;
  void *v31;
  NSArray *obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v5 = self->__overlaySpecs;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSArray isEqual:](v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = (NSArray *)-[NSArray copy](v4, "copy");
      overlaySpecs = self->__overlaySpecs;
      self->__overlaySpecs = v8;

      -[NSMutableArray makeObjectsPerformSelector:](self->_overlayViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
      -[NSMutableArray removeAllObjects](self->_overlayViews, "removeAllObjects");
      -[PXImageUIView _imageView](self, "_imageView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = self->__overlaySpecs;
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v18)
      {
        v19 = v18;
        v30 = v4;
        v20 = 0;
        v21 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v11, v13, v15, v17);
            objc_msgSend(v24, "setAutoresizingMask:", 18);
            objc_msgSend(v24, "layer");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD2780], "px_filterWithPXCompositingFilterType:", objc_msgSend(v23, "compositingFilterType"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setCompositingFilter:", v26);
            objc_msgSend(v23, "backgroundColor");
            v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v25, "setBackgroundColor:", objc_msgSend(v27, "CGColor"));

            -[NSMutableArray addObject:](self->_overlayViews, "addObject:", v24);
            if (self->_floatingViewEnabled)
              -[PXImageUIView _updateFloatingOverlay](self, "_updateFloatingOverlay");
            else
              objc_msgSend(v31, "addSubview:", v24);
            v20 |= v26 != 0;

          }
          v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v19);
        v28 = v20 ^ 1;
        v4 = v30;
      }
      else
      {
        v28 = 1;
      }

      objc_msgSend(v31, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAllowsGroupBlending:", v28 & 1);

      -[PXImageUIView _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
    }
  }

}

- (void)setFloatingRotationEnabled:(BOOL)a3
{
  if (self->_floatingRotationEnabled != a3)
  {
    self->_floatingRotationEnabled = a3;
    -[PXImageUIView _updateCorners](self, "_updateCorners");
  }
}

- (void)setFloatingOverlay:(id)a3 withInsets:(UIEdgeInsets)a4 parallax:(BOOL)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIView *v12;
  UIView *v13;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v12 = (UIView *)a3;
  if (self->_floatingOverlayView != v12)
  {
    v13 = v12;
    objc_storeStrong((id *)&self->_floatingOverlayView, a3);
    self->_floatingInsets.top = top;
    self->_floatingInsets.left = left;
    self->_floatingInsets.bottom = bottom;
    self->_floatingInsets.right = right;
    self->_hasParallax = a5;
    -[PXImageUIView _updateFloatingOverlay](self, "_updateFloatingOverlay");
    v12 = v13;
  }

}

- (void)_updateFloatingOverlay
{
  UIView *floatingOverlayView;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  if (self->_floatingOverlayView)
  {
    -[PXImageUIView _imageView](self, "_imageView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 0);
    floatingOverlayView = self->_floatingOverlayView;
    objc_msgSend(v11, "bounds");
    PXEdgeInsetsInsetRect();
    -[UIView setFrame:](floatingOverlayView, "setFrame:");
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 1);
    objc_msgSend(v11, "_layeredImageContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = 20.0;
    else
      v6 = 60.0;
    objc_msgSend(v5, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOverlayDepth:", v6);

    -[UIView layer](self->_floatingOverlayView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.200000003);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

    -[UIView layer](self->_floatingOverlayView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setOverlayLayer:", v10);

  }
}

- (void)_updateCorners
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  PXRoundedCornerOverlayView *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  double v27;

  -[PXImageUIView spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadius");
  v5 = v4;
  v6 = objc_msgSend(v3, "roundedCornersMode");
  -[PXImageUIView _imageView](self, "_imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXImageUIView floatingViewEnabled](self, "floatingViewEnabled"))
  {
    objc_msgSend(v7, "setClipsToBounds:", 1);
    if (v5 > 0.0 && v6 == 1)
    {
      +[PXMemoriesFeedSettings sharedInstance](PXMemoriesFeedSettings, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "disableRoundedOverlays");

      -[PXImageUIView _cornerView](self, "_cornerView");
      v17 = objc_claimAutoreleasedReturnValue();
      v8 = (PXRoundedCornerOverlayView *)v17;
      if ((v16 & 1) == 0)
      {
        if (!v17)
        {
          v8 = objc_alloc_init(PXRoundedCornerOverlayView);
          -[PXRoundedCornerOverlayView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
          -[PXRoundedCornerOverlayView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
          -[PXImageUIView _setCornerView:](self, "_setCornerView:", v8);
          -[PXImageUIView addSubview:](self, "addSubview:", v8);
          -[PXImageUIView _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
        }
        -[PXImageUIView bounds](self, "bounds");
        -[PXRoundedCornerOverlayView setFrame:](v8, "setFrame:");
        v22 = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __31__PXImageUIView__updateCorners__block_invoke;
        v25 = &unk_1E5141A70;
        v27 = v5;
        v26 = v3;
        -[PXRoundedCornerOverlayView performChanges:](v8, "performChanges:", &v22);

        v18 = 0;
        v5 = 0.0;
        goto LABEL_22;
      }
    }
    else
    {
      -[PXImageUIView _cornerView](self, "_cornerView");
      v8 = (PXRoundedCornerOverlayView *)objc_claimAutoreleasedReturnValue();
    }
    v18 = 1;
LABEL_22:
    -[PXRoundedCornerOverlayView setHidden:](v8, "setHidden:", v18, v22, v23, v24, v25);
    objc_msgSend(v7, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCornerRadius:", v5);

    goto LABEL_23;
  }
  objc_msgSend(v7, "_layeredImageContainer");
  v8 = (PXRoundedCornerOverlayView *)objc_claimAutoreleasedReturnValue();
  -[PXRoundedCornerOverlayView config](v8, "config");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setLayeredImageCornerRadius:", v5);
  objc_msgSend(v9, "defaultFocusedShadowRadius");
  objc_msgSend(v9, "setDefaultUnfocusedShadowRadius:");
  v10 = 0.0;
  if (self->_hasParallax)
    objc_msgSend(v9, "maximumParallaxDepth", 0.0);
  objc_msgSend(v9, "setOverlayDepth:", v10);
  v11 = 0.0799999982;
  if (!self->_floatingRotationEnabled)
    v11 = 0.0;
  objc_msgSend(v9, "setRotationAmount:", v11);
  if (self->_floatingRotationEnabled)
  {
    objc_msgSend(v9, "translationOffset");
  }
  else
  {
    v12 = 8.0;
    v13 = 8.0;
  }
  objc_msgSend(v9, "setTranslationOffset:", v12, v13);
  v19 = 0.200000003;
  if (!self->_floatingRotationEnabled)
    v19 = 0.0;
  objc_msgSend(v9, "setSpecularOpacity:", v19);
  objc_msgSend(v9, "setBoostBrightness:", self->_floatingRotationEnabled);
  objc_msgSend(v9, "setAllowsNonOpaqueShadow:", 0);
  -[PXImageUIView _cornerView](self, "_cornerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeFromSuperview");

  -[PXImageUIView _setCornerView:](self, "_setCornerView:", 0);
  objc_msgSend(v7, "setClipsToBounds:", 0);

LABEL_23:
}

- (void)_updateSubviewsOrdering
{
  NSMutableArray *overlayViews;
  void *v4;
  _QWORD v5[5];

  overlayViews = self->_overlayViews;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PXImageUIView__updateSubviewsOrdering__block_invoke;
  v5[3] = &unk_1E5136418;
  v5[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](overlayViews, "enumerateObjectsUsingBlock:", v5);
  -[PXImageUIView _cornerView](self, "_cornerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageUIView bringSubviewToFront:](self, "bringSubviewToFront:", v4);

}

- (void)setAnimating:(BOOL)a3
{
  -[PXImageUIView setAnimating:withFlags:](self, "setAnimating:withFlags:", a3, 0);
}

- (void)setAnimating:(BOOL)a3 withFlags:(unint64_t)a4
{
  uint64_t v5;
  UIView *snapshotView;
  UIView *v7;
  id v8;

  if (self->_animating != a3)
  {
    self->_animating = a3;
    v5 = a3 & (a4 >> 1);
    snapshotView = self->_snapshotView;
    if (snapshotView)
    {
      -[UIView removeFromSuperview](snapshotView, "removeFromSuperview");
      v7 = self->_snapshotView;
      self->_snapshotView = 0;

    }
    -[PXImageUIView _imageView](self, "_imageView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v5);

  }
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentsRect;
  void *v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(self->_contentsRect, a3))
  {
    p_contentsRect->origin.x = x;
    p_contentsRect->origin.y = y;
    p_contentsRect->size.width = width;
    p_contentsRect->size.height = height;
    -[PXImageUIView _imageView](self, "_imageView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsRect:", p_contentsRect->origin.x, p_contentsRect->origin.y, p_contentsRect->size.width, p_contentsRect->size.height);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[PXImageUIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (v7 != v9)
    -[PXImageUIView _updateCorners](self, "_updateCorners");
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (PXImageViewSpec)spec
{
  return self->_spec;
}

- (BOOL)floatingViewEnabled
{
  return self->_floatingViewEnabled;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)isFloatingRotationEnabled
{
  return self->_floatingRotationEnabled;
}

- (PXFocusableUIImageView)_imageView
{
  return self->__imageView;
}

- (PXRoundedCornerOverlayView)_cornerView
{
  return self->__cornerView;
}

- (void)_setCornerView:(id)a3
{
  objc_storeStrong((id *)&self->__cornerView, a3);
}

- (NSArray)_overlaySpecs
{
  return self->__overlaySpecs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__overlaySpecs, 0);
  objc_storeStrong((id *)&self->__cornerView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_floatingOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayViews, 0);
}

uint64_t __40__PXImageUIView__updateSubviewsOrdering__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", a2);
}

void __31__PXImageUIView__updateCorners__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setCornerRadius:", v3);
  objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v4, "setDisplayScale:");

}

@end
