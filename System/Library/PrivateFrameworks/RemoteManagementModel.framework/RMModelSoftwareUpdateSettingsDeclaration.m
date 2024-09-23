@implementation RMModelSoftwareUpdateSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.softwareupdate.settings");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Notifications");
  v6[1] = CFSTR("Deferrals");
  v6[2] = CFSTR("RecommendedCadence");
  v6[3] = CFSTR("AutomaticActions");
  v6[4] = CFSTR("RapidSecurityResponse");
  v6[5] = CFSTR("AllowStandardUserOSUpdates");
  v6[6] = CFSTR("Beta");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
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

+ (id)buildWithIdentifier:(id)a3 notifications:(id)a4 deferrals:(id)a5 recommendedCadence:(id)a6 automaticActions:(id)a7 rapidSecurityResponse:(id)a8 allowStandardUserOSUpdates:(id)a9 beta:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v29;

  v15 = a3;
  v29 = a10;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setDeclarationType:", CFSTR("com.apple.configuration.softwareupdate.settings"));
  if (v15)
  {
    objc_msgSend(v22, "setDeclarationIdentifier:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDeclarationIdentifier:", v24);

  }
  v25 = (void *)MEMORY[0x24BDBD1C8];
  if (v21)
    v26 = v21;
  else
    v26 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v22, "setPayloadNotifications:", v26);

  objc_msgSend(v22, "setPayloadDeferrals:", v20);
  objc_msgSend(v22, "setPayloadRecommendedCadence:", v19);

  objc_msgSend(v22, "setPayloadAutomaticActions:", v18);
  objc_msgSend(v22, "setPayloadRapidSecurityResponse:", v17);

  if (v16)
    v27 = v16;
  else
    v27 = v25;
  objc_msgSend(v22, "setPayloadAllowStandardUserOSUpdates:", v27);

  objc_msgSend(v22, "setPayloadBeta:", v29);
  objc_msgSend(v22, "updateServerToken");

  return v22;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.softwareupdate.settings"));
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
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v16[0] = &unk_25162A240;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626760);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626778);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = &unk_25162A258;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626790);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516267A8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = &unk_25162A288;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516267C0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516267D8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
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
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelSoftwareUpdateSettingsDeclaration allowedPayloadKeys](RMModelSoftwareUpdateSettingsDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  v14 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Notifications"), CFSTR("payloadNotifications"), 0, MEMORY[0x24BDBD1C8], a5))
  {
    LOWORD(v16) = a4;
    v14 = 0;
    if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Deferrals"), CFSTR("payloadDeferrals"), objc_opt_class(), 0, 0, v16, a5))
    {
      v14 = 0;
      if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("RecommendedCadence"), CFSTR("payloadRecommendedCadence"), 0, 0, a5))
      {
        LOWORD(v17) = a4;
        v14 = 0;
        if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("AutomaticActions"), CFSTR("payloadAutomaticActions"), objc_opt_class(), 0, 0, v17, a5))
        {
          LOWORD(v18) = a4;
          v14 = 0;
          if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("RapidSecurityResponse"), CFSTR("payloadRapidSecurityResponse"), objc_opt_class(), 0, 0, v18, a5))
          {
            v14 = 0;
            if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("AllowStandardUserOSUpdates"), CFSTR("payloadAllowStandardUserOSUpdates"), 0, MEMORY[0x24BDBD1C8], a5))
            {
              LOWORD(v19) = a4;
              v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Beta"), CFSTR("payloadBeta"), objc_opt_class(), 0, 0, v19, a5);
            }
          }
        }
      }
    }
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  signed __int16 v18;
  _QWORD v19[4];
  signed __int16 v20;
  _QWORD v21[4];
  signed __int16 v22;
  _QWORD v23[4];
  signed __int16 v24;

  v5 = (void *)objc_opt_new();
  -[RMModelSoftwareUpdateSettingsDeclaration payloadNotifications](self, "payloadNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDBD1C8];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Notifications"), v6, 0, MEMORY[0x24BDBD1C8]);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadDeferrals](self, "payloadDeferrals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke;
  v23[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v24 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Deferrals"), v8, v23, 0, 0);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadRecommendedCadence](self, "payloadRecommendedCadence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("RecommendedCadence"), v10, 0, 0);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadAutomaticActions](self, "payloadAutomaticActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_2;
  v21[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v22 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("AutomaticActions"), v11, v21, 0, 0);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadRapidSecurityResponse](self, "payloadRapidSecurityResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_3;
  v19[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v20 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("RapidSecurityResponse"), v12, v19, 0, 0);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadAllowStandardUserOSUpdates](self, "payloadAllowStandardUserOSUpdates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("AllowStandardUserOSUpdates"), v13, 0, v7);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadBeta](self, "payloadBeta");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_4;
  v17[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v18 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Beta"), v14, v17, 0, 0);

  v15 = (void *)objc_msgSend(v5, "copy");
  return v15;
}

uint64_t __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RMModelSoftwareUpdateSettingsDeclaration payloadNotifications](self, "payloadNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineBooleanAnd:other:](RMModelConfigurationBase, "combineBooleanAnd:other:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration setPayloadNotifications:](self, "setPayloadNotifications:", v7);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadDeferrals](self, "payloadDeferrals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadDeferrals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineDictionary:other:](RMModelConfigurationBase, "combineDictionary:other:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration setPayloadDeferrals:](self, "setPayloadDeferrals:", v10);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadRecommendedCadence](self, "payloadRecommendedCadence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadRecommendedCadence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("All");
  v27[1] = CFSTR("Oldest");
  v27[2] = CFSTR("Newest");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineEnumLast:other:enums:](RMModelConfigurationBase, "combineEnumLast:other:enums:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration setPayloadRecommendedCadence:](self, "setPayloadRecommendedCadence:", v14);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadAutomaticActions](self, "payloadAutomaticActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadAutomaticActions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineDictionary:other:](RMModelConfigurationBase, "combineDictionary:other:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration setPayloadAutomaticActions:](self, "setPayloadAutomaticActions:", v17);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadRapidSecurityResponse](self, "payloadRapidSecurityResponse");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadRapidSecurityResponse");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineDictionary:other:](RMModelConfigurationBase, "combineDictionary:other:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration setPayloadRapidSecurityResponse:](self, "setPayloadRapidSecurityResponse:", v20);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadAllowStandardUserOSUpdates](self, "payloadAllowStandardUserOSUpdates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadAllowStandardUserOSUpdates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineBooleanAnd:other:](RMModelConfigurationBase, "combineBooleanAnd:other:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration setPayloadAllowStandardUserOSUpdates:](self, "setPayloadAllowStandardUserOSUpdates:", v23);

  -[RMModelSoftwareUpdateSettingsDeclaration payloadBeta](self, "payloadBeta");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadBeta");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelConfigurationBase combineDictionary:other:](RMModelConfigurationBase, "combineDictionary:other:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration setPayloadBeta:](self, "setPayloadBeta:", v26);

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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v20, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadNotifications, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals copy](self->_payloadDeferrals, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_payloadRecommendedCadence, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions copy](self->_payloadAutomaticActions, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse copy](self->_payloadRapidSecurityResponse, "copy");
  v14 = (void *)v4[10];
  v4[10] = v13;

  v15 = -[NSNumber copy](self->_payloadAllowStandardUserOSUpdates, "copy");
  v16 = (void *)v4[11];
  v4[11] = v15;

  v17 = -[RMModelSoftwareUpdateSettingsDeclaration_Beta copy](self->_payloadBeta, "copy");
  v18 = (void *)v4[12];
  v4[12] = v17;

  return v4;
}

