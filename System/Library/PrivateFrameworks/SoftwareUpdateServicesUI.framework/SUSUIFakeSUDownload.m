@implementation SUSUIFakeSUDownload

- (id)descriptor
{
  return objc_alloc_init(SUSUIFakeSUDescriptor);
}

- (id)metadata
{
  return objc_alloc_init(SUSUIFakeSUDownloadMetadata);
}

- (id)progress
{
  return objc_alloc_init(SUSUIFakeSUOperationProgress);
}

@end
