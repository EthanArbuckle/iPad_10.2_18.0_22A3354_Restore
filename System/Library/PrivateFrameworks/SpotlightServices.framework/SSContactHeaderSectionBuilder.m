@implementation SSContactHeaderSectionBuilder

+ (id)supportedBundleId
{
  return CFSTR("com.apple.spotlight.contactHeader");
}

- (id)buildBridgedResult
{
  void *v2;
  void *v3;

  -[SSContactEntitySectionBuilder contactResultBuilder](self, "contactResultBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildHeaderResultForEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
