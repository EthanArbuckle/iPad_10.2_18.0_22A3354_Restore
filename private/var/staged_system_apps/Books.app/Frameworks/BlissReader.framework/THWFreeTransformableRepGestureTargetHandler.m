@implementation THWFreeTransformableRepGestureTargetHandler

- (THWFreeTransformableRepGestureTargetHandler)initWithFreeTransformableRep:(id)a3 handler:(id)a4
{
  THWFreeTransformableRepGestureTargetHandler *v6;
  THWFreeTransformableRepGestureTargetHandler *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWFreeTransformableRepGestureTargetHandler;
  v6 = -[THWFreeTransformableRepGestureTargetHandler init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[THWFreeTransformableRepGestureTargetHandler setRep:](v6, "setRep:", a3);
    -[THWFreeTransformableRepGestureTargetHandler setHandler:](v7, "setHandler:", a4);
  }
  return v7;
}

- (BOOL)interactionEnabled
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;

  if ((objc_opt_respondsToSelector(-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformInteractionEnabledOverride") & 1) != 0&& (-[THWFreeTransformableRep freeTransformInteractionEnabledOverride](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformInteractionEnabledOverride") & 1) != 0)
  {
    return 1;
  }
  v3 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v5 = TSUDynamicCast(v3, -[THWFreeTransformableRep interactiveCanvasController](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "interactiveCanvasController")).n128_u64[0];
  if (!v4)
    return 1;
  v6 = v4;
  if ((objc_msgSend(v4, "isCompactWidth", v5) & 1) != 0)
    return 0;
  else
    return objc_msgSend(v6, "isCompactHeight") ^ 1;
}

