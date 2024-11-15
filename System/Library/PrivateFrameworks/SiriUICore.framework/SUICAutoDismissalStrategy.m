@implementation SUICAutoDismissalStrategy

- (SUICAutoDismissalStrategy)initWithIdleTimeout:(double)a3 extendedIdleTimeout:(double)a4 deviceSupportsFaceDetection:(BOOL)a5 deviceSupportsRaiseGestureDetection:(BOOL)a6
{
  SUICAutoDismissalStrategy *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUICAutoDismissalStrategy;
  result = -[SUICAutoDismissalStrategy init](&v11, sel_init);
  if (result)
  {
    result->_idleTimeout = a3;
    result->_extendedIdleTimeout = a4;
    result->_deviceSupportsFaceDetection = a5;
    result->_deviceSupportsRaiseGestureDetection = a6;
    *(_WORD *)&result->_userInteractedWithTouchScreen = 0;
    result->_viewRequiringExtendedTimeoutVisible = 0;
    *(_OWORD *)&result->_latestFaceAwarenessEvent = xmmword_1A377E250;
    result->_autoDismissalReason = 0;
  }
  return result;
}

- (void)setUserInteractedWithTouchScreen:(BOOL)a3
{
  if (self->_userInteractedWithTouchScreen != a3)
  {
    self->_userInteractedWithTouchScreen = a3;
    -[SUICAutoDismissalStrategy _notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:](self, "_notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:", 0);
  }
}

- (void)setUserInteractedWithTouchIDSensor:(BOOL)a3
{
  if (self->_userInteractedWithTouchIDSensor != a3)
  {
    self->_userInteractedWithTouchIDSensor = a3;
    -[SUICAutoDismissalStrategy _notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:](self, "_notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:", 0);
  }
}

- (void)setLatestFaceAwarenessEvent:(int64_t)a3
{
  if (self->_latestFaceAwarenessEvent != a3)
  {
    self->_latestFaceAwarenessEvent = a3;
    -[SUICAutoDismissalStrategy _notifyDelegateOfAutoDismissalDecisionChangeIfNeeded](self, "_notifyDelegateOfAutoDismissalDecisionChangeIfNeeded");
  }
}

- (void)setLatestDeviceMotionEvent:(int64_t)a3
{
  if (self->_latestDeviceMotionEvent != a3)
  {
    self->_latestDeviceMotionEvent = a3;
    -[SUICAutoDismissalStrategy _notifyDelegateOfAutoDismissalDecisionChangeIfNeeded](self, "_notifyDelegateOfAutoDismissalDecisionChangeIfNeeded");
  }
}

- (void)setVideoPlaying:(BOOL)a3
{
  if (self->_videoPlaying != a3)
  {
    self->_videoPlaying = a3;
    -[SUICAutoDismissalStrategy _notifyDelegateOfAutoDismissalDecisionChangeIfNeeded](self, "_notifyDelegateOfAutoDismissalDecisionChangeIfNeeded");
  }
}

- (void)setViewRequiringExtendedTimeoutVisible:(BOOL)a3
{
  double v4;

  if (self->_viewRequiringExtendedTimeoutVisible != a3)
  {
    self->_viewRequiringExtendedTimeoutVisible = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      self->_viewRequiringExtendedTimeoutStartTime = v4;
    }
    -[SUICAutoDismissalStrategy _notifyDelegateOfAutoDismissalDecisionChangeIfNeeded](self, "_notifyDelegateOfAutoDismissalDecisionChangeIfNeeded");
  }
}

- (void)setViewRequiringExtendedTimeoutStartTime:(double)a3
{
  self->_viewRequiringExtendedTimeoutStartTime = a3;
}

- (void)_notifyDelegateOfAutoDismissalDecisionChangeIfNeeded
{
  -[SUICAutoDismissalStrategy _notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:](self, "_notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:", 0);
}

- (void)_notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  NSNumber *lastShouldDismissValue;
  NSNumber *v7;
  NSNumber *v8;
  id WeakRetained;

  v3 = a3;
  v5 = -[SUICAutoDismissalStrategy shouldDismiss](self, "shouldDismiss");
  lastShouldDismissValue = self->_lastShouldDismissValue;
  if (!lastShouldDismissValue || v5 != -[NSNumber BOOLValue](lastShouldDismissValue, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lastShouldDismissValue;
    self->_lastShouldDismissValue = v7;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "autoDismissalStrategyDidChangeAutoDismissalDecision:dismissalReason:permanent:", self, -[SUICAutoDismissalStrategy autoDismissalReason](self, "autoDismissalReason"), v3);

  }
}

- (SUICAutoDismissalStrategyDelegate)delegate
{
  return (SUICAutoDismissalStrategyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)userInteractedWithTouchScreen
{
  return self->_userInteractedWithTouchScreen;
}

- (BOOL)userInteractedWithTouchIDSensor
{
  return self->_userInteractedWithTouchIDSensor;
}

- (int64_t)latestFaceAwarenessEvent
{
  return self->_latestFaceAwarenessEvent;
}

- (int64_t)latestDeviceMotionEvent
{
  return self->_latestDeviceMotionEvent;
}

- (BOOL)isVideoPlaying
{
  return self->_videoPlaying;
}

- (BOOL)isViewRequiringExtendedTimeoutVisible
{
  return self->_viewRequiringExtendedTimeoutVisible;
}

- (double)minimumIdleTimeInterval
{
  return self->_minimumIdleTimeInterval;
}

- (void)setMinimumIdleTimeInterval:(double)a3
{
  self->_minimumIdleTimeInterval = a3;
}

- (double)idleTimeInterval
{
  return self->_idleTimeInterval;
}

- (BOOL)shouldDismiss
{
  return self->_shouldDismiss;
}

- (int64_t)autoDismissalReason
{
  return self->_autoDismissalReason;
}

- (void)setAutoDismissalReason:(int64_t)a3
{
  self->_autoDismissalReason = a3;
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (double)extendedIdleTimeout
{
  return self->_extendedIdleTimeout;
}

- (BOOL)deviceSupportsFaceDetection
{
  return self->_deviceSupportsFaceDetection;
}

- (BOOL)deviceSupportsRaiseGestureDetection
{
  return self->_deviceSupportsRaiseGestureDetection;
}

- (double)viewRequiringExtendedTimeoutStartTime
{
  return self->_viewRequiringExtendedTimeoutStartTime;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastShouldDismissValue, 0);
}

@end
