@implementation RMModelDiskManagementSettingsDeclaration_Restrictions

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ExternalStorage");
  v6[1] = CFSTR("NetworkStorage");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithExternalStorage:(id)a3 networkStorage:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadExternalStorage:", v6);

  objc_msgSend(v7, "setPayloadNetworkStorage:", v5);
  return v7;
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

  +[RMModelDiskManagementSettingsDeclaration_Restrictions allowedPayloadKeys](RMModelDiskManagementSettingsDeclaration_Restrictions, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ExternalStorage"), CFSTR("payloadExternalStorage"), 0, 0, a5))
  {
    v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("NetworkStorage"), CFSTR("payloadNetworkStorage"), 0, 0, a5);
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
  -[RMModelDiskManagementSettingsDeclaration_Restrictions payloadExternalStorage](self, "payloadExternalStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ExternalStorage"), v5, 0, 0);

  -[RMModelDiskManagementSettingsDeclaration_Restrictions payloadNetworkStorage](self, "payloadNetworkStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("NetworkStorage"), v6, 0, 0);

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
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RMModelDiskManagementSettingsDeclaration_Restrictions payloadExternalStorage](self, "payloadExternalStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadExternalStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("Allowed");
  v14[1] = CFSTR("ReadOnly");
  v14[2] = CFSTR("Disallowed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineEnumLast:other:enums:](RMModelConfigurationBase, "combineEnumLast:other:enums:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelDiskManagementSettingsDeclaration_Restrictions setPayloadExternalStorage:](self, "setPayloadExternalStorage:", v8);

  -[RMModelDiskManagementSettingsDeclaration_Restrictions payloadNetworkStorage](self, "payloadNetworkStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadNetworkStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = CFSTR("Allowed");
  v13[1] = CFSTR("ReadOnly");
  v13[2] = CFSTR("Disallowed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineEnumLast:other:enums:](RMModelConfigurationBase, "combineEnumLast:other:enums:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelDiskManagementSettingsDeclaration_Restrictions setPayloadNetworkStorage:](self, "setPayloadNetworkStorage:", v12);

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
  v10.super_class = (Class)RMModelDiskManagementSettingsDeclaration_Restrictions;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadExternalStorage, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadNetworkStorage, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadExternalStorage
{
  return self->_payloadExternalStorage;
}

- (void)setPayloadExternalStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadNetworkStorage
{
  return self->_payloadNetworkStorage;
}

- (void)setPayloadNetworkStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNetworkStorage, 0);
  objc_storeStrong((id *)&self->_payloadExternalStorage, 0);
}

@end
