@implementation MOTime

- (MOTime)initWithTimeMO:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  MOTime *v11;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    objc_msgSend(v4, "timestamp");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
    v10 = objc_msgSend(v4, "timeTag");

    self = -[MOTime initWithIdentifier:timestamp:timeString:timeZone:timeTag:](self, "initWithIdentifier:timestamp:timeString:timeZone:timeTag:", v5, v8, v9, v10, v7);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (MOTime)initWithIdentifier:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  void *v9;
  MOTime *v10;

  v5 = a3;
  if (!v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOTime initWithIdentifier:].cold.1(v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTime.m"), 102, CFSTR("Invalid parameter not satisfying: identifier (in %s:%d)"), "-[MOTime initWithIdentifier:]", 102);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v10 = -[MOTime initWithIdentifier:timestamp:timeString:timeZone:timeTag:](self, "initWithIdentifier:timestamp:timeString:timeZone:timeTag:", v5, CFSTR("today"), CFSTR("Unknown"), 0);

  return v10;
}

- (MOTime)initWithTimestamp:(double)a3 timeString:(id)a4 timeZone:(id)a5 timeTag:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  MOTime *v13;

  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v13 = -[MOTime initWithIdentifier:timestamp:timeString:timeZone:timeTag:](self, "initWithIdentifier:timestamp:timeString:timeZone:timeTag:", v12, v11, v10, a6, a3);

  return v13;
}

- (MOTime)initWithIdentifier:(id)a3 timestamp:(double)a4 timeString:(id)a5 timeZone:(id)a6 timeTag:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  MOTime *v16;
  MOTime *v17;
  objc_super v19;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MOTime;
  v16 = -[MOTime init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    v17->_timestamp = a4;
    objc_storeStrong((id *)&v17->_timeString, a5);
    objc_storeStrong((id *)&v17->_timeZone, a6);
    v17->_timeTag = a7;
    v17->_dateReferenceTag = 0;
  }

  return v17;
}

- (id)timeZoneObject
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime timeZone](self, "timeZone"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime timeZone](self, "timeZone"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)localTime
{
  double v3;
  void *v4;
  void *v5;
  void *v6;

  -[MOTime timestamp](self, "timestamp");
  if (v3 == 0.0)
  {
    v6 = 0;
  }
  else
  {
    -[MOTime timestamp](self, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime timeZoneObject](self, "timeZoneObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v4, v5));

  }
  return v6;
}

- (id)date
{
  double v3;
  void *v4;

  -[MOTime timestamp](self, "timestamp");
  if (v3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[MOTime timestamp](self, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  return v4;
}

+ (id)localTimeOfDate:(id)a3 timeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _BYTE *v10;
  uint64_t v11;
  id os_log;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
      if (objc_msgSend(v8, "isEqualToTimeZone:", v7))
      {
        v9 = v5;
      }
      else
      {
        v10 = objc_msgSend(v7, "secondsFromGMTForDate:", v5);
        v11 = v10 - (_BYTE *)objc_msgSend(v8, "secondsFromGMTForDate:", v5);
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", (double)v11));
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v13 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v15 = 138413314;
          v16 = v5;
          v17 = 2112;
          v18 = v7;
          v19 = 2112;
          v20 = v8;
          v21 = 2048;
          v22 = v11;
          v23 = 2112;
          v24 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "localTime, object date, %@, object timezone, %@, system timezone, %@, timezone diff, %ld, adjusted date, %@", (uint8_t *)&v15, 0x34u);
        }

      }
    }
    else
    {
      v9 = v5;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)timeForDate:(id)a3
{
  return +[MOTime timeFromStartDate:endDate:timeZoneManager:](MOTime, "timeFromStartDate:endDate:timeZoneManager:", a3, 0, 0);
}

+ (id)timeForDate:(id)a3 timeZoneManager:(id)a4
{
  return +[MOTime timeFromStartDate:endDate:timeZoneManager:](MOTime, "timeFromStartDate:endDate:timeZoneManager:", a3, 0, a4);
}

+ (id)timeFromStartDate:(id)a3 endDate:(id)a4
{
  return +[MOTime timeFromStartDate:endDate:timeZoneManager:](MOTime, "timeFromStartDate:endDate:timeZoneManager:", a3, a4, 0);
}

+ (id)timeFromStartDate:(id)a3 endDate:(id)a4 timeZoneManager:(id)a5
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  id os_log;
  NSObject *v12;
  id v13;
  MOTime *v14;
  void *v15;
  MOTime *v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a5;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZoneAtDate:", v6));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138412802;
      v19 = v6;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "timeZone, date, %@, timeZone, %@, source, timeZoneManager, %@", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[MOTime timeFromStartDate:endDate:timeZoneManager:].cold.1();
  }

  v14 = [MOTime alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v16 = -[MOTime initWithTimestamp:timeString:timeZone:timeTag:](v14, "initWithTimestamp:timeString:timeZone:timeTag:", 0, v15, 0, v9);

  return v16;
}

