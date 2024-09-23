@implementation RMModelStatusServicesBackgroundTask_Launchd

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("label");
  v6[1] = CFSTR("program");
  v6[2] = CFSTR("program-arguments");
  v6[3] = CFSTR("checksum");
  v6[4] = CFSTR("device-management");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithLabel:(id)a3 program:(id)a4 programArguments:(id)a5 checksum:(id)a6 deviceManagement:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setStatusLabel:", v15);

  objc_msgSend(v16, "setStatusProgram:", v14);
  objc_msgSend(v16, "setStatusProgramArguments:", v13);

  objc_msgSend(v16, "setStatusChecksum:", v12);
  objc_msgSend(v16, "setStatusDeviceManagement:", v11);

  return v16;
}

+ (id)buildRequiredOnlyWithLabel:(id)a3 program:(id)a4 checksum:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setStatusLabel:", v9);

  objc_msgSend(v10, "setStatusProgram:", v8);
  objc_msgSend(v10, "setStatusChecksum:", v7);

  return v10;
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

  +[RMModelStatusServicesBackgroundTask_Launchd allowedStatusKeys](RMModelStatusServicesBackgroundTask_Launchd, "allowedStatusKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("label"), CFSTR("statusLabel"), 1, 0, a5)|| !-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("program"), CFSTR("statusProgram"), 1, 0, a5))
  {
    goto LABEL_6;
  }
  v14 = 0;
  if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v8, CFSTR("program-arguments"), CFSTR("statusProgramArguments"), &__block_literal_global_25, 0, 0, a5))
  {
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("checksum"), CFSTR("statusChecksum"), 1, 0, a5))
    {
      LOWORD(v16) = a4;
      v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("device-management"), CFSTR("statusDeviceManagement"), objc_opt_class(), 0, 0, v16, a5);
      goto LABEL_7;
    }
LABEL_6:
    v14 = 0;
  }
LABEL_7:

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  signed __int16 v14;

  v5 = (void *)objc_opt_new();
  -[RMModelStatusServicesBackgroundTask_Launchd statusLabel](self, "statusLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("label"), v6, 1, 0);

  -[RMModelStatusServicesBackgroundTask_Launchd statusProgram](self, "statusProgram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("program"), v7, 1, 0);

  -[RMModelStatusServicesBackgroundTask_Launchd statusProgramArguments](self, "statusProgramArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("program-arguments"), v8, &__block_literal_global_151, 0, 0);

  -[RMModelStatusServicesBackgroundTask_Launchd statusChecksum](self, "statusChecksum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("checksum"), v9, 1, 0);

  -[RMModelStatusServicesBackgroundTask_Launchd statusDeviceManagement](self, "statusDeviceManagement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__RMModelStatusServicesBackgroundTask_Launchd_serializeWithType___block_invoke_2;
  v13[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v14 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("device-management"), v10, v13, 0, 0);

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RMModelStatusServicesBackgroundTask_Launchd;
  v4 = -[RMModelPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusLabel, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_statusProgram, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_statusProgramArguments, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_statusChecksum, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement copy](self->_statusDeviceManagement, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)statusProgram
{
  return self->_statusProgram;
}

- (void)setStatusProgram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)statusProgramArguments
{
  return self->_statusProgramArguments;
}

- (void)setStatusProgramArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)statusChecksum
{
  return self->_statusChecksum;
}

- (void)setStatusChecksum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement)statusDeviceManagement
{
  return self->_statusDeviceManagement;
}

- (void)setStatusDeviceManagement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDeviceManagement, 0);
  objc_storeStrong((id *)&self->_statusChecksum, 0);
  objc_storeStrong((id *)&self->_statusProgramArguments, 0);
  objc_storeStrong((id *)&self->_statusProgram, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
}

@end
