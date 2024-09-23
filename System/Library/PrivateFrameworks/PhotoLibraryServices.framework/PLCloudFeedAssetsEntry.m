@implementation PLCloudFeedAssetsEntry

- (NSMutableOrderedSet)mutableEntryAssets
{
  return (NSMutableOrderedSet *)-[PLCloudFeedAssetsEntry mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("entryAssets"));
}

- (BOOL)shouldBeRemovedFromPhotoLibrary:(id)a3
{
  unsigned __int8 v4;
  int64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLCloudFeedAssetsEntry;
  v4 = -[PLCloudFeedEntry shouldBeRemovedFromPhotoLibrary:](&v8, sel_shouldBeRemovedFromPhotoLibrary_, a3);
  v5 = -[PLCloudFeedEntry entryType](self, "entryType");
  if ((v4 & 1) == 0 && v5 != 4)
  {
    -[PLCloudFeedAssetsEntry entryAssets](self, "entryAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "count") == 0;

  }
  return v4;
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLCloudFeedAssetsEntry;
  -[PLCloudFeedEntry willSave](&v7, sel_willSave);
  -[PLCloudFeedAssetsEntry managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLCloudFeedAssetsEntry changedValues](self, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entryAssets"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "delayedSaveActions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordCloudFeedAssetsEntryForAssetUpdate:", self);

    }
  }

}

+ (id)entityName
{
  return CFSTR("CloudFeedAssetsEntry");
}

@end
