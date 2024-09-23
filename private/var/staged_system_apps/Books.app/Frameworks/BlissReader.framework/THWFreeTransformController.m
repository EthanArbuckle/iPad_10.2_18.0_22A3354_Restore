@implementation THWFreeTransformController

- (CALayer)wrapperLayer
{
  CALayer *result;

  result = (CALayer *)self->mWrapperView;
  if (result)
    return (CALayer *)-[CALayer layer](result, "layer");
  return result;
}

- (CALayer)superLayerForWrapper
{
  return (CALayer *)objc_msgSend(-[THWFreeTransformControllerDelegate unmovingParentViewForFreeTransformController:](-[THWFreeTransformController delegate](self, "delegate"), "unmovingParentViewForFreeTransformController:", self), "layer");
}

+ (BOOL)isFreeTransformInProgress
{
  int v2;

  v2 = dword_543190;
  if (dword_543190 < 0)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THWFreeTransformController isFreeTransformInProgress]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m"), 117, CFSTR("FTC-in-progress counter should be nonnegative"));
    v2 = dword_543190;
  }
  return v2 > 0;
}

- (THWFreeTransformController)init
{
  THWFreeTransformController *v2;
  THWFreeTransformController *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THWFreeTransformController;
  v2 = -[THWFreeTransformController init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[THWFreeTransformController setSmoothEdges:](v2, "setSmoothEdges:", 1);
    v4 = *(_OWORD *)&CGAffineTransformIdentity.a;
    v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v3->mOriginalShadowTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v3->mOriginalShadowTransform.c = v5;
    v6 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v3->mOriginalShadowTransform.tx = v6;
    *(_OWORD *)&v3->mCurrentTransform.a = v4;
    *(_OWORD *)&v3->mCurrentTransform.c = v5;
    *(_OWORD *)&v3->mCurrentTransform.tx = v6;
  }
  return v3;
}

- (THWFreeTransformController)initWithSharedGestureRecognizer:(BOOL)a3
{
  THWFreeTransformController *result;

  result = -[THWFreeTransformController init](self, "init");
  if (result)
    result->mSharedTransformGR = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[THWFreeTransformController setWrapperView:](self, "setWrapperView:", 0);
  self->mTransformGR = 0;

  self->mTargetLayer = 0;
  -[THWFreeTransformController setShadowLayer:](self, "setShadowLayer:", 0);
  -[THWFreeTransformController setCurtainLayer:](self, "setCurtainLayer:", 0);
  -[THWFreeTransformController setGestureRecognizerDelegate:](self, "setGestureRecognizerDelegate:", 0);
  -[THWFreeTransformController setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWFreeTransformController;
  -[THWFreeTransformController dealloc](&v3, "dealloc");
}

- (void)cancelTransform
{
  if (-[THWFreeTransformController isFreeTransformInProgress](self, "isFreeTransformInProgress"))
    -[THWFreeTransformGestureRecognizer cancel](self->mTransformGR, "cancel");
}

- (void)setTargetLayer:(id)a3
{
  if (-[THWFreeTransformController targetLayer](self, "targetLayer") != a3)
  {

    self->mTargetLayer = (CALayer *)a3;
  }
}

- (CALayer)freeTransformLayer
{
  CALayer *result;

  result = -[THWFreeTransformController wrapperLayer](self, "wrapperLayer");
  if (!result)
    return self->mTargetLayer;
  return result;
}

- (void)p_cleanupExtraLayers
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  CALayer *v6;
  __int128 v7;
  _OWORD v8[3];

  if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:") & 1) == 0|| -[THWFreeTransformControllerDelegate freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:", self))
  {
    v4 = objc_opt_class(UIView, v3);
    v5 = (void *)TSUDynamicCast(v4, -[CALayer delegate](-[THWFreeTransformController freeTransformLayer](self, "freeTransformLayer"), "delegate"));
    objc_msgSend(objc_msgSend(v5, "window"), "moveViewBackBelowStatusBar:preserveCurrentFrame:", v5, 0);
  }
  if (-[THWFreeTransformController wrapperLayer](self, "wrapperLayer"))
  {
    if (self->mTransformScale != 0.0)
    {
      v6 = -[THWFreeTransformController targetLayer](self, "targetLayer");
      v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v8[1] = v7;
      v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      -[CALayer setAffineTransform:](v6, "setAffineTransform:", v8);
    }
    -[TSULayerSaveRestore restoreLayer:](-[THWFreeTransformController layerSaveRestore](self, "layerSaveRestore"), "restoreLayer:", -[THWFreeTransformController targetLayer](self, "targetLayer"));
    -[CALayer removeFromSuperlayer](-[THWFreeTransformController wrapperLayer](self, "wrapperLayer"), "removeFromSuperlayer");
    -[THWFreeTransformController setWrapperView:](self, "setWrapperView:", 0);
  }
  else
  {
    -[TSULayerSaveRestore restoreLayer:](-[THWFreeTransformController layerSaveRestore](self, "layerSaveRestore"), "restoreLayer:", -[THWFreeTransformController targetLayer](self, "targetLayer"));
  }
  -[CALayer removeFromSuperlayer](-[THWFreeTransformController shadowLayer](self, "shadowLayer"), "removeFromSuperlayer");
  -[THWFreeTransformController setShadowLayer:](self, "setShadowLayer:", 0);
  -[CALayer removeFromSuperlayer](-[THWFreeTransformController curtainLayer](self, "curtainLayer"), "removeFromSuperlayer");
  -[THWFreeTransformController setCurtainLayer:](self, "setCurtainLayer:", 0);
}

