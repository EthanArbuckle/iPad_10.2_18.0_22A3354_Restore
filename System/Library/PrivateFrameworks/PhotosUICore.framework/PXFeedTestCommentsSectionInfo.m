@implementation PXFeedTestCommentsSectionInfo

- (int64_t)sectionType
{
  return 1;
}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 1;
}

- (id)commentForItemAtIndex:(int64_t)a3
{
  return objc_alloc_init(TestPLCloudSharedComment);
}

@end
