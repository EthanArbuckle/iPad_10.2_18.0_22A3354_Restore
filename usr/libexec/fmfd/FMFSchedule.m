@implementation FMFSchedule

+ (id)_dateFromHour:(unint64_t)a3 andMinute:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:", 62, v6));
  objc_msgSend(v8, "setHour:", a3);
  objc_msgSend(v8, "setMinute:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateFromComponents:", v8));

  return v9;
}

+ (void)_enumerateDaysOfWeekInFMFDaysOfWeek:(int64_t)a3 callback:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void (**v12)(void);

  v12 = (void (**)(void))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = objc_msgSend(v5, "firstWeekday");
  v7 = 0;
  v8 = (((unint64_t)v6 + 6) * (unsigned __int128)0x2492492492492493uLL) >> 64;
  v9 = (unint64_t)v6 - 7 * ((v8 + (((unint64_t)v6 + 6 - v8) >> 1)) >> 2) + 6;
  v10 = v9;
  do
  {
    if (v10 > 6)
      v11 = 0;
    else
      v11 = qword_100076660[v10];
    if ((v11 & a3) != 0)
      v12[2]();
    if (v10 < 6)
      ++v10;
    else
      v10 = 0;
    ++v7;
  }
  while (v10 != v9);

}

+ (id)_dayStringForDayOfWeek:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = v4;
  v6 = &stru_10009B948;
  if (a3 > 15)
  {
    switch(a3)
    {
      case 16:
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekdaySymbols"));
        v8 = v7;
        v9 = 2;
        break;
      case 32:
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekdaySymbols"));
        v8 = v7;
        v9 = 1;
        break;
      case 64:
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekdaySymbols"));
        v8 = v7;
        v9 = 0;
        break;
      default:
        goto LABEL_14;
    }
LABEL_13:
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v9));

    goto LABEL_14;
  }
  switch(a3)
  {
    case 1:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekdaySymbols"));
      v8 = v7;
      v9 = 6;
      goto LABEL_13;
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekdaySymbols"));
      v8 = v7;
      v9 = 5;
      goto LABEL_13;
    case 4:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekdaySymbols"));
      v8 = v7;
      v9 = 4;
      goto LABEL_13;
    case 8:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekdaySymbols"));
      v8 = v7;
      v9 = 3;
      goto LABEL_13;
    default:
      break;
  }
LABEL_14:

  return v6;
}

