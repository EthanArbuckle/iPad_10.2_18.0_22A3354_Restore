@implementation SALogNumericEvent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("LogNumericEvent");
}

+ (id)logNumericEvent
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

- (NSString)eventOperation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eventOperation"));
}

- (void)setEventOperation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eventOperation"), a3);
}

- (NSNumber)eventValue
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eventValue"));
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
