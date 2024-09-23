@implementation THWDrawablesWidgetRep

- (THWDrawablesWidgetRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWDrawablesWidgetRep *v4;
  uint64_t v5;
  double v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)THWDrawablesWidgetRep;
  v4 = -[THWDrawablesWidgetRep initWithLayout:canvas:](&v16, "initWithLayout:canvas:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_class(THInteractiveCanvasController);
    *(_QWORD *)&v6 = TSUDynamicCast(v5, -[THWDrawablesWidgetRep interactiveCanvasController](v4, "interactiveCanvasController")).n128_u64[0];
    v8 = objc_msgSend(v7, "pressHandlerForPressableReps", v6);
    if (v8)
      -[THWDrawablesWidgetRep setPressableHandler:](v4, "setPressableHandler:", -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", v4, v8));
    v9 = -[THWDrawablesWidgetRep info](v4, "info");
    if ((objc_msgSend(-[THWDrawablesWidgetRep layout](v4, "layout"), "isExpanded") & 1) != 0
      || !objc_msgSend(v9, "isExpandedOnly")
      || -[THWDrawablesWidgetRep p_expandedStageDrawableWantsFreeTransform](v4, "p_expandedStageDrawableWantsFreeTransform"))
    {
      v4->mFreeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
    }
    v10 = objc_msgSend(-[THWDrawablesWidgetRep layout](v4, "layout"), "actualStageDrawable");
    v11 = objc_msgSend(v10, "repClass");
    if ((objc_opt_respondsToSelector(v11, "expandableUseContainerForAnimations:") & 1) != 0)
    {
      -[THWDrawablesWidgetRep setShouldUseContainerForAnimation:](v4, "setShouldUseContainerForAnimation:", objc_msgSend(v11, "expandableUseContainerForAnimations:", v10));
      if (-[THWDrawablesWidgetRep shouldUseContainerForAnimation](v4, "shouldUseContainerForAnimation"))
      {
        v12 = objc_opt_class(TSDStyledInfo);
        *(_QWORD *)&v13 = TSUDynamicCast(v12, v10).n128_u64[0];
        -[THWDrawablesWidgetRep setAnimationContainerProvidesShadowForAnimation:](v4, "setAnimationContainerProvidesShadowForAnimation:", objc_msgSend(objc_msgSend(v14, "shadow", v13), "isEnabled"));
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mStageChildReps = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWDrawablesWidgetRep;
  -[THWDrawablesWidgetRep dealloc](&v3, "dealloc");
}

- (BOOL)p_isExpanded
{
  return objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "isExpanded");
}

- (BOOL)p_isFreeTransformInProgressOnSourceRep
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = objc_opt_class(THWDrawablesWidgetRep);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWExpandedRepController expandedRepSourceRep](self->_expandedRepController, "expandedRepSourceRep")).n128_u64[0];
  return objc_msgSend(objc_msgSend(objc_msgSend(v5, "freeTransformableHandler", v4), "ftc"), "isFreeTransformInProgress");
}

- (BOOL)p_shouldSuppressRenderingDuringExpansion
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  if (-[THWDrawablesWidgetRep shouldUseContainerForAnimation](self, "shouldUseContainerForAnimation"))
  {
    v3 = objc_opt_class(TSDStyledInfo);
    *(_QWORD *)&v4 = TSUDynamicCast(v3, objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")).n128_u64[0];
    v6 = v5;
    if (objc_msgSend(v5, "stroke", v4))
    {
      if ((objc_msgSend(objc_msgSend(v6, "stroke"), "isFrame") & 1) == 0)
      {
        objc_msgSend(objc_msgSend(v6, "stroke"), "width");
        if (v7 > 1.0)
          return 0;
      }
    }
  }
  if (!-[THWDrawablesWidgetRep p_isExpanding](self, "p_isExpanding"))
    return 0;
  else
    return -[THWDrawablesWidgetRep p_isFreeTransformInProgressOnSourceRep](self, "p_isFreeTransformInProgressOnSourceRep");
}

