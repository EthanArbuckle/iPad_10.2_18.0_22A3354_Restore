@implementation SAClientFlowState

+ (id)deliveryDeadline
{
  return CFSTR("CUSTOM");
}

+ (id)persistencePolicy
{
  return CFSTR("LIFE_OF_USER_DATA");
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ClientFlowState");
}

+ (id)clientFlowState
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)cachedDomainClassJavascriptChecksumMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("cachedDomainClassJavascriptChecksumMap"));
}

- (void)setCachedDomainClassJavascriptChecksumMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("cachedDomainClassJavascriptChecksumMap"), a3);
}

@end