+ (id)dateFromDate:(id)a3 hour:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:", 60, v5));

  objc_msgSend(v7, "setHour:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v7));

  return v8;
}

+ (id)buildTimeTagIntervalsForDate:(id)a3
{
  id v3;
  NSMutableArray *v4;
  MOTimeTagInterval *v5;
  id v6;
  void *v7;
  id v8;
  MOTimeTagInterval *v9;
  MOTimeTagInterval *v10;
  id v11;
  void *v12;
  id v13;
  MOTimeTagInterval *v14;
  MOTimeTagInterval *v15;
  id v16;
  void *v17;
  id v18;
  MOTimeTagInterval *v19;
  MOTimeTagInterval *v20;
  id v21;
  void *v22;
  id v23;
  MOTimeTagInterval *v24;
  MOTimeTagInterval *v25;
  id v26;
  void *v27;
  id v28;
  MOTimeTagInterval *v29;
  MOTimeTagInterval *v30;
  id v31;
  void *v32;
  id v33;
  MOTimeTagInterval *v34;
  MOTimeTagInterval *v35;
  id v36;
  void *v37;
  id v38;
  MOTimeTagInterval *v39;
  id v40;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = [MOTimeTagInterval alloc];
  v6 = objc_alloc((Class)NSDateInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 0));
  v8 = objc_msgSend(v6, "initWithStartDate:duration:", v7, 10800.0);
  v9 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v5, "initWithTimeTag:dateInterval:", 8, v8);
  -[NSMutableArray addObject:](v4, "addObject:", v9);

  v10 = [MOTimeTagInterval alloc];
  v11 = objc_alloc((Class)NSDateInterval);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 3));
  v13 = objc_msgSend(v11, "initWithStartDate:duration:", v12, 21600.0);
  v14 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v10, "initWithTimeTag:dateInterval:", 2, v13);
  -[NSMutableArray addObject:](v4, "addObject:", v14);

  v15 = [MOTimeTagInterval alloc];
  v16 = objc_alloc((Class)NSDateInterval);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 9));
  v18 = objc_msgSend(v16, "initWithStartDate:duration:", v17, 10800.0);
  v19 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v15, "initWithTimeTag:dateInterval:", 3, v18);
  -[NSMutableArray addObject:](v4, "addObject:", v19);

  v20 = [MOTimeTagInterval alloc];
  v21 = objc_alloc((Class)NSDateInterval);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 12));
  v23 = objc_msgSend(v21, "initWithStartDate:duration:", v22, 10800.0);
  v24 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v20, "initWithTimeTag:dateInterval:", 4, v23);
  -[NSMutableArray addObject:](v4, "addObject:", v24);

  v25 = [MOTimeTagInterval alloc];
  v26 = objc_alloc((Class)NSDateInterval);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 15));
  v28 = objc_msgSend(v26, "initWithStartDate:duration:", v27, 10800.0);
  v29 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v25, "initWithTimeTag:dateInterval:", 5, v28);
  -[NSMutableArray addObject:](v4, "addObject:", v29);

  v30 = [MOTimeTagInterval alloc];
  v31 = objc_alloc((Class)NSDateInterval);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 18));
  v33 = objc_msgSend(v31, "initWithStartDate:duration:", v32, 10800.0);
  v34 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v30, "initWithTimeTag:dateInterval:", 6, v33);
  -[NSMutableArray addObject:](v4, "addObject:", v34);

  v35 = [MOTimeTagInterval alloc];
  v36 = objc_alloc((Class)NSDateInterval);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 21));

  v38 = objc_msgSend(v36, "initWithStartDate:duration:", v37, 10800.0);
  v39 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v35, "initWithTimeTag:dateInterval:", 7, v38);
  -[NSMutableArray addObject:](v4, "addObject:", v39);

  v40 = -[NSMutableArray copy](v4, "copy");
  return v40;
}

