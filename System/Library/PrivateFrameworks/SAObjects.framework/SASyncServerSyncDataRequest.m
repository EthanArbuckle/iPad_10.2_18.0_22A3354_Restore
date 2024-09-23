@implementation SASyncServerSyncDataRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("ServerSyncDataRequest");
}

- (NSString)assistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("assistantId"));
}

- (void)setAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("assistantId"), a3);
}

- (NSString)clientGeneration
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("clientGeneration"));
}

- (void)setClientGeneration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("clientGeneration"), a3);
}

- (NSString)syncType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("syncType"));
}

- (void)setSyncType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("syncType"), a3);
}

- (NSString)syncToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("syncToken"));
}

- (void)setSyncToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("syncToken"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
