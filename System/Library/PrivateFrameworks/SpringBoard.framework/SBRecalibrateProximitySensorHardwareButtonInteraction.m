@implementation SBRecalibrateProximitySensorHardwareButtonInteraction

- (SBRecalibrateProximitySensorHardwareButtonInteraction)initWithProximitySensorManager:(id)a3
{
  id v5;
  SBRecalibrateProximitySensorHardwareButtonInteraction *v6;
  SBRecalibrateProximitySensorHardwareButtonInteraction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRecalibrateProximitySensorHardwareButtonInteraction;
  v6 = -[SBRecalibrateProximitySensorHardwareButtonInteraction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sensorManager, a3);

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRecalibrateProximitySensorHardwareButtonInteraction;
  -[SBHardwareButtonGestureParametersProviderBase descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_didResetProxCalibration, CFSTR("didResetProxCalibration"));
  return v4;
}

- (BOOL)consumeInitialPressDown
{
  _BOOL4 v4;
  BOOL result;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  self->_didResetProxCalibration = 0;
  v4 = -[SBProximitySensorManager isObjectInProximity](self->_sensorManager, "isObjectInProximity");
  result = 0;
  if (v4)
  {
    if ((MGGetBoolAnswer() & 1) != 0)
    {
      ADClientAddValueForScalarKey();
      SBLogButtonsLock();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543362;
        v9 = v7;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because object within proximity", (uint8_t *)&v8, 0xCu);

      }
      return 1;
    }
    else
    {
      -[SBProximitySensorManager resetProximityCalibration](self->_sensorManager, "resetProximityCalibration");
      result = 0;
      self->_didResetProxCalibration = 1;
    }
  }
  return result;
}

- (BOOL)consumeSinglePressUp
{
  _BOOL4 didResetProxCalibration;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  didResetProxCalibration = self->_didResetProxCalibration;
  if (self->_didResetProxCalibration)
  {
    self->_didResetProxCalibration = 0;
    SBLogButtonsLock();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring because we recalibrated prox, and we don't want to lock the screen in this case", (uint8_t *)&v7, 0xCu);

    }
  }
  return didResetProxCalibration;
}

- (BOOL)_disallowsAnyPressForReason:(id *)a3
{
  int v4;

  *a3 = 0;
  v4 = -[SBProximitySensorManager isObjectInProximity](self->_sensorManager, "isObjectInProximity");
  if (v4)
  {
    v4 = MGGetBoolAnswer();
    if (v4)
    {
      *a3 = CFSTR("object in proximity && opposed lock/volume buttons");
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (id)hardwareButtonGestureParameters
{
  return objc_alloc_init(SBHardwareButtonGestureParameters);
}

- (SBProximitySensorManager)sensorManager
{
  return self->_sensorManager;
}

- (void)setSensorManager:(id)a3
{
  objc_storeStrong((id *)&self->_sensorManager, a3);
}

- (BOOL)didResetProxCalibration
{
  return self->_didResetProxCalibration;
}

- (void)setDidResetProxCalibration:(BOOL)a3
{
  self->_didResetProxCalibration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorManager, 0);
}

@end
