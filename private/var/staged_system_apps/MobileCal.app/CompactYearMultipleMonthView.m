@implementation CompactYearMultipleMonthView

+ (Class)headerClass
{
  return (Class)objc_opt_class(CompactYearViewYearHeader);
}

+ (Class)monthClass
{
  return (Class)objc_opt_class(CompactYearMonthView);
}

- (double)leftMarginAdjustment
{
  uint64_t v2;
  double result;

  v2 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, a2);
  result = 0.0;
  if (v2 == 32)
    return -3.0;
  return result;
}

- (double)rightMarginAdjustment
{
  uint64_t v2;
  double result;

  v2 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, a2);
  result = 0.0;
  if (v2 == 32)
    return -3.0;
  return result;
}

@end
