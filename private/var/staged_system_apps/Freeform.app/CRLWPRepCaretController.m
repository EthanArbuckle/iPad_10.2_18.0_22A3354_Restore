@implementation CRLWPRepCaretController

- (CRLWPRepCaretController)initWithDelegate:(id)a3
{
  id v4;
  CRLWPRepCaretController *v5;
  CRLWPRepCaretController *v6;
  uint64_t v7;
  double v8;
  objc_class *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLWPRepCaretController;
  v5 = -[CRLWPRepCaretController init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    *(_QWORD *)&v8 = objc_opt_class(CRLWPRepCaretAnimationConfigurator, v7).n128_u64[0];
    v6->_caretAnimatorConfigurator = v9;
    if (-[CRLWPRepCaretController p_isRedesignedTextCursorEnabled](v6, "p_isRedesignedTextCursorEnabled", v8))
      v6->_suppressCaret = 1;
  }

  return v6;
}

- (void)tearDown
{
  id WeakRetained;
  CALayer *caretLayer;

  WeakRetained = objc_loadWeakRetained((id *)&self->_caretTimer);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)&self->_delegate, 0);
  -[CALayer setDelegate:](self->_caretLayer, "setDelegate:", 0);
  caretLayer = self->_caretLayer;
  self->_caretLayer = 0;

}

- (void)setCaretLayer:(id)a3
{
  CALayer *v4;
  CALayer *caretLayer;

  v4 = (CALayer *)a3;
  -[CALayer setDelegate:](self->_caretLayer, "setDelegate:", 0);
  -[CALayer setDelegate:](v4, "setDelegate:", self);
  caretLayer = self->_caretLayer;
  self->_caretLayer = v4;

}

- (void)setSuppressCaret:(BOOL)a3
{
  self->_suppressCaret = a3;
}

- (BOOL)p_shouldSuppressSelectionHighlight
{
  id WeakRetained;
  unsigned __int8 v5;

  if (-[CRLWPRepCaretController p_isRedesignedTextCursorEnabled](self, "p_isRedesignedTextCursorEnabled"))
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "isSelectionHighlightSuppressed");

  return v5;
}

