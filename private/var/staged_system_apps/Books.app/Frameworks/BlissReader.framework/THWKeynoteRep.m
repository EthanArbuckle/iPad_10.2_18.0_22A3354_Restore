@implementation THWKeynoteRep

- (THWKeynoteRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWKeynoteRep *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWKeynoteRep;
  v4 = -[THWKeynoteRep initWithLayout:canvas:](&v6, "initWithLayout:canvas:", a3, a4);
  if (v4)
    v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWKeynoteRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteRep;
  -[THWKeynoteRep dealloc](&v3, "dealloc");
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
    *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWKeynoteRep interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
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

- (void)wasAddedToParent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteRep;
  -[THWKeynoteRep wasAddedToParent](&v3, "wasAddedToParent");
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "p_keynoteShowDidUpdate:", CFSTR("kTSWTransportControlCloneDidUpdateNotification"), 0);
}

- (void)willBeRemovedFromParent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteRep;
  -[THWKeynoteRep willBeRemovedFromParent](&v3, "willBeRemovedFromParent");
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kTSWTransportControlCloneDidUpdateNotification"), 0);
}

- (int)positionForChildView:(id)a3
{
  return 2;
}

- (unint64_t)hitTestOptions
{
  return 4;
}

- (void)viewScaleDidChange
{
  if (-[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWKeynoteRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage"))
  {
    -[THWKeynoteRep p_stop](self, "p_stop");
  }
  objc_msgSend(-[THWKeynoteRep layout](self, "layout"), "invalidateFrame");
  objc_msgSend(-[THWKeynoteRep layout](self, "layout"), "invalidateChildren");
}

- (id)cloneForTransportControl:(id)a3
{
  return -[THWKeynoteShowRep transportControlClone](-[THWKeynoteRep showRep](self, "showRep", a3), "transportControlClone");
}

- (void)p_play
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_175680;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Keynote Play", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)p_stop
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_175714;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Keynote Stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  const __CFString *v7;

  v5 = a5;
  v6 = THBundle();
  if (v5)
    v7 = CFSTR("play-keynote-64-P");
  else
    v7 = CFSTR("play-keynote-64");
  return +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", v7, v6);
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
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
  double v16;
  double v17;
  CATransform3D v18;
  CATransform3D v19;

  objc_msgSend(a4, "setContentsGravity:", kCAGravityResizeAspectFill);
  objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
  v7 = TSDMultiplySizeScalar(72.0, 72.0, v6);
  v9 = v8;
  objc_msgSend(a4, "bounds");
  v12 = TSDShrinkSizeToFitInSize(v7, v9, v10, v11);
  v14 = v13;
  objc_msgSend(a4, "bounds");
  v17 = THScaleNeededToFitSizeInSize(v15, v16, v12, v14);
  CATransform3DMakeScale(&v19, v17, v17, 1.0);
  v18 = v19;
  objc_msgSend(a4, "setTransform:", &v18);
}

- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4
{
  if (-[THWKeynoteRep pressableHandler](self, "pressableHandler", a3, a4))
    return -[THWPressableRepGestureTargetHandler widgetInteractionEnabled](-[THWKeynoteRep pressableHandler](self, "pressableHandler"), "widgetInteractionEnabled");
  else
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
    -[THAnimationController setSource:](v4, "setSource:", self);
    -[THAnimationController addObserver:](self->_animationController, "addObserver:", self);
    return self->_animationController;
  }
  return result;
}

