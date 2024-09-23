@implementation CHListAndDetailViewDateFormatter

+ (id)listViewDateFormatter
{
  if (qword_10083DFD8 != -1)
    dispatch_once(&qword_10083DFD8, &stru_100779AE0);
  return (id)qword_10083DFD0;
}

+ (id)detailViewDateFormatter
{
  if (qword_10083DFE8 != -1)
    dispatch_once(&qword_10083DFE8, &stru_100779B00);
  return (id)qword_10083DFE0;
}

+ (id)timeDateFormatter
{
  if (qword_10083DFF8 != -1)
    dispatch_once(&qword_10083DFF8, &stru_100779B20);
  return (id)qword_10083DFF0;
}

+ (id)_todayDateFormatter
{
  if (qword_10083E008 != -1)
    dispatch_once(&qword_10083E008, &stru_100779B40);
  return (id)qword_10083E000;
}

+ (id)_dayDateFormatter
{
  if (qword_10083E018 != -1)
    dispatch_once(&qword_10083E018, &stru_100779B60);
  return (id)qword_10083E010;
}

+ (id)formattedListStringForDate:(id)a3 font:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  NSAttributedStringKey v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v9 = objc_msgSend(v8, "isDateInToday:", v6);

  if (v9)
  {
    _HKInitializeLogging(v10, v11);
    v12 = (void *)HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      *(_DWORD *)buf = 138543618;
      v43 = v6;
      v44 = 2114;
      v45 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NSCalendar reported that date %{public}@ is in today %{public}@", buf, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_todayDateFormatter"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startOfDayForDate:", v17));

    if (objc_msgSend(v6, "compare:", v18) == (id)-1)
    {
      _HKInitializeLogging(-1, v19);
      v20 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v43 = v6;
        v44 = 2114;
        v45 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found date:%{public}@ to be before the start of today:%{public}@", buf, 0x16u);
      }
      v22 = objc_msgSend((id)objc_opt_class(a1, v21), "_dayDateFormatter");
      v23 = objc_claimAutoreleasedReturnValue(v22);

      v15 = (void *)v23;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringFromDate:", v6));
    _HKInitializeLogging(v24, v25);
    v26 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "List view date string: %@", buf, 0xCu);
    }

  }
  else
  {
    v27 = v6;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dateByAddingUnit:value:toDate:options:", 16, -6, v29, 0));

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startOfDayForDate:", v30));

    v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "laterDate:", v32));
    if (v33 == v27)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dayDateFormatter"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringFromDate:", v27));
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "listViewDateFormatter"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringFromDate:", v27));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedUppercaseString"));

    }
  }
  v36 = objc_alloc((Class)NSAttributedString);
  v40 = NSFontAttributeName;
  v41 = v7;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
  v38 = objc_msgSend(v36, "initWithString:attributes:", v24, v37);

  return v38;
}

@end
