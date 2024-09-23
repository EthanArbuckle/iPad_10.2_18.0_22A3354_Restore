@implementation NSURL(SBFFileCache)

- (id)fileCacheStableDataRepresentation
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
