@implementation PXFeedAlbumCreatedSectionInfo

- (int64_t)sectionType
{
  return 5;
}

- (void)updateFromCloudFeedEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXFeedAlbumCreatedSectionInfo;
  -[PXFeedSectionInfo updateFromCloudFeedEntry](&v7, sel_updateFromCloudFeedEntry);
  -[PXFeedSectionInfo cloudFeedEntry](self, "cloudFeedEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryAlbumGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionInfo sharedAlbumWithGUID:](self, "sharedAlbumWithGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionInfo setNumberOfItems:](self, "setNumberOfItems:", 0);
  -[PXFeedSectionInfo setShouldBeVisibleWhenEmpty:](self, "setShouldBeVisibleWhenEmpty:", 1);
  -[PXFeedSectionInfo setSharedAlbum:](self, "setSharedAlbum:", v5);
  -[PXFeedSectionInfo setAlbumTitle:](self, "setAlbumTitle:", v6);

}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 3;
}

- (BOOL)isMine
{
  return 1;
}

@end
