@implementation SADialogInflectWordResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.dialog");
}

- (id)encodedClassName
{
  return CFSTR("InflectWordResponse");
}

+ (id)inflectWordResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSString)print
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("print"));
}

- (void)setPrint:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("print"), a3);
}

- (NSString)speak
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speak"));
}

- (void)setSpeak:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speak"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
