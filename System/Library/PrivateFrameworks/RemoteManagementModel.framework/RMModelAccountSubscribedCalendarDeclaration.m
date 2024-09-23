@implementation RMModelAccountSubscribedCalendarDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.account.subscribed-calendar");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("VisibleName");
  v6[1] = CFSTR("CalendarURL");
  v6[2] = CFSTR("AuthenticationCredentialsAssetReference");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624900);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_5 != -1)
    dispatch_once(&assetReferences_onceToken_5, &__block_literal_global_5);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_5, self);
}

void __62__RMModelAccountSubscribedCalendarDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251624918, CFSTR("$.payloadAuthenticationCredentialsAssetReference"));
  v3[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)assetReferences_assetPaths_5;
  assetReferences_assetPaths_5 = v1;

}

+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 calendarURL:(id)a5 authenticationCredentialsAssetReference:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.account.subscribed-calendar"));
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
  objc_msgSend(v13, "setPayloadVisibleName:", v12);

  objc_msgSend(v13, "setPayloadCalendarURL:", v11);
  objc_msgSend(v13, "setPayloadAuthenticationCredentialsAssetReference:", v10);

  objc_msgSend(v13, "updateServerToken");
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 calendarURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.account.subscribed-calendar"));
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
  objc_msgSend(v7, "setPayloadCalendarURL:", v6);

  objc_msgSend(v7, "updateServerToken");
  return v7;
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
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[6];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20[0] = &unk_251629208;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624930);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624948);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v20[1] = &unk_251629250;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624960);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624978);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  v20[2] = &unk_251629220;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624990);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516249A8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  v20[3] = &unk_251629268;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516249C0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516249D8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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

  +[RMModelAccountSubscribedCalendarDeclaration allowedPayloadKeys](RMModelAccountSubscribedCalendarDeclaration, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("VisibleName"), CFSTR("payloadVisibleName"), 0, 0, a5))
  {
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("CalendarURL"), CFSTR("payloadCalendarURL"), 1, 0, a5))
    {
      v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("AuthenticationCredentialsAssetReference"), CFSTR("payloadAuthenticationCredentialsAssetReference"), 0, 0, a5);
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[RMModelAccountSubscribedCalendarDeclaration payloadVisibleName](self, "payloadVisibleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("VisibleName"), v5, 0, 0);

  -[RMModelAccountSubscribedCalendarDeclaration payloadCalendarURL](self, "payloadCalendarURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("CalendarURL"), v6, 1, 0);

  -[RMModelAccountSubscribedCalendarDeclaration payloadAuthenticationCredentialsAssetReference](self, "payloadAuthenticationCredentialsAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("AuthenticationCredentialsAssetReference"), v7, 0, 0);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
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
  v12.super_class = (Class)RMModelAccountSubscribedCalendarDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadVisibleName, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadCalendarURL, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_payloadAuthenticationCredentialsAssetReference, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)payloadVisibleName
{
  return self->_payloadVisibleName;
}

- (void)setPayloadVisibleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadCalendarURL
{
  return self->_payloadCalendarURL;
}

- (void)setPayloadCalendarURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadAuthenticationCredentialsAssetReference
{
  return self->_payloadAuthenticationCredentialsAssetReference;
}

- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadCalendarURL, 0);
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
}

@end
