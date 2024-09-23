@implementation SBAnyTopAffordanceInteractionMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  BOOL v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3 - 51 < 2 && !self->_hasSentEvent;
  v5 = v4;
  if (v4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02618]), "initWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.SpringBoard.multitasking.top-affordance.interaction"), CFSTR("com.apple.SpringBoard"), 0, 0);
    objc_msgSend(MEMORY[0x1E0D027B8], "discoverabilitySignal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sendEvent:", v7);
    self->_hasSentEvent = 1;

  }
  return v5;
}

- (BOOL)hasSentEvent
{
  return self->_hasSentEvent;
}

- (void)setHasSentEvent:(BOOL)a3
{
  self->_hasSentEvent = a3;
}

@end
