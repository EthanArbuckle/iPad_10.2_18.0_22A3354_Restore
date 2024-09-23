@implementation STUIStatusBarControlCenterIndicatorView

- (void)_setupMaskView
{
  void *v3;
  id v4;
  void *v5;
  CALayer *v6;
  CALayer *maskSolidLayer;
  id v8;
  CAGradientLayer *v9;
  CAGradientLayer *maskGradientLayer;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[STUIStatusBarControlCenterIndicatorView maskView](self, "maskView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[STUIStatusBarControlCenterIndicatorView bounds](self, "bounds");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:");
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STUIStatusBarControlCenterIndicatorView setMaskView:](self, "setMaskView:", v5);
    v6 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    maskSolidLayer = self->_maskSolidLayer;
    self->_maskSolidLayer = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_maskSolidLayer, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

    v9 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    maskGradientLayer = self->_maskGradientLayer;
    self->_maskGradientLayer = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16[0] = objc_msgSend(v11, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16[1] = objc_msgSend(v12, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](self->_maskGradientLayer, "setColors:", v13);

    -[STUIStatusBarControlCenterIndicatorView _updateMaskLayersFrames](self, "_updateMaskLayersFrames");
    objc_msgSend(v5, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", self->_maskSolidLayer);

    objc_msgSend(v5, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSublayer:", self->_maskGradientLayer);

  }
}

- (BOOL)hideWithWipe
{
  return self->_hidingWithMask;
}

- (void)_updateMaskLayersFrames
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[STUIStatusBarControlCenterIndicatorView maskView](self, "maskView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[CALayer setFrame:](self->_maskSolidLayer, "setFrame:", 0.0, -v7, v5, v7);
  -[CAGradientLayer setFrame:](self->_maskGradientLayer, "setFrame:", 0.0, 0.0, v5, v7 * 0.5);
}

- (void)_updateMaskFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 hidingWithMask;
  void *v12;
  double v13;
  id v14;

  -[STUIStatusBarControlCenterIndicatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  hidingWithMask = self->_hidingWithMask;
  -[STUIStatusBarControlCenterIndicatorView maskView](self, "maskView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  v13 = -v10;
  if (!hidingWithMask)
    v13 = v10;
  objc_msgSend(v12, "setFrame:", v4, v6 + v13, v8, v10);

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarControlCenterIndicatorView;
  -[STUIStatusBarControlCenterIndicatorView layoutSubviews](&v4, sel_layoutSubviews);
  -[STUIStatusBarControlCenterIndicatorView maskView](self, "maskView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STUIStatusBarControlCenterIndicatorView _updateMaskFrame](self, "_updateMaskFrame");
    -[STUIStatusBarControlCenterIndicatorView _updateMaskLayersFrames](self, "_updateMaskLayersFrames");
  }
}

- (void)setHideWithWipe:(BOOL)a3
{
  void *v4;

  if (self->_hidingWithMask != a3)
  {
    self->_hidingWithMask = a3;
    -[STUIStatusBarControlCenterIndicatorView maskView](self, "maskView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      -[STUIStatusBarControlCenterIndicatorView _setupMaskView](self, "_setupMaskView");
    -[STUIStatusBarControlCenterIndicatorView _updateMaskFrame](self, "_updateMaskFrame");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskGradientLayer, 0);
  objc_storeStrong((id *)&self->_maskSolidLayer, 0);
}

@end
