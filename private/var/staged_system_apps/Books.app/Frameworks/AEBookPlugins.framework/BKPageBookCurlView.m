@implementation BKPageBookCurlView

- (BKPageBookCurlView)initWithImage:(id)a3 borderColor:(id)a4 isLeft:(BOOL)a5
{
  return -[BKPageBookCurlView initWithImage:borderColor:isLeft:gutterImage:](self, "initWithImage:borderColor:isLeft:gutterImage:", a3, a4, a5, 0);
}

- (BKPageBookCurlView)initWithImage:(id)a3 borderColor:(id)a4 isLeft:(BOOL)a5 gutterImage:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  BKPageBookCurlView *v11;
  BKPageBookCurlView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BKPageBookCurlView *v24;
  objc_super v26;

  v7 = a5;
  v9 = a3;
  v10 = a6;
  v26.receiver = self;
  v26.super_class = (Class)BKPageBookCurlView;
  v11 = -[BKPageBookCurlView init](&v26, "init");
  v12 = v11;
  if (v11)
  {
    -[BKPageBookCurlView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
    v12->_left = v7;
    objc_msgSend(v9, "size");
    v14 = v13;
    v16 = v15;
    if (v9)
    {
      v17 = objc_msgSend(objc_retainAutorelease(v9), "CGImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageBookCurlView layer](v12, "layer"));
      objc_msgSend(v18, "setContents:", v17);

    }
    if (v10)
    {
      v19 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v10);
      objc_msgSend(v10, "size");
      v21 = v20 * -0.5;
      if (v7)
        v22 = v14 + v21;
      else
        v22 = v21;
      objc_msgSend(v10, "size");
      objc_msgSend(v19, "setFrame:", v22, 0.0, v23, v16);
      -[BKPageBookCurlView addSubview:](v12, "addSubview:", v19);

    }
    v24 = v12;
  }

  return v12;
}

- (void)takeSnapshotOfView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  -[BKPageBookCurlView takeSnapshotOfView:rect:afterScreenUpdates:](self, "takeSnapshotOfView:rect:afterScreenUpdates:", v4, 0);

}

- (void)takeSnapshotOfView:(id)a3 rect:(CGRect)a4
{
  -[BKPageBookCurlView takeSnapshotOfView:rect:afterScreenUpdates:](self, "takeSnapshotOfView:rect:afterScreenUpdates:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)takeSnapshotOfView:(id)a3 rect:(CGRect)a4 afterScreenUpdates:(BOOL)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  CGFloat v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right));
  -[BKPageBookCurlView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(v6, "bounds");
  if (v8 != v12 || v10 != v13)
  {
    v15 = CGSizeScaleThatFitsInCGSize(v11, v12, v13, v8, v10);
    CGAffineTransformMakeScale(&v17, v15, v15);
    v16 = v17;
    objc_msgSend(v6, "setTransform:", &v16);
    -[BKPageBookCurlView bounds](self, "bounds");
    objc_msgSend(v6, "setFrame:");
  }
  -[BKPageBookCurlView addSubview:](self, "addSubview:", v6);

}

- (UIImage)image
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageBookCurlView layer](self, "layer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contents"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageBookCurlView layer](self, "layer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v6));

  }
  else
  {
    v7 = 0;
  }

  return (UIImage *)v7;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKPageBookCurlView layer](self, "layer"));
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGImage");

  objc_msgSend(v7, "setContents:", v6);
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
  unsigned int v16;
  unsigned int v17;
  double v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CAGradientLayer *smallGradientLayer;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  CAGradientLayer *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  double v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  double v48;
  double v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  CAGradientLayer *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;

  largeGradientLayer = self->_largeGradientLayer;
  if (a3)
  {
    if (!largeGradientLayer)
    {
      v6 = objc_opt_new(CAGradientLayer);
      v7 = self->_largeGradientLayer;
      self->_largeGradientLayer = v6;

      -[BKPageBookCurlView bounds](self, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v16 = -[BKPageBookCurlView isLeft](self, "isLeft");
      v17 = -[BKPageBookCurlView useInvertedColors](self, "useInvertedColors");
      if (v16)
      {
        if (v17)
        {
          v18 = 1.0;
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0)));
          v20 = objc_msgSend(v19, "CGColor");
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.529999971, 0.389999986)));
          v22 = objc_msgSend(v21, "CGColor");
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.519999981, 0.219999999)));
          smallGradientLayer = (CAGradientLayer *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v22, objc_msgSend(v23, "CGColor"), 0));

          LODWORD(v25) = 0;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25));
          LODWORD(v27) = 1063675494;
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27));
          LODWORD(v29) = 1.0;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v26, v28, v30, 0));
          v32 = 0.360000014;
