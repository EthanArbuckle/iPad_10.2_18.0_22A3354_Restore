@implementation RMModelAssetUserIdentityDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.asset.useridentity");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("FullName");
  v6[1] = CFSTR("EmailAddress");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 fullName:(id)a4 emailAddress:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.asset.useridentity"));
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
  objc_msgSend(v10, "setPayloadFullName:", v9);

  objc_msgSend(v10, "setPayloadEmailAddress:", v8);
  objc_msgSend(v10, "updateServerToken");

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.asset.useridentity"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerToken");

  return v4;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[6];
  _QWORD v29[8];

  v29[6] = *MEMORY[0x24BDAC8D0];
  v28[0] = &unk_251629790;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625410);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625428);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v28[1] = &unk_2516297A8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625440);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625458);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  v28[2] = &unk_2516297C0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625470);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625488);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  v28[3] = &unk_2516297D8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516254A0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516254B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v4;
  v28[4] = &unk_2516297F0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516254D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516254E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v7;
  v28[5] = &unk_251629808;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625500);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625518);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
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

  +[RMModelAssetUserIdentityDeclaration allowedPayloadKeys](RMModelAssetUserIdentityDeclaration, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("FullName"), CFSTR("payloadFullName"), 0, 0, a5))
  {
    v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("EmailAddress"), CFSTR("payloadEmailAddress"), 0, 0, a5);
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[RMModelAssetUserIdentityDeclaration payloadFullName](self, "payloadFullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("FullName"), v5, 0, 0);

  -[RMModelAssetUserIdentityDeclaration payloadEmailAddress](self, "payloadEmailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("EmailAddress"), v6, 0, 0);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
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
  v10.super_class = (Class)RMModelAssetUserIdentityDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadFullName, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadEmailAddress, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  return v4;
}

- (NSString)payloadFullName
{
  return self->_payloadFullName;
}

- (void)setPayloadFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadEmailAddress
{
  return self->_payloadEmailAddress;
}

- (void)setPayloadEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEmailAddress, 0);
  objc_storeStrong((id *)&self->_payloadFullName, 0);
}

@end
