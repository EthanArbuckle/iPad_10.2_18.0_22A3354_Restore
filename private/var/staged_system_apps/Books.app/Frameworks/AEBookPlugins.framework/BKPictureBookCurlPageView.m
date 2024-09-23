@implementation BKPictureBookCurlPageView

- (BKPictureBookCurlPageView)initWithFrame:(CGRect)a3
{
  BKPictureBookCurlPageView *v3;
  BKPictureBookCurlPageView *v4;
  uint64_t v5;
  void *v6;
  BKPictureBookCurlPageView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookCurlPageView;
  v3 = -[BKPictureBookCurlPageView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BKPictureBookCurlPageView setOpaque:](v3, "setOpaque:", 1);
    if (-[BKPictureBookCurlPageView isNightMode](v4, "isNightMode"))
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    else
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v6 = (void *)v5;
    -[BKPictureBookCurlPageView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[BKPictureBookCurlPageView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v4->_scale = 1.0;
    v7 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
  -[UIImageView removeFromSuperview](self->_gutter, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookCurlPageView;
  -[BKPictureBookCurlPageView dealloc](&v3, "dealloc");
}

- (BOOL)isNightMode
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle") == (char *)&dword_0 + 2 || UIAccessibilityIsInvertColorsEnabled();

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookCurlPageView;
  -[BKPictureBookCurlPageView layoutSubviews](&v9, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_gutter, "image"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "size");
    v6 = v5 * self->_scale;
    -[UIImageView frame](self->_gutter, "frame");
    v8 = v7;
    -[BKPictureBookCurlPageView bounds](self, "bounds");
    -[UIImageView setFrame:](self->_gutter, "setFrame:", v8, 0.0, v6, CGRectGetHeight(v10));
  }
  -[BKPictureBookCurlPageView bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_largeGradientLayer, "setFrame:");
  -[BKPictureBookCurlPageView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:");

}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  id v6;
  UIImageView *v7;
  UIImageView *imageView;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  v10 = v4;
  if (!self->_imageView)
  {
    v6 = objc_alloc((Class)UIImageView);
    -[BKPictureBookCurlPageView bounds](self, "bounds");
    v7 = (UIImageView *)objc_msgSend(v6, "initWithFrame:");
    imageView = self->_imageView;
    self->_imageView = v7;

    -[UIImageView setAutoresizingMask:](self->_imageView, "setAutoresizingMask:", 18);
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    objc_msgSend(v9, "setMagnificationFilter:", kCAFilterLinear);

    -[BKPictureBookCurlPageView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_imageView, 0);
    v5 = v10;
    if (v10)
      goto LABEL_3;
LABEL_5:
    -[BKPictureBookCurlPageView addGutter:](self, "addGutter:", self->_right);
    v5 = v10;
    goto LABEL_3;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);

}

- (void)reset
{
  void *v3;
  UIImageView *gutter;

  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView layer](self, "layer"));
  objc_msgSend(v3, "setMask:", 0);

  -[UIImageView removeFromSuperview](self->_gutter, "removeFromSuperview");
  gutter = self->_gutter;
  self->_gutter = 0;

}

- (void)setTopView:(id)a3 isRightPage:(BOOL)a4
{
  _BOOL8 v4;
  id obj;

  v4 = a4;
  self->_right = a4;
  obj = a3;
  -[BKPictureBookCurlPageView bounds](self, "bounds");
  objc_msgSend(obj, "setFrame:");
  -[BKPictureBookCurlPageView addSubview:](self, "addSubview:", obj);
  -[BKPictureBookCurlPageView addGutter:](self, "addGutter:", v4);
  -[BKPictureBookCurlPageView setClipsToBounds:](self, "setClipsToBounds:", 1);
  objc_storeWeak((id *)&self->_topView, obj);

}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setMirror:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;
  CATransform3D v9;

  self->_mirror = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView layer](self, "layer"));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "sublayerTransform");
  else
    memset(&v8, 0, sizeof(v8));
  CATransform3DScale(&v9, &v8, -1.0, 1.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView layer](self, "layer"));
  v7 = v9;
  objc_msgSend(v6, "setSublayerTransform:", &v7);

}

