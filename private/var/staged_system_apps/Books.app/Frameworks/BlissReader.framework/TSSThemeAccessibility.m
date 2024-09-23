@implementation TSSThemeAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSSTheme");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSArray)tsaxOrderedShapeDescriptions
{
  NSArray *result;
  _QWORD v3[15];

  result = (NSArray *)qword_543858;
  if (!qword_543858)
  {
    v3[0] = TSAccessibilityLocalizedString((uint64_t)CFSTR("Line"));
    v3[1] = TSAccessibilityLocalizedString((uint64_t)CFSTR("LineArrow"));
    v3[2] = TSAccessibilityLocalizedString((uint64_t)CFSTR("ConnectionLine"));
    v3[3] = TSAccessibilityLocalizedString((uint64_t)CFSTR("Square"));
    v3[4] = TSAccessibilityLocalizedString((uint64_t)CFSTR("RoundRect"));
    v3[5] = TSAccessibilityLocalizedString((uint64_t)CFSTR("Circle"));
    v3[6] = TSAccessibilityLocalizedString((uint64_t)CFSTR("Triangle"));
    v3[7] = TSAccessibilityLocalizedString((uint64_t)CFSTR("Isosceles"));
    v3[8] = TSAccessibilityLocalizedString((uint64_t)CFSTR("Arrow"));
    v3[9] = TSAccessibilityLocalizedString((uint64_t)CFSTR("DoubleArrow"));
    v3[10] = TSAccessibilityLocalizedString((uint64_t)CFSTR("Diamond"));
    v3[11] = TSAccessibilityLocalizedString((uint64_t)CFSTR("RoundQuoteBubble"));
    v3[12] = TSAccessibilityLocalizedString((uint64_t)CFSTR("BoxQuoteBubble"));
    v3[13] = TSAccessibilityLocalizedString((uint64_t)CFSTR("Pentagon"));
    v3[14] = TSAccessibilityLocalizedString((uint64_t)CFSTR("Star"));
    result = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 15);
    qword_543858 = (uint64_t)result;
  }
  return result;
}

- (NSArray)tsaxOrderedTableDescriptions
{
  NSArray *result;
  _QWORD v3[4];

  result = (NSArray *)qword_543860;
  if (!qword_543860)
  {
    v3[0] = TSAccessibilityLocalizedString((uint64_t)CFSTR("table.headers"));
    v3[1] = TSAccessibilityLocalizedString((uint64_t)CFSTR("table.basic"));
    v3[2] = TSAccessibilityLocalizedString((uint64_t)CFSTR("table.plain"));
    v3[3] = TSAccessibilityLocalizedString((uint64_t)CFSTR("table.sums"));
    result = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 4);
    qword_543860 = (uint64_t)result;
  }
  return result;
}

- (NSArray)tsaxOrderedTableHelps
{
  NSArray *result;
  _QWORD v3[4];

  result = (NSArray *)qword_543868;
  if (!qword_543868)
  {
    v3[0] = TSAccessibilityLocalizedString((uint64_t)CFSTR("table.headers.help"));
    v3[1] = TSAccessibilityLocalizedString((uint64_t)CFSTR("table.basic.help"));
    v3[2] = TSAccessibilityLocalizedString((uint64_t)CFSTR("table.plain.help"));
    v3[3] = TSAccessibilityLocalizedString((uint64_t)CFSTR("table.sums.help"));
    result = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 4);
    qword_543868 = (uint64_t)result;
  }
  return result;
}

- (NSArray)tsaxOrderedTextboxDescriptions
{
  NSArray *result;
  _QWORD v3[6];

  result = (NSArray *)qword_543870;
  if (!qword_543870)
  {
    v3[0] = TSAccessibilityLocalizedString((uint64_t)CFSTR("textbox.body"));
    v3[1] = TSAccessibilityLocalizedString((uint64_t)CFSTR("textbox.title"));
    v3[2] = TSAccessibilityLocalizedString((uint64_t)CFSTR("textbox.heading"));
    v3[3] = TSAccessibilityLocalizedString((uint64_t)CFSTR("textbox.heading.alternate"));
    v3[4] = TSAccessibilityLocalizedString((uint64_t)CFSTR("textbox.caption"));
    v3[5] = TSAccessibilityLocalizedString((uint64_t)CFSTR("textbox.list"));
    result = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 6);
    qword_543870 = (uint64_t)result;
  }
  return result;
}

@end
