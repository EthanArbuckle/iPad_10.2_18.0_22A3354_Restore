@implementation RMModelAccountMailDeclaration_IncomingServer

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ServerType");
  v6[1] = CFSTR("HostName");
  v6[2] = CFSTR("Port");
  v6[3] = CFSTR("AuthenticationMethod");
  v6[4] = CFSTR("AuthenticationCredentialsAssetReference");
  v6[5] = CFSTR("IMAPPathPrefix");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithServerType:(id)a3 hostName:(id)a4 port:(id)a5 authenticationMethod:(id)a6 authenticationCredentialsAssetReference:(id)a7 imapPathPrefix:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setPayloadServerType:", v18);

  objc_msgSend(v19, "setPayloadHostName:", v17);
  objc_msgSend(v19, "setPayloadPort:", v16);

  objc_msgSend(v19, "setPayloadAuthenticationMethod:", v15);
  objc_msgSend(v19, "setPayloadAuthenticationCredentialsAssetReference:", v14);

  objc_msgSend(v19, "setPayloadIMAPPathPrefix:", v13);
  return v19;
}

+ (id)buildRequiredOnlyWithServerType:(id)a3 hostName:(id)a4 authenticationMethod:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPayloadServerType:", v9);

  objc_msgSend(v10, "setPayloadHostName:", v8);
  objc_msgSend(v10, "setPayloadAuthenticationMethod:", v7);

  return v10;
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

  +[RMModelAccountMailDeclaration_IncomingServer allowedPayloadKeys](RMModelAccountMailDeclaration_IncomingServer, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ServerType"), CFSTR("payloadServerType"), 1, 0, a5)|| !-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("HostName"), CFSTR("payloadHostName"), 1, 0, a5))
  {
    goto LABEL_7;
  }
  v13 = 0;
  if (!-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Port"), CFSTR("payloadPort"), 0, 0, a5))goto LABEL_8;
  if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("AuthenticationMethod"), CFSTR("payloadAuthenticationMethod"), 1, 0, a5))
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v13 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("AuthenticationCredentialsAssetReference"), CFSTR("payloadAuthenticationCredentialsAssetReference"), 0, 0, a5))
  {
    v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("IMAPPathPrefix"), CFSTR("payloadIMAPPathPrefix"), 0, 0, a5);
  }
LABEL_8:

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
  -[RMModelAccountMailDeclaration_IncomingServer payloadServerType](self, "payloadServerType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ServerType"), v5, 1, 0);

  -[RMModelAccountMailDeclaration_IncomingServer payloadHostName](self, "payloadHostName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("HostName"), v6, 1, 0);

  -[RMModelAccountMailDeclaration_IncomingServer payloadPort](self, "payloadPort");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Port"), v7, 0, 0);

  -[RMModelAccountMailDeclaration_IncomingServer payloadAuthenticationMethod](self, "payloadAuthenticationMethod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("AuthenticationMethod"), v8, 1, 0);

  -[RMModelAccountMailDeclaration_IncomingServer payloadAuthenticationCredentialsAssetReference](self, "payloadAuthenticationCredentialsAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("AuthenticationCredentialsAssetReference"), v9, 0, 0);

  -[RMModelAccountMailDeclaration_IncomingServer payloadIMAPPathPrefix](self, "payloadIMAPPathPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("IMAPPathPrefix"), v10, 0, 0);

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
  v18.super_class = (Class)RMModelAccountMailDeclaration_IncomingServer;
  v4 = -[RMModelPayloadBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadServerType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadHostName, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadPort, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadAuthenticationMethod, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_payloadAuthenticationCredentialsAssetReference, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_payloadIMAPPathPrefix, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  return v4;
}

- (NSString)payloadServerType
{
  return self->_payloadServerType;
}

- (void)setPayloadServerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadHostName
{
  return self->_payloadHostName;
}

- (void)setPayloadHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadAuthenticationMethod
{
  return self->_payloadAuthenticationMethod;
}

- (void)setPayloadAuthenticationMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)payloadAuthenticationCredentialsAssetReference
{
  return self->_payloadAuthenticationCredentialsAssetReference;
}

- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadIMAPPathPrefix
{
  return self->_payloadIMAPPathPrefix;
}

- (void)setPayloadIMAPPathPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIMAPPathPrefix, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
  objc_storeStrong((id *)&self->_payloadServerType, 0);
}

@end
