@implementation VUICountDownProgressIndicator

- (VUICountDownProgressIndicator)initWithFrame:(CGRect)a3 duration:(double)a4
{
  char *v5;
  VUICountDownProgressIndicator *v6;
  _QWORD *v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VUICountDownProgressIndicator;
  v5 = -[VUICountDownProgressIndicator initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (VUICountDownProgressIndicator *)v5;
  if (v5)
  {
    *((double *)v5 + 53) = a4;
    *((_QWORD *)v5 + 71) = 0xBFF0000000000000;
    *((_QWORD *)v5 + 68) = 0;
    *((_QWORD *)v5 + 55) = 0x4008000000000000;
    v7 = v5 + 576;
    UIEdgeInsetsMakeWithEdges();
    *v7 = v8;
    v6->_progressInset.left = v9;
    v6->_progressInset.bottom = v10;
    v6->_progressInset.right = v11;
    UIEdgeInsetsMakeWithEdges();
    v6->_centerImageInset.top = v12;
    v6->_centerImageInset.left = v13;
    v6->_centerImageInset.bottom = v14;
    v6->_centerImageInset.right = v15;
    -[VUICountDownProgressIndicator setClipsToBounds:](v6, "setClipsToBounds:", 1);
  }
  return v6;
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUICountDownProgressIndicator;
  -[VUICountDownProgressIndicator didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[VUICountDownProgressIndicator superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUICountDownProgressIndicator _configureProgressLayer](self, "_configureProgressLayer");
    -[VUICountDownProgressIndicator restartWithAnimation:](self, "restartWithAnimation:", 1);
  }
  else
  {
    -[VUICountDownProgressIndicator _stopAutoAnimation](self, "_stopAutoAnimation");
  }
}

- (void)restartWithAnimation:(BOOL)a3
{
  -[VUICountDownProgressIndicator _setProgress:animated:](self, "_setProgress:animated:", a3, 0.00001);
}

- (void)layoutSubviews
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
  double v16;
  double v17;
  double v18;
  void *v19;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)VUICountDownProgressIndicator;
  -[VUICountDownProgressIndicator layoutSubviews](&v40, sel_layoutSubviews);
  -[VUICountDownProgressIndicator bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VUICountDownProgressIndicator progressInset](self, "progressInset");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  -[VUICountDownProgressIndicator progressLayer](self, "progressLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[VUICountDownProgressIndicator bounds](self, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[VUICountDownProgressIndicator centerImageInset](self, "centerImageInset");
  v29 = v21 + v28;
  v31 = v23 + v30;
  v33 = v25 - (v28 + v32);
  v35 = v27 - (v30 + v34);
  -[VUICountDownProgressIndicator centerImageView](self, "centerImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

  -[VUICountDownProgressIndicator bounds](self, "bounds");
  v38 = v37 * 0.5;
  -[VUICountDownProgressIndicator layer](self, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setCornerRadius:", v38);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VUICountDownProgressIndicator displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[VUICountDownProgressIndicator setDisplayLink:](self, "setDisplayLink:", 0);
  v4.receiver = self;
  v4.super_class = (Class)VUICountDownProgressIndicator;
  -[VUICountDownProgressIndicator dealloc](&v4, sel_dealloc);
}

- (void)setTintColor:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUICountDownProgressIndicator;
  v3 = -[VUICountDownProgressIndicator tintColor](&v4, sel_tintColor, a3);
}

- (void)setProgressTintColor:(id)a3
{
  void *v5;
  UIColor *v6;

  v6 = (UIColor *)a3;
  if (self->_progressTintColor != v6)
  {
    objc_storeStrong((id *)&self->_progressTintColor, a3);
    -[VUICountDownProgressIndicator progressLayer](self, "progressLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStrokeColor:", -[UIColor CGColor](objc_retainAutorelease(v6), "CGColor"));

    -[VUICountDownProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setCenterImageInset:(UIEdgeInsets)a3
{
  if (self->_centerImageInset.left != a3.left
    || self->_centerImageInset.top != a3.top
    || self->_centerImageInset.right != a3.right
    || self->_centerImageInset.bottom != a3.bottom)
  {
    self->_centerImageInset = a3;
    -[VUICountDownProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setCenterImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_centerImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_centerImage, a3);
    -[VUICountDownProgressIndicator _configureBackground](self, "_configureBackground");
    v5 = v6;
  }

}

- (void)setBackgroundTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_backgroundTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundTintColor, a3);
    -[VUICountDownProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)_configureProgressLayer
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  -[VUICountDownProgressIndicator progressLayer](self, "progressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v7 = (id)objc_opt_new();
    -[VUICountDownProgressIndicator progressTintColor](self, "progressTintColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setFillColor:", objc_msgSend(v5, "CGColor"));

    -[VUICountDownProgressIndicator progressWidth](self, "progressWidth");
    objc_msgSend(v7, "setLineWidth:");
    -[VUICountDownProgressIndicator layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v7);

    -[VUICountDownProgressIndicator setProgressLayer:](self, "setProgressLayer:", v7);
  }
}

- (void)_configureBackground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VUICountDownProgressIndicator *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  -[VUICountDownProgressIndicator backgroundTintColor](self, "backgroundTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUICountDownProgressIndicator backgroundTintColor](self, "backgroundTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUICountDownProgressIndicator setBackgroundColor:](self, "setBackgroundColor:", v4);

  }
  -[VUICountDownProgressIndicator centerImage](self, "centerImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUICountDownProgressIndicator centerImageView](self, "centerImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (VUICountDownProgressIndicator *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
    {
      -[VUICountDownProgressIndicator centerImageView](self, "centerImageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[VUICountDownProgressIndicator centerImage](self, "centerImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithImage:", v10);
    -[VUICountDownProgressIndicator setCenterImageView:](self, "setCenterImageView:", v11);

    -[VUICountDownProgressIndicator centerImageView](self, "centerImageView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[VUICountDownProgressIndicator addSubview:](self, "addSubview:", v12);

  }
}

- (void)_setProgress:(double)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3 != 0.0 && self->_progress != a3)
  {
    if (a4)
    {
      -[VUICountDownProgressIndicator setAnimating:](self, "setAnimating:", 1);
      -[VUICountDownProgressIndicator displayLink](self, "displayLink");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "displayLinkWithTarget:selector:", self, sel__animateValueOnDisplayLink_);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addToRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

        -[VUICountDownProgressIndicator setDisplayLink:](self, "setDisplayLink:", v8);
      }
    }
    else
    {
      -[VUICountDownProgressIndicator setAnimating:](self, "setAnimating:", 0);
      -[VUICountDownProgressIndicator displayLink](self, "displayLink");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidate");

      -[VUICountDownProgressIndicator setDisplayLink:](self, "setDisplayLink:", 0);
    }
    -[VUICountDownProgressIndicator setProgress:](self, "setProgress:", a3);
    -[VUICountDownProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_stopAutoAnimation
{
  void *v3;

  -[VUICountDownProgressIndicator setAnimating:](self, "setAnimating:", 0);
  -[VUICountDownProgressIndicator displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[VUICountDownProgressIndicator setDisplayLink:](self, "setDisplayLink:", 0);
}

- (void)_animateValueOnDisplayLink:(id)a3
{
  double v4;
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
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void (**v22)(void);
  id v23;

  v23 = a3;
  -[VUICountDownProgressIndicator autoFillDelta](self, "autoFillDelta");
  if (v4 == 0.0)
  {
    objc_msgSend(v23, "duration");
    v6 = v5;
    -[VUICountDownProgressIndicator duration](self, "duration");
    -[VUICountDownProgressIndicator setAutoFillDelta:](self, "setAutoFillDelta:", v6 / v7);
  }
  v8 = 0.0;
  if (-[VUICountDownProgressIndicator isAnimating](self, "isAnimating"))
  {
    -[VUICountDownProgressIndicator progress](self, "progress");
    v10 = v9;
    -[VUICountDownProgressIndicator autoFillDelta](self, "autoFillDelta");
    v8 = v10 + v11;
    -[VUICountDownProgressIndicator _setProgress:animated:](self, "_setProgress:animated:", 1, v8);
  }
  if (-[VUICountDownProgressIndicator isAnimating](self, "isAnimating"))
  {
    -[VUICountDownProgressIndicator progressLayer](self, "progressLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;

    v17 = v8 * -6.28318531 + -1.57079633;
    if (self->_countDownProgressDirection != 1)
      v17 = v8 * 6.28318531 + -1.57079633;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v14 * 0.5, v16 * 0.5, v16 * 0.5, -1.57079633, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUICountDownProgressIndicator progressLayer](self, "progressLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_retainAutorelease(v18);
    objc_msgSend(v19, "setPath:", objc_msgSend(v20, "CGPath"));

    -[VUICountDownProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
  }
  if (v8 >= 1.0)
  {
    -[VUICountDownProgressIndicator _stopAutoAnimation](self, "_stopAutoAnimation");
    -[VUICountDownProgressIndicator completion](self, "completion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[VUICountDownProgressIndicator completion](self, "completion");
      v22 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v22[2]();

    }
  }

}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)countDownProgressDirection
{
  return self->_countDownProgressDirection;
}

- (void)setCountDownProgressDirection:(unint64_t)a3
{
  self->_countDownProgressDirection = a3;
}

- (double)progressWidth
{
  return self->_progressWidth;
}

- (void)setProgressWidth:(double)a3
{
  self->_progressWidth = a3;
}

- (UIEdgeInsets)progressInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_progressInset.top;
  left = self->_progressInset.left;
  bottom = self->_progressInset.bottom;
  right = self->_progressInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setProgressInset:(UIEdgeInsets)a3
{
  self->_progressInset = a3;
}

- (UIColor)progressTintColor
{
  return self->_progressTintColor;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (UIEdgeInsets)backgroundImageInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_backgroundImageInset.top;
  left = self->_backgroundImageInset.left;
  bottom = self->_backgroundImageInset.bottom;
  right = self->_backgroundImageInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBackgroundImageInset:(UIEdgeInsets)a3
{
  self->_backgroundImageInset = a3;
}

- (UIColor)backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (UIImage)centerImage
{
  return self->_centerImage;
}

- (UIEdgeInsets)centerImageInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_centerImageInset.top;
  left = self->_centerImageInset.left;
  bottom = self->_centerImageInset.bottom;
  right = self->_centerImageInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)centerTintColor
{
  return self->_centerTintColor;
}

- (void)setCenterTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_centerTintColor, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (CAShapeLayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (CAShapeLayer)centerLayer
{
  return self->_centerLayer;
}

- (void)setCenterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_centerLayer, a3);
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressLayer, a3);
}

- (CAShapeLayer)progressMaskLayer
{
  return self->_progressMaskLayer;
}

- (void)setProgressMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressMaskLayer, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)autoFillDelta
{
  return self->_autoFillDelta;
}

- (void)setAutoFillDelta:(double)a3
{
  self->_autoFillDelta = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UIImageView)centerImageView
{
  return self->_centerImageView;
}

- (void)setCenterImageView:(id)a3
{
  objc_storeStrong((id *)&self->_centerImageView, a3);
}

- (double)autoFillStartTimeStamp
{
  return self->_autoFillStartTimeStamp;
}

- (void)setAutoFillStartTimeStamp:(double)a3
{
  self->_autoFillStartTimeStamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerImageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_progressMaskLayer, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_centerLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_centerTintColor, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_progressTintColor, 0);
}

@end
