@implementation RMModelAccountMailDeclaration_OutgoingServer

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("HostName");
  v6[1] = CFSTR("Port");
  v6[2] = CFSTR("AuthenticationMethod");
  v6[3] = CFSTR("AuthenticationCredentialsAssetReference");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithHostName:(id)a3 port:(id)a4 authenticationMethod:(id)a5 authenticationCredentialsAssetReference:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadHostName:", v12);

  objc_msgSend(v13, "setPayloadPort:", v11);
  objc_msgSend(v13, "setPayloadAuthenticationMethod:", v10);

  objc_msgSend(v13, "setPayloadAuthenticationCredentialsAssetReference:", v9);
  return v13;
}

+ (id)buildRequiredOnlyWithHostName:(id)a3 authenticationMethod:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadHostName:", v6);

  objc_msgSend(v7, "setPayloadAuthenticationMethod:", v5);
  return v7;
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

  +[RMModelAccountMailDeclaration_OutgoingServer allowedPayloadKeys](RMModelAccountMailDeclaration_OutgoingServer, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("HostName"), CFSTR("payloadHostName"), 1, 0, a5))goto LABEL_5;
  v13 = 0;
  if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Port"), CFSTR("payloadPort"), 0, 0, a5))
  {
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("AuthenticationMethod"), CFSTR("payloadAuthenticationMethod"), 1, 0, a5))
    {
      v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("AuthenticationCredentialsAssetReference"), CFSTR("payloadAuthenticationCredentialsAssetReference"), 0, 0, a5);
      goto LABEL_6;
    }
LABEL_5:
    v13 = 0;
  }
LABEL_6:

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

  v4 = (void *)objc_opt_new();
  -[RMModelAccountMailDeclaration_OutgoingServer payloadHostName](self, "payloadHostName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("HostName"), v5, 1, 0);

  -[RMModelAccountMailDeclaration_OutgoingServer payloadPort](self, "payloadPort");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Port"), v6, 0, 0);

  -[RMModelAccountMailDeclaration_OutgoingServer payloadAuthenticationMethod](self, "payloadAuthenticationMethod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("AuthenticationMethod"), v7, 1, 0);

  -[RMModelAccountMailDeclaration_OutgoingServer payloadAuthenticationCredentialsAssetReference](self, "payloadAuthenticationCredentialsAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("AuthenticationCredentialsAssetReference"), v8, 0, 0);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
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
  v14.super_class = (Class)RMModelAccountMailDeclaration_OutgoingServer;
  v4 = -[RMModelPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadHostName, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadPort, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadAuthenticationMethod, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadAuthenticationCredentialsAssetReference, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadHostName
{
  return self->_payloadHostName;
}

- (void)setPayloadHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadAuthenticationMethod
{
  return self->_payloadAuthenticationMethod;
}

- (void)setPayloadAuthenticationMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadAuthenticationCredentialsAssetReference
{
  return self->_payloadAuthenticationCredentialsAssetReference;
}

- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
}

@end
