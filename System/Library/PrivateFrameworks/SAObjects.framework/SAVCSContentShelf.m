@implementation SAVCSContentShelf

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.videocontent");
}

- (id)encodedClassName
{
  return CFSTR("ContentShelf");
}

+ (id)contentShelf
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)contentHead
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("contentHead"), v3);
}

- (void)setContentHead:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("contentHead"), (uint64_t)a3);
}

- (NSArray)fetchMoreResultsCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("fetchMoreResultsCommands"), &unk_1EE77C568);
}

- (void)setFetchMoreResultsCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("fetchMoreResultsCommands"), (uint64_t)a3);
}

- (int64_t)preSelectedItem
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("preSelectedItem"));
}

- (void)setPreSelectedItem:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("preSelectedItem"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("url"));
}

- (void)setUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("url"), a3);
}

@end