- (void)p_setupCurtain
{
  id v3;
  double v4;
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (!-[THWFreeTransformController curtainLayer](self, "curtainLayer"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController p_setupCurtain]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m"), 221, CFSTR("invalid nil value for '%s'"), "self.curtainLayer");
  v3 = -[THWFreeTransformControllerDelegate curtainColorForFreeTransformController:](-[THWFreeTransformController delegate](self, "delegate"), "curtainColorForFreeTransformController:", self);
  if (!v3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController p_setupCurtain]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m"), 224, CFSTR("invalid nil value for '%s'"), "curtainColor");
  -[THWFreeTransformControllerDelegate curtainSizeForFreeTransformController:](-[THWFreeTransformController delegate](self, "delegate"), "curtainSizeForFreeTransformController:", self);
  if (v5 == CGSizeZero.width && v4 == CGSizeZero.height)
    -[CALayer frame](-[CALayer superlayer](-[THWFreeTransformController freeTransformLayer](self, "freeTransformLayer"), "superlayer"), "frame");
  if (-[CALayer superlayer](-[THWFreeTransformController curtainLayer](self, "curtainLayer"), "superlayer"))
  {
    -[CALayer position](-[CALayer superlayer](-[THWFreeTransformController curtainLayer](self, "curtainLayer"), "superlayer"), "position");
    v8 = TSDRectWithCenterAndSize(v7);
    -[CALayer setFrame:](-[THWFreeTransformController curtainLayer](self, "curtainLayer"), "setFrame:", v8, v9, v10, v11);
    -[CALayer setBackgroundColor:](-[THWFreeTransformController curtainLayer](self, "curtainLayer"), "setBackgroundColor:", objc_msgSend(v3, "CGColor"));
  }
}

- (BOOL)p_wantsCurtainFadeOut
{
  return -[THWFreeTransformControllerDelegate freeTransformControllerWantsCurtainFadeOut:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerWantsCurtainFadeOut:", self);
}

- (void)p_fadeOutCurtain
{
  CABasicAnimation *v3;
  double v4;
  double v5;
  _QWORD v7[5];

  if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerWillFadeOutCurtain:") & 1) != 0)-[THWFreeTransformControllerDelegate freeTransformControllerWillFadeOutCurtain:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerWillFadeOutCurtain:", self);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v3 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  if (!-[THWFreeTransformController curtainLayer](self, "curtainLayer"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController p_fadeOutCurtain]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m"), 258, CFSTR("invalid nil value for '%s'"), "self.curtainLayer");
  if (-[THWFreeTransformController curtainLayer](self, "curtainLayer"))
  {
    -[CALayer frame](-[THWFreeTransformController curtainLayer](self, "curtainLayer"), "frame");
    if (v5 == CGSizeZero.width && v4 == CGSizeZero.height)
      -[THWFreeTransformController p_setupCurtain](self, "p_setupCurtain");
  }
  -[CABasicAnimation setFromValue:](v3, "setFromValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0));
  -[CABasicAnimation setToValue:](v3, "setToValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  -[CABasicAnimation setDuration:](v3, "setDuration:", 0.25);
  -[CABasicAnimation setTimingFunction:](v3, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  -[CABasicAnimation setFillMode:](v3, "setFillMode:", kCAFillModeForwards);
  -[CABasicAnimation setRemovedOnCompletion:](v3, "setRemovedOnCompletion:", 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_65A4C;
  v7[3] = &unk_426DD0;
  v7[4] = self;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v7);
  -[CALayer addAnimation:forKey:](-[THWFreeTransformController curtainLayer](self, "curtainLayer"), "addAnimation:forKey:", v3, CFSTR("THWFreeTransformControllerCurtainFadeOutKey"));
  +[CATransaction commit](CATransaction, "commit");
  self->mStartedCurtainFadeOut = 1;
}

- (CGRect)originalTargetLayerFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  x = self->mOriginalTargetLayerFrame.origin.x;
  y = self->mOriginalTargetLayerFrame.origin.y;
  width = self->mOriginalTargetLayerFrame.size.width;
  height = self->mOriginalTargetLayerFrame.size.height;
  if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerOriginalTargetLayerFrame:") & 1) != 0)
  {
    -[THWFreeTransformControllerDelegate freeTransformControllerOriginalTargetLayerFrame:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerOriginalTargetLayerFrame:", self);
    x = v7;
    y = v8;
    width = v9;
    height = v10;
  }
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)appendShadowTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;

  v4 = *(_OWORD *)&self->mOriginalShadowTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->mOriginalShadowTransform.a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->mOriginalShadowTransform.tx;
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v5;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v14, &t1, &t2);
  v6 = *(_OWORD *)&v14.c;
  *(_OWORD *)&self->mOriginalShadowTransform.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&self->mOriginalShadowTransform.c = v6;
  *(_OWORD *)&self->mOriginalShadowTransform.tx = *(_OWORD *)&v14.tx;
  v7 = *(_OWORD *)&self->mOriginalShadowTransform.c;
  v9 = *(_OWORD *)&self->mOriginalShadowTransform.a;
  v10 = v7;
  v11 = *(_OWORD *)&self->mOriginalShadowTransform.tx;
  v8[0] = v9;
  v8[1] = v7;
  v8[2] = v11;
  -[CALayer setAffineTransform:](-[THWFreeTransformController shadowLayer](self, "shadowLayer"), "setAffineTransform:", v8);
}

- (id)p_shadowFadeInAnimation:(id *)a3
{
  double v3;
  double v4;
  CABasicAnimation *v5;
  double v6;
  double v7;

  v4 = v3;
  v5 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("shadowOpacity"));
  -[CABasicAnimation setTimingFunction:](v5, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn));
  -[CABasicAnimation setDuration:](v5, "setDuration:", 0.150000006);
  LODWORD(v6) = 0;
  -[CABasicAnimation setFromValue:](v5, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  *(float *)&v7 = v4;
  -[CABasicAnimation setToValue:](v5, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
  -[CABasicAnimation setRemovedOnCompletion:](v5, "setRemovedOnCompletion:", 0);
  return v5;
}

- (id)p_shadowFadeOutAnimation:(double)a3
{
  CABasicAnimation *v4;
  double v5;
  double v6;

  v4 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  -[CABasicAnimation setTimingFunction:](v4, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  -[CABasicAnimation setDuration:](v4, "setDuration:", 0.150000006);
  *(float *)&v5 = a3;
  -[CABasicAnimation setFromValue:](v4, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  LODWORD(v6) = 0;
  -[CABasicAnimation setToValue:](v4, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  -[CABasicAnimation setFillMode:](v4, "setFillMode:", kCAFillModeForwards);
  -[CABasicAnimation setRemovedOnCompletion:](v4, "setRemovedOnCompletion:", 0);
  return v4;
}

- (void)p_setupShadow
{
  CALayer *v3;
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  CGColor *v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  id v34;
  double v35;
  double v36;
  CGPathRef v37;
  const CGPath *v38;
  CGPath *v39;
  id v40;
  TSDBezierPath *v41;
  CGAffineTransform *p_mOriginalShadowTransform;
  __int128 v43;
  __int128 v44;
  double v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  float v50;
  id v51;
  id v52;
  void *v53;
  float v54;
  id v55;
  uint64_t v56;
  double v57;
  double v58;
  _OWORD v59[3];
  CATransform3D v60;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v63;
  CGAffineTransform transform;
  _OWORD v65[8];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CGRect v74;

  v3 = -[THWFreeTransformController targetLayer](self, "targetLayer");
  -[CALayer shadowOpacity](v3, "shadowOpacity");
  if (v4 == 0.0)
  {
    if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "shadowPropertiesForFreeTransformController:defaults:") & 1) != 0)
    {
      -[THWFreeTransformControllerDelegate shadowPropertiesForFreeTransformController:defaults:](-[THWFreeTransformController delegate](self, "delegate"), "shadowPropertiesForFreeTransformController:defaults:", self, 0.667, 0.0, 10.0, 15.0);
      v58 = v17;
      v7 = v18;
      v9 = v19;
      v12 = 0;
      v11 = 0;
      -[CALayer bounds](v3, "bounds", v20);
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v7 = 0.0;
      v9 = 10.0;
      v58 = 0.667;
      -[CALayer bounds](v3, "bounds", 15.0);
    }
  }
  else
  {
    -[CALayer shadowOpacity](v3, "shadowOpacity");
    v58 = v5;
    -[CALayer shadowOffset](v3, "shadowOffset");
    v7 = v6;
    v9 = v8;
    -[CALayer shadowRadius](v3, "shadowRadius");
    v56 = v10;
    v11 = -[CALayer shadowColor](v3, "shadowColor");
    v12 = -[CALayer shadowPath](v3, "shadowPath") != 0;
    -[CALayer bounds](v3, "bounds", v56);
  }
  v21 = v13;
  v22 = v14;
  v23 = v15;
  v24 = v16;
  if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "shadowBoundsForFreeTransformController:") & 1) != 0)
  {
    -[THWFreeTransformControllerDelegate shadowBoundsForFreeTransformController:](-[THWFreeTransformController delegate](self, "delegate"), "shadowBoundsForFreeTransformController:", self);
    v21 = v25;
    v22 = v26;
    v23 = v27;
    v24 = v28;
  }
  v29 = TSDShrinkSizeToFitInSize(v23, v24, 200.0, 200.0);
  v74.origin.x = v21;
  v74.origin.y = v22;
  v74.size.width = v23;
  v74.size.height = v24;
  v30 = CGRectGetWidth(v74) / v29;
  self->mShadowScale = v30;
  v31 = TSDMultiplySizeScalar(v7, v9, 1.0 / v30);
  v33 = v32;
  v34 = objc_alloc_init((Class)CALayer);
  -[CALayer anchorPoint](v3, "anchorPoint");
  objc_msgSend(v34, "setBounds:", TSDRectWithSize(objc_msgSend(v34, "setAnchorPoint:")));
  -[CALayer position](v3, "position");
  objc_msgSend(v34, "setPosition:");
  if (v3)
  {
    -[CALayer transform](v3, "transform");
  }
  else
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
  }
  v65[4] = v70;
  v65[5] = v71;
  v65[6] = v72;
  v65[7] = v73;
  v65[0] = v66;
  v65[1] = v67;
  v65[2] = v68;
  v65[3] = v69;
  v35 = v57 / v30;
  objc_msgSend(v34, "setTransform:", v65);
  if (!v11)
    v11 = (CGColor *)objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor");
  objc_msgSend(v34, "setShadowColor:", v11);
  *(float *)&v36 = v58;
  objc_msgSend(v34, "setShadowOpacity:", v36);
  objc_msgSend(v34, "setShadowOffset:", v31, v33);
  objc_msgSend(v34, "setShadowRadius:", v35);
  if (v12)
  {
    memset(&transform, 0, sizeof(transform));
    CGAffineTransformMakeScale(&transform, 1.0 / self->mShadowScale, 1.0 / self->mShadowScale);
    v37 = CGPathCreateCopyByTransformingPath(-[CALayer shadowPath](v3, "shadowPath"), &transform);
    if (v37)
    {
      v38 = v37;
      objc_msgSend(v34, "setShadowPath:", v37);
      CGPathRelease(v38);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerShouldUsedTracedShadowPath:") & 1) != 0&& -[THWFreeTransformControllerDelegate freeTransformControllerShouldUsedTracedShadowPath:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerShouldUsedTracedShadowPath:", self))
    {
      v39 = -[CALayer tracedShadowPathWithScale:](v3, "tracedShadowPathWithScale:", 1.0 / self->mShadowScale);
    }
    else
    {
      if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "shadowPathForFreeTransformController:") & 1) != 0)
      {
        v40 = -[THWFreeTransformControllerDelegate shadowPathForFreeTransformController:](-[THWFreeTransformController delegate](self, "delegate"), "shadowPathForFreeTransformController:", self);
        CGAffineTransformMakeScale(&v63, 1.0 / self->mShadowScale, 1.0 / self->mShadowScale);
        objc_msgSend(v40, "transformUsingAffineTransform:", &v63);
        v41 = (TSDBezierPath *)v40;
      }
      else
      {
        objc_msgSend(v34, "bounds");
        v41 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
      }
      v39 = (CGPath *)-[TSDBezierPath CGPath](v41, "CGPath");
    }
    objc_msgSend(v34, "setShadowPath:", v39);
  }
  p_mOriginalShadowTransform = &self->mOriginalShadowTransform;
  CGAffineTransformMakeScale(&t1, self->mShadowScale, self->mShadowScale);
  if (v34)
    objc_msgSend(v34, "transform");
  else
    memset(&v60, 0, sizeof(v60));
  CATransform3DGetAffineTransform(&t2, &v60);
  CGAffineTransformConcat(&transform, &t1, &t2);
  v43 = *(_OWORD *)&transform.c;
  *(_OWORD *)&p_mOriginalShadowTransform->a = *(_OWORD *)&transform.a;
  *(_OWORD *)&self->mOriginalShadowTransform.c = v43;
  *(_OWORD *)&self->mOriginalShadowTransform.tx = *(_OWORD *)&transform.tx;
  v44 = *(_OWORD *)&self->mOriginalShadowTransform.c;
  v59[0] = *(_OWORD *)&p_mOriginalShadowTransform->a;
  v59[1] = v44;
  v59[2] = *(_OWORD *)&self->mOriginalShadowTransform.tx;
  objc_msgSend(v34, "setAffineTransform:", v59);
  -[CALayer insertSublayer:below:](-[CALayer superlayer](v3, "superlayer"), "insertSublayer:below:", v34, v3);
  objc_msgSend(v34, "setName:", CFSTR("THWFreeTransformShadowLayer"));
  -[THWFreeTransformController setShadowLayer:](self, "setShadowLayer:", v34);

  LODWORD(v45) = 0;
  -[CALayer setShadowOpacity:](v3, "setShadowOpacity:", v45);
  v46 = -[THWFreeTransformController p_shadowFadeInAnimation:](self, "p_shadowFadeInAnimation:", v58, v31, v33, v35);
  objc_msgSend(v34, "addAnimation:forKey:", v46, kFadeInAnimationName);
  if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerStyledRep:") & 1) != 0)
  {
    v47 = -[THWFreeTransformControllerDelegate freeTransformControllerStyledRep:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerStyledRep:", self);
    v48 = objc_msgSend(v47, "shadowLayer");
    if (v48)
    {
      v49 = v48;
      objc_msgSend(v48, "opacity");
      v51 = -[THWFreeTransformController p_shadowFadeOutAnimation:](self, "p_shadowFadeOutAnimation:", v50);
      objc_msgSend(v49, "addAnimation:forKey:", v51, kTHWFreeTransformControllerFadeOutAnimationName);
    }
    v52 = objc_msgSend(v47, "reflectionLayer");
    if (v52)
    {
      v53 = v52;
      objc_msgSend(v52, "opacity");
      v55 = -[THWFreeTransformController p_shadowFadeOutAnimation:](self, "p_shadowFadeOutAnimation:", v54);
      objc_msgSend(v53, "addAnimation:forKey:", v55, kTHWFreeTransformControllerFadeOutAnimationName);
    }
  }
}

