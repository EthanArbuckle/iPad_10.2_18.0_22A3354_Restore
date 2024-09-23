@implementation NSDate

- (id)startDayOfWeek
{
  id v3;
  id v4;

  v3 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v4 = objc_msgSend(v3, "components:fromDate:", 8196, self);
  objc_msgSend(v4, "setWeekday:", 1);
  return objc_msgSend(v3, "dateFromComponents:", v4);
}

- (int64_t)daysToDate:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSDateComponents day](-[NSCalendar components:fromDate:toDate:options:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:toDate:options:", 16, self, a3, 0), "day");
  if (v3 >= 0)
    v4 = v3;
  else
    v4 = -v3;
  return v4 + 1;
}

@end
