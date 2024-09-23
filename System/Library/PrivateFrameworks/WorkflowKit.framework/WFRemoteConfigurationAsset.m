@implementation WFRemoteConfigurationAsset

+ (NSString)recordType
{
  return (NSString *)CFSTR("RemoteConfigurationAsset");
}

+ (NSDictionary)properties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("shortVersion");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("assetType");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("assetData");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC4A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:", CFSTR("assetDataFile"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("buildNumber");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("configuration");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (CKRecordID)identifier
{
  return self->identifier;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_assetType, a3);
}

- (NSString)shortVersion
{
  return self->_shortVersion;
}

- (void)setShortVersion:(id)a3
{
  objc_storeStrong((id *)&self->_shortVersion, a3);
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

- (NSNumber)buildNumber
{
  return self->_buildNumber;
}

- (void)setBuildNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_assetDataFile, 0);
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
