@implementation SAStartBackgroundActionRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StartBackgroundActionRequest");
}

+ (id)startBackgroundActionRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)backgroundAction
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("backgroundAction"));
}

- (void)setBackgroundAction:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("backgroundAction"), a3);
}

- (SAAceSerializable)backgroundActionPayload
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("backgroundActionPayload"));
}

- (void)setBackgroundActionPayload:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("backgroundActionPayload"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