- (BOOL)p_isExpanding
{
  THWExpandedRepController *expandedRepController;

  expandedRepController = self->_expandedRepController;
  if (expandedRepController)
    LOBYTE(expandedRepController) = -[THWExpandedRepController expandedRepControllerState](expandedRepController, "expandedRepControllerState") == 1;
  return (char)expandedRepController;
}

- (void)p_suppressRendering:(BOOL)a3
{
  objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "setShouldSuppressRendering:animated:", a3, 0);
}

- (id)p_repToAnimate
{
  id result;

  if (!objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")
    || (result = objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable"))) == 0)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWDrawablesWidgetRep p_repToAnimate]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWDrawablesWidgetRep.m"), 180, CFSTR("invalid nil value for '%s'"), "repToAnimate");
    return self;
  }
  return result;
}

- (BOOL)p_expandedStageDrawableWantsFreeTransform
{
  id v3;

  if (objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable")
    && (v3 = objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable"), "repClass"), objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___THWExpandedRep))&& (objc_opt_respondsToSelector(v3, "expandedAllowsFreeTransformForInfo:") & 1) != 0)
  {
    return objc_msgSend(v3, "expandedAllowsFreeTransformForInfo:", objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable"));
  }
  else
  {
    return 0;
  }
}

- (BOOL)shouldHitTestChildImageRep:(id)a3
{
  return 1;
}

- (unint64_t)hitTestOptions
{
  return 4;
}

- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4
{
  id v7;

  v7 = objc_msgSend(a3, "gestureKind");
  if (v7 == (id)TSDFreeTransform)
    return 1;
  else
    return -[THWPressableRepGestureTargetHandler canHandleGesture:forChildRep:](-[THWDrawablesWidgetRep pressableHandler](self, "pressableHandler"), "canHandleGesture:forChildRep:", a3, a4);
}

- (id)p_setupContainerLayer
{
  id v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CATransform3D v16;
  CATransform3D v17;

  v3 = -[THWDrawablesWidgetRep p_repToAnimate](self, "p_repToAnimate");
  v4 = objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", v3);
  v5 = objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "containerLayerForRep:", v3);
  objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v4, "frame");
  objc_msgSend(v5, "setPosition:", TSDCenterOfRect(v6, v7, v8, v9));
  objc_msgSend(v4, "frame");
  v11 = v10;
  objc_msgSend(v4, "frame");
  objc_msgSend(v5, "setBounds:", 0.0, 0.0, v11);
  objc_msgSend(v4, "frame");
  v13 = -v12;
  objc_msgSend(v4, "frame");
  CATransform3DMakeTranslation(&v17, v13, -v14, 0.0);
  v16 = v17;
  objc_msgSend(v5, "setSublayerTransform:", &v16);
  return v5;
}

- (CALayer)pressableAnimationLayer
{
  if (-[THWDrawablesWidgetRep shouldUseContainerForAnimation](self, "shouldUseContainerForAnimation"))
    return (CALayer *)-[THWDrawablesWidgetRep p_setupContainerLayer](self, "p_setupContainerLayer");
  else
    return (CALayer *)objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", -[THWDrawablesWidgetRep p_repToAnimate](self, "p_repToAnimate"));
}

- (CALayer)pressableAnimationShadowLayer
{
  if (-[THWDrawablesWidgetRep shouldUseContainerForAnimation](self, "shouldUseContainerForAnimation"))
    return 0;
  else
    return (CALayer *)-[THWDrawablesWidgetRep sourceShadowLayer](self, "sourceShadowLayer");
}

- (int)pressableAction
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWDrawablesWidgetRep;
  return -[THWDrawablesWidgetRep pressableAction](&v3, "pressableAction");
}

- (BOOL)wantsPressAnimation
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress")|| !-[THWDrawablesWidgetRep meetsStageDimensionRequirementForExpanded](self, "meetsStageDimensionRequirementForExpanded"))
  {
    return 0;
  }
  else
  {
    return objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")), "allowsAction:", -[THWDrawablesWidgetRep pressableAction](self, "pressableAction"));
  }
}