+ (id)_stringForDaysOfWeek:(int64_t)a3
{
  NSBundle *v4;
  void *v5;
  void *v6;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSBundle *v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  NSBundle *v20;
  void *v21;
  NSBundle *v22;
  void *v23;
  NSBundle *v24;
  void *v25;
  NSBundle *v26;
  NSBundle *v27;
  NSBundle *v28;
  NSBundle *v29;
  NSBundle *v30;
  void **v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  void *v34;
  NSMutableArray *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t *v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _QWORD v44[4];
  _QWORD v45[5];

  if (!a3)
    return &stru_10009B948;
  if (a3 == 127)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_EVERY_DAY"), &stru_10009B948, CFSTR("Localizable-TINKER")));

    return v6;
  }
  else
  {
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v45[3] = 0x7FFFFFFFFFFFFFFFLL;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0x7FFFFFFFFFFFFFFFLL;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 1;
    v9 = objc_opt_new(NSMutableArray);
    v31 = _NSConcreteStackBlock;
    v32 = 3221225472;
    v33 = sub_100023F3C;
    v34 = &unk_100099DE8;
    v39 = a1;
    v10 = v9;
    v35 = v10;
    v36 = v45;
    v37 = v44;
    v38 = &v40;
    objc_msgSend(a1, "_enumerateDaysOfWeekInFMFDaysOfWeek:callback:", a3, &v31);
    switch((unint64_t)-[NSMutableArray count](v10, "count"))
    {
      case 1uLL:
        v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_1"), &stru_10009B948, CFSTR("Localizable-TINKER")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14));
        goto LABEL_32;
      case 2uLL:
        if (*((_BYTE *)v41 + 24))
        {
          v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_CONTIGUOUS_2"), &stru_10009B948, CFSTR("Localizable-TINKER")));
        }
        else
        {
          v26 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v26);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_2"), &stru_10009B948, CFSTR("Localizable-TINKER")));
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14, v18));
        goto LABEL_31;
      case 3uLL:
        if (*((_BYTE *)v41 + 24))
        {
          v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_CONTIGUOUS_3"), &stru_10009B948, CFSTR("Localizable-TINKER")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 2));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1));
        }
        else
        {
          v27 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v27);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_3"), &stru_10009B948, CFSTR("Localizable-TINKER")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 2));
        }
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14, v18, v19));
        goto LABEL_30;
      case 4uLL:
        if (*((_BYTE *)v41 + 24))
        {
          v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_CONTIGUOUS_4"), &stru_10009B948, CFSTR("Localizable-TINKER")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 3));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 2));
        }
        else
        {
          v28 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v28);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_4"), &stru_10009B948, CFSTR("Localizable-TINKER")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 2));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 3));
        }
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14, v18, v19, v21));
        goto LABEL_29;
      case 5uLL:
        if (*((_BYTE *)v41 + 24))
        {
          v22 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_CONTIGUOUS_5"), &stru_10009B948, CFSTR("Localizable-TINKER")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 4));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 2));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 3));
        }
        else
        {
          v29 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v29);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_5"), &stru_10009B948, CFSTR("Localizable-TINKER")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 2));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 3));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 4));
        }
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14, v18, v19, v21, v23));
        goto LABEL_28;
      case 6uLL:
        if (*((_BYTE *)v41 + 24))
        {
          v24 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_CONTIGUOUS_6"), &stru_10009B948, CFSTR("Localizable-TINKER")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 5));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 2));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 3));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 4));
        }
        else
        {
          v30 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v30);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DAYSLIST_6"), &stru_10009B948, CFSTR("Localizable-TINKER")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 2));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 3));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 4));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 5));
        }
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14, v18, v19, v21, v23, v25, v31, v32, v33, v34));

LABEL_28:
LABEL_29:

LABEL_30:
LABEL_31:

LABEL_32:
        break;
      default:
        v15 = &stru_10009B948;
        break;
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(v45, 8);
    return v15;
  }
}

+ (id)localizedDaysOfWeekStringFor:(int64_t)a3
{
  return +[FMFSchedule _stringForDaysOfWeek:](FMFSchedule, "_stringForDaysOfWeek:", a3);
}

- (NSString)localizedDaysOfWeekString
{
  return (NSString *)+[FMFSchedule localizedDaysOfWeekStringFor:](FMFSchedule, "localizedDaysOfWeekStringFor:", -[FMFSchedule daysOfWeek](self, "daysOfWeek"));
}

+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4 timeStyle:(unint64_t)a5
{
  void *v6;
  __CFString *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSchedule _dateFromHour:andMinute:](FMFSchedule, "_dateFromHour:andMinute:", a3, a4));
  if (v6)
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v6, 0, a5));
  else
    v7 = &stru_10009B948;

  return v7;
}

+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4
{
  return +[FMFSchedule localizedTimeStringForHour:andMinute:timeStyle:](FMFSchedule, "localizedTimeStringForHour:andMinute:timeStyle:", a3, a4, 1);
}

- (NSString)localizedStartTimeString
{
  return (NSString *)+[FMFSchedule localizedTimeStringForHour:andMinute:](FMFSchedule, "localizedTimeStringForHour:andMinute:", -[FMFSchedule startHour](self, "startHour"), -[FMFSchedule startMin](self, "startMin"));
}

- (NSString)localizedEndTimeString
{
  return (NSString *)+[FMFSchedule localizedTimeStringForHour:andMinute:](FMFSchedule, "localizedTimeStringForHour:andMinute:", -[FMFSchedule endHour](self, "endHour"), -[FMFSchedule endMin](self, "endMin"));
}

@end
