@implementation RMModelIdentityCredentialDeclaration

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Password");
  v6[1] = CFSTR("Identity");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithPassword:(id)a3 identity:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadPassword:", v6);

  objc_msgSend(v7, "setPayloadIdentity:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithPassword:(id)a3 identity:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadPassword:", v6);

  objc_msgSend(v7, "setPayloadIdentity:", v5);
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a4;
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelIdentityCredentialDeclaration allowedPayloadKeys](RMModelIdentityCredentialDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Password"), CFSTR("payloadPassword"), 1, 0, a5))
  {
    v14 = -[RMModelPayloadBase loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:](self, "loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Identity"), CFSTR("payloadIdentity"), 1, 0, v6, a5);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  -[RMModelIdentityCredentialDeclaration payloadPassword](self, "payloadPassword");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Password"), v6, 1, 0);

  -[RMModelIdentityCredentialDeclaration payloadIdentity](self, "payloadIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:](self, "serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:", v5, CFSTR("Identity"), v7, 1, 0, v3);

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RMModelIdentityCredentialDeclaration;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadPassword, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSData copy](self->_payloadIdentity, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)payloadIdentity
{
  return self->_payloadIdentity;
}

- (void)setPayloadIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIdentity, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
}

@end
