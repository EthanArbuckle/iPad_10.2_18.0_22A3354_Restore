@implementation RMModelNetworkEAPDeclaration_PrivateAccessToken

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Type");
  v6[1] = CFSTR("IssuerName");
  v6[2] = CFSTR("RedemptionContext");
  v6[3] = CFSTR("TokenKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithType:(id)a3 issuerName:(id)a4 redemptionContext:(id)a5 tokenKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v14 = v13;
  if (v12)
    v15 = v12;
  else
    v15 = &unk_251629CD0;
  objc_msgSend(v13, "setPayloadType:", v15);

  objc_msgSend(v14, "setPayloadIssuerName:", v11);
  objc_msgSend(v14, "setPayloadRedemptionContext:", v10);

  objc_msgSend(v14, "setPayloadTokenKey:", v9);
  return v14;
}

+ (id)buildRequiredOnlyWithIssuerName:(id)a3 tokenKey:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadIssuerName:", v6);

  objc_msgSend(v7, "setPayloadTokenKey:", v5);
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

  +[RMModelNetworkEAPDeclaration_PrivateAccessToken allowedPayloadKeys](RMModelNetworkEAPDeclaration_PrivateAccessToken, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  v14 = 0;
  if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Type"), CFSTR("payloadType"), 0, &unk_251629CD0, a5))
  {
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("IssuerName"), CFSTR("payloadIssuerName"), 1, 0, a5))
    {
      v14 = 0;
      if (-[RMModelPayloadBase loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:](self, "loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:", v8, CFSTR("RedemptionContext"), CFSTR("payloadRedemptionContext"), 0, 0, v6, a5))
      {
        v14 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("TokenKey"), CFSTR("payloadTokenKey"), 1, 0, a5);
      }
    }
    else
    {
      v14 = 0;
    }
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
  void *v9;
  void *v10;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  -[RMModelNetworkEAPDeclaration_PrivateAccessToken payloadType](self, "payloadType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Type"), v6, 0, &unk_251629CD0);

  -[RMModelNetworkEAPDeclaration_PrivateAccessToken payloadIssuerName](self, "payloadIssuerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("IssuerName"), v7, 1, 0);

  -[RMModelNetworkEAPDeclaration_PrivateAccessToken payloadRedemptionContext](self, "payloadRedemptionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:](self, "serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:", v5, CFSTR("RedemptionContext"), v8, 0, 0, v3);

  -[RMModelNetworkEAPDeclaration_PrivateAccessToken payloadTokenKey](self, "payloadTokenKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("TokenKey"), v9, 1, 0);

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
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
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RMModelNetworkEAPDeclaration_PrivateAccessToken;
  v4 = -[RMModelPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadIssuerName, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSData copy](self->_payloadRedemptionContext, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadTokenKey, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadIssuerName
{
  return self->_payloadIssuerName;
}

- (void)setPayloadIssuerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)payloadRedemptionContext
{
  return self->_payloadRedemptionContext;
}

- (void)setPayloadRedemptionContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadTokenKey
{
  return self->_payloadTokenKey;
}

- (void)setPayloadTokenKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTokenKey, 0);
  objc_storeStrong((id *)&self->_payloadRedemptionContext, 0);
  objc_storeStrong((id *)&self->_payloadIssuerName, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end
