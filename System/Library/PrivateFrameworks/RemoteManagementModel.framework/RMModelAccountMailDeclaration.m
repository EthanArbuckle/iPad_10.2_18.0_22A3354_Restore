@implementation RMModelAccountMailDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.account.mail");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("VisibleName");
  v6[1] = CFSTR("UserIdentityAssetReference");
  v6[2] = CFSTR("IncomingServer");
  v6[3] = CFSTR("OutgoingServer");
  v6[4] = CFSTR("SMIME");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516247B0);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_4 != -1)
    dispatch_once(&assetReferences_onceToken_4, &__block_literal_global_4);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_4, self);
}

void __48__RMModelAccountMailDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  RMModelConfigurationSchemaAssetReference *v1;
  RMModelConfigurationSchemaAssetReference *v2;
  RMModelConfigurationSchemaAssetReference *v3;
  RMModelConfigurationSchemaAssetReference *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_2516247C8, CFSTR("$.payloadUserIdentityAssetReference"));
  v1 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_2516247E0, CFSTR("$.payloadIncomingServer.payloadAuthenticationCredentialsAssetReference"), v0);
  v7[1] = v1;
  v2 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_2516247F8, CFSTR("$.payloadOutgoingServer.payloadAuthenticationCredentialsAssetReference"));
  v7[2] = v2;
  v3 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251624810, CFSTR("$.payloadSMIME.payloadSigning.payloadIdentityAssetReference"));
  v7[3] = v3;
  v4 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251624828, CFSTR("$.payloadSMIME.payloadEncryption.payloadIdentityAssetReference"));
  v7[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)assetReferences_assetPaths_4;
  assetReferences_assetPaths_4 = v5;

}

+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 userIdentityAssetReference:(id)a5 incomingServer:(id)a6 outgoingServer:(id)a7 SMIME:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v13 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setDeclarationType:", CFSTR("com.apple.configuration.account.mail"));
  if (v13)
  {
    objc_msgSend(v19, "setDeclarationIdentifier:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDeclarationIdentifier:", v21);

  }
  objc_msgSend(v19, "setPayloadVisibleName:", v18);

  objc_msgSend(v19, "setPayloadUserIdentityAssetReference:", v17);
  objc_msgSend(v19, "setPayloadIncomingServer:", v16);

  objc_msgSend(v19, "setPayloadOutgoingServer:", v15);
  objc_msgSend(v19, "setPayloadSMIME:", v14);

  objc_msgSend(v19, "updateServerToken");
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 incomingServer:(id)a4 outgoingServer:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.account.mail"));
  if (v7)
  {
    objc_msgSend(v10, "setDeclarationIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeclarationIdentifier:", v12);

  }
  objc_msgSend(v10, "setPayloadIncomingServer:", v9);

  objc_msgSend(v10, "setPayloadOutgoingServer:", v8);
  objc_msgSend(v10, "updateServerToken");

  return v10;
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[6];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20[0] = &unk_251629190;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624840);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624858);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v20[1] = &unk_2516291D8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624870);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624888);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  v20[2] = &unk_2516291A8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516248A0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516248B8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  v20[3] = &unk_2516291F0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516248D0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516248E8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  uint64_t v17;
  uint64_t v18;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelAccountMailDeclaration allowedPayloadKeys](RMModelAccountMailDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  v14 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("VisibleName"), CFSTR("payloadVisibleName"), 0, 0, a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("UserIdentityAssetReference"), CFSTR("payloadUserIdentityAssetReference"), 0, 0, a5))
    {
      LOWORD(v16) = a4;
      if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("IncomingServer"), CFSTR("payloadIncomingServer"), objc_opt_class(), 1, 0, v16, a5)&& (LOWORD(v17) = a4, -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("OutgoingServer"), CFSTR("payloadOutgoingServer"), objc_opt_class(), 1,
              0,
              v17,
              a5)))
      {
        LOWORD(v18) = a4;
        v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("SMIME"), CFSTR("payloadSMIME"), objc_opt_class(), 0, 0, v18, a5);
      }
      else
      {
        v14 = 0;
      }
    }
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  signed __int16 v15;
  _QWORD v16[4];
  signed __int16 v17;
  _QWORD v18[4];
  signed __int16 v19;

  v5 = (void *)objc_opt_new();
  -[RMModelAccountMailDeclaration payloadVisibleName](self, "payloadVisibleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("VisibleName"), v6, 0, 0);

  -[RMModelAccountMailDeclaration payloadUserIdentityAssetReference](self, "payloadUserIdentityAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("UserIdentityAssetReference"), v7, 0, 0);

  -[RMModelAccountMailDeclaration payloadIncomingServer](self, "payloadIncomingServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke;
  v18[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v19 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("IncomingServer"), v8, v18, 1, 0);

  -[RMModelAccountMailDeclaration payloadOutgoingServer](self, "payloadOutgoingServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke_2;
  v16[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v17 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("OutgoingServer"), v10, v16, 1, 0);

  -[RMModelAccountMailDeclaration payloadSMIME](self, "payloadSMIME");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke_3;
  v14[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v15 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("SMIME"), v11, v14, 0, 0);

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

uint64_t __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RMModelAccountMailDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadVisibleName, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadUserIdentityAssetReference, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[RMModelAccountMailDeclaration_IncomingServer copy](self->_payloadIncomingServer, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[RMModelAccountMailDeclaration_OutgoingServer copy](self->_payloadOutgoingServer, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[RMModelAccountMailDeclaration_SMIME copy](self->_payloadSMIME, "copy");
  v14 = (void *)v4[10];
  v4[10] = v13;

  return v4;
}

- (NSString)payloadVisibleName
{
  return self->_payloadVisibleName;
}

- (void)setPayloadVisibleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadUserIdentityAssetReference
{
  return self->_payloadUserIdentityAssetReference;
}

- (void)setPayloadUserIdentityAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (RMModelAccountMailDeclaration_IncomingServer)payloadIncomingServer
{
  return self->_payloadIncomingServer;
}

- (void)setPayloadIncomingServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (RMModelAccountMailDeclaration_OutgoingServer)payloadOutgoingServer
{
  return self->_payloadOutgoingServer;
}

- (void)setPayloadOutgoingServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (RMModelAccountMailDeclaration_SMIME)payloadSMIME
{
  return self->_payloadSMIME;
}

- (void)setPayloadSMIME:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSMIME, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingServer, 0);
  objc_storeStrong((id *)&self->_payloadIncomingServer, 0);
  objc_storeStrong((id *)&self->_payloadUserIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
}

uint64_t __57__RMModelAccountMailDeclaration_SMIME_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __57__RMModelAccountMailDeclaration_SMIME_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

@end
