@implementation SBUIRemoteAlertIdleTimerSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBUIRemoteAlertIdleTimerSettings)initWithCoder:(id)a3
{
  id v4;
  SBUIRemoteAlertIdleTimerSettings *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIRemoteAlertIdleTimerSettings;
  v5 = -[SBUIRemoteAlertIdleTimerSettings init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("autoLockTimeout"));
    v5->_autoLockTimeout = v6;
    v5->_disablesWarn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disablesWarn"));
    v5->_usesLockScreenRules = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesLockScreenRules"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double autoLockTimeout;
  id v5;

  autoLockTimeout = self->_autoLockTimeout;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("autoLockTimeout"), autoLockTimeout);
  objc_msgSend(v5, "encodeBool:forKey:", self->_disablesWarn, CFSTR("disablesWarn"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_usesLockScreenRules, CFSTR("usesLockScreenRules"));

}

- (double)autoLockTimeout
{
  return self->_autoLockTimeout;
}

- (void)setAutoLockTimeout:(double)a3
{
  self->_autoLockTimeout = a3;
}

- (BOOL)disablesWarn
{
  return self->_disablesWarn;
}

- (void)setDisablesWarn:(BOOL)a3
{
  self->_disablesWarn = a3;
}

- (BOOL)usesLockScreenRules
{
  return self->_usesLockScreenRules;
}

- (void)setUsesLockScreenRules:(BOOL)a3
{
  self->_usesLockScreenRules = a3;
}

@end