+ (id)buildSimpleTimeTagIntervalsForDate:(id)a3
{
  id v3;
  NSMutableArray *v4;
  MOTimeTagInterval *v5;
  id v6;
  void *v7;
  id v8;
  MOTimeTagInterval *v9;
  MOTimeTagInterval *v10;
  id v11;
  void *v12;
  id v13;
  MOTimeTagInterval *v14;
  MOTimeTagInterval *v15;
  id v16;
  void *v17;
  id v18;
  MOTimeTagInterval *v19;
  MOTimeTagInterval *v20;
  id v21;
  void *v22;
  id v23;
  MOTimeTagInterval *v24;
  MOTimeTagInterval *v25;
  id v26;
  void *v27;
  id v28;
  MOTimeTagInterval *v29;
  id v30;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = [MOTimeTagInterval alloc];
  v6 = objc_alloc((Class)NSDateInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 3));
  v8 = objc_msgSend(v6, "initWithStartDate:duration:", v7, 32400.0);
  v9 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v5, "initWithTimeTag:dateInterval:", 2, v8);
  -[NSMutableArray addObject:](v4, "addObject:", v9);

  v10 = [MOTimeTagInterval alloc];
  v11 = objc_alloc((Class)NSDateInterval);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 12));
  v13 = objc_msgSend(v11, "initWithStartDate:duration:", v12, 21600.0);
  v14 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v10, "initWithTimeTag:dateInterval:", 4, v13);
  -[NSMutableArray addObject:](v4, "addObject:", v14);

  v15 = [MOTimeTagInterval alloc];
  v16 = objc_alloc((Class)NSDateInterval);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 18));
  v18 = objc_msgSend(v16, "initWithStartDate:duration:", v17, 10800.0);
  v19 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v15, "initWithTimeTag:dateInterval:", 6, v18);
  -[NSMutableArray addObject:](v4, "addObject:", v19);

  v20 = [MOTimeTagInterval alloc];
  v21 = objc_alloc((Class)NSDateInterval);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 21));
  v23 = objc_msgSend(v21, "initWithStartDate:duration:", v22, 21600.0);
  v24 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v20, "initWithTimeTag:dateInterval:", 7, v23);
  -[NSMutableArray addObject:](v4, "addObject:", v24);

  v25 = [MOTimeTagInterval alloc];
  v26 = objc_alloc((Class)NSDateInterval);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, -3));

  v28 = objc_msgSend(v26, "initWithStartDate:duration:", v27, 21600.0);
  v29 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v25, "initWithTimeTag:dateInterval:", 7, v28);
  -[NSMutableArray addObject:](v4, "addObject:", v29);

  v30 = -[NSMutableArray copy](v4, "copy");
  return v30;
}

+ (unint64_t)timetagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  id os_log;
  NSObject *v20;
  void *v21;
  id v22;
  __int128 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  id v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  double v56;
  _BYTE v57[128];

  v5 = a3;
  v6 = a4;
  if (!v6
    || (objc_msgSend(v5, "isSameDayWithDate:", v6) & 1) != 0
    || (objc_msgSend(v6, "timeIntervalSinceDate:", v5), v7 <= 43200.0))
  {
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[MOTime buildTimeTagIntervalsForDate:](MOTime, "buildTimeTagIntervalsForDate:", v5));
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v45;
      *(_QWORD *)&v12 = 138413058;
      v38 = v12;
LABEL_9:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v15);
        objc_msgSend(v16, "overlapsScoreForStartDate:endDate:", v5, v6, v38);
        v18 = v17;
        if (v17 > 0.0)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v20 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v38;
            v50 = v5;
            v51 = 2112;
            v52 = v6;
            v53 = 2112;
            v54 = v16;
            v55 = 2048;
            v56 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
          }

        }
        if (v18 > 0.7)
          break;
        if (v13 == (id)++v15)
        {
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
          if (v13)
            goto LABEL_9;
          goto LABEL_19;
        }
      }
      v31 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        goto LABEL_35;
      v33 = objc_msgSend(v16, "timetag");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", objc_msgSend(v16, "timetag")));
      *(_DWORD *)buf = v38;
      v50 = v5;
      v51 = 2112;
      v52 = v6;
      v53 = 2048;
      v54 = v33;
      v55 = 2112;
      v56 = *(double *)&v34;
    }
    else
    {
LABEL_19:

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime buildSimpleTimeTagIntervalsForDate:](MOTime, "buildSimpleTimeTagIntervalsForDate:", v5));
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v9 = v21;
      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (!v22)
      {
LABEL_31:
        v10 = 0;
LABEL_36:

        goto LABEL_37;
      }
      v24 = v22;
      v25 = *(_QWORD *)v41;
      *(_QWORD *)&v23 = 138413058;
      v39 = v23;
LABEL_21:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v26);
        objc_msgSend(v16, "overlapsScoreForStartDate:endDate:", v5, v6, v39, (_QWORD)v40);
        v28 = v27;
        if (v27 > 0.0)
        {
          v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v39;
            v50 = v5;
            v51 = 2112;
            v52 = v6;
            v53 = 2112;
            v54 = v16;
            v55 = 2048;
            v56 = v28;
            _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
          }

        }
        if (v28 > 0.7)
          break;
        if (v24 == (id)++v26)
        {
          v24 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v24)
            goto LABEL_21;
          goto LABEL_31;
        }
      }
      v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v32 = objc_claimAutoreleasedReturnValue(v35);
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        goto LABEL_35;
      v37 = objc_msgSend(v16, "timetag");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", objc_msgSend(v16, "timetag")));
      *(_DWORD *)buf = v39;
      v50 = v5;
      v51 = 2112;
      v52 = v6;
      v53 = 2048;
      v54 = v37;
      v55 = 2112;
      v56 = *(double *)&v34;
    }
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, timetag, %lu(%@)", buf, 0x2Au);