- (NSNumber)payloadNotifications
{
  return self->_payloadNotifications;
}

- (void)setPayloadNotifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (RMModelSoftwareUpdateSettingsDeclaration_Deferrals)payloadDeferrals
{
  return self->_payloadDeferrals;
}

- (void)setPayloadDeferrals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadRecommendedCadence
{
  return self->_payloadRecommendedCadence;
}

- (void)setPayloadRecommendedCadence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions)payloadAutomaticActions
{
  return self->_payloadAutomaticActions;
}

- (void)setPayloadAutomaticActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse)payloadRapidSecurityResponse
{
  return self->_payloadRapidSecurityResponse;
}

- (void)setPayloadRapidSecurityResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowStandardUserOSUpdates
{
  return self->_payloadAllowStandardUserOSUpdates;
}

- (void)setPayloadAllowStandardUserOSUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (RMModelSoftwareUpdateSettingsDeclaration_Beta)payloadBeta
{
  return self->_payloadBeta;
}

- (void)setPayloadBeta:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadBeta, 0);
  objc_storeStrong((id *)&self->_payloadAllowStandardUserOSUpdates, 0);
  objc_storeStrong((id *)&self->_payloadRapidSecurityResponse, 0);
  objc_storeStrong((id *)&self->_payloadAutomaticActions, 0);
  objc_storeStrong((id *)&self->_payloadRecommendedCadence, 0);
  objc_storeStrong((id *)&self->_payloadDeferrals, 0);
  objc_storeStrong((id *)&self->_payloadNotifications, 0);
}

uint64_t __67__RMModelSoftwareUpdateSettingsDeclaration_Beta_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __67__RMModelSoftwareUpdateSettingsDeclaration_Beta_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

@end
