@implementation RMModelAppSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.app.settings");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Marketplaces");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_opt_new();
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 marketplaces:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.app.settings"));
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
  objc_msgSend(v7, "setPayloadMarketplaces:", v6);

  objc_msgSend(v7, "updateServerToken");
  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.app.settings"));
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
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "combineWithOther:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
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
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = &unk_2516293D0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624CC0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624CD8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624CF0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = &unk_251629418;
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624D08);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624D20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624D38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v8 = (void *)MEMORY[0x24BDBCEF0];
  v9 = a3;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelAppSettingsDeclaration allowedPayloadKeys](RMModelAppSettingsDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  LOWORD(v15) = a4;
  LOBYTE(self) = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v9, CFSTR("Marketplaces"), CFSTR("payloadMarketplaces"), objc_opt_class(), 0, 0, v15, a5);

  return (char)self;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  signed __int16 v10;

  v5 = (void *)objc_opt_new();
  -[RMModelAppSettingsDeclaration payloadMarketplaces](self, "payloadMarketplaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__RMModelAppSettingsDeclaration_serializePayloadWithType___block_invoke;
  v9[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v10 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Marketplaces"), v6, v9, 0, 0);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

uint64_t __58__RMModelAppSettingsDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

- (void)combineWithOther:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[RMModelAppSettingsDeclaration payloadMarketplaces](self, "payloadMarketplaces");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadMarketplaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelConfigurationBase combineDictionary:other:](RMModelConfigurationBase, "combineDictionary:other:", v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelAppSettingsDeclaration setPayloadMarketplaces:](self, "setPayloadMarketplaces:", v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMModelAppSettingsDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[RMModelAppSettingsDeclaration_Marketplaces copy](self->_payloadMarketplaces, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  return v4;
}

- (RMModelAppSettingsDeclaration_Marketplaces)payloadMarketplaces
{
  return self->_payloadMarketplaces;
}

- (void)setPayloadMarketplaces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadMarketplaces, 0);
}

uint64_t __89__RMModelAppSettingsDeclaration_Marketplaces_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __89__RMModelAppSettingsDeclaration_Marketplaces_loadFromDictionary_serializationType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __64__RMModelAppSettingsDeclaration_Marketplaces_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __64__RMModelAppSettingsDeclaration_Marketplaces_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

@end
