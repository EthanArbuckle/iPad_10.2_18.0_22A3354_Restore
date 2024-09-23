@implementation RMModelPasscodeSettingsDeclaration_CustomRegex

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Regex");
  v6[1] = CFSTR("Description");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithRegex:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadRegex:", v6);

  objc_msgSend(v7, "setPayloadDescription:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithRegex:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadRegex:", v3);

  return v4;
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

  +[RMModelPasscodeSettingsDeclaration_CustomRegex allowedPayloadKeys](RMModelPasscodeSettingsDeclaration_CustomRegex, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Regex"), CFSTR("payloadRegex"), 1, 0, a5))
  {
    LOWORD(v16) = a4;
    v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Description"), CFSTR("payloadDescription"), objc_opt_class(), 0, 0, v16, a5);
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
  -[RMModelPasscodeSettingsDeclaration_CustomRegex payloadRegex](self, "payloadRegex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Regex"), v6, 1, 0);

  -[RMModelPasscodeSettingsDeclaration_CustomRegex payloadDescription](self, "payloadDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__RMModelPasscodeSettingsDeclaration_CustomRegex_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v11 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Description"), v7, v10, 0, 0);

  v8 = (void *)objc_msgSend(v5, "copy");
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
  id v10;

  v4 = a3;
  -[RMModelPasscodeSettingsDeclaration_CustomRegex payloadRegex](self, "payloadRegex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadRegex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineFirst:other:](RMModelConfigurationBase, "combineFirst:other:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration_CustomRegex setPayloadRegex:](self, "setPayloadRegex:", v7);

  -[RMModelPasscodeSettingsDeclaration_CustomRegex payloadDescription](self, "payloadDescription");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelConfigurationBase combineDictionary:other:](RMModelConfigurationBase, "combineDictionary:other:", v10, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration_CustomRegex setPayloadDescription:](self, "setPayloadDescription:", v9);

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
  v10.super_class = (Class)RMModelPasscodeSettingsDeclaration_CustomRegex;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadRegex, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[RMModelPasscodeSettingsDeclaration_CustomRegexDescription copy](self->_payloadDescription, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadRegex
{
  return self->_payloadRegex;
}

- (void)setPayloadRegex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RMModelPasscodeSettingsDeclaration_CustomRegexDescription)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_payloadRegex, 0);
}

@end
