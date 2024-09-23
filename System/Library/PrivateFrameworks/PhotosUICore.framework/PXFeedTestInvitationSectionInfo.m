@implementation PXFeedTestInvitationSectionInfo

- (int64_t)sectionType
{
  return 2;
}

- (id)sharedAlbum
{
  return objc_alloc_init(TestPLCloudSharedAlbum);
}

@end