- (BOOL)p_isRedesignedTextCursorEnabled
{
  return +[CRLFeatureFlagGroup isRedesignedTextCursorEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isRedesignedTextCursorEnabled");
}

- (BOOL)caretAnimates
{
  return !self->_animationDisabled;
}

- (void)setCaretAnimates:(BOOL)a3
{
  if (a3)
    -[CRLWPRepCaretController p_enableAnimation](self, "p_enableAnimation");
  else
    -[CRLWPRepCaretController p_disableAnimation](self, "p_disableAnimation");
}

- (void)p_disableAnimation
{
  if (!self->_animationDisabled)
  {
    self->_animationDisabled = 1;
    if (!-[CRLWPRepCaretController p_caretIsHidden](self, "p_caretIsHidden"))
      -[CRLWPRepCaretController stopCaretLayerAnimationHidingCaret:](self, "stopCaretLayerAnimationHidingCaret:", 0);
  }
}

- (void)p_enableAnimation
{
  if (self->_animationDisabled)
  {
    self->_animationDisabled = 0;
    if (!-[CRLWPRepCaretController p_caretIsHidden](self, "p_caretIsHidden"))
      -[CRLWPRepCaretController p_startCaretLayerAnimation](self, "p_startCaretLayerAnimation");
  }
}

- (void)willEnterForeground
{
  if (!-[CRLWPRepCaretController p_caretIsHidden](self, "p_caretIsHidden"))
    -[CRLWPRepCaretController p_startCaretLayerAnimation](self, "p_startCaretLayerAnimation");
}

- (void)didEnterBackground
{
  if (!-[CRLWPRepCaretController p_caretIsHidden](self, "p_caretIsHidden"))
    -[CRLWPRepCaretController stopCaretLayerAnimationHidingCaret:](self, "stopCaretLayerAnimationHidingCaret:", 1);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (-[objc_class caretShouldFade](self->_caretAnimatorConfigurator, "caretShouldFade")
    && objc_msgSend(v5, "isEqualToString:", CFSTR("opacity")))
  {

    v6 = 0;
  }

  return v6;
}

- (void)p_startCaretLayerAnimation
{
  id WeakRetained;
  _QWORD block[5];

  self->_caretCancelled = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_caretTimer);
  if (WeakRetained)
  {

  }
  else if (!-[CRLWPRepCaretController p_shouldSuppressSelectionHighlight](self, "p_shouldSuppressSelectionHighlight"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003B662C;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)stopCaretLayerAnimationHidingCaret:(BOOL)a3
{
  _BOOL4 v3;
  CALayer *v5;
  id WeakRetained;
  _QWORD v7[5];
  id v8;
  CALayer *v9;
  BOOL v10;

  v3 = a3;
  v5 = self->_caretLayer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_caretTimer);
  self->_caretCancelled = 1;
  if (WeakRetained || v3)
  {
    objc_storeWeak((id *)&self->_caretTimer, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1003B67E0;
    v7[3] = &unk_101243EE0;
    v7[4] = self;
    v8 = WeakRetained;
    v10 = v3;
    v9 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  }
}

- (void)showCaretLayerStartingAnimation
{
  id WeakRetained;
  id v4;
  unsigned __int8 v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_caretTimer);

  v4 = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(v4, "selectionChangeWasLocal");

  if ((v5 & 1) != 0 || !WeakRetained)
  {
    if (!self->_animationDisabled)
    {
      -[CRLWPRepCaretController stopCaretLayerAnimationHidingCaret:](self, "stopCaretLayerAnimationHidingCaret:", 0);
      -[CRLWPRepCaretController p_startCaretLayerAnimation](self, "p_startCaretLayerAnimation");
    }
    if (!-[CRLWPRepCaretController suppressCaret](self, "suppressCaret"))
    {
      -[CALayer setHidden:](self->_caretLayer, "setHidden:", 0);
      -[CRLWPRepCaretController p_setCaretOn:forLayer:](self, "p_setCaretOn:forLayer:", 1, self->_caretLayer);
    }
  }
}

- (BOOL)caretIsHidden
{
  id WeakRetained;
  BOOL v4;

  if (!-[CRLWPRepCaretController p_caretIsHidden](self, "p_caretIsHidden")
    && !-[CALayer isHidden](self->_caretLayer, "isHidden"))
  {
    return 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_caretTimer);
  v4 = WeakRetained == 0;

  return v4;
}

- (void)hideCaretLayer
{
  if (!self->_animationDisabled)
    -[CRLWPRepCaretController stopCaretLayerAnimationHidingCaret:](self, "stopCaretLayerAnimationHidingCaret:", 1);
  -[CALayer setHidden:](self->_caretLayer, "setHidden:", 1);
}

- (void)p_caretTimerFired:(id)a3
{
  id WeakRetained;
  float v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if (-[objc_class caretShouldFade](self->_caretAnimatorConfigurator, "caretShouldFade"))
    {
      -[CALayer opacity](self->_caretLayer, "opacity");
      v6 = v5 <= 0.01;
      v7 = v5 > 0.01;
      +[CATransaction begin](CATransaction, "begin");
      -[objc_class animationDurationForHide:](self->_caretAnimatorConfigurator, "animationDurationForHide:", v7);
      +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
      -[CRLWPRepCaretController p_setCaretOn:forLayer:](self, "p_setCaretOn:forLayer:", v6, self->_caretLayer);
      +[CATransaction commit](CATransaction, "commit");
      -[objc_class animationCycleForHide:](self->_caretAnimatorConfigurator, "animationCycleForHide:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_caretTimerFired:", 0, 0));
      objc_storeWeak((id *)&self->_caretTimer, v8);

    }
    else
    {
      -[CRLWPRepCaretController p_toggleCaretOpacity](self, "p_toggleCaretOpacity");
    }
  }
  else
  {
    objc_msgSend(v9, "invalidate");
  }

}

- (void)p_setCaretOn:(BOOL)a3 forLayer:(id)a4
{
  _BOOL4 v4;
  double v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if (-[objc_class caretShouldFade](self->_caretAnimatorConfigurator, "caretShouldFade"))
  {
    LODWORD(v6) = 1008981770;
    if (v4)
      *(float *)&v6 = 1.0;
    objc_msgSend(v7, "setOpacity:", v6);
  }

}

- (BOOL)p_caretIsHidden
{
  float v2;

  -[CALayer opacity](self->_caretLayer, "opacity");
  return v2 == 0.01;
}

- (void)p_setCaretOpacity:(float)a3
{
  -[CALayer setOpacity:](self->_caretLayer, "setOpacity:");
}

- (void)p_toggleCaretOpacity
{
  BOOL v3;
  double v4;

  -[CALayer opacity](self->_caretLayer, "opacity");
  v3 = *(float *)&v4 == 0.01;
  LODWORD(v4) = 1.0;
  if (!v3)
    *(float *)&v4 = 0.01;
  -[CRLWPRepCaretController p_setCaretOpacity:](self, "p_setCaretOpacity:", v4);
}

- (CALayer)caretLayer
{
  return self->_caretLayer;
}

- (BOOL)suppressCaret
{
  return self->_suppressCaret;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_caretTimer);
  objc_storeStrong((id *)&self->_caretLayer, 0);
}

@end
