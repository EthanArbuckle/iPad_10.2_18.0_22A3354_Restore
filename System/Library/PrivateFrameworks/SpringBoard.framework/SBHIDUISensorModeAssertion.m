@implementation SBHIDUISensorModeAssertion

- (void)invalidate
{
  SBHIDUISensorModeController **p_sensorModeController;
  id WeakRetained;

  p_sensorModeController = &self->_sensorModeController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sensorModeController);
  objc_msgSend(WeakRetained, "_removeHIDUISensorModeAssertion:", self);

  objc_storeWeak((id *)p_sensorModeController, 0);
}

- (NSString)description
{
  return (NSString *)-[SBHIDUISensorModeAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIDUISensorModeAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHIDUISensorModeAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  -[SBHIDUISensorModeAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_suspendProximitySensor, CFSTR("suspendProximitySensor"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_pocketTouchesExpected, CFSTR("pocketTouchesExpected"));
  NSStringFromSBDisabledDigitizerMode(self->_digitizerMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("digitizerMode"));

  NSStringFromBKSHIDUISensorDisplayState();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("displayState"));

  SBSBacklightChangeSourceDescription(self->_source);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v9, CFSTR("source"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_sensorModeController);
  v11 = (id)objc_msgSend(v4, "appendPointer:withName:", WeakRetained, CFSTR("sensorModeController"));

  objc_msgSend(v4, "appendString:withName:", self->_reason, CFSTR("reason"));
  return v4;
}

- (SBHIDUISensorModeController)sensorModeController
{
  return (SBHIDUISensorModeController *)objc_loadWeakRetained((id *)&self->_sensorModeController);
}

- (void)setSensorModeController:(id)a3
{
  objc_storeWeak((id *)&self->_sensorModeController, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)displayState
{
  return self->_displayState;
}

- (void)setDisplayState:(int64_t)a3
{
  self->_displayState = a3;
}

- (int64_t)digitizerMode
{
  return self->_digitizerMode;
}

- (void)setDigitizerMode:(int64_t)a3
{
  self->_digitizerMode = a3;
}

- (BOOL)suspendProximitySensor
{
  return self->_suspendProximitySensor;
}

- (void)setSuspendProximitySensor:(BOOL)a3
{
  self->_suspendProximitySensor = a3;
}

- (BOOL)pocketTouchesExpected
{
  return self->_pocketTouchesExpected;
}

- (void)setPocketTouchesExpected:(BOOL)a3
{
  self->_pocketTouchesExpected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_sensorModeController);
}

@end
