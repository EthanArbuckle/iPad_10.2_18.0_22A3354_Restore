@implementation PISegmentationContextInfo

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (int64_t)sourceMode
{
  return self->_sourceMode;
}

- (void)setSourceMode:(int64_t)a3
{
  self->_sourceMode = a3;
}

- (BOOL)segmentationDisabled
{
  return self->_segmentationDisabled;
}

- (void)setSegmentationDisabled:(BOOL)a3
{
  self->_segmentationDisabled = a3;
}

- (int64_t)infillAlgorithm
{
  return self->_infillAlgorithm;
}

- (void)setInfillAlgorithm:(int64_t)a3
{
  self->_infillAlgorithm = a3;
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setLayoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConfiguration, a3);
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
}

+ (id)currentContextInfo
{
  id v3;
  void *v4;
  void *v5;

  if (currentContextInfo_onceToken != -1)
    dispatch_once(&currentContextInfo_onceToken, &__block_literal_global_610);
  v3 = objc_alloc_init((Class)a1);
  objc_msgSend(v3, "setVersion:", 50);
  objc_msgSend(v3, "setSystemName:", currentContextInfo_systemName);
  objc_msgSend(v3, "setSystemVersion:", currentContextInfo_systemVersion);
  objc_msgSend(v3, "setSystemBuildVersion:", currentContextInfo_systemBuildVersion);
  objc_msgSend(v3, "setSourceMode:", 0);
  objc_msgSend(v3, "setSegmentationDisabled:", 0);
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInfillAlgorithm:", objc_msgSend(v4, "segmentationInfillAlgorithm"));

  objc_msgSend(MEMORY[0x1E0D75340], "deviceConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutConfiguration:", v5);

  return v3;
}

void __47__PISegmentationContextInfo_currentContextInfo__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = _CFCopySystemVersionDictionaryValue();
  v1 = (void *)currentContextInfo_systemName;
  currentContextInfo_systemName = v0;

  v2 = _CFCopySystemVersionDictionaryValue();
  v3 = (void *)currentContextInfo_systemVersion;
  currentContextInfo_systemVersion = v2;

  v4 = _CFCopySystemVersionDictionaryValue();
  v5 = (void *)currentContextInfo_systemBuildVersion;
  currentContextInfo_systemBuildVersion = v4;

}

@end
