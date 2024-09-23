@implementation PDSEHangTracerBadDay

+ (id)prefixForDefaults
{
  return CFSTR("PDSEHTBadDay");
}

+ (BOOL)wantsEnablement
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  id v23;
  id v24;
  double v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  double v29;
  float v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  unsigned int v37;
  uint64_t v38;
  void *i;
  void *v40;
  id v41;
  NSObject *v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  NSObject *v50;
  float v51;
  _QWORD v52[6];
  unsigned int v53;
  unsigned int v54;
  uint8_t v55[128];
  uint8_t buf[4];
  NSObject *v57;

  if ((_os_feature_enabled_impl("HangTracer", "badDayEnablement") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v4 = objc_msgSend(v3, "badDayEnablementForPreviousDays");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v6 = objc_msgSend(v5, "badDayEnablementForHangDurationMSec");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v8 = objc_msgSend(v7, "badDayEnablementForLogCount");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v10 = objc_msgSend(v9, "badDayEnablementMinimumBreakDurationDays");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    objc_msgSend(v11, "badDaySecondsBetweenLastEnablementAndReferenceDate");
    v13 = v12;

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100004D00;
    v52[3] = &unk_100018438;
    *(double *)&v52[4] = v13;
    v52[5] = v6;
    v53 = v8;
    v54 = v10;
    v14 = objc_retainBlock(v52);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v16 = v15;
    v17 = v15 - v13;
    objc_msgSend((id)objc_opt_class(a1), "timeoutDurationSec");
    if (v17 < v18 || v17 >= v18 + (double)v10 * 86400.0)
    {
      if (v17 >= v18)
      {
        v19 = CFPreferencesCopyValue(CFSTR("BadDaySecondsBetweenLastEvaluationAndReferenceDate"), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
        -[NSObject doubleValue](v19, "doubleValue");
        if (v16 - v25 >= 43200.0)
        {
          CFPreferencesSetValue(CFSTR("BadDaySecondsBetweenLastEvaluationAndReferenceDate"), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
          CFPreferencesSynchronize(CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
          v29 = (double)v4;
          v30 = (float)(unint64_t)v6 / 1000.0;
          v31 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithCapacity:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v29 * -86400.0));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_100004EC0;
          v49[3] = &unk_100018460;
          v51 = v30;
          v26 = v31;
          v50 = v26;
          v44 = v32;
          sub_100006FA0(v32, v33, 0, v49);

          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectEnumerator](v26, "objectEnumerator"));
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
          if (v35)
          {
            v36 = v35;
            v37 = 0;
            v38 = *(_QWORD *)v46;
            while (2)
            {
              for (i = 0; i != v36; i = (char *)i + 1)
              {
                if (*(_QWORD *)v46 != v38)
                  objc_enumerationMutation(v34);
                v40 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
                if ((sub_10000D9A8(v40) & 1) == 0)
                  v37 += -[NSObject countForObject:](v26, "countForObject:", v40);
                if (v37 >= v8)
                {
                  v41 = sub_10000DFC0();
                  v42 = objc_claimAutoreleasedReturnValue(v41);
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "PDSE: enabling bad day log collection", buf, 2u);
                  }

                  v22 = 1;
                  ((void (*)(NSObject *, uint64_t))v14[2].isa)(v14, 1);

                  goto LABEL_32;
                }
              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
              if (v36)
                continue;
              break;
            }
          }

          ((void (*)(NSObject *, _QWORD))v14[2].isa)(v14, 0);
          v22 = 0;
LABEL_32:

        }
        else
        {
          -[NSObject doubleValue](v19, "doubleValue");
          v26 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
          v27 = sub_10000DFC0();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v26;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "PDSE: bad day log not evaluated since last evaluation (%@) is too close", buf, 0xCu);
          }

          ((void (*)(NSObject *, _QWORD))v14[2].isa)(v14, 0);
          v22 = 0;
        }

      }
      else
      {
        v24 = sub_10000DFC0();
        v19 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          sub_10000EB6C(v19);
        v22 = 1;
      }
    }
    else
    {
      v19 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v13));
      v20 = sub_10000DFC0();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "PDSE: bad day log not enabled since last enablement (%@) is too close", buf, 0xCu);
      }

      ((void (*)(NSObject *, _QWORD))v14[2].isa)(v14, 0);
      v22 = 0;
    }

  }
  else
  {
    v23 = sub_10000DFC0();
    v14 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PDSE: bad day log collection feature is turned off", buf, 2u);
    }
    v22 = 0;
  }

  return v22;
}

+ (void)writeEnablementSettings
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  const __CFString *v6;
  id v7;
  NSObject *v8;
  id v9;
  __int128 v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSString *v20;
  void *v21;
  __int128 v22;
  id obj;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  _QWORD v32[3];

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  CFPreferencesSetValue(CFSTR("BadDaySecondsBetweenLastEnablementAndReferenceDate"), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v4 = objc_msgSend(v3, "isInternal");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
    v6 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerEnabled"), (uint64_t)v5);
    CFPreferencesSetValue(v6, kCFBooleanTrue, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

    v7 = sub_10000DFC0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10000EBAC(a1, (uint64_t)CFSTR("HangTracerEnabled"), v8);

    CFPreferencesSynchronize(CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
  }
  else
  {
    v32[0] = CFSTR("HangTracerDailyLogLimit");
    v32[1] = CFSTR("HangTracerDailyMicroHangLogLimit");
    v32[2] = CFSTR("HangTracerFenceHangLogLimit");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 3));
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v26;
      *(_QWORD *)&v10 = 138412290;
      v22 = v10;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults", v22));
          v16 = (const __CFString *)sub_100003FD0(v14, (uint64_t)v15);
          CFPreferencesSetValue(v16, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

          v17 = sub_10000DFC0();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
            v20 = sub_100003FD0(v14, (uint64_t)v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            *(_DWORD *)buf = v22;
            v30 = v21;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "PDSE: set setting %@ to 0 for bad day log collection", buf, 0xCu);

          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v11);
    }

    v24.receiver = a1;
    v24.super_class = (Class)&OBJC_METACLASS___PDSEHangTracerBadDay;
    objc_msgSendSuper2(&v24, "writeEnablementSettings");

  }
}

+ (double)timeoutDurationSec
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v3 = objc_msgSend(v2, "badDayEnablementDurationDays");

  return (double)v3 * 86400.0 + 43200.0;
}

@end
