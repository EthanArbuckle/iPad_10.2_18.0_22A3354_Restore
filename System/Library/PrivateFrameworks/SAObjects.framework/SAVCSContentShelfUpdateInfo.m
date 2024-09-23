@implementation SAVCSContentShelfUpdateInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.videocontent");
}

- (id)encodedClassName
{
  return CFSTR("ContentShelfUpdateInfo");
}

+ (id)contentShelfUpdateInfo
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)pageNumber
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("pageNumber"));
}

- (void)setPageNumber:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("pageNumber"), a3);
}

- (NSString)targetShelfViewId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("targetShelfViewId"));
}

- (void)setTargetShelfViewId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("targetShelfViewId"), a3);
}

- (NSString)targetViewId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("targetViewId"));
}

- (void)setTargetViewId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("targetViewId"), a3);
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
