@implementation THGuidedPanRectWell

- (THGuidedPanRectWell)initWithUnscaledRect:(CGRect)a3 wellRect:(CGRect)a4 target:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  THGuidedPanRectWell *v14;
  THGuidedPanRectWell *v15;
  CGFloat v16;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)THGuidedPanRectWell;
  v14 = -[THGuidedPanRectWell init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    v14->_unscaledRect.origin.x = v13;
    v14->_unscaledRect.origin.y = v12;
    v14->_unscaledRect.size.width = v11;
    v14->_unscaledRect.size.height = v10;
    v14->_wellRect.origin.x = x;
    v14->_wellRect.origin.y = y;
    v14->_wellRect.size.width = width;
    v14->_wellRect.size.height = height;
    v14->_target = (THGuidedPanTarget *)a5;
    v15->_focalPoint.x = TSDCenterOfRect(v15->_wellRect.origin.x, v15->_wellRect.origin.y, v15->_wellRect.size.width, v15->_wellRect.size.height);
    v15->_focalPoint.y = v16;
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THGuidedPanRectWell;
  -[THGuidedPanRectWell dealloc](&v3, "dealloc");
}

- (void)guidedPanWillBeginAtPoint:(CGPoint)a3 controller:(id)a4
{
  double v6;
  double MidX;
  double MinY;
  id v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double MaxY;
  id v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;

  objc_msgSend(a4, "viewScaleForUnscaledRect:forPage:", -[THGuidedPanTarget guidedPanTargetKind](self->_target, "guidedPanTargetKind", a3.x, a3.y) == 0, self->_unscaledRect.origin.x, self->_unscaledRect.origin.y, self->_unscaledRect.size.width, self->_unscaledRect.size.height);
  self->_wellViewScale = v6;
  MidX = CGRectGetMidX(self->_unscaledRect);
  MinY = CGRectGetMinY(self->_unscaledRect);
  v9 = objc_msgSend(a4, "interactiveCanvasController");
  objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "screenTopContentPlacement");
  objc_msgSend(v9, "clampedCenterPointForPoint:withPlacement:viewScale:", MidX, MinY, v10, v11, self->_wellViewScale);
  self->_minCenterPoint.x = v12;
  self->_minCenterPoint.y = v13;
  v14 = CGRectGetMidX(self->_unscaledRect);
  MaxY = CGRectGetMaxY(self->_unscaledRect);
  v16 = objc_msgSend(a4, "interactiveCanvasController");
  objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "screenBottomContentPlacement");
  objc_msgSend(v16, "clampedCenterPointForPoint:withPlacement:viewScale:", v14, MaxY, v17, v18, self->_wellViewScale);
  self->_maxCenterPoint.x = v19;
  self->_maxCenterPoint.y = v20;
  if (v20 < self->_minCenterPoint.y)
    self->_maxCenterPoint = self->_minCenterPoint;
}

- (CGPoint)unconsumedMovementWithMovement:(CGPoint)a3 controller:(id)a4
{
  CGFloat y;
  CGFloat x;
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
  double v19;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (self->_allowVerticalMovementInWell)
  {
    objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", a3.x, a3.y);
    v9 = v8;
    v11 = v10;
    objc_msgSend(a4, "unscaledCenterPoint");
    v13 = v12 - v11;
    v14 = self->_minCenterPoint.y;
    if (v13 < v14 || (v14 = self->_maxCenterPoint.y, v15 = 0.0, v13 > v14))
      v15 = v14 - v13;
    objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "convertUnscaledToBoundsPoint:", v9, v15);
    x = v16;
    y = v17;
  }
  v18 = x;
  v19 = y;
  result.y = v19;
  result.x = v18;
  return result;
}

