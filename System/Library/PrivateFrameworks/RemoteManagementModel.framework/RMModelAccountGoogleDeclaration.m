@implementation RMModelAccountGoogleDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.account.google");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("VisibleName");
  v6[1] = CFSTR("UserIdentityAssetReference");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516245D0);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_2 != -1)
    dispatch_once(&assetReferences_onceToken_2, &__block_literal_global_2);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_2, self);
}

void __50__RMModelAccountGoogleDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_2516245E8, CFSTR("$.payloadUserIdentityAssetReference"));
  v3[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)assetReferences_assetPaths_2;
  assetReferences_assetPaths_2 = v1;

}

+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 userIdentityAssetReference:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.account.google"));
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
  objc_msgSend(v10, "setPayloadVisibleName:", v9);

  objc_msgSend(v10, "setPayloadUserIdentityAssetReference:", v8);
  objc_msgSend(v10, "updateServerToken");

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 userIdentityAssetReference:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.account.google"));
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
  objc_msgSend(v7, "setPayloadUserIdentityAssetReference:", v6);

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
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[6];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20[0] = &unk_2516290A0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624600);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624618);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v20[1] = &unk_2516290E8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624630);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624648);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  v20[2] = &unk_2516290B8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624660);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624678);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  v20[3] = &unk_251629100;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624690);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516246A8);
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

  +[RMModelAccountGoogleDeclaration allowedPayloadKeys](RMModelAccountGoogleDeclaration, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("VisibleName"), CFSTR("payloadVisibleName"), 0, 0, a5))
  {
    v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("UserIdentityAssetReference"), CFSTR("payloadUserIdentityAssetReference"), 1, 0, a5);
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[RMModelAccountGoogleDeclaration payloadVisibleName](self, "payloadVisibleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("VisibleName"), v5, 0, 0);

  -[RMModelAccountGoogleDeclaration payloadUserIdentityAssetReference](self, "payloadUserIdentityAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("UserIdentityAssetReference"), v6, 1, 0);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
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
  v10.super_class = (Class)RMModelAccountGoogleDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadVisibleName, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadUserIdentityAssetReference, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUserIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
}

@end
