@implementation SBHomeScreenMaterialView

+ (id)colorBurnContentImageForImage:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isSymbolImage"))
    {
      v5 = v4;
    }
    else
    {
      objc_getAssociatedObject(v4, "SBHomeScreenMaterialViewColorBurnImageAssociationKey");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        objc_msgSend(v4, "imageWithRenderingMode:", 2);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        if (v5)
          objc_setAssociatedObject(v4, "SBHomeScreenMaterialViewColorBurnImageAssociationKey", v5, (void *)1);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SBHomeScreenMaterialView)initWithFrame:(CGRect)a3 backgroundView:(id)a4 foregroundImage:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  SBHomeScreenMaterialView *v13;
  SBHomeScreenMaterialView *v14;
  void *v15;
  UIView *v16;
  void *backgroundView;
  UIView *v18;
  UIView *v19;
  UIView *v20;
  UIView *v21;
  UIView *whiteTintView;
  UIView *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UIImageView *xColorBurnView;
  UIImageView *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIImageView *xPlusDView;
  void *v33;
  void *v34;
  UIImageView *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v49 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v47.receiver = self;
  v47.super_class = (Class)SBHomeScreenMaterialView;
  v13 = -[SBHomeScreenMaterialView initWithFrame:](&v47, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[SBHomeScreenMaterialView setOpaque:](v13, "setOpaque:", 0);
    -[SBHomeScreenMaterialView layer](v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsGroupBlending:", 0);

    if (v11)
    {
      v16 = (UIView *)v11;
      backgroundView = v14->_backgroundView;
      v14->_backgroundView = v16;
    }
    else
    {
      v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v19 = v14->_backgroundView;
      v14->_backgroundView = v18;

      v20 = v14->_backgroundView;
      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
      backgroundView = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v20, "setBackgroundColor:", backgroundView);
    }

    -[SBHomeScreenMaterialView addSubview:](v14, "addSubview:", v14->_backgroundView);
    v21 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    whiteTintView = v14->_whiteTintView;
    v14->_whiteTintView = v21;

    v23 = v14->_whiteTintView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[UIView setAlpha:](v14->_whiteTintView, "setAlpha:", 0.42);
    -[SBHomeScreenMaterialView addSubview:](v14, "addSubview:", v14->_whiteTintView);
    objc_msgSend((id)objc_opt_class(), "colorBurnContentImageForImage:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v25);
    xColorBurnView = v14->_xColorBurnView;
    v14->_xColorBurnView = (UIImageView *)v26;

    v28 = v14->_xColorBurnView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.3, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v28, "setTintColor:", v29);

    -[UIImageView layer](v14->_xColorBurnView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCompositingFilter:", *MEMORY[0x1E0CD2BC0]);

    -[SBHomeScreenMaterialView addSubview:](v14, "addSubview:", v14->_xColorBurnView);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
    xPlusDView = v14->_xPlusDView;
    v14->_xPlusDView = (UIImageView *)v31;

    -[UIImageView layer](v14->_xPlusDView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCompositingFilter:", v34);

    v35 = v14->_xPlusDView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v35, "setTintColor:", v36);

    -[UIImageView setAlpha:](v14->_xPlusDView, "setAlpha:", 0.3);
    -[SBHomeScreenMaterialView addSubview:](v14, "addSubview:", v14->_xPlusDView);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[SBHomeScreenMaterialView subviews](v14, "subviews", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v44;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v44 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v41++), "setUserInteractionEnabled:", 0);
        }
        while (v39 != v41);
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v39);
    }

  }
  return v14;
}

