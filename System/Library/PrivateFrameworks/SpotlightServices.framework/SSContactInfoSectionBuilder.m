@implementation SSContactInfoSectionBuilder

+ (id)supportedBundleId
{
  return CFSTR("com.apple.spotlight.contactInfo");
}

- (id)buildBridgedResult
{
  void *v2;
  void *v3;

  -[SSContactEntitySectionBuilder contactResultBuilder](self, "contactResultBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildFooterResultForEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
