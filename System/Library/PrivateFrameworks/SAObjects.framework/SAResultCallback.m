@implementation SAResultCallback

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ResultCallback");
}

+ (id)resultCallback
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)code
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("code"));
}

- (void)setCode:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("code"), a3);
}

- (NSArray)commandReferences
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("commandReferences"));
}

- (void)setCommandReferences:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("commandReferences"), a3);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

@end
