@implementation VideosExtrasZoomableImageView

- (VideosExtrasZoomableImageView)initWithFrame:(CGRect)a3
{
  VideosExtrasZoomableImageView *v3;
  VideosExtrasZoomableImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasZoomableImageView;
  v3 = -[VideosExtrasZoomableImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VideosExtrasZoomableImageView setShowsHorizontalScrollIndicator:](v3, "setShowsHorizontalScrollIndicator:", 0);
    -[VideosExtrasZoomableImageView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    -[VideosExtrasZoomableImageView setBouncesZoom:](v4, "setBouncesZoom:", 1);
    -[VideosExtrasZoomableImageView setDecelerationRate:](v4, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    -[VideosExtrasZoomableImageView setDelegate:](v4, "setDelegate:", v4);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[VideosExtrasZoomableImageView setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasZoomableImageView;
  -[VideosExtrasZoomableImageView dealloc](&v3, sel_dealloc);
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
  -[VideosExtrasZoomableImageView frame](self, "frame");
  if (width == v9 && height == v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)VideosExtrasZoomableImageView;
    -[VideosExtrasZoomableImageView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  }
  else
  {
    -[VideosExtrasZoomableImageView _prepareToResize](self, "_prepareToResize");
    v11.receiver = self;
    v11.super_class = (Class)VideosExtrasZoomableImageView;
    -[VideosExtrasZoomableImageView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    -[VideosExtrasZoomableImageView _recoverFromResizing](self, "_recoverFromResizing");
  }
}

- (void)layoutSubviews
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VideosExtrasZoomableImageView;
  -[VideosExtrasZoomableImageView layoutSubviews](&v12, sel_layoutSubviews);
  -[VideosExtrasZoomableImageView zoomView](self, "zoomView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasZoomableImageView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "frame");
  v10 = (v5 - v9) * 0.5;
  if (v9 >= v5)
    v10 = 0.0;
  v11 = (v7 - v8) * 0.5;
  if (v8 >= v7)
    v11 = 0.0;
  objc_msgSend(v3, "setFrame:", v10, v11);

}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[VideosExtrasZoomableImageView setNeedsLayout](self, "setNeedsLayout");
  -[VideosExtrasZoomableImageView layoutIfNeeded](self, "layoutIfNeeded");
  -[VideosExtrasZoomableImageView zoomView](self, "zoomView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "appearState") == 1)
  {
    objc_msgSend(v6, "zoomingImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replicateStateFromImageView:", v4);

  }
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!objc_msgSend(v6, "appearState"))
  {
    objc_msgSend(v6, "zoomingImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasZoomableImageView zoomView](self, "zoomView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replicateStateFromImageView:", v5);

  }
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  id v4;

  -[VideosExtrasZoomableImageView zoomView](self, "zoomView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  UIImage *v12;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[VideosExtrasZoomableImageView setZoomScale:](self, "setZoomScale:", 1.0);
    -[VideosExtrasZoomableImageView zoomView](self, "zoomView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    if (v12)
    {
      -[UIImage size](v12, "size");
      v8 = v7;
      v10 = v9;
      -[VideosExtrasZoomableImageView setImageSize:](self, "setImageSize:");
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
      -[VideosExtrasZoomableImageView addSubview:](self, "addSubview:", v11);
      -[VideosExtrasZoomableImageView setZoomView:](self, "setZoomView:", v11);
      -[VideosExtrasZoomableImageView setContentSize:](self, "setContentSize:", v8, v10);
      -[VideosExtrasZoomableImageView _updateMinimumAndMaximumZoomScalesForCurrentBounds](self, "_updateMinimumAndMaximumZoomScalesForCurrentBounds");
      -[VideosExtrasZoomableImageView minimumZoomScale](self, "minimumZoomScale");
      -[VideosExtrasZoomableImageView setZoomScale:](self, "setZoomScale:");

    }
    else
    {
      -[VideosExtrasZoomableImageView setZoomView:](self, "setZoomView:", 0);
    }
    v5 = v12;
  }

}

- (void)zoomToPoint:(CGPoint)a3 animated:(BOOL)a4
{
  double y;
  double x;
  id v7;

  y = a3.y;
  x = a3.x;
  -[VideosExtrasZoomableImageView zoomView](self, "zoomView", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasZoomableImageView convertRect:toView:](self, "convertRect:toView:", v7, x, y, 1.0, 1.0);
  -[VideosExtrasZoomableImageView zoomToRect:animated:](self, "zoomToRect:animated:", 1);

}

- (CGPoint)_maximumContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[VideosExtrasZoomableImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[VideosExtrasZoomableImageView contentSize](self, "contentSize");
  v8 = v7 - v4;
  v10 = v9 - v6;
  result.y = v10;
  result.x = v8;
  return result;
}

- (CGPoint)_minimumContentOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_prepareToResize
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;

  -[VideosExtrasZoomableImageView bounds](self, "bounds");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidY = CGRectGetMidY(v18);
  -[VideosExtrasZoomableImageView zoomView](self, "zoomView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasZoomableImageView convertPoint:toView:](self, "convertPoint:toView:", v9, MidX, MidY);
  v11 = v10;
  v13 = v12;

  -[VideosExtrasZoomableImageView zoomScale](self, "zoomScale");
  v15 = v14;
  -[VideosExtrasZoomableImageView minimumZoomScale](self, "minimumZoomScale");
  if (v15 <= v16 + 0.00000011920929)
    v15 = 0.0;
  -[VideosExtrasZoomableImageView setPointToCenterAfterResize:](self, "setPointToCenterAfterResize:", v11, v13);
  -[VideosExtrasZoomableImageView setScaleToRestoreAfterResize:](self, "setScaleToRestoreAfterResize:", v15);
}

- (void)_recoverFromResizing
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;

  -[VideosExtrasZoomableImageView _updateMinimumAndMaximumZoomScalesForCurrentBounds](self, "_updateMinimumAndMaximumZoomScalesForCurrentBounds");
  -[VideosExtrasZoomableImageView scaleToRestoreAfterResize](self, "scaleToRestoreAfterResize");
  v4 = v3;
  -[VideosExtrasZoomableImageView minimumZoomScale](self, "minimumZoomScale");
  if (v5 >= v4)
    v4 = v5;
  -[VideosExtrasZoomableImageView maximumZoomScale](self, "maximumZoomScale");
  if (v6 >= v4)
    v6 = v4;
  -[VideosExtrasZoomableImageView setZoomScale:](self, "setZoomScale:", v6);
  -[VideosExtrasZoomableImageView pointToCenterAfterResize](self, "pointToCenterAfterResize");
  v8 = v7;
  v10 = v9;
  -[VideosExtrasZoomableImageView zoomView](self, "zoomView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasZoomableImageView convertPoint:fromView:](self, "convertPoint:fromView:", v11, v8, v10);
  v13 = v12;
  v15 = v14;

  -[VideosExtrasZoomableImageView bounds](self, "bounds");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v20 = v13 - CGRectGetWidth(v30) * 0.5;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v21 = v15 - CGRectGetHeight(v31) * 0.5;
  -[VideosExtrasZoomableImageView _maximumContentOffset](self, "_maximumContentOffset");
  v23 = v22;
  v25 = v24;
  -[VideosExtrasZoomableImageView _minimumContentOffset](self, "_minimumContentOffset");
  if (v23 >= v20)
    v28 = v20;
  else
    v28 = v23;
  if (v26 < v28)
    v26 = v28;
  if (v25 >= v21)
    v29 = v21;
  else
    v29 = v25;
  if (v27 < v29)
    v27 = v29;
  -[VideosExtrasZoomableImageView setContentOffset:](self, "setContentOffset:", v26, v27);
}

- (void)_updateMinimumAndMaximumZoomScalesForCurrentBounds
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

  -[VideosExtrasZoomableImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[VideosExtrasZoomableImageView imageSize](self, "imageSize");
  v8 = v7;
  v10 = v9;
  if (MPUFloatLessThanOrEqualToFloat())
    v8 = 1.0;
  if (MPUFloatLessThanOrEqualToFloat())
    v11 = 1.0;
  else
    v11 = v10;
  v12 = v6 / v11;
  if (v4 / v8 < v12)
    v12 = v4 / v8;
  -[VideosExtrasZoomableImageView setMinimumZoomScale:](self, "setMinimumZoomScale:", v12);
  -[VideosExtrasZoomableImageView setMaximumZoomScale:](self, "setMaximumZoomScale:", 2.0);
}

- (UIImage)image
{
  return self->_image;
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

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGPoint)pointToCenterAfterResize
{
  double x;
  double y;
  CGPoint result;

  x = self->_pointToCenterAfterResize.x;
  y = self->_pointToCenterAfterResize.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPointToCenterAfterResize:(CGPoint)a3
{
  self->_pointToCenterAfterResize = a3;
}

- (double)scaleToRestoreAfterResize
{
  return self->_scaleToRestoreAfterResize;
}

- (void)setScaleToRestoreAfterResize:(double)a3
{
  self->_scaleToRestoreAfterResize = a3;
}

- (UIImageView)zoomView
{
  return self->_zoomView;
}

- (void)setZoomView:(id)a3
{
  objc_storeStrong((id *)&self->_zoomView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
