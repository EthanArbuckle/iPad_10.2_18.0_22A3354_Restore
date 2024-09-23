@implementation WFRemoteQuarantineAsset

+ (NSString)recordType
{
  return (NSString *)CFSTR("RemoteQuarantineAsset");
}

+ (NSDictionary)properties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("compatibilityVersion");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("contentVersion");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("assetData");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC4A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:", CFSTR("assetDataFile"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("configuration");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (CKRecordID)identifier
{
  return self->identifier;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->_compatibilityVersion = a3;
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(int64_t)a3
{
  self->_contentVersion = a3;
}

- (WFFileRepresentation)assetDataFile
{
  return self->_assetDataFile;
}

- (void)setAssetDataFile:(id)a3
{
  objc_storeStrong((id *)&self->_assetDataFile, a3);
}

- (NSString)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_assetDataFile, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
