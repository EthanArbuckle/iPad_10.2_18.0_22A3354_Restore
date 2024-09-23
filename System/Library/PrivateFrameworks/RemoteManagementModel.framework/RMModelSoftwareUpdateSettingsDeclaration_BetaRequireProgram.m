@implementation RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Description");
  v6[1] = CFSTR("Token");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDescription:(id)a3 token:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadDescription:", v6);

  objc_msgSend(v7, "setPayloadToken:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithDescription:(id)a3 token:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadDescription:", v6);

  objc_msgSend(v7, "setPayloadToken:", v5);
  return v7;
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

  +[RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram allowedPayloadKeys](RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Description"), CFSTR("payloadDescription"), 1, 0, a5))
  {
    v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Token"), CFSTR("payloadToken"), 1, 0, a5);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram payloadDescription](self, "payloadDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Description"), v5, 1, 0);

  -[RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram payloadToken](self, "payloadToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Token"), v6, 1, 0);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
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
  -[RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram payloadDescription](self, "payloadDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineFirst:other:](RMModelConfigurationBase, "combineFirst:other:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram setPayloadDescription:](self, "setPayloadDescription:", v7);

  -[RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram payloadToken](self, "payloadToken");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelConfigurationBase combineFirst:other:](RMModelConfigurationBase, "combineFirst:other:", v10, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram setPayloadToken:](self, "setPayloadToken:", v9);

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
  v10.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadDescription, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadToken, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadToken
{
  return self->_payloadToken;
}

- (void)setPayloadToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadToken, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
}

@end
