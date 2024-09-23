@implementation RMModelServicesBackgroundTasksDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.services.background-tasks");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("TaskType");
  v6[1] = CFSTR("TaskDescription");
  v6[2] = CFSTR("ExecutableAssetReference");
  v6[3] = CFSTR("LaunchdConfigurations");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516265F8);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_14 != -1)
    dispatch_once(&assetReferences_onceToken_14, &__block_literal_global_21);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_14, self);
}

void __60__RMModelServicesBackgroundTasksDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  RMModelConfigurationSchemaAssetReference *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251626610, CFSTR("$.payloadExecutableAssetReference"));
  v4[0] = v0;
  v1 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251626628, CFSTR("$.payloadLaunchdConfigurations.*.payloadFileAssetReference"));
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)assetReferences_assetPaths_14;
  assetReferences_assetPaths_14 = v2;

}

+ (id)buildWithIdentifier:(id)a3 taskType:(id)a4 taskDescription:(id)a5 executableAssetReference:(id)a6 launchdConfigurations:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.services.background-tasks"));
  if (v11)
  {
    objc_msgSend(v16, "setDeclarationIdentifier:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDeclarationIdentifier:", v18);

  }
  objc_msgSend(v16, "setPayloadTaskType:", v15);

  objc_msgSend(v16, "setPayloadTaskDescription:", v14);
  objc_msgSend(v16, "setPayloadExecutableAssetReference:", v13);

  objc_msgSend(v16, "setPayloadLaunchdConfigurations:", v12);
  objc_msgSend(v16, "updateServerToken");

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 taskType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.services.background-tasks"));
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
  objc_msgSend(v7, "setPayloadTaskType:", v6);

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
  _QWORD v7[2];
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = &unk_25162A150;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626640);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626658);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelServicesBackgroundTasksDeclaration allowedPayloadKeys](RMModelServicesBackgroundTasksDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("TaskType"), CFSTR("payloadTaskType"), 1, 0, a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("TaskDescription"), CFSTR("payloadTaskDescription"), 0, 0, a5))
    {
      v14 = 0;
      if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ExecutableAssetReference"), CFSTR("payloadExecutableAssetReference"), 0, 0, a5))
      {
        LOWORD(v16) = a4;
        v14 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("LaunchdConfigurations"), CFSTR("payloadLaunchdConfigurations"), objc_opt_class(), 0, 0, 0, v16, a5);
      }
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  signed __int16 v13;

  v5 = (void *)objc_opt_new();
  -[RMModelServicesBackgroundTasksDeclaration payloadTaskType](self, "payloadTaskType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("TaskType"), v6, 1, 0);

  -[RMModelServicesBackgroundTasksDeclaration payloadTaskDescription](self, "payloadTaskDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("TaskDescription"), v7, 0, 0);

  -[RMModelServicesBackgroundTasksDeclaration payloadExecutableAssetReference](self, "payloadExecutableAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ExecutableAssetReference"), v8, 0, 0);

  -[RMModelServicesBackgroundTasksDeclaration payloadLaunchdConfigurations](self, "payloadLaunchdConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__RMModelServicesBackgroundTasksDeclaration_serializePayloadWithType___block_invoke;
  v12[3] = &__block_descriptor_34_e77___NSDictionary_16__0__RMModelServicesBackgroundTasksDeclaration_LaunchdItem_8l;
  v13 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("LaunchdConfigurations"), v9, v12, 0, 0);

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

uint64_t __70__RMModelServicesBackgroundTasksDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RMModelServicesBackgroundTasksDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadTaskType, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadTaskDescription, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_payloadExecutableAssetReference, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSArray copy](self->_payloadLaunchdConfigurations, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  return v4;
}

- (NSString)payloadTaskType
{
  return self->_payloadTaskType;
}

- (void)setPayloadTaskType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadTaskDescription
{
  return self->_payloadTaskDescription;
}

- (void)setPayloadTaskDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadExecutableAssetReference
{
  return self->_payloadExecutableAssetReference;
}

- (void)setPayloadExecutableAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)payloadLaunchdConfigurations
{
  return self->_payloadLaunchdConfigurations;
}

- (void)setPayloadLaunchdConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLaunchdConfigurations, 0);
  objc_storeStrong((id *)&self->_payloadExecutableAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadTaskDescription, 0);
  objc_storeStrong((id *)&self->_payloadTaskType, 0);
}

@end
