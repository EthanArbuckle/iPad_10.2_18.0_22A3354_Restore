@implementation SAUIRequestUpdateViews

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("RequestUpdateViews");
}

+ (id)requestUpdateViews
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77BFF0);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (NSNumber)timeInSeconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeInSeconds"));
}

- (void)setTimeInSeconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeInSeconds"), a3);
}

- (NSArray)viewIds
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("viewIds"));
}

- (void)setViewIds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("viewIds"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
