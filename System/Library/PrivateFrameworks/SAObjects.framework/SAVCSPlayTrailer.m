@implementation SAVCSPlayTrailer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.videocontent");
}

- (id)encodedClassName
{
  return CFSTR("PlayTrailer");
}

+ (id)playTrailer
{
  return objc_alloc_init((Class)a1);
}

- (NSString)contentType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentType"));
}

- (void)setContentType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentType"), a3);
}

- (NSURL)hiresTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("hiresTrailerUri"));
}

- (void)setHiresTrailerUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("hiresTrailerUri"), a3);
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("image"));
}

- (void)setImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("image"), a3);
}

- (NSURL)lowresTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("lowresTrailerUri"));
}

- (void)setLowresTrailerUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("lowresTrailerUri"), a3);
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("url"));
}

- (void)setUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("url"), a3);
}

- (NSString)utsId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utsId"));
}

- (void)setUtsId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utsId"), a3);
}

@end
