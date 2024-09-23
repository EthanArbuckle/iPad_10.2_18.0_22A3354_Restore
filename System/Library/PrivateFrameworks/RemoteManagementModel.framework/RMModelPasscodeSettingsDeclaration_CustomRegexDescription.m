@implementation RMModelPasscodeSettingsDeclaration_CustomRegexDescription

+ (NSSet)allowedPayloadKeys
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

+ (id)build
{
  return (id)objc_opt_new();
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;

  v6 = a4;
  v8 = a3;
  LOBYTE(a5) = -[RMModelPayloadBase loadObjectsFromDictionary:forKeyPath:classType:serializationType:error:](self, "loadObjectsFromDictionary:forKeyPath:classType:serializationType:error:", v8, CFSTR("payloadDictionary"), objc_opt_class(), v6, a5);

  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  -[RMModelPasscodeSettingsDeclaration_CustomRegexDescription payloadDictionary](self, "payloadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeObjectsIntoDictionary:value:classType:serializationType:](self, "serializeObjectsIntoDictionary:value:classType:serializationType:", v5, v6, objc_opt_class(), v3);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

- (void)combineWithOther:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[RMModelPasscodeSettingsDeclaration_CustomRegexDescription payloadDictionary](self, "payloadDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelConfigurationBase combineMergeDictionary:other:](RMModelConfigurationBase, "combineMergeDictionary:other:", v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration_CustomRegexDescription setPayloadDictionary:](self, "setPayloadDictionary:", v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMModelPasscodeSettingsDeclaration_CustomRegexDescription;
  v4 = -[RMModelPayloadBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSDictionary copy](self->_payloadDictionary, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSDictionary)payloadDictionary
{
  return self->_payloadDictionary;
}

- (void)setPayloadDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDictionary, 0);
}

@end
