@implementation RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("configuration-identifier");
  v6[1] = CFSTR("asset-identifier");
  v6[2] = CFSTR("asset-server-token");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithConfigurationIdentifier:(id)a3 assetIdentifier:(id)a4 assetServerToken:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setStatusConfigurationIdentifier:", v9);

  objc_msgSend(v10, "setStatusAssetIdentifier:", v8);
  objc_msgSend(v10, "setStatusAssetServerToken:", v7);

  return v10;
}

+ (id)buildRequiredOnlyWithConfigurationIdentifier:(id)a3 assetIdentifier:(id)a4 assetServerToken:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setStatusConfigurationIdentifier:", v9);

  objc_msgSend(v10, "setStatusAssetIdentifier:", v8);
  objc_msgSend(v10, "setStatusAssetServerToken:", v7);

  return v10;
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

  +[RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement allowedStatusKeys](RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement, "allowedStatusKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("configuration-identifier"), CFSTR("statusConfigurationIdentifier"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("asset-identifier"), CFSTR("statusAssetIdentifier"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
          "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
          v7,
          CFSTR("asset-server-token"),
          CFSTR("statusAssetServerToken"),
          1,
          0,
          a5);

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
  -[RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement statusConfigurationIdentifier](self, "statusConfigurationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("configuration-identifier"), v5, 1, 0);

  -[RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement statusAssetIdentifier](self, "statusAssetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("asset-identifier"), v6, 1, 0);

  -[RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement statusAssetServerToken](self, "statusAssetServerToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("asset-server-token"), v7, 1, 0);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
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
  v12.super_class = (Class)RMModelStatusServicesBackgroundTask_LaunchdDeviceManagement;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusConfigurationIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_statusAssetIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_statusAssetServerToken, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)statusConfigurationIdentifier
{
  return self->_statusConfigurationIdentifier;
}

- (void)setStatusConfigurationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)statusAssetIdentifier
{
  return self->_statusAssetIdentifier;
}

- (void)setStatusAssetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)statusAssetServerToken
{
  return self->_statusAssetServerToken;
}

- (void)setStatusAssetServerToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusAssetServerToken, 0);
  objc_storeStrong((id *)&self->_statusAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_statusConfigurationIdentifier, 0);
}

@end
