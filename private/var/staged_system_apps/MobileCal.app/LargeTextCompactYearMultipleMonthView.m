@implementation LargeTextCompactYearMultipleMonthView

+ (Class)headerClass
{
  return (Class)objc_opt_class(LargeTextCompactYearViewYearHeader);
}

+ (Class)monthClass
{
  return (Class)objc_opt_class(LargeTextCompactYearMonthView);
}

+ (double)leftMarginForWindowSize:(CGSize)a3
{
  double result;

  +[LargeTextCompactYearMonthView leftMarginForWindowSize:](LargeTextCompactYearMonthView, "leftMarginForWindowSize:", a3.width, a3.height);
  return result;
}

+ (double)rightMarginForWindowSize:(CGSize)a3
{
  double result;

  +[LargeTextCompactYearMonthView rightMarginForWindowSize:](LargeTextCompactYearMonthView, "rightMarginForWindowSize:", a3.width, a3.height);
  return result;
}

@end
