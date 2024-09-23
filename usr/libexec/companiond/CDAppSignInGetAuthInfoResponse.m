@implementation CDAppSignInGetAuthInfoResponse

- (CDAppSignInGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4;
  CDAppSignInGetAuthInfoResponse *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  AKAuthorizationRequest *appleIDRequest;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  AKPasswordRequest *passwordRequest;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  CPSWebRequest *webRequest;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  ASCPublicKeyCredentialAssertionOptions *platformKeyCredentialAssertionOptions;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  ASCPublicKeyCredentialCreationOptions *platformKeyCredentialRegistrationOptions;
  CFTypeID TypeID;
  NSString *v32;
  NSString *appIdentifier;
  CFTypeID v34;
  NSString *v35;
  NSString *appBundleIdentifier;
  CFTypeID v37;
  NSString *v38;
  NSString *appTeamIdentifier;
  CFTypeID v40;
  NSString *v41;
  NSString *appName;
  CFTypeID v43;
  NSData *v44;
  NSData *appIconData;
  uint64_t NSNumber;
  void *v47;
  NSNumber *v48;
  NSNumber *appIconScale;
  uint64_t v50;
  void *v51;
  uint64_t NSArrayOfClass;
  void *v53;
  NSArray *v54;
  NSArray *appDomains;
  CFTypeID v56;
  NSString *v57;
  NSString *deviceClass;
  CFTypeID v59;
  NSString *v60;
  NSString *deviceName;
  objc_super v63;

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)CDAppSignInGetAuthInfoResponse;
  v5 = -[CDAppSignInGetAuthInfoResponse init](&v63, "init");
  if (v5)
  {
    v6 = objc_opt_self(AKAuthorizationRequest);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_100019F54(v4, CFSTR("appleIDRequest"), (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    appleIDRequest = v5->_appleIDRequest;
    v5->_appleIDRequest = (AKAuthorizationRequest *)v9;

    v11 = objc_opt_self(AKPasswordRequest);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_100019F54(v4, CFSTR("passwordRequest"), (uint64_t)v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    passwordRequest = v5->_passwordRequest;
    v5->_passwordRequest = (AKPasswordRequest *)v14;

    v16 = objc_opt_self(CPSWebRequest);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = sub_100019F54(v4, CFSTR("webRequest"), (uint64_t)v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    webRequest = v5->_webRequest;
    v5->_webRequest = (CPSWebRequest *)v19;

    v21 = objc_opt_self(ASCPublicKeyCredentialAssertionOptions);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = sub_100019F54(v4, CFSTR("platformKeyCredentialAssertionOptions"), (uint64_t)v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    platformKeyCredentialAssertionOptions = v5->_platformKeyCredentialAssertionOptions;
    v5->_platformKeyCredentialAssertionOptions = (ASCPublicKeyCredentialAssertionOptions *)v24;

    v26 = objc_opt_self(ASCPublicKeyCredentialCreationOptions);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = sub_100019F54(v4, CFSTR("platformKeyCredentialRegistrationOptions"), (uint64_t)v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    platformKeyCredentialRegistrationOptions = v5->_platformKeyCredentialRegistrationOptions;
    v5->_platformKeyCredentialRegistrationOptions = (ASCPublicKeyCredentialCreationOptions *)v29;

    TypeID = CFStringGetTypeID();
    v32 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("appID"), TypeID, 0), "copy");
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = v32;

    v34 = CFStringGetTypeID();
    v35 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("appBundleID"), v34, 0), "copy");
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = v35;

    v37 = CFStringGetTypeID();
    v38 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("appTeamID"), v37, 0), "copy");
    appTeamIdentifier = v5->_appTeamIdentifier;
    v5->_appTeamIdentifier = v38;

    v40 = CFStringGetTypeID();
    v41 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("appName"), v40, 0), "copy");
    appName = v5->_appName;
    v5->_appName = v41;

    v43 = CFDataGetTypeID();
    v44 = (NSData *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("appIconData"), v43, 0), "copy");
    appIconData = v5->_appIconData;
    v5->_appIconData = v44;

    NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("appIconScale"), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v48 = (NSNumber *)objc_msgSend(v47, "copy");
    appIconScale = v5->_appIconScale;
    v5->_appIconScale = v48;

    v50 = objc_opt_self(NSString);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    NSArrayOfClass = NSDictionaryGetNSArrayOfClass(v4, CFSTR("appDomains"), v51, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue(NSArrayOfClass);
    v54 = (NSArray *)objc_msgSend(v53, "copy");
    appDomains = v5->_appDomains;
    v5->_appDomains = v54;

    v56 = CFStringGetTypeID();
    v57 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceClass"), v56, 0), "copy");
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = v57;

    v59 = CFStringGetTypeID();
    v60 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceName"), v59, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v60;

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = sub_10001A22C((uint64_t)self->_appleIDRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appleIDRequest"));

  v6 = sub_10001A22C((uint64_t)self->_passwordRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("passwordRequest"));

  v8 = sub_10001A22C((uint64_t)self->_webRequest);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("webRequest"));

  v10 = sub_10001A22C((uint64_t)self->_platformKeyCredentialAssertionOptions);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("platformKeyCredentialAssertionOptions"));

  v12 = sub_10001A22C((uint64_t)self->_platformKeyCredentialRegistrationOptions);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("platformKeyCredentialRegistrationOptions"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appIdentifier, CFSTR("appID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appBundleIdentifier, CFSTR("appBundleID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appTeamIdentifier, CFSTR("appTeamID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appName, CFSTR("appName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appIconData, CFSTR("appIconData"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appIconScale, CFSTR("appIconScale"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appDomains, CFSTR("appDomains"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceName, CFSTR("deviceName"));
  v14 = objc_msgSend(v3, "copy");

  return v14;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appleIDRequest, CFSTR("appleIDRequest"), 1);
  v5 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_passwordRequest, CFSTR("passwordRequest"), 1);
  v6 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_webRequest, CFSTR("webRequest"), 1);
  v7 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_platformKeyCredentialAssertionOptions, CFSTR("platformKeyCredentialAssertionOptions"), 1);
  v8 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_platformKeyCredentialRegistrationOptions, CFSTR("platformKeyCredentialRegistrationOptions"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_appIdentifier, CFSTR("appIdentifier"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_appBundleIdentifier, CFSTR("appBundleIdentifier"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_appTeamIdentifier, CFSTR("appTeamIdentifier"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_appName, CFSTR("appName"), 1);
  v9 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appIconData, CFSTR("appIconData"), 1);
  v10 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appIconScale, CFSTR("appIconScale"), 1);
  v11 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appDomains, CFSTR("appDomains"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceClass, CFSTR("deviceClass"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceName, CFSTR("deviceName"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v12;
}

- (AKAuthorizationRequest)appleIDRequest
{
  return self->_appleIDRequest;
}

- (void)setAppleIDRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AKPasswordRequest)passwordRequest
{
  return self->_passwordRequest;
}

- (void)setPasswordRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CPSWebRequest)webRequest
{
  return self->_webRequest;
}

- (void)setWebRequest:(id)a3
{
  objc_storeStrong((id *)&self->_webRequest, a3);
}

- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions
{
  return self->_platformKeyCredentialAssertionOptions;
}

- (void)setPlatformKeyCredentialAssertionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertionOptions, a3);
}

- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialRegistrationOptions
{
  return self->_platformKeyCredentialRegistrationOptions;
}

- (void)setPlatformKeyCredentialRegistrationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_platformKeyCredentialRegistrationOptions, a3);
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)appTeamIdentifier
{
  return self->_appTeamIdentifier;
}

- (void)setAppTeamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)appIconData
{
  return self->_appIconData;
}

- (void)setAppIconData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)appIconScale
{
  return self->_appIconScale;
}

- (void)setAppIconScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)appDomains
{
  return self->_appDomains;
}

- (void)setAppDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_appDomains, 0);
  objc_storeStrong((id *)&self->_appIconScale, 0);
  objc_storeStrong((id *)&self->_appIconData, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appTeamIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialRegistrationOptions, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertionOptions, 0);
  objc_storeStrong((id *)&self->_webRequest, 0);
  objc_storeStrong((id *)&self->_passwordRequest, 0);
  objc_storeStrong((id *)&self->_appleIDRequest, 0);
}

@end