- (BOOL)wantsPressAction
{
  unsigned int v3;

  v3 = -[THWDrawablesWidgetRep meetsStageDimensionRequirementForExpanded](self, "meetsStageDimensionRequirementForExpanded");
  if (v3)
    LOBYTE(v3) = objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")), "allowsAction:", -[THWDrawablesWidgetRep pressableAction](self, "pressableAction"));
  return v3;
}

- (BOOL)pIsChildInfo:(id)a3 inContainerInfo:(id)a4
{
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;

  if (!a3)
    return 0;
  v5 = a3;
  do
  {
    v6 = v5 == a4;
    v7 = objc_msgSend(v5, "parentInfo");
    if (!v7)
      break;
    v8 = v5 == a4;
    v5 = v7;
  }
  while (!v8);
  return v6;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  BOOL v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = objc_msgSend(a3, "info");
  if (v5 == objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "adornmentInfo"), "background"))
  {
    objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "geometry"), "size");
    v7 = v6;
    v9 = v8;
    objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "adornmentInfo"), "background"), "geometry"), "size");
    if (v7 == v11 && v9 == v10)
    {
      objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "adornmentInfo"), "background"), "geometry"), "position");
      v15 = v14 == CGPointZero.x && v13 == CGPointZero.y;
      if (v15
        && (objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")), "allowsAction:", -[THWDrawablesWidgetRep pressableAction](self, "pressableAction")) & 1) != 0)
      {
        return 1;
      }
    }
  }
  v16 = objc_msgSend(a3, "info");
  if (v16 == objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable"))
    return 1;
  v17 = objc_msgSend(a3, "info");
  v18 = TSUProtocolCast(&OBJC_PROTOCOL___TSDContainerInfo, objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable"));
  return -[THWDrawablesWidgetRep pIsChildInfo:inContainerInfo:](self, "pIsChildInfo:inContainerInfo:", v17, v18);
}

- (CGRect)pressableNaturalBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "stageFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)p_animationLayer
{
  id result;

  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))return -[THWDrawablesWidgetRep pressableAnimationLayer](self, "pressableAnimationLayer");
  result = -[THWFreeTransformController freeTransformLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "freeTransformLayer");
  if (!result)
    return -[THWDrawablesWidgetRep pressableAnimationLayer](self, "pressableAnimationLayer");
  return result;
}

- (id)shadowAnimationLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    return -[THWFreeTransformController shadowLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "shadowLayer");
  }
  else
  {
    return 0;
  }
}

- (id)sourceShadowLayer
{
  if (-[THWDrawablesWidgetRep shouldUseContainerForAnimation](self, "shouldUseContainerForAnimation"))
    return 0;
  else
    return objc_msgSend(-[THWDrawablesWidgetRep styledRep](self, "styledRep"), "shadowLayer");
}

- (id)sourceReflectionLayer
{
  if (-[THWDrawablesWidgetRep shouldUseContainerForAnimation](self, "shouldUseContainerForAnimation"))
    return 0;
  else
    return objc_msgSend(-[THWDrawablesWidgetRep styledRep](self, "styledRep"), "reflectionLayer");
}

- (id)animationLayer
{
  return -[THWDrawablesWidgetRep p_animationLayer](self, "p_animationLayer");
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  _BOOL4 v9;

  v5 = objc_opt_class(THWDrawablesWidgetRep);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, a3).n128_u64[0];
  v8 = v7;
  if (-[THWDrawablesWidgetRep p_shouldSuppressRenderingDuringExpansion](self, "p_shouldSuppressRenderingDuringExpansion", v6)|| (objc_msgSend(v8, "p_shouldSuppressRenderingDuringExpansion") & 1) != 0|| -[THWDrawablesWidgetRep p_isExpanded](self, "p_isExpanded"))
  {
    goto LABEL_4;
  }
  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress")|| (v9 = -[THWFreeTransformController passedThreshold](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "passedThreshold")))
  {
    if ((objc_opt_respondsToSelector(a3, "shouldForceDisableCrossfadeFromSource:") & 1) != 0
      && (objc_msgSend(a3, "shouldForceDisableCrossfadeFromSource:", self) & 1) != 0)
    {
LABEL_4:
      LOBYTE(v9) = 0;
      return v9;
    }
    LOBYTE(v9) = 1;
  }
  return v9;
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
  result = (CGAffineTransform *)-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
  if ((_DWORD)result)
  {
    result = -[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc");
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
  return !-[THWDrawablesWidgetRep p_shouldSuppressRenderingDuringExpansion](self, "p_shouldSuppressRenderingDuringExpansion", a3);
}

- (id)targetLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress")&& !-[THWFreeTransformController passedThreshold](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "passedThreshold"))
  {
    return 0;
  }
  else
  {
    return -[THWDrawablesWidgetRep p_animationLayer](self, "p_animationLayer");
  }
}

