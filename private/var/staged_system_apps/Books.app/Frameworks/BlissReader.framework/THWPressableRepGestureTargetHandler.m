@implementation THWPressableRepGestureTargetHandler

- (THWPressableRepGestureTargetHandler)initWithPressableRep:(id)a3 pressHandler:(id)a4
{
  THWPressableRepGestureTargetHandler *v6;
  THWPressableRepGestureTargetHandler *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWPressableRepGestureTargetHandler;
  v6 = -[THWPressableRepGestureTargetHandler init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[THWPressableRepGestureTargetHandler setPressableRep:](v6, "setPressableRep:", a3);
    -[THWPressableRepGestureTargetHandler setPressHandler:](v7, "setPressHandler:", a4);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPressableRepGestureTargetHandler;
  -[THWPressableRepGestureTargetHandler dealloc](&v3, "dealloc");
}

- (BOOL)widgetInteractionDisabledOnPage
{
  id v3;

  v3 = objc_msgSend(-[THWPressableRep interactiveCanvasController](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "interactiveCanvasController"), "widgetHost");
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "widgetHostingAllowInteractionOnPageForRep:", -[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep")) ^ 1;
  return (char)v3;
}

- (BOOL)widgetInteractionAllowAutoplay
{
  id v3;

  v3 = objc_msgSend(-[THWPressableRep interactiveCanvasController](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "interactiveCanvasController"), "widgetHost");
  if (v3)
    return objc_msgSend(v3, "widgetHostingAllowAutoplayForRep:", -[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"));
  else
    return 1;
}

- (void)p_pressInAnimationWithCompletionBlock:(id)a3
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (-[THWPressableRep wantsPressAnimation](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "wantsPressAnimation"))
  {
    v5 = -[THWPressableRep pressableAnimationLayer](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "pressableAnimationLayer");
    v6 = -[THWPressableRep pressableAnimationShadowLayer](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "pressableAnimationShadowLayer");
    v7 = objc_msgSend(v5, "superlayer");
    objc_msgSend(v5, "bounds");
    objc_msgSend(v7, "convertPoint:fromLayer:", v5, TSDCenterOfRect(v8, v9, v10, v11));
    -[THWPressableRepGestureTargetHandler setPressPoint:](self, "setPressPoint:");
    v12 = objc_msgSend(v6, "superlayer");
    objc_msgSend(v6, "bounds");
    objc_msgSend(v12, "convertPoint:fromLayer:", v6, TSDCenterOfRect(v13, v14, v15, v16));
    -[THWPressableRepGestureTargetHandler setShadowPressPoint:](self, "setShadowPressPoint:");
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", a3);
    -[THWPressableRepGestureTargetHandler pressPoint](self, "pressPoint");
    objc_msgSend(v5, "addPressAnimationFromPoint:scale:");
    -[THWPressableRepGestureTargetHandler shadowPressPoint](self, "shadowPressPoint");
    objc_msgSend(v6, "addPressAnimationFromPoint:scale:");
    +[CATransaction commit](CATransaction, "commit");
  }
  else if (a3)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)p_recoilAnimationWithCompletionBlock:(id)a3
{
  id v5;
  id v6;

  if (-[THWPressableRep wantsPressAnimation](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "wantsPressAnimation"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", a3);
    v5 = -[THWPressableRep pressableAnimationLayer](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "pressableAnimationLayer");
    -[THWPressableRepGestureTargetHandler pressPoint](self, "pressPoint");
    objc_msgSend(v5, "addRecoilAnimationFromPoint:hardRebound:", 0);
    v6 = -[THWPressableRep pressableAnimationShadowLayer](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "pressableAnimationShadowLayer");
    -[THWPressableRepGestureTargetHandler shadowPressPoint](self, "shadowPressPoint");
    objc_msgSend(v6, "addRecoilAnimationFromPoint:hardRebound:", 0);
    +[CATransaction commit](CATransaction, "commit");
  }
  else if (a3)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)p_invokeAction
{
  THWPressableRepPressHandler *v3;
  THWPressableRep *v4;

  if (-[THWPressableRep wantsPressAction](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "wantsPressAction"))
  {
    v3 = -[THWPressableRepGestureTargetHandler pressHandler](self, "pressHandler");
    v4 = -[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep");
    -[THWPressableRepGestureTargetHandler pressPoint](self, "pressPoint");
    -[THWPressableRepPressHandler pressableRepWasPressed:atPoint:](v3, "pressableRepWasPressed:atPoint:", v4);
  }
}

- (void)p_relaxAnimationWithCompletionBlock:(id)a3
{
  id v5;
  id v6;

  if (-[THWPressableRep wantsPressAnimation](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "wantsPressAnimation"))
  {
    +[CATransaction begin](CATransaction, "begin");
    if (a3)
      +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", a3);
    v5 = -[THWPressableRep pressableAnimationLayer](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "pressableAnimationLayer");
    -[THWPressableRepGestureTargetHandler pressPoint](self, "pressPoint");
    objc_msgSend(v5, "addRelaxAnimationFromPoint:");
    v6 = -[THWPressableRep pressableAnimationShadowLayer](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "pressableAnimationShadowLayer");
    -[THWPressableRepGestureTargetHandler shadowPressPoint](self, "shadowPressPoint");
    objc_msgSend(v6, "addRelaxAnimationFromPoint:");
    +[CATransaction commit](CATransaction, "commit");
  }
  else if (a3)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)p_updateAnimation:(id)a3
{
  unsigned int v4;
  uint64_t v5;

  v4 = -[THWPressableRepGestureTargetHandler p_isGestureWithinPressableBounds:](self, "p_isGestureWithinPressableBounds:", a3);
  v5 = !-[THWPressableRepGestureTargetHandler isPressableAtPoint](self, "isPressableAtPoint") | v4;
  if ((v5 & 1) == 0)
  {
    -[THWPressableRepGestureTargetHandler p_relaxAnimationWithCompletionBlock:](self, "p_relaxAnimationWithCompletionBlock:", 0);
    goto LABEL_6;
  }
  if (!-[THWPressableRepGestureTargetHandler isPressableAtPoint](self, "isPressableAtPoint") && ((v4 ^ 1) & 1) == 0)
  {
    -[THWPressableRepGestureTargetHandler p_pressInAnimationWithCompletionBlock:](self, "p_pressInAnimationWithCompletionBlock:", &stru_429F60);
LABEL_6:
    -[THWPressableRepGestureTargetHandler setIsPressableAtPoint:](self, "setIsPressableAtPoint:", v5);
  }
}

- (BOOL)p_isPageInteractionMode
{
  return -[THWPressableRep widgetInteractionMode](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "widgetInteractionMode") == 0;
}

- (BOOL)widgetInteractionEnabled
{
  if (-[THWPressableRepGestureTargetHandler p_isPageInteractionMode](self, "p_isPageInteractionMode"))
    return !-[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](self, "widgetInteractionDisabledOnPage");
  else
    return 1;
}

- (BOOL)p_isGestureWithinPressableBounds:(id)a3
{
  THWPressableRep **p_pressableRep;
  id Weak;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGPoint v17;
  CGRect v18;

  p_pressableRep = &self->_pressableRep;
  Weak = objc_loadWeak((id *)&self->_pressableRep);
  if ((objc_opt_respondsToSelector(Weak, "pressableNaturalBounds") & 1) == 0)
    return 1;
  objc_msgSend(objc_loadWeak((id *)p_pressableRep), "pressableNaturalBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(a3, "naturalLocationForRep:", objc_loadWeak((id *)p_pressableRep));
  v17.x = v14;
  v17.y = v15;
  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.width = v11;
  v18.size.height = v13;
  return CGRectContainsPoint(v18, v17);
}

- (BOOL)p_gestureIsHandleable:(id)a3
{
  BOOL v5;
  id v6;
  id v7;
  BOOL v8;

  if (-[THWPressableRepGestureTargetHandler handlePressOnDoubleTap](self, "handlePressOnDoubleTap"))
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(a3, "gestureKind");
    v5 = v6 == (id)TSWPImmediatePress;
  }
  if (-[THWPressableRepGestureTargetHandler handlePressOnDoubleTap](self, "handlePressOnDoubleTap"))
  {
    v7 = objc_msgSend(a3, "gestureKind");
    v8 = v7 == (id)TSWPImmediateDoubleTap;
  }
  else
  {
    v8 = 0;
  }
  return v5 || v8;
}

- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4
{
  if (-[THWPressableRepGestureTargetHandler p_gestureIsHandleable:](self, "p_gestureIsHandleable:")
    && -[THWPressableRepGestureTargetHandler p_isGestureWithinPressableBounds:](self, "p_isGestureWithinPressableBounds:", a3))
  {
    return -[THWPressableRep shouldRecognizePressOnRep:](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "shouldRecognizePressOnRep:", a4);
  }
  else
  {
    return 0;
  }
}

- (BOOL)canHandleGesture:(id)a3
{
  double v5;
  double v6;
  id v7;

  if ((!-[THWPressableRepGestureTargetHandler p_isPageInteractionMode](self, "p_isPageInteractionMode")
     || !-[THWPressableRepGestureTargetHandler enabledOnlyIfWidgetInteractionDisabledOnPage](self, "enabledOnlyIfWidgetInteractionDisabledOnPage")|| -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](self, "widgetInteractionDisabledOnPage"))&& -[THWPressableRepGestureTargetHandler p_gestureIsHandleable:](self, "p_gestureIsHandleable:", a3)&& -[THWPressableRepGestureTargetHandler p_isGestureWithinPressableBounds:](self, "p_isGestureWithinPressableBounds:", a3)&& -[THWPressableRep wantsPressAction](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "wantsPressAction")&& (objc_msgSend(a3, "naturalLocationForRep:", -[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep")), (v7 = -[THWPressableRep hitRep:](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "hitRep:", v5,
                v6)) != 0))
  {
    return -[THWPressableRep shouldRecognizePressOnRep:](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "shouldRecognizePressOnRep:", v7);
  }
  else
  {
    return 0;
  }
}

- (BOOL)handleGesture:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  THWPressableRepGestureTargetHandler *v10;
  void ***v11;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  THWPressableRepGestureTargetHandler *v17;
  _QWORD v18[5];

  v5 = -[THWPressableRepGestureTargetHandler p_gestureIsHandleable:](self, "p_gestureIsHandleable:");
  if (v5)
  {
    v6 = objc_opt_class(UIGestureRecognizer);
    *(_QWORD *)&v7 = TSUDynamicCast(v6, a3).n128_u64[0];
    v9 = v8;
    if (objc_msgSend(objc_msgSend(v8, "view", v7), "isAncestorScrollViewDragging"))
      objc_msgSend(v9, "cancel");
    switch(objc_msgSend(a3, "gestureState"))
    {
      case 1u:
        self->_isPressed = 1;
        -[THWPressableRepGestureTargetHandler setIsPressableAtPoint:](self, "setIsPressableAtPoint:", 1);
        -[THWPressableRep setHandlingPress:](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "setHandlingPress:", 1);
        -[THWPressableRepGestureTargetHandler p_pressInAnimationWithCompletionBlock:](self, "p_pressInAnimationWithCompletionBlock:", &stru_429F80);
        break;
      case 2u:
        -[THWPressableRepGestureTargetHandler p_updateAnimation:](self, "p_updateAnimation:", a3);
        break;
      case 3u:
        if ((-[THWPressableRepGestureTargetHandler handlePressOnDoubleTap](self, "handlePressOnDoubleTap")
           || !-[THWPressableRepGestureTargetHandler isPressableAtPoint](self, "isPressableAtPoint"))
          && !-[THWPressableRepGestureTargetHandler handlePressOnDoubleTap](self, "handlePressOnDoubleTap"))
        {
          goto LABEL_5;
        }
        if ((objc_opt_respondsToSelector(-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "wantsRecoilAnimation") & 1) != 0&& -[THWPressableRep wantsRecoilAnimation](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "wantsRecoilAnimation"))
        {
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_149D40;
          v18[3] = &unk_426DD0;
          v18[4] = self;
          -[THWPressableRepGestureTargetHandler p_recoilAnimationWithCompletionBlock:](self, "p_recoilAnimationWithCompletionBlock:", v18);
          goto LABEL_7;
        }
        v13 = _NSConcreteStackBlock;
        v14 = 3221225472;
        v15 = sub_149D7C;
        v16 = &unk_426DD0;
        v17 = self;
        v11 = &v13;
        v10 = self;
        goto LABEL_6;
      case 4u:
      case 5u:
LABEL_5:
        -[THWPressableRep setHandlingPress:](-[THWPressableRepGestureTargetHandler pressableRep](self, "pressableRep"), "setHandlingPress:", 0);
        v10 = self;
        v11 = 0;
LABEL_6:
        -[THWPressableRepGestureTargetHandler p_relaxAnimationWithCompletionBlock:](v10, "p_relaxAnimationWithCompletionBlock:", v11, v13, v14, v15, v16, v17);
LABEL_7:
        self->_isPressed = 0;
        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (void)spoofGesture
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_149E08;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  -[THWPressableRepGestureTargetHandler p_pressInAnimationWithCompletionBlock:](self, "p_pressInAnimationWithCompletionBlock:", v2);
}

- (BOOL)handlePressOnDoubleTap
{
  return self->_handlePressOnDoubleTap;
}

- (void)setHandlePressOnDoubleTap:(BOOL)a3
{
  self->_handlePressOnDoubleTap = a3;
}

- (BOOL)isPressed
{
  return self->_isPressed;
}

- (BOOL)isPressableAtPoint
{
  return self->_isPressableAtPoint;
}

- (void)setIsPressableAtPoint:(BOOL)a3
{
  self->_isPressableAtPoint = a3;
}

- (BOOL)enabledOnlyIfWidgetInteractionDisabledOnPage
{
  return self->_enabledOnlyIfWidgetInteractionDisabledOnPage;
}

- (void)setEnabledOnlyIfWidgetInteractionDisabledOnPage:(BOOL)a3
{
  self->_enabledOnlyIfWidgetInteractionDisabledOnPage = a3;
}

- (THWPressableRep)pressableRep
{
  return (THWPressableRep *)objc_loadWeak((id *)&self->_pressableRep);
}

- (void)setPressableRep:(id)a3
{
  objc_storeWeak((id *)&self->_pressableRep, a3);
}

- (THWPressableRepPressHandler)pressHandler
{
  return self->_pressHandler;
}

- (void)setPressHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CGPoint)pressPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_pressPoint.x;
  y = self->_pressPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPressPoint:(CGPoint)a3
{
  self->_pressPoint = a3;
}

- (CGPoint)shadowPressPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_shadowPressPoint.x;
  y = self->_shadowPressPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setShadowPressPoint:(CGPoint)a3
{
  self->_shadowPressPoint = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pressableRep);
}

@end