- (void)expandableExpandedPresentationDidEnd
{
  if (-[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWKeynoteRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage"))
  {
    -[THWKeynoteRep p_stop](self, "p_stop");
  }
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  return objc_msgSend(objc_msgSend(-[THWKeynoteRep info](self, "info"), "adornmentInfo"), "panelContentProviderHasContentForPanel:", *(_QWORD *)&a3);
}

- (id)expandedChildInfosForPanel:(int)a3
{
  return objc_msgSend(objc_msgSend(-[THWKeynoteRep info](self, "info"), "adornmentInfo"), "panelContentProviderChildInfosForPanel:", *(_QWORD *)&a3);
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  objc_msgSend(-[THWKeynoteRep layout](self, "layout", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "invalidateFrame");
}

- (id)expandedSupportedGestureKinds
{
  return -[THWKeynoteShowRep supportedGestureKinds](-[THWKeynoteRep showRep](self, "showRep"), "supportedGestureKinds");
}

- (BOOL)expandedHasRoomForPanelsWithHeight:(double)a3 inFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGRect v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  TSDScaleSizeWithinSize(objc_msgSend(-[THWKeynoteShowRep layout](-[THWKeynoteRep showRep](self, "showRep"), "layout"), "showSize"));
  v10 = v9;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return CGRectGetHeight(v12) - v10 >= a3;
}

- (void)didPresentExpandedPostCommit
{
  +[CATransaction flush](CATransaction, "flush");
  -[THWKeynoteShowRep playPreparedShow](-[THWKeynoteRep showRep](self, "showRep"), "playPreparedShow");
}

- (int)expandedAppearance
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 2;
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (void)p_togglePanelDescriptionExpanded
{
  -[THWKeynoteRep setPanelDescriptionExpanded:](self, "setPanelDescriptionExpanded:", -[THWKeynoteRep panelDescriptionExpanded](self, "panelDescriptionExpanded") ^ 1);
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
  v7[2] = sub_175B6C;
  v7[3] = &unk_426DD0;
  v7[4] = self;
  return -[THWTapGestureAction initWithAction:]([THWTapGestureAction alloc], "initWithAction:", v7);
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  id v6;

  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    v6 = objc_msgSend(-[THWKeynoteRep layout](self, "layout", a3), "layoutController");
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

- (void)handleNavigateNextCommand
{
  TSWTransportControlClone *v2;

  v2 = -[THWKeynoteShowRep transportControlClone](-[THWKeynoteRep showRep](self, "showRep"), "transportControlClone");
  if (-[TSWTransportControlClone transportControlCloneCanGotoNext](v2, "transportControlCloneCanGotoNext"))-[TSWTransportControlClone transportControlCloneGotoNext](v2, "transportControlCloneGotoNext");
}

- (void)handleNavigatePreviousCommand
{
  TSWTransportControlClone *v2;

  v2 = -[THWKeynoteShowRep transportControlClone](-[THWKeynoteRep showRep](self, "showRep"), "transportControlClone");
  if (-[TSWTransportControlClone transportControlCloneCanGotoPrev](v2, "transportControlCloneCanGotoPrev"))-[TSWTransportControlClone transportControlCloneGotoPrev](v2, "transportControlCloneGotoPrev");
}

- (int)autoRotationMode
{
  return 3;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;

  v5 = TSDScaleSizeWithinSize(objc_msgSend(-[THWKeynoteShowRep layout](-[THWKeynoteRep showRep](self, "showRep"), "layout"), "showSize"));
  v7 = v6;
  v8 = TSDScaleSizeWithinSize(objc_msgSend(-[THWKeynoteShowRep layout](-[THWKeynoteRep showRep](self, "showRep"), "layout"), "showSize"))
     / v5;
  *(float *)&v9 = v9 / v7;
  return fminf(v8, *(float *)&v9);
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
  objc_msgSend(-[THWKeynoteRep layout](self, "layout", a3.width, a3.height), "invalidateFrame");
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

  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))return objc_msgSend(-[THWKeynoteRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", -[THWKeynoteRep showRep](self, "showRep"));
  result = -[THWFreeTransformController freeTransformLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "freeTransformLayer");
  if (!result)
    return objc_msgSend(-[THWKeynoteRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", -[THWKeynoteRep showRep](self, "showRep"));
  return result;
}

- (id)shadowAnimationLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    return -[THWFreeTransformController shadowLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "shadowLayer");
  }
  else
  {
    return 0;
  }
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
  result = (CGAffineTransform *)-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
  if ((_DWORD)result)
  {
    result = -[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc");
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
  return 0;
}

- (id)targetLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress")&& !-[THWFreeTransformController passedThreshold](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "passedThreshold"))
  {
    return 0;
  }
  else
  {
    return -[THWKeynoteRep animationLayer](self, "animationLayer");
  }
}

- (CGRect)ftcTargetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    -[THWFreeTransformController completionTargetRect](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "completionTargetRect");
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

- (void)animationControllerDidPresent:(id)a3
{

  self->_animationController = 0;
}

- (THWKeynoteShowRep)showRep
{
  uint64_t v3;
  THWKeynoteShowRep *result;

  v3 = objc_opt_class(THWKeynoteShowRep);
  TSUDynamicCast(v3, objc_msgSend(-[THWKeynoteRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(-[THWKeynoteRep layout](self, "layout"), "showLayout")));
  return result;
}

- (THWTransportControlRep)transportControlRep
{
  uint64_t v3;
  THWTransportControlRep *result;

  v3 = objc_opt_class(THWTransportControlRep);
  TSUDynamicCast(v3, objc_msgSend(-[THWKeynoteRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(-[THWKeynoteRep layout](self, "layout"), "transportControlLayout")));
  return result;
}

- (void)p_keynoteShowDidUpdate:(id)a3
{
  TSWTransportControlClone *v4;

  v4 = (TSWTransportControlClone *)objc_msgSend(a3, "object");
  if (v4 == -[THWKeynoteShowRep transportControlClone](-[THWKeynoteRep showRep](self, "showRep"), "transportControlClone"))objc_msgSend(-[THWKeynoteRep layout](self, "layout"), "hidePlayButton");
}

- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4
{
  id v6;

  if (-[THWPressableRepGestureTargetHandler canHandleGesture:forChildRep:](-[THWKeynoteRep pressableHandler](self, "pressableHandler"), "canHandleGesture:forChildRep:", a3, a4))
  {
    return 1;
  }
  v6 = objc_msgSend(a3, "gestureKind");
  return v6 == (id)TSDFreeTransform;
}

- (BOOL)isExpanded
{
  return objc_msgSend(-[THWKeynoteRep layout](self, "layout"), "isExpanded");
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  double v2;
  double v3;

  objc_msgSend(objc_msgSend(-[THWKeynoteRep layout](self, "layout"), "geometry"), "size");
  return v3 < 660.0 || v2 < 960.0;
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
  return -[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
}

- (void)freeTransformWillBegin
{
  objc_msgSend(-[THWKeynoteRep layout](self, "layout"), "hidePlayButton");
  -[THWKeynoteShowRep pauseLayerUpdates](-[THWKeynoteRep showRep](self, "showRep"), "pauseLayerUpdates");
}

- (void)freeTransformDidEnd
{
  objc_msgSend(-[THWKeynoteRep layout](self, "layout"), "showPlayButton");
  -[THWKeynoteShowRep resumeLayerUpdatesAndLayoutImmediately](-[THWKeynoteRep showRep](self, "showRep"), "resumeLayerUpdatesAndLayoutImmediately");
}

- (CGRect)rectForCompletion
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THWKeynoteShowRep layout](-[THWKeynoteRep showRep](self, "showRep"), "layout"), "frameInParent");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)canHandleGesture:(id)a3
{
  if (-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWKeynoteRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3))
  {
    return 1;
  }
  else
  {
    return -[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3);
  }
}

- (BOOL)handleGesture:(id)a3
{
  if (-[THWPressableRepGestureTargetHandler handleGesture:](-[THWKeynoteRep pressableHandler](self, "pressableHandler"), "handleGesture:", a3))
  {
    return 1;
  }
  else
  {
    return -[THWFreeTransformableRepGestureTargetHandler handleGesture:](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "handleGesture:", a3);
  }
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDFreeTransform)
    -[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:](-[THWKeynoteRep freeTransformableHandler](self, "freeTransformableHandler"), "willBeginHandlingGesture:", a3);
}

- (BOOL)freeTransformInteractionEnabledOverride
{
  return 1;
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  return -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWKeynoteRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage");
}

- (BOOL)wantsPressAction
{
  _BOOL4 v3;

  if (-[THWKeynoteRep meetsStageDimensionRequirementForExpanded](self, "meetsStageDimensionRequirementForExpanded")
    || (v3 = -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](self->_pressableHandler, "widgetInteractionDisabledOnPage")))
  {
    LOBYTE(v3) = -[THWKeynoteRep pressableAction](self, "pressableAction") != 0;
  }
  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return objc_msgSend(-[THWKeynoteRep layout](self, "layout", a3), "isExpanded") ^ 1;
}

- (int)pressableAction
{
  return 2;
}

- (CGRect)pressableNaturalBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(objc_msgSend(-[THWKeynoteShowRep layout](-[THWKeynoteRep showRep](self, "showRep"), "layout"), "geometry"), "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 1;
}

- (BOOL)widgetInteractionAllowAutoplayForCompact
{
  return 1;
}

- (THWAutoplayConfig)autoplayConfig
{
  return (THWAutoplayConfig *)objc_msgSend(-[THWKeynoteRep info](self, "info"), "autoplayConfig");
}

- (BOOL)autoplayAllowed
{
  return -[THWPressableRepGestureTargetHandler widgetInteractionAllowAutoplay](-[THWKeynoteRep pressableHandler](self, "pressableHandler"), "widgetInteractionAllowAutoplay");
}

- (BOOL)keynoteShowRep:(id)a3 handleURL:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  id v11;

  v7 = objc_msgSend(objc_msgSend(a4, "scheme"), "lowercaseString");
  if (-[THWKeynoteRep showRep](self, "showRep") != a3)
    goto LABEL_2;
  LODWORD(v8) = objc_msgSend(objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "validURLSchemes"), "containsObject:", v7);
  if (!(_DWORD)v8)
    return (char)v8;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("ibooks")) || objc_msgSend(a4, "host"))
  {
    objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "openURL:", a4);
LABEL_2:
    LOBYTE(v8) = 0;
    return (char)v8;
  }
  if (-[THWKeynoteRep isExpanded](self, "isExpanded"))
  {
    v8 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWExpandedViewController, objc_msgSend(-[THWKeynoteRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
    if (!v8)
      return (char)v8;
    objc_msgSend(v8, "handleHyperlinkWithURL:", a4);
  }
  else
  {
    v9 = objc_opt_class(THInteractiveCanvasController);
    *(_QWORD *)&v10 = TSUDynamicCast(v9, -[THWKeynoteRep interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
    objc_msgSend(v11, "performSelectorOnMainThread:withObject:waitUntilDone:", "handleHyperlinkWithURL:", a4, 0, v10);
  }
  LOBYTE(v8) = 1;
  return (char)v8;
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

- (void)setPressableHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
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
