@implementation THImageRep

- (THImageRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THImageRep *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THImageRep;
  v4 = -[THImageRep initWithLayout:canvas:](&v6, "initWithLayout:canvas:", a3, a4);
  if (v4)
    v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THImageRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_pressableHandler = 0;
  self->_freeTransformableHandler = 0;

  self->_animationController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THImageRep;
  -[THImageRep dealloc](&v3, "dealloc");
}

- (void)didUpdateLayer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THImageRep;
  -[THImageRep didUpdateLayer:](&v8, "didUpdateLayer:");
  if (objc_msgSend(-[THImageRep layout](self, "layout"), "hasAlpha")
    && (v6 = objc_opt_class(THDocumentRoot, v5),
        objc_msgSend(objc_msgSend((id)TSUDynamicCast(v6, objc_msgSend(-[THImageRep canvas](self, "canvas"), "documentRoot")), "themeProvider"), "shouldInvertContent")))
  {
    v7 = +[TSUColor whiteColor](TSUColor, "whiteColor");
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(a3, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));
  if (!UIAccessibilityIsInvertColorsEnabled())
    objc_msgSend(a3, "th_accessibilityUndoInvertColorsIfNecessary");
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (!-[THImageRep createdPressableHandler](self, "createdPressableHandler"))
  {
    -[THImageRep setCreatedPressableHandler:](self, "setCreatedPressableHandler:", 1);
    if (-[THImageRep wantsPressAction](self, "wantsPressAction"))
    {
      v4 = objc_opt_class(THInteractiveCanvasController, v3);
      v5 = objc_msgSend((id)TSUDynamicCast(v4, -[THImageRep interactiveCanvasController](self, "interactiveCanvasController")), "pressHandlerForPressableReps");
      if (v5)
        self->_pressableHandler = -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", self, v5);
    }
  }
  return self->_pressableHandler;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _BOOL4 v6;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  v6 = -[THImageRep p_shouldHitTest](self, "p_shouldHitTest");
  if (v6)
  {
    -[THImageRep naturalBounds](self, "naturalBounds");
    v8.x = x;
    v8.y = y;
    LOBYTE(v6) = CGRectContainsPoint(v9, v8);
  }
  return v6;
}

- (id)p_setupContainerLayer
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
  CGFloat v12;
  double v13;
  CATransform3D v15;
  CATransform3D v16;

  v3 = objc_msgSend(-[THImageRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self);
  v4 = objc_msgSend(-[THImageRep interactiveCanvasController](self, "interactiveCanvasController"), "containerLayerForRep:", self);
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v3, "frame");
  objc_msgSend(v4, "setPosition:", TSDCenterOfRect(v5, v6, v7, v8));
  objc_msgSend(v3, "frame");
  v10 = v9;
  objc_msgSend(v3, "frame");
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v10);
  objc_msgSend(v3, "frame");
  v12 = -v11;
  objc_msgSend(v3, "frame");
  CATransform3DMakeTranslation(&v16, v12, -v13, 0.0);
  v15 = v16;
  objc_msgSend(v4, "setSublayerTransform:", &v15);
  return v4;
}

- (CALayer)pressableAnimationLayer
{
  if (objc_msgSend(-[THImageRep layout](self, "layout"), "isCompactFlowPresentation")
    && objc_msgSend(-[THImageRep layout](self, "layout"), "isReflowablePresentation"))
  {
    return (CALayer *)objc_msgSend(-[THImageRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self);
  }
  else
  {
    return (CALayer *)-[THImageRep p_setupContainerLayer](self, "p_setupContainerLayer");
  }
}

- (BOOL)wantsPressAnimation
{
  return !-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THImageRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress")&& -[THImageRep pressableAction](self, "pressableAction") != 0;
}

- (BOOL)wantsPressAction
{
  return -[THImageRep pressableAction](self, "pressableAction") != 0;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return 1;
}

- (BOOL)p_isInBodyRep
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_opt_class(THFlowBodyRep, a2);
  v4 = TSUDynamicCast(v3, -[THImageRep parentRep](self, "parentRep"));
  v6 = objc_opt_class(THBodyRep, v5);
  return (v4 | TSUDynamicCast(v6, -[THImageRep parentRep](self, "parentRep"))) != 0;
}

