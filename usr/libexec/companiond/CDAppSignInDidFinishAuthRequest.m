@implementation CDAppSignInDidFinishAuthRequest

- (CDAppSignInDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4;
  CDAppSignInDidFinishAuthRequest *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  AKAuthorization *appleIDAuthorization;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSError *error;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  CASPasswordCredential *passwordCredential;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSURL *webCallbackURL;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  ASCPlatformPublicKeyCredentialAssertion *platformKeyCredentialAssertion;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  ASCPlatformPublicKeyCredentialRegistration *platformKeyCredentialRegistration;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CDAppSignInDidFinishAuthRequest;
  v5 = -[CDAppSignInDidFinishAuthRequest init](&v37, "init");
  if (v5)
  {
    v6 = objc_opt_self(AKAuthorization);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_100019F54(v4, CFSTR("appleIDAuthorization"), (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    appleIDAuthorization = v5->_appleIDAuthorization;
    v5->_appleIDAuthorization = (AKAuthorization *)v9;

    v11 = objc_opt_self(NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_100019F54(v4, CFSTR("authError"), (uint64_t)v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    error = v5->_error;
    v5->_error = (NSError *)v14;

    v16 = objc_opt_self(CASPasswordCredential);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = sub_100019F54(v4, CFSTR("passwordCredential"), (uint64_t)v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    passwordCredential = v5->_passwordCredential;
    v5->_passwordCredential = (CASPasswordCredential *)v19;

    v21 = objc_opt_self(NSURL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = sub_100019F54(v4, CFSTR("webCallbackURL"), (uint64_t)v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    webCallbackURL = v5->_webCallbackURL;
    v5->_webCallbackURL = (NSURL *)v24;

    v26 = objc_opt_self(ASCPlatformPublicKeyCredentialAssertion);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = sub_100019F54(v4, CFSTR("platformKeyCredentialAssertion"), (uint64_t)v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    platformKeyCredentialAssertion = v5->_platformKeyCredentialAssertion;
    v5->_platformKeyCredentialAssertion = (ASCPlatformPublicKeyCredentialAssertion *)v29;

    v31 = objc_opt_self(ASCPlatformPublicKeyCredentialRegistration);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = sub_100019F54(v4, CFSTR("platformKeyCredentialRegistration"), (uint64_t)v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    platformKeyCredentialRegistration = v5->_platformKeyCredentialRegistration;
    v5->_platformKeyCredentialRegistration = (ASCPlatformPublicKeyCredentialRegistration *)v34;

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
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = sub_10001A22C((uint64_t)self->_appleIDAuthorization);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appleIDAuthorization"));

  v6 = sub_10001A22C((uint64_t)self->_error);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("authError"));

  v8 = sub_10001A22C((uint64_t)self->_passwordCredential);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("passwordCredential"));

  v10 = sub_10001A22C((uint64_t)self->_webCallbackURL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("webCallbackURL"));

  v12 = sub_10001A22C((uint64_t)self->_platformKeyCredentialAssertion);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("platformKeyCredentialAssertion"));

  v14 = sub_10001A22C((uint64_t)self->_platformKeyCredentialRegistration);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("platformKeyCredentialRegistration"));

  v16 = objc_msgSend(v3, "copy");
  return v16;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appleIDAuthorization, CFSTR("appleIDAuthorization"), 1);
  v5 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_error, CFSTR("error"), 1);
  v6 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_passwordCredential, CFSTR("passwordCredential"), 1);
  if (self->_webCallbackURL)
  {
    v7 = CUPrintNSObjectMasked();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v3, "appendString:withName:", v8, CFSTR("webCallbackURL"));

  }
  v9 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_platformKeyCredentialAssertion, CFSTR("platformKeyCredentialAssertion"), 1);
  v10 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_platformKeyCredentialRegistration, CFSTR("platformKeyCredentialRegistration"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v11;
}

- (AKAuthorization)appleIDAuthorization
{
  return self->_appleIDAuthorization;
}

- (void)setAppleIDAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDAuthorization, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CASPasswordCredential)passwordCredential
{
  return self->_passwordCredential;
}

- (void)setPasswordCredential:(id)a3
{
  objc_storeStrong((id *)&self->_passwordCredential, a3);
}

- (NSURL)webCallbackURL
{
  return self->_webCallbackURL;
}

- (void)setWebCallbackURL:(id)a3
{
  objc_storeStrong((id *)&self->_webCallbackURL, a3);
}

- (ASCPlatformPublicKeyCredentialAssertion)platformKeyCredentialAssertion
{
  return self->_platformKeyCredentialAssertion;
}

- (void)setPlatformKeyCredentialAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertion, a3);
}

- (ASCPlatformPublicKeyCredentialRegistration)platformKeyCredentialRegistration
{
  return self->_platformKeyCredentialRegistration;
}

- (void)setPlatformKeyCredentialRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_platformKeyCredentialRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformKeyCredentialRegistration, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertion, 0);
  objc_storeStrong((id *)&self->_webCallbackURL, 0);
  objc_storeStrong((id *)&self->_passwordCredential, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_appleIDAuthorization, 0);
}

@end
