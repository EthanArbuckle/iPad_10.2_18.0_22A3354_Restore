@implementation IMFadeView

- (IMFadeView)initWithFrame:(CGRect)a3
{
  IMFadeView *v3;
  IMFadeView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMFadeView;
  v3 = -[IMFadeView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[IMFadeView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  CGColor *CopyWithAlpha;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = objc_retainAutorelease(a3);
  CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)objc_msgSend(v4, "CGColor"), 0.0);
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "CGColor");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, CopyWithAlpha, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGradientView gradientLayer](self, "gradientLayer"));
  objc_msgSend(v9, "setColors:", v8);

  CGColorRelease(CopyWithAlpha);
}

- (void)setDirection:(int)a3
{
  double y;
  void *v5;
  void *v6;
  double x;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGFloat v15;
  id v16;

  switch(a3)
  {
    case 0:
      y = CGPointZero.y;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMGradientView gradientLayer](self, "gradientLayer"));
      objc_msgSend(v5, "setStartPoint:", CGPointZero.x, y);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGradientView gradientLayer](self, "gradientLayer"));
      x = 0.0;
      v8 = 1.0;
      goto LABEL_5;
    case 1:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGradientView gradientLayer](self, "gradientLayer"));
      v10 = v9;
      v11 = 0.0;
      v12 = 1.0;
      goto LABEL_7;
    case 2:
      v13 = CGPointZero.y;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMGradientView gradientLayer](self, "gradientLayer"));
      objc_msgSend(v14, "setStartPoint:", CGPointZero.x, v13);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGradientView gradientLayer](self, "gradientLayer"));
      x = 1.0;
      v8 = 0.0;
LABEL_5:
      v16 = v6;
      goto LABEL_8;
    case 3:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGradientView gradientLayer](self, "gradientLayer"));
      v10 = v9;
      v11 = 1.0;
      v12 = 0.0;
LABEL_7:
      objc_msgSend(v9, "setStartPoint:", v11, v12);

      v15 = CGPointZero.y;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGradientView gradientLayer](self, "gradientLayer"));
      v16 = v6;
      x = CGPointZero.x;
      v8 = v15;
LABEL_8:
      objc_msgSend(v6, "setEndPoint:", x, v8);

      break;
    default:
      return;
  }
}

@end
