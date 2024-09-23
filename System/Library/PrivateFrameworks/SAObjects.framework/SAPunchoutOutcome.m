@implementation SAPunchoutOutcome

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PunchoutOutcome");
}

+ (id)punchoutOutcome
{
  return objc_alloc_init((Class)a1);
}

- (NSString)originalCommandId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("originalCommandId"));
}

- (void)setOriginalCommandId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("originalCommandId"), a3);
}

- (NSDictionary)outcomes
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("outcomes"));
}

- (void)setOutcomes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("outcomes"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
