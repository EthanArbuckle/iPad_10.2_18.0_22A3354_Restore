@implementation RMModelScreenSharingConnectionDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.screensharing.connection");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ConnectionUUID");
  v6[1] = CFSTR("DisplayName");
  v6[2] = CFSTR("HostName");
  v6[3] = CFSTR("Port");
  v6[4] = CFSTR("DisplayConfiguration");
  v6[5] = CFSTR("AuthenticationCredentialsAssetReference");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626208);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_10 != -1)
    dispatch_once(&assetReferences_onceToken_10, &__block_literal_global_16);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_10, self);
}

void __60__RMModelScreenSharingConnectionDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251626220, CFSTR("$.payloadAuthenticationCredentialsAssetReference"));
  v3[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)assetReferences_assetPaths_10;
  assetReferences_assetPaths_10 = v1;

}

+ (id)buildWithIdentifier:(id)a3 connectionUUID:(id)a4 displayName:(id)a5 hostName:(id)a6 port:(id)a7 displayConfiguration:(id)a8 authenticationCredentialsAssetReference:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  v14 = a3;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setDeclarationType:", CFSTR("com.apple.configuration.screensharing.connection"));
  if (v14)
  {
    objc_msgSend(v21, "setDeclarationIdentifier:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDeclarationIdentifier:", v23);

  }
  objc_msgSend(v21, "setPayloadConnectionUUID:", v20);

  objc_msgSend(v21, "setPayloadDisplayName:", v19);
  objc_msgSend(v21, "setPayloadHostName:", v18);

  objc_msgSend(v21, "setPayloadPort:", v17);
  objc_msgSend(v21, "setPayloadDisplayConfiguration:", v16);

  objc_msgSend(v21, "setPayloadAuthenticationCredentialsAssetReference:", v15);
  objc_msgSend(v21, "updateServerToken");

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 connectionUUID:(id)a4 displayName:(id)a5 hostName:(id)a6 displayConfiguration:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.screensharing.connection"));
  if (v11)
  {
    objc_msgSend(v16, "setDeclarationIdentifier:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDeclarationIdentifier:", v18);

  }
  objc_msgSend(v16, "setPayloadConnectionUUID:", v15);

  objc_msgSend(v16, "setPayloadDisplayName:", v14);
  objc_msgSend(v16, "setPayloadHostName:", v13);

  objc_msgSend(v16, "setPayloadDisplayConfiguration:", v12);
  objc_msgSend(v16, "updateServerToken");

  return v16;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = &unk_251629EC8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626238);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626250);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v16;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelScreenSharingConnectionDeclaration allowedPayloadKeys](RMModelScreenSharingConnectionDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ConnectionUUID"), CFSTR("payloadConnectionUUID"), 1, 0, a5)|| !-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("DisplayName"), CFSTR("payloadDisplayName"), 1, 0, a5)|| !-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
          "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
          v8,
          CFSTR("HostName"),
          CFSTR("payloadHostName"),
          1,
          0,
          a5))
  {
    goto LABEL_7;
  }
  v14 = 0;
  if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Port"), CFSTR("payloadPort"), 0, 0, a5))
  {
    LOWORD(v16) = a4;
    if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("DisplayConfiguration"), CFSTR("payloadDisplayConfiguration"), objc_opt_class(), 1, 0, v16, a5))
    {
      v14 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("AuthenticationCredentialsAssetReference"), CFSTR("payloadAuthenticationCredentialsAssetReference"), 0, 0, a5);
      goto LABEL_8;
    }
LABEL_7:
    v14 = 0;
  }
LABEL_8:

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  signed __int16 v15;

  v5 = (void *)objc_opt_new();
  -[RMModelScreenSharingConnectionDeclaration payloadConnectionUUID](self, "payloadConnectionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ConnectionUUID"), v6, 1, 0);

  -[RMModelScreenSharingConnectionDeclaration payloadDisplayName](self, "payloadDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("DisplayName"), v7, 1, 0);

  -[RMModelScreenSharingConnectionDeclaration payloadHostName](self, "payloadHostName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("HostName"), v8, 1, 0);

  -[RMModelScreenSharingConnectionDeclaration payloadPort](self, "payloadPort");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Port"), v9, 0, 0);

  -[RMModelScreenSharingConnectionDeclaration payloadDisplayConfiguration](self, "payloadDisplayConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__RMModelScreenSharingConnectionDeclaration_serializePayloadWithType___block_invoke;
  v14[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v15 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("DisplayConfiguration"), v10, v14, 1, 0);

  -[RMModelScreenSharingConnectionDeclaration payloadAuthenticationCredentialsAssetReference](self, "payloadAuthenticationCredentialsAssetReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("AuthenticationCredentialsAssetReference"), v11, 0, 0);

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

uint64_t __70__RMModelScreenSharingConnectionDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
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
  v18.super_class = (Class)RMModelScreenSharingConnectionDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadConnectionUUID, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadDisplayName, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_payloadHostName, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSNumber copy](self->_payloadPort, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[RMModelScreenSharingConnectionDeclaration_DisplayConfiguration copy](self->_payloadDisplayConfiguration, "copy");
  v14 = (void *)v4[10];
  v4[10] = v13;

  v15 = -[NSString copy](self->_payloadAuthenticationCredentialsAssetReference, "copy");
  v16 = (void *)v4[11];
  v4[11] = v15;

  return v4;
}

- (NSString)payloadConnectionUUID
{
  return self->_payloadConnectionUUID;
}

- (void)setPayloadConnectionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadDisplayName
{
  return self->_payloadDisplayName;
}

- (void)setPayloadDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadHostName
{
  return self->_payloadHostName;
}

- (void)setPayloadHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (RMModelScreenSharingConnectionDeclaration_DisplayConfiguration)payloadDisplayConfiguration
{
  return self->_payloadDisplayConfiguration;
}

- (void)setPayloadDisplayConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadAuthenticationCredentialsAssetReference
{
  return self->_payloadAuthenticationCredentialsAssetReference;
}

- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
  objc_storeStrong((id *)&self->_payloadDisplayName, 0);
  objc_storeStrong((id *)&self->_payloadConnectionUUID, 0);
}

@end
