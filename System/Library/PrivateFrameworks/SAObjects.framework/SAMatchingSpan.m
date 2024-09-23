@implementation SAMatchingSpan

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("MatchingSpan");
}

+ (id)matchingSpan
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)domainObjectIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("domainObjectIdentifier"));
}

- (void)setDomainObjectIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("domainObjectIdentifier"), a3);
}

- (int64_t)endIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("endIndex"));
}

- (void)setEndIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("endIndex"), a3);
}

- (int64_t)startIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("startIndex"));
}

- (void)setStartIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("startIndex"), a3);
}

@end
