@implementation SAABPersonSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.contact");
}

- (id)encodedClassName
{
  return CFSTR("PersonSearchCompleted");
}

+ (id)personSearchCompleted
{
  return objc_alloc_init((Class)a1);
}

+ (id)personSearchCompletedWithResults:(id)a3
{
  id v3;
  SAABPersonSearchCompleted *v4;

  v3 = a3;
  v4 = -[SAABPersonSearchCompleted initWithResults:]([SAABPersonSearchCompleted alloc], "initWithResults:", v3);

  return v4;
}

- (SAABPersonSearchCompleted)initWithResults:(id)a3
{
  id v4;
  SAABPersonSearchCompleted *v5;
  SAABPersonSearchCompleted *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SAABPersonSearchCompleted setResults:](v5, "setResults:", v4);

  return v6;
}

- (NSArray)results
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("results"), v3);
}

- (void)setResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("results"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
