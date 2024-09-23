@implementation RMModelNetworkEAPDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.network.eap");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("EAPUUID");
  v6[1] = CFSTR("AcceptEAPTypes");
  v6[2] = CFSTR("UseOneTimePassword");
  v6[3] = CFSTR("UserPasswordAssetReference");
  v6[4] = CFSTR("PrivateAccessToken");
  v6[5] = CFSTR("EAPFAST");
  v6[6] = CFSTR("TLS");
  v6[7] = CFSTR("OuterIdentity");
  v6[8] = CFSTR("TTLSInnerAuthentication");
  v6[9] = CFSTR("SystemModeCredentialsSource");
  v6[10] = CFSTR("ExtensibleSSOProvider");
  v6[11] = CFSTR("EAPSIMAKA");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625D28);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_8 != -1)
    dispatch_once(&assetReferences_onceToken_8, &__block_literal_global_13);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_8, self);
}

void __47__RMModelNetworkEAPDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  RMModelConfigurationSchemaAssetReference *v1;
  RMModelConfigurationSchemaAssetReference *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251625D40, CFSTR("$.payloadUserPasswordAssetReference"));
  v1 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251625D58, CFSTR("$.payloadTLS.payloadIdentityAssetReference"), v0);
  v5[1] = v1;
  v2 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251625D70, CFSTR("$.payloadTLS.payloadAnchorCertificateAssetReferences.*"));
  v5[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)assetReferences_assetPaths_8;
  assetReferences_assetPaths_8 = v3;

}

