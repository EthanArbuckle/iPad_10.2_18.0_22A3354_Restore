@implementation RMModelManagementTestDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.management.test");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Echo");
  v6[1] = CFSTR("EchoDataAssetReference");
  v6[2] = CFSTR("ReturnStatus");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625BD8);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_7 != -1)
    dispatch_once(&assetReferences_onceToken_7, &__block_literal_global_12);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_7, self);
}

void __51__RMModelManagementTestDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251625BF0, CFSTR("$.payloadEchoDataAssetReference"));
  v3[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)assetReferences_assetPaths_7;
  assetReferences_assetPaths_7 = v1;

}

+ (id)buildWithIdentifier:(id)a3 echo:(id)a4 echoDataAssetReference:(id)a5 returnStatus:(id)a6
{
  id v9;
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  v9 = a3;
  v10 = (__CFString *)a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.management.test"));
  if (v9)
  {
    objc_msgSend(v13, "setDeclarationIdentifier:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDeclarationIdentifier:", v15);

  }
  objc_msgSend(v13, "setPayloadEcho:", v12);

  objc_msgSend(v13, "setPayloadEchoDataAssetReference:", v11);
  if (v10)
    v16 = v10;
  else
    v16 = CFSTR("Installed");
  objc_msgSend(v13, "setPayloadReturnStatus:", v16);

  objc_msgSend(v13, "updateServerToken");
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 echo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.management.test"));
  if (v5)
  {
    objc_msgSend(v7, "setDeclarationIdentifier:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeclarationIdentifier:", v9);

  }
  objc_msgSend(v7, "setPayloadEcho:", v6);

  objc_msgSend(v7, "updateServerToken");
  return v7;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[6];
  _QWORD v29[8];

  v29[6] = *MEMORY[0x24BDAC8D0];
  v28[0] = &unk_251629BB0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625C08);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625C20);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v28[1] = &unk_251629BC8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625C38);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625C50);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  v28[2] = &unk_251629BE0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625C68);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625C80);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  v28[3] = &unk_251629BF8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625C98);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625CB0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v4;
  v28[4] = &unk_251629C10;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625CC8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625CE0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v7;
  v28[5] = &unk_251629C28;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625CF8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625D10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
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

  +[RMModelManagementTestDeclaration allowedPayloadKeys](RMModelManagementTestDeclaration, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Echo"), CFSTR("payloadEcho"), 1, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("EchoDataAssetReference"), CFSTR("payloadEchoDataAssetReference"), 0, 0, a5))
    {
      v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ReturnStatus"), CFSTR("payloadReturnStatus"), 0, CFSTR("Installed"), a5);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[RMModelManagementTestDeclaration payloadEcho](self, "payloadEcho");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Echo"), v5, 1, 0);

  -[RMModelManagementTestDeclaration payloadEchoDataAssetReference](self, "payloadEchoDataAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("EchoDataAssetReference"), v6, 0, 0);

  -[RMModelManagementTestDeclaration payloadReturnStatus](self, "payloadReturnStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ReturnStatus"), v7, 0, CFSTR("Installed"));

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
  v12.super_class = (Class)RMModelManagementTestDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadEcho, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadEchoDataAssetReference, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_payloadReturnStatus, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)payloadEcho
{
  return self->_payloadEcho;
}

- (void)setPayloadEcho:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadEchoDataAssetReference
{
  return self->_payloadEchoDataAssetReference;
}

- (void)setPayloadEchoDataAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadReturnStatus
{
  return self->_payloadReturnStatus;
}

- (void)setPayloadReturnStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadReturnStatus, 0);
  objc_storeStrong((id *)&self->_payloadEchoDataAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadEcho, 0);
}

@end
