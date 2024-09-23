@implementation RMModelAssetCredentialACMEDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.asset.credential.acme");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Reference");
  v6[1] = CFSTR("Authentication");
  v6[2] = CFSTR("Accessible");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 reference:(id)a4 authentication:(id)a5 accessible:(id)a6
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
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.asset.credential.acme"));
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
  objc_msgSend(v13, "setPayloadReference:", v12);

  objc_msgSend(v13, "setPayloadAuthentication:", v11);
  if (v10)
    v16 = v10;
  else
    v16 = CFSTR("Default");
  objc_msgSend(v13, "setPayloadAccessible:", v16);

  objc_msgSend(v13, "updateServerToken");
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 reference:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.asset.credential.acme"));
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
  objc_msgSend(v7, "setPayloadReference:", v6);

  objc_msgSend(v7, "updateServerToken");
  return v7;
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
  v28[0] = &unk_251629430;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624D50);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624D68);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v28[1] = &unk_251629448;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624D80);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624D98);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  v28[2] = &unk_251629460;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624DB0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624DC8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  v28[3] = &unk_251629478;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624DE0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624DF8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v4;
  v28[4] = &unk_251629490;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624E10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624E28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v7;
  v28[5] = &unk_2516294A8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624E40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624E58);
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
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelAssetCredentialACMEDeclaration allowedPayloadKeys](RMModelAssetCredentialACMEDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  LOWORD(v16) = a4;
  if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Reference"), CFSTR("payloadReference"), objc_opt_class(), 1, 0, v16, a5))
  {
    LOWORD(v17) = a4;
    v14 = 0;
    if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Authentication"), CFSTR("payloadAuthentication"), objc_opt_class(), 0, 0, v17, a5))
    {
      v14 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Accessible"), CFSTR("payloadAccessible"), 0, CFSTR("Default"), a5);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  signed __int16 v13;
  _QWORD v14[4];
  signed __int16 v15;

  v5 = (void *)objc_opt_new();
  -[RMModelAssetCredentialACMEDeclaration payloadReference](self, "payloadReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__RMModelAssetCredentialACMEDeclaration_serializePayloadWithType___block_invoke;
  v14[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v15 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Reference"), v6, v14, 1, 0);

  -[RMModelAssetCredentialACMEDeclaration payloadAuthentication](self, "payloadAuthentication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __66__RMModelAssetCredentialACMEDeclaration_serializePayloadWithType___block_invoke_2;
  v12[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v13 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Authentication"), v8, v12, 0, 0);

  -[RMModelAssetCredentialACMEDeclaration payloadAccessible](self, "payloadAccessible");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Accessible"), v9, 0, CFSTR("Default"));

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

uint64_t __66__RMModelAssetCredentialACMEDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __66__RMModelAssetCredentialACMEDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RMModelAssetCredentialACMEDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[RMModelAssetBaseReference copy](self->_payloadReference, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[RMModelAssetBaseAuthentication copy](self->_payloadAuthentication, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_payloadAccessible, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (RMModelAssetBaseReference)payloadReference
{
  return self->_payloadReference;
}

- (void)setPayloadReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (RMModelAssetBaseAuthentication)payloadAuthentication
{
  return self->_payloadAuthentication;
}

- (void)setPayloadAuthentication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadAccessible
{
  return self->_payloadAccessible;
}

- (void)setPayloadAccessible:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAccessible, 0);
  objc_storeStrong((id *)&self->_payloadAuthentication, 0);
  objc_storeStrong((id *)&self->_payloadReference, 0);
}

@end