- (void)addGutter:(BOOL)a3
{
  _BOOL4 v4;
  UIImageView *v5;
  UIImageView *gutter;
  double v7;
  double v8;
  double v9;
  id v10;
  CGRect v11;
  CGRect v12;

  if (!self->_gutter && self->_drawsSpine)
  {
    v4 = a3;
    v10 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("PictureBookSpine.png")));
    v5 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v10);
    gutter = self->_gutter;
    self->_gutter = v5;

    -[BKPictureBookCurlPageView addSubview:](self, "addSubview:", self->_gutter);
    objc_msgSend(v10, "size");
    v8 = v7 * self->_scale;
    if (v4)
    {
      v9 = v8 * -0.5;
    }
    else
    {
      -[BKPictureBookCurlPageView bounds](self, "bounds");
      v9 = CGRectGetWidth(v11) + v8 * -0.5;
    }
    -[BKPictureBookCurlPageView bounds](self, "bounds");
    -[UIImageView setFrame:](self->_gutter, "setFrame:", v9, 0.0, v8, CGRectGetHeight(v12));

  }
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  id WeakRetained;
  int64_t pageOffset;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BKPictureBookCurlPageView;
  v3 = -[BKPictureBookCurlPageView description](&v15, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (self->_right)
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  WeakRetained = objc_loadWeakRetained((id *)&self->_topView);
  pageOffset = self->_pageOffset;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView layer](self, "layer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mask"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView layer](self, "layer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mask"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ isRight=%@ topView=%p pageOffset=%ld mask=%@"), v4, v5, WeakRetained, pageOffset, v12));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ isRight=%@ topView=%p pageOffset=%ld mask=%@"), v4, v5, WeakRetained, pageOffset, CFSTR("<nil>")));
  }

  return v13;
}

- (void)setShouldHaveGradient:(BOOL)a3
{
  CAGradientLayer *largeGradientLayer;
  CAGradientLayer *v6;
  CAGradientLayer *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned __int8 v16;
  unsigned int v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  id v23;
  CAGradientLayer *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  double v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  double v47;
  double v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  CAGradientLayer *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;

  largeGradientLayer = self->_largeGradientLayer;
  if (a3)
  {
    if (!largeGradientLayer)
    {
      v6 = objc_opt_new(CAGradientLayer);
      v7 = self->_largeGradientLayer;
      self->_largeGradientLayer = v6;

      -[BKPictureBookCurlPageView bounds](self, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v16 = -[BKPictureBookCurlPageView isRight](self, "isRight");
      v17 = -[BKPictureBookCurlPageView useNightColors](self, "useNightColors");
      if ((v16 & 1) != 0)
      {
        if (v17)
        {
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.519999981, 0.219999999)));
          v19 = objc_msgSend(v18, "CGColor");
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.529999971, 0.389999986)));
          v21 = objc_msgSend(v20, "CGColor");
          v22 = 0.0;
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0)));
          v24 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v19, v21, objc_msgSend(v23, "CGColor"), 0));

          LODWORD(v25) = 0;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25));
          LODWORD(v27) = 1036831949;
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27));
          LODWORD(v29) = 1.0;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v26, v28, v30, 0));
          v32 = 0.639999986;
