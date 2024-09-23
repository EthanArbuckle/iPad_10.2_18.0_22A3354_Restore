@implementation LargeYearMultipleMonthView

+ (Class)headerClass
{
  return (Class)objc_opt_class(LargeYearViewYearHeader);
}

+ (Class)monthClass
{
  return (Class)objc_opt_class(LargeYearMonthView);
}

@end
