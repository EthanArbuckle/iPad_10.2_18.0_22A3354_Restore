@implementation _TVRoundButton

+ (id)_buttonContentWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5
{
  return -[TVButtonContent initWithFrame:blurEffectStyle:blurEnabled:]([_TVRoundButtonContent alloc], "initWithFrame:blurEffectStyle:blurEnabled:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TVRoundButton)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5
{
  _TVRoundButton *v5;
  _TVRoundButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_TVRoundButton;
  v5 = -[TVButton initWithFrame:blurEffectStyle:blurEnabled:](&v12, sel_initWithFrame_blurEffectStyle_blurEnabled_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_shouldPunchThroughImage = 0;
    -[TVButton floatingView](v5, "floatingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUseShadowImage:", 0);

    -[TVButton floatingView](v6, "floatingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShadowVerticalOffset:", 12.0);

    -[TVButton floatingView](v6, "floatingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowRadius:", 5.0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__imageViewDidLoadImage_, CFSTR("TVMLImageViewImageDidLoadNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_TVRoundButton;
  -[_TVRoundButton dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CALayer *imageMask;
  void *v15;
  void *v16;
  objc_super v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_TVRoundButton;
  -[TVButton layoutSubviews](&v18, sel_layoutSubviews);
  -[_TVRoundButton bounds](self, "bounds");
  v5 = v4;
  v6 = v3 > 0.0 && v3 == v4;
  v7 = v3 * 0.5;
  if (!v6)
    v7 = 0.0;
  v17.receiver = self;
  v17.super_class = (Class)_TVRoundButton;
  -[TVButton setCornerRadius:](&v17, sel_setCornerRadius_, v7);
  if (fabs(-(floor(v5 * 0.5) - v5 * 0.5)) <= 2.22044605e-16)
  {
    -[TVButton floatingView](self, "floatingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "center");
    v10 = v9;
    v12 = v11;

    -[TVButton floatingView](self, "floatingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCenter:", v10, v12 + -0.5);

  }
  imageMask = self->_imageMask;
  -[TVButton buttonContent](self, "buttonContent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVButton imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_frameForImageView:", v16);
  -[CALayer setFrame:](imageMask, "setFrame:");

  -[_TVRoundButton _updateFloatingViewFocusStateIfNeeded](self, "_updateFloatingViewFocusStateIfNeeded");
}

- (void)setShouldPunchThroughImage:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_shouldPunchThroughImage != a3)
  {
    self->_shouldPunchThroughImage = a3;
    -[TVButton imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[_TVRoundButton _updateImageMask](self, "_updateImageMask");
  }
}

- (void)setImageView:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVRoundButton;
  -[TVButton setImageView:](&v6, sel_setImageView_, a3);
  -[TVButton imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[_TVRoundButton _updateImageMask](self, "_updateImageMask");
}

- (void)_imageViewDidLoadImage:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[_TVRoundButton _updateImageMask](self, "_updateImageMask");
}

- (void)_updateImageMask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CALayer *v10;
  CALayer *imageMask;
  void *v12;
  void *v13;
  CALayer *v14;
  id v15;
  void *v16;

  -[CALayer removeFromSuperlayer](self->_imageMask, "removeFromSuperlayer");
  -[TVButton overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  if (-[_TVRoundButton shouldPunchThroughImage](self, "shouldPunchThroughImage"))
  {
    -[TVButton imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TVButton imageView](self, "imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_flatImageWithColor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      v10 = (CALayer *)objc_claimAutoreleasedReturnValue();
      imageMask = self->_imageMask;
      self->_imageMask = v10;

      -[CALayer setCompositingFilter:](self->_imageMask, "setCompositingFilter:", *MEMORY[0x24BDE5A48]);
      -[TVButton overlayView](self, "overlayView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSublayer:", self->_imageMask);

      v14 = self->_imageMask;
      v15 = objc_retainAutorelease(v9);
      -[CALayer setContents:](v14, "setContents:", objc_msgSend(v15, "CGImage"));
      -[TVButton imageView](self, "imageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      -[CALayer setFrame:](self->_imageMask, "setFrame:");

    }
  }
  -[_TVRoundButton _updateBackgroundColorForState:](self, "_updateBackgroundColorForState:", -[_TVRoundButton state](self, "state"));
}

- (void)_updateBackgroundColorForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_TVRoundButton;
  -[TVButton _updateBackgroundColorForState:](&v11, sel__updateBackgroundColorForState_, a3);
  if (-[_TVRoundButton shouldPunchThroughImage](self, "shouldPunchThroughImage"))
  {
    -[TVButton imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TVButton floatingView](self, "floatingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:forState:", 0, 8);

      -[TVButton floatingView](self, "floatingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:forState:", 0, 1);

      -[TVButton overlayView](self, "overlayView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVButton highlightColor](self, "highlightColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v9);

      -[TVButton overlayView](self, "overlayView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHidden:", 0);

    }
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVRoundButton;
  -[_TVRoundButton didMoveToWindow](&v3, sel_didMoveToWindow);
  -[_TVRoundButton _updateFloatingViewFocusStateIfNeeded](self, "_updateFloatingViewFocusStateIfNeeded");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVRoundButton;
  -[_TVRoundButton setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_TVRoundButton _updateFloatingViewFocusStateIfNeeded](self, "_updateFloatingViewFocusStateIfNeeded");
}

- (void)_updateFloatingViewFocusStateIfNeeded
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id updateFloatingViewFocusStateBlock;
  void *v13;
  dispatch_block_t block;

  -[_TVRoundButton window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_TVRoundButton bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v9 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);

    if (v6 != v9 || v8 != v10)
    {
      block = (dispatch_block_t)MEMORY[0x22767F470](self->_updateFloatingViewFocusStateBlock);
      updateFloatingViewFocusStateBlock = self->_updateFloatingViewFocusStateBlock;
      self->_updateFloatingViewFocusStateBlock = 0;

      v13 = block;
      if (block)
      {
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        v13 = block;
      }

    }
  }
}

- (void)_updateFloaingViewFocusState:(BOOL)a3 coordinator:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id updateFloatingViewFocusStateBlock;
  _QWORD v21[4];
  id v22;
  id v23;
  BOOL v24;
  id location;

  v4 = a3;
  v6 = a4;
  -[_TVRoundButton window](self, "window");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_10;
  v8 = (void *)v7;
  -[_TVRoundButton bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v13 = *MEMORY[0x24BDBF148];
  v14 = *(double *)(MEMORY[0x24BDBF148] + 8);

  if (v10 == v13 && v12 == v14)
  {
LABEL_10:
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __59___TVRoundButton__updateFloaingViewFocusState_coordinator___block_invoke;
    v21[3] = &unk_24EB86CE8;
    objc_copyWeak(&v23, &location);
    v24 = v4;
    v22 = v6;
    v19 = (void *)objc_msgSend(v21, "copy");
    updateFloatingViewFocusStateBlock = self->_updateFloatingViewFocusStateBlock;
    self->_updateFloatingViewFocusStateBlock = v19;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    -[TVButton floatingView](self, "floatingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v4)
      v18 = 8;
    else
      v18 = 0;
    objc_msgSend(v16, "setControlState:withAnimationCoordinator:", v18, v6);

  }
}

- (void)_updateFocusStateWithCoordinator:(id)a3
{
  int v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVRoundButton;
  -[TVButton _updateFocusStateWithCoordinator:](&v8, sel__updateFocusStateWithCoordinator_, a3);
  v4 = -[_TVRoundButton isFocused](self, "isFocused");
  -[TVButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_TVRoundButton shouldPunchThroughImage](self, "shouldPunchThroughImage");
  v7 = 1.0;
  if ((v6 & v4) != 0)
    v7 = 0.0;
  objc_msgSend(v5, "setAlpha:", v7);

}

- (BOOL)shouldPunchThroughImage
{
  return self->_shouldPunchThroughImage;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateFloatingViewFocusStateBlock, 0);
  objc_storeStrong((id *)&self->_imageMask, 0);
}

@end
