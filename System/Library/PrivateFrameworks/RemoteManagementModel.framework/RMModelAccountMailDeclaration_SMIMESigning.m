@implementation RMModelAccountMailDeclaration_SMIMESigning

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Enabled");
  v6[1] = CFSTR("IdentityAssetReference");
  v6[2] = CFSTR("UserOverrideable");
  v6[3] = CFSTR("IdentityUserOverrideable");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 identityAssetReference:(id)a4 userOverrideable:(id)a5 identityUserOverrideable:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadEnabled:", v12);

  objc_msgSend(v13, "setPayloadIdentityAssetReference:", v11);
  v14 = (void *)MEMORY[0x24BDBD1C0];
  if (v10)
    v15 = v10;
  else
    v15 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v13, "setPayloadUserOverrideable:", v15);

  if (v9)
    v16 = v9;
  else
    v16 = v14;
  objc_msgSend(v13, "setPayloadIdentityUserOverrideable:", v16);

  return v13;
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

  +[RMModelAccountMailDeclaration_SMIMESigning allowedPayloadKeys](RMModelAccountMailDeclaration_SMIMESigning, "allowedPayloadKeys");
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
        v13 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("IdentityUserOverrideable"), CFSTR("payloadIdentityUserOverrideable"), 0, MEMORY[0x24BDBD1C0], a5);
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

  v4 = (void *)objc_opt_new();
  -[RMModelAccountMailDeclaration_SMIMESigning payloadEnabled](self, "payloadEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Enabled"), v5, 1, 0);

  -[RMModelAccountMailDeclaration_SMIMESigning payloadIdentityAssetReference](self, "payloadIdentityAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("IdentityAssetReference"), v6, 0, 0);

  -[RMModelAccountMailDeclaration_SMIMESigning payloadUserOverrideable](self, "payloadUserOverrideable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDBD1C0];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("UserOverrideable"), v7, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelAccountMailDeclaration_SMIMESigning payloadIdentityUserOverrideable](self, "payloadIdentityUserOverrideable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("IdentityUserOverrideable"), v9, 0, v8);

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
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
  v14.super_class = (Class)RMModelAccountMailDeclaration_SMIMESigning;
  v4 = -[RMModelPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIdentityUserOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadUserOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
}

@end
