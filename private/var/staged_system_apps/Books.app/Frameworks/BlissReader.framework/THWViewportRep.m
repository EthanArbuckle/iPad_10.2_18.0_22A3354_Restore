@implementation THWViewportRep

- (THWViewportRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWViewportRep *v4;
  THWViewportRep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWViewportRep;
  v4 = -[THWViewportRep initWithLayout:canvas:](&v7, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4 && objc_msgSend(-[THWViewportRep layout](v4, "layout"), "isExpanded"))
    v5->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v5, objc_msgSend(objc_msgSend(-[THWViewportRep hostICC](v5, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
  return v5;
}

- (void)dealloc
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[THWViewportRep childReps](self, "childReps");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "setParentRep:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[THWViewportRep setChildReps:](self, "setChildReps:", 0);
  -[THWViewportRep setScrollableCanvasController:](self, "setScrollableCanvasController:", 0);

  self->_pressableHandler = 0;
  self->_freeTransformableHandler = 0;

  self->_animationController = 0;
  v8.receiver = self;
  v8.super_class = (Class)THWViewportRep;
  -[THWViewportRep dealloc](&v8, "dealloc");
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  uint64_t v3;
  double v4;
  id v5;
  id v6;
  THWPressableRepGestureTargetHandler *v7;

  if (!self->_pressableHandler)
  {
    v3 = objc_opt_class(THInteractiveCanvasController);
    *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
    v6 = objc_msgSend(v5, "pressHandlerForPressableReps", v4);
    if (v6)
    {
      v7 = -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", self, v6);
      self->_pressableHandler = v7;
      -[THWPressableRepGestureTargetHandler setEnabledOnlyIfWidgetInteractionDisabledOnPage:](v7, "setEnabledOnlyIfWidgetInteractionDisabledOnPage:", 1);
    }
  }
  return self->_pressableHandler;
}

- (void)viewScrollWillChange
{
  -[THWScrollableCanvasController setRasterize:](self->_scrollableCanvasController, "setRasterize:", 1);
}

- (void)viewScrollingEnded
{
  -[THWScrollableCanvasController setRasterize:](self->_scrollableCanvasController, "setRasterize:", 0);
}

- (void)expandedViewControllerWillPresent:(id)a3
{
  -[THInteractiveCanvasController endEditing](-[THWScrollableCanvasController interactiveCanvasController](-[THWViewportRep scrollableCanvasController](self, "scrollableCanvasController", a3), "interactiveCanvasController"), "endEditing");
}

- (void)updateChildrenFromLayout
{
  -[THWViewportRep setChildReps:](self, "setChildReps:", +[TSDContainerRep childrenFromLayoutInContainerRep:](TSDContainerRep, "childrenFromLayoutInContainerRep:", self));
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  return +[TSDContainerRep containerRep:hitRep:withGesture:passingTest:](TSDContainerRep, "containerRep:hitRep:withGesture:passingTest:", self, a4, a5, a3.x, a3.y);
}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  uint64_t v6;
  double v7;
  id v8;
  THWScrollableCanvasController *v9;

  self->_scrollableCanvasController = 0;
  v6 = objc_opt_class(THWScrollableCanvasControlRep);
  *(_QWORD *)&v7 = TSUDynamicCast(v6, a4).n128_u64[0];
  v9 = (THWScrollableCanvasController *)objc_msgSend(v8, "scrollableCanvasController", v7);
  self->_scrollableCanvasController = v9;
  -[THWScrollableCanvasController setDelegate:](v9, "setDelegate:", self);
  -[THWScrollableCanvasController setUpdateCanvasSizeOnLayout:](self->_scrollableCanvasController, "setUpdateCanvasSizeOnLayout:", 1);
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  -[THWScrollableCanvasController setDelegate:](self->_scrollableCanvasController, "setDelegate:", 0, a4);

  self->_scrollableCanvasController = 0;
}

- (CALayer)pressableAnimationLayer
{
  return (CALayer *)-[TSKScrollView layer](-[THWScrollableCanvasController scrollView](-[THWViewportRep scrollableCanvasController](self, "scrollableCanvasController"), "scrollView"), "layer");
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  return -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWViewportRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage");
}

- (BOOL)wantsPressAction
{
  _BOOL4 v3;

  if (-[THWViewportRep meetsStageDimensionRequirementForExpanded](self, "meetsStageDimensionRequirementForExpanded")
    || (v3 = -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWViewportRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage")))
  {
    LOBYTE(v3) = -[THWViewportRep pressableAction](self, "pressableAction") != 0;
  }
  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return objc_msgSend(-[THWViewportRep layout](self, "layout", a3), "isExpanded") ^ 1;
}

- (int)pressableAction
{
  return 2;
}

- (BOOL)canHandleGesture:(id)a3
{
  if (-[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3))
  {
    return 1;
  }
  else
  {
    return -[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWViewportRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3);
  }
}

- (BOOL)handleGesture:(id)a3
{
  if (-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWViewportRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3)&& -[THWPressableRepGestureTargetHandler handleGesture:](-[THWViewportRep pressableHandler](self, "pressableHandler"), "handleGesture:", a3))
  {
    return 1;
  }
  else
  {
    return -[THWFreeTransformableRepGestureTargetHandler handleGesture:](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "handleGesture:", a3);
  }
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDFreeTransform)
    -[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "willBeginHandlingGesture:", a3);
}

- (BOOL)isExpanded
{
  return objc_msgSend(-[THWViewportRep layout](self, "layout"), "isExpanded");
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  return 1;
}

- (id)shadowPath
{
  return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 1;
}

- (BOOL)isFreeTransformInProgress
{
  return -[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
}

- (void)freeTransformWillBegin
{
  -[CALayer removeAllAnimations](-[THWViewportRep pressableAnimationLayer](self, "pressableAnimationLayer"), "removeAllAnimations");
  objc_msgSend(-[TSKScrollView layer](-[THWScrollableCanvasController scrollView](-[THWViewportRep scrollableCanvasController](self, "scrollableCanvasController"), "scrollView"), "layer"), "setBackgroundColor:", objc_msgSend(objc_msgSend(-[THWViewportRep expandedBackgroundColor](self, "expandedBackgroundColor"), "platformColor"), "CGColor"));
  -[TSKScrollView setClipsToBounds:](-[THWScrollableCanvasController scrollView](-[THWViewportRep scrollableCanvasController](self, "scrollableCanvasController"), "scrollView"), "setClipsToBounds:", 1);
}

- (void)freeTransformDidEnd
{
  objc_msgSend(-[TSKScrollView layer](-[THWScrollableCanvasController scrollView](-[THWViewportRep scrollableCanvasController](self, "scrollableCanvasController"), "scrollView"), "layer"), "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
  -[TSKScrollView setClipsToBounds:](-[THWScrollableCanvasController scrollView](-[THWViewportRep scrollableCanvasController](self, "scrollableCanvasController"), "scrollView"), "setClipsToBounds:", 0);
}

- (CGRect)rectForCompletion
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THWViewportRep layout](self, "layout"), "frameInParent");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)shadowAnimationLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    return -[THWFreeTransformController shadowLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "shadowLayer");
  }
  else
  {
    return 0;
  }
}

