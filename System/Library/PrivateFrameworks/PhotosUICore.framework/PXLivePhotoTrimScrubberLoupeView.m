@implementation PXLivePhotoTrimScrubberLoupeView

- (PXLivePhotoTrimScrubberLoupeView)initWithFrame:(CGRect)a3 forceDarkUserInterfaceStyle:(BOOL)a4
{
  PXLivePhotoTrimScrubberLoupeView *v5;
  PXLivePhotoTrimScrubberLoupeView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXLivePhotoTrimScrubberLoupeView;
  v5 = -[PXLivePhotoTrimScrubberLoupeView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_forceDarkUserInterfaceStyle = a4;
    -[PXLivePhotoTrimScrubberLoupeView _PXLivePhotoTrimScrubberLoupeView_commonInit](v5, "_PXLivePhotoTrimScrubberLoupeView_commonInit");
  }
  return v6;
}

- (PXLivePhotoTrimScrubberLoupeView)initWithCoder:(id)a3
{
  PXLivePhotoTrimScrubberLoupeView *v3;
  PXLivePhotoTrimScrubberLoupeView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXLivePhotoTrimScrubberLoupeView;
  v3 = -[PXLivePhotoTrimScrubberLoupeView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_forceDarkUserInterfaceStyle = 1;
    -[PXLivePhotoTrimScrubberLoupeView _PXLivePhotoTrimScrubberLoupeView_commonInit](v3, "_PXLivePhotoTrimScrubberLoupeView_commonInit");
  }
  return v4;
}

- (void)_PXLivePhotoTrimScrubberLoupeView_commonInit
{
  CAShapeLayer *v3;
  CAShapeLayer *borderLayer;
  id v5;
  double v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  CAShapeLayer *v11;
  CAShapeLayer *maskLayer;
  id v13;
  double v14;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *workQueue;
  UIView *v17;
  UIView *container;
  CAShapeLayer *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v3 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  borderLayer = self->_borderLayer;
  self->_borderLayer = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_borderLayer, "setFillColor:", objc_msgSend(v5, "CGColor"));

  -[CAShapeLayer setLineCap:](self->_borderLayer, "setLineCap:", *MEMORY[0x1E0CD3010]);
  LODWORD(v6) = 1.0;
  -[CAShapeLayer setOpacity:](self->_borderLayer, "setOpacity:", v6);
  -[CAShapeLayer setZPosition:](self->_borderLayer, "setZPosition:", 10.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_borderLayer, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setShadowColor:](self->_borderLayer, "setShadowColor:", objc_msgSend(v8, "CGColor"));

  LODWORD(v9) = 1058642330;
  -[CAShapeLayer setShadowOpacity:](self->_borderLayer, "setShadowOpacity:", v9);
  -[CAShapeLayer setShadowOffset:](self->_borderLayer, "setShadowOffset:", 0.0, 0.0);
  -[PXLivePhotoTrimScrubberLoupeView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSublayer:", self->_borderLayer);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v11 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  maskLayer = self->_maskLayer;
  self->_maskLayer = v11;

  if (self->_forceDarkUserInterfaceStyle)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_maskLayer, "setFillColor:", objc_msgSend(v13, "CGColor"));

  LODWORD(v14) = 1.0;
  -[CAShapeLayer setOpacity:](self->_maskLayer, "setOpacity:", v14);
  -[CAShapeLayer setZPosition:](self->_maskLayer, "setZPosition:", 10.0);
  v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.livephotoloupe.work", 0);
  workQueue = self->_workQueue;
  self->_workQueue = v15;

  self->_outerCornerRadius = 3.0;
  self->_innerCornerRadius = 0.0;
  v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  container = self->_container;
  self->_container = v17;

  -[PXLivePhotoTrimScrubberLoupeView addSubview:](self, "addSubview:", self->_container);
  v19 = self->_maskLayer;
  -[UIView layer](self->_container, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMask:", v19);

  -[UIView layer](self->_container, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMasksToBounds:", 1);

  -[PXLivePhotoTrimScrubberLoupeView outerCornerRadius](self, "outerCornerRadius");
  v23 = v22;
  -[UIView layer](self->_container, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerRadius:", v23);

  self->_aspectRatio = 1.0;
  self->_needleWidth = 1.0;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXLivePhotoTrimScrubberLoupeView;
  -[PXLivePhotoTrimScrubberLoupeView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXLivePhotoTrimScrubberLoupeView _updateImageIfNeeded](self, "_updateImageIfNeeded");
  -[PXLivePhotoTrimScrubberLoupeView _updatePlayheadIfNeeded](self, "_updatePlayheadIfNeeded");
}

- (BOOL)showPlayerView
{
  return -[UIImageView isHidden](self->_imageView, "isHidden");
}

- (void)setShowPlayerView:(BOOL)a3
{
  UIImageView *imageView;

  imageView = self->_imageView;
  if (a3)
  {
    -[UIImageView setHidden:](imageView, "setHidden:", 1);
    -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  }
  else
  {
    -[UIImageView setHidden:](imageView, "setHidden:");
    -[PXLivePhotoTrimScrubberLoupeView _invalidateImage](self, "_invalidateImage");
  }
}

- (void)setShowNeedleWithWidth:(double)a3 animate:(BOOL)a4
{
  if (self->_playheadStyle != 2 || self->_needleWidth != a3)
  {
    self->_needleWidth = a3;
    -[PXLivePhotoTrimScrubberLoupeView _setPlayheadStyle:animate:](self, "_setPlayheadStyle:animate:", 2, a4);
  }
}

- (void)setShowLoupeThumbnailWithFrameTime:(id *)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  if (self->_playheadStyle)
  {
    v4 = a4;
    v6 = *a3;
    -[PXLivePhotoTrimScrubberLoupeView setFrameTime:](self, "setFrameTime:", &v6);
    -[PXLivePhotoTrimScrubberLoupeView _setPlayheadStyle:animate:](self, "_setPlayheadStyle:animate:", 0, v4);
  }
}

- (void)setFrameTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_frameTime.value = *(_OWORD *)&a3->var0;
  self->_frameTime.epoch = var3;
  -[PXLivePhotoTrimScrubberLoupeView _invalidateImage](self, "_invalidateImage");
}

