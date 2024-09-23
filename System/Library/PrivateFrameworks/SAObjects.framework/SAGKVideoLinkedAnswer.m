@implementation SAGKVideoLinkedAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("VideoLinkedAnswer");
}

+ (id)videoLinkedAnswer
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)runtimeInMilliseconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("runtimeInMilliseconds"));
}

- (void)setRuntimeInMilliseconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("runtimeInMilliseconds"), a3);
}

@end
