@implementation THWSceneRep

- (THWSceneRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWSceneRep *v4;
  uint64_t v5;
  double v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWSceneRep;
  v4 = -[THWSceneRep initWithLayout:canvas:](&v11, "initWithLayout:canvas:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_class(THInteractiveCanvasController);
    *(_QWORD *)&v6 = TSUDynamicCast(v5, -[THWSceneRep interactiveCanvasController](v4, "interactiveCanvasController")).n128_u64[0];
    v8 = objc_msgSend(v7, "pressHandlerForPressableReps", v6);
    if (v8)
      v4->_pressableHandler = -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", v4, v8);
    v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWSceneRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v4, "handleNotificationVantageWillChange:", CFSTR("THVantageWillChangeNotification"), 0);
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v4, "handleNotificationVantageDidChange:", CFSTR("THVantageDidChangeNotification"), 0);
    -[THWSceneRep setLoanedSceneController:](v4, "setLoanedSceneController:", objc_msgSend(objc_msgSend(-[THWSceneRep interactiveCanvasController](v4, "interactiveCanvasController"), "widgetHost"), "repIsPresentedExpanded:", v4));
    v9 = objc_msgSend(objc_msgSend(-[THWSceneRep hostICC](v4, "hostICC"), "widgetHost"), "inFlowMode");
    if (-[THWSceneRep loanedSceneController](v4, "loanedSceneController"))
    {
      if (!(_DWORD)v9)
        return v4;
      goto LABEL_8;
    }
    if (((objc_msgSend(-[THWSceneRep layout](v4, "layout"), "isExpanded") ^ 1 | v9) & 1) != 0)
    {
LABEL_8:
      v4->_isCurrentlyScrolling = objc_msgSend(-[THWSceneRep interactiveCanvasController](v4, "interactiveCanvasController"), "currentlyScrolling");
      -[THWSceneRep p_setupSceneControllerIfNecessary:](v4, "p_setupSceneControllerIfNecessary:", v9);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  -[THWImageCropAnimationController teardownWrapperLayer](self->_imageCropAnimationController, "teardownWrapperLayer");

  self->_imageCropAnimationController = 0;
  self->_childReps = 0;

  self->_freeTransformableHandler = 0;
  self->_sceneController = 0;

  self->_pressableHandler = 0;
  self->_animationController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWSceneRep;
  -[THWSceneRep dealloc](&v3, "dealloc");
}

- (CGRect)p_scaledViewFrameOnCanvas
{
  double v3;
  double v4;
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
  CGRect result;

  objc_msgSend(-[THWSceneRep layout](self, "layout"), "frameInRoot");
  objc_msgSend(-[THWSceneRep canvas](self, "canvas"), "convertUnscaledToBoundsRect:", v3, v4, v5, v6);
  v11 = TSDRoundedRectForMainScreen(v7, v8, v9, v10);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)p_setupSceneControllerIfNecessary:(BOOL)a3
{
  THWSceneController *v5;
  id v6;
  THWSceneController *sceneController;

  if (!self->_sceneController)
  {
    v5 = [THWSceneController alloc];
    v6 = -[THWSceneRep info](self, "info");
    -[THWSceneRep p_scaledViewFrameOnCanvas](self, "p_scaledViewFrameOnCanvas");
    sceneController = -[THWSceneController initWithSceneInfo:frame:delegate:](v5, "initWithSceneInfo:frame:delegate:", v6, self);
    self->_sceneController = sceneController;
    if (a3)
    {
LABEL_3:
      -[THWSceneController loadScene](sceneController, "loadScene");
      return;
    }
    if (-[THWSceneRep isExpanded](self, "isExpanded")
      && !-[THWSceneRep isCurrentlyScrolling](self, "isCurrentlyScrolling"))
    {
      sceneController = self->_sceneController;
      goto LABEL_3;
    }
    -[THWSceneController loadSceneDeferred](self->_sceneController, "loadSceneDeferred");
  }
}

- (void)viewScrollWillChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWSceneRep;
  -[THWSceneRep viewScrollWillChange](&v3, "viewScrollWillChange");
  self->_isCurrentlyScrolling = 1;
  if (-[THWSceneRep isVisibleOnCanvas](self, "isVisibleOnCanvas"))
    -[THWSceneController pauseIdleAnimation](-[THWSceneRep sceneController](self, "sceneController"), "pauseIdleAnimation");
}

- (void)viewScrollingEnded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWSceneRep;
  -[THWSceneRep viewScrollingEnded](&v3, "viewScrollingEnded");
  self->_isCurrentlyScrolling = 0;
  if (-[THWSceneRep isVisibleOnCanvas](self, "isVisibleOnCanvas"))
  {
    if (-[THWSceneRep sceneController](self, "sceneController"))
    {
      if (!-[THWSceneController view](-[THWSceneRep sceneController](self, "sceneController"), "view"))
        objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateReps");
      -[THWSceneController resumeIdleAnimationIfNecessary](-[THWSceneRep sceneController](self, "sceneController"), "resumeIdleAnimationIfNecessary");
    }
    else
    {
      objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
    }
  }
}

