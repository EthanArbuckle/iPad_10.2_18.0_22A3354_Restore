@implementation SAWebVideoResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.websearch");
}

- (id)encodedClassName
{
  return CFSTR("VideoResult");
}

+ (id)videoResult
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)runTimeInMilliseconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("runTimeInMilliseconds"));
}

- (void)setRunTimeInMilliseconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("runTimeInMilliseconds"), a3);
}

@end