- (double)p_rotationAngleFromTransform:(CGAffineTransform *)a3
{
  return atan2(a3->c + a3->a * 0.0 + a3->tx - (a3->tx - (a3->c - a3->a * 0.0)), a3->d + a3->b * 0.0 + a3->ty - (a3->ty - (a3->d - a3->b * 0.0)));
}

- (void)p_addOvershootAnimationWithOriginalFrame:(CGRect)a3 originalTransform:(CGAffineTransform *)a4 targetFrame:(CGRect)a5 targetTransform:(CGAffineTransform *)a6 completion:(id)a7
{
  double height;
  CGFloat width;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __n128 v28;
  __n128 v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double d;
  double c;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  double v46;
  CGFloat v47;
  __int128 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __int128 v54;
  double v55;
  double v56;
  __int128 v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  CAKeyframeAnimation *v67;
  double v68;
  NSNumber *v69;
  double v70;
  NSNumber *v71;
  double v72;
  CAKeyframeAnimation *v73;
  __int128 v74;
  NSValue *v75;
  NSValue *v76;
  double v77;
  NSNumber *v78;
  double v79;
  NSNumber *v80;
  double v81;
  id v82;
  CALayer *v83;
  CABasicAnimation *v84;
  double v85;
  CALayer *v86;
  double v87;
  double v88;
  double v89;
  double y;
  double v91;
  CAMediaTimingFunction *v92;
  CAMediaTimingFunction *v93;
  CATransform3D v94;
  _QWORD v95[5];
  CATransform3D v96;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v99;
  CATransform3D v100;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3.size.height;
  v87 = a3.size.width;
  v88 = a3.size.height;
  v14 = a3.size.width;
  v15 = a3.origin.y;
  v16 = a3.origin.x;
  LODWORD(a3.origin.x) = 1055286886;
  LODWORD(a3.origin.y) = 0;
  LODWORD(a3.size.height) = 1.0;
  LODWORD(a3.size.width) = 1057803469;
  v93 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  LODWORD(v18) = 0.25;
  LODWORD(v19) = 0.25;
  LODWORD(v20) = 1.0;
  LODWORD(v21) = 1057803469;
  v92 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v18, v19, v21, v20);
  v22 = TSDCenterOfRect(v16, v15, v14, v13);
  v24 = v23;
  v25 = width;
  v26 = width;
  v27 = height;
  v28.n128_f64[0] = TSDCenterOfRect(x, y, v25, height);
  v30 = TSDSubtractPoints(v28, v29, v22, v24);
  v32 = v31;
  v33 = a4->a;
  v34 = a4->b;
  c = a4->c;
  d = a4->d;
  v37 = ((uint64_t (*)(double, double, double))TSDMultiplyPointScalar)(a4->tx + CGPointZero.y * c + a4->a * CGPointZero.x, a4->ty + CGPointZero.y * d + v34 * CGPointZero.x, -1.0);
  v38 = TSDAddPoints(v37);
  v89 = v39;
  v91 = v38;
  v40 = v26 / v87;
  v41 = v27 / v88;
  v42 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v100.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v100.m33 = v42;
  v43 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v100.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v100.m43 = v43;
  v44 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v100.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v100.m13 = v44;
  v45 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v100.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v100.m23 = v45;
  *(_OWORD *)&v99.m31 = *(_OWORD *)&v100.m31;
  *(_OWORD *)&v99.m33 = v42;
  *(_OWORD *)&v99.m41 = *(_OWORD *)&v100.m41;
  *(_OWORD *)&v99.m43 = v43;
  *(_OWORD *)&v99.m11 = *(_OWORD *)&v100.m11;
  *(_OWORD *)&v99.m13 = v44;
  v46 = (v40 + v41) * 0.5 * (1.0 / ((fabs(v33 + c) + fabs(v34 + d)) * 0.5));
  *(_OWORD *)&v99.m21 = *(_OWORD *)&v100.m21;
  *(_OWORD *)&v99.m23 = v45;
  CATransform3DTranslate(&v100, &v99, v30, v32, 0.0);
  if (v40 >= v41)
    v47 = v41;
  else
    v47 = v40;
  a = v100;
  CATransform3DScale(&v99, &a, v47, v47, 1.0);
  v100 = v99;
  v48 = *(_OWORD *)&a6->c;
  *(_OWORD *)&v99.m11 = *(_OWORD *)&a6->a;
  *(_OWORD *)&v99.m13 = v48;
  *(_OWORD *)&v99.m21 = *(_OWORD *)&a6->tx;
  CATransform3DMakeAffineTransform(&b, (CGAffineTransform *)&v99);
  a = v100;
  CATransform3DConcat(&v99, &a, &b);
  v100 = v99;
  -[THWFreeTransformController lastVelocity](self, "lastVelocity");
  v51 = TSDMultiplyPointScalar(v49, v50, 8.0);
  v53 = v52;
  v54 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v99.m11 = *(_OWORD *)&a4->a;
  *(_OWORD *)&v99.m13 = v54;
  *(_OWORD *)&v99.m21 = *(_OWORD *)&a4->tx;
  -[THWFreeTransformController p_rotationAngleFromTransform:](self, "p_rotationAngleFromTransform:", &v99);
  v56 = v55;
  v57 = *(_OWORD *)&a6->c;
  *(_OWORD *)&v99.m11 = *(_OWORD *)&a6->a;
  *(_OWORD *)&v99.m13 = v57;
  *(_OWORD *)&v99.m21 = *(_OWORD *)&a6->tx;
  -[THWFreeTransformController p_rotationAngleFromTransform:](self, "p_rotationAngleFromTransform:", &v99);
  v59 = v56 - v58;
  v60 = 3.14059265 / vabdd_f64(v56, v58) + -1.0;
  if (v60 > 0.19)
    v60 = 0.19;
  v61 = v59 * v60;
  v62 = fmax((v46 + -1.0) * 0.12 + 1.0, 0.96);
  if (v62 <= 1.04)
    v63 = v62;
  else
    v63 = 1.04;
  v64 = TSDMultiplyPointScalar(v91, v89, 0.05);
  v66 = v65;
  v99 = v100;
  a = v100;
  CATransform3DScale(&v99, &a, v63, v63, 1.0);
  v96 = v99;
  CATransform3DRotate(&a, &v96, v61, 0.0, 0.0, 1.0);
  v99 = a;
  v96 = a;
  CATransform3DTranslate(&a, &v96, v64, v66, 0.0);
  v99 = a;
  -[UIApplication beginIgnoringInteractionEvents](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "beginIgnoringInteractionEvents");
  +[CATransaction begin](CATransaction, "begin");
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_66B88;
  v95[3] = &unk_427830;
  v95[4] = a7;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v95);
  v67 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform.translation"));
  -[CAKeyframeAnimation setValues:](v67, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, CGSizeZero.height), +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v51, v53), +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, CGSizeZero.height), 0));
  -[CAKeyframeAnimation setTimingFunctions:](v67, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:"), 0));
  LODWORD(v68) = 0;
  v69 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v68);
  LODWORD(v70) = 1051361018;
  v71 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v70);
  LODWORD(v72) = 1.0;
  -[CAKeyframeAnimation setKeyTimes:](v67, "setKeyTimes:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v69, v71, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v72), 0));
  -[CAKeyframeAnimation setDuration:](v67, "setDuration:", 0.39);
  -[CAKeyframeAnimation setFillMode:](v67, "setFillMode:", kCAFillModeForwards);
  -[CAKeyframeAnimation setRemovedOnCompletion:](v67, "setRemovedOnCompletion:", 0);
  v73 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform"));
  v74 = *(_OWORD *)&a4->c;
  *(_OWORD *)&a.m11 = *(_OWORD *)&a4->a;
  *(_OWORD *)&a.m13 = v74;
  *(_OWORD *)&a.m21 = *(_OWORD *)&a4->tx;
  CATransform3DMakeAffineTransform(&v94, (CGAffineTransform *)&a);
  v75 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v94);
  a = v99;
  v76 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &a);
  a = v100;
  -[CAKeyframeAnimation setValues:](v73, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v75, v76, +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &a), 0));
  -[CAKeyframeAnimation setTimingFunctions:](v73, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v92, v93, 0));
  LODWORD(v77) = 0;
  v78 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v77);
  LODWORD(v79) = 1057458056;
  v80 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v79);
  LODWORD(v81) = 1.0;
  -[CAKeyframeAnimation setKeyTimes:](v73, "setKeyTimes:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v78, v80, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v81), 0));
  -[CAKeyframeAnimation setDuration:](v73, "setDuration:", 0.51);
  -[CAKeyframeAnimation setFillMode:](v73, "setFillMode:", kCAFillModeForwards);
  -[CAKeyframeAnimation setRemovedOnCompletion:](v73, "setRemovedOnCompletion:", 0);
  v82 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
  objc_msgSend(v82, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v67, v73, 0));
  objc_msgSend(v82, "setDuration:", 0.51);
  objc_msgSend(v82, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(v82, "setRemovedOnCompletion:", 0);
  v83 = -[THWFreeTransformController freeTransformLayer](self, "freeTransformLayer");
  -[CALayer addAnimation:forKey:](v83, "addAnimation:forKey:", v82, kSnapToSizeAnimationName);
  if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerShouldFadeShadowOut:") & 1) == 0|| -[THWFreeTransformControllerDelegate freeTransformControllerShouldFadeShadowOut:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerShouldFadeShadowOut:", self))
  {
    v84 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("shadowOpacity"));
    -[CABasicAnimation setTimingFunction:](v84, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    -[CABasicAnimation setDuration:](v84, "setDuration:", 0.27);
    LODWORD(v85) = 0;
    -[CABasicAnimation setToValue:](v84, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v85));
    -[CABasicAnimation setFillMode:](v84, "setFillMode:", kCAFillModeForwards);
    -[CABasicAnimation setRemovedOnCompletion:](v84, "setRemovedOnCompletion:", 0);
    v86 = -[THWFreeTransformController shadowLayer](self, "shadowLayer");
    -[CALayer addAnimation:forKey:](v86, "addAnimation:forKey:", v84, kTHWFreeTransformControllerFadeOutAnimationName);
  }
  +[CATransaction commit](CATransaction, "commit");
}