- (void)setShowLoupePlayerAnimate:(BOOL)a3
{
  if (self->_playheadStyle != 1)
    -[PXLivePhotoTrimScrubberLoupeView _setPlayheadStyle:animate:](self, "_setPlayheadStyle:animate:", 1, a3);
}

- (void)_setPlayheadStyle:(unint64_t)a3 animate:(BOOL)a4
{
  unint64_t playheadStyle;
  _BOOL8 v5;
  _BOOL8 v7;
  unint64_t v8;
  void *v9;

  playheadStyle = self->_playheadStyle;
  if (playheadStyle != a3)
  {
    v5 = a4;
    v7 = a3 != 1;
    v8 = playheadStyle | a3;
    self->_playheadStyle = a3;
    -[PXLivePhotoTrimScrubberLoupeView setShowPlayerView:](self, "setShowPlayerView:", a3 - 1 < 2);
    -[PXLivePhotoTrimScrubberLoupeView playerView](self, "playerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v7);

    if (v8 >= 2)
      -[PXLivePhotoTrimScrubberLoupeView _updatePlayheadBorderAnimate:](self, "_updatePlayheadBorderAnimate:", v5);
  }
}

- (void)setAsset:(id)a3 videoComposition:(id)a4
{
  AVVideoComposition *v7;
  int v8;
  int v9;
  AVAsset *v10;

  v10 = (AVAsset *)a3;
  v7 = (AVVideoComposition *)a4;
  if (self->_asset == v10)
    v8 = 0;
  else
    v8 = -[AVAsset isEqual:](v10, "isEqual:") ^ 1;
  if (self->_videoComposition == v7)
    v9 = 0;
  else
    v9 = -[AVVideoComposition isEqual:](v7, "isEqual:") ^ 1;
  if ((v8 | v9) == 1)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    objc_storeStrong((id *)&self->_videoComposition, a4);
    -[PXLivePhotoTrimScrubberLoupeView _invalidateImage](self, "_invalidateImage");
  }

}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXLivePhotoTrimScrubberLoupeView;
  -[PXLivePhotoTrimScrubberLoupeView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXLivePhotoTrimScrubberLoupeView bounds](self, "bounds");
  v5 = v4;
  -[PXLivePhotoTrimScrubberLoupeView aspectRatio](self, "aspectRatio");
  v7 = v6 * v5;
  -[PXLivePhotoTrimScrubberLoupeView bounds](self, "bounds");
  v9 = v8;
  -[UIView frame](self->_container, "frame");
  if (v7 != v11 || v9 != v10)
  {
    -[UIView setFrame:](self->_container, "setFrame:", 0.0, 0.0, v7, v9);
    -[UIView bounds](self->_container, "bounds");
    -[UIView setFrame:](self->_playerView, "setFrame:");
    -[UIView bounds](self->_container, "bounds");
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
    -[PXLivePhotoTrimScrubberLoupeView _invalidatePlayhead](self, "_invalidatePlayhead");
  }
}

