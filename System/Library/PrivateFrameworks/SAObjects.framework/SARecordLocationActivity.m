@implementation SARecordLocationActivity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("RecordLocationActivity");
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("location"), a3);
}

- (NSString)sourceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sourceType"));
}

- (void)setSourceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sourceType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
