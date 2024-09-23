@implementation PHAWallpaperDemoDescriptorConfig

- (PHAWallpaperDemoDescriptorConfig)initWithDictionary:(id)a3
{
  id v4;
  PHAWallpaperDemoDescriptorConfig *v5;
  uint64_t v6;
  NSString *assetUUID;
  uint64_t v8;
  NSString *styleCategory;
  uint64_t v10;
  NSString *titleKey;
  PHAWallpaperDemoDescriptorConfig *v12;

  v4 = a3;
  v5 = -[PHAWallpaperDemoDescriptorConfig init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AssetUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetUUID = v5->_assetUUID;
    v5->_assetUUID = (NSString *)v6;

    if (!v5->_assetUUID)
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StyleCategory"));
    v8 = objc_claimAutoreleasedReturnValue();
    styleCategory = v5->_styleCategory;
    v5->_styleCategory = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TitleKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v10;

  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (void)setAssetUUID:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUID, a3);
}

- (NSString)styleCategory
{
  return self->_styleCategory;
}

- (void)setStyleCategory:(id)a3
{
  objc_storeStrong((id *)&self->_styleCategory, a3);
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
  objc_storeStrong((id *)&self->_titleKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_styleCategory, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

@end
