@implementation RMModelAppManagedDeclaration_InstallBehavior

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Install");
  v6[1] = CFSTR("License");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithInstall:(id)a3 license:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v5 = a4;
  v6 = (__CFString *)a3;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v6)
    v9 = v6;
  else
    v9 = CFSTR("Optional");
  objc_msgSend(v7, "setPayloadInstall:", v9);

  objc_msgSend(v8, "setPayloadLicense:", v5);
  return v8;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
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

  +[RMModelAppManagedDeclaration_InstallBehavior allowedPayloadKeys](RMModelAppManagedDeclaration_InstallBehavior, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  v14 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Install"), CFSTR("payloadInstall"), 0, CFSTR("Optional"), a5))
  {
    LOWORD(v16) = a4;
    v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("License"), CFSTR("payloadLicense"), objc_opt_class(), 0, 0, v16, a5);
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
  -[RMModelAppManagedDeclaration_InstallBehavior payloadInstall](self, "payloadInstall");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Install"), v6, 0, CFSTR("Optional"));

  -[RMModelAppManagedDeclaration_InstallBehavior payloadLicense](self, "payloadLicense");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__RMModelAppManagedDeclaration_InstallBehavior_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v11 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("License"), v7, v10, 0, 0);

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
  v10.super_class = (Class)RMModelAppManagedDeclaration_InstallBehavior;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadInstall, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[RMModelAppManagedDeclaration_InstallBehaviorLicense copy](self->_payloadLicense, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadInstall
{
  return self->_payloadInstall;
}

- (void)setPayloadInstall:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RMModelAppManagedDeclaration_InstallBehaviorLicense)payloadLicense
{
  return self->_payloadLicense;
}

- (void)setPayloadLicense:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLicense, 0);
  objc_storeStrong((id *)&self->_payloadInstall, 0);
}

@end
