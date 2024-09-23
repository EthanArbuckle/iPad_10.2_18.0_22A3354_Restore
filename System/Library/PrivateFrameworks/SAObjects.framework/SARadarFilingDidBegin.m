@implementation SARadarFilingDidBegin

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.radar");
}

- (id)encodedClassName
{
  return CFSTR("FilingDidBegin");
}

+ (id)filingDidBegin
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
