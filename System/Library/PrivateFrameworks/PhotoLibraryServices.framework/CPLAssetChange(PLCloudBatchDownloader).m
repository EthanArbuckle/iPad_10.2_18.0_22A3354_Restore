@implementation CPLAssetChange(PLCloudBatchDownloader)

- (uint64_t)qualifiesForDeviceLibraryConfiguration:()PLCloudBatchDownloader sharingScopeIdentifier:mainScopeIdentifier:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "scopedIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scopeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v9);

  if (v12)
  {
    objc_msgSend(a1, "sharingScopeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a3 == 2)
    {
      v15 = v13 == 0;
    }
    else if (a3 == 1)
    {
      v15 = objc_msgSend(v13, "isEqualToString:", v8);
    }
    else
    {
      v15 = 1;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

@end
