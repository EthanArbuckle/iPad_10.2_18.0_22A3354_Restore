@implementation CDLegacyAppSignInDidFinishAuthRequest

- (CDLegacyAppSignInDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4;
  CDLegacyAppSignInDidFinishAuthRequest *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  AKAuthorization *authorization;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSError *error;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CDLegacyAppSignInDidFinishAuthRequest;
  v5 = -[CDLegacyAppSignInDidFinishAuthRequest init](&v17, "init");
  if (v5)
  {
    v6 = objc_opt_self(AKAuthorization);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_100019F54(v4, CFSTR("Authorization"), (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    authorization = v5->_authorization;
    v5->_authorization = (AKAuthorization *)v9;

    v11 = objc_opt_self(NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_100019F54(v4, CFSTR("Error"), (uint64_t)v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    error = v5->_error;
    v5->_error = (NSError *)v14;

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = sub_10001A22C((uint64_t)self->_authorization);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Authorization"));

  v6 = sub_10001A22C((uint64_t)self->_error);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Error"));

  v8 = objc_msgSend(v3, "copy");
  return v8;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_authorization, CFSTR("authorization"), 1);
  v5 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_error, CFSTR("error"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v6;
}

- (AKAuthorization)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_authorization, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
}

@end