- (double)p_clampedScaleWithOriginalScale:(double)result originalFrame:(CGRect)a4 targetFrame:(CGRect)a5
{
  double v5;
  BOOL v6;
  double v7;
  BOOL v8;
  double v9;

  v5 = a5.size.height / a4.size.height;
  v6 = a5.size.width / a4.size.width < a5.size.height / a4.size.height;
  if (a5.size.width / a4.size.width >= a5.size.height / a4.size.height)
    v7 = a5.size.height / a4.size.height;
  else
    v7 = a5.size.width / a4.size.width;
  if (!v6)
    v5 = a5.size.width / a4.size.width;
  v8 = a5.size.width <= a4.size.width;
  if (a5.size.width <= a4.size.width)
    v9 = 1.0;
  else
    v9 = v7;
  if (!v8)
    v5 = 1.0;
  if (v5 > result)
    result = v5 * 0.667 + result * 0.333;
  if (result > v9)
    return v9 + (result - v9) * 0.333;
  return result;
}

- (void)p_setupForTransformWithGesture:(id)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  CALayer *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double x;
  double v20;
  double y;
  double v22;
  double width;
  double v24;
  double height;
  double mTransformScale;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CALayer *v32;
  CALayer *v33;
  CALayer *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v50;
  THWFreeTransformController *v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  CGRect v61;
  CGRect v62;

  if (self->mStartedFreeTransform)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController p_setupForTransformWithGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m"), 621, CFSTR("Already started transforming."));
  v51 = self;
  self->mStartedFreeTransform = 1;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v4 = -[UIApplication windows](+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3), "windows");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "isUserInteractionEnabled") & 1) == 0)
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController p_setupForTransformWithGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m"), 630, CFSTR("we'll end up switching this on later..."));
        objc_msgSend(v9, "setUserInteractionEnabled:", 0);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v6);
  }
  objc_msgSend(+[UIWindow keyWindow](UIWindow, "keyWindow"), "beginDisablingInterfaceAutorotation");
  ++dword_543190;
  -[THWFreeTransformController setIsFreeTransformInProgress:](v51, "setIsFreeTransformInProgress:", 1);
  -[THWFreeTransformController setPassedThreshold:](v51, "setPassedThreshold:", 0);
  -[THWFreeTransformControllerDelegate freeTransformControllerDidBegin:](-[THWFreeTransformController delegate](v51, "delegate"), "freeTransformControllerDidBegin:", v51);
  if (!-[THWFreeTransformController layerSaveRestore](v51, "layerSaveRestore"))
    -[THWFreeTransformController setLayerSaveRestore:](v51, "setLayerSaveRestore:", objc_alloc_init((Class)TSULayerSaveRestore));
  -[TSULayerSaveRestore saveLayer:](-[THWFreeTransformController layerSaveRestore](v51, "layerSaveRestore"), "saveLayer:", -[THWFreeTransformController targetLayer](v51, "targetLayer"));
  v10 = -[THWFreeTransformController superLayerForWrapper](v51, "superLayerForWrapper");
  -[CALayer frame](-[THWFreeTransformController targetLayer](v51, "targetLayer"), "frame");
  v15 = TSDCenterOfRect(v11, v12, v13, v14);
  -[CALayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", -[CALayer superlayer](-[THWFreeTransformController targetLayer](v51, "targetLayer"), "superlayer"), v15, v16);
  v18 = v17;
  if (-[THWFreeTransformController targetLayer](v51, "targetLayer"))
  {
    -[CALayer frame](-[THWFreeTransformController targetLayer](v51, "targetLayer"), "frame");
    x = TSDRectWithCenterAndSize(v18);
    y = v20;
    width = v22;
    height = v24;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  -[THWFreeTransformController setOriginalTargetLayerFrame:](v51, "setOriginalTargetLayerFrame:", x, y, width, height);
  mTransformScale = v51->mTransformScale;
  if (mTransformScale != 0.0)
  {
    v27 = TSDCenterOfRect(x, y, width, height);
    TSDMultiplySizeScalar(width, height, mTransformScale);
    x = TSDRectWithCenterAndSize(v27);
    y = v28;
    width = v29;
    height = v30;
  }
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  v62 = CGRectInset(v61, -0.0, -0.0);
  -[THWFreeTransformController setWrapperView:](v51, "setWrapperView:", objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v62.origin.x, v62.origin.y, v62.size.width, v62.size.height));
  v31 = v51->mTransformScale;
  if (v31 != 0.0)
  {
    CGAffineTransformMakeScale(&v55, 1.0 / v31, 1.0 / v31);
    v32 = -[THWFreeTransformController wrapperLayer](v51, "wrapperLayer");
    v54 = v55;
    -[CALayer setAffineTransform:](v32, "setAffineTransform:", &v54);
    CGAffineTransformMakeScale(&v53, v51->mTransformScale, v51->mTransformScale);
    v33 = -[THWFreeTransformController targetLayer](v51, "targetLayer");
    v52 = v53;
    -[CALayer setAffineTransform:](v33, "setAffineTransform:", &v52);
  }
  -[CALayer setBackgroundColor:](-[THWFreeTransformController wrapperLayer](v51, "wrapperLayer"), "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
  -[CALayer setName:](-[THWFreeTransformController wrapperLayer](v51, "wrapperLayer"), "setName:", CFSTR("THWFreeTransformWrapperLayer"));
  -[THWFreeTransformController setCurtainLayer:](v51, "setCurtainLayer:", objc_alloc_init((Class)CALayer));
  -[CALayer setName:](-[THWFreeTransformController curtainLayer](v51, "curtainLayer"), "setName:", CFSTR("THWFreeTransformCurtainLayer"));
  -[CALayer insertSublayer:below:](-[THWFreeTransformController superLayerForWrapper](v51, "superLayerForWrapper"), "insertSublayer:below:", -[THWFreeTransformController curtainLayer](v51, "curtainLayer"), -[THWFreeTransformController targetLayer](v51, "targetLayer"));
  -[CALayer insertSublayer:below:](-[THWFreeTransformController superLayerForWrapper](v51, "superLayerForWrapper"), "insertSublayer:below:", -[THWFreeTransformController wrapperLayer](v51, "wrapperLayer"), -[THWFreeTransformController targetLayer](v51, "targetLayer"));
  v34 = -[THWFreeTransformController wrapperLayer](v51, "wrapperLayer");
  -[CALayer position](-[THWFreeTransformController targetLayer](v51, "targetLayer"), "position");
  -[CALayer convertPoint:fromLayer:](v34, "convertPoint:fromLayer:", -[CALayer superlayer](-[THWFreeTransformController targetLayer](v51, "targetLayer"), "superlayer"), v35, v36);
  v38 = v37;
  v40 = v39;
  if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](v51, "delegate"), "freeTransformControllerWillMoveTargetLayer:") & 1) != 0)-[THWFreeTransformControllerDelegate freeTransformControllerWillMoveTargetLayer:](-[THWFreeTransformController delegate](v51, "delegate"), "freeTransformControllerWillMoveTargetLayer:", -[THWFreeTransformController targetLayer](v51, "targetLayer"));
  -[CALayer addSublayer:](-[THWFreeTransformController wrapperLayer](v51, "wrapperLayer"), "addSublayer:", -[THWFreeTransformController targetLayer](v51, "targetLayer"));
  -[CALayer setPosition:](-[THWFreeTransformController targetLayer](v51, "targetLayer"), "setPosition:", v38, v40);
  if (-[THWFreeTransformController smoothEdges](v51, "smoothEdges"))
  {
    v41 = -[CALayer setShouldRasterize:](-[THWFreeTransformController wrapperLayer](v51, "wrapperLayer"), "setShouldRasterize:", 1);
    -[CALayer setRasterizationScale:](-[THWFreeTransformController wrapperLayer](v51, "wrapperLayer"), "setRasterizationScale:", TSUScreenScale(v41, v42));
  }
  if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](v51, "delegate"), "freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:") & 1) != 0&& !-[THWFreeTransformControllerDelegate freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:](-[THWFreeTransformController delegate](v51, "delegate"), "freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:", v51))
  {
    -[CALayer setZPosition:](-[THWFreeTransformController freeTransformLayer](v51, "freeTransformLayer"), "setZPosition:", 10000.0);
  }
  else
  {
    v44 = objc_opt_class(UIView, v43);
    v45 = (void *)TSUDynamicCast(v44, -[CALayer delegate](-[THWFreeTransformController freeTransformLayer](v51, "freeTransformLayer"), "delegate"));
    v47 = objc_opt_class(UIView, v46);
    v48 = TSUDynamicCast(v47, -[CALayer delegate](-[THWFreeTransformController superLayerForWrapper](v51, "superLayerForWrapper"), "delegate"));
    if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](v51, "delegate"), "freeTransformControllerShouldUseEffectsWindow:") & 1) != 0&& !-[THWFreeTransformControllerDelegate freeTransformControllerShouldUseEffectsWindow:](-[THWFreeTransformController delegate](v51, "delegate"), "freeTransformControllerShouldUseEffectsWindow:", v51))
    {
      objc_msgSend(objc_msgSend(v45, "window"), "moveViewAboveStatusBar:zPosition:hostView:", v45, v48, 10000.0);
    }
    else
    {
      +[UIWindow moveViewToEffectsWindowAboveStatusBar:zPosition:hostView:](UIWindow, "moveViewToEffectsWindowAboveStatusBar:zPosition:hostView:", v45, v48, 10000.0);
    }
  }
  -[CALayer setZPosition:](-[THWFreeTransformController freeTransformLayer](v51, "freeTransformLayer"), "setZPosition:", 10000.0);
  if (-[THWFreeTransformController p_wantsCurtainFadeOut](v51, "p_wantsCurtainFadeOut"))
    -[THWFreeTransformController p_setupCurtain](v51, "p_setupCurtain");
  if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](v51, "delegate"), "freeTransformControllerWantsShadow:") & 1) == 0|| -[THWFreeTransformControllerDelegate freeTransformControllerWantsShadow:](-[THWFreeTransformController delegate](v51, "delegate"), "freeTransformControllerWantsShadow:", v51))
  {
    -[THWFreeTransformController p_setupShadow](v51, "p_setupShadow");
  }
  -[THWFreeTransformController setLastVelocity:](v51, "setLastVelocity:", CGPointZero.x, CGPointZero.y);
  objc_msgSend(v50, "centerPoint");
  -[THWFreeTransformController setLastDragCenter:](v51, "setLastDragCenter:");
}