LABEL_35:
    v10 = objc_msgSend(v16, "timetag");
    goto LABEL_36;
  }
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[MOTime timetagFromStartDate:endDate:].cold.1();
  v10 = 0;
LABEL_37:

  return (unint64_t)v10;
}

+ (unint64_t)simpleTimetagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  double v17;
  double v18;
  id os_log;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  double v38;
  _BYTE v39[128];

  v5 = a3;
  v6 = a4;
  if (!v6
    || (objc_msgSend(v5, "isSameDayWithDate:", v6) & 1) != 0
    || (objc_msgSend(v6, "timeIntervalSinceDate:", v5), v7 <= 43200.0))
  {
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[MOTime buildSimpleTimeTagIntervalsForDate:](MOTime, "buildSimpleTimeTagIntervalsForDate:", v5));
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v28;
      *(_QWORD *)&v12 = 138413058;
      v26 = v12;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v16, "overlapsScoreForStartDate:endDate:", v5, v6, v26, (_QWORD)v27);
          v18 = v17;
          if (v17 > 0.0)
          {
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v20 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v26;
              v32 = v5;
              v33 = 2112;
              v34 = v6;
              v35 = 2112;
              v36 = v16;
              v37 = 2048;
              v38 = v18;
              _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
            }

          }
          if (v18 > 0.7)
          {
            v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v24 = objc_msgSend(v16, "timetag");
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", objc_msgSend(v16, "timetag")));
              *(_DWORD *)buf = v26;
              v32 = v5;
              v33 = 2112;
              v34 = v6;
              v35 = 2048;
              v36 = v24;
              v37 = 2112;
              v38 = *(double *)&v25;
              _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, timetag, %lu(%@)", buf, 0x2Au);

            }
            v10 = objc_msgSend(v16, "timetag");
            goto LABEL_23;
          }
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
        if (v13)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_23:

  }
  else
  {
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[MOTime timetagFromStartDate:endDate:].cold.1();
    v10 = 0;
  }

  return (unint64_t)v10;
}

+ (id)buildSimpleMealTagIntervalsForDate:(id)a3
{
  id v3;
  NSMutableArray *v4;
  MOTimeTagInterval *v5;
  id v6;
  void *v7;
  id v8;
  MOTimeTagInterval *v9;
  MOTimeTagInterval *v10;
  id v11;
  void *v12;
  id v13;
  MOTimeTagInterval *v14;
  MOTimeTagInterval *v15;
  id v16;
  void *v17;
  id v18;
  MOTimeTagInterval *v19;
  id v20;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = [MOTimeTagInterval alloc];
  v6 = objc_alloc((Class)NSDateInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 6));
  v8 = objc_msgSend(v6, "initWithStartDate:duration:", v7, 18000.0);
  v9 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v5, "initWithTimeTag:dateInterval:", 2000, v8);
  -[NSMutableArray addObject:](v4, "addObject:", v9);

  v10 = [MOTimeTagInterval alloc];
  v11 = objc_alloc((Class)NSDateInterval);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 11));
  v13 = objc_msgSend(v11, "initWithStartDate:duration:", v12, 10800.0);
  v14 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v10, "initWithTimeTag:dateInterval:", 2001, v13);
  -[NSMutableArray addObject:](v4, "addObject:", v14);

  v15 = [MOTimeTagInterval alloc];
  v16 = objc_alloc((Class)NSDateInterval);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 17));

  v18 = objc_msgSend(v16, "initWithStartDate:duration:", v17, 14400.0);
  v19 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v15, "initWithTimeTag:dateInterval:", 2002, v18);
  -[NSMutableArray addObject:](v4, "addObject:", v19);

  v20 = -[NSMutableArray copy](v4, "copy");
  return v20;
}

