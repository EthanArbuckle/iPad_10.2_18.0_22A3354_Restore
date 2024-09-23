@implementation RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("activations");
  v6[1] = CFSTR("assets");
  v6[2] = CFSTR("configurations");
  v6[3] = CFSTR("management");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithActivations:(id)a3 assets:(id)a4 configurations:(id)a5 management:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setStatusActivations:", v12);

  objc_msgSend(v13, "setStatusAssets:", v11);
  objc_msgSend(v13, "setStatusConfigurations:", v10);

  objc_msgSend(v13, "setStatusManagement:", v9);
  return v13;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
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

  +[RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations allowedStatusKeys](RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations, "allowedStatusKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("activations"), CFSTR("statusActivations"), &__block_literal_global_130, 0, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("assets"), CFSTR("statusAssets"), &__block_literal_global_133, 0, 0, a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("configurations"), CFSTR("statusConfigurations"), &__block_literal_global_136, 0, 0, a5))
      {
        v13 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("management"), CFSTR("statusManagement"), &__block_literal_global_139, 0, 0, a5);
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_opt_new();
  -[RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations statusActivations](self, "statusActivations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("activations"), v5, &__block_literal_global_140, 0, 0);

  -[RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations statusAssets](self, "statusAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("assets"), v6, &__block_literal_global_141, 0, 0);

  -[RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations statusConfigurations](self, "statusConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("configurations"), v7, &__block_literal_global_142, 0, 0);

  -[RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations statusManagement](self, "statusManagement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("management"), v8, &__block_literal_global_143, 0, 0);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations;
  v4 = -[RMModelPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_statusActivations, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_statusAssets, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_statusConfigurations, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSArray copy](self->_statusManagement, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSArray)statusActivations
{
  return self->_statusActivations;
}

- (void)setStatusActivations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)statusAssets
{
  return self->_statusAssets;
}

- (void)setStatusAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)statusConfigurations
{
  return self->_statusConfigurations;
}

- (void)setStatusConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)statusManagement
{
  return self->_statusManagement;
}

- (void)setStatusManagement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusManagement, 0);
  objc_storeStrong((id *)&self->_statusConfigurations, 0);
  objc_storeStrong((id *)&self->_statusAssets, 0);
  objc_storeStrong((id *)&self->_statusActivations, 0);
}

@end
