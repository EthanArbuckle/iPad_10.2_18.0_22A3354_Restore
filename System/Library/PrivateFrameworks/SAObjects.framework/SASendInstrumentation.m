@implementation SASendInstrumentation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SendInstrumentation");
}

+ (id)sendInstrumentation
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)eventTransmittedRelativeToBootTimeTimestampNs
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eventTransmittedRelativeToBootTimeTimestampNs"));
}

- (void)setEventTransmittedRelativeToBootTimeTimestampNs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eventTransmittedRelativeToBootTimeTimestampNs"), a3);
}

- (NSString)eventTransmittedTimestampRefId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eventTransmittedTimestampRefId"));
}

- (void)setEventTransmittedTimestampRefId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eventTransmittedTimestampRefId"), a3);
}

- (NSArray)instrumentationBatch
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("instrumentationBatch"));
}

- (void)setInstrumentationBatch:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("instrumentationBatch"), a3);
}

- (NSString)payloadVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("payloadVersion"));
}

- (void)setPayloadVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("payloadVersion"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
