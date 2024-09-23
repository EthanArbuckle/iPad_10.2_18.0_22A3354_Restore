@implementation SADeviceCarDNDHintContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.device");
}

- (id)encodedClassName
{
  return CFSTR("CarDNDHintContext");
}

+ (id)carDNDHintContext
{
  return objc_alloc_init((Class)a1);
}

- (NSString)utteranceDomainIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utteranceDomainIdentifier"));
}

- (void)setUtteranceDomainIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utteranceDomainIdentifier"), a3);
}

@end
