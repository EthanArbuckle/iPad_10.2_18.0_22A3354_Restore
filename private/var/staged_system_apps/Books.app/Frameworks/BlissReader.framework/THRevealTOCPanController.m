@implementation THRevealTOCPanController

- (THRevealTOCPanController)initWithDelegate:(id)a3 interactiveCanvasController:(id)a4
{
  THRevealTOCPanController *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THRevealTOCPanController;
  result = -[THRevealTOCPanController init](&v7, "init");
  if (result)
  {
    result->_delegate = (THRevealTOCDelegate *)a3;
    result->_icc = (THInteractiveCanvasController *)a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_pageLayout || self->_startContentLocation || self->_targetContentLocation)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THRevealTOCPanController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THRevealTOCPanController.m"), 50, CFSTR("these should have been released when the pan ended"));
  v3.receiver = self;
  v3.super_class = (Class)THRevealTOCPanController;
  -[THRevealTOCPanController dealloc](&v3, "dealloc");
}

- (BOOL)wantsToHandlePanInDirection:(CGPoint)a3
{
  double y;
  BOOL result;

  y = a3.y;
  result = -[THRevealTOCDelegate canRevealTOC](self->_delegate, "canRevealTOC", a3.x);
  if (y <= 0.6)
    return 0;
  return result;
}

- (void)guidedPanWillBeginAtPoint:(CGPoint)a3 withCenterPoint:(CGPoint)a4
{
  double y;
  double x;
  THPageLayout *pageLayout;
  THInteractiveCanvasController *icc;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  THInteractiveCanvasController *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  TSDContentLocation *v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  CGRect v40;
  CGRect v41;

  y = a4.y;
  x = a4.x;
  -[THRevealTOCDelegate willRevealTOC](self->_delegate, "willRevealTOC", a3.x, a3.y);
  v38 = x;
  v39 = y;
  pageLayout = (THPageLayout *)objc_msgSend(objc_msgSend(-[THInteractiveCanvasController hitRep:allowsAllReps:](self->_icc, "hitRep:allowsAllReps:", 1, x, y), "layout"), "pageLayout");
  self->_pageLayout = pageLayout;
  if (!pageLayout)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THRevealTOCPanController guidedPanWillBeginAtPoint:withCenterPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THRevealTOCPanController.m"), 71, CFSTR("invalid nil value for '%s'"), "_pageLayout");
    pageLayout = self->_pageLayout;
  }
  icc = self->_icc;
  -[THPageLayout frameInRoot](pageLayout, "frameInRoot");
  -[THInteractiveCanvasController convertUnscaledToBoundsRect:](icc, "convertUnscaledToBoundsRect:");
  v36 = v10;
  v37 = v9;
  v12 = v11;
  v14 = v13;
  -[THRevealTOCDelegate pageTargetRectForRevealingTOC](self->_delegate, "pageTargetRectForRevealingTOC");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[THInteractiveCanvasController viewScale](self->_icc, "viewScale");
  v40.origin.x = v16;
  v40.origin.y = v18;
  v40.size.width = v20;
  v40.size.height = v22;
  CGRectGetWidth(v40);
  v41.origin.y = v36;
  v41.origin.x = v37;
  v41.size.width = v12;
  v41.size.height = v14;
  CGRectGetWidth(v41);
  v23 = self->_icc;
  v24 = TSDCenterOfRect(v16, v18, v20, v22);
  -[THInteractiveCanvasController contentPlacementForPoint:inView:](v23, "contentPlacementForPoint:inView:", -[THRevealTOCDelegate unmovingViewForRevealingTOC](self->_delegate, "unmovingViewForRevealingTOC"), v24, v25);
  v27 = v26;
  v29 = v28;
  -[THPageLayout frameInRoot](self->_pageLayout, "frameInRoot");
  v34 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", TSDCenterOfRect(v30, v31, v32, v33));
  if (self->_targetContentLocation)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THRevealTOCPanController guidedPanWillBeginAtPoint:withCenterPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THRevealTOCPanController.m"), 80, CFSTR("expected nil value for '%s'"), "_targetContentLocation");
  self->_targetContentLocation = (TSDContentLocation *)-[THInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](self->_icc, "convertContentLocation:fromPlacement:toPlacement:", v34, v27, v29, kTSDContentPlacementCenter.var0.x, kTSDContentPlacementCenter.var0.y);
  -[THInteractiveCanvasController viewScale](self->_icc, "viewScale");
  self->_startContentLocation = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v38, v39, v35);
}

- (id)p_contentLocationForMovement:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  __n128 v8;
  __n128 v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_icc, "convertBoundsToUnscaledPoint:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[TSDContentLocation unscaledPoint](self->_startContentLocation, "unscaledPoint");
  v10 = TSDSubtractPoints(v8, v9, v5, v7);
  v12 = v11;
  -[TSDContentLocation viewScale](self->_startContentLocation, "viewScale");
  return +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v10, v12, v13);
}

