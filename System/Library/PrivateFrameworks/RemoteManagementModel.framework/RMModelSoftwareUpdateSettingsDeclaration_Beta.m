@implementation RMModelSoftwareUpdateSettingsDeclaration_Beta

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ProgramEnrollment");
  v6[1] = CFSTR("OfferPrograms");
  v6[2] = CFSTR("RequireProgram");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithProgramEnrollment:(id)a3 offerPrograms:(id)a4 requireProgram:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  v7 = a5;
  v8 = a4;
  v9 = (__CFString *)a3;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = CFSTR("Allowed");
  objc_msgSend(v10, "setPayloadProgramEnrollment:", v12);

  objc_msgSend(v11, "setPayloadOfferPrograms:", v8);
  objc_msgSend(v11, "setPayloadRequireProgram:", v7);

  return v11;
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
  uint64_t v17;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelSoftwareUpdateSettingsDeclaration_Beta allowedPayloadKeys](RMModelSoftwareUpdateSettingsDeclaration_Beta, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  v14 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ProgramEnrollment"), CFSTR("payloadProgramEnrollment"), 0, CFSTR("Allowed"), a5))
  {
    LOWORD(v17) = a4;
    v14 = 0;
    if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("OfferPrograms"), CFSTR("payloadOfferPrograms"), objc_opt_class(), 0, 0, 0, v17, a5))
    {
      LOWORD(v16) = a4;
      v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("RequireProgram"), CFSTR("payloadRequireProgram"), objc_opt_class(), 0, 0, v16, a5);
    }
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  signed __int16 v13;
  _QWORD v14[4];
  signed __int16 v15;

  v5 = (void *)objc_opt_new();
  -[RMModelSoftwareUpdateSettingsDeclaration_Beta payloadProgramEnrollment](self, "payloadProgramEnrollment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ProgramEnrollment"), v6, 0, CFSTR("Allowed"));

  -[RMModelSoftwareUpdateSettingsDeclaration_Beta payloadOfferPrograms](self, "payloadOfferPrograms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__RMModelSoftwareUpdateSettingsDeclaration_Beta_serializeWithType___block_invoke;
  v14[3] = &__block_descriptor_34_e76___NSDictionary_16__0__RMModelSoftwareUpdateSettingsDeclaration_BetaProgram_8l;
  v15 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("OfferPrograms"), v7, v14, 0, 0);

  -[RMModelSoftwareUpdateSettingsDeclaration_Beta payloadRequireProgram](self, "payloadRequireProgram");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __67__RMModelSoftwareUpdateSettingsDeclaration_Beta_serializeWithType___block_invoke_2;
  v12[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v13 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("RequireProgram"), v9, v12, 0, 0);

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
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
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RMModelSoftwareUpdateSettingsDeclaration_Beta payloadProgramEnrollment](self, "payloadProgramEnrollment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadProgramEnrollment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("Allowed");
  v15[1] = CFSTR("AlwaysOn");
  v15[2] = CFSTR("AlwaysOff");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineEnumLast:other:enums:](RMModelConfigurationBase, "combineEnumLast:other:enums:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_Beta setPayloadProgramEnrollment:](self, "setPayloadProgramEnrollment:", v8);

  -[RMModelSoftwareUpdateSettingsDeclaration_Beta payloadOfferPrograms](self, "payloadOfferPrograms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadOfferPrograms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineSetUnion:other:](RMModelConfigurationBase, "combineSetUnion:other:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_Beta setPayloadOfferPrograms:](self, "setPayloadOfferPrograms:", v11);

  -[RMModelSoftwareUpdateSettingsDeclaration_Beta payloadRequireProgram](self, "payloadRequireProgram");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadRequireProgram");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelConfigurationBase combineFirst:other:](RMModelConfigurationBase, "combineFirst:other:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_Beta setPayloadRequireProgram:](self, "setPayloadRequireProgram:", v14);

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
  v12.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration_Beta;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadProgramEnrollment, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_payloadOfferPrograms, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram copy](self->_payloadRequireProgram, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadProgramEnrollment
{
  return self->_payloadProgramEnrollment;
}

- (void)setPayloadProgramEnrollment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)payloadOfferPrograms
{
  return self->_payloadOfferPrograms;
}

- (void)setPayloadOfferPrograms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram)payloadRequireProgram
{
  return self->_payloadRequireProgram;
}

- (void)setPayloadRequireProgram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRequireProgram, 0);
  objc_storeStrong((id *)&self->_payloadOfferPrograms, 0);
  objc_storeStrong((id *)&self->_payloadProgramEnrollment, 0);
}

@end
