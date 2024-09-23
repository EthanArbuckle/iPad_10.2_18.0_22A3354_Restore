@implementation RMModelNetworkWiFiDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.network.wifi");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[15];

  v6[14] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("AutoJoin");
  v6[1] = CFSTR("SSID");
  v6[2] = CFSTR("IsHiddenNetwork");
  v6[3] = CFSTR("EncryptionType");
  v6[4] = CFSTR("PasswordAssetReference");
  v6[5] = CFSTR("CertificateIdentityAssetReference");
  v6[6] = CFSTR("HotSpot");
  v6[7] = CFSTR("CaptiveBypass");
  v6[8] = CFSTR("QoSMarkingPolicy");
  v6[9] = CFSTR("SetupModes");
  v6[10] = CFSTR("TLSCertificateRequired");
  v6[11] = CFSTR("Proxy");
  v6[12] = CFSTR("DisableAssociationMACRandomization");
  v6[13] = CFSTR("EAPClientConfigurationUUID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625F38);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_9 != -1)
    dispatch_once(&assetReferences_onceToken_9, &__block_literal_global_14);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_9, self);
}

void __48__RMModelNetworkWiFiDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  RMModelConfigurationSchemaAssetReference *v1;
  RMModelConfigurationSchemaAssetReference *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251625F50, CFSTR("$.payloadPasswordAssetReference"));
  v1 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251625F68, CFSTR("$.payloadCertificateIdentityAssetReference"), v0);
  v5[1] = v1;
  v2 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251625F80, CFSTR("$.payloadProxy.payloadProxyAuthenticationCredentialsAssetReference"));
  v5[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)assetReferences_assetPaths_9;
  assetReferences_assetPaths_9 = v3;

}

