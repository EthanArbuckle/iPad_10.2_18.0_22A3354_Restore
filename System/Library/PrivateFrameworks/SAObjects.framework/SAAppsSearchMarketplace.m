@implementation SAAppsSearchMarketplace

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.apps");
}

- (id)encodedClassName
{
  return CFSTR("SearchMarketplace");
}

- (NSString)keyword
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("keyword"));
}

- (void)setKeyword:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("keyword"), a3);
}

- (NSString)marketplace
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("marketplace"));
}

- (void)setMarketplace:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("marketplace"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