- (void)canvasDidBeginFreeTransform
{
  -[THWSceneController pauseIdleAnimation](-[THWSceneRep sceneController](self, "sceneController"), "pauseIdleAnimation");
}

- (void)canvasDidEndFreeTransform
{
  if (-[THWSceneRep isVisibleOnCanvas](self, "isVisibleOnCanvas"))
    -[THWSceneController resumeIdleAnimationIfNecessary](-[THWSceneRep sceneController](self, "sceneController"), "resumeIdleAnimationIfNecessary");
}

- (void)handleNotificationVantageDidChange:(id)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("THVantageChangeReason"));
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("THVantageChangeReasonTransitionToGlossary")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("THVantageChangeReasonTransitionToNotesVC")))
  {
    -[THWSceneController pauseIdleAnimation](-[THWSceneRep sceneController](self, "sceneController"), "pauseIdleAnimation");
  }
}

- (id)documentRootForSceneController:(id)a3
{
  return objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController", a3), "documentRoot");
}

- (id)backgroundColorForSceneController:(id)a3
{
  return objc_msgSend(-[THWSceneRep info](self, "info", a3), "stageColor");
}

- (id)placeholderLayerForSceneController:(id)a3
{
  return objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController", a3), "layerForRep:", objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWSceneRep info](self, "info"), "placeholderImage")));
}

- (double)screenScaleForSceneController:(id)a3
{
  double result;

  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen", a3), "scale");
  return result;
}

- (void)handleSingleTapInSceneForSceneController:(id)a3
{
  void *v4;

  if (-[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWSceneRep pressableHandler](self, "pressableHandler", a3), "widgetInteractionDisabledOnPage"))
  {
    goto LABEL_2;
  }
  if (!-[THWSceneRep animating](self, "animating"))
  {
    if (!-[THWSceneRep isExpanded](self, "isExpanded")
      && -[THWSceneRep meetsStageDimensionRequirementForExpanded](self, "meetsStageDimensionRequirementForExpanded"))
    {
LABEL_2:
      -[THWPressableRepGestureTargetHandler spoofGesture](-[THWSceneRep pressableHandler](self, "pressableHandler"), "spoofGesture");
      return;
    }
    v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWExpandedViewController, objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
    objc_msgSend(v4, "handleSingleTap");
  }
}

- (void)sceneDidLoadForSceneController:(id)a3
{
  if (!-[THWSceneRep isCurrentlyScrolling](self, "isCurrentlyScrolling", a3))
    objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateReps");
}

- (BOOL)sceneControllerShouldAllowPinchZoom:(id)a3
{
  return 0;
}

- (BOOL)sceneControllerShouldAllowCrossfade:(id)a3
{
  return !-[THWSceneRep sceneTransferHappened](self, "sceneTransferHappened", a3);
}

- (BOOL)sceneControllerShouldAllowIdleAnimation:(id)a3
{
  return !-[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWSceneRep pressableHandler](self, "pressableHandler", a3), "widgetInteractionDisabledOnPage");
}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)setChildReps:(id)a3
{
  NSArray *childReps;
  NSArray *v6;

  childReps = self->_childReps;
  if (childReps != a3)
  {
    -[NSArray makeObjectsPerformSelector:withObject:](childReps, "makeObjectsPerformSelector:withObject:", "setParentRep:", 0);

    v6 = (NSArray *)a3;
    self->_childReps = v6;
    -[NSArray makeObjectsPerformSelector:withObject:](v6, "makeObjectsPerformSelector:withObject:", "setParentRep:", self);
  }
}

- (void)addChildViewsToArray:(id)a3
{
  unsigned int v5;
  THWSceneController *v6;
  id v7;
  THWSceneController *v8;
  id v9;
  THWSceneController *v10;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneRep addChildViewsToArray:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneRep.m"), 443, CFSTR("This operation must only be performed on the main thread."));
  v5 = -[THWSceneRep isVisibleOnCanvas](self, "isVisibleOnCanvas");
  v6 = -[THWSceneRep sceneController](self, "sceneController");
  if (!v5)
  {
    v9 = -[THWSceneController view](v6, "view");
    if (!v9)
      goto LABEL_13;
    v7 = v9;
    v10 = -[THWSceneRep sceneController](self, "sceneController");
    -[THWSceneRep p_scaledViewFrameOnCanvas](self, "p_scaledViewFrameOnCanvas");
    -[THWSceneController setFrame:](v10, "setFrame:");
LABEL_12:
    objc_msgSend(a3, "addObject:", v7);
    goto LABEL_13;
  }
  if (v6)
  {
    if (!-[THWSceneRep isCurrentlyScrolling](self, "isCurrentlyScrolling")
      && !-[THWSceneController view](-[THWSceneRep sceneController](self, "sceneController"), "view"))
    {
      -[THWSceneController setupSceneView](-[THWSceneRep sceneController](self, "sceneController"), "setupSceneView");
    }
    v7 = -[THWSceneController view](-[THWSceneRep sceneController](self, "sceneController"), "view");
    v8 = -[THWSceneRep sceneController](self, "sceneController");
    -[THWSceneRep p_scaledViewFrameOnCanvas](self, "p_scaledViewFrameOnCanvas");
    -[THWSceneController setFrame:](v8, "setFrame:");
    if (v7)
      goto LABEL_12;
  }
LABEL_13:
  -[THWSceneRep p_updateInteractiveMode](self, "p_updateInteractiveMode");
}

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWSceneRep;
  -[THWSceneRep willBeRemoved](&v3, "willBeRemoved");
  if (self->_sceneController)
  {
    -[THWSceneController stopAnimation](-[THWSceneRep sceneController](self, "sceneController"), "stopAnimation");
    -[THWSceneController setDelegate:](-[THWSceneRep sceneController](self, "sceneController"), "setDelegate:", 0);
  }
}

