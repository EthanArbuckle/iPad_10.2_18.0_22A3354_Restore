@implementation SBZionUnlockTrigger

- (SBZionUnlockTrigger)initWithUnlockBehaviorConfigurationDelegate:(id)a3
{
  id v4;
  SBZionUnlockTrigger *v5;
  SBZionUnlockTrigger *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBZionUnlockTrigger;
  v5 = -[SBZionUnlockTrigger init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_behaviorConfigurationDelegate, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BSAbsoluteMachTimer invalidate](self->_restToOpenTimer, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_minTouchIDTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBZionUnlockTrigger;
  -[SBZionUnlockTrigger dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return -[SBMesaUnlockTrigger descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBZionUnlockTrigger;
  -[SBMesaUnlockTrigger succinctDescriptionBuilder](&v9, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_fingerOn, CFSTR("fingerOn"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_fingerOffSinceWake, CFSTR("fingerOffSinceWake"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_restToOpenTimer != 0, CFSTR("restToOpenTimer"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_minTouchIDTimer != 0, CFSTR("minTouchIDTimer"));
  return v3;
}

- (BOOL)bioUnlock
{
  id WeakRetained;
  uint64_t *v4;
  void *v5;
  BSAbsoluteMachTimer *v7;
  BSAbsoluteMachTimer *minTouchIDTimer;
  BSAbsoluteMachTimer *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  SBZionUnlockTrigger *v16;
  _QWORD v17[5];
  id v18;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
  if (-[SBZionUnlockTrigger _isRestToOpenAvailable](self, "_isRestToOpenAvailable"))
  {
    if (self->_fingerOn)
    {
      if (objc_msgSend(WeakRetained, "lockScreenWakeSource") == 1 && !self->_fingerOffSinceWake)
      {
        -[SBZionUnlockTrigger _cancelMinTouchIDTimer](self, "_cancelMinTouchIDTimer");
        objc_initWeak(&location, self);
        v7 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBZionUnlockTrigger.minTouchIDTimer"));
        minTouchIDTimer = self->_minTouchIDTimer;
        self->_minTouchIDTimer = v7;

        v9 = self->_minTouchIDTimer;
        v10 = MEMORY[0x1E0C80D38];
        v11 = MEMORY[0x1E0C80D38];
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __32__SBZionUnlockTrigger_bioUnlock__block_invoke;
        v17[3] = &unk_1E8EAEE30;
        objc_copyWeak(&v18, &location);
        v17[4] = self;
        -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v9, "scheduleWithFireInterval:leewayInterval:queue:handler:", v10, v17, 0.1, 0.0);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
        goto LABEL_8;
      }
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __32__SBZionUnlockTrigger_bioUnlock__block_invoke_2;
      v15 = &unk_1E8E9E980;
      v16 = self;
      v4 = &v12;
      v5 = WeakRetained;
    }
    else
    {
      v5 = WeakRetained;
      v4 = 0;
    }
    objc_msgSend(v5, "startRestToOpenCoachingWithCompletion:", v4, v12, v13, v14, v15, v16);
  }
LABEL_8:

  return 0;
}

void __32__SBZionUnlockTrigger_bioUnlock__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_startRestToOpenTimerWithDuration:", dbl_1D0E8A7E0[*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) == 0]);
    objc_msgSend(v3, "_cancelMinTouchIDTimer");
    WeakRetained = v3;
  }

}

uint64_t __32__SBZionUnlockTrigger_bioUnlock__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startRestToOpenTimer");
}

- (void)fingerOn
{
  void *v3;
  char v4;
  id WeakRetained;
  _QWORD v6[5];

  self->_fingerOn = 1;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBeenDismissedSinceKeybagLockAndAuthenticated");

  if (-[SBMesaUnlockTrigger authenticated](self, "authenticated") && (v4 & 1) == 0)
  {
    if (-[SBZionUnlockTrigger _isRestToOpenAvailable](self, "_isRestToOpenAvailable"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __31__SBZionUnlockTrigger_fingerOn__block_invoke;
      v6[3] = &unk_1E8E9E980;
      v6[4] = self;
      objc_msgSend(WeakRetained, "startRestToOpenCoachingWithCompletion:", v6);

    }
  }
}

uint64_t __31__SBZionUnlockTrigger_fingerOn__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startRestToOpenTimer");
}

- (void)fingerOff
{
  id WeakRetained;

  self->_fingerOn = 0;
  self->_fingerOffSinceWake = 1;
  if (self->_restToOpenTimer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
    objc_msgSend(WeakRetained, "resetRestToOpen");

  }
  -[SBZionUnlockTrigger _cancelRestToOpenTimer](self, "_cancelRestToOpenTimer");
}

- (void)screenOn
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
  self->_hasVisibleContentToReveal = objc_msgSend(WeakRetained, "hasVisibleContentToReveal");

}

- (void)screenOff
{
  self->_hasVisibleContentToReveal = 0;
  self->_fingerOffSinceWake = 0;
  -[SBZionUnlockTrigger _cancelRestToOpenTimer](self, "_cancelRestToOpenTimer");
}

- (void)lockButtonDown
{
  id WeakRetained;

  if (self->_restToOpenTimer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
    objc_msgSend(WeakRetained, "resetRestToOpen");

  }
  -[SBZionUnlockTrigger _cancelRestToOpenTimer](self, "_cancelRestToOpenTimer");
}

- (void)_startRestToOpenTimer
{
  if (self->_fingerOn)
    -[SBZionUnlockTrigger _startRestToOpenTimerWithDuration:](self, "_startRestToOpenTimerWithDuration:", 0.375);
}

- (void)_startRestToOpenTimerWithDuration:(double)a3
{
  BSAbsoluteMachTimer *v5;
  BSAbsoluteMachTimer *restToOpenTimer;
  BSAbsoluteMachTimer *v7;
  uint64_t v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  if (self->_fingerOn)
  {
    -[SBZionUnlockTrigger _cancelRestToOpenTimer](self, "_cancelRestToOpenTimer");
    objc_initWeak(&location, self);
    v5 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBZionUnlockTrigger.restToOpenTimer"));
    restToOpenTimer = self->_restToOpenTimer;
    self->_restToOpenTimer = v5;

    v7 = self->_restToOpenTimer;
    v8 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __57__SBZionUnlockTrigger__startRestToOpenTimerWithDuration___block_invoke;
    v14 = &unk_1E8E9EEC8;
    objc_copyWeak(&v15, &location);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v7, "scheduleWithFireInterval:leewayInterval:queue:handler:", v8, &v11, a3, 0.0);

    WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
    objc_msgSend(WeakRetained, "fillRestToOpenWithDuration:", a3, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __57__SBZionUnlockTrigger__startRestToOpenTimerWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateRestToOpenTimer");

}

- (void)_evaluateRestToOpenTimer
{
  void *v3;

  if (self->_restToOpenTimer
    && self->_fingerOn
    && -[SBZionUnlockTrigger _isRestToOpenAvailable](self, "_isRestToOpenAvailable"))
  {
    -[SBMesaUnlockTrigger delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mesaUnlockTriggerFired:", self);

  }
  -[SBZionUnlockTrigger _cancelRestToOpenTimer](self, "_cancelRestToOpenTimer");
}

- (void)_cancelRestToOpenTimer
{
  BSAbsoluteMachTimer *restToOpenTimer;
  BSAbsoluteMachTimer *v4;

  restToOpenTimer = self->_restToOpenTimer;
  if (restToOpenTimer)
  {
    -[BSAbsoluteMachTimer invalidate](restToOpenTimer, "invalidate");
    v4 = self->_restToOpenTimer;
    self->_restToOpenTimer = 0;

  }
}

- (void)_cancelMinTouchIDTimer
{
  BSAbsoluteMachTimer *minTouchIDTimer;
  BSAbsoluteMachTimer *v4;

  minTouchIDTimer = self->_minTouchIDTimer;
  if (minTouchIDTimer)
  {
    -[BSAbsoluteMachTimer invalidate](minTouchIDTimer, "invalidate");
    v4 = self->_minTouchIDTimer;
    self->_minTouchIDTimer = 0;

  }
}

- (BOOL)_isRestToOpenAvailable
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
  v3 = objc_msgSend(WeakRetained, "isRestToOpenAvailable");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minTouchIDTimer, 0);
  objc_storeStrong((id *)&self->_restToOpenTimer, 0);
  objc_destroyWeak((id *)&self->_behaviorConfigurationDelegate);
}

@end
