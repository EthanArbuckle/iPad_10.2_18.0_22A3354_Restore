@implementation PBCurtainView

+ (CGImage)curtainImageWithStyle:(int)a3
{
  double v3;
  const __CFString *v4;

  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen", *(_QWORD *)&a3), "scale");
  if (v3 == 1.0)
    v4 = CFSTR("Default");
  else
    v4 = (const __CFString *)objc_msgSend(CFSTR("Default"), "stringByAppendingString:", CFSTR("@2x"));
  return -[UIImage CGImage](+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", -[NSBundle pathForResource:ofType:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "pathForResource:ofType:", v4, CFSTR("png"))), "CGImage");
}

- (PBCurtainView)initWithStyle:(int)a3
{
  uint64_t v3;
  PBCurtainView *v4;
  PBCurtainView *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)PBCurtainView;
  v4 = -[PBCurtainView initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    -[PBCurtainView _setStyle:](v4, "_setStyle:", v3);
    objc_msgSend(-[PBCurtainView layer](v5, "layer"), "setGeometryFlipped:", 1);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CABasicAnimation setDelegate:](self->_animation, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)PBCurtainView;
  -[PBCurtainView dealloc](&v3, "dealloc");
}

- (void)_setStyle:(int)a3
{
  self->_style = a3;
  objc_msgSend(-[PBCurtainView layer](self, "layer"), "setContents:", +[PBCurtainView curtainImageWithStyle:](PBCurtainView, "curtainImageWithStyle:", *(_QWORD *)&a3));
}

- (void)setStyle:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (!-[PBCurtainView isAnimating](self, "isAnimating") && self->_style != (_DWORD)v3)
    -[PBCurtainView _setStyle:](self, "_setStyle:", v3);
}

- (void)animateWithStyle:(int)a3 didStartBlock:(id)a4 completionBlock:(id)a5
{
  CABasicAnimation *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;

  if (!self->_isAnimating)
  {
    self->_isAnimating = 1;
    self->_didStartBlock = objc_msgSend(a4, "copy");
    self->_completionBlock = objc_msgSend(a5, "copy");
    v8 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
    self->_animation = v8;
    -[CABasicAnimation setDuration:](v8, "setDuration:", UIAnimationDragCoefficient(v8) * 0.7);
    -[CABasicAnimation setFillMode:](self->_animation, "setFillMode:", kCAFillModeBoth);
    -[CABasicAnimation setRemovedOnCompletion:](self->_animation, "setRemovedOnCompletion:", 1);
    LODWORD(v9) = 1048165965;
    LODWORD(v10) = 1002897197;
    LODWORD(v11) = 1062925553;
    LODWORD(v12) = 1060768338;
    -[CABasicAnimation setTimingFunction:](self->_animation, "setTimingFunction:", +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v9, v10, v11, v12));
    v13 = -[PBCurtainView layer](self, "layer");
    if (a3 == 1)
      v15 = 1.0;
    else
      v15 = 0.0;
    if (a3 == 1)
      v16 = 0.0;
    else
      v16 = 1.0;
    *(float *)&v14 = v15;
    objc_msgSend(v13, "setOpacity:", v14);
    *(float *)&v17 = v16;
    -[CABasicAnimation setFromValue:](self->_animation, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
    *(float *)&v18 = v15;
    -[CABasicAnimation setToValue:](self->_animation, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
    -[CABasicAnimation setDelegate:](self->_animation, "setDelegate:", self);
    objc_msgSend(-[PBCurtainView layer](self, "layer"), "addAnimation:forKey:", self->_animation, CFSTR("curtain"));
  }
}

- (void)animationDidStart:(id)a3
{
  PBCurtainView *v3;
  void (**didStartBlock)(void);

  v3 = self;
  didStartBlock = (void (**)(void))self->_didStartBlock;
  if (didStartBlock)
  {
    didStartBlock[2]();

    self->_didStartBlock = 0;
  }

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  PBCurtainView *v4;
  void (**completionBlock)(void);

  v4 = self;
  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2]();

    self->_completionBlock = 0;
  }
  -[CABasicAnimation setDelegate:](self->_animation, "setDelegate:", 0);

  self->_animation = 0;
  objc_msgSend(-[PBCurtainView layer](self, "layer"), "removeAnimationForKey:", CFSTR("curtain"));

}

- (int)style
{
  return self->_style;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

@end
