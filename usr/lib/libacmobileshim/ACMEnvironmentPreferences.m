@implementation ACMEnvironmentPreferences

+ (id)supportedRealms
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("APPLECONNECT.APPLE.COM");
  v3[1] = CFSTR("APPLECONNECT-UAT.APPLE.COM");
  v3[2] = CFSTR("AC-AT.APPLE.COM");
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
}

+ (id)environmentSpecifications
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("APPLECONNECT.APPLE.COM");
  v7[0] = CFSTR("ACMEnvironmentRealmKey");
  v7[1] = CFSTR("ACMEnvironmentRealmNameKey");
  v8[0] = CFSTR("APPLECONNECT.APPLE.COM");
  v8[1] = CFSTR("Production");
  v7[2] = CFSTR("ACMEnvironmentRealmShortNameKey");
  v7[3] = CFSTR("ACMEnvironmentIForgotLinkKey");
  v8[2] = CFSTR("Production");
  v8[3] = CFSTR("https://iforgot.apple.com/");
  v10[0] = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v9[1] = CFSTR("APPLECONNECT-UAT.APPLE.COM");
  v5[0] = CFSTR("ACMEnvironmentRealmKey");
  v5[1] = CFSTR("ACMEnvironmentRealmNameKey");
  v6[0] = CFSTR("APPLECONNECT-UAT.APPLE.COM");
  v6[1] = CFSTR("User Acceptance Test");
  v5[2] = CFSTR("ACMEnvironmentRealmShortNameKey");
  v5[3] = CFSTR("ACMEnvironmentIForgotLinkKey");
  v6[2] = CFSTR("UAT");
  v6[3] = CFSTR("https://iforgot-uat.apple.com/");
  v10[1] = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v9[2] = CFSTR("AC-AT.APPLE.COM");
  v3[0] = CFSTR("ACMEnvironmentRealmKey");
  v3[1] = CFSTR("ACMEnvironmentRealmNameKey");
  v4[0] = CFSTR("AC-AT.APPLE.COM");
  v4[1] = CFSTR("Acceptance Test (Old)");
  v3[2] = CFSTR("ACMEnvironmentRealmShortNameKey");
  v3[3] = CFSTR("ACMEnvironmentIForgotLinkKey");
  v4[2] = CFSTR("UAT Old");
  v4[3] = CFSTR("https://iforgott.apple.com/");
  v10[2] = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
}

+ (BOOL)isSupportedRealm:(id)a3
{
  return objc_msgSend(+[ACMEnvironmentPreferences environmentSpecifications](ACMEnvironmentPreferences, "environmentSpecifications"), "objectForKey:", a3) != 0;
}

+ (id)environmentPreferencesWithRealm:(id)a3
{
  if (+[ACMEnvironmentPreferences isSupportedRealm:](ACMEnvironmentPreferences, "isSupportedRealm:"))
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRealm:", a3);
  else
    return 0;
}

- (ACMEnvironmentPreferences)initWithRealm:(id)a3
{
  ACMEnvironmentPreferences *v4;
  ACMEnvironmentPreferences *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACMEnvironmentPreferences;
  v4 = -[ACMEnvironmentPreferences init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ACMEnvironmentPreferences setEnvironmentSpecification:](v4, "setEnvironmentSpecification:", -[ACMEnvironmentPreferences environmentSpecificationForRealm:](v4, "environmentSpecificationForRealm:", a3));
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMEnvironmentPreferences setEnvironmentSpecification:](self, "setEnvironmentSpecification:", 0);
  -[ACMEnvironmentPreferences setPrincipalPreferences:](self, "setPrincipalPreferences:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMEnvironmentPreferences;
  -[ACMPreferences dealloc](&v3, sel_dealloc);
}

- (id)principalPreferencesWithUserName:(id)a3
{
  ACMPrincipalPreferences *v5;

  objc_sync_enter(self);
  if ((objc_msgSend(a3, "isEqualToString:", -[ACMPrincipalPreferences userName](-[ACMEnvironmentPreferences principalPreferences](self, "principalPreferences"), "userName")) & 1) == 0)
  {
    -[ACMEnvironmentPreferences setPrincipalPreferences:](self, "setPrincipalPreferences:", -[ACMEnvironmentPreferences createPrincipalPreferencesWithUserName:](self, "createPrincipalPreferencesWithUserName:", a3));
    -[ACMPreferences setPreferencesStore:](-[ACMEnvironmentPreferences principalPreferences](self, "principalPreferences"), "setPreferencesStore:", -[ACMPreferences preferencesStore](self, "preferencesStore"));
  }
  v5 = -[ACMEnvironmentPreferences principalPreferences](self, "principalPreferences");
  objc_sync_exit(self);
  return v5;
}

