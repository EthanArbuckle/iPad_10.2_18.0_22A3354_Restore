@implementation RMModelScreenSharingConnectionGroupDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.screensharing.connection.group");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ConnectionGroupUUID");
  v6[1] = CFSTR("GroupName");
  v6[2] = CFSTR("Members");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
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

+ (id)buildWithIdentifier:(id)a3 connectionGroupUUID:(id)a4 groupName:(id)a5 members:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.screensharing.connection.group"));
  if (v9)
  {
    objc_msgSend(v13, "setDeclarationIdentifier:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDeclarationIdentifier:", v15);

  }
  objc_msgSend(v13, "setPayloadConnectionGroupUUID:", v12);

  objc_msgSend(v13, "setPayloadGroupName:", v11);
  objc_msgSend(v13, "setPayloadMembers:", v10);

  objc_msgSend(v13, "updateServerToken");
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 connectionGroupUUID:(id)a4 groupName:(id)a5 members:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.screensharing.connection.group"));
  if (v9)
  {
    objc_msgSend(v13, "setDeclarationIdentifier:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDeclarationIdentifier:", v15);

  }
  objc_msgSend(v13, "setPayloadConnectionGroupUUID:", v12);

  objc_msgSend(v13, "setPayloadGroupName:", v11);
  objc_msgSend(v13, "setPayloadMembers:", v10);

  objc_msgSend(v13, "updateServerToken");
  return v13;
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
  _QWORD v7[2];
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = &unk_251629F28;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626268);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626280);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

  +[RMModelScreenSharingConnectionGroupDeclaration allowedPayloadKeys](RMModelScreenSharingConnectionGroupDeclaration, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ConnectionGroupUUID"), CFSTR("payloadConnectionGroupUUID"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("GroupName"), CFSTR("payloadGroupName"), 1, 0, a5)&& -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self,
          "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:",
          v7,
          CFSTR("Members"),
          CFSTR("payloadMembers"),
          &__block_literal_global_17,
          1,
          0,
          a5);

  return v13;
}

uint64_t __100__RMModelScreenSharingConnectionGroupDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[RMModelScreenSharingConnectionGroupDeclaration payloadConnectionGroupUUID](self, "payloadConnectionGroupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ConnectionGroupUUID"), v5, 1, 0);

  -[RMModelScreenSharingConnectionGroupDeclaration payloadGroupName](self, "payloadGroupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("GroupName"), v6, 1, 0);

  -[RMModelScreenSharingConnectionGroupDeclaration payloadMembers](self, "payloadMembers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("Members"), v7, &__block_literal_global_30, 1, 0);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

id __75__RMModelScreenSharingConnectionGroupDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
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
  v12.super_class = (Class)RMModelScreenSharingConnectionGroupDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadConnectionGroupUUID, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_payloadGroupName, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSArray copy](self->_payloadMembers, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)payloadConnectionGroupUUID
{
  return self->_payloadConnectionGroupUUID;
}

- (void)setPayloadConnectionGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadGroupName
{
  return self->_payloadGroupName;
}

- (void)setPayloadGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)payloadMembers
{
  return self->_payloadMembers;
}

- (void)setPayloadMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadMembers, 0);
  objc_storeStrong((id *)&self->_payloadGroupName, 0);
  objc_storeStrong((id *)&self->_payloadConnectionGroupUUID, 0);
}

@end