- (id)animationLayer
{
  id result;

  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))return -[TSKScrollView layer](-[THWScrollableCanvasController scrollView](-[THWViewportRep scrollableCanvasController](self, "scrollableCanvasController"), "scrollView"), "layer");
  result = -[THWFreeTransformController freeTransformLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "freeTransformLayer");
  if (!result)
    return -[TSKScrollView layer](-[THWScrollableCanvasController scrollView](-[THWViewportRep scrollableCanvasController](self, "scrollableCanvasController"), "scrollView"), "layer");
  return result;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (CGAffineTransform)freeTransform
{
  __int128 v5;
  CGAffineTransform *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  result = (CGAffineTransform *)-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
  if ((_DWORD)result)
  {
    result = -[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc");
    if (result)
    {
      result = (CGAffineTransform *)-[CGAffineTransform currentTransform](result, "currentTransform");
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    v7 = v9;
    *(_OWORD *)&retstr->a = v8;
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = v10;
  }
  return result;
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 1;
}

- (id)targetLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress")&& !-[THWFreeTransformController passedThreshold](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "passedThreshold"))
  {
    return 0;
  }
  else
  {
    return -[THWViewportRep animationLayer](self, "animationLayer");
  }
}

- (CGRect)ftcTargetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    -[THWFreeTransformController completionTargetRect](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWViewportRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "completionTargetRect");
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)shouldAnimateToFit
{
  return objc_msgSend(-[THWViewportRep layout](self, "layout"), "isExpanded");
}