- (CGRect)_loupeFrameWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 IsEmpty;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = CGRectInset(a3, 3.0, 3.0);
  v7 = v16.origin.x;
  v8 = v16.origin.y;
  v9 = v16.size.width;
  v10 = v16.size.height;
  IsEmpty = CGRectIsEmpty(v16);
  if (IsEmpty)
    v12 = height;
  else
    v12 = v10;
  if (IsEmpty)
    v13 = width;
  else
    v13 = v9;
  if (IsEmpty)
    v14 = y;
  else
    v14 = v8;
  if (IsEmpty)
    v15 = x;
  else
    v15 = v7;
  result.size.height = v12;
  result.size.width = v13;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (void)setPlayerView:(id)a3
{
  UIView *v5;
  UIView **p_playerView;
  UIView *v7;
  UIView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_playerView = &self->_playerView;
  if (self->_playerView != v5)
  {
    v9 = v5;
    v7 = self->_container;
    if (v9)
    {
      -[UIView addSubview:](v7, "addSubview:", v9);
      -[UIView bringSubviewToFront:](v7, "bringSubviewToFront:", v9);
    }
    -[UIView superview](*p_playerView, "superview");
    v8 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (v8 == v7)
      -[UIView removeFromSuperview](*p_playerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_playerView, a3);
    -[PXLivePhotoTrimScrubberLoupeView setNeedsLayout](self, "setNeedsLayout");

    v5 = v9;
  }

}

