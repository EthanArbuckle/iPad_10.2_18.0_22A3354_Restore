@implementation THWReviewDraggablePlacardRep

- (void)dealloc
{
  CGPath *cachedPath;
  objc_super v4;

  cachedPath = self->_cachedPath;
  if (cachedPath)
  {
    CFRelease(cachedPath);
    self->_cachedPath = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THWReviewDraggablePlacardRep;
  -[THWReviewDraggablePlacardRep dealloc](&v4, "dealloc");
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)updateLayerBoundsAndWPPosition
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  CGRect v14;
  CGRect v15;

  v3 = -[THWReviewDraggablePlacardRep interactiveCanvasController](self, "interactiveCanvasController");
  v4 = objc_msgSend(v3, "layerForRep:", self);
  v5 = TSDRectWithSize(-[THWReviewDraggablePlacardRep layerFrameInScaledCanvasRelativeToParent](self, "layerFrameInScaledCanvasRelativeToParent"));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "bounds");
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  if (!CGRectEqualToRect(v14, v15))
    objc_msgSend(v4, "setBounds:", v5, v7, v9, v11);
  v12 = objc_msgSend(-[THWReviewDraggablePlacardRep layout](self, "layout"), "contentTextLayout");
  if (v12)
  {
    v13 = objc_msgSend(v3, "layerForRep:", objc_msgSend(v3, "repForLayout:", v12));
    objc_msgSend(v13, "position");
    objc_msgSend(v13, "setPosition:", v9 * 0.5);
  }
}

- (id)contentTextRep
{
  id result;
  id v4;
  uint64_t v5;

  result = objc_msgSend(-[THWReviewDraggablePlacardRep layout](self, "layout"), "contentTextLayout");
  if (result)
  {
    v4 = result;
    v5 = objc_opt_class(TSWPRep);
    TSUDynamicCast(v5, objc_msgSend(-[THWReviewDraggablePlacardRep interactiveCanvasController](self, "interactiveCanvasController"), "repForLayout:", v4));
  }
  return result;
}