- (THAnimationController)animationController
{
  THAnimationController *result;
  THAnimationController *v4;

  result = self->_animationController;
  if (!result)
  {
    v4 = objc_alloc_init(THAnimationController);
    self->_animationController = v4;
    -[THAnimationController addObserver:](v4, "addObserver:", self);
    -[THAnimationController setSource:](self->_animationController, "setSource:", self);
    return self->_animationController;
  }
  return result;
}

- (void)animationControllerDidPresent:(id)a3
{

  self->_animationController = 0;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  return 0;
}

- (id)expandedChildInfosForPanel:(int)a3
{
  return 0;
}

- (BOOL)expandedContentAllowPinchZoom
{
  return 0;
}

- (BOOL)expandedContentAllowDoubleTapZoom
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 2;
}

- (id)expandedBackgroundColor
{
  id v3;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;

  v3 = objc_msgSend(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "themeProvider");
  if (v3 && objc_msgSend(v3, "forceThemeColors"))
    return +[TSUColor colorWithCGColor:](TSUColor, "colorWithCGColor:", objc_msgSend(objc_msgSend(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "themeProvider"), "backgroundColor"));
  v5 = objc_opt_class(TSDColorFill);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(objc_msgSend(objc_msgSend(-[THWViewportRep info](self, "info"), "backgroundShape"), "style"), "valueForProperty:", 516)).n128_u64[0];
  v8 = v7;
  if (!v7)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v6), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWViewportRep expandedBackgroundColor]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Viewport/THWViewportRep.m"), 493, CFSTR("viewport widget must have a background color"));
  return objc_msgSend(v8, "color", v6);
}

- (int)autoRotationMode
{
  return 0;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  width = a4.width;
  objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout", a3.width, a3.height, a4.width, a4.height), "info"), "canvasSize");
  v7 = v6;
  objc_msgSend(-[THWViewportRep info](self, "info"), "contentPadding");
  v9 = v8;
  -[THInteractiveCanvasController viewScale](-[THWScrollableCanvasController interactiveCanvasController](-[THWViewportRep scrollableCanvasController](self, "scrollableCanvasController"), "interactiveCanvasController"), "viewScale");
  v11 = v7 * v10;
  v12 = width + v9 * -2.0;
  if (v12 >= v7)
    v12 = v7;
  return v12 / v11;
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5
{
  objc_msgSend(-[THWViewportRep layout](self, "layout", a3.width, a3.height, a4.width, a4.height, a5), "invalidateFrame");
  objc_msgSend(-[THWViewportRep layout](self, "layout"), "invalidateChildren");
  objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
}

- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController", a3.width, a3.height, a4.width, a4.height), "setViewScale:", 1.0);
}

- (void)expandedDidTransitionToSize:(CGSize)a3
{
  objc_msgSend(-[THWViewportRep layout](self, "layout", a3.width, a3.height), "invalidateFrame");
  objc_msgSend(-[THWViewportRep layout](self, "layout"), "invalidateChildren");
}

- (CGSize)sizeOfCanvasForScrollableCanvasController:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout", a3), "info"), "canvasSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)infosChangeForViewportChangeInScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)scrollableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4
{
  return objc_msgSend(-[THWViewportRep info](self, "info", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "canvasInfos");
}

- (UIEdgeInsets)contentInsetsForScrollableCanvasController:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  objc_msgSend(-[THWViewportRep info](self, "info", a3), "contentPadding");
  v5 = v4;
  objc_msgSend(-[THWViewportRep canvas](self, "canvas"), "viewScale");
  v7 = v5 * v6;
  v8 = -[THWViewportRep isExpanded](self, "isExpanded");
  v9 = fmax(v7, 20.0);
  if (v8)
    v10 = v9;
  else
    v10 = v7;
  v11 = v7;
  v12 = v7;
  v13 = v10;
  result.right = v13;
  result.bottom = v12;
  result.left = v10;
  result.top = v11;
  return result;
}