+ (unint64_t)mealtagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  double v16;
  double v17;
  id os_log;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  double v37;
  _BYTE v38[128];

  v5 = a3;
  v6 = a4;
  if (!v6
    || (objc_msgSend(v5, "isSameDayWithDate:", v6) & 1) != 0
    || (objc_msgSend(v6, "timeIntervalSinceDate:", v5), v7 <= 43200.0))
  {
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[MOTime buildSimpleMealTagIntervalsForDate:](MOTime, "buildSimpleMealTagIntervalsForDate:", v5));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v27;
      *(_QWORD *)&v11 = 138413058;
      v25 = v11;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v15, "overlapsScoreForStartDate:endDate:", v5, v6, v25, (_QWORD)v26);
          v17 = v16;
          if (v16 > 0.0)
          {
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v19 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v25;
              v31 = v5;
              v32 = 2112;
              v33 = v6;
              v34 = 2112;
              v35 = v15;
              v36 = 2048;
              v37 = v17;
              _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "mealType, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
            }

          }
          if (v17 > 0.7)
          {
            v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v23 = objc_msgSend(v15, "timetag");
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", objc_msgSend(v15, "timetag")));
              *(_DWORD *)buf = v25;
              v31 = v5;
              v32 = 2112;
              v33 = v6;
              v34 = 2048;
              v35 = v23;
              v36 = 2112;
              v37 = *(double *)&v24;
              _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "mealType, startDate, %@, endDate, %@, timetag, %lu(%@)", buf, 0x2Au);

            }
            v8 = objc_msgSend(v15, "timetag");
            goto LABEL_21;
          }
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v12)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_21:

  }
  else
  {
    v8 = 0;
  }

  return (unint64_t)v8;
}

+ (id)timeOfDayPrefixFromDate:(id)a3
{
  return +[MOTime timeOfDayPrefixFromStartDate:endDate:](MOTime, "timeOfDayPrefixFromStartDate:endDate:", a3, 0);
}

+ (id)timeOfDayPrefixFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  id os_log;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  MOTime *v14;
  void *v15;
  void *v16;
  MOTime *v17;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;

  v5 = a3;
  v6 = a4;
  v7 = +[MOTime timetagFromStartDate:endDate:](MOTime, "timetagFromStartDate:endDate:", v5, v6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v7));
    v20 = 138413058;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    v24 = 2048;
    v25 = v7;
    v26 = 2112;
    v27 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, timeTag, %lu(%@)", (uint8_t *)&v20, 0x2Au);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v7));
  if (v10)
  {
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v14 = [MOTime alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timeZone"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
    v17 = -[MOTime initWithTimestamp:timeString:timeZone:timeTag:](v14, "initWithTimestamp:timeString:timeZone:timeTag:", v10, v16, v7, v12);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)dayOfWeekFromDate:(id)a3
{
  return +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:](MOTime, "dayOfWeekFromStartDate:endDate:timeZoneManager:", a3, 0, 0);
}

+ (id)dayOfWeekFromStartDate:(id)a3 endDate:(id)a4 timeZoneManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  _BOOL4 v20;
  id os_log;
  NSObject *v22;
  NSObject *v23;
  unint64_t v24;
  void *v25;
  double v26;
  double v27;
  MOTime *v28;
  void *v29;
  MOTime *v30;
  id v32;
  int v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v22 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:].cold.1();

    v20 = v8 != 0;
    goto LABEL_13;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZoneAtDate:", v7));
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v33 = 138412802;
    v34 = v7;
    v35 = 2112;
    v36 = v11;
    v37 = 2112;
    v38 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "timeZone, startDate, %@, timeZone, %@, source, timeZoneManager, %@", (uint8_t *)&v33, 0x20u);
  }

  if (!v8)
  {
    v20 = 0;
    goto LABEL_13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZoneAtDate:", v7));
  v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:].cold.3();

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if ((v19 & 1) != 0)
  {

    v20 = 1;
LABEL_13:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v7, v11));
    if (v20)
      v23 = objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v8, v11));
    else
      v23 = 0;
    v24 = +[MOTime dayOfWeekTagFromStartDate:endDate:](MOTime, "dayOfWeekTagFromStartDate:endDate:", v14, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v24));
    if (v25)
    {
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v27 = v26;
      v28 = [MOTime alloc];
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      v30 = -[MOTime initWithTimestamp:timeString:timeZone:timeTag:](v28, "initWithTimestamp:timeString:timeZone:timeTag:", v25, v29, v24, v27);

    }
    else
    {
      v30 = 0;
    }

    goto LABEL_20;
  }
  v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v23 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:].cold.2();
  v30 = 0;
LABEL_20:

  return v30;
}

