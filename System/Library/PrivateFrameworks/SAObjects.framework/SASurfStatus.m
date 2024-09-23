@implementation SASurfStatus

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SurfStatus");
}

+ (id)surfStatus
{
  return objc_alloc_init((Class)a1);
}

- (NSString)currentState
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("currentState"));
}

- (void)setCurrentState:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("currentState"), a3);
}

@end