- (id)scrollableCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  id v6;
  void *v7;

  v6 = (id)TSUProtocolCast(&OBJC_PROTOCOL___TSDGestureTarget, objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController", a3), "delegate"));
  v7 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSDInteractiveCanvasControllerDelegate, objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  if ((objc_msgSend(v6, "canHandleGesture:", a4) & 1) != 0)
  {
LABEL_4:
    if (v6)
      return v6;
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector(v7, "interactiveCanvasController:primaryTargetForGesture:") & 1) != 0)
  {
    v6 = objc_msgSend(v7, "interactiveCanvasController:primaryTargetForGesture:", -[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), a4);
    goto LABEL_4;
  }
LABEL_5:
  if (-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWViewportRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a4))
  {
    return -[THWViewportRep pressableHandler](self, "pressableHandler");
  }
  return 0;
}

- (id)scrollableCanvasHost
{
  return objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "scrollableCanvasHost");
}

- (id)strokeLayerForScrollableCanvasController:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  __int128 v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  _OWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGAffineTransform v31;
  CGAffineTransform v32;

  v4 = objc_msgSend(-[THWViewportRep info](self, "info", a3), "stroke");
  if (!objc_msgSend(v4, "shouldRender")
    || (objc_msgSend(-[THWViewportRep layout](self, "layout"), "isExpanded") & 1) != 0)
  {
    return 0;
  }
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "info"), "backgroundShape"), "pathSource"), "bezierPath"), "copy");
  objc_msgSend(-[THWViewportRep canvas](self, "canvas"), "viewScale");
  v8 = v7;
  objc_msgSend(-[THWViewportRep canvas](self, "canvas"), "viewScale");
  v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v31.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v31.c = v9;
  *(_OWORD *)&v31.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransformScale(&v32, &v31, v8, v10);
  objc_msgSend(v6, "transformUsingAffineTransform:", &v32);
  objc_msgSend(-[THWViewportRep canvas](self, "canvas"), "viewScale");
  *(float *)&v8 = v11;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "info"), "stroke"), "width");
  *(float *)&v13 = v12;
  LODWORD(v12) = LODWORD(v8);
  v14 = objc_msgSend(v6, "aliasedPathWithViewScale:effectiveStrokeWidth:", v12, v13);
  v5 = objc_alloc_init((Class)CAShapeLayer);
  objc_msgSend(v5, "setPath:", objc_msgSend(v14, "CGPath"));
  objc_msgSend(v5, "setFillColor:", 0);
  objc_msgSend(v5, "setDelegate:", +[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance"));
  v15 = objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "info"), "geometry");
  if (v15)
  {
    objc_msgSend(v15, "transformBasedOnPoint:centeredAtPoint:", CGPointZero.x, CGPointZero.y, CGPointZero.x, CGPointZero.y);
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v28 = 0u;
  }
  v27[0] = v28;
  v27[1] = v29;
  v27[2] = v30;
  objc_msgSend(v5, "setAffineTransform:", v27);
  objc_msgSend(-[THWViewportRep canvas](self, "canvas"), "convertUnscaledToBoundsRect:", TSDRectWithSize(objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "geometry"), "size")));
  objc_msgSend(v5, "setBounds:", TSDRoundedRectForMainScreen(v16, v17, v18, v19));
  v20 = -[THWViewportRep canvas](self, "canvas");
  v21 = TSDRectWithSize(objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "geometry"), "size"));
  objc_msgSend(v20, "convertUnscaledToBoundsPoint:", TSDCenterOfRect(v21, v22, v23, v24));
  objc_msgSend(v5, "setPosition:");
  if ((objc_msgSend(v4, "canApplyToShapeRenderable") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWViewportRep strokeLayerForScrollableCanvasController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Viewport/THWViewportRep.m"), 660, CFSTR("don't know how to handle a stroke that can't be applied to a layer"));
  v25 = +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", v5);
  objc_msgSend(-[THWViewportRep canvas](self, "canvas"), "viewScale");
  objc_msgSend(v4, "applyToRepRenderable:withScale:", v25);

  return v5;
}

- (id)maskLayerForScrollableCanvasController:(id)a3
{
  id v4;
  id v5;
  double v6;
  CGFloat v7;
  __int128 v8;
  CGFloat v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform v21;
  CGAffineTransform v22;

  if ((objc_msgSend(-[THWViewportRep layout](self, "layout", a3), "isExpanded") & 1) != 0)
    return 0;
  v5 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THWViewportRep info](self, "info"), "backgroundShape"), "pathSource"), "bezierPath"), "copy");
  objc_msgSend(-[THWViewportRep canvas](self, "canvas"), "viewScale");
  v7 = v6;
  objc_msgSend(-[THWViewportRep canvas](self, "canvas"), "viewScale");
  v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v21.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v21.c = v8;
  *(_OWORD *)&v21.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransformScale(&v22, &v21, v7, v9);
  objc_msgSend(v5, "transformUsingAffineTransform:", &v22);
  v10 = objc_msgSend(v5, "CGPath");
  objc_msgSend(-[THWViewportRep canvas](self, "canvas"), "viewScale");
  v11 = -[THWViewportRep canvas](self, "canvas");
  objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "geometry"), "size");
  v12 = TSDRectWithSize(objc_msgSend(v11, "convertUnscaledToBoundsSize:"));
  v14 = v13;
  v16 = v15;
  objc_msgSend(-[THWViewportRep info](self, "info", v12), "contentPadding");
  v18 = v17;
  objc_msgSend(-[THWViewportRep canvas](self, "canvas"), "viewScale");
  v4 = -[THWViewportRep p_innerMaskLayerWithBounds:path:fadeSizes:maskGroupVerticalInset:](self, "p_innerMaskLayerWithBounds:path:fadeSizes:maskGroupVerticalInset:", v10, TSDRoundedRectForMainScreen(-(v18 * v19), -(v18 * v19), v14, v16), fmax(v18 * v19, 0.0));

  return v4;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  if ((objc_opt_respondsToSelector(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController", a3, a4), "delegate"), "interactiveCanvasController:allowsEditMenuForRep:") & 1) != 0)return objc_msgSend(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"), "interactiveCanvasController:allowsEditMenuForRep:", -[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), self);
  else
    return 1;
}

