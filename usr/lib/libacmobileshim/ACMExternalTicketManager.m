@implementation ACMExternalTicketManager

- (id)preferences
{
  return (id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "preferences");
}

- (id)defaultPublicKeyVersionForRealm:(id)a3
{
  return CFSTR("0");
}

- (unint64_t)clientID
{
  return 2;
}

- (id)identifier
{
  return CFSTR("external");
}

- (id)twoSVPersonIDForPrincipal:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(-[ACMExternalTicketManager preferences](self, "preferences"), "principalPreferencesWithPrincipal:", a3), "personID");
}

- (id)twoSVSecretForPrincipal:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(-[ACMExternalTicketManager preferences](self, "preferences"), "principalPreferencesWithPrincipal:", a3), "clientSecret");
}

- (id)twoSVCreateDateForPrincipal:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(-[ACMExternalTicketManager preferences](self, "preferences"), "principalPreferencesWithPrincipal:", a3), "clientSecretCreateDate");
}

- (id)deviceIdentifier
{
  return (id)objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo"), "uniqueDeviceIdentifier");
}

- (void)tokenDidReceive2SVSecret:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(-[ACMExternalTicketManager preferences](self, "preferences"), "principalPreferencesWithPrincipal:", objc_msgSend(a3, "principal"));
  objc_msgSend(v4, "setClientSecret:", objc_msgSend(a3, "clientSecret"));
  objc_msgSend(v4, "setClientSecretCreateDate:", objc_msgSend(a3, "clientSecretCreationTimestamp"));
  objc_msgSend(v4, "setPersonID:", objc_msgSend(a3, "personID"));
}

@end
