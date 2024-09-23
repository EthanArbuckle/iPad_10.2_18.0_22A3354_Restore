@implementation WBSPrivateBrowsingExplanationConfiguration

- (int64_t)biometryType
{
  return self->_biometryType;
}

- (void)setBiometryType:(int64_t)a3
{
  self->_biometryType = a3;
}

- (BOOL)userHasPassword
{
  return self->_userHasPassword;
}

- (void)setUserHasPassword:(BOOL)a3
{
  self->_userHasPassword = a3;
}

- (WBSPrivacyProxyAvailabilityManager)privacyProxyAvailabilityManager
{
  return self->_privacyProxyAvailabilityManager;
}

- (void)setPrivacyProxyAvailabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_privacyProxyAvailabilityManager, a3);
}

- (WBSSearchProvider)privateBrowsingSearchEngine
{
  return self->_privateBrowsingSearchEngine;
}

- (void)setPrivateBrowsingSearchEngine:(id)a3
{
  objc_storeStrong((id *)&self->_privateBrowsingSearchEngine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateBrowsingSearchEngine, 0);
  objc_storeStrong((id *)&self->_privacyProxyAvailabilityManager, 0);
}

@end
