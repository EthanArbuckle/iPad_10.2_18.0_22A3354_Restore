@implementation _TUIGradientStyler

- (_TUIGradientStyler)initWithLayout:(id)a3
{
  id v4;
  _TUIGradientStyler *v5;
  void *v6;
  uint64_t v7;
  UIColor *startColor;
  void *v9;
  uint64_t v10;
  UIColor *endColor;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *blendMode;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_TUIGradientStyler;
  v5 = -[_TUIGradientStyler init](&v35, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gradientStartColor"));
    startColor = v5->_startColor;
    v5->_startColor = (UIColor *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "gradientEndColor"));
    endColor = v5->_endColor;
    v5->_endColor = (UIColor *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
    objc_msgSend(v12, "gradientStartPosition");
    v5->_startPosition = v13;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
    objc_msgSend(v14, "gradientEndPosition");
    v5->_endPosition = v15;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
    v5->_direction = (unint64_t)objc_msgSend(v16, "gradientDirection");

    v17 = objc_opt_class(TUIStyledBox);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutAncestor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "box"));
    v20 = TUIDynamicCast(v17, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v21, "cornerRadius");
    v5->_cornerRadius = v22;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
    v5->_continuousCorners = objc_msgSend(v23, "continuousCorners");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "blendMode"));
    v26 = (NSString *)objc_msgSend(v25, "copy");
    blendMode = v5->_blendMode;
    v5->_blendMode = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
    objc_msgSend(v28, "gradientBlurRadius");
    v5->_blurRadius = v29;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
    objc_msgSend(v30, "gradientBlurOffset");
    v5->_blurOffset = v31;

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
    objc_msgSend(v32, "opacity");
    v5->_opacity = v33;

  }
  return v5;
}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _TUIGradientStyler *v7;
  UIColor *startColor;
  UIColor *endColor;
  NSString *blendMode;
  char v11;

  v4 = a3;
  v5 = objc_opt_class(_TUIGradientStyler);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (_TUIGradientStyler *)objc_claimAutoreleasedReturnValue(v6);

  if (v7 == self)
    v11 = 1;
  else
    v11 = v7
       && self->_startPosition == v7->_startPosition
       && self->_endPosition == v7->_endPosition
       && self->_direction == v7->_direction
       && self->_cornerRadius == v7->_cornerRadius
       && self->_continuousCorners == v7->_continuousCorners
       && ((startColor = self->_startColor, startColor == v7->_startColor)
        || -[UIColor isEqual:](startColor, "isEqual:"))
       && ((endColor = self->_endColor, endColor == v7->_endColor)
        || -[UIColor isEqual:](endColor, "isEqual:"))
       && ((blendMode = self->_blendMode, blendMode == v7->_blendMode)
        || -[NSString isEqualToString:](blendMode, "isEqualToString:"))
       && self->_blurRadius == v7->_blurRadius
       && self->_blurOffset == v7->_blurOffset
       && self->_opacity == v7->_opacity;

  return v11;
}

