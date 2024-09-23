@implementation SAMPSetOutputSource

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("SetOutputSource");
}

+ (id)setOutputSource
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)outputSourceId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("outputSourceId"));
}

- (void)setOutputSourceId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("outputSourceId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
