@implementation SAVCSVendResultsToSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.videocontent");
}

- (id)encodedClassName
{
  return CFSTR("VendResultsToSearch");
}

+ (id)vendResultsToSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)shelves
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("shelves"), v3);
}

- (void)setShelves:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("shelves"), (uint64_t)a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
