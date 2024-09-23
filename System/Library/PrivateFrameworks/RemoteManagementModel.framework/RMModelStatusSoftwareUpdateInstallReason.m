@implementation RMModelStatusSoftwareUpdateInstallReason

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("reason");
  v6[1] = CFSTR("declaration-id");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return CFSTR("softwareupdate.install-reason");
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)buildWithReason:(id)a3 declarationId:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStatusReason:", v6);

  objc_msgSend(v7, "setStatusDeclarationId:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithReason:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setStatusReason:", v3);

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
  v16[0] = &unk_25162B350;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628548);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628560);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = &unk_25162B368;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628578);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628590);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = &unk_25162B398;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516285A8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516285C0);
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

  +[RMModelStatusSoftwareUpdateInstallReason allowedStatusKeys](RMModelStatusSoftwareUpdateInstallReason, "allowedStatusKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("reason"), CFSTR("statusReason"), &__block_literal_global_26, 1, 0, a5))
  {
    v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("declaration-id"), CFSTR("statusDeclarationId"), 0, 0, a5);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __94__RMModelStatusSoftwareUpdateInstallReason_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[RMModelStatusSoftwareUpdateInstallReason statusReason](self, "statusReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("reason"), v5, &__block_literal_global_31, 1, 0);

  -[RMModelStatusSoftwareUpdateInstallReason statusDeclarationId](self, "statusDeclarationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("declaration-id"), v6, 0, 0);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

id __69__RMModelStatusSoftwareUpdateInstallReason_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
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
  v10.super_class = (Class)RMModelStatusSoftwareUpdateInstallReason;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_statusReason, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_statusDeclarationId, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSArray)statusReason
{
  return self->_statusReason;
}

- (void)setStatusReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)statusDeclarationId
{
  return self->_statusDeclarationId;
}

- (void)setStatusDeclarationId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDeclarationId, 0);
  objc_storeStrong((id *)&self->_statusReason, 0);
}

@end