- (void)willAddChildView:(id)a3 toView:(id)a4
{
  objc_msgSend(a4, "addSubview:", a3);
}

- (void)didAddChildView:(id)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneRep didAddChildView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneRep.m"), 515, CFSTR("This operation must only be performed on the main thread."));
  if (a3)
  {
    if (-[THWSceneController view](-[THWSceneRep sceneController](self, "sceneController"), "view") == a3)
      -[THWSceneController didAddSceneView](-[THWSceneRep sceneController](self, "sceneController"), "didAddSceneView");
  }
}

- (void)willRemoveChildView:(id)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneRep willRemoveChildView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneRep.m"), 524, CFSTR("This operation must only be performed on the main thread."));
  if (a3
    && !-[THWSceneRep loanedSceneController](self, "loanedSceneController")
    && self->_sceneController
    && -[THWSceneController view](-[THWSceneRep sceneController](self, "sceneController"), "view") == a3)
  {
    -[THWSceneController stopAnimation](self->_sceneController, "stopAnimation");
    objc_msgSend(a3, "removeFromSuperview");
  }
}

- (BOOL)containerManagesChildView
{
  return 1;
}

- (void)p_updateInteractiveMode
{
  unsigned int v3;
  THWSceneController *v4;

  -[THWSceneController setUserInteractionEnabled:](-[THWSceneRep sceneController](self, "sceneController"), "setUserInteractionEnabled:", 1);
  v3 = -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWSceneRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage");
  v4 = -[THWSceneRep sceneController](self, "sceneController");
  if (v3)
    -[THWSceneController pauseIdleAnimationForRotation](v4, "pauseIdleAnimationForRotation");
  else
    -[THWSceneController resumeIdleAnimationIfNecessary](v4, "resumeIdleAnimationIfNecessary");
}

- (void)updateChildrenFromLayout
{
  -[THWSceneRep setChildReps:](self, "setChildReps:", +[TSDContainerRep childrenFromLayoutInContainerRep:](TSDContainerRep, "childrenFromLayoutInContainerRep:", self));
}

- (void)viewScaleDidChange
{
  -[THWSceneRep p_updateInteractiveMode](self, "p_updateInteractiveMode");
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  return +[TSDContainerRep containerRep:hitRep:withGesture:passingTest:](TSDContainerRep, "containerRep:hitRep:withGesture:passingTest:", self, a4, a5, a3.x, a3.y);
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  return -[THWSceneRep pressableAction](self, "pressableAction") != 0;
}

- (BOOL)wantsPressAction
{
  _BOOL4 v3;

  if (-[THWSceneRep meetsStageDimensionRequirementForExpanded](self, "meetsStageDimensionRequirementForExpanded")
    || (v3 = -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWSceneRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage")))
  {
    LOBYTE(v3) = -[THWSceneRep pressableAction](self, "pressableAction") != 0;
  }
  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return a3 == self;
}

- (int)pressableAction
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWSceneRep;
  return -[THWSceneRep pressableAction](&v3, "pressableAction");
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 1;
}

- (BOOL)canHandleGesture:(id)a3
{
  if (-[THWSceneRep animating](self, "animating")
    || !-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWSceneRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3))
  {
    return -[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWSceneRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3);
  }
  else
  {
    return 1;
  }
}

- (BOOL)handleGesture:(id)a3
{
  if (-[THWPressableRepGestureTargetHandler handleGesture:](-[THWSceneRep pressableHandler](self, "pressableHandler"), "handleGesture:", a3))
  {
    return 1;
  }
  else
  {
    return -[THWFreeTransformableRepGestureTargetHandler handleGesture:](-[THWSceneRep freeTransformableHandler](self, "freeTransformableHandler"), "handleGesture:", a3);
  }
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDFreeTransform)
    -[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:](-[THWSceneRep freeTransformableHandler](self, "freeTransformableHandler"), "willBeginHandlingGesture:", a3);
}

