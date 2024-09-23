@implementation NSDateFormatter

+ (id)_maps_timeForDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1014D2838;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D2838, &stru_1011BA890);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2830, "stringFromDate:", v4));

  return v5;
}

+ (id)_maps_timeForDate:(id)a3 timeZone:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;

  v5 = qword_1014D2848;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&qword_1014D2848, &stru_1011BA8B0);
  objc_msgSend((id)qword_1014D2840, "setTimeZone:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2840, "stringFromDate:", v7));
  return v8;
}

+ (id)_maps_abbreviatedWeekdayForDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1014D2858;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D2858, &stru_1011BA8D0);
  objc_msgSend((id)qword_1014D2850, "setLocalizedDateFormatFromTemplate:", CFSTR("E"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2850, "stringFromDate:", v4));

  return v5;
}

+ (id)_maps_weekdayForDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1014D2868;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D2868, &stru_1011BA8F0);
  objc_msgSend((id)qword_1014D2860, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2860, "stringFromDate:", v4));

  return v5;
}

+ (id)_maps_dateStringWithoutYearForDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1014D2878;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D2878, &stru_1011BA910);
  objc_msgSend((id)qword_1014D2870, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMMd"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2870, "stringFromDate:", v4));

  return v5;
}

+ (id)_maps_abbreviatedDateStringWithoutYearForDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1014D2888;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D2888, &stru_1011BA930);
  objc_msgSend((id)qword_1014D2880, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMd"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2880, "stringFromDate:", v4));

  return v5;
}

+ (id)_maps_numericMonthDayString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1014D2898;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D2898, &stru_1011BA950);
  objc_msgSend((id)qword_1014D2890, "setLocalizedDateFormatFromTemplate:", CFSTR("Md"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2890, "stringFromDate:", v4));

  return v5;
}

@end