- (void)transformGRChanged:(id)a3
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double mTransformScale;
  CALayer *v23;
  __int128 v24;
  CALayer *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __n128 v34;
  __n128 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double x;
  double v51;
  double v52;
  _BOOL4 v53;
  double v54;
  double v55;
  _BOOL4 v56;
  uint64_t v57;
  CGSize size;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  __int128 v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  double v96;
  double v97;
  __int128 v98;
  double v99;
  double v100;
  double v101;
  _QWORD v102[2];
  __n128 (*v103)(uint64_t);
  void *v104;
  THWFreeTransformController *v105;
  char v106;
  CGAffineTransform v107;
  CGAffineTransform v108;
  CGAffineTransform v109[2];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v112;
  CGAffineTransform v113;
  CGRect v114;
  CGRect v115;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController transformGRChanged:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m"), 739, CFSTR("This operation must only be performed on the main thread."));
  if (!self->mStartedFreeTransform)
    -[THWFreeTransformController p_setupForTransformWithGesture:](self, "p_setupForTransformWithGesture:", a3);
  memset(&v113, 0, sizeof(v113));
  if (a3)
    objc_msgSend(a3, "transform");
  objc_msgSend(a3, "scale");
  v6 = v5;
  -[THWFreeTransformController originalTargetLayerFrame](self, "originalTargetLayerFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[THWFreeTransformControllerDelegate freeTransformControllerRectForCompletionAnimation:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerRectForCompletionAnimation:", self);
  -[THWFreeTransformController p_clampedScaleWithOriginalScale:originalFrame:targetFrame:](self, "p_clampedScaleWithOriginalScale:originalFrame:targetFrame:", v6, v8, v10, v12, v14, v15, v16, v17, v18);
  if (v19 != v6)
  {
    v20 = v19;
    objc_msgSend(a3, "angle");
    if (a3)
      objc_msgSend(a3, "transformWithScale:angle:", v20, v21);
    else
      memset(&v112, 0, sizeof(v112));
    v113 = v112;
  }
  mTransformScale = self->mTransformScale;
  if (mTransformScale != 0.0)
  {
    CGAffineTransformMakeScale(&t1, 1.0 / mTransformScale, 1.0 / mTransformScale);
    t2 = v113;
    CGAffineTransformConcat(&v112, &t1, &t2);
    v113 = v112;
  }
  v109[1] = v113;
  v109[0] = v113;
  -[CALayer setAffineTransform:](-[THWFreeTransformController freeTransformLayer](self, "freeTransformLayer"), "setAffineTransform:", v109);
  v23 = -[THWFreeTransformController targetLayer](self, "targetLayer");
  if (v23 == -[THWFreeTransformController freeTransformLayer](self, "freeTransformLayer"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v24 = *(_OWORD *)&self->mOriginalShadowTransform.c;
    *(_OWORD *)&v112.a = *(_OWORD *)&self->mOriginalShadowTransform.a;
    *(_OWORD *)&v112.c = v24;
    *(_OWORD *)&v112.tx = *(_OWORD *)&self->mOriginalShadowTransform.tx;
    t2 = v113;
    CGAffineTransformConcat(&v108, &v112, &t2);
    v25 = -[THWFreeTransformController shadowLayer](self, "shadowLayer");
    v107 = v108;
    -[CALayer setAffineTransform:](v25, "setAffineTransform:", &v107);
    +[CATransaction commit](CATransaction, "commit");
  }
  if (v6 <= 0.959999979
    && !self->mStartedCurtainFadeOut
    && -[THWFreeTransformController p_wantsCurtainFadeOut](self, "p_wantsCurtainFadeOut"))
  {
    -[THWFreeTransformController p_fadeOutCurtain](self, "p_fadeOutCurtain");
  }
  objc_msgSend(a3, "centerPoint");
  v27 = v26;
  v29 = v28;
  -[THWFreeTransformController lastDragCenter](self, "lastDragCenter");
  v31 = v30;
  v33 = v32;
  v34.n128_u64[0] = v27;
  v35.n128_u64[0] = v29;
  v36 = TSDSubtractPoints(v34, v35, v31, v33);
  v38 = TSDMultiplyPointScalar(v36, v37, 0.5);
  v40 = v39;
  v41 = -[THWFreeTransformController lastVelocity](self, "lastVelocity");
  v45 = TSDAveragePoints(v41, v42, v43, v44, v38, v40);
  v47 = v46;
  -[CALayer removeAllAnimations](-[THWFreeTransformController freeTransformLayer](self, "freeTransformLayer"), "removeAllAnimations");
  -[THWFreeTransformController scaleThreshold](self, "scaleThreshold");
  if (v48 > 1.0 && v6 < 1.5
    || (-[THWFreeTransformController scaleThreshold](self, "scaleThreshold"), v49 < 1.0) && v6 < 0.5)
  {
    x = CGPointZero.x;
    if (CGPointZero.x != v45 || (x = CGPointZero.y, x != v47))
      -[CALayer addMomentumTiltWithVelocity:](-[THWFreeTransformController freeTransformLayer](self, "freeTransformLayer", x), "addMomentumTiltWithVelocity:", v45, v47);
  }
  objc_msgSend(a3, "centerPoint");
  -[THWFreeTransformController setLastDragCenter:](self, "setLastDragCenter:");
  -[THWFreeTransformController setLastVelocity:](self, "setLastVelocity:", v45, v47);
  if (objc_msgSend(a3, "isEnabled")
    && (objc_msgSend(a3, "state") == (char *)&dword_0 + 3 || objc_msgSend(a3, "state") == &dword_4))
  {
    -[CALayer removeMomentumTiltAnimation](-[THWFreeTransformController freeTransformLayer](self, "freeTransformLayer"), "removeMomentumTiltAnimation");
    -[CALayer setZPosition:](-[THWFreeTransformController freeTransformLayer](self, "freeTransformLayer"), "setZPosition:", 0.0);
    -[THWFreeTransformController scaleThreshold](self, "scaleThreshold");
    if (v51 <= 1.0)
    {
      v53 = 0;
    }
    else
    {
      -[THWFreeTransformController scaleThreshold](self, "scaleThreshold");
      v53 = v6 > v52;
    }
    -[THWFreeTransformController scaleThreshold](self, "scaleThreshold");
    if (v54 >= 1.0)
    {
      v56 = 0;
    }
    else
    {
      -[THWFreeTransformController scaleThreshold](self, "scaleThreshold");
      v56 = v6 < v55;
    }
    if (objc_msgSend(a3, "state") == &dword_4)
      v57 = 0;
    else
      v57 = v53 | v56;
    size = CGRectNull.size;
    self->mCompletionTargetRect.origin = CGRectNull.origin;
    self->mCompletionTargetRect.size = size;
    -[THWFreeTransformController originalTargetLayerFrame](self, "originalTargetLayerFrame");
    v60 = v59;
    v62 = v61;
    v64 = v63;
    v66 = v65;
    if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerWillBeginCompletionAnimation:passedThreshold:") & 1) != 0)-[THWFreeTransformControllerDelegate freeTransformControllerWillBeginCompletionAnimation:passedThreshold:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerWillBeginCompletionAnimation:passedThreshold:", self, v57);
    v67 = *(_OWORD *)&v113.c;
    *(_OWORD *)&self->mCurrentTransform.a = *(_OWORD *)&v113.a;
    *(_OWORD *)&self->mCurrentTransform.c = v67;
    *(_OWORD *)&self->mCurrentTransform.tx = *(_OWORD *)&v113.tx;
    -[THWFreeTransformController setPassedThreshold:](self, "setPassedThreshold:", v57);
    if ((_DWORD)v57)
    {
      -[THWFreeTransformControllerDelegate freeTransformControllerRectForCompletionAnimation:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerRectForCompletionAnimation:", self);
      self->mCompletionTargetRect.origin.x = v68;
      self->mCompletionTargetRect.origin.y = v69;
      self->mCompletionTargetRect.size.width = v70;
      self->mCompletionTargetRect.size.height = v71;
      -[THWFreeTransformController completionTargetRect](self, "completionTargetRect");
      if (!CGRectIsNull(v114))
      {
        -[CALayer center](-[THWFreeTransformController freeTransformLayer](self, "freeTransformLayer"), "center");
        v73 = TSDRectWithCenterAndSize(v72);
        v60 = v73;
        v62 = v74;
        v64 = v75;
        v66 = v76;
        v77 = self->mTransformScale;
        if (v77 != 0.0)
        {
          v78 = TSDCenterOfRect(v73, v74, v75, v76);
          TSDMultiplySizeScalar(v64, v66, v77);
          v60 = TSDRectWithCenterAndSize(v78);
          v62 = v79;
          v64 = v80;
          v66 = v81;
        }
      }
    }
    else
    {
      -[THWFreeTransformController originalTargetLayerFrame](self, "originalTargetLayerFrame");
      self->mCompletionTargetRect.origin.x = v82;
      self->mCompletionTargetRect.origin.y = v83;
      self->mCompletionTargetRect.size.width = v84;
      self->mCompletionTargetRect.size.height = v85;
      if (self->mTransformScale != 0.0)
      {
        -[THWFreeTransformController completionTargetRect](self, "completionTargetRect");
        v90 = TSDCenterOfRect(v86, v87, v88, v89);
        -[THWFreeTransformController completionTargetRect](self, "completionTargetRect");
        TSDMultiplySizeScalar(v91, v92, 1.0 / self->mTransformScale);
        self->mCompletionTargetRect.origin.x = TSDRectWithCenterAndSize(v90);
        self->mCompletionTargetRect.origin.y = v93;
        self->mCompletionTargetRect.size.width = v94;
        self->mCompletionTargetRect.size.height = v95;
      }
    }
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v103 = sub_67AD4;
    v104 = &unk_427268;
    v105 = self;
    v106 = v57;
    if (!self->mStartedCurtainFadeOut
      && (_DWORD)v57
      && -[THWFreeTransformController p_wantsCurtainFadeOut](self, "p_wantsCurtainFadeOut"))
    {
      -[THWFreeTransformController p_fadeOutCurtain](self, "p_fadeOutCurtain");
    }
    if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerDidFinishFreeTransforming:passedThreshold:completionBlock:") & 1) != 0)
    {
      -[THWFreeTransformControllerDelegate freeTransformControllerDidFinishFreeTransforming:passedThreshold:completionBlock:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerDidFinishFreeTransforming:passedThreshold:completionBlock:", self, v57, v102);
    }
    else
    {
      -[THWFreeTransformController completionTargetRect](self, "completionTargetRect");
      if (CGRectIsEmpty(v115) || objc_msgSend(a3, "state") == &dword_4)
      {
        v103((uint64_t)v102);
      }
      else
      {
        -[THWFreeTransformController completionTargetRect](self, "completionTargetRect");
        v97 = v96;
        v112 = v113;
        v98 = *(_OWORD *)&CGAffineTransformIdentity.c;
        *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
        *(_OWORD *)&t2.c = v98;
        *(_OWORD *)&t2.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
        -[THWFreeTransformController p_addOvershootAnimationWithOriginalFrame:originalTransform:targetFrame:targetTransform:completion:](self, "p_addOvershootAnimationWithOriginalFrame:originalTransform:targetFrame:targetTransform:completion:", &v112, &t2, v102, v60, v62, v64, v66, v99, v97, v100, v101);
      }
    }
  }
  else if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerDidContinue:withScale:") & 1) != 0)
  {
    -[THWFreeTransformControllerDelegate freeTransformControllerDidContinue:withScale:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerDidContinue:withScale:", self, v6);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if ((objc_opt_respondsToSelector(-[THWFreeTransformController delegate](self, "delegate", a3), "freeTransformControllerShouldBegin:") & 1) != 0)return -[THWFreeTransformControllerDelegate freeTransformControllerShouldBegin:](-[THWFreeTransformController delegate](self, "delegate"), "freeTransformControllerShouldBegin:", self);
  else
    return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  THWFreeTransformControllerDelegate *mDelegate;

  mDelegate = self->mDelegate;
  if (mDelegate
    && (objc_opt_respondsToSelector(mDelegate, "freeTransformController:shouldRecognizeSimultaneouslyWithGestureRecognizer:", a3) & 1) != 0)
  {
    return -[THWFreeTransformControllerDelegate freeTransformController:shouldRecognizeSimultaneouslyWithGestureRecognizer:](self->mDelegate, "freeTransformController:shouldRecognizeSimultaneouslyWithGestureRecognizer:", self, a4);
  }
  else
  {
    return 0;
  }
}

- (BOOL)freeTransformGestureRecognizerShouldDelayRecognizeUntilScaleChange:(id)a3
{
  THWFreeTransformControllerDelegate *mDelegate;

  mDelegate = self->mDelegate;
  if (!mDelegate)
    mDelegate = self->mGestureRecognizerDelegate;
  if (self->mBounceUpOnly)
    return 1;
  if ((objc_opt_respondsToSelector(mDelegate, "freeTransformControllerShouldDelayRecognizeUntilScaleChange:", a3) & 1) != 0)
    return -[THWFreeTransformControllerDelegate freeTransformControllerShouldDelayRecognizeUntilScaleChange:](mDelegate, "freeTransformControllerShouldDelayRecognizeUntilScaleChange:", self);
  return 0;
}

- (BOOL)freeTransformGestureRecognizerShouldRubberband:(id)a3
{
  return self->mBounceUpOnly;
}

- (BOOL)freeTransformGestureRecognizerShouldAllowPinchDown:(id)a3
{
  THWFreeTransformControllerDelegate *mDelegate;

  mDelegate = self->mDelegate;
  if (!mDelegate)
    mDelegate = self->mGestureRecognizerDelegate;
  if (self->mBounceUpOnly)
    return 0;
  if ((objc_opt_respondsToSelector(mDelegate, "freeTransformControllerShouldAllowPinchDown:", a3) & 1) != 0)
    return -[THWFreeTransformControllerDelegate freeTransformControllerShouldAllowPinchDown:](mDelegate, "freeTransformControllerShouldAllowPinchDown:", self);
  return 1;
}

- (BOOL)freeTransformGestureRecognizerShouldAllowPinchUp:(id)a3
{
  THWFreeTransformControllerDelegate *mDelegate;

  mDelegate = self->mDelegate;
  if (!mDelegate)
    mDelegate = self->mGestureRecognizerDelegate;
  if ((objc_opt_respondsToSelector(mDelegate, "freeTransformControllerShouldAllowPinchUp:", a3) & 1) != 0)
    return -[THWFreeTransformControllerDelegate freeTransformControllerShouldAllowPinchUp:](mDelegate, "freeTransformControllerShouldAllowPinchUp:", self);
  else
    return 1;
}

- (THWFreeTransformControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THWFreeTransformControllerDelegate *)a3;
}

- (THWFreeTransformControllerGestureRecognizerDelegate)gestureRecognizerDelegate
{
  return self->mGestureRecognizerDelegate;
}

- (void)setGestureRecognizerDelegate:(id)a3
{
  self->mGestureRecognizerDelegate = (THWFreeTransformControllerGestureRecognizerDelegate *)a3;
}

- (UIView)wrapperView
{
  return self->mWrapperView;
}

- (void)setWrapperView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CALayer)targetLayer
{
  return self->mTargetLayer;
}

- (double)scaleThreshold
{
  return self->mScaleThreshold;
}

- (void)setScaleThreshold:(double)a3
{
  self->mScaleThreshold = a3;
}

- (THWFreeTransformGestureRecognizer)transformGR
{
  return self->mTransformGR;
}

- (void)setTransformGR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CALayer)shadowLayer
{
  return self->mShadowLayer;
}