- (BOOL)isExpanded
{
  return objc_msgSend(-[THWSceneRep layout](self, "layout"), "isExpanded");
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  double v2;
  double v3;

  objc_msgSend(objc_msgSend(-[THWSceneRep layout](self, "layout"), "geometry"), "size");
  return v3 < 660.0 || v2 < 960.0;
}

- (id)shadowPath
{
  if (objc_msgSend(objc_msgSend(-[THWSceneRep info](self, "info"), "stageColor"), "isOpaque"))
    return -[THWImageCropAnimationController sourceShadowPath](self->_imageCropAnimationController, "sourceShadowPath");
  else
    return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 0;
}

- (BOOL)isFreeTransformInProgress
{
  return -[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWSceneRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
}

- (void)freeTransformWillBegin
{
  uint64_t v3;
  double v4;
  uint64_t v5;

  v3 = objc_opt_class(THWSceneRep);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWExpandedRepController expandedRepSourceRep](-[THWSceneRep expandedRepController](self, "expandedRepController"), "expandedRepSourceRep")).n128_u64[0];
  -[THWSceneRep p_setupImageCropAnimationControllerWithDestinationRep:](self, "p_setupImageCropAnimationControllerWithDestinationRep:", v5, v4);
}

- (void)freeTransformDidEnd
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;

  -[THWImageCropAnimationController teardownWrapperLayer](self->_imageCropAnimationController, "teardownWrapperLayer");

  self->_imageCropAnimationController = 0;
  v3 = objc_opt_class(THWSceneRep);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THAnimationController destination](self->_animationController, "destination")).n128_u64[0];
  v6 = v5;
  objc_msgSend(v5, "p_reparentSceneView", v4);
  if (-[THWSceneRep sceneDidReceiveRotationLayoutDuringFreeTransform](self, "sceneDidReceiveRotationLayoutDuringFreeTransform"))
  {
    -[THWSceneRep setSceneDidReceiveRotationLayoutDuringFreeTransform:](self, "setSceneDidReceiveRotationLayoutDuringFreeTransform:", 0);
    objc_msgSend(objc_msgSend(v6, "sceneController"), "setDisableFrameUpdate:", 0);
    objc_msgSend(objc_msgSend(v6, "layout"), "invalidateFrame");
  }
}

- (CGRect)rectForCompletion
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THWSceneRep layout](self, "layout"), "frameInParent");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)freeTransformInteractionEnabledOverride
{
  return 1;
}

- (BOOL)expandedPanelStartsVisible
{
  return 1;
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
    -[THAnimationController setShadowFadeOutDurationScale:](self->_animationController, "setShadowFadeOutDurationScale:", 1.0);
    -[THAnimationController setShadowTransformDurationScale:](self->_animationController, "setShadowTransformDurationScale:", 0.5);
    return self->_animationController;
  }
  return result;
}

- (void)expandableExpandedPresentationDidEnd
{
  -[THWSceneRep p_updateInteractiveMode](self, "p_updateInteractiveMode");
}

- (void)expandedDidAppearPreAnimation
{
  THWSceneController *v2;
  THWSceneController *v3;

  v2 = -[THWSceneRep sceneController](self, "sceneController");
  if (v2)
  {
    v3 = v2;
    if (!-[THWSceneController hasRendered](v2, "hasRendered"))
      objc_msgSend(-[THWSceneController view](v3, "view"), "setNeedsDisplay");
  }
}

- (void)didPresentExpanded
{
  -[THWSceneController setUserInteractionEnabled:](-[THWSceneRep sceneController](self, "sceneController"), "setUserInteractionEnabled:", 1);
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  return objc_msgSend(objc_msgSend(-[THWSceneRep info](self, "info"), "panelContentProvider"), "panelContentProviderHasContentForPanel:", *(_QWORD *)&a3);
}

- (id)expandedChildInfosForPanel:(int)a3
{
  return objc_msgSend(objc_msgSend(-[THWSceneRep info](self, "info"), "panelContentProvider"), "panelContentProviderChildInfosForPanel:", *(_QWORD *)&a3);
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  objc_msgSend(-[THWSceneRep layout](self, "layout", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "invalidateFrame");
}

- (BOOL)expandedContentAllowDoubleTapZoom
{
  return 0;
}

- (int)expandedAppearance
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 0;
}

- (double)expandedContentMinimumZoomScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (!objc_msgSend(-[THWSceneRep layout](self, "layout"), "delegate"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneRep expandedContentMinimumZoomScale]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneRep.m"), 871, CFSTR("invalid nil value for '%s'"), "self.layout.delegate");
  -[THWSceneRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  v4 = v3;
  v6 = v5;
  objc_msgSend(objc_msgSend(-[THWSceneRep layout](self, "layout"), "delegate"), "widgetLayoutBounds");
  v9 = 1.0;
  if (v4 <= 0.0)
    v10 = 1.0;
  else
    v10 = v4;
  if (v6 > 0.0)
    v9 = v6;
  return THScaleNeededToFitSizeInSize(v10, v9, v7, v8);
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  id result;

  if (!-[THWSceneRep isFreeTransformInProgress](self, "isFreeTransformInProgress"))
    return -[THWImageCropAnimationController wrapperLayer](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "wrapperLayer");
  result = -[THWFreeTransformController freeTransformLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWSceneRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "freeTransformLayer");
  if (!result)
    return -[THWImageCropAnimationController wrapperLayer](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "wrapperLayer");
  return result;
}

- (id)p_sceneContentLayer
{
  id result;

  result = -[THWSceneController sceneLayer](-[THWSceneRep sceneController](self, "sceneController"), "sceneLayer");
  if (!result)
    return objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self);
  return result;
}

