@implementation RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Download");
  v6[1] = CFSTR("InstallOSUpdates");
  v6[2] = CFSTR("InstallSecurityUpdate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDownload:(id)a3 installOSUpdates:(id)a4 installSecurityUpdate:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;

  v7 = (__CFString *)a5;
  v8 = (__CFString *)a4;
  v9 = (__CFString *)a3;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = CFSTR("Allowed");
  objc_msgSend(v10, "setPayloadDownload:", v12);

  if (v8)
    v13 = v8;
  else
    v13 = CFSTR("Allowed");
  objc_msgSend(v11, "setPayloadInstallOSUpdates:", v13);

  if (v7)
    v14 = v7;
  else
    v14 = CFSTR("Allowed");
  objc_msgSend(v11, "setPayloadInstallSecurityUpdate:", v14);

  return v11;
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

  +[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions allowedPayloadKeys](RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Download"), CFSTR("payloadDownload"), 0, CFSTR("Allowed"), a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("InstallOSUpdates"), CFSTR("payloadInstallOSUpdates"), 0, CFSTR("Allowed"), a5))
    {
      v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("InstallSecurityUpdate"), CFSTR("payloadInstallSecurityUpdate"), 0, CFSTR("Allowed"), a5);
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

  v4 = (void *)objc_opt_new();
  -[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions payloadDownload](self, "payloadDownload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Download"), v5, 0, CFSTR("Allowed"));

  -[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions payloadInstallOSUpdates](self, "payloadInstallOSUpdates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("InstallOSUpdates"), v6, 0, CFSTR("Allowed"));

  -[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions payloadInstallSecurityUpdate](self, "payloadInstallSecurityUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("InstallSecurityUpdate"), v7, 0, CFSTR("Allowed"));

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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions payloadDownload](self, "payloadDownload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadDownload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("Allowed");
  v19[1] = CFSTR("AlwaysOn");
  v19[2] = CFSTR("AlwaysOff");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineEnumLast:other:enums:](RMModelConfigurationBase, "combineEnumLast:other:enums:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions setPayloadDownload:](self, "setPayloadDownload:", v8);

  -[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions payloadInstallOSUpdates](self, "payloadInstallOSUpdates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadInstallOSUpdates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("Allowed");
  v18[1] = CFSTR("AlwaysOn");
  v18[2] = CFSTR("AlwaysOff");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineEnumLast:other:enums:](RMModelConfigurationBase, "combineEnumLast:other:enums:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions setPayloadInstallOSUpdates:](self, "setPayloadInstallOSUpdates:", v12);

  -[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions payloadInstallSecurityUpdate](self, "payloadInstallSecurityUpdate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadInstallSecurityUpdate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("Allowed");
  v17[1] = CFSTR("AlwaysOn");
  v17[2] = CFSTR("AlwaysOff");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineEnumLast:other:enums:](RMModelConfigurationBase, "combineEnumLast:other:enums:", v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions setPayloadInstallSecurityUpdate:](self, "setPayloadInstallSecurityUpdate:", v16);

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
  v12.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadDownload, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadInstallOSUpdates, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadInstallSecurityUpdate, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadDownload
{
  return self->_payloadDownload;
}

- (void)setPayloadDownload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadInstallOSUpdates
{
  return self->_payloadInstallOSUpdates;
}

- (void)setPayloadInstallOSUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadInstallSecurityUpdate
{
  return self->_payloadInstallSecurityUpdate;
}

- (void)setPayloadInstallSecurityUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadInstallSecurityUpdate, 0);
  objc_storeStrong((id *)&self->_payloadInstallOSUpdates, 0);
  objc_storeStrong((id *)&self->_payloadDownload, 0);
}

@end
