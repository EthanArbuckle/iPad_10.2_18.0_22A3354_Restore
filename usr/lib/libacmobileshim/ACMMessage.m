@implementation ACMMessage

- (void)forwardInvocation:(id)a3
{
  objc_super v5;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    ACFLog(3, (uint64_t)"-[ACMMessage forwardInvocation:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMMessage.m", 41, 0, "Not implemented: %@", a3);
  v5.receiver = self;
  v5.super_class = (Class)ACMMessage;
  -[ACMMessage forwardInvocation:](&v5, sel_forwardInvocation_, a3);
}

- (id)realm
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCUserRealm"));
}

- (void)setRealm:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCUserRealm"));
}

- (id)userName
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCUserName"));
}

- (void)setUserName:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCUserName"));
}

- (id)principal
{
  return +[ACFPrincipal principalWithUserName:realm:](ACFPrincipal, "principalWithUserName:realm:", -[ACMMessage userName](self, "userName"), -[ACMMessage realm](self, "realm"));
}

- (void)setPrincipal:(id)a3
{
  -[ACMMessage setUserName:](self, "setUserName:", objc_msgSend(a3, "userName"));
  -[ACMMessage setRealm:](self, "setRealm:", objc_msgSend(a3, "realm"));
}

- (id)appID
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ApplicationID"));
}

- (void)setAppID:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ApplicationID"));
}

- (id)appIDKey
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ApplicationIDKey"));
}

- (void)setAppIDKey:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ApplicationIDKey"));
}

- (id)personID
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("PersonID"));
}

- (void)setPersonID:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("PersonID"));
}

- (id)serviceName
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCKerberosServiceIdKey"));
}

- (void)setServiceName:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCKerberosServiceIdKey"));
}

- (id)applicationName
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCClientApplicationName"));
}

- (void)setApplicationName:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCClientApplicationName"));
}

- (id)serviceHost
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCHostNameKey"));
}

- (void)setServiceHost:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCHostNameKey"));
}

- (id)publicKeyVersion
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCPublicKeyVersion"));
}

- (void)setPublicKeyVersion:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCPublicKeyVersion"));
}

- (id)serverResponseTimeout
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCServerResponseTimeout"));
}

- (void)setServerResponseTimeout:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCServerResponseTimeout"));
}

- (id)encryptedContent
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCEncryptedContent"));
}

- (void)setEncryptedContent:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCEncryptedContent"));
}

- (id)encryptedContentHMAC
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCEncryptedContentHMAC"));
}

- (void)setEncryptedContentHMAC:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCEncryptedContentHMAC"));
}

- (id)serviceTicketString
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("serviceTicketString"));
}

- (void)setServiceTicketString:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("serviceTicketString"));
}

- (id)sessionToken
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCDSSessionToken"));
}

- (void)setSessionToken:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCDSSessionToken"));
}

- (id)shouldUseHSAToken
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCShouldUseHSAToken"));
}

- (void)setShouldUseHSAToken:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCShouldUseHSAToken"));
}

- (id)app2SVRequired
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCApp2SVRequired"));
}

- (void)setApp2SVRequired:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCApp2SVRequired"));
}

- (id)user2SVEnrolled
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCUser2SVEnrolled"));
}

- (void)setUser2SVEnrolled:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACCUser2SVEnrolled"));
}

- (BOOL)isInApp2SVEnabledOption
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCIsInApp2SVEnabledOption")), "BOOLValue");
}

- (void)setIsInApp2SVEnabledOption:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("ACCIsInApp2SVEnabledOption"));
}

- (BOOL)ignoreHSASessionInKeychain
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCIgnoreHSASessionInKeychain")), "BOOLValue");
}

- (void)setIgnoreHSASessionInKeychain:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("ACCIgnoreHSASessionInKeychain"));
}

- (BOOL)doNotSaveHSASessionInKeychain
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACCDoNotSaveHSASessionInKeychain")), "BOOLValue");
}

- (void)setDoNotSaveHSASessionInKeychain:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("ACCDoNotSaveHSASessionInKeychain"));
}

- (BOOL)managerSignIn
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("managerSignIn")), "BOOLValue");
}

- (void)setManagerSignIn:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("managerSignIn"));
}

- (BOOL)cancelAllowed
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("cancelAllowed")), "BOOLValue");
}

- (void)setCancelAllowed:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("cancelAllowed"));
}

- (BOOL)disableSingleSignOn
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("disableSingleSignOn")), "BOOLValue");
}

- (void)setDisableSingleSignOn:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("disableSingleSignOn"));
}

- (id)idleExpirationTimeout
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("idleExpirationTimeout"));
}

- (void)setIdleExpirationTimeout:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("idleExpirationTimeout"));
}

- (id)managerSignInPromptString
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("managerSignInPromptString"));
}

- (void)setManagerSignInPromptString:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("managerSignInPromptString"));
}

- (BOOL)lavaForceUseFailoverServerAddress
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("lavaForceUseFailoverServerAddress")), "BOOLValue");
}

- (void)setLavaForceUseFailoverServerAddress:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("lavaForceUseFailoverServerAddress"));
}

- (id)lavaFailoverRetrieveSaltAPIAddress
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("lavaFailoverRetrieveSaltAPIAddress"));
}

- (void)setLavaFailoverRetrieveSaltAPIAddress:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("lavaFailoverRetrieveSaltAPIAddress"));
}

- (id)lavaFailoverAuthenticateAPIAddress
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("lavaFailoverAuthenticateAPIAddress"));
}

- (void)setLavaFailoverAuthenticateAPIAddress:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("lavaFailoverAuthenticateAPIAddress"));
}

- (id)rawResponseData
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("rawResponseData"));
}

- (void)setRawResponseData:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("rawResponseData"));
}

- (id)userInfo
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("userInfo"));
}

- (void)setUserInfo:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("userInfo"));
}

- (BOOL)useAlertView
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("useAlertView")), "BOOLValue");
}

- (void)setUseAlertView:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("useAlertView"));
}

- (BOOL)userNameFieldEditable
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("userNameFieldEditable")), "BOOLValue");
}

- (void)setUserNameFieldEditable:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("userNameFieldEditable"));
}

- (id)alertViewPrompt
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("alertViewPrompt"));
}

- (void)setAlertViewPrompt:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("alertViewPrompt"));
}

- (BOOL)automaticallyCancelWhenSwitchingToBackground
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("automaticallyCancelWhenSwitchingToBackground")), "BOOLValue");
}

- (void)setAutomaticallyCancelWhenSwitchingToBackground:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("automaticallyCancelWhenSwitchingToBackground"));
}

- (BOOL)canUseTouchID
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("canUseTouchID")), "BOOLValue");
}

- (void)setCanUseTouchID:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("canUseTouchID"));
}

- (BOOL)generatedWithTouchID
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("generatedWithTouchID")), "BOOLValue");
}

- (void)setGeneratedWithTouchID:(BOOL)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("generatedWithTouchID"));
}

- (NSNumber)certificateDuration
{
  return (NSNumber *)-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("certificateDuration"));
}

- (void)setCertificateDuration:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("certificateDuration"));
}

@end
