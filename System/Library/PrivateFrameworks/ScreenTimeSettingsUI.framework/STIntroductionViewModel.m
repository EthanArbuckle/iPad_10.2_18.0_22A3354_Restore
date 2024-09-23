@implementation STIntroductionViewModel

- (BOOL)deviceForChild
{
  return self->_deviceForChild;
}

- (void)setDeviceForChild:(BOOL)a3
{
  self->_deviceForChild = a3;
}

- (NSNumber)appAndWebsiteActivityEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAppAndWebsiteActivityEnabled:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (STDeviceBedtime)bedtime
{
  return (STDeviceBedtime *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBedtime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (STAllowance)allowance
{
  return (STAllowance *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAllowance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)communicationSafetyEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCommunicationSafetyEnabled:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)screenDistanceEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setScreenDistanceEnabled:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)parentalControlsPasscode
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParentalControlsPasscode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)recoveryAltDSID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRecoveryAltDSID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSDictionary)restrictions
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRestrictions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_recoveryAltDSID, 0);
  objc_storeStrong((id *)&self->_parentalControlsPasscode, 0);
  objc_storeStrong((id *)&self->_screenDistanceEnabled, 0);
  objc_storeStrong((id *)&self->_communicationSafetyEnabled, 0);
  objc_storeStrong((id *)&self->_allowance, 0);
  objc_storeStrong((id *)&self->_bedtime, 0);
  objc_storeStrong((id *)&self->_appAndWebsiteActivityEnabled, 0);
}

@end
