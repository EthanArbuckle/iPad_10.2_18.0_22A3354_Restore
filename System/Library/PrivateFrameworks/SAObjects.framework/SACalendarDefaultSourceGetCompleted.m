@implementation SACalendarDefaultSourceGetCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.calendar");
}

- (id)encodedClassName
{
  return CFSTR("DefaultSourceGetCompleted");
}

+ (id)defaultSourceGetCompleted
{
  return objc_alloc_init((Class)a1);
}

+ (id)defaultSourceGetCompletedWithAceCalendarSource:(id)a3
{
  id v3;
  SACalendarDefaultSourceGetCompleted *v4;

  v3 = a3;
  v4 = -[SACalendarDefaultSourceGetCompleted initWithAceCalendarSource:]([SACalendarDefaultSourceGetCompleted alloc], "initWithAceCalendarSource:", v3);

  return v4;
}

- (SACalendarDefaultSourceGetCompleted)initWithAceCalendarSource:(id)a3
{
  id v4;
  SACalendarDefaultSourceGetCompleted *v5;
  SACalendarDefaultSourceGetCompleted *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SACalendarDefaultSourceGetCompleted setAceCalendarSource:](v5, "setAceCalendarSource:", v4);

  return v6;
}

- (SACalendarSource)aceCalendarSource
{
  return (SACalendarSource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("aceCalendarSource"));
}

- (void)setAceCalendarSource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("aceCalendarSource"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
