@implementation SKUISlideshowImageScrollView

- (SKUISlideshowImageScrollView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUISlideshowImageScrollView *v8;
  SKUISlideshowImageScrollView *v9;
  UIImage *image;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISlideshowImageScrollView initWithFrame:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUISlideshowImageScrollView;
  v8 = -[SKUISlideshowImageScrollView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUISlideshowImageScrollView setShowsHorizontalScrollIndicator:](v8, "setShowsHorizontalScrollIndicator:", 0);
    -[SKUISlideshowImageScrollView setShowsVerticalScrollIndicator:](v9, "setShowsVerticalScrollIndicator:", 0);
    -[SKUISlideshowImageScrollView setBouncesZoom:](v9, "setBouncesZoom:", 1);
    -[SKUISlideshowImageScrollView setDecelerationRate:](v9, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    image = v9->_image;
    v9->_image = 0;

    v9->_centerPointBeforeResize = (CGPoint)*MEMORY[0x1E0C9D538];
    v9->_scaleBeforeResize = 0.0;
  }
  return v9;
}

- (void)resetZoomScale
{
  -[SKUISlideshowImageScrollView minimumZoomScale](self, "minimumZoomScale");
  -[SKUISlideshowImageScrollView setZoomScale:](self, "setZoomScale:");
}

- (void)zoomIntoPoint:(CGPoint)a3
{
  double y;
  double x;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  y = a3.y;
  x = a3.x;
  -[SKUISlideshowImageScrollView zoomScale](self, "zoomScale");
  v7 = v6;
  -[SKUISlideshowImageScrollView minimumZoomScale](self, "minimumZoomScale");
  if (v7 == v8)
  {
    -[SKUISlideshowImageScrollView maximumZoomScale](self, "maximumZoomScale");
    v10 = v9;
    -[SKUISlideshowImageScrollView contentSize](self, "contentSize");
    v12 = v11;
    -[SKUISlideshowImageScrollView zoomScale](self, "zoomScale");
    v14 = v12 / v13;
    -[SKUISlideshowImageScrollView contentSize](self, "contentSize");
    v16 = v15;
    -[SKUISlideshowImageScrollView zoomScale](self, "zoomScale");
    v18 = v16 / v17;
    -[SKUISlideshowImageScrollView bounds](self, "bounds");
    v20 = v14 * (x / v19);
    -[SKUISlideshowImageScrollView bounds](self, "bounds");
    v22 = v18 * (y / v21);
    -[SKUISlideshowImageScrollView bounds](self, "bounds");
    v24 = v23 / v10;
    -[SKUISlideshowImageScrollView bounds](self, "bounds");
    -[SKUISlideshowImageScrollView zoomToRect:animated:](self, "zoomToRect:animated:", 1, v20 - v24 * 0.5, v22 - v25 / v10 * 0.5, v24);
  }
  else
  {
    -[SKUISlideshowImageScrollView minimumZoomScale](self, "minimumZoomScale");
    -[SKUISlideshowImageScrollView setZoomScale:animated:](self, "setZoomScale:animated:", 1);
  }
}

