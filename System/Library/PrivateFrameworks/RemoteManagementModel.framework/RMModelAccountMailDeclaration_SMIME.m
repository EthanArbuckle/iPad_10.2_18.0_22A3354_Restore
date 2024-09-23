@implementation RMModelAccountMailDeclaration_SMIME

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Signing");
  v6[1] = CFSTR("Encryption");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithSigning:(id)a3 encryption:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadSigning:", v6);

  objc_msgSend(v7, "setPayloadEncryption:", v5);
  return v7;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
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

  +[RMModelAccountMailDeclaration_SMIME allowedPayloadKeys](RMModelAccountMailDeclaration_SMIME, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  LOWORD(v16) = a4;
  v14 = 0;
  if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Signing"), CFSTR("payloadSigning"), objc_opt_class(), 0, 0, v16, a5))
  {
    LOWORD(v17) = a4;
    v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Encryption"), CFSTR("payloadEncryption"), objc_opt_class(), 0, 0, v17, a5);
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  signed __int16 v12;
  _QWORD v13[4];
  signed __int16 v14;

  v5 = (void *)objc_opt_new();
  -[RMModelAccountMailDeclaration_SMIME payloadSigning](self, "payloadSigning");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__RMModelAccountMailDeclaration_SMIME_serializeWithType___block_invoke;
  v13[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v14 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Signing"), v6, v13, 0, 0);

  -[RMModelAccountMailDeclaration_SMIME payloadEncryption](self, "payloadEncryption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __57__RMModelAccountMailDeclaration_SMIME_serializeWithType___block_invoke_2;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v12 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Encryption"), v8, v11, 0, 0);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
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
  v10.super_class = (Class)RMModelAccountMailDeclaration_SMIME;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[RMModelAccountMailDeclaration_SMIMESigning copy](self->_payloadSigning, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[RMModelAccountMailDeclaration_SMIMEEncryption copy](self->_payloadEncryption, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (RMModelAccountMailDeclaration_SMIMESigning)payloadSigning
{
  return self->_payloadSigning;
}

- (void)setPayloadSigning:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RMModelAccountMailDeclaration_SMIMEEncryption)payloadEncryption
{
  return self->_payloadEncryption;
}

- (void)setPayloadEncryption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEncryption, 0);
  objc_storeStrong((id *)&self->_payloadSigning, 0);
}

@end