- (void)setShadowLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (CALayer)curtainLayer
{
  return self->mCurtainLayer;
}

- (void)setCurtainLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setOriginalTargetLayerFrame:(CGRect)a3
{
  self->mOriginalTargetLayerFrame = a3;
}

- (CGPoint)lastDragCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->mLastDragCenter.x;
  y = self->mLastDragCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastDragCenter:(CGPoint)a3
{
  self->mLastDragCenter = a3;
}

- (CGPoint)lastVelocity
{
  double x;
  double y;
  CGPoint result;

  x = self->mLastVelocity.x;
  y = self->mLastVelocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastVelocity:(CGPoint)a3
{
  self->mLastVelocity = a3;
}

- (BOOL)smoothEdges
{
  return self->mSmoothEdges;
}

- (void)setSmoothEdges:(BOOL)a3
{
  self->mSmoothEdges = a3;
}

- (double)transformScale
{
  return self->mTransformScale;
}

- (void)setTransformScale:(double)a3
{
  self->mTransformScale = a3;
}

- (BOOL)bounceUpOnly
{
  return self->mBounceUpOnly;
}

- (void)setBounceUpOnly:(BOOL)a3
{
  self->mBounceUpOnly = a3;
}

- (CGRect)completionTargetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mCompletionTargetRect.origin.x;
  y = self->mCompletionTargetRect.origin.y;
  width = self->mCompletionTargetRect.size.width;
  height = self->mCompletionTargetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGAffineTransform)currentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].b;
  return self;
}