- (CGRect)ftcTargetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    -[THWFreeTransformController completionTargetRect](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "completionTargetRect");
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

- (id)targetShadowLayer
{
  if (-[THWDrawablesWidgetRep shouldUseContainerForAnimation](self, "shouldUseContainerForAnimation"))
    return 0;
  else
    return objc_msgSend(-[THWDrawablesWidgetRep styledRep](self, "styledRep"), "shadowLayer");
}

- (id)targetReflectionLayer
{
  if (-[THWDrawablesWidgetRep shouldUseContainerForAnimation](self, "shouldUseContainerForAnimation"))
    return 0;
  else
    return objc_msgSend(-[THWDrawablesWidgetRep styledRep](self, "styledRep"), "reflectionLayer");
}

- (BOOL)shouldClickDragToPanWhenZoomed
{
  return 1;
}

- (id)expandedContentDrawableToPresent
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable");
  v4 = -[THWDrawablesWidgetRep info](self, "info");
  if (v3)
    v5 = objc_msgSend(v4, "expandedStageDrawable");
  else
    v5 = objc_msgSend(v4, "stageDrawable");
  v6 = objc_msgSend(v5, "repClass");
  if (!objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___THWExpandedRep)
    || (objc_opt_respondsToSelector(v6, "expandedAllowsPresentationInExpandedForInfo:isReflowablePresentation:") & 1) != 0
    && !objc_msgSend(v6, "expandedAllowsPresentationInExpandedForInfo:isReflowablePresentation:", objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable"), objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "isReflowablePresentation")))
  {
    return -[THWDrawablesWidgetRep info](self, "info");
  }
  v7 = objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable");
  v8 = -[THWDrawablesWidgetRep info](self, "info");
  if (v7)
    return objc_msgSend(v8, "expandedStageDrawable");
  else
    return objc_msgSend(v8, "stageDrawable");
}

- (void)didPresentExpanded
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[THWDrawablesWidgetRep childReps](self, "childReps", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWExpandedRep, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i));
        if ((objc_opt_respondsToSelector(v8, "didPresentExpanded") & 1) != 0)
          objc_msgSend(v8, "didPresentExpanded");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "invalidateChildren");
  -[THWDrawablesWidgetRep p_suppressRendering:](self, "p_suppressRendering:", 0);
  objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
}

- (THAnimationController)animationController
{
  THAnimationController *result;
  THAnimationController *v4;

  result = self->mAnimationController;
  if (!result)
  {
    v4 = objc_alloc_init(THAnimationController);
    self->mAnimationController = v4;
    -[THAnimationController addObserver:](v4, "addObserver:", self);
    -[THAnimationController setSource:](self->mAnimationController, "setSource:", self);
    return self->mAnimationController;
  }
  return result;
}

- (BOOL)canExpand
{
  return objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")), "canExpand");
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
  if (-[THWDrawablesWidgetRep p_shouldSuppressRenderingDuringExpansion](self, "p_shouldSuppressRenderingDuringExpansion"))
  {
    -[THWDrawablesWidgetRep p_suppressRendering:](self, "p_suppressRendering:", 1);
  }
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "invalidateFrame");
  objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "invalidateChildren");
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  return objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "adornmentInfo"), "panelContentProviderHasContentForPanel:", *(_QWORD *)&a3);
}

