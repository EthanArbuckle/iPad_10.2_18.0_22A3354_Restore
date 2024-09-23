@implementation SAVCSContentDetailPage

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.videocontent");
}

- (id)encodedClassName
{
  return CFSTR("ContentDetailPage");
}

+ (id)contentDetailPage
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

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("image"));
}

- (void)setImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("image"), a3);
}

- (NSString)imagesJsonContentPayload
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("imagesJsonContentPayload"));
}

- (void)setImagesJsonContentPayload:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("imagesJsonContentPayload"), a3);
}

- (BOOL)isEvod
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isEvod"));
}

- (void)setIsEvod:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isEvod"), a3);
}

- (NSString)loadingText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("loadingText"));
}

- (void)setLoadingText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("loadingText"), a3);
}

- (int64_t)resultIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("resultIndex"));
}

- (void)setResultIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("resultIndex"), a3);
}

- (NSString)seasonId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("seasonId"));
}

- (void)setSeasonId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("seasonId"), a3);
}

- (NSString)showId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("showId"));
}

- (void)setShowId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("showId"), a3);
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("url"));
}

- (void)setUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("url"), a3);
}

- (BOOL)userDriven
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("userDriven"));
}

- (void)setUserDriven:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("userDriven"), a3);
}

- (NSString)utsId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utsId"));
}

- (void)setUtsId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utsId"), a3);
}

- (NSURL)utsSearchUrl
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("utsSearchUrl"));
}

- (void)setUtsSearchUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("utsSearchUrl"), a3);
}

@end
