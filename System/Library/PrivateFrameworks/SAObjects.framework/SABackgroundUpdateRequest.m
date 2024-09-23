@implementation SABackgroundUpdateRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("BackgroundUpdateRequest");
}

+ (id)backgroundUpdateRequest
{
  return objc_alloc_init((Class)a1);
}

- (SAAceSerializable)attachment
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("attachment"));
}

- (void)setAttachment:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("attachment"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
