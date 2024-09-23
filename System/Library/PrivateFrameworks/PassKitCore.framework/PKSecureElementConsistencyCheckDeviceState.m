@implementation PKSecureElementConsistencyCheckDeviceState

- (NSArray)applets
{
  return self->_applets;
}

- (void)setApplets:(id)a3
{
  objc_storeStrong((id *)&self->_applets, a3);
}

- (NSArray)devicePaymentApplications
{
  return self->_devicePaymentApplications;
}

- (void)setDevicePaymentApplications:(id)a3
{
  objc_storeStrong((id *)&self->_devicePaymentApplications, a3);
}

- (NSArray)passCredentials
{
  return self->_passCredentials;
}

- (void)setPassCredentials:(id)a3
{
  objc_storeStrong((id *)&self->_passCredentials, a3);
}

- (NSArray)deviceCredentials
{
  return self->_deviceCredentials;
}

- (void)setDeviceCredentials:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCredentials, a3);
}

- (NSDictionary)passIsoBlobHashForCredentialIdentifier
{
  return self->_passIsoBlobHashForCredentialIdentifier;
}

- (void)setPassIsoBlobHashForCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passIsoBlobHashForCredentialIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passIsoBlobHashForCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceCredentials, 0);
  objc_storeStrong((id *)&self->_passCredentials, 0);
  objc_storeStrong((id *)&self->_devicePaymentApplications, 0);
  objc_storeStrong((id *)&self->_applets, 0);
}

@end
