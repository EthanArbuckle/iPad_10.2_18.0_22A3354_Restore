@implementation SALocalSearchOperationHours

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("OperationHours");
}

+ (id)operationHours
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)operationPeriods
{
  return (NSDictionary *)AceObjectProtocolArrayDictionaryForProperty(self, (uint64_t)CFSTR("operationPeriods"), &unk_1EE7A2308);
}

- (void)setOperationPeriods:(id)a3
{
  AceObjectSetAceObjectArrayDictionaryForProperty(self, CFSTR("operationPeriods"), a3);
}

@end
