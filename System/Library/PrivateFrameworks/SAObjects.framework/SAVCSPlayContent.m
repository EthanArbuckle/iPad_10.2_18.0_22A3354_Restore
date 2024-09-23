@implementation SAVCSPlayContent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.videocontent");
}

- (id)encodedClassName
{
  return CFSTR("PlayContent");
}

+ (id)playContent
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

- (NSURL)lowresTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("lowresTrailerUri"));
}

- (void)setLowresTrailerUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("lowresTrailerUri"), a3);
}

- (BOOL)playTrailer
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("playTrailer"));
}

- (void)setPlayTrailer:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("playTrailer"), a3);
}

- (NSString)utsId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utsId"));
}

- (void)setUtsId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utsId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
