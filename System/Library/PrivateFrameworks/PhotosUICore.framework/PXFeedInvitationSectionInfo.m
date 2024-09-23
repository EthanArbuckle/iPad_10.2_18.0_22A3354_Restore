@implementation PXFeedInvitationSectionInfo

- (int64_t)sectionType
{
  return 2;
}

- (void)updateFromCloudFeedEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXFeedInvitationSectionInfo;
  -[PXFeedSectionInfo updateFromCloudFeedEntry](&v8, sel_updateFromCloudFeedEntry);
  -[PXFeedSectionInfo cloudFeedEntry](self, "cloudFeedEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryAlbumGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionInfo sharedAlbumWithGUID:](self, "sharedAlbumWithGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = 1;
  }
  else
  {
    NSLog(CFSTR("no shared album for invitation section info %@, entry %@"), self, v3);
    v7 = 0;
  }
  -[PXFeedSectionInfo setNumberOfItems:](self, "setNumberOfItems:", v7);
  -[PXFeedSectionInfo setSharedAlbum:](self, "setSharedAlbum:", v5);
  -[PXFeedSectionInfo setAlbumTitle:](self, "setAlbumTitle:", v6);

}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 4;
}

@end