LABEL_13:

          -[CAGradientLayer setFrame:](self->_largeGradientLayer, "setFrame:", v9, v11, v13, v15);
          -[CAGradientLayer setStartPoint:](self->_largeGradientLayer, "setStartPoint:", v22, 0.5);
          -[CAGradientLayer setEndPoint:](self->_largeGradientLayer, "setEndPoint:", v32, 0.5);
          -[CAGradientLayer setColors:](self->_largeGradientLayer, "setColors:", v24);
          -[CAGradientLayer setLocations:](self->_largeGradientLayer, "setLocations:", v31);
          if (self->_animate)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
            LODWORD(v59) = 0;
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v59));
            objc_msgSend(v58, "setFromValue:", v60);

            LODWORD(v61) = 1.0;
            v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v61));
            objc_msgSend(v58, "setToValue:", v62);

            objc_msgSend(v58, "setDuration:", self->_duration);
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
            objc_msgSend(v58, "setTimingFunction:", v63);

            v64 = self->_largeGradientLayer;
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v58, kCAOnOrderIn));
            -[CAGradientLayer setActions:](v64, "setActions:", v65);

          }
          else
          {
            LODWORD(v57) = 0;
            -[CAGradientLayer setOpacity:](self->_largeGradientLayer, "setOpacity:", v57);
          }
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlPageView layer](self, "layer"));
          objc_msgSend(v66, "addSublayer:", self->_largeGradientLayer);

          goto LABEL_17;
        }
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "colorWithAlphaComponent:", 0.129999995)));
        v67 = objc_msgSend(v41, "CGColor");
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "colorWithAlphaComponent:", 0.0500000007)));
        v44 = objc_msgSend(v43, "CGColor");
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "colorWithAlphaComponent:", 0.230000004)));
        v24 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v67, v44, objc_msgSend(v46, "CGColor"), 0));

        LODWORD(v47) = 0;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v47));
        LODWORD(v48) = 1051763671;
      }
      else
      {
        if (v17)
        {
          v32 = 1.0;
          v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0)));
          v34 = objc_msgSend(v33, "CGColor");
          v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.529999971, 0.389999986)));
          v36 = objc_msgSend(v35, "CGColor");
          v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.519999981, 0.219999999)));
          v24 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v34, v36, objc_msgSend(v37, "CGColor"), 0));

          LODWORD(v38) = 0;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v38));
          LODWORD(v39) = 1063675494;
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v39));
          LODWORD(v40) = 1.0;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v40));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v26, v28, v30, 0));
          v22 = 0.360000014;
          goto LABEL_13;
        }
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "colorWithAlphaComponent:", 0.230000004)));
        v68 = objc_msgSend(v49, "CGColor");
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "colorWithAlphaComponent:", 0.0500000007)));
        v52 = objc_msgSend(v51, "CGColor");
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "colorWithAlphaComponent:", 0.129999995)));
        v24 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v68, v52, objc_msgSend(v54, "CGColor"), 0));

        LODWORD(v55) = 0;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v55));
        LODWORD(v48) = 1059565076;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v48));
      LODWORD(v56) = 1.0;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v56));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v26, v28, v30, 0));
      v22 = 0.0;
      v32 = 1.0;
      goto LABEL_13;
    }
  }
  else if (largeGradientLayer)
  {
    -[CAGradientLayer removeFromSuperlayer](largeGradientLayer, "removeFromSuperlayer");
    v24 = self->_largeGradientLayer;
    self->_largeGradientLayer = 0;
LABEL_17:

  }
  self->_hasGradient = a3;
}

- (void)updateCurlPercent:(double)a3
{
  double v3;
  double v4;

  v3 = 0.5;
  if (!self->_useNightColors)
    v3 = 1.0;
  v4 = v3 * a3;
  if (self->_hasGradient && v4 < 1.0)
  {
    *(float *)&v4 = v4;
    -[CAGradientLayer setOpacity:](self->_largeGradientLayer, "setOpacity:", v4);
  }
}

- (void)pageCurlWillCancel
{
  double v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  LODWORD(v3) = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v3));
  objc_msgSend(v6, "setToValue:", v4);

  objc_msgSend(v6, "setDuration:", 0.1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v6, "setTimingFunction:", v5);

  objc_msgSend(v6, "setRemovedOnCompletion:", 0);
  objc_msgSend(v6, "setFillMode:", kCAFillModeForwards);
  -[CAGradientLayer addAnimation:forKey:](self->_largeGradientLayer, "addAnimation:forKey:", v6, CFSTR("largeGradientOrderOut"));

}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BOOL)drawsSpine
{
  return self->_drawsSpine;
}

- (void)setDrawsSpine:(BOOL)a3
{
  self->_drawsSpine = a3;
}

- (CAGradientLayer)largeGradientLayer
{
  return self->_largeGradientLayer;
}

- (void)setLargeGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_largeGradientLayer, a3);
}

- (BOOL)useNightColors
{
  return self->_useNightColors;
}

- (void)setUseNightColors:(BOOL)a3
{
  self->_useNightColors = a3;
}

- (BOOL)shouldHaveGradient
{
  return self->_hasGradient;
}

- (BOOL)shouldAnimate
{
  return self->_animate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_animate = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isRight
{
  return self->_right;
}

- (void)setRight:(BOOL)a3
{
  self->_right = a3;
}

- (UIView)topView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_topView);
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(int64_t)a3
{
  self->_pageOffset = a3;
}

- (BOOL)isMirror
{
  return self->_mirror;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeGradientLayer, 0);
  objc_storeStrong((id *)&self->_gutter, 0);
  objc_destroyWeak((id *)&self->_topView);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