- (id)expandedChildInfosForPanel:(int)a3
{
  return objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "adornmentInfo"), "panelContentProviderChildInfosForPanel:", *(_QWORD *)&a3);
}

- (BOOL)expandedContentAllowPinchZoom
{
  return 1;
}

- (BOOL)expandedContentAllowDoubleTapZoom
{
  return 1;
}

- (int)expandedAppearance
{
  id v3;
  void *v4;

  v3 = objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable");
  if (!v3)
    v3 = objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "stageDrawable");
  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWExpandedRep, objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", v3));
  if ((objc_opt_respondsToSelector(v4, "expandedAppearance") & 1) != 0)
    return objc_msgSend(v4, "expandedAppearance");
  else
    return 1;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v5 = objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable");
  if (!v5)
    v5 = objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "stageDrawable");
  v6 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWExpandedRep, objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", v5));
  if ((objc_opt_respondsToSelector(v6, "expandedAppearanceForPanel:") & 1) != 0)
    return objc_msgSend(v6, "expandedAppearanceForPanel:", v3);
  else
    return 1;
}

- (void)p_addChildRepsToArray:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a4, "childReps", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(a3, "addObject:", v11);
        v12 = TSUProtocolCast(&OBJC_PROTOCOL___TSDContainerRep, v11);
        if (v12)
          -[THWDrawablesWidgetRep p_addChildRepsToArray:inContainer:](self, "p_addChildRepsToArray:inContainer:", a3, v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
}

- (CGRect)expandedFrameInUnscaledCanvasSize
{
  id v3;
  id v4;
  uint64_t v5;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v9;
  id v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat x;
  void *i;
  void *v17;
  BOOL v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  CGRect v36;
  CGRect v37;
  CGRect result;
  CGRect v39;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable"));
  objc_msgSend(v3, "addObject:", v4);
  v5 = TSUProtocolCast(&OBJC_PROTOCOL___TSDContainerRep, v4);
  if (v5)
    -[THWDrawablesWidgetRep p_addChildRepsToArray:inContainer:](self, "p_addChildRepsToArray:inContainer:", v3, v5);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    v12 = height;
    v13 = width;
    v14 = y;
    x = CGRectZero.origin.x;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v3);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v36.origin.x = CGRectZero.origin.x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        v39.origin.x = x;
        v39.origin.y = v14;
        v39.size.width = v13;
        v39.size.height = v12;
        v18 = CGRectEqualToRect(v36, v39);
        objc_msgSend(v17, "frameInUnscaledCanvas");
        v23 = v19;
        v24 = v20;
        v25 = v21;
        v26 = v22;
        if (!v18)
        {
          v37.origin.x = x;
          v37.origin.y = v14;
          v37.size.width = v13;
          v37.size.height = v12;
          *(CGRect *)&v19 = CGRectUnion(v37, *(CGRect *)&v23);
        }
        x = v19;
        v14 = v20;
        v13 = v21;
        v12 = v22;
      }
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v10);
  }
  else
  {
    v12 = height;
    v13 = width;
    v14 = y;
    x = CGRectZero.origin.x;
  }

  v27 = x;
  v28 = v14;
  v29 = v13;
  v30 = v12;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)p_togglePanelDescriptionExpanded
{
  -[THWDrawablesWidgetRep setPanelDescriptionExpanded:](self, "setPanelDescriptionExpanded:", -[THWDrawablesWidgetRep panelDescriptionExpanded](self, "panelDescriptionExpanded") ^ 1);
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
  v7[2] = sub_12DB94;
  v7[3] = &unk_426DD0;
  v7[4] = self;
  return -[THWTapGestureAction initWithAction:]([THWTapGestureAction alloc], "initWithAction:", v7);
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  id v6;

  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    v6 = objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout", a3), "layoutController");
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

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable"), "geometry"), "boundsBeforeRotation");
  v4 = v3;
  v6 = v5;
  if (objc_msgSend(-[THWDrawablesWidgetRep info](self, "info"), "expandedStageDrawable"))
    return 1;
  if (v6 < 660.0)
    return v4 < 960.0;
  return 0;
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
  return -[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
}

- (void)freeTransformWillBegin
{
  -[CALayer removeAllAnimations](-[THWDrawablesWidgetRep pressableAnimationLayer](self, "pressableAnimationLayer"), "removeAllAnimations");
}

- (BOOL)freeTransformMayBeginOverRep:(id)a3
{
  if (-[THWDrawablesWidgetRep p_isExpanded](self, "p_isExpanded"))
    return 1;
  else
    return -[THWDrawablesWidgetRep shouldRecognizePressOnRep:](self, "shouldRecognizePressOnRep:", a3);
}

- (id)styledRep
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(TSDStyledRep);
  TSUDynamicCast(v3, -[THWDrawablesWidgetRep p_repToAnimate](self, "p_repToAnimate"));
  return result;
}

