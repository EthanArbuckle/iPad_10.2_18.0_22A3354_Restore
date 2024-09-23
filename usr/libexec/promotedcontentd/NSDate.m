@implementation NSDate

- (id)yearDayOfYearHourMinute
{
  if (qword_100269A38 != -1)
    dispatch_once(&qword_100269A38, &stru_100215988);
  return objc_msgSend((id)qword_100269A30, "stringFromDate:", self);
}

- (BOOL)isBefore:(id)a3
{
  return -[NSDate compare:](self, "compare:", a3) == NSOrderedAscending;
}

- (id)yearDayOfYearHourMinuteSecond
{
  if (qword_100269A48 != -1)
    dispatch_once(&qword_100269A48, &stru_1002159A8);
  return objc_msgSend((id)qword_100269A40, "stringFromDate:", self);
}

- (BOOL)isAfter:(id)a3
{
  return (id)-[NSDate compare:](self, "compare:", a3) == (id)1;
}

- (BOOL)isEarlierThan:(id)a3
{
  return -[NSDate compare:](self, "compare:", a3) == NSOrderedAscending;
}

@end
