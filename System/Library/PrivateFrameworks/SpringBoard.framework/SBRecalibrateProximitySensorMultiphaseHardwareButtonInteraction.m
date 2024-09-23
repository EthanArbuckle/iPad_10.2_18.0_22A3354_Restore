@implementation SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction

- (SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction)initWithProximitySensorManager:(id)a3
{
  id v5;
  SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction *v6;
  SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction;
  v6 = -[SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sensorManager, a3);
    -[SBProximitySensorManager addObserver:](v7->_sensorManager, "addObserver:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
  -[SBProximitySensorManager removeObserver:](self->_sensorManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction;
  -[SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction dealloc](&v3, sel_dealloc);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  unint64_t phase;
  const __CFString *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction;
  -[SBHardwareButtonGestureParametersProviderBase descriptionBuilderWithMultilinePrefix:](&v10, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  phase = self->_phase;
  if (phase > 2)
    v7 = CFSTR("<unknown>");
  else
    v7 = off_1E8EBAF20[phase];
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("phase"));
  return v5;
}

- (BOOL)consumeInitialPressDown
{
  return -[SBProximitySensorManager isObjectInProximity](self->_sensorManager, "isObjectInProximity")
      || self->_phase != 0;
}

- (BOOL)consumeSinglePressUp
{
  int64_t phase;
  double v4;
  _BOOL4 v5;
  BOOL v6;
  uint64_t v7;

  phase = self->_phase;
  v4 = 0.0;
  if (phase == 2)
    goto LABEL_10;
  if (phase == 1)
  {
    if (!-[SBProximitySensorManager isObjectInProximity](self->_sensorManager, "isObjectInProximity"))
      goto LABEL_11;
    -[SBProximitySensorManager resetProximityCalibration](self->_sensorManager, "resetProximityCalibration");
    v4 = 1.0;
LABEL_10:
    v6 = 1;
    v7 = 2;
    goto LABEL_12;
  }
  if (phase)
  {
LABEL_11:
    v6 = 0;
    v7 = 0;
    goto LABEL_12;
  }
  v5 = -[SBProximitySensorManager isObjectInProximity](self->_sensorManager, "isObjectInProximity");
  v6 = v5;
  if (v5)
    v4 = 2.0;
  else
    v4 = 0.0;
  v7 = v5;
LABEL_12:
  -[SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction _transitionToPhase:timeout:](self, "_transitionToPhase:timeout:", v7, v4);
  return v6;
}

- (BOOL)_disallowsAnyPressForReason:(id *)a3
{
  _BOOL4 v4;

  *a3 = 0;
  v4 = -[SBProximitySensorManager isObjectInProximity](self->_sensorManager, "isObjectInProximity");
  if (v4)
    *a3 = CFSTR("object in proximity");
  return v4;
}

- (BOOL)disallowsSinglePressForReason:(id *)a3
{
  *a3 = 0;
  return 0;
}

- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4
{
  if (!a4 && self->_phase != 2)
    -[SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction _transitionToPhase:](self, "_transitionToPhase:", 0);
}

- (id)hardwareButtonGestureParameters
{
  SBMutableHardwareButtonGestureParameters *v3;

  v3 = objc_alloc_init(SBMutableHardwareButtonGestureParameters);
  -[SBMutableHardwareButtonGestureParameters setMaximumPressCount:](v3, "setMaximumPressCount:", self->_phase > 0);
  return v3;
}

- (void)_transitionToPhase:(int64_t)a3
{
  -[SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction _transitionToPhase:timeout:](self, "_transitionToPhase:timeout:", a3, 0.0);
}

- (void)_transitionToPhase:(int64_t)a3 timeout:(double)a4
{
  NSObject *v7;
  void *v8;
  unint64_t phase;
  const __CFString *v10;
  const __CFString *v11;
  id v12;
  BSAbsoluteMachTimer *timer;
  BSAbsoluteMachTimer *v14;
  BSAbsoluteMachTimer *v15;
  BSAbsoluteMachTimer *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_phase != a3)
  {
    SBLogButtonsInteraction();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      phase = self->_phase;
      if (phase > 2)
        v10 = CFSTR("<unknown>");
      else
        v10 = off_1E8EBAF20[phase];
      if ((unint64_t)a3 > 2)
        v11 = CFSTR("<unknown>");
      else
        v11 = off_1E8EBAF20[a3];
      *(_DWORD *)buf = 138544130;
      v22 = v8;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      v27 = 2048;
      v28 = a4;
      v12 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ transition from::%{public}@ to:%{public}@ timeout:%g", buf, 0x2Au);

    }
    self->_phase = a3;
    -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
    timer = self->_timer;
    self->_timer = 0;

    if (a4 > 0.0 && self->_phase >= 1)
    {
      objc_initWeak((id *)buf, self);
      v14 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction.timer"));
      v15 = self->_timer;
      self->_timer = v14;

      v16 = self->_timer;
      v17 = MEMORY[0x1E0C80D38];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __94__SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction__transitionToPhase_timeout___block_invoke;
      v19[3] = &unk_1E8E9EEC8;
      objc_copyWeak(&v20, (id *)buf);
      -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v16, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v19, a4, 0.0);

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
    -[SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction hardwareButtonGestureParameters](self, "hardwareButtonGestureParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHardwareButtonGestureParametersProviderBase publishUpdatedParameters:](self, "publishUpdatedParameters:", v18);

  }
}

void __94__SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction__transitionToPhase_timeout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerDidFire");

}

- (void)_timerDidFire
{
  -[SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction _transitionToPhase:](self, "_transitionToPhase:", 0);
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (SBProximitySensorManager)sensorManager
{
  return self->_sensorManager;
}

- (void)setSensorManager:(id)a3
{
  objc_storeStrong((id *)&self->_sensorManager, a3);
}

- (BSAbsoluteMachTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_sensorManager, 0);
}

@end
