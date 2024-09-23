@implementation PREditingButtonMaterialView

+ (id)colorBurnContentImageForImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_getAssociatedObject(v3, "PREditingButtonMaterialViewColorBurnImageAssociationKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.3, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_flatImageWithColor:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        objc_setAssociatedObject(v4, "PREditingButtonMaterialViewColorBurnImageAssociationKey", v5, (void *)1);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PREditingButtonMaterialView)initWithFrame:(CGRect)a3 backgroundView:(id)a4 foregroundImage:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  PREditingButtonMaterialView *v13;
  PREditingButtonMaterialView *v14;
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
  void *v28;
  uint64_t v29;
  UIImageView *xPlusDView;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v45 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v43.receiver = self;
  v43.super_class = (Class)PREditingButtonMaterialView;
  v13 = -[PREditingButtonMaterialView initWithFrame:](&v43, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[PREditingButtonMaterialView setOpaque:](v13, "setOpaque:", 0);
    -[PREditingButtonMaterialView layer](v14, "layer");
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

    -[PREditingButtonMaterialView addSubview:](v14, "addSubview:", v14->_backgroundView);
    v21 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    whiteTintView = v14->_whiteTintView;
    v14->_whiteTintView = v21;

    v23 = v14->_whiteTintView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[UIView setAlpha:](v14->_whiteTintView, "setAlpha:", 0.42);
    -[PREditingButtonMaterialView addSubview:](v14, "addSubview:", v14->_whiteTintView);
    objc_msgSend((id)objc_opt_class(), "colorBurnContentImageForImage:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v25);
    xColorBurnView = v14->_xColorBurnView;
    v14->_xColorBurnView = (UIImageView *)v26;

    -[UIImageView layer](v14->_xColorBurnView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setCompositingFilter:", *MEMORY[0x1E0CD2BC0]);

    -[PREditingButtonMaterialView addSubview:](v14, "addSubview:", v14->_xColorBurnView);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
    xPlusDView = v14->_xPlusDView;
    v14->_xPlusDView = (UIImageView *)v29;

    -[UIImageView layer](v14->_xPlusDView, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCompositingFilter:", v32);

    -[UIImageView setAlpha:](v14->_xPlusDView, "setAlpha:", 0.3);
    -[PREditingButtonMaterialView addSubview:](v14, "addSubview:", v14->_xPlusDView);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[PREditingButtonMaterialView subviews](v14, "subviews", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v40;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v40 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v37++), "setUserInteractionEnabled:", 0);
        }
        while (v35 != v37);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v35);
    }

  }
  return v14;
}

- (PREditingButtonMaterialView)initWithFrame:(CGRect)a3
{
  return -[PREditingButtonMaterialView initWithFrame:backgroundView:foregroundImage:](self, "initWithFrame:backgroundView:foregroundImage:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBackgroundInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_backgroundInsets.left
    || a3.top != self->_backgroundInsets.top
    || a3.right != self->_backgroundInsets.right
    || a3.bottom != self->_backgroundInsets.bottom)
  {
    self->_backgroundInsets = a3;
    -[PREditingButtonMaterialView setNeedsLayout](self, "setNeedsLayout");
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
  -[PREditingButtonMaterialView foregroundImage](self, "foregroundImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[UIImageView setImage:](self->_xPlusDView, "setImage:", v6);
    objc_msgSend((id)objc_opt_class(), "colorBurnContentImageForImage:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_xColorBurnView, "setImage:", v5);
    -[PREditingButtonMaterialView setNeedsLayout](self, "setNeedsLayout");

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
  v6 = dbl_18B73B200[a3 == 2];
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
    -[PREditingButtonMaterialView setBrightness:](self, "setBrightness:", v3);
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
  -[PREditingButtonMaterialView _addHighlightViewIfNecessary](self, "_addHighlightViewIfNecessary");
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
  v26.super_class = (Class)PREditingButtonMaterialView;
  -[PREditingButtonMaterialView layoutSubviews](&v26, sel_layoutSubviews);
  -[PREditingButtonMaterialView bounds](self, "bounds");
  -[PREditingButtonMaterialView backgroundInsets](self, "backgroundInsets");
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
  v25 = v7;
  objc_msgSend(v9, "setCornerRadius:", v7);

  -[UIView layer](self->_backgroundView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cornerCurve");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView setFrame:](self->_whiteTintView, "setFrame:", x, y, width, height);
  -[UIView layer](self->_whiteTintView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v7);

  -[UIView layer](self->_whiteTintView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerCurve:", v11);

  -[UIImageView image](self->_xColorBurnView, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[UIImageView setFrame:](self->_xColorBurnView, "setFrame:", v16, v18, v20, v22, 0);
  -[UIImageView setFrame:](self->_xPlusDView, "setFrame:", v16, v18, v20, v22);
  -[UIView setFrame:](self->_highlightView, "setFrame:", x, y, width, height);
  -[UIView layer](self->_highlightView, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCornerRadius:", v25);

  -[UIView layer](self->_highlightView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerCurve:", v11);

}

- (void)_addHighlightViewIfNecessary
{
  _QWORD v2[5];

  if (!self->_highlightView)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __59__PREditingButtonMaterialView__addHighlightViewIfNecessary__block_invoke;
    v2[3] = &unk_1E2184010;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
  }
}

uint64_t __59__PREditingButtonMaterialView__addHighlightViewIfNecessary__block_invoke(uint64_t a1)
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
