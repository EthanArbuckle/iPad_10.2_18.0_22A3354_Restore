@implementation SAABPersonPicker

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.contact");
}

- (id)encodedClassName
{
  return CFSTR("PersonPicker");
}

+ (id)personPicker
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)persons
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("persons"), v3);
}

- (void)setPersons:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("persons"), (uint64_t)a3);
}

- (BOOL)showImmediately
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("showImmediately"));
}

- (void)setShowImmediately:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("showImmediately"), a3);
}

@end