- (SBHomeScreenMaterialView)initWithFrame:(CGRect)a3
{
  return -[SBHomeScreenMaterialView initWithFrame:backgroundView:foregroundImage:](self, "initWithFrame:backgroundView:foregroundImage:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBackgroundInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_backgroundInsets.left
    || a3.top != self->_backgroundInsets.top
    || a3.right != self->_backgroundInsets.right
    || a3.bottom != self->_backgroundInsets.bottom)
  {
    self->_backgroundInsets = a3;
    -[SBHomeScreenMaterialView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIImage)foregroundImage
{
  return -[UIImageView image](self->_xPlusDView, "image");
}

- (void)setForegroundImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBHomeScreenMaterialView foregroundImage](self, "foregroundImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[UIImageView setImage:](self->_xPlusDView, "setImage:", v6);
    objc_msgSend((id)objc_opt_class(), "colorBurnContentImageForImage:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_xColorBurnView, "setImage:", v5);
    -[SBHomeScreenMaterialView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setLegibilityStyle:(int64_t)a3
{
  UIView *whiteTintView;
  double v5;
  double v6;

  whiteTintView = self->_whiteTintView;
  v5 = 0.42;
  if (a3 == 2)
    v5 = 0.0;
  v6 = dbl_1D01931B0[a3 == 2];
  -[UIView setAlpha:](whiteTintView, "setAlpha:", v5);
  -[UIImageView setAlpha:](self->_xPlusDView, "setAlpha:", v6);
}

- (void)setHighlighted:(BOOL)a3
{
  double v3;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    v3 = 0.466666667;
    if (!a3)
      v3 = 1.0;
    -[SBHomeScreenMaterialView setBrightness:](self, "setBrightness:", v3);
  }
}

- (double)brightness
{
  double v2;

  -[UIView alpha](self->_highlightView, "alpha");
  return 1.0 - v2;
}

- (void)setBrightness:(double)a3
{
  -[SBHomeScreenMaterialView _addHighlightViewIfNecessary](self, "_addHighlightViewIfNecessary");
  -[UIView setAlpha:](self->_highlightView, "setAlpha:", 1.0 - a3);
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  objc_super v26;
  CGRect v27;

  v26.receiver = self;
  v26.super_class = (Class)SBHomeScreenMaterialView;
  -[SBHomeScreenMaterialView layoutSubviews](&v26, sel_layoutSubviews);
  -[SBHomeScreenMaterialView bounds](self, "bounds");
  -[SBHomeScreenMaterialView backgroundInsets](self, "backgroundInsets");
  UIRectIntegralWithScale();
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v7 = CGRectGetHeight(v27) * 0.5;
  -[UIView setFrame:](self->_backgroundView, "setFrame:", x, y, width, height);
  -[UIView layer](self->_backgroundView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMasksToBounds:", 1);

  -[UIView layer](self->_backgroundView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v7);

  -[UIView layer](self->_backgroundView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cornerCurve");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView setFrame:](self->_whiteTintView, "setFrame:", x, y, width, height);
  -[UIView layer](self->_whiteTintView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  objc_msgSend(v12, "setCornerRadius:", v7);

  -[UIView layer](self->_whiteTintView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerCurve:", v11);

  if (self->_imageSize.width == 0.0 && self->_imageSize.height == 0.0)
  {
    -[UIImageView image](self->_xColorBurnView, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");

  }
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[UIImageView setFrame:](self->_xColorBurnView, "setFrame:", 0);
  -[UIImageView setFrame:](self->_xPlusDView, "setFrame:", v16, v18, v20, v22);
  -[UIView setFrame:](self->_highlightView, "setFrame:", x, y, width, height);
  -[UIView layer](self->_highlightView, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCornerRadius:", v25);

  -[UIView layer](self->_highlightView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerCurve:", v11);

}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    -[SBHomeScreenMaterialView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_addHighlightViewIfNecessary
{
  _QWORD v2[5];

  if (!self->_highlightView)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __56__SBHomeScreenMaterialView__addHighlightViewIfNecessary__block_invoke;
    v2[3] = &unk_1E8D84C50;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
  }
}

uint64_t __56__SBHomeScreenMaterialView__addHighlightViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 448);
  *(_QWORD *)(v3 + 448) = v2;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", *MEMORY[0x1E0CD2EC0]);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIEdgeInsets)backgroundInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_backgroundInsets.top;
  left = self->_backgroundInsets.left;
  bottom = self->_backgroundInsets.bottom;
  right = self->_backgroundInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_xPlusDView, 0);
  objc_storeStrong((id *)&self->_xColorBurnView, 0);
  objc_storeStrong((id *)&self->_whiteTintView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
