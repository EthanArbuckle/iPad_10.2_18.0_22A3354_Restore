@implementation SAURIHandoffPayload

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("URIHandoffPayload");
}

+ (id)uRIHandoffPayload
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)link
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("link"));
}

- (void)setLink:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("link"), a3);
}

@end
