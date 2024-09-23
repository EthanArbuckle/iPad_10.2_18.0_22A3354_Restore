@implementation NSDate

+ (id)_maps_dateDescriptionShort:(BOOL)a3 timeZone:(id)a4 bookingDate:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void **block;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  const char *v26;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  if (qword_1014D3390 != -1)
    dispatch_once(&qword_1014D3390, &stru_1011C7088);
  objc_msgSend((id)qword_1014D3388, "setTimeZone:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _maps_dayDescriptionStringShortDescription:timeZone:bookingDate:](NSDate, "_maps_dayDescriptionStringShortDescription:timeZone:bookingDate:", v6, v7, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3388, "stringFromDate:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsInTimeZone:fromDate:", v7, v8));

  if (objc_msgSend(v12, "hour") == (id)1)
  {
    if (!v6)
      goto LABEL_11;
    goto LABEL_8;
  }
  v13 = objc_msgSend(v12, "hour");
  if (v6)
  {
    if (v13 != (id)13)
    {
      block = _NSConcreteStackBlock;
      v23 = 3221225472;
      v24 = sub_1007B9B80;
      v25 = &unk_1011ACF48;
      v26 = "NSDate+RestaurantReservationDescriptionHelper";
      if (qword_1014D33B0 != -1)
        dispatch_once(&qword_1014D33B0, &block);
      v14 = (void *)qword_1014D33A8;
      v15 = CFSTR("reservation_date_at_time_key_not_at_1");
      goto LABEL_17;
    }
LABEL_8:
    block = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_1007B9B80;
    v25 = &unk_1011ACF48;
    v26 = "NSDate+RestaurantReservationDescriptionHelper";
    if (qword_1014D33B0 != -1)
      dispatch_once(&qword_1014D33B0, &block);
    v14 = (void *)qword_1014D33A8;
    v15 = CFSTR("reservation_date_at_time_key_at_1");
LABEL_17:
    v16 = CFSTR("%1$@ at %2$@<unlocalized>");
    goto LABEL_18;
  }
LABEL_11:
  block = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_1007B9B80;
  v25 = &unk_1011ACF48;
  v26 = "NSDate+RestaurantReservationDescriptionHelper";
  if (qword_1014D33B0 != -1)
    dispatch_once(&qword_1014D33B0, &block);
  v14 = (void *)qword_1014D33A8;
  v15 = CFSTR("reservation_date_at_time_short_key");
  v16 = CFSTR("%1$@, %2$@<unlocalized>");
LABEL_18:
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v15, v16, 0));
  v18 = MapsSuggestionsNonNilString(v17, &stru_1011EB268);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v19, v9, v10);
  return v20;
}

