@implementation RMModelAccountExchangeDeclaration_OAuth

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Enabled");
  v6[1] = CFSTR("SignInURL");
  v6[2] = CFSTR("TokenRequestURL");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 signInURL:(id)a4 tokenRequestURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPayloadEnabled:", v9);

  objc_msgSend(v10, "setPayloadSignInURL:", v8);
  objc_msgSend(v10, "setPayloadTokenRequestURL:", v7);

  return v10;
}

+ (id)buildRequiredOnlyWithEnabled:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadEnabled:", v3);

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelAccountExchangeDeclaration_OAuth allowedPayloadKeys](RMModelAccountExchangeDeclaration_OAuth, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Enabled"), CFSTR("payloadEnabled"), 1, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("SignInURL"), CFSTR("payloadSignInURL"), 0, 0, a5))
    {
      v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("TokenRequestURL"), CFSTR("payloadTokenRequestURL"), 0, 0, a5);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[RMModelAccountExchangeDeclaration_OAuth payloadEnabled](self, "payloadEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Enabled"), v5, 1, 0);

  -[RMModelAccountExchangeDeclaration_OAuth payloadSignInURL](self, "payloadSignInURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("SignInURL"), v6, 0, 0);

  -[RMModelAccountExchangeDeclaration_OAuth payloadTokenRequestURL](self, "payloadTokenRequestURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("TokenRequestURL"), v7, 0, 0);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RMModelAccountExchangeDeclaration_OAuth;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadEnabled, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadSignInURL, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadTokenRequestURL, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSNumber)payloadEnabled
{
  return self->_payloadEnabled;
}

- (void)setPayloadEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadSignInURL
{
  return self->_payloadSignInURL;
}

- (void)setPayloadSignInURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadTokenRequestURL
{
  return self->_payloadTokenRequestURL;
}

- (void)setPayloadTokenRequestURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTokenRequestURL, 0);
  objc_storeStrong((id *)&self->_payloadSignInURL, 0);
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
}

@end
