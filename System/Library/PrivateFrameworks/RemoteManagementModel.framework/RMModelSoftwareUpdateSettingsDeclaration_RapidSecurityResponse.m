@implementation RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Enable");
  v6[1] = CFSTR("EnableRollback");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithEnable:(id)a3 enableRollback:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  v9 = (void *)MEMORY[0x24BDBD1C8];
  if (v6)
    v10 = v6;
  else
    v10 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v7, "setPayloadEnable:", v10);

  if (v5)
    v11 = v5;
  else
    v11 = v9;
  objc_msgSend(v8, "setPayloadEnableRollback:", v11);

  return v8;
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

  +[RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse allowedPayloadKeys](RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Enable"), CFSTR("payloadEnable"), 0, MEMORY[0x24BDBD1C8], a5))
  {
    v13 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("EnableRollback"), CFSTR("payloadEnableRollback"), 0, MEMORY[0x24BDBD1C8], a5);
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse payloadEnable](self, "payloadEnable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDBD1C8];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Enable"), v5, 0, MEMORY[0x24BDBD1C8]);

  -[RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse payloadEnableRollback](self, "payloadEnableRollback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("EnableRollback"), v7, 0, v6);

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
  id v10;

  v4 = a3;
  -[RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse payloadEnable](self, "payloadEnable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadEnable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineBooleanAnd:other:](RMModelConfigurationBase, "combineBooleanAnd:other:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse setPayloadEnable:](self, "setPayloadEnable:", v7);

  -[RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse payloadEnableRollback](self, "payloadEnableRollback");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadEnableRollback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelConfigurationBase combineBooleanAnd:other:](RMModelConfigurationBase, "combineBooleanAnd:other:", v10, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse setPayloadEnableRollback:](self, "setPayloadEnableRollback:", v9);

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
  v10.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadEnable, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadEnableRollback, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSNumber)payloadEnable
{
  return self->_payloadEnable;
}

- (void)setPayloadEnable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadEnableRollback
{
  return self->_payloadEnableRollback;
}

- (void)setPayloadEnableRollback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEnableRollback, 0);
  objc_storeStrong((id *)&self->_payloadEnable, 0);
}

@end