+ (id)timeStringFromTimeTag:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  id result;

  if ((uint64_t)a3 <= 1999)
  {
    switch(a3)
    {
      case 'd':
        result = CFSTR("today");
        break;
      case 'e':
        result = CFSTR("yesterday");
        break;
      case 'f':
        result = CFSTR("Sunday");
        break;
      case 'g':
        result = CFSTR("Monday");
        break;
      case 'h':
        result = CFSTR("Tuesday");
        break;
      case 'i':
        result = CFSTR("Wednesday");
        break;
      case 'j':
        result = CFSTR("Thursday");
        break;
      case 'k':
        result = CFSTR("Friday");
        break;
      case 'l':
        result = CFSTR("Saturday");
        break;
      case 'm':
        result = CFSTR("this week");
        break;
      case 'n':
        result = CFSTR("last week");
        break;
      case 'o':
        result = CFSTR("this month");
        break;
      case 'p':
        result = CFSTR("last month");
        break;
      case 'q':
        result = CFSTR("this year");
        break;
      case 'r':
        result = CFSTR("last year");
        break;
      default:
        switch(a3)
        {
          case 2uLL:
            result = CFSTR("morning");
            break;
          case 3uLL:
            result = CFSTR("prenoon");
            break;
          case 4uLL:
            result = CFSTR("afternoon");
            break;
          case 5uLL:
            result = CFSTR("preevening");
            break;
          case 6uLL:
            result = CFSTR("evening");
            break;
          case 7uLL:
            result = CFSTR("night");
            break;
          case 8uLL:
            result = CFSTR("midnight");
            break;
          default:
            result = 0;
            break;
        }
        break;
    }
  }
  else
  {
    v3 = CFSTR("dinner");
    v4 = CFSTR("weekend");
    if (a3 != 10001)
      v4 = 0;
    if (a3 == 10000)
      v5 = CFSTR("weekday");
    else
      v5 = v4;
    if (a3 != 2002)
      v3 = v5;
    v6 = CFSTR("breakfast");
    v7 = CFSTR("lunch");
    if (a3 != 2001)
      v7 = 0;
    if (a3 != 2000)
      v6 = v7;
    if ((uint64_t)a3 <= 2001)
      return (id)v6;
    else
      return (id)v3;
  }
  return result;
}

+ (id)localizedDateStringFromDate:(id)a3
{
  return +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", a3, 2, 0);
}

+ (unint64_t)typeOfDayTagFromStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  id v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  id v21;
  double v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v29;
  _BYTE buf[12];
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    if (v8 && objc_msgSend(v8, "isBeforeDate:", v7))
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v11 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v7;
        v31 = 2112;
        v32 = v8;
        v33 = 2112;
        v34 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "typeOfDayTagFromStartDate, startDate, %@, endDate, %@, timeZone, %@, the timestamps are inverted.", buf, 0x20u);
      }

      v8 = 0;
    }
    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v7, v9));

      if (!v8)
        goto LABEL_17;
      v13 = objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v8, v9));

      v8 = (id)v13;
      if (!v13)
        goto LABEL_17;
    }
    else
    {
      v12 = v7;
      if (!v8)
        goto LABEL_17;
    }
    if (objc_msgSend(v8, "isBeforeDate:", v12))
    {
      v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v12;
        v31 = 2112;
        v32 = v8;
        v33 = 2112;
        v34 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "typeOfDayTagFromStartDate, startDate, %@, endDate, %@, timeZone, %@, the timestamps are inverted after time zone shifting.", buf, 0x20u);
      }

      v8 = 0;
    }
LABEL_17:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v29 = 0;
    *(_QWORD *)buf = 0;
    v18 = objc_msgSend(v17, "rangeOfWeekendStartDate:interval:containingDate:", &v29, buf, v12);
    v19 = v29;
    v20 = v19;
    if (!v8)
    {
      if (v18)
        v14 = 10001;
      else
        v14 = 0;
      goto LABEL_34;
    }
    if (!v19)
    {
      v14 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v21 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v12, v8);
    objc_msgSend(v21, "duration");
    if (v22 == 0.0)
    {
      v14 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v23 = objc_alloc((Class)NSDateInterval);
    v24 = objc_msgSend(v23, "initWithStartDate:duration:", v20, *(double *)buf);
    if (objc_msgSend(v21, "intersectsDateInterval:", v24))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
      if ((objc_msgSend(v24, "containsDate:", v25) & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate"));
        v27 = objc_msgSend(v24, "containsDate:", v26);

        if (v27)
          v14 = 10001;
        else
          v14 = 0;
        goto LABEL_32;
      }

    }
    v14 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v14 = 0;
LABEL_35:

  return v14;
}

+ (unint64_t)dayOfWeekTagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a3;
  v6 = a4;
  if (v6 && !objc_msgSend(v5, "isSameDayWithDate:", v6))
    v7 = 0;
  else
    v7 = +[MOTime dayOfWeekTagFromDate:](MOTime, "dayOfWeekTagFromDate:", v5);

  return v7;
}