- (int)pressableAction
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int result;

  if (-[THImageRep popUpInfo](self, "popUpInfo"))
  {
    v4 = objc_opt_class(THInteractiveCanvasController, v3);
    v5 = (void *)TSUDynamicCast(v4, -[THImageRep interactiveCanvasController](self, "interactiveCanvasController"));
    if ((objc_msgSend(v5, "isCompactWidth") & 1) != 0)
    {
      return 2;
    }
    else if (objc_msgSend(v5, "isCompactHeight"))
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else if (-[THImageRep p_hasHyperlink](self, "p_hasHyperlink"))
  {
    return 3;
  }
  else
  {
    result = -[THImageRep p_isInBodyRep](self, "p_isInBodyRep");
    if (result)
    {
      if (objc_msgSend(-[THImageRep layout](self, "layout"), "isReflowablePresentation"))
        return 2;
      else
        return 0;
    }
  }
  return result;
}

- (id)hitRep:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id result;
  objc_super v7;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  v7.receiver = self;
  v7.super_class = (Class)THImageRep;
  result = -[THImageRep hitRep:](&v7, "hitRep:");
  if (!result)
  {
    if (-[THImageRep p_hasHyperlink](self, "p_hasHyperlink"))
    {
      -[THImageRep naturalBounds](self, "naturalBounds");
      v8.x = x;
      v8.y = y;
      if (CGRectContainsPoint(v9, v8))
        return self;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)pressableMoveToHitTestFront
{
  char v3;

  v3 = TSUPhoneUI(self, a2);
  if (-[THImageRep pressableAction](self, "pressableAction") == 1)
    return 1;
  else
    return v3;
}

- (BOOL)canHandleGesture:(id)a3
{
  unsigned int v5;

  if (-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THImageRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    if (!objc_msgSend(-[THImageRep layout](self, "layout"), "isReflowablePresentation")
      || !-[THImageRep p_isInBodyRep](self, "p_isInBodyRep"))
    {
      v5 = objc_msgSend(-[THImageRep layout](self, "layout"), "isExpanded");
      if (!v5)
        return v5;
      if (-[THImageRep parentRep](self, "parentRep"))
      {
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    LOBYTE(v5) = -[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THImageRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3);
  }
  return v5;
}

- (BOOL)handleGesture:(id)a3
{
  unsigned int v5;

  if (-[THWPressableRepGestureTargetHandler handleGesture:](-[THImageRep pressableHandler](self, "pressableHandler"), "handleGesture:", a3))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    if (!objc_msgSend(-[THImageRep layout](self, "layout"), "isReflowablePresentation")
      || !-[THImageRep p_isInBodyRep](self, "p_isInBodyRep"))
    {
      v5 = objc_msgSend(-[THImageRep layout](self, "layout"), "isExpanded");
      if (!v5)
        return v5;
      if (-[THImageRep parentRep](self, "parentRep"))
      {
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    LOBYTE(v5) = -[THWFreeTransformableRepGestureTargetHandler handleGesture:](-[THImageRep freeTransformableHandler](self, "freeTransformableHandler"), "handleGesture:", a3);
  }
  return v5;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDFreeTransform)
    -[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:](-[THImageRep freeTransformableHandler](self, "freeTransformableHandler"), "willBeginHandlingGesture:", a3);
}

- (BOOL)p_shouldHitTest
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = objc_opt_class(TSDContainerRep, a2);
  v4 = (void *)TSUDynamicCast(v3, -[THImageRep parentRep](self, "parentRep"));
  v6 = objc_opt_class(THFlowBodyRep, v5);
  v7 = TSUDynamicCast(v6, -[THImageRep parentRep](self, "parentRep"));
  v9 = objc_opt_class(THBodyRep, v8);
  v10 = TSUDynamicCast(v9, -[THImageRep parentRep](self, "parentRep"));
  if (objc_msgSend(-[THImageRep info](self, "info"), "popUpInfo")
    || (objc_msgSend(v4, "shouldHitTestChildImageRep:", self) & 1) != 0)
  {
    return 1;
  }
  if (v7 | v10)
    return objc_msgSend(-[THImageRep layout](self, "layout"), "isReflowablePresentation");
  return 0;
}

- (id)p_hyperlink
{
  uint64_t v3;

  v3 = objc_opt_class(TSDDrawableInfo, a2);
  return objc_msgSend((id)TSUDynamicCast(v3, -[THImageRep info](self, "info")), "hyperlinkURL");
}

- (BOOL)p_hasHyperlink
{
  return -[THImageRep p_hyperlink](self, "p_hyperlink") != 0;
}

- (BOOL)isExpanded
{
  return objc_msgSend(-[THImageRep layout](self, "layout"), "isExpanded");
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  double v2;
  double v3;

  objc_msgSend(objc_msgSend(-[THImageRep layout](self, "layout"), "geometry"), "size");
  return v3 < 660.0 || v2 < 960.0;
}

- (id)shadowPath
{
  return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 0;
}

- (BOOL)freeTransformWantsShadow
{
  return 0;
}

- (BOOL)isFreeTransformInProgress
{
  return -[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THImageRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
}

- (void)freeTransformWillBegin
{
  -[CALayer removeAllAnimations](-[THImageRep pressableAnimationLayer](self, "pressableAnimationLayer"), "removeAllAnimations");
}

- (CGRect)rectForCompletion
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THImageRep layout](self, "layout"), "frameInParent");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (id)expandedContentDrawableToPresent
{
  id result;

  if (!-[THImageRep popUpInfo](self, "popUpInfo"))
    return -[THImageRep info](self, "info");
  result = (id)TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, -[THImageRep popUpInfo](self, "popUpInfo"));
  if (!result)
    return -[THImageRep info](self, "info");
  return result;
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

+ (BOOL)expandedAllowsPresentationInExpandedForInfo:(id)a3 isReflowablePresentation:(BOOL)a4
{
  return a4;
}

+ (BOOL)expandableUseContainerForAnimations:(id)a3
{
  return 1;
}

- (void)p_togglePanelDescriptionExpanded
{
  -[THImageRep setPanelDescriptionExpanded:](self, "setPanelDescriptionExpanded:", -[THImageRep panelDescriptionExpanded](self, "panelDescriptionExpanded") ^ 1);
  -[THWExpandedRepController expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:](self->_expandedRepController, "expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:", 1, 1, 0, 0.25);
  -[THWExpandedRepController expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:](self->_expandedRepController, "expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:", 1, 1);
}

- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  if (a3 != 1)
    return 0;
  v7[7] = v4;
  v7[8] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6D7E8;
  v7[3] = &unk_426DD0;
  v7[4] = self;
  return -[THWTapGestureAction initWithAction:]([THWTapGestureAction alloc], "initWithAction:", v7);
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  id v6;

  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    v6 = objc_msgSend(-[THImageRep layout](self, "layout", a3), "layoutController");
    if ((objc_msgSend(v6, "isCompactHeight") & 1) != 0)
    {
      return 2;
    }
    else if (objc_msgSend(v6, "isCompactWidth"))
    {
      return 5;
    }
  }
  return a5;
}

