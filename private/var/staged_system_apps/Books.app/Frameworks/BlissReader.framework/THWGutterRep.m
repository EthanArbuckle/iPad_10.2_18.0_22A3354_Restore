@implementation THWGutterRep

- (THWGutterRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWGutterRep *v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THWGutterRep;
  v4 = -[THWGutterRep initWithLayout:canvas:](&v8, "initWithLayout:canvas:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_class(THInteractiveCanvasController);
    TSUDynamicCast(v5, -[THWGutterRep interactiveCanvasController](v4, "interactiveCanvasController"));
    -[THWGutterRep setPressableHandler:](v4, "setPressableHandler:", -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", v4, objc_msgSend(v6, "pressHandlerForPressableReps")));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mAnimationController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWGutterRep;
  -[THWGutterRep dealloc](&v3, "dealloc");
}

- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4
{
  return -[THWPressableRepGestureTargetHandler canHandleGesture:forChildRep:](-[THWGutterRep pressableHandler](self, "pressableHandler"), "canHandleGesture:forChildRep:", a3, a4);
}

- (CALayer)pressableAnimationLayer
{
  return (CALayer *)objc_msgSend(-[THWGutterRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", objc_msgSend(-[THWGutterRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWGutterRep info](self, "info"), "stageInfo")));
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (id)infoForPressable
{
  return objc_msgSend(-[THWGutterRep info](self, "info"), "associatedInfo");
}

- (int)pressableAction
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWGutterRep;
  return -[THWGutterRep pressableAction](&v3, "pressableAction");
}

- (BOOL)wantsPressAnimation
{
  if ((objc_msgSend(objc_msgSend(-[THWGutterRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWGutterRep info](self, "info"), "stageInfo")), "allowsAction:", -[THWGutterRep pressableAction](self, "pressableAction")) & 1) != 0)return 1;
  if (-[THWGutterRep pressableAction](self, "pressableAction") == 1)
    return objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, -[THWGutterRep infoForPressable](self, "infoForPressable")), "popUpInfo") != 0;
  return 0;
}

- (BOOL)wantsPressAction
{
  if ((objc_msgSend(objc_msgSend(-[THWGutterRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(-[THWGutterRep info](self, "info"), "stageInfo")), "allowsAction:", -[THWGutterRep pressableAction](self, "pressableAction")) & 1) != 0)return 1;
  if (-[THWGutterRep pressableAction](self, "pressableAction") == 1)
    return objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, -[THWGutterRep infoForPressable](self, "infoForPressable")), "popUpInfo") != 0;
  return 0;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  id v5;
  id v6;

  v5 = objc_msgSend(a3, "info");
  if (v5 == objc_msgSend(-[THWGutterRep info](self, "info"), "stageInfo"))
    return 1;
  v6 = objc_msgSend(a3, "info");
  return v6 == objc_msgSend(-[THWGutterRep info](self, "info"), "backgroundShape");
}

- (BOOL)shouldHitTestChildImageRep:(id)a3
{
  return 1;
}

- (CGRect)frameForPopupInUnscaledCanvas
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(objc_msgSend(-[THWGutterRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutForInfo:", objc_msgSend(-[THWGutterRep info](self, "info"), "stageInfo")), "frameInRoot");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return objc_msgSend(a3, "targetLayer") != 0;
}

- (id)shadowAnimationLayer
{
  return 0;
}

- (CGAffineTransform)freeTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return objc_msgSend(a3, "targetLayer") != 0;
}

- (id)expandedContentDrawableToPresent
{
  id v2;
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  id v12;

  v2 = objc_msgSend(-[THWGutterRep info](self, "info"), "expandedDrawableToPresent");
  v3 = objc_opt_class(THWDrawablesWidgetInfo);
  *(_QWORD *)&v5 = TSUDynamicCast(v3, v2).n128_u64[0];
  if (!v4)
  {
    v8 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, v2);
    if (v8)
    {
LABEL_5:
      v9 = objc_msgSend(v8, "popUpInfo");
      if (v9)
        return (id)TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, v9);
    }
    return v2;
  }
  v6 = v4;
  v7 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, objc_msgSend(v4, "stageDrawable", v5));
  if (objc_msgSend(v7, "popUpInfo"))
  {
    v8 = v7;
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "expandedStageDrawable"))
    v11 = objc_msgSend(v6, "expandedStageDrawable");
  else
    v11 = objc_msgSend(v6, "stageDrawable");
  v12 = objc_msgSend(v11, "repClass");
  if (!objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___THWExpandedRep)
    || (objc_opt_respondsToSelector(v12, "expandedAllowsPresentationInExpandedForInfo:isReflowablePresentation:") & 1) != 0
    && !objc_msgSend(v12, "expandedAllowsPresentationInExpandedForInfo:isReflowablePresentation:", objc_msgSend(v6, "expandedStageDrawable"), 0))
  {
    return v6;
  }
  if (objc_msgSend(v6, "expandedStageDrawable"))
    return objc_msgSend(v6, "expandedStageDrawable");
  else
    return objc_msgSend(v6, "stageDrawable");
}

- (BOOL)canHandleGesture:(id)a3
{
  return -[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWGutterRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3);
}

- (BOOL)handleGesture:(id)a3
{
  return -[THWPressableRepGestureTargetHandler handleGesture:](-[THWGutterRep pressableHandler](self, "pressableHandler"), "handleGesture:", a3);
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 1;
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

- (void)animationControllerDidPresent:(id)a3
{

  self->mAnimationController = 0;
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->_pressableHandler;
}

- (void)setPressableHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

@end
