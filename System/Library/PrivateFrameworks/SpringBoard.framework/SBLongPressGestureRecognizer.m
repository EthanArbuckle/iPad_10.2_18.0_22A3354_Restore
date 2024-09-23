@implementation SBLongPressGestureRecognizer

- (SBLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBLongPressGestureRecognizer *v4;
  SBLongPressGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBLongPressGestureRecognizer;
  v4 = -[SBClickGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_minimumPressDuration = 0.5;
    -[SBClickGestureRecognizer setNumberOfClicksRequired:](v4, "setNumberOfClicksRequired:", 0);
    v5->_firstEventAfterClicksWasReceived = 0;
  }
  return v5;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLongPressGestureRecognizer;
  -[SBClickGestureRecognizer reset](&v3, sel_reset);
  self->_firstEventAfterClicksWasReceived = 0;
}

- (id)gestureStateInfoForUnbalancedPressBeganCount:(int64_t)a3 previousCount:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBLongPressGestureRecognizer;
  -[SBClickGestureRecognizer gestureStateInfoForUnbalancedPressBeganCount:previousCount:](&v13, sel_gestureStateInfoForUnbalancedPressBeganCount_previousCount_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "state") == 3)
  {
    if (-[SBPressGestureRecognizer requiredPressTypesCount](self, "requiredPressTypesCount") < 2
      || self->_firstEventAfterClicksWasReceived)
    {
      if (a4 >= a3)
      {
        if (a4 > a3)
        {
          if (-[SBLongPressGestureRecognizer state](self, "state") < 1)
          {
            v8 = v7;
            v9 = 5;
            goto LABEL_17;
          }
          if (-[SBClickGestureRecognizer didReceiveRequiredPressEndedCount](self, "didReceiveRequiredPressEndedCount"))
          {
            v8 = v7;
            v9 = 3;
            goto LABEL_17;
          }
LABEL_6:
          v8 = v7;
          v9 = 2;
LABEL_17:
          objc_msgSend(v8, "setState:", v9);
          return v7;
        }
      }
      else
      {
        if (-[SBLongPressGestureRecognizer state](self, "state") >= 1)
          goto LABEL_6;
        if (-[SBClickGestureRecognizer didReceiveRequiredPressBeganCount](self, "didReceiveRequiredPressBeganCount"))
        {
          objc_msgSend(v7, "setState:", 0);
          -[SBLongPressGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
          objc_msgSend(v7, "setExpirationTime:");
          v10 = v7;
          v11 = 1;
          goto LABEL_14;
        }
      }
      objc_msgSend(v7, "setIsCoalescing:", 1);
      v9 = -[SBLongPressGestureRecognizer state](self, "state");
      v8 = v7;
      goto LABEL_17;
    }
    self->_firstEventAfterClicksWasReceived = 1;
    objc_msgSend(v7, "setState:", 0);
    -[SBClickGestureRecognizer maximumClickFormationDuration](self, "maximumClickFormationDuration");
    objc_msgSend(v7, "setExpirationTime:");
    v10 = v7;
    v11 = 5;
LABEL_14:
    objc_msgSend(v10, "setStateUponExpiration:", v11);
  }
  return v7;
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

@end
