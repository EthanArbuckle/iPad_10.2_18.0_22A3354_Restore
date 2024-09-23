@implementation SALogStringEvent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("LogStringEvent");
}

+ (id)logStringEvent
{
  return objc_alloc_init((Class)a1);
}

- (NSString)eventName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eventName"));
}

- (void)setEventName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eventName"), a3);
}

- (NSString)eventValue
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eventValue"));
}

- (void)setEventValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eventValue"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
