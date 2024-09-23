@implementation RMModelSoftwareUpdateSettingsDeclaration_Deferrals

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("CombinedPeriodInDays");
  v6[1] = CFSTR("MajorPeriodInDays");
  v6[2] = CFSTR("MinorPeriodInDays");
  v6[3] = CFSTR("SystemPeriodInDays");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithCombinedPeriodInDays:(id)a3 majorPeriodInDays:(id)a4 minorPeriodInDays:(id)a5 systemPeriodInDays:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadCombinedPeriodInDays:", v12);

  objc_msgSend(v13, "setPayloadMajorPeriodInDays:", v11);
  objc_msgSend(v13, "setPayloadMinorPeriodInDays:", v10);

  objc_msgSend(v13, "setPayloadSystemPeriodInDays:", v9);
  return v13;
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

  +[RMModelSoftwareUpdateSettingsDeclaration_Deferrals allowedPayloadKeys](RMModelSoftwareUpdateSettingsDeclaration_Deferrals, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("CombinedPeriodInDays"), CFSTR("payloadCombinedPeriodInDays"), 0, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("MajorPeriodInDays"), CFSTR("payloadMajorPeriodInDays"), 0, 0, a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("MinorPeriodInDays"), CFSTR("payloadMinorPeriodInDays"), 0, 0, a5))
      {
        v13 = -[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("SystemPeriodInDays"), CFSTR("payloadSystemPeriodInDays"), 0, 0, a5);
      }
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
  void *v9;

  v4 = (void *)objc_opt_new();
  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals payloadCombinedPeriodInDays](self, "payloadCombinedPeriodInDays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("CombinedPeriodInDays"), v5, 0, 0);

  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals payloadMajorPeriodInDays](self, "payloadMajorPeriodInDays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("MajorPeriodInDays"), v6, 0, 0);

  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals payloadMinorPeriodInDays](self, "payloadMinorPeriodInDays");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("MinorPeriodInDays"), v7, 0, 0);

  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals payloadSystemPeriodInDays](self, "payloadSystemPeriodInDays");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("SystemPeriodInDays"), v8, 0, 0);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
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
  id v16;

  v4 = a3;
  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals payloadCombinedPeriodInDays](self, "payloadCombinedPeriodInDays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadCombinedPeriodInDays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMax:other:](RMModelConfigurationBase, "combineNumberMax:other:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals setPayloadCombinedPeriodInDays:](self, "setPayloadCombinedPeriodInDays:", v7);

  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals payloadMajorPeriodInDays](self, "payloadMajorPeriodInDays");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadMajorPeriodInDays");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMax:other:](RMModelConfigurationBase, "combineNumberMax:other:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals setPayloadMajorPeriodInDays:](self, "setPayloadMajorPeriodInDays:", v10);

  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals payloadMinorPeriodInDays](self, "payloadMinorPeriodInDays");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadMinorPeriodInDays");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMax:other:](RMModelConfigurationBase, "combineNumberMax:other:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals setPayloadMinorPeriodInDays:](self, "setPayloadMinorPeriodInDays:", v13);

  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals payloadSystemPeriodInDays](self, "payloadSystemPeriodInDays");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadSystemPeriodInDays");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelConfigurationBase combineNumberMax:other:](RMModelConfigurationBase, "combineNumberMax:other:", v16, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_Deferrals setPayloadSystemPeriodInDays:](self, "setPayloadSystemPeriodInDays:", v15);

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
  v14.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration_Deferrals;
  v4 = -[RMModelPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadCombinedPeriodInDays, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadMajorPeriodInDays, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadMinorPeriodInDays, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadSystemPeriodInDays, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)payloadCombinedPeriodInDays
{
  return self->_payloadCombinedPeriodInDays;
}

- (void)setPayloadCombinedPeriodInDays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadMajorPeriodInDays
{
  return self->_payloadMajorPeriodInDays;
}

- (void)setPayloadMajorPeriodInDays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadMinorPeriodInDays
{
  return self->_payloadMinorPeriodInDays;
}

- (void)setPayloadMinorPeriodInDays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadSystemPeriodInDays
{
  return self->_payloadSystemPeriodInDays;
}

- (void)setPayloadSystemPeriodInDays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSystemPeriodInDays, 0);
  objc_storeStrong((id *)&self->_payloadMinorPeriodInDays, 0);
  objc_storeStrong((id *)&self->_payloadMajorPeriodInDays, 0);
  objc_storeStrong((id *)&self->_payloadCombinedPeriodInDays, 0);
}

@end
