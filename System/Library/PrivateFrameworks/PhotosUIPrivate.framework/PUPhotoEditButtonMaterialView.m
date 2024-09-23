@implementation PUPhotoEditButtonMaterialView

- (PUPhotoEditButtonMaterialView)initWithFrame:(CGRect)a3 backgroundView:(id)a4 foregroundImage:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  PUPhotoEditButtonMaterialView *v13;
  PUPhotoEditButtonMaterialView *v14;
  void *v15;
  UIView *v16;
  void *backgroundView;
  UIView *v18;
  UIView *v19;
  UIView *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  UIImageView *imageView;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v35.receiver = self;
  v35.super_class = (Class)PUPhotoEditButtonMaterialView;
  v13 = -[PUPhotoEditButtonMaterialView initWithFrame:](&v35, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[PUPhotoEditButtonMaterialView setOpaque:](v13, "setOpaque:", 0);
    -[PUPhotoEditButtonMaterialView layer](v14, "layer");
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
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

      v22 = *MEMORY[0x1E0CD2A68];
      -[UIView layer](v14->_backgroundView, "layer");
      backgroundView = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(backgroundView, "setCornerCurve:", v22);
    }

    -[PUPhotoEditButtonMaterialView addSubview:](v14, "addSubview:", v14->_backgroundView);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
    imageView = v14->_imageView;
    v14->_imageView = (UIImageView *)v23;

    -[PUPhotoEditButtonMaterialView addSubview:](v14, "addSubview:", v14->_imageView);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[PUPhotoEditButtonMaterialView subviews](v14, "subviews", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v32;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v32 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v29++), "setUserInteractionEnabled:", 0);
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v27);
    }

  }
  return v14;
}

- (PUPhotoEditButtonMaterialView)initWithFrame:(CGRect)a3
{
  return -[PUPhotoEditButtonMaterialView initWithFrame:backgroundView:foregroundImage:](self, "initWithFrame:backgroundView:foregroundImage:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBackgroundInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_backgroundInsets.left
    || a3.top != self->_backgroundInsets.top
    || a3.right != self->_backgroundInsets.right
    || a3.bottom != self->_backgroundInsets.bottom)
  {
    self->_backgroundInsets = a3;
    -[PUPhotoEditButtonMaterialView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIImage)foregroundImage
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setForegroundImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PUPhotoEditButtonMaterialView foregroundImage](self, "foregroundImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v6);
    -[PUPhotoEditButtonMaterialView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

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
    -[PUPhotoEditButtonMaterialView setBrightness:](self, "setBrightness:", v3);
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
  -[PUPhotoEditButtonMaterialView _addHighlightViewIfNecessary](self, "_addHighlightViewIfNecessary");
  -[UIView setAlpha:](self->_highlightView, "setAlpha:", 1.0 - a3);
}

- (void)setBackgroundEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v3 = a3;
  -[PUPhotoEditButtonMaterialView backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v7;

  -[PUPhotoEditButtonMaterialView backgroundColor](self, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PUPhotoEditButtonMaterialView backgroundColor](self, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v3)
    v11 = v12;
  else
    v11 = v10;
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v11);

}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  CGFloat v22;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)PUPhotoEditButtonMaterialView;
  -[PUPhotoEditButtonMaterialView layoutSubviews](&v23, sel_layoutSubviews);
  -[PUPhotoEditButtonMaterialView bounds](self, "bounds");
  -[PUPhotoEditButtonMaterialView backgroundInsets](self, "backgroundInsets");
  UIRectIntegralWithScale();
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v22 = CGRectGetHeight(v24) * 0.5;
  -[UIView setFrame:](self->_backgroundView, "setFrame:", x, y, width, height);
  -[UIView layer](self->_backgroundView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMasksToBounds:", 1);

  -[UIView layer](self->_backgroundView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v22);

  -[UIView layer](self->_backgroundView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cornerCurve");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView image](self->_imageView, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  UIRectCenteredIntegralRectScale();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[UIImageView setFrame:](self->_imageView, "setFrame:", v13, v15, v17, v19, 0);
  -[UIView setFrame:](self->_highlightView, "setFrame:", x, y, width, height);
  -[UIView layer](self->_highlightView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCornerRadius:", v22);

  -[UIView layer](self->_highlightView, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCornerCurve:", v10);

}

- (void)_addHighlightViewIfNecessary
{
  _QWORD v2[5];

  if (!self->_highlightView)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __61__PUPhotoEditButtonMaterialView__addHighlightViewIfNecessary__block_invoke;
    v2[3] = &unk_1E58ABD10;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
  }
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

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

uint64_t __61__PUPhotoEditButtonMaterialView__addHighlightViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 432);
  *(_QWORD *)(v3 + 432) = v2;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", *MEMORY[0x1E0CD2EC0]);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

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
    objc_getAssociatedObject(v3, "PUPhotoEditButtonMaterialViewColorBurnImageAssociationKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.3, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_flatImageWithColor:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        objc_setAssociatedObject(v4, "PUPhotoEditButtonMaterialViewColorBurnImageAssociationKey", v5, (void *)1);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
