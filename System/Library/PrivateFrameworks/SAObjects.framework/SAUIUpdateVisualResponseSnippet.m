@implementation SAUIUpdateVisualResponseSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("UpdateVisualResponseSnippet");
}

- (NSData)stateData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("stateData"));
}

- (void)setStateData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("stateData"), a3);
}

- (NSString)viewId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("viewId"));
}

- (void)setViewId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("viewId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
