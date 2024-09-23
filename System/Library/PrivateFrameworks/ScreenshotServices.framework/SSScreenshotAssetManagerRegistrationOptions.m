@implementation SSScreenshotAssetManagerRegistrationOptions

- (NSString)assetDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;

  if (_SSLinksInPhotosEnabled())
  {
    -[SSScreenshotAssetManagerRegistrationOptions harvestedMetadata](self, "harvestedMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v9 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v4, "userActivityTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userActivityURL");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
    {
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_24D06C520);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&stru_24D06C520, "stringByAppendingFormat:", CFSTR("Title: %@"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
LABEL_6:

LABEL_9:
        return (NSString *)v9;
      }
    }
    else
    {
      v9 = &stru_24D06C520;
      if (!v6)
        goto LABEL_6;
    }
    objc_msgSend(v7, "absoluteURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("\nURL: %@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v11;
    goto LABEL_6;
  }
  v9 = 0;
  return (NSString *)v9;
}

- (unint64_t)saveLocation
{
  return self->_saveLocation;
}

- (void)setSaveLocation:(unint64_t)a3
{
  self->_saveLocation = a3;
}

- (SSUIServiceOptionsAssetMetadata)assetMetadata
{
  return self->_assetMetadata;
}

- (void)setAssetMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (void)setApplicationBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)harvestedMetadata
{
  return self->_harvestedMetadata;
}

- (void)setHarvestedMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvestedMetadata, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
}

@end