- (CGAffineTransform)originalShadowTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].c;
  return self;
}

- (BOOL)passedThreshold
{
  return self->mPassedThreshold;
}

- (void)setPassedThreshold:(BOOL)a3
{
  self->mPassedThreshold = a3;
}

- (BOOL)isFreeTransformInProgress
{
  return self->mIsFreeTransformInProgress;
}

- (void)setIsFreeTransformInProgress:(BOOL)a3
{
  self->mIsFreeTransformInProgress = a3;
}

- (TSULayerSaveRestore)layerSaveRestore
{
  return self->_layerSaveRestore;
}

- (void)setLayerSaveRestore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (void)recreateGestureRecognizerOnView:(id)a3
{
  if (-[THWFreeTransformGestureRecognizer view](-[THWFreeTransformController transformGR](self, "transformGR"), "view") != a3)
  {
    -[THWFreeTransformController clearGestureRecognizer](self, "clearGestureRecognizer");
    if (a3)
    {
      -[THWFreeTransformController setTransformGR:](self, "setTransformGR:", -[THWFreeTransformGestureRecognizer initWithTarget:action:]([THWFreeTransformGestureRecognizer alloc], "initWithTarget:action:", self, "transformGRChanged:"));
      -[THWFreeTransformGestureRecognizer setFreeTransformDelegate:](-[THWFreeTransformController transformGR](self, "transformGR"), "setFreeTransformDelegate:", self);
      objc_msgSend(a3, "addGestureRecognizer:", -[THWFreeTransformController transformGR](self, "transformGR"));
      -[THWFreeTransformController p_updateUnmovingParentView:](self, "p_updateUnmovingParentView:", a3);
    }
  }
}

- (void)clearGestureRecognizer
{
  if (-[THWFreeTransformController transformGR](self, "transformGR"))
    objc_msgSend(-[THWFreeTransformGestureRecognizer view](-[THWFreeTransformController transformGR](self, "transformGR"), "view"), "removeGestureRecognizer:", -[THWFreeTransformController transformGR](self, "transformGR"));
}

- (void)updateUnmovingParentView
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_opt_class(UIView, a2);
  v4 = TSUDynamicCast(v3, -[CALayer delegate](-[THWFreeTransformController targetLayer](self, "targetLayer"), "delegate"));
  -[THWFreeTransformController p_updateUnmovingParentView:](self, "p_updateUnmovingParentView:", v4);
}

- (void)p_updateUnmovingParentView:(id)a3
{
  id v5;

  v5 = -[THWFreeTransformControllerDelegate unmovingParentViewForFreeTransformController:](-[THWFreeTransformController delegate](self, "delegate"), "unmovingParentViewForFreeTransformController:", self);
  if (!v5)
    v5 = objc_msgSend(a3, "superview");
  -[THWFreeTransformGestureRecognizer setUnmovingParentView:](-[THWFreeTransformController transformGR](self, "transformGR"), "setUnmovingParentView:", v5);
}

@end
