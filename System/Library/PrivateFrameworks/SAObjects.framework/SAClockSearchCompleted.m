@implementation SAClockSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clock");
}

- (id)encodedClassName
{
  return CFSTR("SearchCompleted");
}

+ (id)searchCompleted
{
  return objc_alloc_init((Class)a1);
}

+ (id)searchCompletedWithResults:(id)a3
{
  id v3;
  SAClockSearchCompleted *v4;

  v3 = a3;
  v4 = -[SAClockSearchCompleted initWithResults:]([SAClockSearchCompleted alloc], "initWithResults:", v3);

  return v4;
}

- (SAClockSearchCompleted)initWithResults:(id)a3
{
  id v4;
  SAClockSearchCompleted *v5;
  SAClockSearchCompleted *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SAClockSearchCompleted setResults:](v5, "setResults:", v4);

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
