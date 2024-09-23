@implementation SASTHeroImageItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("HeroImageItem");
}

+ (id)heroImageItem
{
  return objc_alloc_init((Class)a1);
}

- (SADecoratedString)caption
{
  return (SADecoratedString *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("caption"));
}

- (void)setCaption:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("caption"), a3);
}

- (NSString)position
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("position"));
}

- (void)setPosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("position"), a3);
}

- (SAUINanoImageResource)watchImageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("watchImageResource"));
}

- (void)setWatchImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("watchImageResource"), a3);
}

@end
