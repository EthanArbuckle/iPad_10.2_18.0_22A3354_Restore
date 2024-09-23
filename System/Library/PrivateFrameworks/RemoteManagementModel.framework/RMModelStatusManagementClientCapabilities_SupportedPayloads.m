@implementation RMModelStatusManagementClientCapabilities_SupportedPayloads

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("declarations");
  v6[1] = CFSTR("status-items");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDeclarations:(id)a3 statusItems:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStatusDeclarations:", v6);

  objc_msgSend(v7, "setStatusStatusItems:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithDeclarations:(id)a3 statusItems:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStatusDeclarations:", v6);

  objc_msgSend(v7, "setStatusStatusItems:", v5);
  return v7;
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

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelStatusManagementClientCapabilities_SupportedPayloads allowedStatusKeys](RMModelStatusManagementClientCapabilities_SupportedPayloads, "allowedStatusKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  LOWORD(v16) = a4;
  if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("declarations"), CFSTR("statusDeclarations"), objc_opt_class(), 1, 0, v16, a5))
  {
    v14 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v8, CFSTR("status-items"), CFSTR("statusStatusItems"), &__block_literal_global_99, 1, 0, a5);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  signed __int16 v11;

  v5 = (void *)objc_opt_new();
  -[RMModelStatusManagementClientCapabilities_SupportedPayloads statusDeclarations](self, "statusDeclarations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__RMModelStatusManagementClientCapabilities_SupportedPayloads_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v11 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("declarations"), v6, v10, 1, 0);

  -[RMModelStatusManagementClientCapabilities_SupportedPayloads statusStatusItems](self, "statusStatusItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("status-items"), v7, &__block_literal_global_100, 1, 0);

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
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
  v10.super_class = (Class)RMModelStatusManagementClientCapabilities_SupportedPayloads;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations copy](self->_statusDeclarations, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_statusStatusItems, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations)statusDeclarations
{
  return self->_statusDeclarations;
}

- (void)setStatusDeclarations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)statusStatusItems
{
  return self->_statusStatusItems;
}

- (void)setStatusStatusItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusStatusItems, 0);
  objc_storeStrong((id *)&self->_statusDeclarations, 0);
}

@end