- (id)createPrincipalPreferencesWithUserName:(id)a3
{
  return +[ACMPrincipalPreferences preferencesForPrincipal:](ACMPrincipalPreferences, "preferencesForPrincipal:", +[ACFPrincipal principalWithUserName:realm:](ACFPrincipal, "principalWithUserName:realm:", a3, -[ACMEnvironmentPreferences realm](self, "realm")));
}

- (id)environmentSpecificationForRealm:(id)a3
{
  return (id)objc_msgSend(+[ACMEnvironmentPreferences environmentSpecifications](ACMEnvironmentPreferences, "environmentSpecifications"), "objectForKey:", a3);
}

- (NSString)realm
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](-[ACMEnvironmentPreferences environmentSpecification](self, "environmentSpecification"), "objectForKeyedSubscript:", CFSTR("ACMEnvironmentRealmKey"));
}

- (id)realmName
{
  return -[NSDictionary objectForKeyedSubscript:](-[ACMEnvironmentPreferences environmentSpecification](self, "environmentSpecification"), "objectForKeyedSubscript:", CFSTR("ACMEnvironmentRealmNameKey"));
}

- (id)realmShortName
{
  return -[NSDictionary objectForKeyedSubscript:](-[ACMEnvironmentPreferences environmentSpecification](self, "environmentSpecification"), "objectForKeyedSubscript:", CFSTR("ACMEnvironmentRealmShortNameKey"));
}

- (id)serverHosts
{
  return 0;
}

- (id)serverAttemptsDelays
{
  return 0;
}

- (id)authenticateURLString
{
  return CFSTR("https://%@/plist/profileservice/authenticate");
}

- (id)verifyTicketURLString
{
  return CFSTR("https://%@/plist/profileservice/validateserviceticket");
}

- (id)getTrustedDevicesURLString
{
  return CFSTR("https://%@/profileservice/getSAOptions");
}

- (id)generateAndSendSecCodeURLString
{
  return CFSTR("https://%@/profileservice/generateAndSendSecCode");
}

- (id)verifySecurityCodeURLString
{
  return CFSTR("https://%@/profileservice/validateSecCode");
}

- (id)verifyRecoveryKeyURLString
{
  return 0;
}

- (id)myAppleIDURL
{
  return 0;
}

- (id)publicKeyCertificateName
{
  return -[ACMPreferences preferencesValueForKey:](self, "preferencesValueForKey:", objc_msgSend(CFSTR("PublicKeyCertificateNameKey"), "stringByAppendingFormat:", CFSTR("-%@"), -[ACMEnvironmentPreferences realm](self, "realm"), 0));
}

- (void)setPublicKeyCertificateName:(id)a3
{
  -[ACMPreferences setPreferencesValue:forKey:](self, "setPreferencesValue:forKey:", a3, objc_msgSend(CFSTR("PublicKeyCertificateNameKey"), "stringByAppendingFormat:", CFSTR("-%@"), -[ACMEnvironmentPreferences realm](self, "realm"), 0));
}

- (id)publicKeyVersion
{
  return -[ACMPreferences preferencesValueForKey:](self, "preferencesValueForKey:", objc_msgSend(CFSTR("ACMDSKeyVersionKey"), "stringByAppendingFormat:", CFSTR("-%@"), -[ACMEnvironmentPreferences realm](self, "realm"), 0));
}

- (void)setPublicKeyVersion:(id)a3
{
  -[ACMPreferences setPreferencesValue:forKey:](self, "setPreferencesValue:forKey:", a3, objc_msgSend(CFSTR("ACMDSKeyVersionKey"), "stringByAppendingFormat:", CFSTR("-%@"), -[ACMEnvironmentPreferences realm](self, "realm"), 0));
}

- (id)defaultPublicKeyString
{
  return 0;
}

- (id)provisionedDeviceIdentifier
{
  return 0;
}

- (id)iForgotURL
{
  return -[NSDictionary objectForKeyedSubscript:](-[ACMEnvironmentPreferences environmentSpecification](self, "environmentSpecification"), "objectForKeyedSubscript:", CFSTR("ACMEnvironmentIForgotLinkKey"));
}

- (NSDictionary)environmentSpecification
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEnvironmentSpecification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (ACMPrincipalPreferences)principalPreferences
{
  return (ACMPrincipalPreferences *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrincipalPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
