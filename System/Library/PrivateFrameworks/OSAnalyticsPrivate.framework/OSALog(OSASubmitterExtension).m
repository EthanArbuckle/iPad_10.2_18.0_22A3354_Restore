@implementation OSALog(OSASubmitterExtension)

- (id)getFilenames
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "filepath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
