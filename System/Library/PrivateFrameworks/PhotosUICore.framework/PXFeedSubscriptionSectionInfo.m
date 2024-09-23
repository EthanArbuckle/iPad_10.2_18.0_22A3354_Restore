@implementation PXFeedSubscriptionSectionInfo

- (int64_t)sectionType
{
  return 3;
}

- (void)updateFromCloudFeedEntry
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXFeedSubscriptionSectionInfo;
  -[PXFeedAssetsSectionInfo updateFromCloudFeedEntry](&v5, sel_updateFromCloudFeedEntry);
  -[PXFeedSectionInfo sharedAlbum](self, "sharedAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PXFeedSectionInfo cloudFeedEntry](self, "cloudFeedEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("no shared album for subscription section info %@, entry %@"), self, v4);

  }
  -[PXFeedSectionInfo setShouldBeVisibleWhenEmpty:](self, "setShouldBeVisibleWhenEmpty:", v3 != 0);
}

- (BOOL)isMine
{
  return 1;
}

@end
