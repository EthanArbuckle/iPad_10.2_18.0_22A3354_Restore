@implementation SAUserTokenStatus

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("UserTokenStatus");
}

- (NSNumber)errorCode
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("errorCode"));
}

- (void)setErrorCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("errorCode"), a3);
}

- (NSNumber)lastUpdateAttemptTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastUpdateAttemptTime"));
}

- (void)setLastUpdateAttemptTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastUpdateAttemptTime"), a3);
}

- (NSNumber)shouldExcludeFromBackgroundRefresh
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("shouldExcludeFromBackgroundRefresh"));
}

- (void)setShouldExcludeFromBackgroundRefresh:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("shouldExcludeFromBackgroundRefresh"), a3);
}

@end
