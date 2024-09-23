@implementation SASyncGetCachedSyncAnchorsResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("GetCachedSyncAnchorsResponse");
}

+ (id)getCachedSyncAnchorsResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)anchors
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("anchors"), v3);
}

- (void)setAnchors:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("anchors"), (uint64_t)a3);
}

- (NSString)interactionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interactionId"));
}

- (void)setInteractionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interactionId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