- (CGRect)p_contentsRectForDestination:(CGSize)a3 shouldFill:(BOOL)a4
{
  double v4;
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
  double v15;
  double width;
  double height;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  if (a4)
  {
    v4 = 1.0;
    v5 = 0.0;
    v6 = 0.0;
    v7 = 1.0;
  }
  else
  {
    TSDRectWithSize(-[THWSceneRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas"));
    v8 = TSDFitOrFillSizeInRect(1);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = TSDCenterOfRect(v8, v9, v11, v13);
    v24.origin.x = TSDRectWithCenterAndSize(v15);
    v27.origin.x = v8;
    v27.origin.y = v10;
    v27.size.width = v12;
    v27.size.height = v14;
    v25 = CGRectIntersection(v24, v27);
    width = v25.size.width;
    height = v25.size.height;
    v18 = TSDSubtractPoints((__n128)v25.origin, *(__n128 *)&v25.origin.y, v8, v10);
    v5 = TSDRectWithOriginAndSize(v19, v18, v20, width, height) / v12;
    v6 = v21 / v14;
    v4 = v22 / v12;
    v7 = v23 / v14;
  }
  result.size.height = v7;
  result.size.width = v4;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)shadowAnimationLayer
{
  if (-[THWSceneRep isFreeTransformInProgress](self, "isFreeTransformInProgress"))
    return -[THWFreeTransformController shadowLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWSceneRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "shadowLayer");
  else
    return 0;
}

- (CGAffineTransform)shadowAnimationLayerDestinationTransform:(SEL)a3 uniformTargetScale:(id)a4
{
  __int128 v7;
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
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  __n128 v52;
  double v53;
  __n128 v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  __n128 v59;
  __n128 v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  THWFreeTransformController *v68;
  __int128 v69;
  CGAffineTransform *result;
  __int128 v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGAffineTransform v80;
  CGAffineTransform v81;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v84;

  v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController", a4))
  {
    -[THWImageCropAnimationController sourceContentsRect](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "sourceContentsRect");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[THWImageCropAnimationController targetContentsRect](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "targetContentsRect");
    v17 = v16;
    v19 = v18;
    v74 = v21;
    v76 = v20;
    v22 = objc_msgSend(-[THWSceneRep shadowAnimationLayer](self, "shadowAnimationLayer"), "bounds");
    v24 = v23;
    v26 = v25;
    v27 = TSDMultiplyRectBySize(v22, v9, v11, v13, v15, v23, v25);
    v72 = v28;
    v73 = v27;
    v30 = v29;
    v78 = v31;
    v79 = v29;
    v32 = v31;
    v34 = TSDMultiplyRectBySize(v33, v17, v19, v76, v74, v24, v26);
    v36 = v35;
    v38 = v37;
    v75 = v39;
    v77 = v37;
    v40 = v39;
    v41 = TSDCenterOfRect(v73, v72, v30, v32);
    v43 = v42;
    v44 = TSDCenterOfRect(v34, v36, v38, v40);
    v46 = v45;
    v48 = TSDRectWithSize(v47);
    v52.n128_f64[0] = TSDCenterOfRect(v48, v49, v50, v51);
    v53 = v52.n128_f64[0];
    v55 = v54.n128_f64[0];
    v56 = TSDSubtractPoints(v52, v54, v41, v43);
    v58 = v57;
    v59.n128_f64[0] = v44;
    v60.n128_u64[0] = v46;
    v61 = TSDSubtractPoints(v59, v60, v53, v55);
    v63 = v62;
    CGAffineTransformMakeTranslation(retstr, v56, v58);
    CGAffineTransformMakeScale(&t2, v77 / v79, v75 / v78);
    v64 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v64;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v84, &t1, &t2);
    v65 = *(_OWORD *)&v84.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v84.a;
    *(_OWORD *)&retstr->c = v65;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v84.tx;
    CGAffineTransformMakeTranslation(&v81, v61, v63);
    v66 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v66;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v84, &t1, &v81);
    v67 = *(_OWORD *)&v84.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v84.a;
    *(_OWORD *)&retstr->c = v67;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v84.tx;
  }
  v68 = -[THWFreeTransformableRepGestureTargetHandler ftc](-[THWSceneRep freeTransformableHandler](self, "freeTransformableHandler", *(_QWORD *)&v72, *(_QWORD *)&v73), "ftc");
  if (v68)
    -[THWFreeTransformController originalShadowTransform](v68, "originalShadowTransform");
  else
    memset(&v80, 0, sizeof(v80));
  v69 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v69;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v84, &t1, &v80);
  v71 = *(_OWORD *)&v84.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v84.a;
  *(_OWORD *)&retstr->c = v71;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v84.tx;
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
  result = (CGAffineTransform *)-[THWSceneRep isFreeTransformInProgress](self, "isFreeTransformInProgress");
  if ((_DWORD)result)
  {
    result = -[THWFreeTransformableRepGestureTargetHandler ftc](-[THWSceneRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc");
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

- (void)reparentAnimationLayerIfBackedByView:(id)a3
{
  if (!-[THWSceneRep isFreeTransformInProgress](self, "isFreeTransformInProgress", a3))
    -[THWSceneRep p_reparentSceneView](self, "p_reparentSceneView");
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  if (-[THWSceneRep isFreeTransformInProgress](self, "isFreeTransformInProgress")
    && !-[THWFreeTransformController passedThreshold](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWSceneRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "passedThreshold"))
  {
    return 0;
  }
  else
  {
    return -[THWSceneRep p_sceneContentLayer](self, "p_sceneContentLayer");
  }
}

- (CGRect)ftcTargetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (-[THWSceneRep isFreeTransformInProgress](self, "isFreeTransformInProgress"))
  {
    -[THWFreeTransformController completionTargetRect](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWSceneRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "completionTargetRect");
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

- (CGRect)targetFrameForSource:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v9 = objc_opt_class(THWSceneRep);
  *(_QWORD *)&v10 = TSUDynamicCast(v9, a3).n128_u64[0];
  v12 = v11;
  v13 = objc_msgSend(v11, "sceneController", v10);
  if (v13)
  {
    v14 = v13;
    objc_msgSend(objc_msgSend(objc_msgSend(v12, "interactiveCanvasController"), "layerForRep:", v12), "frame");
    v16 = v15;
    v18 = v17;
    objc_msgSend(objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self), "frame");
    if (objc_msgSend(v14, "shouldFillSize:withinSize:", v16, v18))
    {
      x = TSDFitOrFillSizeInRect(1);
      y = v19;
      width = v20;
      height = v21;
    }
  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)p_reparentSceneView
{
  id v3;
  void *v4;
  THWSceneController *v5;
  _QWORD v6[5];
  void *v7;

  v3 = -[THWSceneController view](-[THWSceneRep sceneController](self, "sceneController"), "view");
  if (v3)
  {
    v4 = v3;
    if (!-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"))
    {
      v7 = v4;
      objc_msgSend(-[THWSceneRep subviewsController](self, "subviewsController"), "addSubviews:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
      v5 = -[THWSceneRep sceneController](self, "sceneController");
      -[THWSceneRep p_scaledViewFrameOnCanvas](self, "p_scaledViewFrameOnCanvas");
      -[THWSceneController setFrame:](v5, "setFrame:");
      objc_msgSend(objc_msgSend(v4, "layer"), "setMasksToBounds:", 1);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_19838C;
      v6[3] = &unk_426DD0;
      v6[4] = v4;
      objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "performBlockNextFrame:", v6);
    }
  }
}

- (void)reparentTargetLayerIfBackedByView:(id)a3
{
  uint64_t v5;
  double v6;
  id v7;

  v5 = objc_opt_class(THWSceneRep);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(a3, "source")).n128_u64[0];
  if ((objc_msgSend(v7, "isFreeTransformInProgress", v6) & 1) == 0)
    -[THWSceneRep p_reparentSceneView](self, "p_reparentSceneView");
}

- (void)animationControllerWillPresent:(id)a3
{
  -[THWSceneRep setAnimating:](self, "setAnimating:", 1);
}

- (void)animationControllerDidPresent:(id)a3
{

  self->_animationController = 0;
  -[THWSceneRep setAnimating:](self, "setAnimating:", 0);
}

- (void)animationControllerSetupTarget:(id)a3
{
  uint64_t v5;
  double v6;
  uint64_t v7;

  v5 = objc_opt_class(THWSceneRep);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(a3, "destination")).n128_u64[0];
  -[THWSceneRep p_setupImageCropAnimationControllerWithDestinationRep:](self, "p_setupImageCropAnimationControllerWithDestinationRep:", v7, v6);
}

- (void)animationControllerTeardownTarget:(id)a3
{
  if (!-[THWSceneRep isFreeTransformInProgress](self, "isFreeTransformInProgress", a3))
  {
    -[THWImageCropAnimationController teardownWrapperLayer](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "teardownWrapperLayer");

    self->_imageCropAnimationController = 0;
    -[THWSceneRep p_reparentSceneView](self, "p_reparentSceneView");
  }
}

- (void)animationControllerDidAddContentAnimations:(id)a3 uniformTargetScale:(double)a4
{
  THWImageCropAnimationController *v5;

  v5 = -[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController");
  objc_msgSend(a3, "animationDuration");
  -[THWImageCropAnimationController addAnimationWithDuration:targetScale:](v5, "addAnimationWithDuration:targetScale:");
}

- (void)replaceContentsFromRep:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWSceneRep;
  -[THWSceneRep replaceContentsFromRep:](&v9, "replaceContentsFromRep:");
  v5 = objc_opt_class(THWSceneRep);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (v6)
  {
    v8 = v6;
    if (self->_sceneController)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v7), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneRep replaceContentsFromRep:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneRep.m"), 1195, CFSTR("expected nil value for '%s'"), "_sceneController");
    -[THWSceneRep setSceneController:](self, "setSceneController:", objc_msgSend(v8, "sceneController", v7));
    -[THWSceneController setDelegate:](-[THWSceneRep sceneController](self, "sceneController"), "setDelegate:", self);
    -[THWSceneRep setLoanedSceneController:](self, "setLoanedSceneController:", 0);
    -[THWSceneRep setSceneTransferHappened:](self, "setSceneTransferHappened:", 1);
    objc_msgSend(v8, "setSceneController:", 0);
    objc_msgSend(v8, "setLoanedSceneController:", 1);
    objc_msgSend(objc_msgSend(a3, "interactiveCanvasController"), "invalidateLayers");
    objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
  }
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
  unsigned __int8 v8;
  double result;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v8 = -[THWSceneController yFovFixed](-[THWSceneRep sceneController](self, "sceneController"), "yFovFixed");
  result = height / v6;
  if ((v8 & 1) == 0)
    return width / v7;
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
  double height;
  double width;
  double v6;
  double v7;
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
  double v20;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  -[THWSceneController setDisableFrameUpdate:](-[THWSceneRep sceneController](self, "sceneController"), "setDisableFrameUpdate:", 1);
  -[THWSceneController frame](-[THWSceneRep sceneController](self, "sceneController"), "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[THWSceneRep scaleForCenteredAutoRotateFromSize:toSize:](self, "scaleForCenteredAutoRotateFromSize:toSize:", v7, v6, width, height);
  if (-[THWSceneController yFovFixed](-[THWSceneRep sceneController](self, "sceneController"), "yFovFixed"))
  {
    if (v7 < width)
      goto LABEL_5;
  }
  else if (v6 < height)
  {
LABEL_5:
    v17 = TSDCenterOfRect(v10, v12, v14, v16);
    v10 = TSDRectWithCenterAndSize(v17);
    v12 = v18;
    v14 = v19;
    v16 = v20;
  }
  -[THWSceneController setFrame:overrideDisabled:](-[THWSceneRep sceneController](self, "sceneController"), "setFrame:overrideDisabled:", 1, v10, v12, v14, v16);
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  if (-[THWSceneRep isFreeTransformInProgress](self, "isFreeTransformInProgress", a3.width, a3.height))
  {
    -[THWSceneRep setSceneDidReceiveRotationLayoutDuringFreeTransform:](self, "setSceneDidReceiveRotationLayoutDuringFreeTransform:", 1);
  }
  else
  {
    -[THWSceneController setDisableFrameUpdate:](-[THWSceneRep sceneController](self, "sceneController"), "setDisableFrameUpdate:", 0);
    objc_msgSend(-[THWSceneRep layout](self, "layout"), "invalidateFrame");
  }
}

- (CGSize)p_targetExpandedSize
{
  id v2;
  double v3;
  double v4;
  CGSize result;

  v2 = objc_msgSend(-[THWSceneRep hostICC](self, "hostICC"), "widgetHost");
  if (v2)
  {
    objc_msgSend(v2, "widgetHostExpandedSize");
  }
  else
  {
    v3 = 100.0;
    v4 = 100.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)p_setupImageCropAnimationControllerWithDestinationRep:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL8 v16;
  BOOL v17;
  char v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
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
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  THWImageCropAnimationController *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;

  v5 = -[THWSceneRep p_sceneContentLayer](self, "p_sceneContentLayer");
  objc_msgSend(objc_msgSend(-[THWSceneRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self), "frame");
  v7 = v6;
  v9 = v8;
  if (a3)
  {
    objc_msgSend(a3, "layerFrameInScaledCanvas");
    v11 = v10;
    v13 = v12;
  }
  else
  {
    -[THWSceneRep p_targetExpandedSize](self, "p_targetExpandedSize");
    v11 = v14;
    v13 = v15;
  }
  v16 = -[THWSceneController shouldFillSize:withinSize:](-[THWSceneRep sceneController](self, "sceneController"), "shouldFillSize:withinSize:", v7, v9, v11, v13);
  if (-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"))
  {
    if (a3)
      v17 = a3 == self;
    else
      v17 = 1;
    v18 = v17 || v16;
    if ((v18 & 1) == 0)
      goto LABEL_12;
  }
  else if (!v16)
  {
LABEL_12:
    v19 = objc_msgSend(-[THWSceneController view](-[THWSceneRep sceneController](self, "sceneController"), "view"), "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    TSDSizeExpandedToMatchAspectRatio(v19, v24, v26, v11, v13);
    v28 = TSDCenterOfRect(v21, v23, v25, v27);
    v29 = TSDRectWithCenterAndSize(v28);
    v33 = TSDRoundedRectForMainScreen(v29, v30, v31, v32);
    v7 = v34;
    v9 = v35;
    -[THWSceneController setFrame:](-[THWSceneRep sceneController](self, "sceneController"), "setFrame:", v33, v36, v34, v35);
  }
  if (-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"))
  {
    if (a3)
    {
      if (a3 == self)
      {
        objc_msgSend(objc_msgSend(a3, "imageCropAnimationController"), "sourceContentsRect");
        objc_msgSend(objc_msgSend(a3, "imageCropAnimationController"), "setTargetContentsRect:", v71, v72, v73, v74);
        objc_msgSend(objc_msgSend(a3, "imageCropAnimationController"), "sourceCornerRadius");
        v76 = v75;
        v53 = (THWImageCropAnimationController *)objc_msgSend(a3, "imageCropAnimationController");
        v54 = v76;
      }
      else
      {
        -[THWSceneRep p_contentsRectForDestination:shouldFill:](self, "p_contentsRectForDestination:shouldFill:", v16, v11, v13);
        v38 = v37;
        v40 = v39;
        v42 = v41;
        v44 = v43;
        objc_msgSend(a3, "p_contentsRectForDestination:shouldFill:", v16 ^ 1, v7, v9);
        v46 = v45;
        v48 = v47;
        v50 = v49;
        v52 = v51;
        -[THWImageCropAnimationController setSourceContentsRect:](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "setSourceContentsRect:", v38, v40, v42, v44);
        -[THWImageCropAnimationController setTargetContentsRect:](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "setTargetContentsRect:", v46, v48, v50, v52);
        v53 = -[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController");
        v54 = 0.0;
      }
      -[THWImageCropAnimationController setTargetCornerRadius:](v53, "setTargetCornerRadius:", v54);
    }
  }
  else
  {
    -[THWSceneRep p_contentsRectForDestination:shouldFill:](self, "p_contentsRectForDestination:shouldFill:", v16, v11, v13);
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;
    if (a3)
    {
      objc_msgSend(a3, "p_contentsRectForDestination:shouldFill:", v16 ^ 1, v7, v9);
      v64 = v63;
      v66 = v65;
      v68 = v67;
      v70 = v69;
    }
    else
    {
      v68 = 1.0;
      v64 = 0.0;
      v66 = 0.0;
      v70 = 1.0;
    }
    self->_imageCropAnimationController = -[THWImageCropAnimationController initWithImageContentLayer:]([THWImageCropAnimationController alloc], "initWithImageContentLayer:", v5);
    -[THWImageCropAnimationController setSourceContentsRect:](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "setSourceContentsRect:", v56, v58, v60, v62);
    -[THWImageCropAnimationController setSourceCornerRadius:](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "setSourceCornerRadius:", 0.0);
    -[THWImageCropAnimationController setTargetContentsRect:](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "setTargetContentsRect:", v64, v66, v68, v70);
    -[THWImageCropAnimationController setTargetCornerRadius:](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "setTargetCornerRadius:", 0.0);
    -[THWImageCropAnimationController setCropDurationScale:](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "setCropDurationScale:", 0.5);
    -[THWImageCropAnimationController setCornerRadiusDurationScale:](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "setCornerRadiusDurationScale:", 0.5);
    -[THWImageCropAnimationController setupWrapperLayer](-[THWSceneRep imageCropAnimationController](self, "imageCropAnimationController"), "setupWrapperLayer");
  }
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

- (BOOL)tracksScore
{
  return self->_tracksScore;
}

- (NSArray)childReps
{
  return self->_childReps;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)loanedSceneController
{
  return self->_loanedSceneController;
}

- (void)setLoanedSceneController:(BOOL)a3
{
  self->_loanedSceneController = a3;
}

- (BOOL)sceneTransferHappened
{
  return self->_sceneTransferHappened;
}

- (void)setSceneTransferHappened:(BOOL)a3
{
  self->_sceneTransferHappened = a3;
}

- (BOOL)sceneDidReceiveRotationLayoutDuringFreeTransform
{
  return self->_sceneDidReceiveRotationLayoutDuringFreeTransform;
}

- (void)setSceneDidReceiveRotationLayoutDuringFreeTransform:(BOOL)a3
{
  self->_sceneDidReceiveRotationLayoutDuringFreeTransform = a3;
}

- (THWSceneController)sceneController
{
  return self->_sceneController;
}

- (void)setSceneController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->_pressableHandler;
}

- (void)setPressableHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (BOOL)isCurrentlyScrolling
{
  return self->_isCurrentlyScrolling;
}

- (THWImageCropAnimationController)imageCropAnimationController
{
  return self->_imageCropAnimationController;
}

- (void)setImageCropAnimationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (void)setExpandedRepController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

@end
