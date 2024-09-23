@implementation RMModelAppManagedDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.app.managed");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[11];

  v6[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("AppStoreID");
  v6[1] = CFSTR("BundleID");
  v6[2] = CFSTR("ManifestURL");
  v6[3] = CFSTR("InstallBehavior");
  v6[4] = CFSTR("IncludeInBackup");
  v6[5] = CFSTR("Attributes");
  v6[6] = CFSTR("AppConfigAssetReference");
  v6[7] = CFSTR("PasswordAppConfigs");
  v6[8] = CFSTR("IdentityAppConfigs");
  v6[9] = CFSTR("CertificateAppConfigs");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624B10);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_6 != -1)
    dispatch_once(&assetReferences_onceToken_6, &__block_literal_global_8);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_6, self);
}

void __47__RMModelAppManagedDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  RMModelConfigurationSchemaAssetReference *v1;
  RMModelConfigurationSchemaAssetReference *v2;
  RMModelConfigurationSchemaAssetReference *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251624B28, CFSTR("$.payloadAppConfigAssetReference"));
  v6[0] = v0;
  v1 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251624B40, CFSTR("$.payloadPasswordAppConfigs.*.payloadAssetReference"));
  v6[1] = v1;
  v2 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251624B58, CFSTR("$.payloadIdentityAppConfigs.*.payloadAssetReference"));
  v6[2] = v2;
  v3 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251624B70, CFSTR("$.payloadCertificateAppConfigs.*.payloadAssetReference"));
  v6[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)assetReferences_assetPaths_6;
  assetReferences_assetPaths_6 = v4;

}