LABEL_13:

          -[CAGradientLayer setFrame:](self->_largeGradientLayer, "setFrame:", v9, v11, v13, v15);
          -[CAGradientLayer setStartPoint:](self->_largeGradientLayer, "setStartPoint:", v32, 0.5);
          -[CAGradientLayer setEndPoint:](self->_largeGradientLayer, "setEndPoint:", v18, 0.5);
          -[CAGradientLayer setColors:](self->_largeGradientLayer, "setColors:", smallGradientLayer);
          -[CAGradientLayer setLocations:](self->_largeGradientLayer, "setLocations:", v31);
          if (self->_animate)
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
            LODWORD(v60) = 0;
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v60));
            objc_msgSend(v59, "setFromValue:", v61);

            LODWORD(v62) = 1.0;
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v62));
            objc_msgSend(v59, "setToValue:", v63);

            objc_msgSend(v59, "setDuration:", self->_duration);
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
            objc_msgSend(v59, "setTimingFunction:", v64);

            v65 = self->_largeGradientLayer;
            v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v59, kCAOnOrderIn));
            -[CAGradientLayer setActions:](v65, "setActions:", v66);

          }
          else
          {
            LODWORD(v58) = 0;
            -[CAGradientLayer setOpacity:](self->_largeGradientLayer, "setOpacity:", v58);
          }
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageBookCurlView layer](self, "layer"));
          objc_msgSend(v67, "addSublayer:", self->_largeGradientLayer);

          goto LABEL_17;
        }
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "colorWithAlphaComponent:", 0.230000004)));
        v68 = objc_msgSend(v42, "CGColor");
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "colorWithAlphaComponent:", 0.0500000007)));
        v45 = objc_msgSend(v44, "CGColor");
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "colorWithAlphaComponent:", 0.129999995)));
        smallGradientLayer = (CAGradientLayer *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v68, v45, objc_msgSend(v47, "CGColor"), 0));

        LODWORD(v48) = 0;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v48));
        LODWORD(v49) = 1059565076;
      }
      else
      {
        if (v17)
        {
          v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.519999981, 0.219999999)));
          v35 = objc_msgSend(v34, "CGColor");
          v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.529999971, 0.389999986)));
          v37 = objc_msgSend(v36, "CGColor");
          v32 = 0.0;
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0)));
          smallGradientLayer = (CAGradientLayer *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v35, v37, objc_msgSend(v38, "CGColor"), 0));

          LODWORD(v39) = 0;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v39));
          LODWORD(v40) = 1036831949;
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v40));
          LODWORD(v41) = 1.0;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v41));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v26, v28, v30, 0));
          v18 = 0.639999986;
          goto LABEL_13;
        }
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "colorWithAlphaComponent:", 0.129999995)));
        v69 = objc_msgSend(v50, "CGColor");
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "colorWithAlphaComponent:", 0.0500000007)));
        v53 = objc_msgSend(v52, "CGColor");
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "colorWithAlphaComponent:", 0.230000004)));
        smallGradientLayer = (CAGradientLayer *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v69, v53, objc_msgSend(v55, "CGColor"), 0));

        LODWORD(v56) = 0;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v56));
        LODWORD(v49) = 1051763671;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v49));
      LODWORD(v57) = 1.0;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v57));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v26, v28, v30, 0));
      v32 = 0.0;
      v18 = 1.0;
      goto LABEL_13;
    }
  }
  else if (largeGradientLayer)
  {
    -[CAGradientLayer removeFromSuperlayer](largeGradientLayer, "removeFromSuperlayer");
    v33 = self->_largeGradientLayer;
    self->_largeGradientLayer = 0;

    smallGradientLayer = self->_smallGradientLayer;
    self->_smallGradientLayer = 0;
LABEL_17:

  }
  self->_hasGradient = a3;
}

- (void)updateCurlPercent:(double)a3
{
  unsigned int v5;
  double v6;
  double v7;
  float v9;
  double v10;

  v5 = -[BKPageBookCurlView useInvertedColors](self, "useInvertedColors");
  v6 = 0.5;
  if (!v5)
    v6 = 1.0;
  v7 = v6 * a3;
  if (self->_hasGradient && v7 < 1.0)
  {
    v9 = v7;
    *(float *)&v7 = v9;
    -[CAGradientLayer setOpacity:](self->_largeGradientLayer, "setOpacity:", v7);
    *(float *)&v10 = v9;
    -[CAGradientLayer setOpacity:](self->_smallGradientLayer, "setOpacity:", v10);
  }
}

- (void)pageCurlWillCancelWithDuration:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[CAGradientLayer removeAnimationForKey:](self->_largeGradientLayer, "removeAnimationForKey:", CFSTR("largeGradientOrderOut"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAGradientLayer presentationLayer](self->_largeGradientLayer, "presentationLayer"));
  objc_msgSend(v5, "opacity");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v10, "setFromValue:", v6);

  LODWORD(v7) = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
  objc_msgSend(v10, "setToValue:", v8);

  objc_msgSend(v10, "setDuration:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v10, "setTimingFunction:", v9);

  objc_msgSend(v10, "setRemovedOnCompletion:", 0);
  objc_msgSend(v10, "setFillMode:", kCAFillModeForwards);
  -[CAGradientLayer addAnimation:forKey:](self->_largeGradientLayer, "addAnimation:forKey:", v10, CFSTR("largeGradientOrderOut"));

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

- (BOOL)isLeft
{
  return self->_left;
}

- (void)setLeft:(BOOL)a3
{
  self->_left = a3;
}

- (CALayer)smallGradientLayer
{
  return &self->_smallGradientLayer->super;
}

- (void)setSmallGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_smallGradientLayer, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)useInvertedColors
{
  return self->_useInvertedColors;
}

- (void)setUseInvertedColors:(BOOL)a3
{
  self->_useInvertedColors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallGradientLayer, 0);
  objc_storeStrong((id *)&self->_largeGradientLayer, 0);
}

@end