+ (id)_maps_dayDescriptionStringShortDescription:(BOOL)a3 timeZone:(id)a4 bookingDate:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _BOOL4 v16;
  id v17;
  id v18;
  _BOOL4 v19;
  _BOOL4 v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void **block;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  const char *v43;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v38 = v6;
  if (qword_1014D33A0 != -1)
    dispatch_once(&qword_1014D33A0, &stru_1011C70A8);
  objc_msgSend((id)qword_1014D3398, "setDateStyle:", 0);
  objc_msgSend((id)qword_1014D3398, "setTimeStyle:", 1);
  objc_msgSend((id)qword_1014D3398, "setTimeZone:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsInTimeZone:fromDate:", v7, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsInTimeZone:fromDate:", v7, v8));
  v13 = objc_msgSend(v11, "year");
  if (v13 == objc_msgSend(v12, "year") && (v14 = objc_msgSend(v11, "month"), v14 == objc_msgSend(v12, "month")))
  {
    v15 = objc_msgSend(v11, "day");
    v16 = v15 == objc_msgSend(v12, "day");
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_msgSend(v11, "year");
  if (v17 != objc_msgSend(v12, "year"))
  {
    v19 = 0;
    if (!v16)
      goto LABEL_9;
LABEL_11:
    v20 = (uint64_t)objc_msgSend(v12, "hour") > 16;
    goto LABEL_12;
  }
  v18 = objc_msgSend(v11, "weekOfYear");
  v19 = v18 == objc_msgSend(v12, "weekOfYear");
  if (v16)
    goto LABEL_11;
LABEL_9:
  v20 = 0;
LABEL_12:
  v21 = objc_msgSend(v11, "copy");
  objc_msgSend(v21, "setDay:", (char *)objc_msgSend(v21, "day") + 1);
  v22 = objc_msgSend(v21, "year");
  if (v22 == objc_msgSend(v12, "year"))
  {
    v23 = objc_msgSend(v21, "month");
    if (v23 == objc_msgSend(v12, "month"))
    {
      v24 = objc_msgSend(v21, "day");
      v25 = v24 == objc_msgSend(v12, "day");
      if (!v20)
        goto LABEL_15;
LABEL_20:
      block = _NSConcreteStackBlock;
      v40 = 3221225472;
      v41 = sub_1007B9B80;
      v42 = &unk_1011ACF48;
      v43 = "NSDate+RestaurantReservationDescriptionHelper";
      if (qword_1014D33B0 != -1)
        dispatch_once(&qword_1014D33B0, &block);
      v26 = v8;
      v27 = (void *)qword_1014D33A8;
      v28 = CFSTR("reservation_tonight_key");
      v29 = CFSTR("Tonight<unlocalized>");
      goto LABEL_27;
    }
  }
  v25 = 0;
  if (v20)
    goto LABEL_20;
LABEL_15:
  if (v16)
  {
    block = _NSConcreteStackBlock;
    v40 = 3221225472;
    v41 = sub_1007B9B80;
    v42 = &unk_1011ACF48;
    v43 = "NSDate+RestaurantReservationDescriptionHelper";
    v26 = v8;
    if (qword_1014D33B0 != -1)
      dispatch_once(&qword_1014D33B0, &block);
    v27 = (void *)qword_1014D33A8;
    v28 = CFSTR("reservation_today_key");
    v29 = CFSTR("Today<unlocalized>");
LABEL_27:
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", v28, v29, 0));
    v31 = MapsSuggestionsNonNilString(v30, &stru_1011EB268);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

    goto LABEL_28;
  }
  v26 = v8;
  if (v25)
  {
    block = _NSConcreteStackBlock;
    v40 = 3221225472;
    v41 = sub_1007B9B80;
    v42 = &unk_1011ACF48;
    v43 = "NSDate+RestaurantReservationDescriptionHelper";
    if (qword_1014D33B0 != -1)
      dispatch_once(&qword_1014D33B0, &block);
    v27 = (void *)qword_1014D33A8;
    v28 = CFSTR("reservation_tomorrow_key");
    v29 = CFSTR("Tomorrow<unlocalized>");
    goto LABEL_27;
  }
  if (v19)
  {
    if (v38)
      v34 = CFSTR("EE");
    else
      v34 = CFSTR("EEEE");
    objc_msgSend((id)qword_1014D3398, "setDateFormat:", v34);
    v35 = (void *)qword_1014D3398;
  }
  else
  {
    if (v38)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("MMMdd"), 0, v36));

      objc_msgSend((id)qword_1014D3398, "setDateFormat:", v37);
    }
    else
    {
      objc_msgSend((id)qword_1014D3398, "setDateStyle:", 2);
      objc_msgSend((id)qword_1014D3398, "setTimeStyle:", 0);
    }
    v35 = (void *)qword_1014D3398;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringFromDate:", v8));
LABEL_28:

  return v32;
}

+ (id)_maps_minimumDateForRoutePlanningWithTimeZone:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = objc_msgSend(v5, "copy");

  objc_msgSend(v6, "setTimeZone:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startOfDayForDate:", v7));
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  if (v9 < 14400.0)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -1, v8, 0));

    v8 = (void *)v10;
  }
  if (objc_msgSend(v8, "compare:", v7) == (id)-1)
    v11 = v8;
  else
    v11 = v7;
  v12 = v11;

  return v12;
}

+ (id)_maps_maximumDateForRoutePlanning
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "date"));
  v3 = objc_msgSend(v2, "dateByAddingTimeInterval:", GEOConfigGetDouble(MapsConfig_TransitDatePickerHorizonDuration, off_1014B2D78));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)_maps_nextWeekday:(int64_t)a3 atHour:(int64_t)a4 timeZone:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = sub_100A21074();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "setTimeZone:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "components:fromDate:", 8748, self));
  if ((uint64_t)objc_msgSend(v12, "weekday") >= a3)
    objc_msgSend(v12, "setWeekOfYear:", (char *)objc_msgSend(v12, "weekOfYear") + 1);
  objc_msgSend(v12, "setWeekday:", a3);
  objc_msgSend(v12, "setHour:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateFromComponents:", v12));

  return v13;
}

- (id)_maps_nextDayAtHour:(int64_t)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v6 = a4;
  v7 = sub_100A21074();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setTimeZone:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "components:fromDate:", 28, self));
  objc_msgSend(v10, "setHour:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateFromComponents:", v10));
  v12 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v12, "setDay:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingComponents:toDate:options:", v12, v11, 0));

  return v13;
}

@end
