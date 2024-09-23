@implementation SAUINanoImageResource

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("NanoImageResource");
}

+ (id)nanoImageResource
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)backgroundNeeded
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("backgroundNeeded"));
}

- (void)setBackgroundNeeded:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("backgroundNeeded"), a3);
}

- (NSString)imageDownloadType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("imageDownloadType"));
}

- (void)setImageDownloadType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("imageDownloadType"), a3);
}

- (SAUIDecoratedText)monogram
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("monogram"));
}

- (void)setMonogram:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("monogram"), a3);
}

- (NSString)placeholderImage
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("placeholderImage"));
}

- (void)setPlaceholderImage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("placeholderImage"), a3);
}

@end