+ (id)buildWithIdentifier:(id)a3 appStoreID:(id)a4 bundleID:(id)a5 manifestURL:(id)a6 installBehavior:(id)a7 includeInBackup:(id)a8 attributes:(id)a9 appConfigAssetReference:(id)a10 passwordAppConfigs:(id)a11 identityAppConfigs:(id)a12 certificateAppConfigs:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v30;
  id v32;
  id v33;
  id v34;

  v30 = a3;
  v34 = a13;
  v33 = a12;
  v32 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = v30;
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setDeclarationType:", CFSTR("com.apple.configuration.app.managed"));
  if (v30)
  {
    objc_msgSend(v25, "setDeclarationIdentifier:", v30);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDeclarationIdentifier:", v27);

    v24 = 0;
  }
  objc_msgSend(v25, "setPayloadAppStoreID:", v23);

  objc_msgSend(v25, "setPayloadBundleID:", v22);
  objc_msgSend(v25, "setPayloadManifestURL:", v21);

  objc_msgSend(v25, "setPayloadInstallBehavior:", v20);
  if (v19)
    v28 = v19;
  else
    v28 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v25, "setPayloadIncludeInBackup:", v28);

  objc_msgSend(v25, "setPayloadAttributes:", v18);
  objc_msgSend(v25, "setPayloadAppConfigAssetReference:", v17);

  objc_msgSend(v25, "setPayloadPasswordAppConfigs:", v32);
  objc_msgSend(v25, "setPayloadIdentityAppConfigs:", v33);

  objc_msgSend(v25, "setPayloadCertificateAppConfigs:", v34);
  objc_msgSend(v25, "updateServerToken");

  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.app.managed"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerToken");

  return v4;
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
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v17[0] = &unk_251629310;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624B88);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624BA0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624BB8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v17[1] = &unk_251629328;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624BD0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624BE8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  v17[2] = &unk_251629358;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624C00);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624C18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
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
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelAppManagedDeclaration allowedPayloadKeys](RMModelAppManagedDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  v14 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("AppStoreID"), CFSTR("payloadAppStoreID"), 0, 0, a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("BundleID"), CFSTR("payloadBundleID"), 0, 0, a5))
    {
      v14 = 0;
      if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ManifestURL"), CFSTR("payloadManifestURL"), 0, 0, a5))
      {
        LOWORD(v16) = a4;
        v14 = 0;
        if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("InstallBehavior"), CFSTR("payloadInstallBehavior"), objc_opt_class(), 0, 0, v16, a5))
        {
          v14 = 0;
          if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("IncludeInBackup"), CFSTR("payloadIncludeInBackup"), 0, MEMORY[0x24BDBD1C8], a5))
          {
            LOWORD(v17) = a4;
            v14 = 0;
            if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Attributes"), CFSTR("payloadAttributes"), objc_opt_class(), 0, 0, v17, a5))
            {
              v14 = 0;
              if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("AppConfigAssetReference"), CFSTR("payloadAppConfigAssetReference"), 0, 0, a5))
              {
                LOWORD(v18) = a4;
                v14 = 0;
                if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("PasswordAppConfigs"), CFSTR("payloadPasswordAppConfigs"), objc_opt_class(), 0, 0, 0, v18, a5))
                {
                  LOWORD(v19) = a4;
                  v14 = 0;
                  if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("IdentityAppConfigs"), CFSTR("payloadIdentityAppConfigs"), objc_opt_class(), 0, 0, 0, v19, a5))
                  {
                    LOWORD(v20) = a4;
                    v14 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("CertificateAppConfigs"), CFSTR("payloadCertificateAppConfigs"), objc_opt_class(), 0, 0, 0, v20, a5);
                  }
                }
              }
            }
          }
        }
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
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  signed __int16 v20;
  _QWORD v21[4];
  signed __int16 v22;
  _QWORD v23[4];
  signed __int16 v24;
  _QWORD v25[4];
  signed __int16 v26;
  _QWORD v27[4];
  signed __int16 v28;

  v5 = (void *)objc_opt_new();
  -[RMModelAppManagedDeclaration payloadAppStoreID](self, "payloadAppStoreID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("AppStoreID"), v6, 0, 0);

  -[RMModelAppManagedDeclaration payloadBundleID](self, "payloadBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("BundleID"), v7, 0, 0);

  -[RMModelAppManagedDeclaration payloadManifestURL](self, "payloadManifestURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ManifestURL"), v8, 0, 0);

  -[RMModelAppManagedDeclaration payloadInstallBehavior](self, "payloadInstallBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke;
  v27[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v28 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("InstallBehavior"), v9, v27, 0, 0);

  -[RMModelAppManagedDeclaration payloadIncludeInBackup](self, "payloadIncludeInBackup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("IncludeInBackup"), v11, 0, MEMORY[0x24BDBD1C8]);

  -[RMModelAppManagedDeclaration payloadAttributes](self, "payloadAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_2;
  v25[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v26 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Attributes"), v12, v25, 0, 0);

  -[RMModelAppManagedDeclaration payloadAppConfigAssetReference](self, "payloadAppConfigAssetReference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("AppConfigAssetReference"), v13, 0, 0);

  -[RMModelAppManagedDeclaration payloadPasswordAppConfigs](self, "payloadPasswordAppConfigs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_3;
  v23[3] = &__block_descriptor_34_e72___NSDictionary_16__0__RMModelAppManagedDeclaration_AppCredentialConfig_8l;
  v24 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("PasswordAppConfigs"), v14, v23, 0, 0);

  -[RMModelAppManagedDeclaration payloadIdentityAppConfigs](self, "payloadIdentityAppConfigs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_4;
  v21[3] = &__block_descriptor_34_e72___NSDictionary_16__0__RMModelAppManagedDeclaration_AppCredentialConfig_8l;
  v22 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("IdentityAppConfigs"), v15, v21, 0, 0);

  -[RMModelAppManagedDeclaration payloadCertificateAppConfigs](self, "payloadCertificateAppConfigs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_5;
  v19[3] = &__block_descriptor_34_e72___NSDictionary_16__0__RMModelAppManagedDeclaration_AppCredentialConfig_8l;
  v20 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("CertificateAppConfigs"), v16, v19, 0, 0);

  v17 = (void *)objc_msgSend(v5, "copy");
  return v17;
}

uint64_t __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_5(uint64_t a1, void *a2)
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)RMModelAppManagedDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v26, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadAppStoreID, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadBundleID, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_payloadManifestURL, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[RMModelAppManagedDeclaration_InstallBehavior copy](self->_payloadInstallBehavior, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[NSNumber copy](self->_payloadIncludeInBackup, "copy");
  v14 = (void *)v4[10];
  v4[10] = v13;

  v15 = -[RMModelAppManagedDeclaration_Attributes copy](self->_payloadAttributes, "copy");
  v16 = (void *)v4[11];
  v4[11] = v15;

  v17 = -[NSString copy](self->_payloadAppConfigAssetReference, "copy");
  v18 = (void *)v4[12];
  v4[12] = v17;

  v19 = -[NSArray copy](self->_payloadPasswordAppConfigs, "copy");
  v20 = (void *)v4[13];
  v4[13] = v19;

  v21 = -[NSArray copy](self->_payloadIdentityAppConfigs, "copy");
  v22 = (void *)v4[14];
  v4[14] = v21;

  v23 = -[NSArray copy](self->_payloadCertificateAppConfigs, "copy");
  v24 = (void *)v4[15];
  v4[15] = v23;

  return v4;
}

- (NSString)payloadAppStoreID
{
  return self->_payloadAppStoreID;
}

- (void)setPayloadAppStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadBundleID
{
  return self->_payloadBundleID;
}

- (void)setPayloadBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadManifestURL
{
  return self->_payloadManifestURL;
}

- (void)setPayloadManifestURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (RMModelAppManagedDeclaration_InstallBehavior)payloadInstallBehavior
{
  return self->_payloadInstallBehavior;
}

- (void)setPayloadInstallBehavior:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadIncludeInBackup
{
  return self->_payloadIncludeInBackup;
}

- (void)setPayloadIncludeInBackup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (RMModelAppManagedDeclaration_Attributes)payloadAttributes
{
  return self->_payloadAttributes;
}

- (void)setPayloadAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadAppConfigAssetReference
{
  return self->_payloadAppConfigAssetReference;
}

- (void)setPayloadAppConfigAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)payloadPasswordAppConfigs
{
  return self->_payloadPasswordAppConfigs;
}

- (void)setPayloadPasswordAppConfigs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)payloadIdentityAppConfigs
{
  return self->_payloadIdentityAppConfigs;
}

- (void)setPayloadIdentityAppConfigs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)payloadCertificateAppConfigs
{
  return self->_payloadCertificateAppConfigs;
}

- (void)setPayloadCertificateAppConfigs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCertificateAppConfigs, 0);
  objc_storeStrong((id *)&self->_payloadIdentityAppConfigs, 0);
  objc_storeStrong((id *)&self->_payloadPasswordAppConfigs, 0);
  objc_storeStrong((id *)&self->_payloadAppConfigAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadAttributes, 0);
  objc_storeStrong((id *)&self->_payloadIncludeInBackup, 0);
  objc_storeStrong((id *)&self->_payloadInstallBehavior, 0);
  objc_storeStrong((id *)&self->_payloadManifestURL, 0);
  objc_storeStrong((id *)&self->_payloadBundleID, 0);
  objc_storeStrong((id *)&self->_payloadAppStoreID, 0);
}

uint64_t __66__RMModelAppManagedDeclaration_InstallBehavior_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __86__RMModelAppManagedDeclaration_Attributes_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __61__RMModelAppManagedDeclaration_Attributes_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

@end
