@implementation SASVInterpretationData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.vector");
}

- (id)encodedClassName
{
  return CFSTR("InterpretationData");
}

+ (id)interpretationData
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)tokenDataList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("tokenDataList"), v3);
}

- (void)setTokenDataList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("tokenDataList"), (uint64_t)a3);
}

@end
