@implementation SAPhoneCallStarted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("CallStarted");
}

+ (id)callStarted
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)phoneLogId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("phoneLogId"));
}

- (void)setPhoneLogId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("phoneLogId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