+ (id)buildWithIdentifier:(id)a3 autoJoin:(id)a4 SSID:(id)a5 isHiddenNetwork:(id)a6 encryptionType:(id)a7 passwordAssetReference:(id)a8 certificateIdentityAssetReference:(id)a9 hotSpot:(id)a10 captiveBypass:(id)a11 qoSMarkingPolicy:(id)a12 setupModes:(id)a13 tlsCertificateRequired:(id)a14 proxy:(id)a15 disableAssociationMACRandomization:(id)a16 eapClientConfigurationUUID:(id)a17
{
  id v17;
  id v18;
  id v19;
  id v20;
  __CFString *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  const __CFString *v31;
  id v32;
  id v33;
  id v34;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v17 = a3;
  v47 = a17;
  v46 = a16;
  v45 = a15;
  v44 = a14;
  v43 = a13;
  v42 = a12;
  v18 = a11;
  v41 = a10;
  v19 = a9;
  v20 = a8;
  v21 = (__CFString *)a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setDeclarationType:", CFSTR("com.apple.configuration.network.wifi"));
  if (v17)
  {
    objc_msgSend(v25, "setDeclarationIdentifier:", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDeclarationIdentifier:", v27);

    v17 = 0;
  }
  if (v24)
    v28 = v24;
  else
    v28 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v25, "setPayloadAutoJoin:", v28, a8);

  objc_msgSend(v25, "setPayloadSSID:", v23);
  v29 = (void *)MEMORY[0x24BDBD1C0];
  if (v22)
    v30 = v22;
  else
    v30 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v25, "setPayloadIsHiddenNetwork:", v30);

  if (v21)
    v31 = v21;
  else
    v31 = CFSTR("Any");
  objc_msgSend(v25, "setPayloadEncryptionType:", v31);

  objc_msgSend(v25, "setPayloadPasswordAssetReference:", v20);
  objc_msgSend(v25, "setPayloadCertificateIdentityAssetReference:", v19);

  objc_msgSend(v25, "setPayloadHotSpot:", v41);
  if (v18)
    v32 = v18;
  else
    v32 = v29;
  objc_msgSend(v25, "setPayloadCaptiveBypass:", v32);

  objc_msgSend(v25, "setPayloadQoSMarkingPolicy:", v42);
  objc_msgSend(v25, "setPayloadSetupModes:", v43);

  if (v44)
    v33 = v44;
  else
    v33 = v29;
  objc_msgSend(v25, "setPayloadTLSCertificateRequired:", v33);

  objc_msgSend(v25, "setPayloadProxy:", v45);
  if (v46)
    v34 = v46;
  else
    v34 = v29;
  objc_msgSend(v25, "setPayloadDisableAssociationMACRandomization:", v34);

  objc_msgSend(v25, "setPayloadEAPClientConfigurationUUID:", v47);
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
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.network.wifi"));
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
  v34[0] = &unk_251629D00;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625F98);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625FB0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625FC8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v24;
  v34[1] = &unk_251629D18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625FE0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625FF8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626010);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v20;
  v34[2] = &unk_251629D30;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626028);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626040);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626058);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v16;
  v34[3] = &unk_251629D48;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626070);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626088);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516260A0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v3;
  v34[4] = &unk_251629D60;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516260B8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516260D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516260E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v7;
  v34[5] = &unk_251629D78;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626100);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626118);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626130);
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

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelNetworkWiFiDeclaration allowedPayloadKeys](RMModelNetworkWiFiDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  v14 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("AutoJoin"), CFSTR("payloadAutoJoin"), 0, MEMORY[0x24BDBD1C8], a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("SSID"), CFSTR("payloadSSID"), 0, 0, a5))
    {
      v14 = 0;
      if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("IsHiddenNetwork"), CFSTR("payloadIsHiddenNetwork"), 0, MEMORY[0x24BDBD1C0], a5))
      {
        v14 = 0;
        if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("EncryptionType"), CFSTR("payloadEncryptionType"), 0, CFSTR("Any"), a5))
        {
          v14 = 0;
          if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("PasswordAssetReference"), CFSTR("payloadPasswordAssetReference"), 0, 0, a5))
          {
            v14 = 0;
            if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("CertificateIdentityAssetReference"), CFSTR("payloadCertificateIdentityAssetReference"), 0, 0, a5))
            {
              LOWORD(v16) = a4;
              v14 = 0;
              if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("HotSpot"), CFSTR("payloadHotSpot"), objc_opt_class(), 0, 0, v16, a5))
              {
                v14 = 0;
                if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("CaptiveBypass"), CFSTR("payloadCaptiveBypass"), 0, MEMORY[0x24BDBD1C0], a5))
                {
                  LOWORD(v17) = a4;
                  v14 = 0;
                  if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("QoSMarkingPolicy"), CFSTR("payloadQoSMarkingPolicy"), objc_opt_class(), 0, 0, v17, a5))
                  {
                    v14 = 0;
                    if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v8, CFSTR("SetupModes"), CFSTR("payloadSetupModes"), &__block_literal_global_131, 0, 0, a5))
                    {
                      v14 = 0;
                      if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("TLSCertificateRequired"), CFSTR("payloadTLSCertificateRequired"), 0, MEMORY[0x24BDBD1C0], a5))
                      {
                        LOWORD(v18) = a4;
                        v14 = 0;
                        if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Proxy"), CFSTR("payloadProxy"), objc_opt_class(), 0, 0, v18, a5))
                        {
                          v14 = 0;
                          if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("DisableAssociationMACRandomization"), CFSTR("payloadDisableAssociationMACRandomization"), 0, MEMORY[0x24BDBD1C0], a5))
                          {
                            v14 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("EAPClientConfigurationUUID"), CFSTR("payloadEAPClientConfigurationUUID"), 0, 0, a5);
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
    }
  }

  return v14;
}

uint64_t __83__RMModelNetworkWiFiDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  signed __int16 v25;
  _QWORD v26[4];
  signed __int16 v27;
  _QWORD v28[4];
  signed __int16 v29;

  v5 = (void *)objc_opt_new();
  -[RMModelNetworkWiFiDeclaration payloadAutoJoin](self, "payloadAutoJoin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("AutoJoin"), v6, 0, MEMORY[0x24BDBD1C8]);

  -[RMModelNetworkWiFiDeclaration payloadSSID](self, "payloadSSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("SSID"), v7, 0, 0);

  -[RMModelNetworkWiFiDeclaration payloadIsHiddenNetwork](self, "payloadIsHiddenNetwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDBD1C0];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("IsHiddenNetwork"), v8, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelNetworkWiFiDeclaration payloadEncryptionType](self, "payloadEncryptionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("EncryptionType"), v10, 0, CFSTR("Any"));

  -[RMModelNetworkWiFiDeclaration payloadPasswordAssetReference](self, "payloadPasswordAssetReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("PasswordAssetReference"), v11, 0, 0);

  -[RMModelNetworkWiFiDeclaration payloadCertificateIdentityAssetReference](self, "payloadCertificateIdentityAssetReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("CertificateIdentityAssetReference"), v12, 0, 0);

  -[RMModelNetworkWiFiDeclaration payloadHotSpot](self, "payloadHotSpot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke;
  v28[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v29 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("HotSpot"), v13, v28, 0, 0);

  -[RMModelNetworkWiFiDeclaration payloadCaptiveBypass](self, "payloadCaptiveBypass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("CaptiveBypass"), v15, 0, v9);

  -[RMModelNetworkWiFiDeclaration payloadQoSMarkingPolicy](self, "payloadQoSMarkingPolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke_2;
  v26[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v27 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("QoSMarkingPolicy"), v16, v26, 0, 0);

  -[RMModelNetworkWiFiDeclaration payloadSetupModes](self, "payloadSetupModes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("SetupModes"), v17, &__block_literal_global_145_0, 0, 0);

  -[RMModelNetworkWiFiDeclaration payloadTLSCertificateRequired](self, "payloadTLSCertificateRequired");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("TLSCertificateRequired"), v18, 0, v9);

  -[RMModelNetworkWiFiDeclaration payloadProxy](self, "payloadProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke_4;
  v24[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v25 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Proxy"), v19, v24, 0, 0);

  -[RMModelNetworkWiFiDeclaration payloadDisableAssociationMACRandomization](self, "payloadDisableAssociationMACRandomization");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("DisableAssociationMACRandomization"), v20, 0, v9);

  -[RMModelNetworkWiFiDeclaration payloadEAPClientConfigurationUUID](self, "payloadEAPClientConfigurationUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("EAPClientConfigurationUUID"), v21, 0, 0);

  v22 = (void *)objc_msgSend(v5, "copy");
  return v22;
}

uint64_t __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

id __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke_4(uint64_t a1, void *a2)
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
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)RMModelNetworkWiFiDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v34, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAutoJoin, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadSSID, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSNumber copy](self->_payloadIsHiddenNetwork, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSString copy](self->_payloadEncryptionType, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[NSString copy](self->_payloadPasswordAssetReference, "copy");
  v14 = (void *)v4[10];
  v4[10] = v13;

  v15 = -[NSString copy](self->_payloadCertificateIdentityAssetReference, "copy");
  v16 = (void *)v4[11];
  v4[11] = v15;

  v17 = -[RMModelNetworkWiFiDeclaration_HotSpot copy](self->_payloadHotSpot, "copy");
  v18 = (void *)v4[12];
  v4[12] = v17;

  v19 = -[NSNumber copy](self->_payloadCaptiveBypass, "copy");
  v20 = (void *)v4[13];
  v4[13] = v19;

  v21 = -[RMModelNetworkWiFiDeclaration_QoSMarkingPolicy copy](self->_payloadQoSMarkingPolicy, "copy");
  v22 = (void *)v4[14];
  v4[14] = v21;

  v23 = -[NSArray copy](self->_payloadSetupModes, "copy");
  v24 = (void *)v4[15];
  v4[15] = v23;

  v25 = -[NSNumber copy](self->_payloadTLSCertificateRequired, "copy");
  v26 = (void *)v4[16];
  v4[16] = v25;

  v27 = -[RMModelNetworkWiFiDeclaration_Proxy copy](self->_payloadProxy, "copy");
  v28 = (void *)v4[17];
  v4[17] = v27;

  v29 = -[NSNumber copy](self->_payloadDisableAssociationMACRandomization, "copy");
  v30 = (void *)v4[18];
  v4[18] = v29;

  v31 = -[NSString copy](self->_payloadEAPClientConfigurationUUID, "copy");
  v32 = (void *)v4[19];
  v4[19] = v31;

  return v4;
}

- (NSNumber)payloadAutoJoin
{
  return self->_payloadAutoJoin;
}

- (void)setPayloadAutoJoin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadSSID
{
  return self->_payloadSSID;
}

- (void)setPayloadSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadIsHiddenNetwork
{
  return self->_payloadIsHiddenNetwork;
}

- (void)setPayloadIsHiddenNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)payloadEncryptionType
{
  return self->_payloadEncryptionType;
}

- (void)setPayloadEncryptionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadPasswordAssetReference
{
  return self->_payloadPasswordAssetReference;
}

- (void)setPayloadPasswordAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadCertificateIdentityAssetReference
{
  return self->_payloadCertificateIdentityAssetReference;
}

- (void)setPayloadCertificateIdentityAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (RMModelNetworkWiFiDeclaration_HotSpot)payloadHotSpot
{
  return self->_payloadHotSpot;
}

- (void)setPayloadHotSpot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadCaptiveBypass
{
  return self->_payloadCaptiveBypass;
}

- (void)setPayloadCaptiveBypass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (RMModelNetworkWiFiDeclaration_QoSMarkingPolicy)payloadQoSMarkingPolicy
{
  return self->_payloadQoSMarkingPolicy;
}

- (void)setPayloadQoSMarkingPolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)payloadSetupModes
{
  return self->_payloadSetupModes;
}

- (void)setPayloadSetupModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadTLSCertificateRequired
{
  return self->_payloadTLSCertificateRequired;
}

- (void)setPayloadTLSCertificateRequired:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (RMModelNetworkWiFiDeclaration_Proxy)payloadProxy
{
  return self->_payloadProxy;
}

- (void)setPayloadProxy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadDisableAssociationMACRandomization
{
  return self->_payloadDisableAssociationMACRandomization;
}

- (void)setPayloadDisableAssociationMACRandomization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)payloadEAPClientConfigurationUUID
{
  return self->_payloadEAPClientConfigurationUUID;
}

- (void)setPayloadEAPClientConfigurationUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEAPClientConfigurationUUID, 0);
  objc_storeStrong((id *)&self->_payloadDisableAssociationMACRandomization, 0);
  objc_storeStrong((id *)&self->_payloadProxy, 0);
  objc_storeStrong((id *)&self->_payloadTLSCertificateRequired, 0);
  objc_storeStrong((id *)&self->_payloadSetupModes, 0);
  objc_storeStrong((id *)&self->_payloadQoSMarkingPolicy, 0);
  objc_storeStrong((id *)&self->_payloadCaptiveBypass, 0);
  objc_storeStrong((id *)&self->_payloadHotSpot, 0);
  objc_storeStrong((id *)&self->_payloadCertificateIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadPasswordAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadEncryptionType, 0);
  objc_storeStrong((id *)&self->_payloadIsHiddenNetwork, 0);
  objc_storeStrong((id *)&self->_payloadSSID, 0);
  objc_storeStrong((id *)&self->_payloadAutoJoin, 0);
}

uint64_t __84__RMModelNetworkWiFiDeclaration_HotSpot_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __84__RMModelNetworkWiFiDeclaration_HotSpot_loadFromDictionary_serializationType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __84__RMModelNetworkWiFiDeclaration_HotSpot_loadFromDictionary_serializationType_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __59__RMModelNetworkWiFiDeclaration_HotSpot_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __59__RMModelNetworkWiFiDeclaration_HotSpot_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __59__RMModelNetworkWiFiDeclaration_HotSpot_serializeWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __93__RMModelNetworkWiFiDeclaration_QoSMarkingPolicy_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __68__RMModelNetworkWiFiDeclaration_QoSMarkingPolicy_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

@end
