@implementation SASmsDraftShow

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sms");
}

- (id)encodedClassName
{
  return CFSTR("DraftShow");
}

+ (id)draftShow
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)smsIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("smsIdentifier"));
}

- (void)setSmsIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("smsIdentifier"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
