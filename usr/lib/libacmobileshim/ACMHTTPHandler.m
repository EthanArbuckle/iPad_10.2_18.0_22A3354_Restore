@implementation ACMHTTPHandler

- (id)components
{
  return +[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components");
}

- (id)environmentPreferences
{
  return (id)objc_msgSend((id)objc_msgSend(-[ACMHTTPHandler components](self, "components"), "preferences"), "environmentPreferencesWithRealm:", objc_msgSend((id)-[ACCAuthContextProtocol principal](-[ACCHTTPHandler context](self, "context"), "principal"), "realm"));
}

- (id)iForgotURL
{
  return (id)objc_msgSend(-[ACMHTTPHandler environmentPreferences](self, "environmentPreferences"), "iForgotURL");
}

- (id)serverHosts
{
  return (id)objc_msgSend(-[ACMHTTPHandler environmentPreferences](self, "environmentPreferences"), "serverHosts");
}

- (id)serverAttemptsDelays
{
  return (id)objc_msgSend(-[ACMHTTPHandler environmentPreferences](self, "environmentPreferences"), "serverAttemptsDelays");
}

@end
