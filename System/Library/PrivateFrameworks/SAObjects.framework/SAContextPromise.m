@implementation SAContextPromise

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ContextPromise");
}

+ (id)contextPromise
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)promiseTypes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("promiseTypes"));
}

- (void)setPromiseTypes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("promiseTypes"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