- (BOOL)freeTransformWantsShadow
{
  if (-[THWDrawablesWidgetRep shouldUseContainerForAnimation](self, "shouldUseContainerForAnimation"))
    return !-[THWDrawablesWidgetRep animationContainerProvidesShadowForAnimation](self, "animationContainerProvidesShadowForAnimation");
  else
    return 1;
}

- (CGRect)rectForCompletion
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep styledRep](self, "styledRep"), "layout"), "frameInParent");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
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
  v9 = -[THWDrawablesWidgetRep layout](self, "layout");
  objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
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

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler", a3.width, a3.height), "ftc"), "isFreeTransformInProgress"))
  {
    objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "invalidateFrame");
    objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "invalidateChildren");
  }
}

- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController", a3.width, a3.height, a4.width, a4.height), "setViewScale:", 1.0);
}

- (BOOL)canHandleGesture:(id)a3
{
  if (-[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3)&& (objc_msgSend(objc_msgSend(-[THWDrawablesWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWDrawablesWidgetRep layout](self, "layout"), "actualStageDrawable")), "allowsAction:", 2) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWDrawablesWidgetRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3);
  }
}

- (BOOL)handleGesture:(id)a3
{
  if (-[THWPressableRepGestureTargetHandler handleGesture:](-[THWDrawablesWidgetRep pressableHandler](self, "pressableHandler"), "handleGesture:", a3)|| -[THWFreeTransformableRepGestureTargetHandler handleGesture:](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "handleGesture:", a3))
  {
    return 1;
  }
  objc_msgSend(a3, "gestureKind");
  return 0;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDFreeTransform)
    -[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:](-[THWDrawablesWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "willBeginHandlingGesture:", a3);
}

- (void)animationControllerDidPresent:(id)a3
{

  self->mAnimationController = 0;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  CGFloat y;
  CGFloat x;
  id result;
  id v11;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)THWDrawablesWidgetRep;
  result = -[THWDrawablesWidgetRep hitRep:withGesture:passingTest:](&v12, "hitRep:withGesture:passingTest:");
  if (!result)
  {
    v11 = objc_msgSend(a4, "gestureKind");
    if (v11 == (id)TSDFreeTransform
      && (-[THWDrawablesWidgetRep p_isExpanded](self, "p_isExpanded")
       || (-[THWDrawablesWidgetRep naturalBounds](self, "naturalBounds"),
           v13.x = x,
           v13.y = y,
           CGRectContainsPoint(v14, v13)))
      && (!a5 || (*((unsigned int (**)(id, THWDrawablesWidgetRep *))a5 + 2))(a5, self)))
    {
      return self;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->mPressableHandler;
}

- (void)setPressableHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->mFreeTransformableHandler;
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (void)setExpandedRepController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (BOOL)shouldUseContainerForAnimation
{
  return self->_shouldUseContainerForAnimation;
}

- (void)setShouldUseContainerForAnimation:(BOOL)a3
{
  self->_shouldUseContainerForAnimation = a3;
}

- (BOOL)animationContainerProvidesShadowForAnimation
{
  return self->_animationContainerProvidesShadowForAnimation;
}

- (void)setAnimationContainerProvidesShadowForAnimation:(BOOL)a3
{
  self->_animationContainerProvidesShadowForAnimation = a3;
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
