@implementation SSSystemVersionCondition

- (BOOL)evaluateWithContext:(id)a3
{
  void *v4;
  id value;
  unint64_t v6;

  v4 = (void *)objc_msgSend(a3, "systemVersion");
  if (!v4)
    return 0;
  value = self->super._value;
  if (!value)
    return 0;
  v6 = SSCompareProductVersions(v4, value);
  return ConditionResultForComparisonResult(v6, self->super._operator);
}

@end
