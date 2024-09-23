@implementation RMModelStatusManagementClientCapabilities

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("supported-versions");
  v6[1] = CFSTR("supported-features");
  v6[2] = CFSTR("supported-payloads");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return CFSTR("management.client-capabilities");
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)buildWithSupportedVersions:(id)a3 supportedFeatures:(id)a4 supportedPayloads:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setStatusSupportedVersions:", v9);

  objc_msgSend(v10, "setStatusSupportedFeatures:", v8);
  objc_msgSend(v10, "setStatusSupportedPayloads:", v7);

  return v10;
}

+ (id)buildRequiredOnlyWithSupportedVersions:(id)a3 supportedFeatures:(id)a4 supportedPayloads:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setStatusSupportedVersions:", v9);

  objc_msgSend(v10, "setStatusSupportedFeatures:", v8);
  objc_msgSend(v10, "setStatusSupportedPayloads:", v7);

  return v10;
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
  v28[0] = &unk_25162AE40;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627CD8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627CF0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v28[1] = &unk_25162AE58;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627D08);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627D20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  v28[2] = &unk_25162AE88;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627D38);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627D50);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  v28[3] = &unk_25162AE70;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627D68);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627D80);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v4;
  v28[4] = &unk_25162AEA0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627D98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627DB0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v7;
  v28[5] = &unk_25162AEB8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627DC8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627DE0);
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

  +[RMModelStatusManagementClientCapabilities allowedStatusKeys](RMModelStatusManagementClientCapabilities, "allowedStatusKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v8, CFSTR("supported-versions"), CFSTR("statusSupportedVersions"), &__block_literal_global_23, 1, 0, a5)&& (LOWORD(v16) = a4, -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("supported-features"), CFSTR("statusSupportedFeatures"), objc_opt_class(), 1, 0,
          v16,
          a5)))
  {
    LOWORD(v17) = a4;
    v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("supported-payloads"), CFSTR("statusSupportedPayloads"), objc_opt_class(), 1, 0, v17, a5);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __95__RMModelStatusManagementClientCapabilities_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  signed __int16 v13;
  _QWORD v14[4];
  signed __int16 v15;

  v5 = (void *)objc_opt_new();
  -[RMModelStatusManagementClientCapabilities statusSupportedVersions](self, "statusSupportedVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("supported-versions"), v6, &__block_literal_global_51, 1, 0);

  -[RMModelStatusManagementClientCapabilities statusSupportedFeatures](self, "statusSupportedFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__RMModelStatusManagementClientCapabilities_serializePayloadWithType___block_invoke_2;
  v14[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v15 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("supported-features"), v7, v14, 1, 0);

  -[RMModelStatusManagementClientCapabilities statusSupportedPayloads](self, "statusSupportedPayloads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __70__RMModelStatusManagementClientCapabilities_serializePayloadWithType___block_invoke_3;
  v12[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v13 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("supported-payloads"), v9, v12, 1, 0);

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

id __70__RMModelStatusManagementClientCapabilities_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __70__RMModelStatusManagementClientCapabilities_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __70__RMModelStatusManagementClientCapabilities_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
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
  v12.super_class = (Class)RMModelStatusManagementClientCapabilities;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_statusSupportedVersions, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[RMModelAnyPayload copy](self->_statusSupportedFeatures, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[RMModelStatusManagementClientCapabilities_SupportedPayloads copy](self->_statusSupportedPayloads, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSArray)statusSupportedVersions
{
  return self->_statusSupportedVersions;
}

- (void)setStatusSupportedVersions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RMModelAnyPayload)statusSupportedFeatures
{
  return self->_statusSupportedFeatures;
}

- (void)setStatusSupportedFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RMModelStatusManagementClientCapabilities_SupportedPayloads)statusSupportedPayloads
{
  return self->_statusSupportedPayloads;
}

- (void)setStatusSupportedPayloads:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusSupportedPayloads, 0);
  objc_storeStrong((id *)&self->_statusSupportedFeatures, 0);
  objc_storeStrong((id *)&self->_statusSupportedVersions, 0);
}

uint64_t __106__RMModelStatusManagementClientCapabilities_SupportedPayloads_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __81__RMModelStatusManagementClientCapabilities_SupportedPayloads_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

id __81__RMModelStatusManagementClientCapabilities_SupportedPayloads_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __118__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __118__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_loadFromDictionary_serializationType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __118__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_loadFromDictionary_serializationType_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __118__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_loadFromDictionary_serializationType_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __93__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __93__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __93__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_serializeWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

id __93__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_serializeWithType___block_invoke_4(uint64_t a1, void *a2)
{
  return a2;
}

@end
