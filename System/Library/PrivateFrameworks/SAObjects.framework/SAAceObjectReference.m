@implementation SAAceObjectReference

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AceObjectReference");
}

+ (id)aceObjectReference
{
  return objc_alloc_init((Class)a1);
}

- (NSString)referenceIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("referenceIdentifier"));
}

- (void)setReferenceIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("referenceIdentifier"), a3);
}

- (NSString)referenceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("referenceType"));
}

- (void)setReferenceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("referenceType"), a3);
}

@end