- (id)p_contentLocationWithMovement:(CGPoint)a3 snapToBounds:(BOOL)a4 overscrolled:(BOOL *)a5 controller:(id)a6
{
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double x;
  double v14;
  double v15;
  double y;
  double v17;
  BOOL v18;
  id result;

  if (self->_allowVerticalMovementInWell)
  {
    v9 = a4;
    objc_msgSend(objc_msgSend(a6, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", a3.x, a3.y);
    v11 = v10;
    objc_msgSend(a6, "unscaledCenterPoint");
    x = v12;
    v15 = v14 - v11;
    y = self->_minCenterPoint.y;
    if (v9)
    {
      v15 = TSUClamp(v15, self->_minCenterPoint.y, self->_maxCenterPoint.y);
    }
    else if (v15 < y || (y = self->_maxCenterPoint.y, v15 > y))
    {
      v15 = v15 + (y - v15) * -0.5;
      v18 = 1;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  x = self->_focalPoint.x;
  v17 = self->_focalPoint.y;
  v15 = self->_minCenterPoint.y;
  if (v17 < v15)
  {
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  v15 = self->_maxCenterPoint.y;
  if (v17 <= v15)
    v15 = self->_focalPoint.y;
  v18 = 0;
LABEL_12:
  result = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", x, v15, self->_wellViewScale);
  if (a5)
    *a5 = v18;
  return result;
}

- (CGPoint)p_distanceFromWellRect:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double MinX;
  _BOOL4 v9;
  _BOOL4 v10;
  double MinY;
  _BOOL4 v12;
  double MaxY;
  double MaxX;
  double v15;
  _BOOL4 v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat width;
  CGFloat height;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  __n128 v27;
  __n128 v28;
  double v29;
  double v30;
  double v31;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = CGPointZero.x;
  v7 = CGPointZero.y;
  if (CGRectContainsPoint(self->_wellRect, a3))
    goto LABEL_29;
  MinX = CGRectGetMinX(self->_wellRect);
  if (x > MinX)
  {
    v10 = x >= CGRectGetMaxX(self->_wellRect);
    v9 = v10;
  }
  else
  {
    v9 = 0;
    v10 = 1;
  }
  MinY = CGRectGetMinY(self->_wellRect);
  if (y > MinY)
  {
    MaxY = CGRectGetMaxY(self->_wellRect);
    v12 = y >= MaxY;
    if (x > MinX || y >= MaxY)
    {
      if (!v9 || y >= MaxY)
      {
        v16 = x <= MinX;
        if (y < MaxY)
          v16 = 1;
        if (v16 || v9)
          goto LABEL_19;
        v15 = CGRectGetMaxY(self->_wellRect);
LABEL_28:
        v7 = y - v15;
        v6 = 0.0;
        goto LABEL_29;
      }
      MaxX = CGRectGetMaxX(self->_wellRect);
    }
    else
    {
      MaxX = CGRectGetMinX(self->_wellRect);
    }
    v6 = x - MaxX;
    v7 = 0.0;
    goto LABEL_29;
  }
  if (!v10)
  {
    v15 = CGRectGetMinY(self->_wellRect);
    goto LABEL_28;
  }
  v12 = 1;
LABEL_19:
  if (v10 && v12)
  {
    v17 = self->_wellRect.origin.x;
    v18 = self->_wellRect.origin.y;
    width = self->_wellRect.size.width;
    height = self->_wellRect.size.height;
    if (x > MinX)
      v21 = CGRectGetMaxX(*(CGRect *)&v17);
    else
      v21 = CGRectGetMinX(*(CGRect *)&v17);
    v22 = v21;
    v23 = self->_wellRect.origin.x;
    v24 = self->_wellRect.origin.y;
    v25 = self->_wellRect.size.width;
    v26 = self->_wellRect.size.height;
    if (y > MinY)
      v27.n128_f64[0] = CGRectGetMaxY(*(CGRect *)&v23);
    else
      v27.n128_f64[0] = CGRectGetMinY(*(CGRect *)&v23);
    v28.n128_u64[0] = v27.n128_u64[0];
    v27.n128_f64[0] = v22;
    v6 = TSDSubtractPoints(v27, v28, x, y);
    v7 = v29;
  }
LABEL_29:
  v30 = v6;
  v31 = v7;
  result.y = v31;
  result.x = v30;
  return result;
}

- (double)weightWithMovement:(CGPoint)a3 proposedLocation:(id)a4 controller:(id)a5
{
  void (**weightBlock)(id);
  double result;

  weightBlock = (void (**)(id))self->_weightBlock;
  if (!weightBlock)
    return 0.0;
  objc_msgSend(a4, "unscaledPoint");
  -[THGuidedPanRectWell p_distanceFromWellRect:](self, "p_distanceFromWellRect:");
  weightBlock[2](weightBlock);
  return result;
}

- (id)contentLocationWithMovement:(CGPoint)a3 controller:(id)a4
{
  return -[THGuidedPanRectWell p_contentLocationWithMovement:snapToBounds:overscrolled:controller:](self, "p_contentLocationWithMovement:snapToBounds:overscrolled:controller:", 0, 0, a4, a3.x, a3.y);
}

- (id)contentAnimationToFocalPointFromLocation:(id)a3 withMovement:(CGPoint)a4 velocity:(CGPoint)a5 controller:(id)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v13;
  void *v14;
  id v15;
  double currentBlendedWeight;
  double previousBlendedWeight;
  id v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float v38;
  double v39;
  double v40;
  double v41;
  NSNumber *v42;
  double v43;
  id v44;
  double v45;
  NSNumber *v46;
  double v47;
  NSNumber *v48;
  double v49;
  NSArray *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  id v60;
  double v61;
  NSNumber *v62;
  double v63;
  NSNumber *v64;
  double v65;
  NSNumber *v66;
  double v67;
  uint64_t v69;
  char v70;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v70 = 0;
  -[THGuidedPanRectWell p_contentLocationWithMovement:snapToBounds:overscrolled:controller:](self, "p_contentLocationWithMovement:snapToBounds:overscrolled:controller:", 0, &v70, a6);
  v13 = -[THGuidedPanRectWell p_contentLocationWithMovement:snapToBounds:overscrolled:controller:](self, "p_contentLocationWithMovement:snapToBounds:overscrolled:controller:", 1, 0, a6, v10, v9);
  v14 = v13;
  if (!self->_allowVerticalMovementInWell)
  {
    if (TSDPointLength(v13, x, y) <= 300.0)
    {
      v44 = +[TSDContentLocation contentLocationInterpolatingFromLocation:toLocation:fraction:](TSDContentLocation, "contentLocationInterpolatingFromLocation:toLocation:fraction:", a3, v14, 1.04999995);
      v15 = +[TSDContentPathAnimation animation](TSDContentPathAnimation, "animation");
      objc_msgSend(v15, "setContentLocations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, v44, v14, 0));
      objc_msgSend(v15, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
      LODWORD(v45) = 0;
      v46 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v45);
      LODWORD(v47) = 1061997773;
      v48 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v47);
      LODWORD(v49) = 1.0;
      v50 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v46, v48, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v49), 0, v69);
    }
    else
    {
      currentBlendedWeight = self->_currentBlendedWeight;
      previousBlendedWeight = self->_previousBlendedWeight;
      v18 = +[TSDContentLocation contentLocation](TSDContentLocation, "contentLocation");
      if (currentBlendedWeight <= 0.5 || currentBlendedWeight <= previousBlendedWeight)
      {
        objc_msgSend(objc_msgSend(a6, "delegate"), "guidedPanFillScreenViewScale");
        v21 = v20;
        objc_msgSend(objc_msgSend(a6, "delegate"), "guidedPanZoomedOutViewScale");
        v23 = v22;
        objc_msgSend(a3, "unscaledPoint");
        v25 = v24;
        v27 = v26;
        v28 = objc_msgSend(v14, "unscaledPoint");
        TSDInterpolatePoints(v28, v25, v27, v29, v30, 0.5);
        objc_msgSend(v18, "setUnscaledPoint:");
        v31 = objc_msgSend(a3, "viewScale");
        v59 = TSDInterpolateFloats(v31, v32, v21, 0.1);
        objc_msgSend(a3, "viewScale");
        if (v33 < v21)
        {
          objc_msgSend(v14, "viewScale");
          if (v34 < v21)
          {
            objc_msgSend(a3, "viewScale");
            v59 = v35;
          }
        }
        objc_msgSend(objc_msgSend(a6, "target"), "viewScaleWithController:", a6);
        if (vabdd_f64(v36, v23) >= 0.00999999978)
        {
          objc_msgSend(a3, "viewScale");
          v38 = v37;
          objc_msgSend(v14, "viewScale");
          *(float *)&v39 = v39;
          objc_msgSend(v18, "setViewScale:", fmax(v23, fmin(v59, fminf(v38, *(float *)&v39) * 0.95)));
        }
      }
      else
      {
        objc_msgSend(a3, "unscaledPoint");
        v52 = v51;
        v54 = v53;
        v55 = objc_msgSend(v14, "unscaledPoint");
        TSDInterpolatePoints(v55, v52, v54, v56, v57, 0.25);
        objc_msgSend(v18, "setUnscaledPoint:");
        objc_msgSend(a3, "viewScale");
        v59 = v58;
      }
      objc_msgSend(v18, "setViewScale:", v59);
      v60 = +[TSDContentLocation contentLocationInterpolatingFromLocation:toLocation:fraction:](TSDContentLocation, "contentLocationInterpolatingFromLocation:toLocation:fraction:", v18, v14, 1.04999995);
      v15 = +[TSDContentPathAnimation animation](TSDContentPathAnimation, "animation");
      objc_msgSend(v15, "setContentLocations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, v18, v60, v14, 0));
      objc_msgSend(v15, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
      LODWORD(v61) = 0;
      v62 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v61);
      LODWORD(v63) = 1050253722;
      v64 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v63);
      LODWORD(v65) = 1058642330;
      v66 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v65);
      LODWORD(v67) = 1.0;
      v50 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v62, v64, v66, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v67), 0);
    }
    objc_msgSend(v15, "setKeyTimes:", v50);
    goto LABEL_23;
  }
  if (v70 || y == 0.0)
  {
    if (!v70)
    {
      objc_msgSend(a3, "viewScale");
      if (vabdd_f64(v40, self->_wellViewScale) < 0.00999999978)
        return 0;
    }
    v15 = +[TSDContentPathAnimation animation](TSDContentPathAnimation, "animation");
    objc_msgSend(v15, "setContentLocations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, v14, 0));
    LODWORD(v41) = 0;
    v42 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v41);
    LODWORD(v43) = 1.0;
    objc_msgSend(v15, "setKeyTimes:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v42, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v43), 0));
    objc_msgSend(v15, "setTimingFunctions:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut)));
LABEL_23:
    objc_msgSend(v15, "setDuration:", 0.300000012);
    return v15;
  }
  return -[THGuidedPanColumnAnimator animation](-[THGuidedPanColumnAnimator initWithLocation:velocity:min:max:targetViewScale:controller:]([THGuidedPanColumnAnimator alloc], "initWithLocation:velocity:min:max:targetViewScale:controller:", a3, a6, x, y, self->_minCenterPoint.x, self->_minCenterPoint.y, self->_maxCenterPoint.x, self->_maxCenterPoint.y, self->_wellViewScale), "animation");
}

- (int)guidedPanWellRatingWithMovement:(CGPoint)a3 velocity:(CGPoint)a4 controller:(id)a5
{
  uint64_t (**ratingBlock)(__n128, __n128, __n128, __n128);

  ratingBlock = (uint64_t (**)(__n128, __n128, __n128, __n128))self->_ratingBlock;
  if (ratingBlock)
    LODWORD(ratingBlock) = ratingBlock[2]((__n128)a3, *(__n128 *)&a3.y, (__n128)a4, *(__n128 *)&a4.y);
  return (int)ratingBlock;
}

- (id)guidedPanTargetWithController:(id)a3 location:(id)a4
{
  return self->_target;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p %@ %@>"), v4, self, NSStringFromCGRect(self->_wellRect), self->_identifier);
}

- (THGuidedPanTarget)target
{
  return self->_target;
}

- (CGRect)unscaledRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unscaledRect.origin.x;
  y = self->_unscaledRect.origin.y;
  width = self->_unscaledRect.size.width;
  height = self->_unscaledRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)wellRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_wellRect.origin.x;
  y = self->_wellRect.origin.y;
  width = self->_wellRect.size.width;
  height = self->_wellRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)focalPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_focalPoint.x;
  y = self->_focalPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFocalPoint:(CGPoint)a3
{
  self->_focalPoint = a3;
}

