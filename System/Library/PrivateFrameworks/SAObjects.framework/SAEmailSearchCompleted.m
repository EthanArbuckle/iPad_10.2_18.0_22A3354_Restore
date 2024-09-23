@implementation SAEmailSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.email");
}

- (id)encodedClassName
{
  return CFSTR("SearchCompleted");
}

+ (id)searchCompleted
{
  return objc_alloc_init((Class)a1);
}

+ (id)searchCompletedWithEmailResults:(id)a3
{
  id v3;
  SAEmailSearchCompleted *v4;

  v3 = a3;
  v4 = -[SAEmailSearchCompleted initWithEmailResults:]([SAEmailSearchCompleted alloc], "initWithEmailResults:", v3);

  return v4;
}

- (SAEmailSearchCompleted)initWithEmailResults:(id)a3
{
  id v4;
  SAEmailSearchCompleted *v5;
  SAEmailSearchCompleted *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SAEmailSearchCompleted setEmailResults:](v5, "setEmailResults:", v4);

  return v6;
}

- (NSArray)emailResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("emailResults"), v3);
}

- (void)setEmailResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("emailResults"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