- (void)p_updateLayers
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGImage *v12;
  CGImage *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CALayer *imageLayer;
  CALayer *v24;
  double v25;
  CGPath *v26;
  unsigned int v27;
  __n128 v28;
  double v29;
  float64x2_t v30;
  double v31;
  double v32;
  CGAffineTransform v33;
  CGPoint v34;
  CGAffineTransform v35;
  CGAffineTransform v36;

  v3 = -[THWReviewDraggablePlacardRep layout](self, "layout");
  v4 = TSDRectWithSize(objc_msgSend(objc_msgSend(v3, "geometry"), "size"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(-[THWReviewDraggablePlacardRep canvas](self, "canvas"), "viewScale");
  memset(&v36, 0, sizeof(v36));
  CGAffineTransformMakeScale(&v36, v11, v11);
  v12 = (CGImage *)objc_msgSend(objc_msgSend(v3, "contentImage"), "CGImage");
  if (v12)
  {
    v13 = v12;
    v14 = TSDRectWithSize(v12);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = TSDCenterOfRect(v4, v6, v8, v10);
    v30 = vaddq_f64(*(float64x2_t *)&v36.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v36.c, v22), *(float64x2_t *)&v36.a, v21));
    imageLayer = self->_imageLayer;
    if (!imageLayer)
    {
      v24 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
      self->_imageLayer = v24;
      -[CALayer setContentsGravity:](v24, "setContentsGravity:", kCAGravityResizeAspect);
      -[CALayer setCornerRadius:](self->_imageLayer, "setCornerRadius:", 2.0);
      -[CALayer setBorderWidth:](self->_imageLayer, "setBorderWidth:", 1.0);
      -[CALayer setBorderColor:](self->_imageLayer, "setBorderColor:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.3), "CGColor"));
      -[CALayer setDelegate:](self->_imageLayer, "setDelegate:", -[THWReviewDraggablePlacardRep interactiveCanvasController](self, "interactiveCanvasController"));
      imageLayer = self->_imageLayer;
    }
    -[CALayer setBounds:](imageLayer, "setBounds:", v14, v16, v18, v20, *(_OWORD *)&v30);
    -[CALayer setPosition:](self->_imageLayer, "setPosition:", v31, v32);
    v35 = v36;
    -[CALayer setAffineTransform:](self->_imageLayer, "setAffineTransform:", &v35);
    if (v13 != self->_currentImageContents)
    {
      -[CALayer setContents:](self->_imageLayer, "setContents:", v13);
      self->_currentImageContents = v13;
    }
  }
  else
  {

    self->_imageLayer = 0;
    self->_currentImageContents = 0;
  }
  if (!self->_calloutLayer)
  {
    self->_calloutLayer = (CAShapeLayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionShapeLayer);
    -[CAShapeLayer setBackgroundColor:](self->_calloutLayer, "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
    -[CAShapeLayer setFillColor:](self->_calloutLayer, "setFillColor:", objc_msgSend(+[TSUColor whiteColor](TSUColor, "whiteColor"), "CGColor"));
    -[CAShapeLayer setLineWidth:](self->_calloutLayer, "setLineWidth:", 1.0);
    -[CAShapeLayer setStrokeColor:](self->_calloutLayer, "setStrokeColor:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.1), "CGColor"));
    -[CAShapeLayer setShadowColor:](self->_calloutLayer, "setShadowColor:", objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor"));
    LODWORD(v25) = 0.25;
    -[CAShapeLayer setShadowOpacity:](self->_calloutLayer, "setShadowOpacity:", v25);
    -[CAShapeLayer setDelegate:](self->_calloutLayer, "setDelegate:", -[THWReviewDraggablePlacardRep interactiveCanvasController](self, "interactiveCanvasController"));
  }
  v26 = -[THWReviewDraggablePlacardRep p_cachedPathForSize:arrowDirection:](self, "p_cachedPathForSize:arrowDirection:", -[THWReviewDraggablePlacardRep arrowDirection](self, "arrowDirection"), v8, v10);
  if (!CGPathEqualToPath(v26, -[CAShapeLayer path](self->_calloutLayer, "path")))
    -[CAShapeLayer setPath:](self->_calloutLayer, "setPath:", v26);
  if (!self->_shadowValid)
  {
    v27 = -[THWReviewDraggablePlacardRep isPressed](self, "isPressed");
    v28.n128_u64[0] = 2.0;
    if (v27)
    {
      v28.n128_f64[0] = 3.0;
      v29 = 7.0;
    }
    else
    {
      v29 = 3.0;
    }
    v34 = CGPointZero;
    TSDOriginRotate(&v34, v28, 1.57079633);
    -[CAShapeLayer setShadowOffset:](self->_calloutLayer, "setShadowOffset:", v34);
    -[CAShapeLayer setShadowRadius:](self->_calloutLayer, "setShadowRadius:", v29);
    self->_shadowValid = 1;
  }
  v33 = v36;
  -[CAShapeLayer setAffineTransform:](self->_calloutLayer, "setAffineTransform:", &v33);
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWReviewDraggablePlacardRep;
  -[THWReviewDraggablePlacardRep addAdditionalChildLayersToArray:](&v5, "addAdditionalChildLayersToArray:");
  -[THWReviewDraggablePlacardRep p_updateLayers](self, "p_updateLayers");
  if (self->_imageLayer)
    objc_msgSend(a3, "addObject:");
}

- (void)addAdditionalChildBackgroundLayersToArray:(id)a3
{
  -[THWReviewDraggablePlacardRep p_updateLayers](self, "p_updateLayers");
  if (self->_calloutLayer)
    objc_msgSend(a3, "addObject:");
}

- (BOOL)allowSublayerUpdatesWhenPaused
{
  return 1;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v5;
  id v6;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSWPImmediatePress)
    return objc_msgSend(-[THWReviewDraggablePlacardRep p_dragHosting](self, "p_dragHosting"), "reviewDragAllowDraggingForRep:", self);
  v6 = objc_msgSend(a3, "gestureKind");
  if (v6 == (id)TSWPTapAndTouch)
    return objc_msgSend(-[THWReviewDraggablePlacardRep p_dragHosting](self, "p_dragHosting"), "reviewDragAllowDraggingForRep:", self);
  else
    return 0;
}

- (BOOL)handleGesture:(id)a3
{
  id v5;
  id v6;
  unsigned int v8;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 != (id)TSWPImmediatePress)
  {
    v6 = objc_msgSend(a3, "gestureKind");
    return v6 == (id)TSWPTapAndTouch;
  }
  v8 = objc_msgSend(a3, "gestureState");
  if (v8 - 2 < 4)
  {
    objc_msgSend(-[THWReviewDraggablePlacardRep p_dragHosting](self, "p_dragHosting"), "reviewDragHandleForRep:withGesture:", self, a3);
    return 1;
  }
  if (v8 == 1)
  {
    objc_msgSend(-[THWReviewDraggablePlacardRep p_dragHosting](self, "p_dragHosting"), "reviewDragWillBeginForRep:withGesture:", self, a3);
    return 1;
  }
  return 0;
}

- (void)setArrowDirection:(int)a3
{
  if (self->_arrowDirection != a3)
  {
    self->_arrowDirection = a3;
    objc_msgSend(-[THWReviewDraggablePlacardRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    self->_shadowValid = 0;
    objc_msgSend(-[THWReviewDraggablePlacardRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (id)calloutPathAnimationWithduration:(double)a3
{
  int prevArrowDirection;
  int arrowDirection;
  BOOL v5;
  CAKeyframeAnimation *v9;
  uint64_t v10;
  double v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  double v17;
  NSNumber *v18;
  double v19;
  NSNumber *v20;
  double v21;
  NSNumber *v22;
  double v23;

  prevArrowDirection = self->_prevArrowDirection;
  arrowDirection = self->_arrowDirection;
  if (arrowDirection)
    v5 = prevArrowDirection == 0;
  else
    v5 = 1;
  if (v5 || prevArrowDirection == arrowDirection)
    return 0;
  v9 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("path"));
  v10 = objc_opt_class(CAShapeLayer);
  *(_QWORD *)&v11 = TSUDynamicCast(v10, -[CAShapeLayer presentationLayer](self->_calloutLayer, "presentationLayer")).n128_u64[0];
  v13 = objc_msgSend(v12, "valueForKeyPath:", CFSTR("path"), v11);
  v14 = self->_arrowDirection;
  TSDMixSizes(self->_prevPathSize.width, self->_prevPathSize.height, self->_cachedPathSize.width, self->_cachedPathSize.height, 0.4);
  v15 = -[THWReviewDraggablePlacardRep p_pathWithDirection:size:includeWedge:](self, "p_pathWithDirection:size:includeWedge:", v14, 0);
  v16 = self->_arrowDirection;
  TSDMixSizes(self->_prevPathSize.width, self->_prevPathSize.height, self->_cachedPathSize.width, self->_cachedPathSize.height, 0.6);
  -[CAKeyframeAnimation setValues:](v9, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v13, objc_msgSend(v15, "CGPath"), objc_msgSend(-[THWReviewDraggablePlacardRep p_pathWithDirection:size:includeWedge:](self, "p_pathWithDirection:size:includeWedge:", v16, 0), "CGPath"), self->_cachedPath, 0));
  -[CAKeyframeAnimation setTimingFunctions:](v9, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), 0));
  LODWORD(v17) = 0;
  v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17);
  LODWORD(v19) = 1053609165;
  v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19);
  LODWORD(v21) = 1058642330;
  v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21);
  LODWORD(v23) = 1.0;
  -[CAKeyframeAnimation setKeyTimes:](v9, "setKeyTimes:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v18, v20, v22, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23), 0));
  -[CAKeyframeAnimation setDuration:](v9, "setDuration:", a3);
  -[CAKeyframeAnimation setFillMode:](v9, "setFillMode:", kCAFillModeBoth);
  return v9;
}

- (CGPath)p_cachedPathForSize:(CGSize)a3 arrowDirection:(int)a4
{
  uint64_t v4;
  double height;
  double width;
  CGPath *result;
  BOOL v9;
  CGPath *cachedPath;

  v4 = *(_QWORD *)&a4;
  height = a3.height;
  width = a3.width;
  result = self->_cachedPath;
  if (!result
    || (a3.width == self->_cachedPathSize.width ? (v9 = a3.height == self->_cachedPathSize.height) : (v9 = 0),
        !v9 || self->_cachedPathArrowDirection != a4))
  {
    self->_prevArrowDirection = self->_cachedPathArrowDirection;
    self->_prevPathSize = self->_cachedPathSize;
    cachedPath = self->_cachedPath;
    if (cachedPath)
    {
      CFRelease(cachedPath);
      self->_cachedPath = 0;
    }
    self->_cachedPathSize.width = width;
    self->_cachedPathSize.height = height;
    self->_cachedPathArrowDirection = v4;
    result = CGPathRetain((CGPathRef)objc_msgSend(-[THWReviewDraggablePlacardRep p_pathWithDirection:size:includeWedge:](self, "p_pathWithDirection:size:includeWedge:", v4, 1, width, height), "CGPath"));
    self->_cachedPath = result;
  }
  return result;
}

- (id)p_pathWithDirection:(int)a3 size:(CGSize)a4 includeWedge:(BOOL)a5
{
  double height;
  double width;
  double v8;
  double v9;
  CGPath *Mutable;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  TSDBezierPath *v20;
  double v22;
  double v23;
  double v24;
  double y;
  double cp1y;
  double x;
  double cp1x;
  double v29;
  double v30;
  double v31;
  CGAffineTransform m;

  height = a4.height;
  width = a4.width;
  memset(&m.c, 0, 32);
  if (a3 != 0 && a5)
    v8 = 13.0;
  else
    v8 = 0.0;
  v9 = 0.0;
  *(_OWORD *)&m.a = 0uLL;
  CGAffineTransformMakeTranslation(&m, 0.5, 0.5);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, &m, 3.5, 0.0);
  v22 = v8;
  v31 = -v8;
  if (a3 == 1)
    v9 = -v8;
  v30 = (width + -30.0) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, v30, 0.0);
  cp1x = width * 0.5 + -5.0;
  x = width * 0.5;
  CGPathAddCurveToPoint(Mutable, &m, v30 + 7.0, 0.0, cp1x, v9, width * 0.5, v9);
  v23 = (width + 30.0) * 0.5 + -7.0;
  v24 = width * 0.5 + 5.0;
  v11 = (width + 30.0) * 0.5;
  CGPathAddCurveToPoint(Mutable, &m, v24, v9, v23, 0.0, v11, 0.0);
  CGPathAddLineToPoint(Mutable, &m, width + -3.5, 0.0);
  CGPathAddArcToPoint(Mutable, &m, width, 0.0, width, 3.5, 3.5);
  v12 = 0.0;
  if (a3 == 2)
    v12 = v8;
  v13 = width + v12;
  v29 = (height + -30.0) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, width, v29);
  y = height * 0.5;
  cp1y = height * 0.5 + -5.0;
  CGPathAddCurveToPoint(Mutable, &m, width, v29 + 7.0, v13, cp1y, v13, height * 0.5);
  v14 = height * 0.5 + 5.0;
  v15 = (height + 30.0) * 0.5 + -7.0;
  v16 = (height + 30.0) * 0.5;
  CGPathAddCurveToPoint(Mutable, &m, v13, v14, width, v15, width, v16);
  CGPathAddLineToPoint(Mutable, &m, width, height + -3.5);
  CGPathAddArcToPoint(Mutable, &m, width, height, width + -3.5, height, 3.5);
  v17 = v22;
  if (a3 != 3)
    v17 = 0.0;
  v18 = height + v17;
  CGPathAddLineToPoint(Mutable, &m, v11, height);
  CGPathAddCurveToPoint(Mutable, &m, v23, height, v24, v18, x, v18);
  CGPathAddCurveToPoint(Mutable, &m, cp1x, v18, v30 + 7.0, height, v30, height);
  CGPathAddLineToPoint(Mutable, &m, 3.5, height);
  CGPathAddArcToPoint(Mutable, &m, 0.0, height, 0.0, height + -3.5, 3.5);
  if (a3 == 4)
    v19 = v31;
  else
    v19 = 0.0;
  CGPathAddLineToPoint(Mutable, &m, 0.0, v16);
  CGPathAddCurveToPoint(Mutable, &m, 0.0, v15, v19, v14, v19, y);
  CGPathAddCurveToPoint(Mutable, &m, v19, cp1y, 0.0, v29 + 7.0, 0.0, v29);
  CGPathAddLineToPoint(Mutable, &m, 0.0, 3.5);
  CGPathAddArcToPoint(Mutable, &m, 0.0, 0.0, 3.5, 0.0, 3.5);
  CGPathCloseSubpath(Mutable);
  v20 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", Mutable);
  CGPathRelease(Mutable);
  return v20;
}

- (id)p_dragHosting
{
  return objc_msgSend(-[THWReviewDraggablePlacardRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWReviewDragHosting);
}

- (int)arrowDirection
{
  return self->_arrowDirection;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (CAShapeLayer)calloutLayer
{
  return self->_calloutLayer;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (CGImage)currentImageContents
{
  return self->_currentImageContents;
}

- (BOOL)shadowValid
{
  return self->_shadowValid;
}

@end
