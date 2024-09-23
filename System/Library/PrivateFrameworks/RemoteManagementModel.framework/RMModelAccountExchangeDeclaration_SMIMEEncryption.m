@implementation RMModelAccountExchangeDeclaration_SMIMEEncryption

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Enabled");
  v6[1] = CFSTR("IdentityAssetReference");
  v6[2] = CFSTR("UserOverrideable");
  v6[3] = CFSTR("IdentityUserOverrideable");
  v6[4] = CFSTR("PerMessageSwitchEnabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 identityAssetReference:(id)a4 userOverrideable:(id)a5 identityUserOverrideable:(id)a6 perMessageSwitchEnabled:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setPayloadEnabled:", v15);

  objc_msgSend(v16, "setPayloadIdentityAssetReference:", v14);
  v17 = (void *)MEMORY[0x24BDBD1C0];
  if (v13)
    v18 = v13;
  else
    v18 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v16, "setPayloadUserOverrideable:", v18);

  if (v12)
    v19 = v12;
  else
    v19 = v17;
  objc_msgSend(v16, "setPayloadIdentityUserOverrideable:", v19);

  if (v11)
    v20 = v11;
  else
    v20 = v17;
  objc_msgSend(v16, "setPayloadPerMessageSwitchEnabled:", v20);

  return v16;
}

+ (id)buildRequiredOnlyWithEnabled:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadEnabled:", v3);

  return v4;
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

  +[RMModelAccountExchangeDeclaration_SMIMEEncryption allowedPayloadKeys](RMModelAccountExchangeDeclaration_SMIMEEncryption, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Enabled"), CFSTR("payloadEnabled"), 1, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("IdentityAssetReference"), CFSTR("payloadIdentityAssetReference"), 0, 0, a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("UserOverrideable"), CFSTR("payloadUserOverrideable"), 0, MEMORY[0x24BDBD1C0], a5))
      {
        v13 = 0;
        if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("IdentityUserOverrideable"), CFSTR("payloadIdentityUserOverrideable"), 0, MEMORY[0x24BDBD1C0], a5))
        {
          v13 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PerMessageSwitchEnabled"), CFSTR("payloadPerMessageSwitchEnabled"), 0, MEMORY[0x24BDBD1C0], a5);
        }
      }
    }
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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_opt_new();
  -[RMModelAccountExchangeDeclaration_SMIMEEncryption payloadEnabled](self, "payloadEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Enabled"), v5, 1, 0);

  -[RMModelAccountExchangeDeclaration_SMIMEEncryption payloadIdentityAssetReference](self, "payloadIdentityAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("IdentityAssetReference"), v6, 0, 0);

  -[RMModelAccountExchangeDeclaration_SMIMEEncryption payloadUserOverrideable](self, "payloadUserOverrideable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDBD1C0];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("UserOverrideable"), v7, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelAccountExchangeDeclaration_SMIMEEncryption payloadIdentityUserOverrideable](self, "payloadIdentityUserOverrideable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("IdentityUserOverrideable"), v9, 0, v8);

  -[RMModelAccountExchangeDeclaration_SMIMEEncryption payloadPerMessageSwitchEnabled](self, "payloadPerMessageSwitchEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PerMessageSwitchEnabled"), v10, 0, v8);

  v11 = (void *)objc_msgSend(v4, "copy");
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
  v16.super_class = (Class)RMModelAccountExchangeDeclaration_SMIMEEncryption;
  v4 = -[RMModelPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadEnabled, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadIdentityAssetReference, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadUserOverrideable, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadIdentityUserOverrideable, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadPerMessageSwitchEnabled, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSNumber)payloadEnabled
{
  return self->_payloadEnabled;
}

- (void)setPayloadEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadIdentityAssetReference
{
  return self->_payloadIdentityAssetReference;
}

- (void)setPayloadIdentityAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadUserOverrideable
{
  return self->_payloadUserOverrideable;
}

- (void)setPayloadUserOverrideable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadIdentityUserOverrideable
{
  return self->_payloadIdentityUserOverrideable;
}

- (void)setPayloadIdentityUserOverrideable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadPerMessageSwitchEnabled
{
  return self->_payloadPerMessageSwitchEnabled;
}

- (void)setPayloadPerMessageSwitchEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPerMessageSwitchEnabled, 0);
  objc_storeStrong((id *)&self->_payloadIdentityUserOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadUserOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
}

@end
