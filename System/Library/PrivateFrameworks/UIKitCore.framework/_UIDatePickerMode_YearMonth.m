@implementation _UIDatePickerMode_YearMonth

+ (int64_t)datePickerMode
{
  return 4;
}

+ (unint64_t)extractableCalendarUnits
{
  return 12;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  if (a3 == 8)
    return 4;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  if (a3 == 4)
    return 8;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)localizedFormatString
{
  NSString *localizedFormatString;
  void *v4;
  void *v5;

  localizedFormatString = self->super.super._localizedFormatString;
  if (!localizedFormatString)
  {
    -[_UIDatePickerMode locale](self, "locale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDatePickerDateFormatFromTemplate(CFSTR("MMMMy"), v4, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerMode setLocalizedFormatString:](self, "setLocalizedFormatString:", v5);
    localizedFormatString = self->super.super._localizedFormatString;
  }
  return localizedFormatString;
}

@end
