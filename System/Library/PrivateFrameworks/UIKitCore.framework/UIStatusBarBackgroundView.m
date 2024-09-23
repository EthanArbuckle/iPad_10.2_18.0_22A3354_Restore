@implementation UIStatusBarBackgroundView

- (UIStatusBarBackgroundView)initWithFrame:(CGRect)a3 style:(id)a4 backgroundColor:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  UIStatusBarBackgroundView *v14;
  UIStatusBarBackgroundView *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)UIStatusBarBackgroundView;
  v14 = -[UIView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_style, a4);
    if (v13)
      -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v13);
    -[UIStatusBarBackgroundView _baseImage](v15, "_baseImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[UIView layer](v15, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_retainAutorelease(v16);
      objc_msgSend(v17, "setContents:", objc_msgSend(v18, "CGImage"));

      objc_msgSend(v18, "scale");
      -[UIView setContentScaleFactor:](v15, "setContentScaleFactor:");
      objc_msgSend(v18, "size");
      v20 = v19;
      if (v19 > 1.0)
      {
        v21 = floor((v19 + -1.0) * 0.5);
        -[UIView layer](v15, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setContentsCenter:", v21 / v20, 0.0, (v20 - (v21 + v21)) / v20, 1.0);

      }
    }
    -[UIView setAutoresizingMask:](v15, "setAutoresizingMask:", 18);

  }
  return v15;
}

- (id)style
{
  return self->_style;
}

- (void)setGlowAnimationEnabled:(BOOL)a3
{
  -[UIStatusBarBackgroundView _setGlowAnimationEnabled:waitForNextCycle:](self, "_setGlowAnimationEnabled:waitForNextCycle:", a3, 0);
}

- (void)_setGlowAnimationEnabled:(BOOL)a3 waitForNextCycle:(BOOL)a4
{
  self->_glowEnabled = a3;
  if (a3 && !self->_suppressGlow)
    -[UIStatusBarBackgroundView _startGlowAnimationWaitForNextCycle:](self, "_startGlowAnimationWaitForNextCycle:", a4);
  else
    -[UIStatusBarBackgroundView _stopGlowAnimation](self, "_stopGlowAnimation");
}

- (void)setSuppressesGlow:(BOOL)a3
{
  self->_suppressGlow = a3;
  -[UIStatusBarBackgroundView _setGlowAnimationEnabled:waitForNextCycle:](self, "_setGlowAnimationEnabled:waitForNextCycle:", self->_glowEnabled, 1);
}

- (BOOL)_styleCanGlow
{
  double v2;

  -[UIStatusBarStyleAttributes glowAnimationDuration](self->_style, "glowAnimationDuration");
  return v2 > 0.0;
}

- (void)_startGlowAnimationWaitForNextCycle:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v15;
  float v16;
  float v17;
  UIImageView *v18;
  UIImageView *v19;
  UIImageView *glowView;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  id v29;

  if (!self->_glowView)
  {
    v3 = a3;
    if (-[UIStatusBarBackgroundView _styleCanGlow](self, "_styleCanGlow"))
    {
      -[UIStatusBarBackgroundView _glowImage](self, "_glowImage");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v5 = CACurrentMediaTime();
        v6 = floor(v5 / 1.5) * 1.5;
        if (v3)
          v7 = v6 + 1.5;
        else
          v7 = v6;
        +[UIStatusBarServer getGlowAnimationEndTimeForStyle:](UIStatusBarServer, "getGlowAnimationEndTimeForStyle:", self->_style);
        v9 = v8;
        if (v8 == 1.79769313e308)
        {
          v16 = 3.4028e38;
        }
        else
        {
          -[UIStatusBarStyleAttributes glowAnimationDuration](self->_style, "glowAnimationDuration");
          v11 = v10 == 1.79769313e308;
          v12 = v9 - v10;
          if (v11 || v5 > v9 || v5 < v12)
            goto LABEL_21;
          v15 = v9 - v5 - (v7 - v5);
          v16 = 0.0;
          if (v15 >= 1.5)
          {
            v17 = v15;
            v16 = ceil(v17 / 1.5);
            if (v16 < 0.0)
              goto LABEL_21;
          }
        }
        v18 = [UIImageView alloc];
        -[UIView bounds](self, "bounds");
        v19 = -[UIImageView initWithFrame:](v18, "initWithFrame:");
        glowView = self->_glowView;
        self->_glowView = v19;

        -[UIView setAutoresizingMask:](self->_glowView, "setAutoresizingMask:", 18);
        -[UIImageView setImage:](self->_glowView, "setImage:", v29);
        -[UIView setAlpha:](self->_glowView, "setAlpha:", 0.0);
        -[UIView addSubview:](self, "addSubview:", self->_glowView);
        objc_msgSend(MEMORY[0x1E0CD2710], "animation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setKeyPath:", CFSTR("opacity"));
        LODWORD(v22) = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setFromValue:", v23);

        LODWORD(v24) = 1.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setToValue:", v25);

        objc_msgSend(v21, "setDuration:", 0.75);
        objc_msgSend(v21, "setRemovedOnCompletion:", 0);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTimingFunction:", v26);

        objc_msgSend(v21, "setBeginTime:", v7);
        *(float *)&v27 = v16;
        objc_msgSend(v21, "setRepeatCount:", v27);
        objc_msgSend(v21, "setFrameInterval:", 0.05);
        objc_msgSend(v21, "setAutoreverses:", 1);
        -[UIView layer](self->_glowView, "layer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addAnimation:forKey:", v21, CFSTR("opacity"));

      }
LABEL_21:

    }
  }
}

- (void)_stopGlowAnimation
{
  UIImageView *glowView;
  void *v4;
  UIImageView *v5;

  glowView = self->_glowView;
  if (glowView)
  {
    -[UIView layer](glowView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllAnimations");

    -[UIView removeFromSuperview](self->_glowView, "removeFromSuperview");
    v5 = self->_glowView;
    self->_glowView = 0;

  }
}

- (id)_backgroundImageName
{
  return -[UIStatusBarStyleAttributes backgroundImageName](self->_style, "backgroundImageName");
}

- (id)_baseImage
{
  void *v2;
  void *v3;
  void *v4;

  -[UIStatusBarBackgroundView _backgroundImageName](self, "_backgroundImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Base.png"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_glowImage
{
  void *v2;
  void *v3;
  void *v4;

  -[UIStatusBarBackgroundView _backgroundImageName](self, "_backgroundImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Glow.png"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glowView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
