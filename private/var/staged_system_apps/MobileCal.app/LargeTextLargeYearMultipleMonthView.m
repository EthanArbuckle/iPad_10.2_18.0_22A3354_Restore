@implementation LargeTextLargeYearMultipleMonthView

+ (unint64_t)numberOfMonthsPerRowForWindowSize:(CGSize)a3
{
  return +[LargeTextLargeYearMonthView numberOfMonthsPerRowForWindowSize:](LargeTextLargeYearMonthView, "numberOfMonthsPerRowForWindowSize:", a3.width, a3.height);
}

+ (Class)headerClass
{
  return (Class)objc_opt_class(LargeYearViewYearHeader);
}

+ (Class)monthClass
{
  return (Class)objc_opt_class(LargeTextLargeYearMonthView);
}

+ (double)leftMarginForWindowSize:(CGSize)a3
{
  double result;

  +[LargeTextLargeYearMonthView leftMarginForWindowSize:](LargeTextLargeYearMonthView, "leftMarginForWindowSize:", a3.width, a3.height);
  return result;
}

+ (double)rightMarginForWindowSize:(CGSize)a3
{
  double result;

  +[LargeTextLargeYearMonthView rightMarginForWindowSize:](LargeTextLargeYearMonthView, "rightMarginForWindowSize:", a3.width, a3.height);
  return result;
}

@end
