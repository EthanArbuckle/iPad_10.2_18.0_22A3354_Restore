@implementation SAAndCondition

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AndCondition");
}

+ (id)andCondition
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)conditions
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("conditions"), &unk_1EE7AA138);
}

- (void)setConditions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("conditions"), (uint64_t)a3);
}

@end