- (void)_invalidateImage
{
  self->_imageIsValid = 0;
  if (self->_playheadStyle != 2)
    -[PXLivePhotoTrimScrubberLoupeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateImageIfNeeded
{
  UIImageView *imageView;
  _PXLivePhotoTrimScrubberLoupeViewImageRequest *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  _BOOL4 v15;
  _PXLivePhotoTrimScrubberLoupeViewImageRequest *currentImageRequest;
  NSObject *workQueue;
  void *v18;
  _QWORD block[4];
  _PXLivePhotoTrimScrubberLoupeViewImageRequest *v20;
  id v21;
  id location;
  __int128 v23;
  int64_t epoch;

  if (!self->_imageIsValid)
  {
    imageView = self->_imageView;
    if ((!imageView || (-[UIImageView isHidden](imageView, "isHidden") & 1) == 0) && self->_playheadStyle != 2)
    {
      self->_imageIsValid = 1;
      v23 = *(_OWORD *)&self->_frameTime.value;
      epoch = self->_frameTime.epoch;
      v4 = objc_alloc_init(_PXLivePhotoTrimScrubberLoupeViewImageRequest);
      -[_PXLivePhotoTrimScrubberLoupeViewImageRequest setAsset:](v4, "setAsset:", self->_asset);
      -[_PXLivePhotoTrimScrubberLoupeViewImageRequest setVideoComposition:](v4, "setVideoComposition:", self->_videoComposition);
      -[_PXLivePhotoTrimScrubberLoupeViewImageRequest setSourceTime:](v4, "setSourceTime:", &v23);
      -[PXLivePhotoTrimScrubberLoupeView bounds](self, "bounds");
      v6 = v5;
      -[PXLivePhotoTrimScrubberLoupeView aspectRatio](self, "aspectRatio");
      -[PXLivePhotoTrimScrubberLoupeView _loupeFrameWithBounds:](self, "_loupeFrameWithBounds:", 0.0, 0.0, v7 * v6, v6);
      v9 = v8;
      v11 = v10;
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scale");
      v14 = v13;

      -[_PXLivePhotoTrimScrubberLoupeViewImageRequest setScale:](v4, "setScale:", v14);
      -[_PXLivePhotoTrimScrubberLoupeViewImageRequest setImageSize:](v4, "setImageSize:", v9 * v14, v11 * v14);
      v15 = -[_PXLivePhotoTrimScrubberLoupeViewImageRequest isValid](v4, "isValid");
      currentImageRequest = self->_currentImageRequest;
      if (v15)
      {
        if (!-[_PXLivePhotoTrimScrubberLoupeViewImageRequest isEqual:](v4, "isEqual:", currentImageRequest))
        {
          objc_storeStrong((id *)&self->_currentImageRequest, v4);
          objc_initWeak(&location, self);
          workQueue = self->_workQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __56__PXLivePhotoTrimScrubberLoupeView__updateImageIfNeeded__block_invoke;
          block[3] = &unk_1E5147280;
          objc_copyWeak(&v21, &location);
          v20 = v4;
          dispatch_async(workQueue, block);

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        self->_currentImageRequest = 0;

        -[UIImageView image](self->_imageView, "image");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          -[PXLivePhotoTrimScrubberLoupeView _presentImage:](self, "_presentImage:", 0);
      }

    }
  }
}

- (void)_extractImageFromImageRequest:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  CGImage *v22;
  id v23;
  CGColorSpace *ColorSpace;
  CGColorSpace *v25;
  CGColorSpace *v26;
  CGImageRef CopyWithColorSpace;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85CE17C]();
  v39 = 0uLL;
  v40 = 0;
  if (v4)
    objc_msgSend(v4, "sourceTime");
  objc_msgSend(v4, "imageSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "scale");
  if (v10 >= 1.0)
    v11 = v10;
  else
    v11 = 1.0;
  if (v7 >= v9)
    v12 = v7;
  else
    v12 = v9;
  v13 = fmin(v12 * v11, 1024.0);
  v14 = objc_alloc(MEMORY[0x1E0C8AFC8]);
  objc_msgSend(v4, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithAsset:", v15);

  objc_msgSend(v4, "videoComposition");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setVideoComposition:", v17);

  objc_msgSend(v16, "setMaximumSize:", v13, v13);
  v18 = (__int128 *)MEMORY[0x1E0CA2E68];
  v37 = *MEMORY[0x1E0CA2E68];
  v38 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v16, "setRequestedTimeToleranceBefore:", &v37);
  v35 = *v18;
  v36 = *((_QWORD *)v18 + 2);
  objc_msgSend(v16, "setRequestedTimeToleranceAfter:", &v35);
  objc_msgSend(v16, "setAppliesPreferredTrackTransform:", 1);
  objc_msgSend(v16, "customVideoCompositor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("NUVideoPlaybackCompositor"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v16, "customVideoCompositor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setValue:forKey:", CFSTR("PXLivePhotoTrimScrubberLoupeView"), CFSTR("label"));

  }
  v32 = v39;
  v33 = v40;
  v34 = 0;
  v22 = (CGImage *)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v16, &v32, 0, &v34);
  v23 = v34;
  if (v22)
  {
    ColorSpace = CGImageGetColorSpace(v22);
    if (CGColorSpaceUsesITUR_2100TF(ColorSpace))
    {
      v25 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
      if (v25)
      {
        v26 = v25;
        CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v22, v25);
        CFRelease(v22);
        CFRelease(v26);
        v22 = CopyWithColorSpace;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v22, 0, v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v22);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __66__PXLivePhotoTrimScrubberLoupeView__extractImageFromImageRequest___block_invoke;
  v30[3] = &unk_1E5148D08;
  v30[4] = self;
  v31 = v28;
  v29 = v28;
  dispatch_async(MEMORY[0x1E0C80D38], v30);

  objc_autoreleasePoolPop(v5);
}

- (void)_presentImage:(id)a3
{
  id v4;
  UIImageView *imageView;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIImageView *v11;
  id v12;
  _QWORD v13[4];
  UIImageView *v14;
  _QWORD v15[5];
  id v16;
  UIImageView *v17;

  v4 = a3;
  imageView = self->_imageView;
  if (!imageView)
  {
    v6 = 0;
    goto LABEL_5;
  }
  if ((-[UIImageView isHidden](imageView, "isHidden") & 1) == 0)
  {
    v6 = self->_imageView;
LABEL_5:
    v7 = v6;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
    objc_msgSend(v8, "setContentMode:", 2);
    -[UIView addSubview:](self->_container, "addSubview:", v8);
    -[UIView bounds](self->_container, "bounds");
    objc_msgSend(v8, "setFrame:");
    objc_storeStrong((id *)&self->_imageView, v8);
    objc_msgSend(v8, "setAlpha:", 0.0);
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__PXLivePhotoTrimScrubberLoupeView__presentImage___block_invoke;
    v15[3] = &unk_1E51457C8;
    v15[4] = self;
    v16 = v8;
    v17 = v7;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __50__PXLivePhotoTrimScrubberLoupeView__presentImage___block_invoke_2;
    v13[3] = &unk_1E5147360;
    v14 = v17;
    v11 = v17;
    v12 = v8;
    objc_msgSend(v9, "animateWithDuration:animations:completion:", v15, v13, 0.25);

  }
}

- (id)_collapsedPathForBounds:(CGRect)a3
{
  double height;
  double y;
  double x;
  double needleWidth;
  void *v7;
  double v8;
  void *v9;

  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_needleWidth >= 0.1)
    needleWidth = self->_needleWidth;
  else
    needleWidth = 0.1;
  v7 = (void *)MEMORY[0x1E0DC3508];
  -[PXLivePhotoTrimScrubberLoupeView innerCornerRadius](self, "innerCornerRadius");
  objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:", x, y, needleWidth, height, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closePath");
  return v9;
}

