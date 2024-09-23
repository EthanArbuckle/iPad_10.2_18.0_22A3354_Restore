@implementation UIForceStageInteractionProgress

- (UIForceStageInteractionProgress)init
{
  UIForceStageInteractionProgress *v2;
  void *v3;
  uint64_t v4;
  NSObservation *observation;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIForceStageInteractionProgress;
  v2 = -[UIInteractionProgress init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend((id)UIApp, "_forceStageObservable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
    observation = v2->_observation;
    v2->_observation = (NSObservation *)v4;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend((id)UIApp, "_forceStageObservable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObservation:", self->_observation);

  v4.receiver = self;
  v4.super_class = (Class)UIForceStageInteractionProgress;
  -[UIForceStageInteractionProgress dealloc](&v4, sel_dealloc);
}

- (void)receiveObservedValue:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  char v8;
  double v9;
  BOOL v10;
  BOOL v11;
  double v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "stage");
  objc_msgSend(v4, "touchForce");
  v7 = v6;
  v8 = objc_msgSend(v4, "isReset");

  if ((v8 & 1) != 0
    || ((v9 = fabs(v7), self->_started) ? (v10 = v5 == 0) : (v10 = 0), v10 ? (v11 = v9 < 2.22044605e-16) : (v11 = 0), v11))
  {
    if (!self->_completed)
      -[UIInteractionProgress endInteraction:](self, "endInteraction:", 0);
    -[UIForceStageInteractionProgress _reset](self, "_reset");
  }
  else if (v9 >= 2.22044605e-16)
  {
    self->_started = 1;
    if (!self->_completed)
    {
      if (!self->_completesAtTargetState || v5 == 0)
      {
        -[UIInteractionProgress setPercentComplete:](self, "setPercentComplete:", v7 + (double)v5);
      }
      else
      {
        -[UIInteractionProgress percentComplete](self, "percentComplete");
        if (v13 < 1.0)
          -[UIInteractionProgress setPercentComplete:](self, "setPercentComplete:", 1.0);
        self->_completed = 1;
        -[UIInteractionProgress endInteraction:](self, "endInteraction:", 1);
      }
    }
  }
}

- (void)_reset
{
  self->_started = 0;
  self->_completed = 0;
}

- (BOOL)completesAtTargetState
{
  return self->_completesAtTargetState;
}

- (void)setCompletesAtTargetState:(BOOL)a3
{
  self->_completesAtTargetState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
}

@end
