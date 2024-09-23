@implementation SAUIUpdateViews

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("UpdateViews");
}

+ (id)updateViews
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)views
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("views"), v3);
}

- (void)setViews:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("views"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