- (BOOL)scrollableCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  if ((objc_opt_respondsToSelector(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController", a3), "delegate"), "interactiveCanvasController:shouldBeginEditingTHWPRep:withGesture:") & 1) != 0)return objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate")), "interactiveCanvasController:shouldBeginEditingTHWPRep:withGesture:", -[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), a4, a5);
  else
    return 1;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  id v8;

  v8 = objc_msgSend(a4, "gestureKind", a3);
  if ((objc_opt_respondsToSelector(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"), "interactiveCanvasController:allowsHyperlinkWithGesture:forRep:") & 1) != 0)return objc_msgSend(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"), "interactiveCanvasController:allowsHyperlinkWithGesture:forRep:", -[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), a4, a5);
  else
    return v8 == (id)TSWPImmediateSingleTap;
}

- (BOOL)allowSelectionPopover
{
  if ((objc_opt_respondsToSelector(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"), "allowSelectionPopoverForInteractiveCanvasController:") & 1) != 0)return objc_msgSend(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"), "allowSelectionPopoverForInteractiveCanvasController:", -[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController"));
  else
    return 1;
}

- (id)scrollableCanvasController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6
{
  void *v9;

  v9 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSWPInteractiveCanvasControllerDelegate, objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController", a3), "delegate"));
  return objc_msgSend(v9, "actionForHyperlink:inRep:gesture:", a4, a5, a6);
}

- (id)bookNavigatorForScrollableCanvasController:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;

  v4 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, -[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
  return objc_msgSend(v6, "bookNavigator", v5);
}

- (id)documentNavigatorForScrollableCanvasController:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;

  v4 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, -[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
  return objc_msgSend(v6, "documentNavigator", v5);
}

- (BOOL)isRelatedCanvasScrollingForscrollableCanvasController:(id)a3
{
  return objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController", a3), "currentlyScrolling");
}

- (void)scrollableCanvasController:(id)a3 customizeLayerHost:(id)a4
{
  _BOOL8 v6;
  _QWORD block[5];
  _QWORD v8[6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_180DB0;
  v8[3] = &unk_426E28;
  v8[4] = a3;
  v8[5] = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (-[THWViewportRep pressableHandler](self, "pressableHandler"))
      v6 = -[THWPressableRepGestureTargetHandler widgetInteractionEnabled](-[THWViewportRep pressableHandler](self, "pressableHandler"), "widgetInteractionEnabled");
    else
      v6 = 1;
    objc_msgSend(a3, "setUserInteractionEnabled:", v6);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_180DF4;
    block[3] = &unk_427830;
    block[4] = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)deferViewCreationForScrollableCanvasController:(id)a3
{
  return objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController", a3), "currentlyScrolling");
}

- (double)contentsScaleForScrollableCanvasController:(id)a3
{
  double result;

  objc_msgSend(objc_msgSend(-[THWViewportRep interactiveCanvasController](self, "interactiveCanvasController", a3), "canvas"), "contentsScale");
  return result;
}

- (BOOL)scrollableCanvasControllerUseOverlayScrollerOnly:(id)a3
{
  return 1;
}

- (BOOL)centeredInScrollViewForScrollableCanvasController:(id)a3
{
  return objc_msgSend(-[THWViewportRep layout](self, "layout", a3), "isExpanded");
}

- (BOOL)maintainScrollOffsetInFrameChangeForScrollableCanvasController:(id)a3
{
  return objc_msgSend(-[THWViewportRep layout](self, "layout", a3), "isExpanded") ^ 1;
}

- (double)scrollableCanvasController:(id)a3 allowsPinchZoomForFrameSize:(CGSize)a4
{
  return (double)objc_msgSend(-[THWViewportRep layout](self, "layout", a3, a4.width, a4.height), "isExpanded");
}

- (BOOL)scrollableCanvasControllerShouldShowScaleFeedback:(id)a3
{
  return 0;
}

- (double)scrollableCanvasController:(id)a3 viewScaleForFrameSize:(CGSize)a4 withScale:(double)a5
{
  double width;
  double v8;
  double v9;

  width = a4.width;
  if (objc_msgSend(-[THWViewportRep layout](self, "layout", a3, a4.width, a4.height), "isExpanded"))
  {
    objc_msgSend(objc_msgSend(-[THWViewportRep layout](self, "layout"), "info"), "canvasSize");
    if (width != 0.0 && v8 != 0.0)
    {
      v9 = width / v8;
      if (v9 <= 1.0)
        return v9;
      else
        return 1.0;
    }
  }
  return a5;
}

- (double)scrollableCanvasController:(id)a3 minViewScaleForFrameSize:(CGSize)a4
{
  double result;

  -[THWViewportRep scrollableCanvasController:viewScaleForFrameSize:withScale:](self, "scrollableCanvasController:viewScaleForFrameSize:withScale:", a3, a4.width, a4.height, 1.0);
  return result;
}

- (double)scrollableCanvasController:(id)a3 maxViewScaleForFrameSize:(CGSize)a4
{
  unsigned int v4;
  double result;

  v4 = objc_msgSend(-[THWViewportRep layout](self, "layout", a3, a4.width, a4.height), "isExpanded");
  result = 1.0;
  if (v4)
    return 2.0;
  return result;
}

- (BOOL)canExpand
{
  return 0;
}

- (BOOL)expandedShouldDismissOnChangeFromSizeClassPairWithController:(id)a3 flowMode:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  char *v9;
  char *v10;

  v5 = objc_opt_class(UIViewController);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (v6)
  {
    v8 = v6;
    v9 = (char *)objc_msgSend(objc_msgSend(v6, "traitCollection", v7), "horizontalSizeClass");
    v10 = (char *)objc_msgSend(objc_msgSend(v8, "traitCollection"), "verticalSizeClass");
    LOBYTE(v6) = v9 != (_BYTE *)&dword_0 + 1 && v10 != (_BYTE *)&dword_0 + 1;
  }
  return (char)v6;
}

- (id)p_innerMaskLayerWithBounds:(CGRect)a3 path:(CGPath *)a4 fadeSizes:(UIEdgeInsets)a5 maskGroupVerticalInset:(double)a6
{
  double top;
  double height;
  double width;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGContext *v17;
  NSArray *v18;
  CGColorSpace *DeviceRGB;
  CGGradient *v20;
  CGFloat MinY;
  CGFloat MaxY;
  CGFloat v23;
  CGFloat v24;
  CGImage *Image;
  id v26;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double x;
  double y;
  CGPoint v34;
  CGPoint v35;
  CGPoint v36;
  CGPoint v37;
  CGRect BoundingBox;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  rect_8 = a5.bottom;
  rect_16 = a3.size.width;
  top = a5.top;
  height = a3.size.height;
  rect_24 = a3.size.height;
  x = a3.origin.x;
  width = a3.size.width;
  y = a3.origin.y;
  BoundingBox = CGPathGetBoundingBox(a4);
  v10 = TSDRoundedRectForMainScreen(BoundingBox.origin.x, BoundingBox.origin.y + a6, BoundingBox.size.width, BoundingBox.size.height + a6 * -2.0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (CGContext *)TSUCreateRGBABitmapContext(0, width, height, 1.0);
  v18 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.0), "CGColor"), -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 1.0), "CGColor"), 0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v20 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v18, 0);
  CGContextAddPath(v17, a4);
  CGContextClip(v17);
  v39.origin.x = v10;
  v39.origin.y = v12;
  v39.size.width = v14;
  v39.size.height = v16;
  MinY = CGRectGetMinY(v39);
  v40.origin.x = v10;
  v40.origin.y = v12;
  v40.size.width = v14;
  v40.size.height = v16;
  v36.y = top + CGRectGetMinY(v40);
  v34.x = 0.0;
  v36.x = 0.0;
  v34.y = MinY;
  CGContextDrawLinearGradient(v17, v20, v34, v36, 0);
  v41.origin.x = v10;
  v41.origin.y = v12;
  v41.size.width = v14;
  v41.size.height = v16;
  MaxY = CGRectGetMaxY(v41);
  v42.origin.x = v10;
  v42.origin.y = v12;
  v42.size.width = v14;
  v42.size.height = v16;
  v37.y = CGRectGetMaxY(v42) - rect_8;
  v35.x = 0.0;
  v37.x = 0.0;
  v35.y = MaxY;
  CGContextDrawLinearGradient(v17, v20, v35, v37, 0);
  CGContextSetRGBFillColor(v17, 0.0, 0.0, 0.0, 1.0);
  v43.origin.x = v10;
  v43.origin.y = v12;
  v43.size.width = v14;
  v43.size.height = v16;
  rect = CGRectGetMinX(v43);
  v44.origin.x = v10;
  v44.origin.y = v12;
  v44.size.width = v14;
  v44.size.height = v16;
  v23 = top + CGRectGetMinY(v44);
  v45.origin.x = v10;
  v45.origin.y = v12;
  v45.size.width = v14;
  v45.size.height = v16;
  v24 = CGRectGetWidth(v45);
  v46.origin.x = v10;
  v46.origin.y = v12;
  v46.size.width = v14;
  v46.size.height = v16;
  v47.size.height = CGRectGetHeight(v46) - top - rect_8;
  v47.origin.x = rect;
  v47.origin.y = v23;
  v47.size.width = v24;
  CGContextFillRect(v17, v47);
  CGGradientRelease(v20);
  CGColorSpaceRelease(DeviceRGB);
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  v26 = objc_alloc_init((Class)CALayer);
  objc_msgSend(v26, "setFrame:", x, y, rect_16, rect_24);
  objc_msgSend(v26, "setContents:", Image);
  CGImageRelease(Image);
  return v26;
}

- (id)p_outerMaskLayerWithFrame:(CGRect)a3 path:(CGPath *)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = objc_alloc_init((Class)CAShapeLayer);
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  objc_msgSend(v9, "setPath:", a4);
  return v9;
}

- (NSArray)childReps
{
  return self->childReps;
}

- (void)setChildReps:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (BOOL)tracksScore
{
  return self->_tracksScore;
}

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
}

- (THWScrollableCanvasController)scrollableCanvasController
{
  return self->_scrollableCanvasController;
}

- (void)setScrollableCanvasController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (void)setPressableHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

@end
