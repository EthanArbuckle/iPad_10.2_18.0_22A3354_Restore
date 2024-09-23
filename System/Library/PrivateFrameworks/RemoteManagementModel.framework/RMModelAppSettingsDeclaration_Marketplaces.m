@implementation RMModelAppSettingsDeclaration_Marketplaces

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Enabled");
  v6[1] = CFSTR("AllowedMarketplaceApps");
  v6[2] = CFSTR("DeniedMarketplaceApps");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 allowedMarketplaceApps:(id)a4 deniedMarketplaceApps:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v10, "setPayloadEnabled:", v12);

  objc_msgSend(v11, "setPayloadAllowedMarketplaceApps:", v8);
  objc_msgSend(v11, "setPayloadDeniedMarketplaceApps:", v7);

  return v11;
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

  +[RMModelAppSettingsDeclaration_Marketplaces allowedPayloadKeys](RMModelAppSettingsDeclaration_Marketplaces, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Enabled"), CFSTR("payloadEnabled"), 0, MEMORY[0x24BDBD1C8], a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("AllowedMarketplaceApps"), CFSTR("payloadAllowedMarketplaceApps"), &__block_literal_global_9, 0, 0, a5))
    {
      v13 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("DeniedMarketplaceApps"), CFSTR("payloadDeniedMarketplaceApps"), &__block_literal_global_118, 0, 0, a5);
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

  v4 = (void *)objc_opt_new();
  -[RMModelAppSettingsDeclaration_Marketplaces payloadEnabled](self, "payloadEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Enabled"), v5, 0, MEMORY[0x24BDBD1C8]);

  -[RMModelAppSettingsDeclaration_Marketplaces payloadAllowedMarketplaceApps](self, "payloadAllowedMarketplaceApps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("AllowedMarketplaceApps"), v6, &__block_literal_global_120, 0, 0);

  -[RMModelAppSettingsDeclaration_Marketplaces payloadDeniedMarketplaceApps](self, "payloadDeniedMarketplaceApps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("DeniedMarketplaceApps"), v7, &__block_literal_global_121, 0, 0);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

- (void)combineWithOther:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[RMModelAppSettingsDeclaration_Marketplaces payloadEnabled](self, "payloadEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineFirst:other:](RMModelConfigurationBase, "combineFirst:other:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelAppSettingsDeclaration_Marketplaces setPayloadEnabled:](self, "setPayloadEnabled:", v7);

  -[RMModelAppSettingsDeclaration_Marketplaces payloadAllowedMarketplaceApps](self, "payloadAllowedMarketplaceApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadAllowedMarketplaceApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineSetIntersection:other:](RMModelConfigurationBase, "combineSetIntersection:other:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelAppSettingsDeclaration_Marketplaces setPayloadAllowedMarketplaceApps:](self, "setPayloadAllowedMarketplaceApps:", v10);

  -[RMModelAppSettingsDeclaration_Marketplaces payloadDeniedMarketplaceApps](self, "payloadDeniedMarketplaceApps");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadDeniedMarketplaceApps");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelConfigurationBase combineSetUnion:other:](RMModelConfigurationBase, "combineSetUnion:other:", v13, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelAppSettingsDeclaration_Marketplaces setPayloadDeniedMarketplaceApps:](self, "setPayloadDeniedMarketplaceApps:", v12);

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
  v12.super_class = (Class)RMModelAppSettingsDeclaration_Marketplaces;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadEnabled, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_payloadAllowedMarketplaceApps, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadDeniedMarketplaceApps, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSNumber)payloadEnabled
{
  return self->_payloadEnabled;
}

- (void)setPayloadEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)payloadAllowedMarketplaceApps
{
  return self->_payloadAllowedMarketplaceApps;
}

- (void)setPayloadAllowedMarketplaceApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadDeniedMarketplaceApps
{
  return self->_payloadDeniedMarketplaceApps;
}

- (void)setPayloadDeniedMarketplaceApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDeniedMarketplaceApps, 0);
  objc_storeStrong((id *)&self->_payloadAllowedMarketplaceApps, 0);
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
}

@end