- (BOOL)allowVerticalMovementInWell
{
  return self->_allowVerticalMovementInWell;
}

- (void)setAllowVerticalMovementInWell:(BOOL)a3
{
  self->_allowVerticalMovementInWell = a3;
}

- (id)weightBlock
{
  return self->_weightBlock;
}

- (void)setWeightBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)ratingBlock
{
  return self->_ratingBlock;
}

- (void)setRatingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)smoothWeight
{
  return self->_smoothWeight;
}

- (void)setSmoothWeight:(double)a3
{
  self->_smoothWeight = a3;
}

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
}

- (double)currentBlendedWeight
{
  return self->_currentBlendedWeight;
}

- (void)setCurrentBlendedWeight:(double)a3
{
  self->_currentBlendedWeight = a3;
}

- (double)previousBlendedWeight
{
  return self->_previousBlendedWeight;
}

- (void)setPreviousBlendedWeight:(double)a3
{
  self->_previousBlendedWeight = a3;
}

- (double)wellViewScale
{
  return self->_wellViewScale;
}

- (void)setWellViewScale:(double)a3
{
  self->_wellViewScale = a3;
}

- (CGPoint)minCenterPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_minCenterPoint.x;
  y = self->_minCenterPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMinCenterPoint:(CGPoint)a3
{
  self->_minCenterPoint = a3;
}

- (CGPoint)maxCenterPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_maxCenterPoint.x;
  y = self->_maxCenterPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMaxCenterPoint:(CGPoint)a3
{
  self->_maxCenterPoint = a3;
}

@end
