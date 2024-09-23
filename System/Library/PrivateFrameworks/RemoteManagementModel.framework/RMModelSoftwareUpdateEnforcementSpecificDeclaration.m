@implementation RMModelSoftwareUpdateEnforcementSpecificDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.softwareupdate.enforcement.specific");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("TargetOSVersion");
  v6[1] = CFSTR("TargetBuildVersion");
  v6[2] = CFSTR("TargetLocalDateTime");
  v6[3] = CFSTR("DetailsURL");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_opt_new();
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 targetOSVersion:(id)a4 targetBuildVersion:(id)a5 targetLocalDateTime:(id)a6 detailsURL:(id)a7
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
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.softwareupdate.enforcement.specific"));
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
  objc_msgSend(v16, "setPayloadTargetOSVersion:", v15);

  objc_msgSend(v16, "setPayloadTargetBuildVersion:", v14);
  objc_msgSend(v16, "setPayloadTargetLocalDateTime:", v13);

  objc_msgSend(v16, "setPayloadDetailsURL:", v12);
  objc_msgSend(v16, "updateServerToken");

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 targetOSVersion:(id)a4 targetLocalDateTime:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.softwareupdate.enforcement.specific"));
  if (v7)
  {
    objc_msgSend(v10, "setDeclarationIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeclarationIdentifier:", v12);

  }
  objc_msgSend(v10, "setPayloadTargetOSVersion:", v9);

  objc_msgSend(v10, "setPayloadTargetLocalDateTime:", v8);
  objc_msgSend(v10, "updateServerToken");

  return v10;
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
  v16[0] = &unk_25162A1E0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516266D0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516266E8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = &unk_25162A1F8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626700);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626718);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = &unk_25162A228;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626730);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626748);
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

  +[RMModelSoftwareUpdateEnforcementSpecificDeclaration allowedPayloadKeys](RMModelSoftwareUpdateEnforcementSpecificDeclaration, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("TargetOSVersion"), CFSTR("payloadTargetOSVersion"), 1, 0, a5))goto LABEL_5;
  v13 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("TargetBuildVersion"), CFSTR("payloadTargetBuildVersion"), 0, 0, a5))
  {
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("TargetLocalDateTime"), CFSTR("payloadTargetLocalDateTime"), 1, 0, a5))
    {
      v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("DetailsURL"), CFSTR("payloadDetailsURL"), 0, 0, a5);
      goto LABEL_6;
    }
LABEL_5:
    v13 = 0;
  }
LABEL_6:

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_opt_new();
  -[RMModelSoftwareUpdateEnforcementSpecificDeclaration payloadTargetOSVersion](self, "payloadTargetOSVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("TargetOSVersion"), v5, 1, 0);

  -[RMModelSoftwareUpdateEnforcementSpecificDeclaration payloadTargetBuildVersion](self, "payloadTargetBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("TargetBuildVersion"), v6, 0, 0);

  -[RMModelSoftwareUpdateEnforcementSpecificDeclaration payloadTargetLocalDateTime](self, "payloadTargetLocalDateTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("TargetLocalDateTime"), v7, 1, 0);

  -[RMModelSoftwareUpdateEnforcementSpecificDeclaration payloadDetailsURL](self, "payloadDetailsURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("DetailsURL"), v8, 0, 0);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
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
  v14.super_class = (Class)RMModelSoftwareUpdateEnforcementSpecificDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadTargetOSVersion, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadTargetBuildVersion, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_payloadTargetLocalDateTime, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSString copy](self->_payloadDetailsURL, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  return v4;
}

- (NSString)payloadTargetOSVersion
{
  return self->_payloadTargetOSVersion;
}

- (void)setPayloadTargetOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadTargetBuildVersion
{
  return self->_payloadTargetBuildVersion;
}

- (void)setPayloadTargetBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadTargetLocalDateTime
{
  return self->_payloadTargetLocalDateTime;
}

- (void)setPayloadTargetLocalDateTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)payloadDetailsURL
{
  return self->_payloadDetailsURL;
}

- (void)setPayloadDetailsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDetailsURL, 0);
  objc_storeStrong((id *)&self->_payloadTargetLocalDateTime, 0);
  objc_storeStrong((id *)&self->_payloadTargetBuildVersion, 0);
  objc_storeStrong((id *)&self->_payloadTargetOSVersion, 0);
}

@end
