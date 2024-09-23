@implementation SBGestureSwitcherModifierEvent

- (SBGestureSwitcherModifierEvent)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 gestureType:(int64_t)a5 phase:(unint64_t)a6
{
  id v11;
  id v12;
  SBGestureSwitcherModifierEvent *v13;
  SBGestureSwitcherModifierEvent *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBGestureSwitcherModifierEvent;
  v13 = -[SBGestureSwitcherModifierEvent init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_gestureID, a3);
    objc_storeStrong((id *)&v14->_selectedAppLayout, a4);
    v14->_gestureType = a5;
    v14->_phase = a6;
    v14->_touchType = 0;
    v14->_mouseEvent = 0;
    v14->_pointerTouch = 0;
  }

  return v14;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)isGestureEvent
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBGestureSwitcherModifierEvent;
  v4 = -[SBChainableModifierEvent copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSUUID copy](self->_gestureID, "copy");
  v6 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v5;

  v7 = -[SBAppLayout copy](self->_selectedAppLayout, "copy");
  v8 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v7;

  *((_QWORD *)v4 + 6) = self->_gestureType;
  *((_QWORD *)v4 + 7) = self->_phase;
  *((_QWORD *)v4 + 8) = self->_touchType;
  v4[25] = self->_mouseEvent;
  v4[24] = self->_pointerTouch;
  v4[26] = self->_canceled;
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_lastTouchTimestamp;
  *(CGPoint *)(v4 + 104) = self->_locationInContainerView;
  *(CGPoint *)(v4 + 120) = self->_translationInContainerView;
  *(CGPoint *)(v4 + 136) = self->_velocityInContainerView;
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_hysteresis;
  objc_storeStrong((id *)v4 + 12, self->_touchHistoryProvider);
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBGestureSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_gestureID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("gestureID"));

  v6 = self->_phase - 1;
  if (v6 > 2)
    v7 = CFSTR("Possible");
  else
    v7 = off_1E8EBB6A0[v6];
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("phase"));
  SBStringForFluidSwitcherGestureType(self->_gestureType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("gestureType"));

  -[SBAppLayout succinctDescription](self->_selectedAppLayout, "succinctDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("selectedAppLayout"));

  return v4;
}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[SBGestureRecognizerTouchHistoryProviding averageTouchVelocityOverTimeDuration:](self->_touchHistoryProvider, "averageTouchVelocityOverTimeDuration:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  double result;

  -[SBGestureRecognizerTouchHistoryProviding averageTouchPathAngleOverTimeDuration:](self->_touchHistoryProvider, "averageTouchPathAngleOverTimeDuration:", a3);
  return result;
}

- (double)peakSpeed
{
  double result;

  -[SBGestureRecognizerTouchHistoryProviding peakSpeed](self->_touchHistoryProvider, "peakSpeed");
  return result;
}

- (NSUUID)gestureID
{
  return self->_gestureID;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (int64_t)gestureType
{
  return self->_gestureType;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (int64_t)touchType
{
  return self->_touchType;
}

- (void)setTouchType:(int64_t)a3
{
  self->_touchType = a3;
}

- (BOOL)isPointerTouch
{
  return self->_pointerTouch;
}

- (void)setPointerTouch:(BOOL)a3
{
  self->_pointerTouch = a3;
}

- (BOOL)isMouseEvent
{
  return self->_mouseEvent;
}

- (void)setMouseEvent:(BOOL)a3
{
  self->_mouseEvent = a3;
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (double)lastTouchTimestamp
{
  return self->_lastTouchTimestamp;
}

- (void)setLastTouchTimestamp:(double)a3
{
  self->_lastTouchTimestamp = a3;
}

- (CGPoint)locationInContainerView
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInContainerView.x;
  y = self->_locationInContainerView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocationInContainerView:(CGPoint)a3
{
  self->_locationInContainerView = a3;
}

- (CGPoint)translationInContainerView
{
  double x;
  double y;
  CGPoint result;

  x = self->_translationInContainerView.x;
  y = self->_translationInContainerView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTranslationInContainerView:(CGPoint)a3
{
  self->_translationInContainerView = a3;
}

- (CGPoint)velocityInContainerView
{
  double x;
  double y;
  CGPoint result;

  x = self->_velocityInContainerView.x;
  y = self->_velocityInContainerView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setVelocityInContainerView:(CGPoint)a3
{
  self->_velocityInContainerView = a3;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (unint64_t)hidEventSenderID
{
  return self->_hidEventSenderID;
}

- (void)setHidEventSenderID:(unint64_t)a3
{
  self->_hidEventSenderID = a3;
}

- (SBGestureRecognizerTouchHistoryProviding)touchHistoryProvider
{
  return self->_touchHistoryProvider;
}

- (void)setTouchHistoryProvider:(id)a3
{
  objc_storeStrong((id *)&self->_touchHistoryProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchHistoryProvider, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_gestureID, 0);
}

@end
