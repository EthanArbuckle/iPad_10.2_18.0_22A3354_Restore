@implementation SAAceResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AceResult");
}

+ (id)aceResult
{
  return objc_alloc_init((Class)a1);
}

- (SAAceSerializable)result
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("result"));
}

- (void)setResult:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("result"), a3);
}

@end