+ (unint64_t)dayOfWeekTagFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id os_log;
  NSObject *v7;
  unint64_t v8;
  id v9;
  NSObject *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
  objc_msgSend(v4, "setFirstWeekday:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 512, v3));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[MOTime dayOfWeekTagFromDate:].cold.2((uint64_t)v3, v5, v7);

  if (objc_msgSend(v5, "weekday") == (id)1)
  {
    v8 = 102;
  }
  else if (objc_msgSend(v5, "weekday") == (id)2)
  {
    v8 = 103;
  }
  else if (objc_msgSend(v5, "weekday") == (id)3)
  {
    v8 = 104;
  }
  else if (objc_msgSend(v5, "weekday") == (id)4)
  {
    v8 = 105;
  }
  else if (objc_msgSend(v5, "weekday") == (id)5)
  {
    v8 = 106;
  }
  else if (objc_msgSend(v5, "weekday") == (id)6)
  {
    v8 = 107;
  }
  else if (objc_msgSend(v5, "weekday") == (id)7)
  {
    v8 = 108;
  }
  else
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MOTime dayOfWeekTagFromDate:].cold.1((uint64_t)v3, v5, v10);

    v8 = 0;
  }

  return v8;
}

+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = +[MOTime dateReferenceTagFromStartDate:endDate:nowDate:timeZone:](MOTime, "dateReferenceTagFromStartDate:endDate:nowDate:timeZone:", v6, v5, v7, 0);

  return v8;
}

+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v11 = +[MOTime dateReferenceTagFromStartDate:endDate:nowDate:timeZone:](MOTime, "dateReferenceTagFromStartDate:endDate:nowDate:timeZone:", v9, v8, v10, v7);

  return v11;
}

+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4 nowDate:(id)a5 timeZone:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v9 && v12)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v9, v12));

    v9 = (id)v14;
  }
  if (v10 && v13)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v10, v13));

    v10 = (id)v15;
  }
  if ((objc_msgSend(v11, "isBeforeDate:", v9) & 1) != 0)
    goto LABEL_10;
  if (!v10)
  {
    if ((objc_msgSend(v11, "isSameDayWithDate:", v9) & 1) != 0)
    {
LABEL_22:
      v16 = 100;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isFollowingDayAfterDate:", v9) & 1) != 0)
    {
LABEL_25:
      v16 = 101;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isSameWeekWithDate:", v9) & 1) != 0)
    {
LABEL_30:
      v16 = 109;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isFollowingWeekAfterDate:", v9) & 1) != 0)
    {
LABEL_33:
      v16 = 110;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isSameMonthWithDate:", v9) & 1) != 0)
    {
LABEL_38:
      v16 = 111;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isFollowingMonthAfterDate:", v9) & 1) != 0)
    {
LABEL_41:
      v16 = 112;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isSameYearWithDate:", v9) & 1) != 0)
    {
LABEL_46:
      v16 = 113;
      goto LABEL_11;
    }
    v18 = v11;
    v19 = v9;
LABEL_49:
    if ((objc_msgSend(v18, "isFollowingYearAfterDate:", v19) & 1) != 0)
    {
      v16 = 114;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(v11, "isBeforeDate:", v10) & 1) == 0)
  {
    if (objc_msgSend(v11, "isSameDayWithDate:", v9)
      && (objc_msgSend(v11, "isSameDayWithDate:", v10) & 1) != 0)
    {
      goto LABEL_22;
    }
    if ((objc_msgSend(v11, "isFollowingDayAfterDate:", v9) & 1) != 0)
    {
      if ((objc_msgSend(v11, "isFollowingDayAfterDate:", v10) & 1) != 0)
        goto LABEL_25;
      if (!objc_msgSend(v11, "isSameWeekWithDate:", v9))
        goto LABEL_31;
    }
    else if ((objc_msgSend(v11, "isSameWeekWithDate:", v9) & 1) == 0)
    {
      goto LABEL_31;
    }
    if ((objc_msgSend(v11, "isSameWeekWithDate:", v10) & 1) != 0)
      goto LABEL_30;
LABEL_31:
    if ((objc_msgSend(v11, "isFollowingWeekAfterDate:", v9) & 1) != 0)
    {
      if ((objc_msgSend(v11, "isFollowingWeekAfterDate:", v10) & 1) != 0)
        goto LABEL_33;
      if (!objc_msgSend(v11, "isSameMonthWithDate:", v9))
        goto LABEL_39;
    }
    else if ((objc_msgSend(v11, "isSameMonthWithDate:", v9) & 1) == 0)
    {
      goto LABEL_39;
    }
    if ((objc_msgSend(v11, "isSameMonthWithDate:", v10) & 1) != 0)
      goto LABEL_38;
LABEL_39:
    if ((objc_msgSend(v11, "isFollowingMonthAfterDate:", v9) & 1) != 0)
    {
      if ((objc_msgSend(v11, "isFollowingMonthAfterDate:", v10) & 1) != 0)
        goto LABEL_41;
      if (objc_msgSend(v11, "isSameYearWithDate:", v9))
      {
LABEL_45:
        if ((objc_msgSend(v11, "isSameYearWithDate:", v10) & 1) != 0)
          goto LABEL_46;
      }
    }
    else if ((objc_msgSend(v11, "isSameYearWithDate:", v9) & 1) != 0)
    {
      goto LABEL_45;
    }
    if ((objc_msgSend(v11, "isFollowingYearAfterDate:", v9) & 1) == 0)
      goto LABEL_10;
    v18 = v11;
    v19 = v10;
    goto LABEL_49;
  }
LABEL_10:
  v16 = 1;
LABEL_11:

  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime identifier](self, "identifier"));
  -[MOTime timestamp](self, "timestamp");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime timeString](self, "timeString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime timeZone](self, "timeZone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime localTime](self, "localTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOTime identifier, %@, timestamp, %f, timeString, %@, timeZone, %@, localTime, %@, timeTag, %lu, dateReferenceTag, %lu>"), v3, v5, v6, v7, v8, -[MOTime timeTag](self, "timeTag"), -[MOTime dateReferenceTag](self, "dateReferenceTag")));

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOTime)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  MOTime *v18;
  MOTime *v19;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
  v9 = v8;
  v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("timeString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v13), CFSTR("timeZone"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timeTag"));
  v17 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dateReferenceTag"));

  v18 = -[MOTime initWithIdentifier:timestamp:timeString:timeZone:timeTag:](self, "initWithIdentifier:timestamp:timeString:timeZone:timeTag:", v7, v12, v15, v16, v9);
  v19 = v18;
  if (v18)
    -[MOTime setDateReferenceTag:](v18, "setDateReferenceTag:", v17);

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeString, CFSTR("timeString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_timeTag, CFSTR("timeTag"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_dateReferenceTag, CFSTR("dateReferenceTag"));

}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOTime *v5;
  uint64_t v6;
  MOTime *v7;
  uint64_t v8;
  MOTime *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = (MOTime *)a3;
  v7 = v5;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    if (v5)
    {
      v8 = objc_opt_class(self, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = v7;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime identifier](self, "identifier"));
        if (v10 || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime identifier](v9, "identifier"))) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime identifier](self, "identifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOTime identifier](v9, "identifier"));
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (v10)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v13 = 1;
        }

        goto LABEL_12;
      }
    }
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)timeString
{
  return self->_timeString;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (unint64_t)timeTag
{
  return self->_timeTag;
}

- (unint64_t)dateReferenceTag
{
  return self->_dateReferenceTag;
}

- (void)setDateReferenceTag:(unint64_t)a3
{
  self->_dateReferenceTag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOTime initWithIdentifier:]";
  v3 = 1024;
  v4 = 102;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

+ (void)timeFromStartDate:endDate:timeZoneManager:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_8((void *)&_mh_execute_header, v0, v1, "timeZone, date, %@, timeZone, %@, source, system");
  OUTLINED_FUNCTION_1();
}