- (double)p_shrinkAmountForMovement:(CGPoint)a3
{
  id v4;
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

  v4 = -[THRevealTOCPanController p_contentLocationForMovement:](self, "p_contentLocationForMovement:", a3.x, a3.y);
  -[TSDContentLocation unscaledPoint](self->_startContentLocation, "unscaledPoint");
  v6 = v5;
  -[TSDContentLocation unscaledPoint](self->_targetContentLocation, "unscaledPoint");
  v8 = v6 - v7;
  if (v6 - v7 <= 0.0)
    return 0.0;
  objc_msgSend(v4, "unscaledPoint");
  v10 = v9;
  -[TSDContentLocation unscaledPoint](self->_startContentLocation, "unscaledPoint");
  if (v10 >= v11)
    return 0.0;
  -[TSDContentLocation unscaledPoint](self->_startContentLocation, "unscaledPoint");
  v13 = v12;
  objc_msgSend(v4, "unscaledPoint");
  return fmin((v13 - v14) / v8, 1.0);
}

- (id)contentLocationForMovement:(CGPoint)a3 velocity:(CGPoint)a4 placement:(id *)a5 currentLocation:(id)a6
{
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;

  y = a3.y;
  x = a3.x;
  v10 = -[THRevealTOCPanController p_contentLocationForMovement:](self, "p_contentLocationForMovement:", a5, a6, a3.x, a3.y, a4.x, a4.y);
  -[THRevealTOCPanController p_shrinkAmountForMovement:](self, "p_shrinkAmountForMovement:", x, y);
  v12 = v11;
  if (v11 != 0.0)
  {
    -[TSDContentLocation viewScale](self->_startContentLocation, "viewScale");
    v14 = v13;
    v15 = -[TSDContentLocation viewScale](self->_targetContentLocation, "viewScale");
    objc_msgSend(v10, "setViewScale:", TSDInterpolateFloats(v15, v14, v16, v12));
  }
  -[THRevealTOCDelegate revealTOCByAmount:](self->_delegate, "revealTOCByAmount:", v12);
  *a5 = kTSDContentPlacementCenter;
  return v10;
}

- (id)completionAnimationFromContentLocation:(id)a3 movement:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y;
  double v8;
  BOOL v9;
  TSDContentLocation **p_startContentLocation;
  int v11;
  TSDContentLocation *v12;
  id v13;
  THRevealTOCDelegate *delegate;
  BOOL v15;

  y = a5.y;
  -[THRevealTOCPanController p_shrinkAmountForMovement:](self, "p_shrinkAmountForMovement:", a4.x, a4.y, a5.x);
  if (y <= 100.0 && (y >= -100.0 ? (v9 = v8 <= 0.300000012) : (v9 = 1), v9))
  {
    v11 = 0;
    p_startContentLocation = &self->_startContentLocation;
  }
  else
  {
    p_startContentLocation = &self->_targetContentLocation;
    v11 = 1;
  }
  v12 = *p_startContentLocation;
  v13 = +[TSDContentPathAnimation animation](TSDContentPathAnimation, "animation");
  objc_msgSend(v13, "setDuration:", 0.25);
  objc_msgSend(v13, "setContentLocations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, v12, 0));
  objc_msgSend(v13, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  delegate = self->_delegate;
  if (v11)
  {
    v15 = 1;
    -[THRevealTOCDelegate revealTOCAnimated:duration:](delegate, "revealTOCAnimated:duration:", 1, 0.25);
  }
  else
  {
    -[THRevealTOCDelegate unrevealTOCAnimated:duration:](delegate, "unrevealTOCAnimated:duration:", 1, 0.25);
    v15 = 0;
  }
  self->_animatingToTOC = v15;
  return v13;
}

- (void)guidedPanDidFinishCompletionAnimation
{
  if (self->_animatingToTOC)
    -[THRevealTOCDelegate didRevealTOC](self->_delegate, "didRevealTOC");
}

- (BOOL)guidedPanShouldPreserveCompletionAnimationEndLocation
{
  return 0;
}

- (void)guidedPanDidEnd
{
  -[THRevealTOCDelegate endRevealTOC](self->_delegate, "endRevealTOC");

  self->_pageLayout = 0;
  self->_startContentLocation = 0;

  self->_targetContentLocation = 0;
}

- (CGPoint)startCenterPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startCenterPoint.x;
  y = self->_startCenterPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartCenterPoint:(CGPoint)a3
{
  self->_startCenterPoint = a3;
}

- (THRevealTOCDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THRevealTOCDelegate *)a3;
}

- (THInteractiveCanvasController)icc
{
  return self->_icc;
}

- (void)setIcc:(id)a3
{
  self->_icc = (THInteractiveCanvasController *)a3;
}

- (THPageLayout)pageLayout
{
  return self->_pageLayout;
}

- (void)setPageLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (TSDContentLocation)startContentLocation
{
  return self->_startContentLocation;
}

- (void)setStartContentLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (TSDContentLocation)targetContentLocation
{
  return self->_targetContentLocation;
}

- (void)setTargetContentLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)animatingToTOC
{
  return self->_animatingToTOC;
}

- (void)setAnimatingToTOC:(BOOL)a3
{
  self->_animatingToTOC = a3;
}

@end
