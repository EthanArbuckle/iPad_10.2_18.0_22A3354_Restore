@implementation SAAceListResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AceListResult");
}

+ (id)aceListResult
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)result
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("result"), &unk_1EE77BF00);
}

- (void)setResult:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("result"), (uint64_t)a3);
}

@end
