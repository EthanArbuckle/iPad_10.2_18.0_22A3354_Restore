@implementation SBIdleTimerPolicyAggregator

- (SBIdleTimerPolicyAggregator)initWithBacklightController:(id)a3 proximitySensorManager:(id)a4 idleEventHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SBDeviceUnlockAggdLogger *v12;
  SBIdleTimerPolicyAggregator *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[SBIdleTimerGlobalStateMonitor sharedInstance](SBIdleTimerGlobalStateMonitor, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(SBDeviceUnlockAggdLogger);
  v13 = -[SBIdleTimerPolicyAggregator _initWithBacklightController:proximitySensorManager:idleEventHandler:globalStateMonitor:unlockLogger:](self, "_initWithBacklightController:proximitySensorManager:idleEventHandler:globalStateMonitor:unlockLogger:", v10, v9, v8, v11, v12);

  return v13;
}

- (id)_initWithBacklightController:(id)a3 proximitySensorManager:(id)a4 idleEventHandler:(id)a5 globalStateMonitor:(id)a6 unlockLogger:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBIdleTimerPolicyAggregator *v17;
  id *p_isa;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBIdleTimerPolicyAggregator;
  v17 = -[SBIdleTimerPolicyAggregator init](&v21, sel_init);
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_backlightController, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 5, a6);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 7, a7);
  }

  return p_isa;
}

- (void)idleTimerDidRefresh:(id)a3
{
  id v4;

  if (-[SBBacklightController screenIsDim](self->_backlightController, "screenIsDim", a3))
  {
    -[SBIdleTimerPolicyAggregator _backlightController](self, "_backlightController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_undimFromSource:", 8);

  }
}

- (void)idleTimerDidExpire:(id)a3
{
  id v4;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[SBIdleTimerIdleEventHandler handleIdleTimerDidExpire](self->_idleEventHandler, "handleIdleTimerDidExpire") & 1) == 0)
  {
    _SBSAutolockTimerPostExternalChangeNotification();
    -[SBIdleTimerPolicyAggregator _backlightController](self, "_backlightController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_startFadeOutAnimationFromLockSource:", 15);

  }
}

- (void)idleTimerDidResetForUserAttention:(id)a3
{
  void *v4;
  id v5;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[SBIdleTimerIdleEventHandler handleIdleTimerUserAttentionDidReset](self->_idleEventHandler, "handleIdleTimerUserAttentionDidReset") & 1) == 0)
  {
    if (-[SBBacklightController screenIsDim](self->_backlightController, "screenIsDim"))
    {
      -[SBIdleTimerPolicyAggregator _backlightController](self, "_backlightController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_undimFromSource:", 8);

      -[SBIdleTimerPolicyAggregator _logger](self, "_logger");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logUserResetIdleTimer");

    }
  }
}

- (void)idleTimerDidWarn:(id)a3
{
  BOOL v4;
  int64_t v5;
  void *v6;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[SBIdleTimerIdleEventHandler handleIdleTimerDidWarn](self->_idleEventHandler, "handleIdleTimerDidWarn") & 1) == 0)
  {
    v4 = -[SBProximitySensorManager isObjectInProximity](self->_proximitySensorManager, "isObjectInProximity");
    v5 = -[SBBacklightController backlightState](self->_backlightController, "backlightState");
    if (!v4 && v5 == 1)
    {
      -[SBBacklightController setBacklightState:source:animated:completion:](self->_backlightController, "setBacklightState:source:animated:completion:", 2, 8, 1, 0);
      -[SBIdleTimerPolicyAggregator _logger](self, "_logger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logIdleTimerScreenDimWarning");

      _SBSAutolockTimerPostExternalChangeNotification();
    }
  }
}

- (void)idleTimerGlobalCoordinator:(id)a3 didActivateIdleTimer:(id)a4
{
  void *v5;
  id v6;

  -[SBIdleTimerPolicyAggregator _setIdleTimer:](self, "_setIdleTimer:", a4);
  +[SBScreenLongevityController sharedInstanceIfExists](SBScreenLongevityController, "sharedInstanceIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluateEnablement");

  if (-[SBBacklightController screenIsDim](self->_backlightController, "screenIsDim"))
  {
    -[SBIdleTimerPolicyAggregator _backlightController](self, "_backlightController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_undimFromSource:", 8);

  }
}

- (void)_setIdleTimer:(id)a3
{
  SBIdleTimer *v4;
  SBIdleTimer *idleTimer;
  SBIdleTimer *v6;

  v4 = (SBIdleTimer *)a3;
  -[SBIdleTimer removeIdleTimerObserver:](self->_idleTimer, "removeIdleTimerObserver:", self);
  idleTimer = self->_idleTimer;
  self->_idleTimer = v4;
  v6 = v4;

  -[SBIdleTimer addIdleTimerObserver:](v6, "addIdleTimerObserver:", self);
}

- (SBDeviceUnlockAggdLogger)_logger
{
  return self->_logger;
}

- (SBBacklightController)_backlightController
{
  return self->_backlightController;
}

- (SBIdleTimer)idleTimer
{
  return self->_idleTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_globalStateMonitor, 0);
  objc_storeStrong((id *)&self->_idleEventHandler, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
}

@end
