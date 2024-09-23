@implementation NSString(SBFFileCache)

- (uint64_t)fileCacheStableDataRepresentation
{
  return objc_msgSend(a1, "dataUsingEncoding:", 4);
}

@end