+ (void)timetagFromStartDate:endDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_8((void *)&_mh_execute_header, v0, v1, "timeOfDay, startDate, %@, endDate, %@, skip");
  OUTLINED_FUNCTION_1();
}

+ (void)dayOfWeekFromStartDate:endDate:timeZoneManager:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_8((void *)&_mh_execute_header, v0, v1, "timeZone, startDate, %@, timeZone, %@, source, system");
  OUTLINED_FUNCTION_1();
}

+ (void)dayOfWeekFromStartDate:endDate:timeZoneManager:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_8((void *)&_mh_execute_header, v0, v1, "timeZone crossing, timeZone, %@, endTimeZone, %@");
  OUTLINED_FUNCTION_1();
}

+ (void)dayOfWeekFromStartDate:endDate:timeZoneManager:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_8((void *)&_mh_execute_header, v0, v1, "timeZone, endDate, %@, timeZone, %@, source, system");
  OUTLINED_FUNCTION_1();
}

+ (void)dayOfWeekTagFromDate:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint8_t v4[24];

  OUTLINED_FUNCTION_5_8(a1, a2);
  OUTLINED_FUNCTION_2_4();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "dayOfWeekTagFromDate, cannot read weekday, date, %@, weekday, %lu", v4, 0x16u);
  OUTLINED_FUNCTION_5();
}

+ (void)dayOfWeekTagFromDate:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint8_t v4[24];

  OUTLINED_FUNCTION_5_8(a1, a2);
  OUTLINED_FUNCTION_2_4();
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "dayOfWeekTagFromDate, date, %@, weekday, %lu", v4, 0x16u);
  OUTLINED_FUNCTION_5();
}

@end