- (id)_expandedPathForBounds:(CGRect)a3 needsCutout:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (void *)MEMORY[0x1E0DC3508];
  -[PXLivePhotoTrimScrubberLoupeView outerCornerRadius](self, "outerCornerRadius");
  objc_msgSend(v10, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "closePath");
  if (v4)
  {
    -[PXLivePhotoTrimScrubberLoupeView _loupeFrameWithBounds:](self, "_loupeFrameWithBounds:", x, y, width, height);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = (void *)MEMORY[0x1E0DC3508];
    -[PXLivePhotoTrimScrubberLoupeView innerCornerRadius](self, "innerCornerRadius");
    objc_msgSend(v21, "bezierPathWithRoundedRect:cornerRadius:", v14, v16, v18, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bezierPathByReversingPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendPath:", v24);

  }
  return v12;
}

- (id)_transitionPathForBounds:(CGRect)a3 needsCutout:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  double v11;
  double width;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  CGRect v19;
  CGRect v20;

  v4 = a4;
  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, 4.5, a3.size.height, 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closePath");
  if (v4)
  {
    v19.size.width = 4.5;
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.height = height;
    v20 = CGRectInset(v19, 2.2, 3.0);
    v10 = v20.origin.x;
    v11 = v20.origin.y;
    width = v20.size.width;
    v13 = v20.size.height;
    v14 = (void *)MEMORY[0x1E0DC3508];
    -[PXLivePhotoTrimScrubberLoupeView innerCornerRadius](self, "innerCornerRadius");
    objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v10, v11, width, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bezierPathByReversingPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "appendPath:", v17);
  }
  return v9;
}