- (THWFreeTransformController)ftc
{
  THWFreeTransformController *v2;

  v2 = (THWFreeTransformController *)-[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController");
  if (!v2)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler ftc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"), 86, CFSTR("invalid nil value for '%s'"), "ftc");
  return v2;
}

- (void)p_setupFreeTransformControllerWithGesture:(id)a3
{
  id v5;
  double v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (-[THWFreeTransformController delegate](-[THWFreeTransformableRepGestureTargetHandler ftc](self, "ftc"), "delegate") != (THWFreeTransformControllerDelegate *)self)
  {
    v5 = objc_msgSend(a3, "freeTransformDelegate");
    if (v5 != -[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler p_setupFreeTransformControllerWithGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"), 95, CFSTR("Should have the same FTC"));
    if (objc_msgSend(-[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"), "delegate"))
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler p_setupFreeTransformControllerWithGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"), 96, CFSTR("Free transformer not cleaned up on previous transform"));
    }
    if (objc_msgSend(-[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"), "targetLayer"))
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler p_setupFreeTransformControllerWithGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"), 97, CFSTR("Free transformer not cleaned up on previous transform"));
    }
    -[THWFreeTransformController setDelegate:](-[THWFreeTransformableRepGestureTargetHandler ftc](self, "ftc"), "setDelegate:", self);
    -[THWFreeTransformController setTransformGR:](-[THWFreeTransformableRepGestureTargetHandler ftc](self, "ftc"), "setTransformGR:", a3);
    -[THWFreeTransformController setTargetLayer:](-[THWFreeTransformableRepGestureTargetHandler ftc](self, "ftc"), "setTargetLayer:", -[THWFreeTransformableRep transformLayer](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "transformLayer"));
    v6 = 0.75;
    if ((-[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "isExpanded") & 1) == 0)
    {
      if (-[THWFreeTransformableRep meetsStageDimensionRequirementForExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "meetsStageDimensionRequirementForExpanded"))v6 = 1.25;
      else
        v6 = INFINITY;
    }
    -[THWFreeTransformController setScaleThreshold:](-[THWFreeTransformableRepGestureTargetHandler ftc](self, "ftc"), "setScaleThreshold:", v6);
    if ((-[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "isExpanded") & 1) != 0)v7 = 0;
    else
      v7 = -[THWFreeTransformableRep meetsStageDimensionRequirementForExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "meetsStageDimensionRequirementForExpanded") ^ 1;
    -[THWFreeTransformController setBounceUpOnly:](-[THWFreeTransformableRepGestureTargetHandler ftc](self, "ftc"), "setBounceUpOnly:", v7);
    v8 = -[THWFreeTransformableRep transformLayer](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "transformLayer");
    if (v8)
    {
      v9 = v8;
      v10 = -[THWFreeTransformableRepHandler hostCanvasLayer](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "hostCanvasLayer");
      objc_msgSend(v9, "frame");
      objc_msgSend(v10, "convertRect:fromLayer:", objc_msgSend(v9, "superlayer"), v11, v12, v13, v14);
      objc_msgSend(a3, "recenterOnTargetWithRectInView:");
    }
  }
}

- (void)p_cleanupAfterFreeTransform
{
  -[THWFreeTransformController setDelegate:](-[THWFreeTransformableRepGestureTargetHandler ftc](self, "ftc"), "setDelegate:", 0);
  -[THWFreeTransformController setTargetLayer:](-[THWFreeTransformableRepGestureTargetHandler ftc](self, "ftc"), "setTargetLayer:", 0);
  -[THWFreeTransformController setTransformGR:](-[THWFreeTransformableRepGestureTargetHandler ftc](self, "ftc"), "setTransformGR:", 0);
}

- (BOOL)freeTransformControllerShouldBegin:(id)a3
{
  return 1;
}

- (void)freeTransformControllerWillFadeOutCurtain:(id)a3
{
  if ((objc_opt_respondsToSelector(-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler", a3), "freeTransformWillFadeOutCurtain:expandableRep:") & 1) != 0)-[THWFreeTransformableRepHandler freeTransformWillFadeOutCurtain:expandableRep:](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformWillFadeOutCurtain:expandableRep:", -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"));
}

- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3
{
  return -[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "isExpanded");
}

- (id)curtainColorForFreeTransformController:(id)a3
{
  return -[THWFreeTransformableRepHandler curtainColorForFreeTransform](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler", a3), "curtainColorForFreeTransform");
}

- (CGSize)curtainSizeForFreeTransformController:(id)a3
{
  CGFloat width;
  CGFloat height;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  if (-[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "isExpanded")&& objc_msgSend(-[THWFreeTransformableRepHandler hostCanvasLayer](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "hostCanvasLayer"), "superlayer"))
  {
    objc_msgSend(objc_msgSend(-[THWFreeTransformableRepHandler hostCanvasLayer](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "hostCanvasLayer"), "superlayer"), "frame");
    width = v6;
    height = v7;
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)freeTransformControllerDidBegin:(id)a3
{
  -[THWFreeTransformableRepHandler freeTransformDidBeginWithRep:expandableRep:](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler", a3), "freeTransformDidBeginWithRep:expandableRep:", -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"));
}

- (BOOL)freeTransformControllerShouldUpdateAngleAfterBegin:(id)a3
{
  return -[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "isExpanded");
}

- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THWFreeTransformableRepHandler rectForCompletionAnimationWithRep:](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler", a3), "rectForCompletionAnimationWithRep:", -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)freeTransformControllerDidEnd:(id)a3 passedThreshold:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[THWFreeTransformableRep freeTransformDidEnd](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "freeTransformDidEnd");
  if ((objc_opt_respondsToSelector(-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformDidEndPassedThreshold:") & 1) != 0)-[THWFreeTransformableRep freeTransformDidEndPassedThreshold:](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformDidEndPassedThreshold:", v4);
  -[THWFreeTransformableRepGestureTargetHandler p_cleanupAfterFreeTransform](self, "p_cleanupAfterFreeTransform");
}

- (id)unmovingParentViewForFreeTransformController:(id)a3
{
  return objc_msgSend(-[THWFreeTransformableRep interactiveCanvasController](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "interactiveCanvasController"), "canvasView");
}

- (void)freeTransformControllerDidFinishFreeTransforming:(id)a3 passedThreshold:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  THWFreeTransformableRepHandler *v9;
  THWFreeTransformableRep *v10;
  THWFreeTransformableRep *v11;
  id v12;
  _QWORD v13[6];

  v6 = a4;
  v9 = -[THWFreeTransformableRepGestureTargetHandler handler](self, "handler");
  v10 = -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep");
  v11 = -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep");
  if (v6)
  {
    -[THWFreeTransformableRepHandler freeTransformDidEndWithRep:expandableRep:completionBlock:](v9, "freeTransformDidEndWithRep:expandableRep:completionBlock:", v10, v11, a5);
  }
  else
  {
    -[THWFreeTransformableRepHandler freeTransformDidCancelWithRep:expandableRep:](v9, "freeTransformDidCancelWithRep:expandableRep:", v10, v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_16EE6C;
    v13[3] = &unk_426E78;
    v13[4] = self;
    v13[5] = a5;
    if (objc_msgSend(objc_msgSend(a3, "transformGR"), "state") == &dword_4)
    {
      sub_16EE6C((uint64_t)v13);
    }
    else
    {
      if (!-[THWFreeTransformableRep animationController](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "animationController"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler freeTransformControllerDidFinishFreeTransforming:passedThreshold:completionBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"), 219, CFSTR("invalid nil value for '%s'"), "self.rep.animationController");
      v12 = -[THWFreeTransformableRep animationController](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "animationController");
      objc_msgSend(v12, "setSource:", -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"));
      objc_msgSend(v12, "setDestination:", -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"));
      objc_msgSend(v12, "setHostLayer:", objc_msgSend(objc_msgSend(-[THWFreeTransformableRep interactiveCanvasController](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "interactiveCanvasController"), "layerHost"), "canvasLayer"));
      objc_msgSend(v12, "presentAnimationWithCompletionBlock:overshoot:", v13, -[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "isExpanded") ^ 1);
    }
  }
}

- (BOOL)freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:(id)a3
{
  if ((objc_opt_respondsToSelector(-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "freeTransformShouldMoveAboveStatusBar") & 1) != 0)return -[THWFreeTransformableRep freeTransformShouldMoveAboveStatusBar](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformShouldMoveAboveStatusBar");
  else
    return 1;
}

- (id)freeTransformControllerStyledRep:(id)a3
{
  if ((objc_opt_respondsToSelector(-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "styledRep") & 1) != 0)
    return -[THWFreeTransformableRep styledRep](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "styledRep");
  else
    return 0;
}

- (void)freeTransformControllerWillMoveTargetLayer:(id)a3
{
  if ((objc_opt_respondsToSelector(-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformWillMoveTargetLayer:") & 1) != 0)-[THWFreeTransformableRep freeTransformWillMoveTargetLayer:](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformWillMoveTargetLayer:", a3);
}

- (id)shadowPathForFreeTransformController:(id)a3
{
  return -[THWFreeTransformableRep shadowPath](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "shadowPath");
}

- (BOOL)freeTransformControllerShouldUsedTracedShadowPath:(id)a3
{
  return -[THWFreeTransformableRep freeTransformUseTracedShadowPath](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "freeTransformUseTracedShadowPath");
}

- (BOOL)freeTransformControllerWantsShadow:(id)a3
{
  if ((objc_opt_respondsToSelector(-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "freeTransformWantsShadow") & 1) != 0)return -[THWFreeTransformableRep freeTransformWantsShadow](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformWantsShadow");
  else
    return 1;
}

- (BOOL)freeTransformControllerShouldDelayRecognizeUntilScaleChange:(id)a3
{
  return 1;
}

- (BOOL)freeTransformControllerShouldAllowPinchDown:(id)a3
{
  id v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;

  v4 = -[THWFreeTransformableRepHandler hostCanvasLayer](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler", a3), "hostCanvasLayer");
  v5 = -[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "isExpanded");
  if (v5)
  {
    if (objc_msgSend(v4, "allowsPinchZoom"))
    {
      objc_msgSend(v4, "viewScale");
      v7 = v6;
      objc_msgSend(v4, "minimumPinchViewScale");
      LOBYTE(v5) = vabdd_f64(v7, v8) < 0.00999999978;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)freeTransformControllerShouldAllowPinchUp:(id)a3
{
  return -[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep", a3), "isExpanded") ^ 1;
}

- (BOOL)canHandleGesture:(id)a3
{
  unsigned int v5;
  id v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  THWFreeTransformController *v11;
  id v12;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  double v29;
  id v30;
  double v31;
  THWFreeTransformableRep *v32;
  CGFloat y;
  CGPoint v35;
  CGPoint v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v5 = -[THWFreeTransformableRepGestureTargetHandler interactionEnabled](self, "interactionEnabled");
  if (v5)
  {
    v6 = objc_msgSend(a3, "gestureKind");
    if (v6 != (id)TSDFreeTransform)
    {
LABEL_3:
      LOBYTE(v5) = 0;
      return v5;
    }
    v7 = objc_opt_class(THWFreeTransformGestureRecognizer);
    *(_QWORD *)&v8 = TSUDynamicCast(v7, a3).n128_u64[0];
    v10 = v9;
    if (!v9)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v8), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler canHandleGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"), 328, CFSTR("invalid nil value for '%s'"), "ftgr");
    if (objc_msgSend(v10, "freeTransformDelegate", v8))
    {
      v11 = (THWFreeTransformController *)objc_msgSend(v10, "freeTransformDelegate");
      if (v11 != -[THWFreeTransformableRepGestureTargetHandler ftc](self, "ftc"))
        goto LABEL_3;
    }
    else
    {
      v12 = objc_msgSend(-[THWFreeTransformableRepHandler hostCanvasLayer](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "hostCanvasLayer"), "canvasView");
      -[THWFreeTransformableRep frameInUnscaledCanvas](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "frameInUnscaledCanvas");
      v38 = CGRectInset(v37, -14.0, -14.0);
      x = v38.origin.x;
      y = v38.origin.y;
      width = v38.size.width;
      height = v38.size.height;
      objc_msgSend(-[THWFreeTransformableRep interactiveCanvasController](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "interactiveCanvasController"), "viewScale");
      if (v16 <= 0.0)
        v17 = 1.0;
      else
        v17 = 1.0 / v16;
      objc_msgSend(objc_msgSend(v10, "touch1"), "locationInView:", v12);
      v20 = TSDMultiplyPointScalar(v18, v19, v17);
      v22 = v21;
      objc_msgSend(objc_msgSend(v10, "touch2"), "locationInView:", v12);
      v24 = v23;
      v26 = v25;
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v35.x = v20;
      v35.y = v22;
      if (!CGRectContainsPoint(v39, v35))
        goto LABEL_3;
      v36.x = TSDMultiplyPointScalar(v24, v26, v17);
      v36.y = v27;
      v40.origin.x = x;
      v40.size.height = height;
      v40.origin.y = y;
      v40.size.width = width;
      v5 = CGRectContainsPoint(v40, v36);
      if (!v5)
        return v5;
    }
    if ((-[THWFreeTransformableRep meetsStageDimensionRequirementForExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "meetsStageDimensionRequirementForExpanded") & 1) == 0&& (-[THWFreeTransformableRep isExpanded](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "isExpanded") & 1) == 0)
    {
      v28 = objc_opt_class(THWFreeTransformGestureRecognizer);
      *(_QWORD *)&v29 = TSUDynamicCast(v28, a3).n128_u64[0];
      objc_msgSend(v30, "scale", v29);
      if (v31 <= 1.0)
        goto LABEL_3;
    }
    if ((objc_opt_respondsToSelector(-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformMayBeginOverRep:") & 1) != 0)
    {
      v32 = -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep");
      objc_msgSend(a3, "naturalLocationForRep:", -[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"));
      LOBYTE(v5) = -[THWFreeTransformableRep freeTransformMayBeginOverRep:](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformMayBeginOverRep:", -[THWFreeTransformableRep hitRep:](v32, "hitRep:"));
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)handleGesture:(id)a3
{
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  unsigned int v11;

  v5 = -[THWFreeTransformableRepGestureTargetHandler interactionEnabled](self, "interactionEnabled");
  if (v5)
  {
    v6 = objc_msgSend(a3, "gestureKind");
    if (v6 == (id)TSDFreeTransform)
    {
      v7 = objc_opt_class(THWFreeTransformGestureRecognizer);
      *(_QWORD *)&v9 = TSUDynamicCast(v7, a3).n128_u64[0];
      if (v8)
      {
        v10 = v8;
        v11 = objc_msgSend(a3, "gestureState", v9);
        if (v11 == 1)
        {
          if ((objc_opt_respondsToSelector(-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformWillBegin") & 1) != 0)-[THWFreeTransformableRep freeTransformWillBegin](-[THWFreeTransformableRepGestureTargetHandler rep](self, "rep"), "freeTransformWillBegin");
          -[THWFreeTransformableRepGestureTargetHandler p_setupFreeTransformControllerWithGesture:](self, "p_setupFreeTransformControllerWithGesture:", v10);
        }
        objc_msgSend(-[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"), "transformGRChanged:", v10);
        if (v11 - 3 <= 1)
        {
          objc_msgSend(objc_msgSend(-[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"), "transformGR"), "setFreeTransformDelegate:", 0);
          objc_msgSend(-[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"), "setTransformGR:", 0);
        }
      }
      else
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v9), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler handleGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"), 381, CFSTR("Unkonwn free transform gesture."));
      }
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDFreeTransform)
  {
    v6 = objc_opt_class(THWFreeTransformGestureRecognizer);
    *(_QWORD *)&v7 = TSUDynamicCast(v6, a3).n128_u64[0];
    v9 = v8;
    if (!v8)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v7), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"), 421, CFSTR("invalid nil value for '%s'"), "ftgr");
    if (objc_msgSend(v9, "freeTransformDelegate", v7))
    {
      v10 = objc_msgSend(v9, "freeTransformDelegate");
      if (v10 != -[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformableRepGestureTargetHandler.m"), 422, CFSTR("Overriding existing delegate."));
    }
    objc_msgSend(v9, "setFreeTransformDelegate:", -[THWFreeTransformableRepHandler freeTransformController](-[THWFreeTransformableRepGestureTargetHandler handler](self, "handler"), "freeTransformController"));
  }
}

- (THWFreeTransformableRep)rep
{
  return self->_rep;
}

- (void)setRep:(id)a3
{
  self->_rep = (THWFreeTransformableRep *)a3;
}

- (THWFreeTransformableRepHandler)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  self->_handler = (THWFreeTransformableRepHandler *)a3;
}

@end
