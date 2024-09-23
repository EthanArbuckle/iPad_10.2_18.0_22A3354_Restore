@implementation MonthWorkoutIndicator

- (MonthWorkoutIndicator)init
{
  MonthWorkoutIndicator *v2;
  uint64_t v3;
  CALayer *backgroundLayer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MonthWorkoutIndicator;
  v2 = -[MonthWorkoutIndicator init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    backgroundLayer = v2->_backgroundLayer;
    v2->_backgroundLayer = (CALayer *)v3;

    -[CALayer setFrame:](v2->_backgroundLayer, "setFrame:", 0.0, 0.0, 40.0, 40.0);
    -[MonthWorkoutIndicator addSublayer:](v2, "addSublayer:", v2->_backgroundLayer);
  }
  return v2;
}

- (void)setHasWorkout:(BOOL)a3
{
  self->_hasWorkout = a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CALayer setHidden:](self->_backgroundLayer, "setHidden:", !self->_hasWorkout);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)layoutSublayers
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MonthWorkoutIndicator;
  -[MonthWorkoutIndicator layoutSublayers](&v8, "layoutSublayers");
  -[MonthWorkoutIndicator bounds](self, "bounds");
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:");
  v4 = (void *)objc_opt_class(self, v3);
  -[MonthWorkoutIndicator bounds](self, "bounds");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filledWorkoutCircleWithSize:", v5, v6)));
  -[CALayer setContents:](self->_backgroundLayer, "setContents:", objc_msgSend(v7, "CGImage"));

}

+ (id)filledWorkoutCircleWithSize:(CGSize)a3
{
  CGFloat height;
  double width;
  CGContext *CurrentContext;
  CGFloat MidX;
  CGFloat MidY;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  CGGradient *v15;
  UIImage *ImageFromCurrentImageContext;
  uint64_t v17;
  void *v18;
  CGPoint v20;
  CGPoint v21;
  CGRect v22;
  CGRect v23;

  height = a3.height;
  width = a3.width;
  if (*(double *)&xmmword_10083DF28 != a3.width || *((double *)&xmmword_10083DF28 + 1) != a3.height)
  {
    xmmword_10083DF28 = (__int128)a3;
    UIGraphicsBeginImageContextWithOptions(a3, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = width;
    v22.size.height = height;
    MidX = CGRectGetMidX(v22);
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = width;
    v23.size.height = height;
    MidY = CGRectGetMidY(v23);
    CGContextAddArc(CurrentContext, MidX, MidY, (width + -1.0) * 0.5, 0.0, 6.28318531, 1);
    CGContextClip(CurrentContext);
    v11 = objc_msgSend((id)objc_opt_class(a1, v10), "fitnessColors");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "gradientLightColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "gradientDarkColor"));
    v15 = (CGGradient *)+[ARUIMetricColors newGradientForStartColor:endColor:](ARUIMetricColors, "newGradientForStartColor:endColor:", v13, v14);

    v20.y = 0.0;
    v20.x = width * 0.5;
    v21.x = width * 0.5;
    v21.y = height;
    CGContextDrawLinearGradient(CurrentContext, v15, v20, v21, 0);
    CGGradientRelease(v15);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v17 = objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    v18 = (void *)qword_10083DF20;
    qword_10083DF20 = v17;

    UIGraphicsEndImageContext();
  }
  return (id)qword_10083DF20;
}

- (id)actionForKey:(id)a3
{
  return 0;
}

+ (id)fitnessColors
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_10083DF38;
  if (!qword_10083DF38)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors"));
    v4 = (void *)qword_10083DF38;
    qword_10083DF38 = v3;

    v2 = (void *)qword_10083DF38;
  }
  return v2;
}

- (BOOL)hasWorkout
{
  return self->_hasWorkout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
}

@end
