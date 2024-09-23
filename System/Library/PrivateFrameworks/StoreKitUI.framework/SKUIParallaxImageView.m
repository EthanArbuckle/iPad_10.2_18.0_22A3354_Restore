@implementation SKUIParallaxImageView

- (SKUIParallaxImageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIParallaxImageView *v8;
  SKUIImageView *v9;
  uint64_t v10;
  SKUIImageView *innerImageView;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIParallaxImageView initWithFrame:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIParallaxImageView;
  v8 = -[SKUIParallaxImageView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [SKUIImageView alloc];
    -[SKUIParallaxImageView bounds](v8, "bounds");
    v10 = -[SKUIImageView initWithFrame:](v9, "initWithFrame:");
    innerImageView = v8->_innerImageView;
    v8->_innerImageView = (SKUIImageView *)v10;

    -[SKUIParallaxImageView addSubview:](v8, "addSubview:", v8->_innerImageView);
    -[SKUIParallaxImageView setClipsToBounds:](v8, "setClipsToBounds:", 1);
  }
  return v8;
}

- (void)setImagePadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_imagePadding.left
    || a3.top != self->_imagePadding.top
    || a3.right != self->_imagePadding.right
    || a3.bottom != self->_imagePadding.bottom)
  {
    self->_imagePadding = a3;
    -[SKUIParallaxImageView _updateInnerImageView](self, "_updateInnerImageView");
    -[SKUIParallaxImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)image
{
  return (id)-[SKUIImageView image](self->_innerImageView, "image");
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImage:(id)a3
{
  -[SKUIImageView setImage:](self->_innerImageView, "setImage:", a3);
}

- (id)placeholder
{
  return -[SKUIImageView placeholder](self->_innerImageView, "placeholder");
}

- (void)setPlaceholder:(id)a3
{
  -[SKUIImageView setPlaceholder:](self->_innerImageView, "setPlaceholder:", a3);
}

- (void)setImageSize:(CGSize)a3
{
  if (a3.width != self->_imageSize.width || a3.height != self->_imageSize.height)
  {
    self->_imageSize = a3;
    -[SKUIParallaxImageView _updateInnerImageView](self, "_updateInnerImageView");
    -[SKUIParallaxImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  return 0.0;
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SKUIImageView *innerImageView;
  double top;
  double left;
  double bottom;
  double right;
  SKUIImageView *v25;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGRect v30;
  CGRect v31;

  -[SKUIParallaxImageView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[SKUIParallaxImageView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIParallaxImageView convertPoint:toView:](self, "convertPoint:toView:", v7, v4, v6);
  v9 = v8;
  v11 = v10;

  -[SKUIParallaxImageView window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v13 = v9 / CGRectGetWidth(v30);

  -[SKUIParallaxImageView window](self, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v15 = (v11 + -64.0) / (CGRectGetHeight(v31) + -128.0);

  v16 = 1.0;
  if (v13 <= 1.0)
    v17 = v13;
  else
    v17 = 1.0;
  v18 = fmax(v17, 0.0);
  if (v15 <= 1.0)
    v16 = v15;
  v19 = fmax(v16, 0.0);
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  innerImageView = self->_innerImageView;
  if (innerImageView)
  {
    -[SKUIImageView transform](innerImageView, "transform");
  }
  else
  {
    v27 = 0uLL;
    v28 = 0uLL;
  }
  top = self->_imagePadding.top;
  left = self->_imagePadding.left;
  bottom = self->_imagePadding.bottom;
  right = self->_imagePadding.right;
  *(double *)&v29 = v18 * (left + right);
  *((double *)&v29 + 1) = v19 * (top + bottom);
  if (right > 0.00000011920929 && left < 0.00000011920929)
    *(double *)&v29 = -(v18 * (left + right));
  if (bottom > 0.00000011920929 && top < 0.00000011920929)
    *((double *)&v29 + 1) = -(v19 * (top + bottom));
  v25 = self->_innerImageView;
  v26[0] = v27;
  v26[1] = v28;
  v26[2] = v29;
  -[SKUIImageView setTransform:](v25, "setTransform:", v26);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SKUIParallaxImageView frame](self, "frame");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)SKUIParallaxImageView;
    -[SKUIParallaxImageView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    -[SKUIParallaxImageView _updateInnerImageView](self, "_updateInnerImageView");
    -[SKUIParallaxImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_updateInnerImageView
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;

  -[SKUIParallaxImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = self->_imagePadding.left + self->_imagePadding.right;
  v9 = v8 + v7;
  v10 = self->_imagePadding.top + self->_imagePadding.bottom;
  v12 = v11 + v10;
  -[SKUIImageView setImageSize:](self->_innerImageView, "setImageSize:", v7 + self->_imageSize.width, v10 + self->_imageSize.height);
  -[SKUIImageView setFrame:](self->_innerImageView, "setFrame:", v4, v6, v9, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerImageView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIParallaxImageView initWithFrame:]";
}

@end
