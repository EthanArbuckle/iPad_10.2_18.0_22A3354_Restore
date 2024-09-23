@implementation SACalendarEventSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.calendar");
}

- (id)encodedClassName
{
  return CFSTR("EventSearchCompleted");
}

+ (id)eventSearchCompleted
{
  return objc_alloc_init((Class)a1);
}

+ (id)eventSearchCompletedWithResults:(id)a3
{
  id v3;
  SACalendarEventSearchCompleted *v4;

  v3 = a3;
  v4 = -[SACalendarEventSearchCompleted initWithResults:]([SACalendarEventSearchCompleted alloc], "initWithResults:", v3);

  return v4;
}

- (SACalendarEventSearchCompleted)initWithResults:(id)a3
{
  id v4;
  SACalendarEventSearchCompleted *v5;
  SACalendarEventSearchCompleted *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SACalendarEventSearchCompleted setResults:](v5, "setResults:", v4);

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