- (int)autoRotationMode
{
  return 3;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  id v9;
  double v10;
  double result;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v9 = -[THImageRep layout](self, "layout");
  objc_msgSend(-[THImageRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
  objc_msgSend(v9, "scaleForCenteredAutoRotateFromSize:toSize:scale:", v7, v6, width, height, v10);
  return result;
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

- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  objc_msgSend(-[THImageRep interactiveCanvasController](self, "interactiveCanvasController", a3.width, a3.height, a4.width, a4.height), "setViewScale:", 1.0);
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  if (!-[THImageRep isFreeTransformInProgress](self, "isFreeTransformInProgress", a3.width, a3.height))
  {
    objc_msgSend(-[THImageRep layout](self, "layout"), "invalidateFrame");
    objc_msgSend(-[THImageRep layout](self, "layout"), "invalidateChildren");
  }
}

- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  objc_msgSend(-[THImageRep interactiveCanvasController](self, "interactiveCanvasController", a3.width, a3.height, a4.width, a4.height), "setViewScale:", 1.0);
}

- (void)animationControllerDidPresent:(id)a3
{

  self->_animationController = 0;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  return objc_msgSend(objc_msgSend(-[THImageRep info](self, "info"), "panelContentProvider"), "panelContentProviderHasContentForPanel:", *(_QWORD *)&a3);
}

- (id)expandedChildInfosForPanel:(int)a3
{
  return objc_msgSend(objc_msgSend(-[THImageRep info](self, "info"), "panelContentProvider"), "panelContentProviderChildInfosForPanel:", *(_QWORD *)&a3);
}

- (BOOL)expandedAspectFillOnPresentIfClose
{
  return objc_msgSend(-[THImageRep layout](self, "layout"), "isIntroMedia");
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  objc_msgSend(-[THImageRep layout](self, "layout", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "invalidateFrame");
}

- (int)expandedAppearance
{
  return -[THImageRep p_imageIsMostlyBlack](self, "p_imageIsMostlyBlack");
}

- (BOOL)p_imageIsMostlyBlack
{
  CGImage *v2;
  CGImageAlphaInfo AlphaInfo;
  CGContext *CurrentContext;
  _BYTE *Data;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  CGSize v12;

  v2 = (CGImage *)-[THImageRep imageRef](self, "imageRef");
  AlphaInfo = CGImageGetAlphaInfo(v2);
  if (AlphaInfo)
  {
    v12.width = 1.0;
    v12.height = 1.0;
    UIGraphicsBeginImageContext(v12);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationMedium);
    -[UIImage drawInRect:blendMode:alpha:](+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v2), "drawInRect:blendMode:alpha:", 17, 0.0, 0.0, 1.0, 1.0, 1.0);
    Data = CGBitmapContextGetData(CurrentContext);
    LOBYTE(v6) = *Data;
    LOBYTE(v7) = Data[1];
    *(double *)&v8 = (double)v7 * 0.7152;
    v9 = *(double *)&v8 + (double)v6 * 0.2126;
    LOBYTE(v8) = Data[2];
    v10 = v9 + (double)v8 * 0.0722;
    UIGraphicsEndImageContext();
    LOBYTE(AlphaInfo) = v10 < 0.05;
  }
  return AlphaInfo;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 0;
}