- (void)applyStylingToLayer:(id)a3
{
  id v4;
  double opacity;
  uint64_t v6;
  CGImage *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIColor *startColor;
  void *v20;
  double v21;
  double endPosition;
  const CALayerCornerCurve *v23;
  void *v24;
  _QWORD v25[2];
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  id v29;

  v4 = a3;
  opacity = self->_opacity;
  *(float *)&opacity = opacity;
  objc_msgSend(v4, "setOpacity:", opacity);
  v6 = kCAFilterVariableBlur;
  if (-[NSString isEqualToString:](self->_blendMode, "isEqualToString:", kCAFilterVariableBlur))
  {
    v7 = -[_TUIGradientStyler maskImageWithStartPoint:endPoint:offset:startColor:endColor:direction:containerBounds:](self, "maskImageWithStartPoint:endPoint:offset:startColor:endColor:direction:containerBounds:", self->_startColor, self->_endColor, self->_direction, self->_startPosition, self->_endPosition, self->_blurOffset, 0.0, 0.0, 10.0, 10.0);
    v8 = (id)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v6));
    objc_msgSend(v8, "setValue:forKey:", &__kCFBooleanFalse, CFSTR("inputDither"));
    objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("inputMaskImage"));
    objc_msgSend(v8, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("inputNormalizeEdges"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_blurRadius));
    objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("inputRadius"));

    objc_msgSend(v4, "setAllowsHitTesting:", 0);
    v29 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    objc_msgSend(v4, "setFilters:", v10);

    objc_msgSend(v4, "setMasksToBounds:", 1);
  }
  else
  {
    v11 = kCAFilterGaussianBlur;
    if (-[NSString isEqualToString:](self->_blendMode, "isEqualToString:", kCAFilterGaussianBlur))
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v11));
      objc_msgSend(v8, "setValue:forKey:", &__kCFBooleanFalse, CFSTR("inputDither"));
      objc_msgSend(v8, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("inputNormalizeEdges"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_blurRadius));
      objc_msgSend(v8, "setValue:forKey:", v12, CFSTR("inputRadius"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CAGradientLayer layer](CAGradientLayer, "layer"));
      v28[0] = -[UIColor CGColor](self->_startColor, "CGColor");
      v28[1] = -[UIColor CGColor](self->_endColor, "CGColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
      objc_msgSend(v13, "setColors:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startPosition));
      v27[0] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_endPosition));
      v27[1] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
      objc_msgSend(v13, "setLocations:", v17);

      objc_msgSend(v4, "bounds");
      objc_msgSend(v13, "setFrame:");
      objc_msgSend(v4, "setAllowsHitTesting:", 0);
      v26 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
      objc_msgSend(v4, "setFilters:", v18);

      objc_msgSend(v4, "setMasksToBounds:", 1);
      objc_msgSend(v4, "setMask:", v13);

    }
    else
    {
      v8 = v4;
      startColor = self->_startColor;
      if (startColor && self->_endColor)
      {
        v25[0] = -[UIColor CGColor](startColor, "CGColor");
        v25[1] = -[UIColor CGColor](self->_endColor, "CGColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
        objc_msgSend(v8, "setColors:", v20);

      }
      if (self->_direction == 1)
      {
        v21 = 0.5;
        objc_msgSend(v8, "setStartPoint:", self->_startPosition, 0.5);
        endPosition = self->_endPosition;
      }
      else
      {
        endPosition = 0.5;
        objc_msgSend(v8, "setStartPoint:", 0.5, self->_startPosition);
        v21 = self->_endPosition;
      }
      objc_msgSend(v8, "setEndPoint:", endPosition, v21);
      v23 = &kCACornerCurveContinuous;
      if (!self->_continuousCorners)
        v23 = &kCACornerCurveCircular;
      objc_msgSend(v8, "setCornerCurve:", *v23);
      objc_msgSend(v8, "setCornerRadius:", self->_cornerRadius);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIGradientStyler compositingFilter](self, "compositingFilter"));
      objc_msgSend(v8, "setCompositingFilter:", v24);

    }
  }

}

- (void)applyStylingToView:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "layer"));
  -[_TUIGradientStyler applyStylingToLayer:](self, "applyStylingToLayer:", v4);

}

- (CAFilter)compositingFilter
{
  void *v2;

  if (self->_blendMode)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:"));
  else
    v2 = 0;
  return (CAFilter *)v2;
}

- (CGImage)maskImageWithStartPoint:(double)a3 endPoint:(double)a4 offset:(double)a5 startColor:(id)a6 endColor:(id)a7 direction:(unint64_t)a8 containerBounds:(CGRect)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  CGImage *v25;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  double v39;
  double v40;

  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  v18 = a6;
  v19 = a7;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
  objc_msgSend(v20, "setPreferredRange:", 2);
  v21 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithBounds:format:", v20, x, y, width, height);
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_835F0;
  v30 = &unk_2401C0;
  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  v31 = v18;
  v32 = v19;
  v37 = a5;
  v38 = a8;
  v39 = a3;
  v40 = a4;
  v22 = v19;
  v23 = v18;
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "imageWithActions:", &v27)));
  v25 = (CGImage *)objc_msgSend(v24, "CGImage", v27, v28, v29, v30);

  return v25;
}

- (NSString)blendMode
{
  return self->_blendMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendMode, 0);
  objc_storeStrong((id *)&self->_endColor, 0);
  objc_storeStrong((id *)&self->_startColor, 0);
}

@end