- (CGRect)visibleRect
{
  double v3;
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
  CGRect result;

  -[SKUISlideshowImageScrollView contentOffset](self, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[SKUISlideshowImageScrollView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  -[SKUISlideshowImageScrollView zoomScale](self, "zoomScale");
  v12 = v6 / v11;
  v13 = v8 / v11;
  v14 = v10 / v11;
  v15 = v4 / v11;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v15;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  double Height;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)SKUISlideshowImageScrollView;
  -[SKUISlideshowImageScrollView layoutSubviews](&v9, sel_layoutSubviews);
  if (self->_imageView)
  {
    -[SKUISlideshowImageScrollView bounds](self, "bounds");
    Width = CGRectGetWidth(v10);
    -[SKUISlideshowImageScrollView bounds](self, "bounds");
    Height = CGRectGetHeight(v11);
    -[UIImageView frame](self->_imageView, "frame");
    v7 = (Width - v6) * 0.5;
    if (v6 >= Width)
      v7 = 0.0;
    v8 = (Height - v5) * 0.5;
    if (v5 >= Height)
      v8 = 0.0;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v7, v8);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SKUISlideshowImageScrollView frame](self, "frame");
  if (width == v9 && height == v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUISlideshowImageScrollView;
    -[SKUISlideshowImageScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  }
  else
  {
    -[SKUISlideshowImageScrollView _prepareToResize](self, "_prepareToResize");
    v11.receiver = self;
    v11.super_class = (Class)SKUISlideshowImageScrollView;
    -[SKUISlideshowImageScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    -[SKUISlideshowImageScrollView _recoverFromResize](self, "_recoverFromResize");
  }
}

- (void)setImage:(id)a3
{
  UIImageView *imageView;
  UIImageView *v6;
  UIImageView *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_image, a3);
  imageView = self->_imageView;
  if (imageView)
    -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
  v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
  v7 = self->_imageView;
  self->_imageView = v6;

  -[SKUISlideshowImageScrollView addSubview:](self, "addSubview:", self->_imageView);
  objc_msgSend(v8, "size");
  -[SKUISlideshowImageScrollView setContentSize:](self, "setContentSize:");
  -[SKUISlideshowImageScrollView _resetMinMaxZoomScales](self, "_resetMinMaxZoomScales");
  -[SKUISlideshowImageScrollView minimumZoomScale](self, "minimumZoomScale");
  -[SKUISlideshowImageScrollView setZoomScale:](self, "setZoomScale:");

}

- (void)_prepareToResize
{
  double MidX;
  CGFloat v4;
  CGFloat v5;
  double v6;
  CGRect v7;
  CGRect v8;

  -[SKUISlideshowImageScrollView bounds](self, "bounds");
  MidX = CGRectGetMidX(v7);
  -[SKUISlideshowImageScrollView bounds](self, "bounds");
  -[SKUISlideshowImageScrollView convertPoint:toView:](self, "convertPoint:toView:", self->_imageView, MidX, CGRectGetMidY(v8));
  self->_centerPointBeforeResize.x = v4;
  self->_centerPointBeforeResize.y = v5;
  -[SKUISlideshowImageScrollView zoomScale](self, "zoomScale");
  self->_scaleBeforeResize = v6;
}

- (void)_recoverFromResize
{
  double scaleBeforeResize;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  -[SKUISlideshowImageScrollView _resetMinMaxZoomScales](self, "_resetMinMaxZoomScales");
  -[SKUISlideshowImageScrollView minimumZoomScale](self, "minimumZoomScale");
  if (scaleBeforeResize >= self->_scaleBeforeResize)
    scaleBeforeResize = self->_scaleBeforeResize;
  -[SKUISlideshowImageScrollView setZoomScale:](self, "setZoomScale:", scaleBeforeResize);
  -[SKUISlideshowImageScrollView convertPoint:fromView:](self, "convertPoint:fromView:", self->_imageView, self->_centerPointBeforeResize.x, self->_centerPointBeforeResize.y);
  v5 = v4;
  v7 = v6;
  -[SKUISlideshowImageScrollView bounds](self, "bounds");
  v9 = v5 - v8 * 0.5;
  -[SKUISlideshowImageScrollView bounds](self, "bounds");
  v11 = v7 - v10 * 0.5;
  -[SKUISlideshowImageScrollView contentSize](self, "contentSize");
  v13 = v12;
  -[SKUISlideshowImageScrollView bounds](self, "bounds");
  v15 = v13 - v14;
  -[SKUISlideshowImageScrollView contentSize](self, "contentSize");
  v17 = v16;
  -[SKUISlideshowImageScrollView bounds](self, "bounds");
  v19 = v17 - v18;
  if (v15 >= v9)
    v20 = v9;
  else
    v20 = v15;
  if (v19 >= v11)
    v21 = v11;
  else
    v21 = v19;
  if (*MEMORY[0x1E0C9D538] >= v20)
    v22 = *MEMORY[0x1E0C9D538];
  else
    v22 = v20;
  if (*(double *)(MEMORY[0x1E0C9D538] + 8) >= v21)
    v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  else
    v23 = v21;
  -[SKUISlideshowImageScrollView setContentOffset:](self, "setContentOffset:", v22, v23);
}

- (void)_resetMinMaxZoomScales
{
  uint64_t v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[SKUISlideshowImageScrollView bounds](self, "bounds");
  if (self->_image)
  {
    v7 = v5;
    v8 = v6;
    if (!CGRectIsEmpty(*(CGRect *)&v3))
    {
      -[UIImage size](self->_image, "size");
      v11 = 0.0;
      if (v7 > 0.0 && v8 > 0.0 && v9 > 0.0 && v10 > 0.0)
      {
        v12 = v7 / v9;
        v13 = v8 / v10;
        if (v12 >= v13)
          v11 = v13;
        else
          v11 = v12;
      }
      -[SKUISlideshowImageScrollView setMinimumZoomScale:](self, "setMinimumZoomScale:", v11);
      -[SKUISlideshowImageScrollView setMaximumZoomScale:](self, "setMaximumZoomScale:", v11 + v11);
    }
  }
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISlideshowImageScrollView initWithFrame:]";
}

@end
