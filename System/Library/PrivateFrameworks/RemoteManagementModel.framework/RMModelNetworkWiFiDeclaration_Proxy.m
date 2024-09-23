@implementation RMModelNetworkWiFiDeclaration_Proxy

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Type");
  v6[1] = CFSTR("Server");
  v6[2] = CFSTR("ServerPort");
  v6[3] = CFSTR("ProxyAuthenticationCredentialsAssetReference");
  v6[4] = CFSTR("PACURL");
  v6[5] = CFSTR("PACFallbackAllowed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithType:(id)a3 server:(id)a4 serverPort:(id)a5 proxyAuthenticationCredentialsAssetReference:(id)a6 PACURL:(id)a7 pacFallbackAllowed:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = (__CFString *)a3;
  v19 = (void *)objc_opt_new();
  v20 = v19;
  if (v18)
    v21 = v18;
  else
    v21 = CFSTR("None");
  objc_msgSend(v19, "setPayloadType:", v21);

  objc_msgSend(v20, "setPayloadServer:", v17);
  objc_msgSend(v20, "setPayloadServerPort:", v16);

  objc_msgSend(v20, "setPayloadProxyAuthenticationCredentialsAssetReference:", v15);
  objc_msgSend(v20, "setPayloadPACURL:", v14);

  if (v13)
    v22 = v13;
  else
    v22 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v20, "setPayloadPACFallbackAllowed:", v22);

  return v20;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
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

  +[RMModelNetworkWiFiDeclaration_Proxy allowedPayloadKeys](RMModelNetworkWiFiDeclaration_Proxy, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Type"), CFSTR("payloadType"), 0, CFSTR("None"), a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Server"), CFSTR("payloadServer"), 0, 0, a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ServerPort"), CFSTR("payloadServerPort"), 0, 0, a5))
      {
        v13 = 0;
        if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ProxyAuthenticationCredentialsAssetReference"), CFSTR("payloadProxyAuthenticationCredentialsAssetReference"), 0, 0, a5))
        {
          v13 = 0;
          if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PACURL"), CFSTR("payloadPACURL"), 0, 0, a5))
          {
            v13 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PACFallbackAllowed"), CFSTR("payloadPACFallbackAllowed"), 0, MEMORY[0x24BDBD1C0], a5);
          }
        }
      }
    }
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
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_opt_new();
  -[RMModelNetworkWiFiDeclaration_Proxy payloadType](self, "payloadType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Type"), v5, 0, CFSTR("None"));

  -[RMModelNetworkWiFiDeclaration_Proxy payloadServer](self, "payloadServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Server"), v6, 0, 0);

  -[RMModelNetworkWiFiDeclaration_Proxy payloadServerPort](self, "payloadServerPort");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ServerPort"), v7, 0, 0);

  -[RMModelNetworkWiFiDeclaration_Proxy payloadProxyAuthenticationCredentialsAssetReference](self, "payloadProxyAuthenticationCredentialsAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ProxyAuthenticationCredentialsAssetReference"), v8, 0, 0);

  -[RMModelNetworkWiFiDeclaration_Proxy payloadPACURL](self, "payloadPACURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PACURL"), v9, 0, 0);

  -[RMModelNetworkWiFiDeclaration_Proxy payloadPACFallbackAllowed](self, "payloadPACFallbackAllowed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PACFallbackAllowed"), v10, 0, MEMORY[0x24BDBD1C0]);

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RMModelNetworkWiFiDeclaration_Proxy;
  v4 = -[RMModelPayloadBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadServer, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadServerPort, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadProxyAuthenticationCredentialsAssetReference, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_payloadPACURL, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_payloadPACFallbackAllowed, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  return v4;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadServer
{
  return self->_payloadServer;
}

- (void)setPayloadServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadServerPort
{
  return self->_payloadServerPort;
}

- (void)setPayloadServerPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadProxyAuthenticationCredentialsAssetReference
{
  return self->_payloadProxyAuthenticationCredentialsAssetReference;
}

- (void)setPayloadProxyAuthenticationCredentialsAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)payloadPACURL
{
  return self->_payloadPACURL;
}

- (void)setPayloadPACURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadPACFallbackAllowed
{
  return self->_payloadPACFallbackAllowed;
}

- (void)setPayloadPACFallbackAllowed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPACFallbackAllowed, 0);
  objc_storeStrong((id *)&self->_payloadPACURL, 0);
  objc_storeStrong((id *)&self->_payloadProxyAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadServerPort, 0);
  objc_storeStrong((id *)&self->_payloadServer, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end
