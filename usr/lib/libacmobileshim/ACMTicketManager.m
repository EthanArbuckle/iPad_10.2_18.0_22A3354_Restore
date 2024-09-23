@implementation ACMTicketManager

- (id)components
{
  return +[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components");
}

- (id)preferences
{
  return (id)objc_msgSend(-[ACMTicketManager components](self, "components"), "preferences");
}

- (id)systemInfo
{
  return (id)objc_msgSend(-[ACMTicketManager components](self, "components"), "systemInfo");
}

- (id)defaultPublicKeyVersionForRealm:(id)a3
{
  return CFSTR("0.0");
}

- (__SecCertificate)defaultPublicKeyCertificateForRealm:(id)a3
{
  return -[ACCTicketManager certificateFromString:](self, "certificateFromString:", objc_msgSend((id)objc_msgSend(-[ACMTicketManager preferences](self, "preferences"), "environmentPreferencesWithRealm:", a3), "defaultPublicKeyString"));
}

- (id)certificateLabelForRealm:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[ACMTicketManager components](self, "components"), "preferences"), "environmentPreferencesWithRealm:", a3), "publicKeyCertificateName");
}

- (id)publicKeyVersionForRealm:(id)a3
{
  void *v5;

  if (-[ACCTicketManager certificateForRealm:](self, "certificateForRealm:"))
    v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[ACMTicketManager components](self, "components"), "preferences"), "environmentPreferencesWithRealm:", a3), "publicKeyVersion");
  else
    v5 = 0;
  if (objc_msgSend(v5, "length"))
    return v5;
  else
    return -[ACMTicketManager defaultPublicKeyVersionForRealm:](self, "defaultPublicKeyVersionForRealm:", a3);
}

- (void)setPublickKeyVersion:(id)a3 label:(id)a4 forRealm:(id)a5
{
  void *v7;

  v7 = (void *)objc_msgSend((id)objc_msgSend(-[ACMTicketManager components](self, "components"), "preferences"), "environmentPreferencesWithRealm:", a5);
  objc_msgSend(v7, "setPublicKeyCertificateName:", a4);
  objc_msgSend(v7, "setPublicKeyVersion:", a3);
}

- (void)uninstallPublicKeyForRealm:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMTicketManager;
  -[ACCTicketManager uninstallPublicKeyForRealm:](&v6, sel_uninstallPublicKeyForRealm_);
  v5 = (void *)objc_msgSend((id)objc_msgSend(-[ACMTicketManager components](self, "components"), "preferences"), "environmentPreferencesWithRealm:", a3);
  objc_msgSend(v5, "setPublicKeyVersion:", &stru_24FCE58F0);
  objc_msgSend(v5, "setPublicKeyCertificateName:", &stru_24FCE58F0);
}

- (void)setUserPreferences:(id)a3 forToken:(id)a4
{
  objc_msgSend(a4, "setUserPreferences:", -[ACMTicketManager encodedUserPreferences:](self, "encodedUserPreferences:", a3));
}

- (id)userPreferencesForToken:(id)a3
{
  return -[ACMTicketManager decodedUserPreferences:](self, "decodedUserPreferences:", objc_msgSend(a3, "userPreferences"));
}

- (id)encodedUserPreferences:(id)a3
{
  return (id)ACFEncodeBase64(objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, 0));
}

- (id)decodedUserPreferences:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "length");
  if (result)
    return (id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", ACFDecodeBase64(a3), 0, 0, 0);
  return result;
}

@end