+ (id)buildWithIdentifier:(id)a3 EAPUUID:(id)a4 acceptEAPTypes:(id)a5 useOneTimePassword:(id)a6 userPasswordAssetReference:(id)a7 privateAccessToken:(id)a8 EAPFAST:(id)a9 TLS:(id)a10 outerIdentity:(id)a11 ttlsInnerAuthentication:(id)a12 systemModeCredentialsSource:(id)a13 extensibleSSOProvider:(id)a14 EAPSIMAKA:(id)a15
{
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  const __CFString *v33;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v43 = a3;
  v42 = a15;
  v41 = a14;
  v40 = a13;
  v17 = (__CFString *)a12;
  v39 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = v43;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setDeclarationType:", CFSTR("com.apple.configuration.network.eap"));
  if (v43)
  {
    objc_msgSend(v26, "setDeclarationIdentifier:", v43);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v38 = v20;
    v28 = v17;
    v29 = v19;
    v30 = v18;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDeclarationIdentifier:", v31);

    v18 = v30;
    v19 = v29;
    v17 = v28;
    v20 = v38;

    v25 = 0;
  }
  objc_msgSend(v26, "setPayloadEAPUUID:", v24, a6);

  objc_msgSend(v26, "setPayloadAcceptEAPTypes:", v23);
  if (v22)
    v32 = v22;
  else
    v32 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v26, "setPayloadUseOneTimePassword:", v32);

  objc_msgSend(v26, "setPayloadUserPasswordAssetReference:", v21);
  objc_msgSend(v26, "setPayloadPrivateAccessToken:", v20);

  objc_msgSend(v26, "setPayloadEAPFAST:", v19);
  objc_msgSend(v26, "setPayloadTLS:", v18);

  objc_msgSend(v26, "setPayloadOuterIdentity:", v39);
  if (v17)
    v33 = v17;
  else
    v33 = CFSTR("MSCHAPv2");
  objc_msgSend(v26, "setPayloadTTLSInnerAuthentication:", v33);

  objc_msgSend(v26, "setPayloadSystemModeCredentialsSource:", v40);
  objc_msgSend(v26, "setPayloadExtensibleSSOProvider:", v41);

  objc_msgSend(v26, "setPayloadEAPSIMAKA:", v42);
  objc_msgSend(v26, "updateServerToken");

  return v26;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 EAPUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.network.eap"));
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
  objc_msgSend(v7, "setPayloadEAPUUID:", v6);

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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[6];
  _QWORD v35[8];

  v35[6] = *MEMORY[0x24BDAC8D0];
  v34[0] = &unk_251629C40;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625D88);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625DA0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625DB8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v24;
  v34[1] = &unk_251629C58;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625DD0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625DE8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625E00);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v20;
  v34[2] = &unk_251629C70;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625E18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625E30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625E48);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v16;
  v34[3] = &unk_251629C88;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625E60);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625E78);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625E90);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v3;
  v34[4] = &unk_251629CA0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625EA8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625EC0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625ED8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v7;
  v34[5] = &unk_251629CB8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625EF0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625F08);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625F20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
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

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelNetworkEAPDeclaration allowedPayloadKeys](RMModelNetworkEAPDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("EAPUUID"), CFSTR("payloadEAPUUID"), 1, 0, a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v8, CFSTR("AcceptEAPTypes"), CFSTR("payloadAcceptEAPTypes"), &__block_literal_global_117, 0, 0, a5))
    {
      v14 = 0;
      if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("UseOneTimePassword"), CFSTR("payloadUseOneTimePassword"), 0, MEMORY[0x24BDBD1C0], a5))
      {
        v14 = 0;
        if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("UserPasswordAssetReference"), CFSTR("payloadUserPasswordAssetReference"), 0, 0, a5))
        {
          LOWORD(v16) = a4;
          v14 = 0;
          if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("PrivateAccessToken"), CFSTR("payloadPrivateAccessToken"), objc_opt_class(), 0, 0, v16, a5))
          {
            LOWORD(v17) = a4;
            v14 = 0;
            if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("EAPFAST"), CFSTR("payloadEAPFAST"), objc_opt_class(), 0, 0, v17, a5))
            {
              LOWORD(v18) = a4;
              v14 = 0;
              if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("TLS"), CFSTR("payloadTLS"), objc_opt_class(), 0, 0, v18, a5))
              {
                v14 = 0;
                if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("OuterIdentity"), CFSTR("payloadOuterIdentity"), 0, 0, a5))
                {
                  v14 = 0;
                  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("TTLSInnerAuthentication"), CFSTR("payloadTTLSInnerAuthentication"), 0, CFSTR("MSCHAPv2"), a5))
                  {
                    v14 = 0;
                    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("SystemModeCredentialsSource"), CFSTR("payloadSystemModeCredentialsSource"), 0, 0, a5))
                    {
                      v14 = 0;
                      if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ExtensibleSSOProvider"), CFSTR("payloadExtensibleSSOProvider"), 0, 0, a5))
                      {
                        LOWORD(v19) = a4;
                        v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("EAPSIMAKA"), CFSTR("payloadEAPSIMAKA"), objc_opt_class(), 0, 0, v19, a5);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __82__RMModelNetworkEAPDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  signed __int16 v22;
  _QWORD v23[4];
  signed __int16 v24;
  _QWORD v25[4];
  signed __int16 v26;
  _QWORD v27[4];
  signed __int16 v28;

  v5 = (void *)objc_opt_new();
  -[RMModelNetworkEAPDeclaration payloadEAPUUID](self, "payloadEAPUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("EAPUUID"), v6, 1, 0);

  -[RMModelNetworkEAPDeclaration payloadAcceptEAPTypes](self, "payloadAcceptEAPTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("AcceptEAPTypes"), v7, &__block_literal_global_145, 0, 0);

  -[RMModelNetworkEAPDeclaration payloadUseOneTimePassword](self, "payloadUseOneTimePassword");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("UseOneTimePassword"), v8, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelNetworkEAPDeclaration payloadUserPasswordAssetReference](self, "payloadUserPasswordAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("UserPasswordAssetReference"), v9, 0, 0);

  -[RMModelNetworkEAPDeclaration payloadPrivateAccessToken](self, "payloadPrivateAccessToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_2;
  v27[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v28 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("PrivateAccessToken"), v10, v27, 0, 0);

  -[RMModelNetworkEAPDeclaration payloadEAPFAST](self, "payloadEAPFAST");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_3;
  v25[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v26 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("EAPFAST"), v12, v25, 0, 0);

  -[RMModelNetworkEAPDeclaration payloadTLS](self, "payloadTLS");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_4;
  v23[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v24 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("TLS"), v13, v23, 0, 0);

  -[RMModelNetworkEAPDeclaration payloadOuterIdentity](self, "payloadOuterIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("OuterIdentity"), v14, 0, 0);

  -[RMModelNetworkEAPDeclaration payloadTTLSInnerAuthentication](self, "payloadTTLSInnerAuthentication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("TTLSInnerAuthentication"), v15, 0, CFSTR("MSCHAPv2"));

  -[RMModelNetworkEAPDeclaration payloadSystemModeCredentialsSource](self, "payloadSystemModeCredentialsSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("SystemModeCredentialsSource"), v16, 0, 0);

  -[RMModelNetworkEAPDeclaration payloadExtensibleSSOProvider](self, "payloadExtensibleSSOProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ExtensibleSSOProvider"), v17, 0, 0);

  -[RMModelNetworkEAPDeclaration payloadEAPSIMAKA](self, "payloadEAPSIMAKA");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_5;
  v21[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v22 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("EAPSIMAKA"), v18, v21, 0, 0);

  v19 = (void *)objc_msgSend(v5, "copy");
  return v19;
}

id __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_5(uint64_t a1, void *a2)
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
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)RMModelNetworkEAPDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v30, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadEAPUUID, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSArray copy](self->_payloadAcceptEAPTypes, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSNumber copy](self->_payloadUseOneTimePassword, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSString copy](self->_payloadUserPasswordAssetReference, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[RMModelNetworkEAPDeclaration_PrivateAccessToken copy](self->_payloadPrivateAccessToken, "copy");
  v14 = (void *)v4[10];
  v4[10] = v13;

  v15 = -[RMModelNetworkEAPDeclaration_EAPFAST copy](self->_payloadEAPFAST, "copy");
  v16 = (void *)v4[11];
  v4[11] = v15;

  v17 = -[RMModelNetworkEAPDeclaration_TLS copy](self->_payloadTLS, "copy");
  v18 = (void *)v4[12];
  v4[12] = v17;

  v19 = -[NSString copy](self->_payloadOuterIdentity, "copy");
  v20 = (void *)v4[13];
  v4[13] = v19;

  v21 = -[NSString copy](self->_payloadTTLSInnerAuthentication, "copy");
  v22 = (void *)v4[14];
  v4[14] = v21;

  v23 = -[NSString copy](self->_payloadSystemModeCredentialsSource, "copy");
  v24 = (void *)v4[15];
  v4[15] = v23;

  v25 = -[NSString copy](self->_payloadExtensibleSSOProvider, "copy");
  v26 = (void *)v4[16];
  v4[16] = v25;

  v27 = -[RMModelNetworkEAPDeclaration_EAPSIMAKA copy](self->_payloadEAPSIMAKA, "copy");
  v28 = (void *)v4[17];
  v4[17] = v27;

  return v4;
}

- (NSString)payloadEAPUUID
{
  return self->_payloadEAPUUID;
}

- (void)setPayloadEAPUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)payloadAcceptEAPTypes
{
  return self->_payloadAcceptEAPTypes;
}

- (void)setPayloadAcceptEAPTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadUseOneTimePassword
{
  return self->_payloadUseOneTimePassword;
}

- (void)setPayloadUseOneTimePassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)payloadUserPasswordAssetReference
{
  return self->_payloadUserPasswordAssetReference;
}

- (void)setPayloadUserPasswordAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (RMModelNetworkEAPDeclaration_PrivateAccessToken)payloadPrivateAccessToken
{
  return self->_payloadPrivateAccessToken;
}

- (void)setPayloadPrivateAccessToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (RMModelNetworkEAPDeclaration_EAPFAST)payloadEAPFAST
{
  return self->_payloadEAPFAST;
}

- (void)setPayloadEAPFAST:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (RMModelNetworkEAPDeclaration_TLS)payloadTLS
{
  return self->_payloadTLS;
}

- (void)setPayloadTLS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadOuterIdentity
{
  return self->_payloadOuterIdentity;
}

- (void)setPayloadOuterIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadTTLSInnerAuthentication
{
  return self->_payloadTTLSInnerAuthentication;
}

- (void)setPayloadTTLSInnerAuthentication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)payloadSystemModeCredentialsSource
{
  return self->_payloadSystemModeCredentialsSource;
}

- (void)setPayloadSystemModeCredentialsSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)payloadExtensibleSSOProvider
{
  return self->_payloadExtensibleSSOProvider;
}

- (void)setPayloadExtensibleSSOProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (RMModelNetworkEAPDeclaration_EAPSIMAKA)payloadEAPSIMAKA
{
  return self->_payloadEAPSIMAKA;
}

- (void)setPayloadEAPSIMAKA:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEAPSIMAKA, 0);
  objc_storeStrong((id *)&self->_payloadExtensibleSSOProvider, 0);
  objc_storeStrong((id *)&self->_payloadSystemModeCredentialsSource, 0);
  objc_storeStrong((id *)&self->_payloadTTLSInnerAuthentication, 0);
  objc_storeStrong((id *)&self->_payloadOuterIdentity, 0);
  objc_storeStrong((id *)&self->_payloadTLS, 0);
  objc_storeStrong((id *)&self->_payloadEAPFAST, 0);
  objc_storeStrong((id *)&self->_payloadPrivateAccessToken, 0);
  objc_storeStrong((id *)&self->_payloadUserPasswordAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadUseOneTimePassword, 0);
  objc_storeStrong((id *)&self->_payloadAcceptEAPTypes, 0);
  objc_storeStrong((id *)&self->_payloadEAPUUID, 0);
}

uint64_t __79__RMModelNetworkEAPDeclaration_TLS_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __79__RMModelNetworkEAPDeclaration_TLS_loadFromDictionary_serializationType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __54__RMModelNetworkEAPDeclaration_TLS_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __54__RMModelNetworkEAPDeclaration_TLS_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __60__RMModelNetworkEAPDeclaration_EAPSIMAKA_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

@end
