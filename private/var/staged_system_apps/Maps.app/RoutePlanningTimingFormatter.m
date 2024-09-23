@implementation RoutePlanningTimingFormatter

+ (id)formattingCalendar
{
  if (qword_1014D33C8 != -1)
    dispatch_once(&qword_1014D33C8, &stru_1011C70C8);
  return (id)qword_1014D33C0;
}

+ (id)textForTiming:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrivalDate"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrivalDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrivalTimeZone"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "arriveAtStringForDate:timeZone:", v6, v7));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "departureDate"));

    if (!v9)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[RoutePlanning][Timing] Now"), CFSTR("localized string not found"), 0));
      goto LABEL_6;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "departureDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "departureTimeZone"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "leaveByStringForDate:timeZone:", v6, v7));
  }
  v10 = (void *)v8;

LABEL_6:
  return v10;
}

+ (id)arriveAtStringForDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDate *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "formattingCalendar"));
  if ((objc_msgSend(v8, "_navigation_isDateInToday:inTimeZone:", v6, v7) & 1) != 0
    || (objc_msgSend(v6, "timeIntervalSinceNow"), v9 < 43200.0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:", v6, v7, 0, 1, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[RoutePlanning][Timing] Arrive by"), CFSTR("localized string not found"), 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10));
  }
  else
  {
    v14 = objc_opt_new(NSDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 5, v14, 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_navigation_offsetDate:toTimeZone:", v6, v7));
    v16 = objc_msgSend(v15, "compare:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:", v6, v7, 0, 1, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_navigation_offsetDate:toTimeZone:", v6, v7));
    if (v16 == (id)-1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_weekdayForDate:](NSDateFormatter, "_maps_weekdayForDate:", v17));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("[RoutePlanning][Timing] Arrive by this week");
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_numericMonthDayString:](NSDateFormatter, "_maps_numericMonthDayString:", v17));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("[RoutePlanning][Timing] Arrive by after this week");
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v20, CFSTR("localized string not found"), 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v12, v11));

  }
  return v13;
}

+ (id)leaveByStringForDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDate *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "formattingCalendar"));
  if ((objc_msgSend(v8, "_navigation_isDateInToday:inTimeZone:", v6, v7) & 1) != 0
    || (objc_msgSend(v6, "timeIntervalSinceNow"), v9 < 43200.0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:", v6, v7, 0, 1, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[RoutePlanning][Timing] Leave at"), CFSTR("localized string not found"), 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10));
  }
  else
  {
    v14 = objc_opt_new(NSDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 5, v14, 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_navigation_offsetDate:toTimeZone:", v6, v7));
    v16 = objc_msgSend(v15, "compare:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:", v6, v7, 0, 1, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_navigation_offsetDate:toTimeZone:", v6, v7));
    if (v16 == (id)-1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_weekdayForDate:](NSDateFormatter, "_maps_weekdayForDate:", v17));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("[RoutePlanning][Timing] Leave at this week");
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_numericMonthDayString:](NSDateFormatter, "_maps_numericMonthDayString:", v17));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("[RoutePlanning][Timing] Leave at after this week");
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v20, CFSTR("localized string not found"), 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v12, v11));

  }
  return v13;
}

@end