- (void)didPresentExpanded
{
  objc_msgSend(-[THImageRep layout](self, "layout"), "invalidate");
}

- (BOOL)expandedContentAllowPinchZoom
{
  return 1;
}

- (BOOL)expandedContentAllowDoubleTapZoom
{
  return 1;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  id result;

  if (!-[THImageRep isFreeTransformInProgress](self, "isFreeTransformInProgress"))
    return -[THImageRep pressableAnimationLayer](self, "pressableAnimationLayer");
  result = -[THWFreeTransformController freeTransformLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THImageRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "freeTransformLayer");
  if (!result)
    return -[THImageRep pressableAnimationLayer](self, "pressableAnimationLayer");
  return result;
}

- (id)shadowAnimationLayer
{
  id result;

  if (!-[THImageRep isFreeTransformInProgress](self, "isFreeTransformInProgress"))
    return -[THImageRep pressableAnimationShadowLayer](self, "pressableAnimationShadowLayer");
  result = -[THWFreeTransformController shadowLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THImageRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "shadowLayer");
  if (!result)
    return -[THImageRep pressableAnimationShadowLayer](self, "pressableAnimationShadowLayer");
  return result;
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
  result = (CGAffineTransform *)-[THImageRep isFreeTransformInProgress](self, "isFreeTransformInProgress");
  if ((_DWORD)result)
  {
    result = -[THWFreeTransformableRepGestureTargetHandler ftc](-[THImageRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc");
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
  if (-[THImageRep isFreeTransformInProgress](self, "isFreeTransformInProgress")
    && !-[THWFreeTransformController passedThreshold](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THImageRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "passedThreshold"))
  {
    return 0;
  }
  else
  {
    return -[THImageRep pressableAnimationLayer](self, "pressableAnimationLayer");
  }
}

- (CGRect)ftcTargetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (-[THImageRep isFreeTransformInProgress](self, "isFreeTransformInProgress"))
  {
    -[THWFreeTransformController completionTargetRect](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THImageRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "completionTargetRect");
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

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (void)setPressableHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 840);
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (BOOL)createdPressableHandler
{
  return self->_createdPressableHandler;
}

- (void)setCreatedPressableHandler:(BOOL)a3
{
  self->_createdPressableHandler = a3;
}

- (BOOL)panelDescriptionExpanded
{
  return self->_panelDescriptionExpanded;
}

- (void)setPanelDescriptionExpanded:(BOOL)a3
{
  self->_panelDescriptionExpanded = a3;
}

@end
