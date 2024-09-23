@implementation _TUIOverlayFadeGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAGradientLayer, a2);
}

- (void)configureGradientWithAxis:(unint64_t)a3 leading:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[2];

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIOverlayFadeGradientView gradientLayer](self, "gradientLayer"));
  objc_msgSend(v6, "setCompositingFilter:", kCAFilterDestOut);
  v7 = (double)!v4;
  if (a3 == 2)
    v8 = 0.5;
  else
    v8 = (double)!v4;
  if (a3 == 2)
  {
    v9 = 0.5;
  }
  else
  {
    v7 = 0.5;
    v9 = (double)v4;
  }
  if (a3 == 2)
    v10 = (double)v4;
  else
    v10 = 0.5;
  objc_msgSend(v6, "setStartPoint:", v8, v7, (double)v4);
  objc_msgSend(v6, "setEndPoint:", v9, v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v14[0] = objc_msgSend(v11, "CGColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  v14[1] = objc_msgSend(v12, "CGColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  objc_msgSend(v6, "setColors:", v13);

}

@end