- (void)_invalidatePlayhead
{
  self->_playheadIsValid = 0;
  -[PXLivePhotoTrimScrubberLoupeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updatePlayheadIfNeeded
{
  if (!self->_playheadIsValid)
  {
    self->_playheadIsValid = 1;
    -[PXLivePhotoTrimScrubberLoupeView _updatePlayheadBorderAnimate:](self, "_updatePlayheadBorderAnimate:", 0);
  }
}

- (void)_updatePlayheadBorderAnimate:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double x;
  double y;
  double width;
  double height;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CAShapeLayer *borderLayer;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  CAShapeLayer *maskLayer;
  void *v57;
  double v58;
  id v59;
  id v60;
  double v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  _QWORD v66[2];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[2];
  _QWORD v70[3];
  _QWORD v71[5];
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v3 = a3;
  v71[3] = *MEMORY[0x1E0C80C00];
  -[PXLivePhotoTrimScrubberLoupeView bounds](self, "bounds");
  if (!CGRectIsEmpty(v72))
  {
    v5 = -[PXLivePhotoTrimScrubberLoupeView playheadStyle](self, "playheadStyle");
    -[PXLivePhotoTrimScrubberLoupeView bounds](self, "bounds");
    v7 = v6;
    -[PXLivePhotoTrimScrubberLoupeView aspectRatio](self, "aspectRatio");
    v9 = v8 * v7;
    -[PXLivePhotoTrimScrubberLoupeView verticalInset](self, "verticalInset");
    v11 = v10;
    v73.origin.x = 0.0;
    v73.origin.y = 0.0;
    v73.size.width = v9;
    v73.size.height = v7;
    v74 = CGRectInset(v73, 0.0, v11);
    x = v74.origin.x;
    y = v74.origin.y;
    width = v74.size.width;
    height = v74.size.height;
    v16 = 0.5;
    if (v5 != 2)
      v16 = 0.0;
    -[CAShapeLayer setLineWidth:](self->_borderLayer, "setLineWidth:", v16);
    if (v5 == 2)
    {
      -[PXLivePhotoTrimScrubberLoupeView _collapsedPathForBounds:](self, "_collapsedPathForBounds:", x, y, width, height);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubberLoupeView _collapsedPathForBounds:](self, "_collapsedPathForBounds:", x, y, width, height);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = x;
      v20 = y;
      v21 = width;
      v22 = height;
    }
    else
    {
      -[PXLivePhotoTrimScrubberLoupeView _expandedPathForBounds:needsCutout:](self, "_expandedPathForBounds:needsCutout:", 1, x, y, width, height);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubberLoupeView _loupeFrameWithBounds:](self, "_loupeFrameWithBounds:", 0.0, 0.0, v9, v7);
      v19 = v23;
      v20 = v24;
      v21 = v25;
      v22 = v26;
      -[PXLivePhotoTrimScrubberLoupeView _expandedPathForBounds:needsCutout:](self, "_expandedPathForBounds:needsCutout:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27 = objc_retainAutorelease(v17);
    v28 = objc_msgSend(v27, "CGPath");
    v29 = objc_retainAutorelease(v18);
    v30 = objc_msgSend(v29, "CGPath");
    v31 = v30;
    if (v3)
    {
      v58 = v19;
      v62 = v30;
      objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
      v61 = v32;
      v33 = *MEMORY[0x1E0CD3058];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v33);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("path"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setRemovedOnCompletion:", 0);
      v35 = *MEMORY[0x1E0CD2B58];
      objc_msgSend(v34, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      v36 = dbl_1A7C0C830[v5 == 2];
      v63 = v27;
      if (v5 == 2)
        -[PXLivePhotoTrimScrubberLoupeView _expandedPathForBounds:needsCutout:](self, "_expandedPathForBounds:needsCutout:", 1, x, y, width, height);
      else
        -[PXLivePhotoTrimScrubberLoupeView _collapsedPathForBounds:](self, "_collapsedPathForBounds:", x, y, width, height);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubberLoupeView _transitionPathForBounds:needsCutout:](self, "_transitionPathForBounds:needsCutout:", 1, x, y, width, height);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_retainAutorelease(v37);
      v39 = objc_msgSend(v60, "CGPath");
      v59 = objc_retainAutorelease(v38);
      v71[0] = v39;
      v71[1] = objc_msgSend(v59, "CGPath");
      v71[2] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setValues:", v40);

      objc_msgSend(v34, "setDuration:", v61);
      v70[0] = &unk_1E53EFE90;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = v41;
      v70[2] = &unk_1E53EFEA0;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setKeyTimes:", v42);

      v69[0] = v65;
      v69[1] = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTimingFunctions:", v43);

      borderLayer = self->_borderLayer;
      objc_msgSend(v34, "keyPath");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAShapeLayer addAnimation:forKey:](borderLayer, "addAnimation:forKey:", v34, v45);

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("path"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setRemovedOnCompletion:", 0);
      objc_msgSend(v46, "setFillMode:", v35);
      if (v5 == 2)
        -[PXLivePhotoTrimScrubberLoupeView _expandedPathForBounds:needsCutout:](self, "_expandedPathForBounds:needsCutout:", 0, v58, v20, v21, v22);
      else
        -[PXLivePhotoTrimScrubberLoupeView _collapsedPathForBounds:](self, "_collapsedPathForBounds:", v58, v20, v21, v22);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXLivePhotoTrimScrubberLoupeView _transitionPathForBounds:needsCutout:](self, "_transitionPathForBounds:needsCutout:", 0, v58, v20, v21, v22);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_retainAutorelease(v47);
      v50 = objc_msgSend(v49, "CGPath");
      v51 = objc_retainAutorelease(v48);
      v68[0] = v50;
      v68[1] = objc_msgSend(v51, "CGPath");
      v68[2] = v62;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setValues:", v52);

      objc_msgSend(v46, "setDuration:", v61);
      v67[0] = &unk_1E53EFE90;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v53;
      v67[2] = &unk_1E53EFEA0;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setKeyTimes:", v54);

      v66[0] = v65;
      v66[1] = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setTimingFunctions:", v55);

      maskLayer = self->_maskLayer;
      objc_msgSend(v46, "keyPath");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAShapeLayer addAnimation:forKey:](maskLayer, "addAnimation:forKey:", v46, v57);

      v27 = v63;
    }
    else
    {
      -[CAShapeLayer removeAllAnimations](self->_borderLayer, "removeAllAnimations");
      -[CAShapeLayer removeAllAnimations](self->_maskLayer, "removeAllAnimations");
      -[CAShapeLayer setPath:](self->_borderLayer, "setPath:", v28);
      -[CAShapeLayer setPath:](self->_maskLayer, "setPath:", v31);
    }

  }
}

- (unint64_t)playheadStyle
{
  return self->_playheadStyle;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (UIView)playerView
{
  return self->_playerView;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 464);
  return self;
}

- (double)verticalInset
{
  return self->_verticalInset;
}

- (void)setVerticalInset:(double)a3
{
  self->_verticalInset = a3;
}

- (double)outerCornerRadius
{
  return self->_outerCornerRadius;
}

- (void)setOuterCornerRadius:(double)a3
{
  self->_outerCornerRadius = a3;
}

- (double)innerCornerRadius
{
  return self->_innerCornerRadius;
}

- (void)setInnerCornerRadius:(double)a3
{
  self->_innerCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_currentImageRequest, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

void __50__PXLivePhotoTrimScrubberLoupeView__presentImage___block_invoke(uint64_t a1, double a2)
{
  void *v3;

  LODWORD(a2) = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setOpacity:", a2);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

uint64_t __50__PXLivePhotoTrimScrubberLoupeView__presentImage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __66__PXLivePhotoTrimScrubberLoupeView__extractImageFromImageRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentImage:", *(_QWORD *)(a1 + 40));
}

void __56__PXLivePhotoTrimScrubberLoupeView__updateImageIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_extractImageFromImageRequest:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

@end
