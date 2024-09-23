@implementation SAMPOrder

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("Order");
}

+ (id)order
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)descending
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("descending"));
}

- (void)setDescending:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("descending"), a3);
}

- (NSString)mediaItemProperty
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mediaItemProperty"));
}

- (void)setMediaItemProperty:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mediaItemProperty"), a3);
}

@end
