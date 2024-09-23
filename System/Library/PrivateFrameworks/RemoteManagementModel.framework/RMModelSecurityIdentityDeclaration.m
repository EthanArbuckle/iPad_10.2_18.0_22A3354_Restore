@implementation RMModelSecurityIdentityDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.security.identity");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("CredentialAssetReference");
  v6[1] = CFSTR("AllowAllAppsAccess");
  v6[2] = CFSTR("KeyIsExtractable");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626418);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_12 != -1)
    dispatch_once(&assetReferences_onceToken_12, &__block_literal_global_19);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_12, self);
}

void __53__RMModelSecurityIdentityDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251626430, CFSTR("$.payloadCredentialAssetReference"));
  v3[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)assetReferences_assetPaths_12;
  assetReferences_assetPaths_12 = v1;

}

+ (id)buildWithIdentifier:(id)a3 credentialAssetReference:(id)a4 allowAllAppsAccess:(id)a5 keyIsExtractable:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.security.identity"));
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
  objc_msgSend(v13, "setPayloadCredentialAssetReference:", v12);

  if (v11)
    v16 = v11;
  else
    v16 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v13, "setPayloadAllowAllAppsAccess:", v16);

  if (v10)
    v17 = v10;
  else
    v17 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v13, "setPayloadKeyIsExtractable:", v17);

  objc_msgSend(v13, "updateServerToken");
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 credentialAssetReference:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.security.identity"));
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
  objc_msgSend(v7, "setPayloadCredentialAssetReference:", v6);

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
  v28[0] = &unk_25162A078;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626448);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626460);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v28[1] = &unk_25162A090;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626478);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626490);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  v28[2] = &unk_25162A0A8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516264A8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516264C0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  v28[3] = &unk_25162A0C0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516264D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516264F0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v4;
  v28[4] = &unk_25162A0D8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626508);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626520);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v7;
  v28[5] = &unk_25162A0F0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626538);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626550);
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

  +[RMModelSecurityIdentityDeclaration allowedPayloadKeys](RMModelSecurityIdentityDeclaration, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("CredentialAssetReference"), CFSTR("payloadCredentialAssetReference"), 1, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("AllowAllAppsAccess"), CFSTR("payloadAllowAllAppsAccess"), 0, MEMORY[0x24BDBD1C0], a5))
    {
      v13 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("KeyIsExtractable"), CFSTR("payloadKeyIsExtractable"), 0, MEMORY[0x24BDBD1C8], a5);
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
  -[RMModelSecurityIdentityDeclaration payloadCredentialAssetReference](self, "payloadCredentialAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("CredentialAssetReference"), v5, 1, 0);

  -[RMModelSecurityIdentityDeclaration payloadAllowAllAppsAccess](self, "payloadAllowAllAppsAccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("AllowAllAppsAccess"), v6, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelSecurityIdentityDeclaration payloadKeyIsExtractable](self, "payloadKeyIsExtractable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("KeyIsExtractable"), v7, 0, MEMORY[0x24BDBD1C8]);

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
  v12.super_class = (Class)RMModelSecurityIdentityDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadCredentialAssetReference, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowAllAppsAccess, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSNumber copy](self->_payloadKeyIsExtractable, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)payloadCredentialAssetReference
{
  return self->_payloadCredentialAssetReference;
}

- (void)setPayloadCredentialAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadAllowAllAppsAccess
{
  return self->_payloadAllowAllAppsAccess;
}

- (void)setPayloadAllowAllAppsAccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadKeyIsExtractable
{
  return self->_payloadKeyIsExtractable;
}

- (void)setPayloadKeyIsExtractable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadKeyIsExtractable, 0);
  objc_storeStrong((id *)&self->_payloadAllowAllAppsAccess, 0);
  objc_storeStrong((id *)&self->_payloadCredentialAssetReference, 0);
}

@end
