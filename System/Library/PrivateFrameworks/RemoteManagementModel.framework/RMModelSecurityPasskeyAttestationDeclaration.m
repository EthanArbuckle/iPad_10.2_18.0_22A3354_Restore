@implementation RMModelSecurityPasskeyAttestationDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.security.passkey.attestation");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("AttestationIdentityAssetReference");
  v6[1] = CFSTR("AttestationIdentityKeyIsExtractable");
  v6[2] = CFSTR("RelyingParties");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626568);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_13 != -1)
    dispatch_once(&assetReferences_onceToken_13, &__block_literal_global_20);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_13, self);
}

void __63__RMModelSecurityPasskeyAttestationDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251626580, CFSTR("$.payloadAttestationIdentityAssetReference"));
  v3[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)assetReferences_assetPaths_13;
  assetReferences_assetPaths_13 = v1;

}

+ (id)buildWithIdentifier:(id)a3 attestationIdentityAssetReference:(id)a4 attestationIdentityKeyIsExtractable:(id)a5 relyingParties:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.security.passkey.attestation"));
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
  objc_msgSend(v13, "setPayloadAttestationIdentityAssetReference:", v12);

  if (v11)
    v16 = v11;
  else
    v16 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v13, "setPayloadAttestationIdentityKeyIsExtractable:", v16);

  objc_msgSend(v13, "setPayloadRelyingParties:", v10);
  objc_msgSend(v13, "updateServerToken");

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 attestationIdentityAssetReference:(id)a4 relyingParties:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.security.passkey.attestation"));
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
  objc_msgSend(v10, "setPayloadAttestationIdentityAssetReference:", v9);

  objc_msgSend(v10, "setPayloadRelyingParties:", v8);
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
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = &unk_25162A108;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626598);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516265B0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = &unk_25162A138;
  v13[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516265C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516265E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

  +[RMModelSecurityPasskeyAttestationDeclaration allowedPayloadKeys](RMModelSecurityPasskeyAttestationDeclaration, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("AttestationIdentityAssetReference"), CFSTR("payloadAttestationIdentityAssetReference"), 1, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("AttestationIdentityKeyIsExtractable"), CFSTR("payloadAttestationIdentityKeyIsExtractable"), 0, MEMORY[0x24BDBD1C8], a5))
    {
      v13 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("RelyingParties"), CFSTR("payloadRelyingParties"), &__block_literal_global_44, 1, 0, a5);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __98__RMModelSecurityPasskeyAttestationDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[RMModelSecurityPasskeyAttestationDeclaration payloadAttestationIdentityAssetReference](self, "payloadAttestationIdentityAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("AttestationIdentityAssetReference"), v5, 1, 0);

  -[RMModelSecurityPasskeyAttestationDeclaration payloadAttestationIdentityKeyIsExtractable](self, "payloadAttestationIdentityKeyIsExtractable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("AttestationIdentityKeyIsExtractable"), v6, 0, MEMORY[0x24BDBD1C8]);

  -[RMModelSecurityPasskeyAttestationDeclaration payloadRelyingParties](self, "payloadRelyingParties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("RelyingParties"), v7, &__block_literal_global_48_1, 1, 0);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

id __73__RMModelSecurityPasskeyAttestationDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
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
  v12.super_class = (Class)RMModelSecurityPasskeyAttestationDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadAttestationIdentityAssetReference, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSNumber copy](self->_payloadAttestationIdentityKeyIsExtractable, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSArray copy](self->_payloadRelyingParties, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)payloadAttestationIdentityAssetReference
{
  return self->_payloadAttestationIdentityAssetReference;
}

- (void)setPayloadAttestationIdentityAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadAttestationIdentityKeyIsExtractable
{
  return self->_payloadAttestationIdentityKeyIsExtractable;
}

- (void)setPayloadAttestationIdentityKeyIsExtractable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)payloadRelyingParties
{
  return self->_payloadRelyingParties;
}

- (void)setPayloadRelyingParties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRelyingParties, 0);
  objc_storeStrong((id *)&self->_payloadAttestationIdentityKeyIsExtractable, 0);
  objc_storeStrong((id *)&self->_payloadAttestationIdentityAssetReference, 0);
}

@end
