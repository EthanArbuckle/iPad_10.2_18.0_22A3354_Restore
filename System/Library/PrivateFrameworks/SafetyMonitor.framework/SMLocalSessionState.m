@implementation SMLocalSessionState

- (SMLocalSessionState)init
{
  return -[SMLocalSessionState initWithUnsupportedDeviceSeparationState:userDisabledConnectivity:separatedLPMConnectivityWarningState:](self, "initWithUnsupportedDeviceSeparationState:userDisabledConnectivity:separatedLPMConnectivityWarningState:", 0, 0, 0);
}

- (SMLocalSessionState)initWithUnsupportedDeviceSeparationState:(BOOL)a3 userDisabledConnectivity:(BOOL)a4 separatedLPMConnectivityWarningState:(BOOL)a5
{
  SMLocalSessionState *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SMLocalSessionState;
  result = -[SMLocalSessionState init](&v9, sel_init);
  if (result)
  {
    result->_unsupportedDeviceSeparationState = a3;
    result->_userDisabledConnectivity = a4;
    result->_separatedLPMConnectivityWarningState = a5;
  }
  return result;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[SMLocalSessionState unsupportedDeviceSeparationState](self, "unsupportedDeviceSeparationState"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (-[SMLocalSessionState userDisabledConnectivity](self, "userDisabledConnectivity"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[SMLocalSessionState separatedLPMConnectivityWarningState](self, "separatedLPMConnectivityWarningState"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{UnsupportDeviceSeparationState: %@},{UserDisabledConnectivity: %@},{SeparatedLPMConnectivityWarningState: %@}"), v4, v5, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMLocalSessionState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMLocalSessionStateUnsupportedDeviceSeparationStateKey"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMLocalSessionStateUserDisabledConnectivityKey"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMLocalSessionStateSeparatedLPMConnectivityWarningStateKey"));

  return -[SMLocalSessionState initWithUnsupportedDeviceSeparationState:userDisabledConnectivity:separatedLPMConnectivityWarningState:](self, "initWithUnsupportedDeviceSeparationState:userDisabledConnectivity:separatedLPMConnectivityWarningState:", v5, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SMLocalSessionState unsupportedDeviceSeparationState](self, "unsupportedDeviceSeparationState"), CFSTR("__kSMLocalSessionStateUnsupportedDeviceSeparationStateKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SMLocalSessionState userDisabledConnectivity](self, "userDisabledConnectivity"), CFSTR("__kSMLocalSessionStateUserDisabledConnectivityKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SMLocalSessionState separatedLPMConnectivityWarningState](self, "separatedLPMConnectivityWarningState"), CFSTR("__kSMLocalSessionStateSeparatedLPMConnectivityWarningStateKey"));

}

- (BOOL)isEqual:(id)a3
{
  SMLocalSessionState *v4;
  SMLocalSessionState *v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;
  int v9;
  BOOL v10;
  char v11;

  v4 = (SMLocalSessionState *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SMLocalSessionState unsupportedDeviceSeparationState](self, "unsupportedDeviceSeparationState");
      v7 = v6 ^ -[SMLocalSessionState unsupportedDeviceSeparationState](v5, "unsupportedDeviceSeparationState");
      v8 = -[SMLocalSessionState userDisabledConnectivity](self, "userDisabledConnectivity");
      v9 = v7 | v8 ^ -[SMLocalSessionState userDisabledConnectivity](v5, "userDisabledConnectivity");
      v10 = -[SMLocalSessionState separatedLPMConnectivityWarningState](self, "separatedLPMConnectivityWarningState");
      LOBYTE(v8) = -[SMLocalSessionState separatedLPMConnectivityWarningState](v5, "separatedLPMConnectivityWarningState");

      v11 = (v9 | v10 ^ v8) ^ 1;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)convertSMDeviceConfigurationLPMToBool:(int64_t)a3
{
  return a3 == 2;
}

+ (int64_t)convertBoolToSMDeviceConfigurationLowPowerModeWarningState:(BOOL)a3
{
  if (a3)
    return 2;
  else
    return 1;
}

- (BOOL)unsupportedDeviceSeparationState
{
  return self->_unsupportedDeviceSeparationState;
}

- (void)setUnsupportedDeviceSeparationState:(BOOL)a3
{
  self->_unsupportedDeviceSeparationState = a3;
}

- (BOOL)userDisabledConnectivity
{
  return self->_userDisabledConnectivity;
}

- (void)setUserDisabledConnectivity:(BOOL)a3
{
  self->_userDisabledConnectivity = a3;
}

- (BOOL)separatedLPMConnectivityWarningState
{
  return self->_separatedLPMConnectivityWarningState;
}

- (void)setSeparatedLPMConnectivityWarningState:(BOOL)a3
{
  self->_separatedLPMConnectivityWarningState = a3;
}

@end
