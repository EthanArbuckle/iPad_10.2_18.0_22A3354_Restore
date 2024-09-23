@implementation SASmsGroupSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sms");
}

- (id)encodedClassName
{
  return CFSTR("GroupSearch");
}

+ (id)groupSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSString)smsGroupName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("smsGroupName"));
}

- (void)setSmsGroupName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("smsGroupName"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
