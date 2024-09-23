@implementation JSACalendar

+ (unint64_t)firstDayOfWeek
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v3 = objc_msgSend(v2, "firstWeekday");

  return (unint64_t)v3;
}

@end
