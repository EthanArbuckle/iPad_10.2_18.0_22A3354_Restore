@implementation SAHAActionRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("ActionRequest");
}

+ (id)actionRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)actions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("actions"), v3);
}

- (void)setActions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("actions"), (uint64_t)a3);
}

- (int64_t)executionOrder
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("executionOrder"));
}

- (void)setExecutionOrder:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("executionOrder"), a3);
}

- (SAHAFilter)filter
{
  return (SAHAFilter *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("filter"));
}

- (void)setFilter:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("filter"), a3);
}

@end
