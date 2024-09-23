@implementation SASetHomeContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetHomeContext");
}

- (BOOL)byPassServerFlow
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("byPassServerFlow"));
}

- (void)setByPassServerFlow:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("byPassServerFlow"), a3);
}

- (NSArray)currentHomes
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("currentHomes"), v3);
}

- (void)setCurrentHomes:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("currentHomes"), (uint64_t)a3);
}

- (NSArray)entities
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("entities"), v3);
}

- (void)setEntities:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("entities"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
