@implementation SASSpeechEndpointIdentified

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SpeechEndpointIdentified");
}

+ (id)speechEndpointIdentified
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)endpointTimestamp
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endpointTimestamp"));
}

- (void)setEndpointTimestamp:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endpointTimestamp"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
