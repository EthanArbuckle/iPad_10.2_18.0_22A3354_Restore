@implementation RMModelConfigurationDynamic

+ (id)buildWithSchema:(id)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  RMModelConfigurationDynamic *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[RMModelConfigurationDynamic initWithSchema:]([RMModelConfigurationDynamic alloc], "initWithSchema:", v12);

  -[RMModelDeclarationBase setDeclarationType:](v13, "setDeclarationType:", v11);
  -[RMModelDeclarationBase setDeclarationIdentifier:](v13, "setDeclarationIdentifier:", v10);

  v14 = (void *)objc_msgSend(v9, "copy");
  -[RMModelConfigurationDynamic setPayload:](v13, "setPayload:", v14);

  -[RMModelDeclarationBase updateServerToken](v13, "updateServerToken");
  return v13;
}

- (RMModelConfigurationDynamic)initWithSchema:(id)a3
{
  id v5;
  RMModelConfigurationDynamic *v6;
  RMModelConfigurationDynamic *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMModelConfigurationDynamic;
  v6 = -[RMModelConfigurationDynamic init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_schema, a3);

  return v7;
}

- (id)assetReferences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RMModelConfigurationDynamic schema](self, "schema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetReferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelConfigurationDynamic payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)declarationClassType
{
  return CFSTR("configuration");
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  +[RMModelConfigurationSchema schemas](RMModelConfigurationSchema, "schemas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelDeclarationBase declarationType](self, "declarationType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelConfigurationDynamic setSchema:](self, "setSchema:", v9);

  v10 = (void *)objc_msgSend(v6, "copy");
  -[RMModelConfigurationDynamic setPayload:](self, "setPayload:", v10);

  return 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v3;
  void *v4;

  -[RMModelConfigurationDynamic payload](self, "payload", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMModelConfigurationDynamic;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 6, self->_schema);
  v5 = -[NSDictionary copy](self->_payload, "copy");
  v6 = v4[7];
  v4[7] = (id)v5;

  return v4;
}

- (RMModelConfigurationSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
  objc_storeStrong((id *)&self->_schema, a3);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

@end
