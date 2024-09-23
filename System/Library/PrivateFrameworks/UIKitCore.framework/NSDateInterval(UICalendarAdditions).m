@implementation NSDateInterval(UICalendarAdditions)

- (id)_ui_dateInRangeForDate:()UICalendarAdditions
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(a1, "containsDate:", v4))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(a1, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "compare:", v6);

    if (v7 == 1)
      objc_msgSend(a1, "endDate");
    else
      objc_msgSend(a1, "startDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;

  return v8;
}

- (BOOL)_ui_containsMonth:()UICalendarAdditions
{
  return -[NSDateInterval _intersectsDateComponents:accuracy:](a1, a3, 8);
}

- (BOOL)_ui_containsDay:()UICalendarAdditions
{
  return -[NSDateInterval _intersectsDateComponents:accuracy:](a1, a3, 16);
}

@end
