@implementation EnergyTelemetry

- (EnergyTelemetry)init
{
  id v2;
  os_log_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  EnergyTelemetry *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;
  __int128 v30;
  uint64_t v31;

  v29.receiver = self;
  v29.super_class = (Class)EnergyTelemetry;
  v2 = -[EnergyTelemetry init](&v29, "init");
  v3 = os_log_create("com.apple.powerdatad", "energyTelemetry");
  v4 = (void *)*((_QWORD *)v2 + 5);
  *((_QWORD *)v2 + 5) = v3;

  if (!*((_QWORD *)v2 + 5))
  {
    v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v20)
      sub_10000A714(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_18;
  }
  v5 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)*((_QWORD *)v2 + 4);
  *((_QWORD *)v2 + 4) = v5;

  if (!*((_QWORD *)v2 + 4))
  {
    if (os_log_type_enabled(*((os_log_t *)v2 + 5), OS_LOG_TYPE_ERROR))
      sub_10000A748();
    goto LABEL_18;
  }
  v7 = objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
  v8 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v7;

  if (!*((_QWORD *)v2 + 1))
  {
    if (os_log_type_enabled(*((os_log_t *)v2 + 5), OS_LOG_TYPE_ERROR))
      sub_10000A774();
    goto LABEL_18;
  }
  v9 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v10 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v9;

  v11 = (void *)*((_QWORD *)v2 + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v11, "setTimeZone:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getUTCMidnightFor:", v13));
  v15 = (void *)*((_QWORD *)v2 + 3);
  *((_QWORD *)v2 + 3) = v14;

  if (!*((_QWORD *)v2 + 3))
  {
    if (os_log_type_enabled(*((os_log_t *)v2 + 5), OS_LOG_TYPE_ERROR))
      sub_10000A7A0();
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  if (!qword_100014B20)
  {
    v30 = off_100010680;
    v31 = 0;
    qword_100014B20 = _sl_dlopen(&v30, 0);
  }
  if (qword_100014B20)
  {
    v16 = objc_msgSend(sub_100004F88(), "managerWithID:locationBundlePath:", CFSTR("com.apple.powerdatad.gridManager"), CFSTR("/System/Library/LocationBundles/WirelessDiagnostics.bundle"));
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v17;

  }
  v19 = (EnergyTelemetry *)v2;
LABEL_19:

  return v19;
}

+ (id)sharedInstance
{
  if (qword_100014B18 != -1)
    dispatch_once(&qword_100014B18, &stru_1000105D0);
  return (id)qword_100014B10;
}

- (id)getUTCMidnightFor:(id)a3
{
  id v4;
  NSDate **p_utcMidnight;
  NSDate *v6;
  NSDate *utcMidnight;
  OS_os_log *log;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSDate *v15;

  v4 = a3;
  if (v4)
  {
    p_utcMidnight = &self->_utcMidnight;
    if (!self->_utcMidnight || !-[NSCalendar isDate:inSameDayAsDate:](self->_utcCal, "isDate:inSameDayAsDate:", v4))
    {
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateBySettingHour:minute:second:ofDate:options:](self->_utcCal, "dateBySettingHour:minute:second:ofDate:options:", 0, 0, 0, v4, 0));
      utcMidnight = self->_utcMidnight;
      self->_utcMidnight = v6;

      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
        sub_10000A7F8((uint64_t)p_utcMidnight, log, v9, v10, v11, v12, v13, v14);
    }
    v15 = *p_utcMidnight;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10000A7CC();
    v15 = 0;
  }

  return v15;
}

- (unsigned)getSlotWithDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  unsigned int v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", v4));
  if (v5)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = (v6 / 60.0) / 0xF;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10000A860();
    v7 = -1;
  }

  return v7;
}

- (BOOL)recordLastAccumulatedEnergyTelemetry:(id)a3
{
  id v4;
  NSUserDefaults *v5;

  v4 = a3;
  v5 = self->_defaults;
  objc_sync_enter(v5);
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v4, CFSTR("last_telemetry_baseline"));
  objc_sync_exit(v5);

  return 1;
}

- (id)getLastAccumulatedEnergyTelemetry
{
  NSUserDefaults *v3;
  void *v4;

  v3 = self->_defaults;
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:", CFSTR("last_telemetry_baseline")));
  objc_sync_exit(v3);

  return v4;
}

- (id)getIncrementalEnergyRecord
{
  NSUserDefaults *v3;
  void *v4;

  v3 = self->_defaults;
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults arrayForKey:](self->_defaults, "arrayForKey:", CFSTR("incremental_telemetry_array")));
  objc_sync_exit(v3);

  return v4;
}

- (void)setIncrementalEnergyRecord:(id)a3
{
  NSUserDefaults *v4;
  id v5;

  v5 = a3;
  v4 = self->_defaults;
  objc_sync_enter(v4);
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v5, CFSTR("incremental_telemetry_array"));
  objc_sync_exit(v4);

}

- (id)getDateFrom:(id)a3 alignedToMinutes:(unint64_t)a4
{
  unint64_t v5;
  NSCalendar *utcCal;
  id v7;
  void *v8;
  void *v9;

  if (a3)
  {
    if (a4)
      v5 = a4;
    else
      v5 = 60;
    utcCal = self->_utcCal;
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](utcCal, "components:fromDate:", 96, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateBySettingHour:minute:second:ofDate:options:](self->_utcCal, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v8, "hour"), (unint64_t)objc_msgSend(v8, "minute") / v5 * v5, 0, v7, 0));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)isBAInfoAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint8_t);
  void *v17;
  uint64_t *v18;

  if (!qword_100014B20)
  {
    v15 = off_100010680;
    v16 = 0;
    qword_100014B20 = _sl_dlopen(&v15, 0);
  }
  if (!qword_100014B20)
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v8 = (void *)qword_100014B30;
  v14 = qword_100014B30;
  if (!qword_100014B30)
  {
    *(_QWORD *)&v15 = _NSConcreteStackBlock;
    *((_QWORD *)&v15 + 1) = 3221225472;
    v16 = sub_100008970;
    v17 = &unk_1000106A0;
    v18 = &v11;
    sub_100008970((uint64_t)&v15, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v11);
    v8 = (void *)v12[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v11, 8);
  return objc_opt_class(v9) != 0;
}

- (id)findDayStarts:(id)a3 returnMidnights:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  void *v10;
  char *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  id v19;
  void *v20;

  v5 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("slot_date"), 1));
  v20 = v17;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v5, "sortUsingDescriptors:", v6);

  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 7));
  v8 = (char *)objc_msgSend(v5, "count");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    for (i = 0; i != v9; ++i)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("slot_date")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", v13));

      if (v14 && (objc_msgSend(v10, "isEqualToDate:", v14) & 1) == 0)
      {
        objc_msgSend(v19, "addIndex:", i);
        objc_msgSend(v7, "addObject:", v14);
        v15 = v14;

        v10 = v15;
      }

    }
  }
  else
  {
    v10 = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v19;
}

- (id)appendIncrementalData:(id)a3 toRecords:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") < 0x2A0)
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("slot_date")));
      if (!v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("telemetry_date")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getDateFrom:alignedToMinutes:](self, "getDateFrom:alignedToMinutes:", v11, 15));

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("slot_date")));
      if (objc_msgSend(v12, "isEqualToDate:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
        objc_msgSend(v13, "doubleValue");
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
        objc_msgSend(v16, "doubleValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15 + v17));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("wall_energy_consumed"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("system_energy_consumed")));
        objc_msgSend(v19, "doubleValue");
        v21 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("system_energy_consumed")));
        objc_msgSend(v22, "doubleValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21 + v23));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("system_energy_consumed"));

        objc_msgSend(v7, "removeLastObject");
      }
      objc_msgSend(v7, "addObject:", v6);
      v8 = v6;

    }
    else
    {
      objc_msgSend(v7, "addObject:", v6);
      v8 = v6;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10000A8C0();
    v8 = 0;
  }

  return v8;
}

- (void)getEnergyTelemetry
{
  EnergyTelemetry *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *log;
  BOOL v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  NSObject *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *i;
  void *v67;
  BOOL v68;
  _BOOL4 v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  id v80;
  uint64_t v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  char *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  _QWORD v96[2];
  uint8_t v97[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getIncrementalEnergyRecord](v2, "getIncrementalEnergyRecord"));
  v4 = objc_msgSend(v3, "mutableCopy");

  if (!v4)
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v92 = v4;
  v5 = v2->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10000AAFC((int)objc_msgSend(v4, "count"), v97, v5);

  v6 = -[EnergyTelemetry copyAccumulatedEnergyTelemetry](v2, "copyAccumulatedEnergyTelemetry");
  if (v6)
  {
    if (objc_msgSend(v92, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "lastObject"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("slot_date")));
      v9 = v8 == 0;

      if (v9)
      {
        if (os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_DEBUG))
          sub_10000AAD0();
        v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));

        -[EnergyTelemetry setIncrementalEnergyRecord:](v2, "setIncrementalEnergyRecord:", v10);
        v92 = (void *)v10;
      }
    }
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getLastAccumulatedEnergyTelemetry](v2, "getLastAccumulatedEnergyTelemetry"));
    if (v90)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("system_energy_consumed")));
      objc_msgSend(v11, "doubleValue");
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("system_energy_consumed")));
      objc_msgSend(v14, "doubleValue");
      if (v13 < v15)
      {
        v21 = 1;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
        objc_msgSend(v16, "doubleValue");
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
        objc_msgSend(v19, "doubleValue");
        v21 = v18 < v20;

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("telemetry_date")));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "laterDate:", v24));
      v89 = v23;
      v22 = v25 == v23;

      if (v22)
      {
        log = v2->_log;
        v22 = 1;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v94 = v89;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Last accumulated-energy date %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v89 = 0;
      v22 = 0;
      v21 = 0;
    }
    if (os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_DEBUG))
      sub_10000AA70();
    if (v90)
      v27 = v89 == 0;
    else
      v27 = 1;
    v28 = v27 || v21;
    if ((v22 | v28) == 1)
    {
      v29 = v2->_log;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v94 = v90;
        v95 = 1024;
        LODWORD(v96[0]) = v21;
        WORD2(v96[0]) = 1024;
        *(_DWORD *)((char *)v96 + 6) = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Recreating baseline. lastData %@ negativeDelta %u, lastDateInFuture %u", buf, 0x18u);
      }
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("telemetry_date")));
      objc_msgSend(v31, "timeIntervalSinceDate:", v89);
      v33 = v32;

      v34 = v2->_log;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        sub_10000A9F4((uint64_t)v90, v34, v33);
      if (v33 <= 14400.0)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("system_energy_consumed")));
        objc_msgSend(v35, "doubleValue");
        v37 = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("system_energy_consumed")));
        objc_msgSend(v38, "doubleValue");
        v40 = v39;

        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
        objc_msgSend(v41, "doubleValue");
        v43 = v42;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
        objc_msgSend(v44, "doubleValue");
        v46 = v45;

        v47 = (id)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getDateFrom:alignedToMinutes:](v2, "getDateFrom:alignedToMinutes:", v89, 15));
        v48 = v89;
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("telemetry_date")));
        v49 = v48;
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("telemetry_date")));
        objc_msgSend(v50, "timeIntervalSinceDate:", v47);
        v52 = v51;

        v53 = objc_msgSend(v92, "count");
        v54 = v53;
        if (v53 == (id)672 || 672 - (uint64_t)v53 >= (uint64_t)vcvtpd_s64_f64(v52 / 900.0))
        {
          v57 = v49;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_ERROR))
            sub_10000A978();
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getDateFrom:alignedToMinutes:](v2, "getDateFrom:alignedToMinutes:", v91, 15));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "dateByAddingTimeInterval:", -(double)(900 * (671 - (uint64_t)v54))));

          v47 = v56;
          v57 = v47;
        }
        v87 = v47;
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "dateByAddingTimeInterval:", 900.0));
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getDateFrom:alignedToMinutes:](v2, "getDateFrom:alignedToMinutes:", v91, 15));
        objc_msgSend(v58, "timeIntervalSinceDate:", v57);
        v61 = v60;
        v85 = v57;
        v86 = v58;
        objc_msgSend(v91, "timeIntervalSinceDate:", v57);
        v63 = v62;
        v88 = 0;
        v64 = v37 - v40;
        v65 = v43 - v46;
        for (i = v87; ; i = (void *)v81)
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "laterDate:", i));
          v68 = v61 > 0.001 && v67 == v59;
          v69 = v68;

          if (!v69)
            break;
          if (v61 <= v63)
            v70 = v61;
          else
            v70 = v63;
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[EnergyTelemetry getSlotWithDate:](v2, "getSlotWithDate:", i)));
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v72, CFSTR("slot_id"));

          objc_msgSend(v71, "setObject:forKeyedSubscript:", i, CFSTR("slot_date"));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("adapter_family")));
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v73, CFSTR("adapter_family"));

          v74 = v70 / v63;
          v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v65 * v74));
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v75, CFSTR("wall_energy_consumed"));

          v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v64 * v74));
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v76, CFSTR("system_energy_consumed"));

          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("balancing_authority_id")));
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v77, CFSTR("balancing_authority_id"));

          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("telemetry_date")));
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v78, CFSTR("telemetry_date"));

          v79 = v2->_log;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "description"));
            *(_DWORD *)buf = 134218242;
            v94 = v88;
            v95 = 2112;
            v96[0] = v84;
            _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "Segment %lu telemetry %@", buf, 0x16u);

            ++v88;
          }

          v80 = -[EnergyTelemetry appendIncrementalData:toRecords:](v2, "appendIncrementalData:toRecords:", v71, v92);
          v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(i, "dateByAddingTimeInterval:", 900.0));

          objc_msgSend(v91, "timeIntervalSinceDate:", v81);
          v83 = v82;

          v61 = fmin(fabs(v83), 900.0);
        }
        -[EnergyTelemetry setIncrementalEnergyRecord:](v2, "setIncrementalEnergyRecord:", v92);
        -[EnergyTelemetry recordLastAccumulatedEnergyTelemetry:](v2, "recordLastAccumulatedEnergyTelemetry:", v6);

        v30 = v89;
        goto LABEL_60;
      }
      if (os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_ERROR))
        sub_10000A94C();
    }
    -[EnergyTelemetry recordLastAccumulatedEnergyTelemetry:](v2, "recordLastAccumulatedEnergyTelemetry:", v6);
    v30 = v89;
LABEL_60:

    goto LABEL_61;
  }
  if (os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_DEBUG))
    sub_10000A920();
LABEL_61:

  objc_sync_exit(v2);
}

- (id)copyAccumulatedEnergyTelemetry
{
  id v3;
  void *v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_object_t v7;
  const __CFDictionary *CFProperty;
  const __CFDictionary *v9;
  const __CFNumber *Value;
  uint64_t v11;
  id v12;
  void *v13;
  const __CFNumber *v14;
  uint64_t v15;
  void *v16;
  const __CFDictionary *v17;
  const __CFNumber *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  const __CFString *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t valuePtr;
  __int128 v28;
  uint64_t v29;

  v26 = 0;
  valuePtr = 0;
  v25 = 0;
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("telemetry_date"));

  v5 = IOServiceMatching("AppleSmartBattery");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if (!MatchingService)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10000AB40();
    goto LABEL_9;
  }
  v7 = MatchingService;
  CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("PowerTelemetryData"), kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v7);
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10000AB6C();
LABEL_9:
    v12 = 0;
    goto LABEL_30;
  }
  v9 = CFProperty;
  Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, CFSTR("AccumulatedWallEnergyEstimate"));
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
    v11 = valuePtr;
  }
  else
  {
    v11 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("wall_energy_consumed"));

  v14 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("AccumulatedSystemEnergyConsumed"));
  if (v14)
  {
    CFNumberGetValue(v14, kCFNumberSInt64Type, &v26);
    v15 = v26;
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v15));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("system_energy_consumed"));

  v17 = (const __CFDictionary *)IORegistryEntryCreateCFProperty(v7, CFSTR("AdapterDetails"), kCFAllocatorDefault, 0);
  v18 = (const __CFNumber *)CFDictionaryGetValue(v17, CFSTR("FamilyCode"));
  if (v18)
  {
    CFNumberGetValue(v18, kCFNumberSInt64Type, &v25);
    v19 = v25;
  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v19));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("adapter_family"));

  CFRelease(v17);
  CFRelease(v9);
  IOObjectRelease(v7);
  if (!qword_100014B20)
  {
    v28 = off_100010680;
    v29 = 0;
    qword_100014B20 = _sl_dlopen(&v28, 0);
  }
  if (!qword_100014B20
    || !sub_100004B10()
    || !-[EnergyTelemetry isBAInfoAvailable](self, "isBAInfoAvailable"))
  {
    goto LABEL_25;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getBalancingAuthority](self, "getBalancingAuthority"));
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));

  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_10000AB98();
LABEL_25:
    v22 = 0;
  }
  if (v22)
    v23 = v22;
  else
    v23 = &stru_100010C58;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("balancing_authority_id"));
  v12 = v3;

LABEL_30:
  return v12;
}

- (id)calcSlotValueFromEnergy:(double)a3 withIntensity:(double)a4
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3 * a4 / 1000000000.0);
}

- (void)calculateEnergyAndPublishTelemetry
{
  EnergyTelemetry *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  _UNKNOWN **v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  NSObject *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  char *v36;
  int v37;
  char *v38;
  char *v39;
  int v40;
  char *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  char v48;
  char *v49;
  void *v50;
  void *v51;
  BOOL v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  NSObject *v65;
  __int128 v66;
  uint64_t v67;
  void *v68;
  os_log_t *obj;
  void *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  id v78;
  uint8_t v79[16];
  uint64_t v80;

  v2 = self;
  objc_sync_enter(v2);
  obj = (os_log_t *)v2;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getIncrementalEnergyRecord](v2, "getIncrementalEnergyRecord"));
  v71 = objc_msgSend(v3, "mutableCopy");

  if (v71 && objc_msgSend(v71, "count"))
  {
    if (objc_msgSend(v71, "count")
      && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "lastObject")),
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("slot_date"))),
          v5,
          v4,
          !v5))
    {
      if (os_log_type_enabled(obj[5], OS_LOG_TYPE_ERROR))
        sub_10000AC94();
    }
    else
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t findDayStarts:returnMidnights:](obj, "findDayStarts:returnMidnights:", v71, 0));
      if (!qword_100014B20)
      {
        *(_OWORD *)v79 = off_100010680;
        v80 = 0;
        qword_100014B20 = _sl_dlopen(v79, 0);
      }
      if (qword_100014B20)
      {
        if (sub_100004B10() && -[os_log_t isBAInfoAvailable](obj, "isBAInfoAvailable"))
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t fetchEmissionHistoriesForDays:fromRecords:](obj, "fetchEmissionHistoriesForDays:fromRecords:", v68, v71));
          v7 = obj[5];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            sub_10000AC50(v79, (uint64_t)objc_msgSend(v6, "count"), v7);

          v67 = objc_msgSend(v71, "count");
          if (v67)
          {
            v9 = 0;
            *(_QWORD *)&v8 = 138412290;
            v66 = v8;
            do
            {
              v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndexedSubscript:", v9, v66));
              v11 = objc_msgSend(v10, "mutableCopy");

              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("telemetry_date")));
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("slot_date")));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v13));
              v15 = v14;
              if (v13)
              {
                if (v14)
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("average")));
                  if (!v16
                    || (v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
                        v18 = v16 == v17,
                        v17,
                        v18))
                  {
                    v24 = obj[5];
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = v66;
                      v78 = v11;
                      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "systemwide emissions data wasn't found for record: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("marginal")));
                    if (!v19
                      || (v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
                          v21 = v19 == v20,
                          v20,
                          v21))
                    {

                      v26 = obj[5];
                      v22 = &off_100011350;
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = v66;
                        v78 = v11;
                        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "marginal emissions data wasn't found for record: %@", buf, 0xCu);
                      }
                    }
                    else
                    {
                      v22 = (_UNKNOWN **)v19;
                    }
                    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
                    objc_msgSend(v27, "doubleValue");
                    v29 = v28;
                    objc_msgSend(v16, "doubleValue");
                    v31 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t calcSlotValueFromEnergy:withIntensity:](obj, "calcSlotValueFromEnergy:withIntensity:", v29, v30));
                    objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, CFSTR("carbon_footprint"));

                    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("avg_intensity"));
                    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("marginal_intensity"));
                    objc_msgSend(v71, "setObject:atIndexedSubscript:", v11, v9);
                    objc_msgSend(v70, "addIndex:", objc_msgSend(v71, "indexOfObject:", v11));
                    v32 = obj[5];
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = v66;
                      v78 = v11;
                      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Calculated carbon %@", buf, 0xCu);
                    }

                  }
                }
                else
                {
                  v25 = obj[5];
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v66;
                    v78 = v11;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "emissions data wasn't found for record: %@", buf, 0xCu);
                  }
                }
              }
              else
              {
                v23 = obj[5];
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v66;
                  v78 = v11;
                  _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "calculateEnergy tried to process a record in the old format: %@", buf, 0xCu);
                }
              }

              ++v9;
            }
            while (v67 != v9);
          }
          v33 = 1;
        }
        else
        {
          v33 = 0;
          v6 = &__NSDictionary0__struct;
        }
        if (sub_100004B10())
        {
          if ((-[os_log_t isBAInfoAvailable](obj, "isBAInfoAvailable") & 1) == 0)
          {
            v34 = obj[5];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "GridDataServices framework unavailable", buf, 2u);
            }
          }
        }

      }
      else
      {
        v33 = 0;
      }
      v35 = (uint64_t)objc_msgSend(v68, "count");
      v36 = (char *)objc_msgSend(v68, "firstIndex");
      v37 = v33 ^ 1;
      while (v36 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v38 = (char *)objc_msgSend(v68, "indexGreaterThanIndex:", v36);
        v39 = v38;
        if (v38 == (char *)0x7FFFFFFFFFFFFFFFLL)
          break;
        if (v35 > 4)
          v40 = 1;
        else
          v40 = v37;
        if (v40 == 1 && v38 > v36)
        {
          v41 = v36;
          do
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndexedSubscript:", v41));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("carbon_footprint")));

            if (!v43)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndexedSubscript:", v41));
              v45 = objc_msgSend(v44, "mutableCopy");

              objc_msgSend(v45, "setObject:forKeyedSubscript:", &stru_100010C58, CFSTR("balancing_authority_id"));
              objc_msgSend(v45, "setObject:forKeyedSubscript:", &off_100011360, CFSTR("avg_intensity"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
              objc_msgSend(v46, "doubleValue");
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t calcSlotValueFromEnergy:withIntensity:](obj, "calcSlotValueFromEnergy:withIntensity:"));
              objc_msgSend(v45, "setObject:forKeyedSubscript:", v47, CFSTR("carbon_footprint"));

              objc_msgSend(v71, "setObject:atIndexedSubscript:", v45, v41);
            }
            ++v41;
          }
          while (v39 != v41);
        }
        if (v39 <= v36)
          goto LABEL_63;
        v48 = 1;
        v49 = v36;
        do
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndexedSubscript:", v49));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("carbon_footprint")));
          v52 = v51 != 0;

          v48 &= v52;
          ++v49;
        }
        while (v39 != v49);
        if ((v48 & 1) != 0)
        {
LABEL_63:
          -[os_log_t sendDayToCoreAnalytics:ofRecord:](obj, "sendDayToCoreAnalytics:ofRecord:", v36, v39 - v36, v71);
          -[os_log_t sendDayToPowerlog:ofRecord:](obj, "sendDayToPowerlog:ofRecord:", v36, v39 - v36, v71);
          objc_msgSend(v70, "addIndexesInRange:", v36, v39 - v36);
        }
        --v35;
        v36 = (char *)objc_msgSend(v68, "indexGreaterThanIndex:", v36);
      }
      if (objc_msgSend(v70, "count"))
      {
        v53 = obj[5];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v70;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Pruning processed records %@", buf, 0xCu);
        }
        objc_msgSend(v71, "removeObjectsAtIndexes:", v70);
        objc_msgSend(v70, "removeAllIndexes");
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "dateByAddingTimeInterval:", -345600.0));

      if (os_log_type_enabled(obj[5], OS_LOG_TYPE_DEBUG))
        sub_10000ABF0();
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v56 = v71;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v57)
      {
        v58 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v57; i = (char *)i + 1)
          {
            if (*(_QWORD *)v73 != v58)
              objc_enumerationMutation(v56);
            v60 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("telemetry_date")));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "earlierDate:", v55));
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("telemetry_date")));
            v64 = v62 == v63;

            if (v64)
              objc_msgSend(v70, "addIndex:", objc_msgSend(v56, "indexOfObject:", v60));
          }
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
        }
        while (v57);
      }

      v65 = obj[5];
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v70;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Pruning expired records %@", buf, 0xCu);
      }
      objc_msgSend(v56, "removeObjectsAtIndexes:", v70);
      -[os_log_t setIncrementalEnergyRecord:](obj, "setIncrementalEnergyRecord:", v56);

    }
  }
  else if (os_log_type_enabled(obj[5], OS_LOG_TYPE_ERROR))
  {
    sub_10000ABC4();
  }

  objc_sync_exit(obj);
}

- (id)getBalancingAuthority
{
  id v3;
  void *v4;
  NSObject *log;
  OS_os_log *v6;
  __int128 v8;
  uint64_t v9;

  v3 = sub_100004F88();
  if (!objc_opt_class(v3) || !-[EnergyTelemetry isBAInfoAvailable](self, "isBAInfoAvailable"))
    goto LABEL_8;
  if (!qword_100014B20)
  {
    v8 = off_100010680;
    v9 = 0;
    qword_100014B20 = _sl_dlopen(&v8, 0);
  }
  if (qword_100014B20)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_GDSManager latestBalancingAuthority](self->gridManager, "latestBalancingAuthority"));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      sub_10000ACC0(log, v4);
  }
  else
  {
LABEL_8:
    v6 = self->_log;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "GridDataServices framework unavailable", (uint8_t *)&v8, 2u);
    }
    v4 = 0;
  }
  return v4;
}

- (void)sendDayToPowerlog:(_NSRange)a3 ofRecord:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  OS_os_log *log;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  OS_os_log *v33;
  __int128 v34;
  NSUInteger v35;
  NSUInteger v36;
  EnergyTelemetry *v37;
  void *v38;
  void *v39;
  void *v40;
  NSUInteger v41;
  uint64_t v42;
  void *context;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _QWORD v55[9];

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (length)
  {
    v55[0] = CFSTR("telemetry_date");
    v55[1] = CFSTR("slot_id");
    v55[2] = CFSTR("wall_energy_consumed");
    v55[3] = CFSTR("system_energy_consumed");
    v55[4] = CFSTR("adapter_family");
    v55[5] = CFSTR("balancing_authority_id");
    v55[6] = CFSTR("avg_intensity");
    v55[7] = CFSTR("marginal_intensity");
    v55[8] = CFSTR("carbon_footprint");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 9));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, CFSTR("Keys"));
    v42 = 0;
    v8 = 0;
    *(_QWORD *)&v9 = 138412290;
    v34 = v9;
    v10 = v7;
    v37 = self;
    v38 = v7;
    v35 = location;
    v36 = length;
    do
    {
      context = objc_autoreleasePoolPush();
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v8 + location));
      v12 = objc_msgSend(v11, "mutableCopy");

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sent_to_powerlog")));
      if (v13)
      {
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v34;
          v49 = v12;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Skipping %@ as it was already sent to powerlog.", buf, 0xCu);
        }
      }
      else
      {
        v41 = v8 + location;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v16 = v39;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(_QWORD *)v45 != v19)
                objc_enumerationMutation(v16);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), v34));
              if (v21)
              {
                objc_msgSend(v15, "addObject:", v21);
              }
              else
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                objc_msgSend(v15, "addObject:", v22);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
          }
          while (v18);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v42));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v15, v23);

        ++v42;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("sent_to_powerlog"));
        v10 = v38;
        objc_msgSend(v38, "setObject:atIndexedSubscript:", v12, v41);

        length = v36;
        self = v37;
        location = v35;
      }

      objc_autoreleasePoolPop(context);
      ++v8;
    }
    while (v8 != length);
    v7 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v42));
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v24, CFSTR("NumRows"));

    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    {
      sub_10000ADA8();
      if (v42)
        goto LABEL_20;
    }
    else if (v42)
    {
LABEL_20:
      v25 = self->_log;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v25;
        v27 = objc_msgSend(v40, "count");
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", &off_100011370));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", 0));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v42 - 1));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", v30));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", 0));
        *(_DWORD *)buf = 134218498;
        v49 = v27;
        v50 = 2112;
        v51 = v29;
        v52 = 2112;
        v53 = v32;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sending %lu entries to powerlog. Start %@ End %@", buf, 0x20u);

      }
      PLLogRegisteredEvent(121, CFSTR("EnergyTelemetry"), v40, 0);
    }

    goto LABEL_26;
  }
  v33 = self->_log;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v33, OS_LOG_TYPE_DEFAULT, "Nothing to send to powerlog.", buf, 2u);
  }
LABEL_26:

}

- (void)sendDayToCoreAnalytics:(_NSRange)a3 ofRecord:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  double v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  OS_os_log *log;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  OS_os_log *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  OS_os_log *v32;
  NSUInteger v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (length)
  {
    v33 = location;
    if (location >= location + length)
    {
      v9 = 1;
      v11 = 0.0;
      v10 = 0.0;
      v8 = 0.0;
    }
    else
    {
      v8 = 0.0;
      v9 = 1;
      v10 = 0.0;
      v11 = 0.0;
      do
      {
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", location));
        v14 = objc_msgSend(v13, "mutableCopy");

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("avg_intensity")));
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("balancing_authority_id")));
          v17 = objc_msgSend(&stru_100010C58, "isEqualToString:", v16);

          v9 &= v17;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sent_to_coreanalytics")));

        if (v18)
        {
          log = self->_log;
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v14;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Skipping %@ as it was already sent to Core Analytics.", buf, 0xCu);
          }
        }
        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("carbon_footprint")));
          objc_msgSend(v20, "doubleValue");
          v8 = v8 + v21;

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
          objc_msgSend(v22, "doubleValue");
          v10 = v10 + v23;

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("system_energy_consumed")));
          objc_msgSend(v24, "doubleValue");
          v11 = v11 + v25;

          -[EnergyTelemetry sendSlotEventToCoreAnalytics:](self, "sendSlotEventToCoreAnalytics:", v14);
          objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("sent_to_coreanalytics"));
          objc_msgSend(v7, "setObject:atIndexedSubscript:", v14, location);
        }

        objc_autoreleasePoolPop(v12);
        ++location;
        --length;
      }
      while (length);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v33));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("slot_date")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", v28));

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v33));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("balancing_authority_id")));

    v32 = self->_log;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413826;
      v35 = v29;
      v36 = 2112;
      v37 = v31;
      v38 = 2048;
      v39 = v8;
      v40 = 2048;
      v41 = v10;
      v42 = 2048;
      v43 = v11;
      v44 = 1024;
      v45 = v9 & 1;
      v46 = 2048;
      v47 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEBUG, "sending daily summary: %@ \"%@\" %.20e %.20e %.20e %d %p", buf, 0x44u);
    }
    -[EnergyTelemetry sendDailySummaryToCoreAnalyticsForDate:withLocation:withCarbon:withEnergy:withSystem:missingIntensity:](self, "sendDailySummaryToCoreAnalyticsForDate:withLocation:withCarbon:withEnergy:withSystem:missingIntensity:", v29, v31, v9 & 1, v8, v10, v11);

  }
  else
  {
    v26 = self->_log;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "Nothing to send to Core Analytics.", buf, 2u);
    }
  }

}

- (void)sendDailySummaryToCoreAnalyticsForDate:(id)a3 withLocation:(id)a4 withCarbon:(double)a5 withEnergy:(double)a6 withSystem:(double)a7 missingIntensity:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[7];
  _QWORD v26[7];

  v8 = a8;
  v14 = a4;
  v26[0] = v14;
  v25[0] = CFSTR("domain");
  v25[1] = CFSTR("date");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](self->_utcFormatter, "stringFromDate:", a3));
  v26[1] = v15;
  v25[2] = CFSTR("summary_value");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  v26[2] = v16;
  v25[3] = CFSTR("wall_value");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
  v26[3] = v17;
  v25[4] = CFSTR("system_energy_value");
  v18 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a7));
  v19 = (void *)v18;
  v20 = &__kCFBooleanTrue;
  if (!v8)
    v20 = &__kCFBooleanFalse;
  v26[4] = v18;
  v26[5] = v20;
  v25[5] = CFSTR("is_intensity_static");
  v25[6] = CFSTR("algorithm_enabled");
  v26[6] = &__kCFBooleanFalse;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 7));

  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    sub_10000AE08();
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100007DE8;
  v23[3] = &unk_1000105F8;
  v24 = v21;
  v22 = v21;
  AnalyticsSendEventLazy(CFSTR("com.apple.energyTelemetry.v2.summary"), v23);

}

- (void)sendSlotEventToCoreAnalytics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("balancing_authority_id")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("slot_date")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("avg_intensity")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("slot_id")));

  -[EnergyTelemetry sendTypedEventToCoreAnalyticsWithDate:withEnergy:andIntensity:forSlot:atLocation:](self, "sendTypedEventToCoreAnalyticsWithDate:withEnergy:andIntensity:forSlot:atLocation:", v5, v9, v10, v11, v8);
}

- (void)sendTypedEventToCoreAnalyticsWithDate:(id)a3 withEnergy:(double)a4 andIntensity:(id)a5 forSlot:(id)a6 atLocation:(id)a7
{
  id v12;
  _UNKNOWN **v13;
  id v14;
  id v15;
  void *v16;
  _UNKNOWN **v17;
  id v18;
  id v19;
  id v20;
  _UNKNOWN **v21;
  _QWORD v22[4];
  id v23;
  id v24;
  EnergyTelemetry *v25;
  id v26;
  id v27;
  double v28;
  BOOL v29;

  v12 = a3;
  v13 = (_UNKNOWN **)a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  v22[0] = _NSConcreteStackBlock;
  v22[2] = sub_100008004;
  v22[3] = &unk_100010620;
  v22[1] = 3221225472;
  if (v13)
    v17 = v13;
  else
    v17 = &off_100011360;
  v23 = v17;
  v24 = v15;
  v29 = v13 == 0;
  v25 = self;
  v26 = v12;
  v27 = v14;
  v28 = a4;
  v18 = v14;
  v19 = v12;
  v20 = v16;
  v21 = v17;
  AnalyticsSendEventLazy(CFSTR("com.apple.energyTelemetry.v1.slot"), v22);

}

- (unint64_t)iterateDaysCovering:(id)a3 toEnd:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", v6));
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "earlierDate:", v9));

  if (v10 == v8)
  {
    v11 = 0;
    v13 = v9;
  }
  else
  {
    v11 = 0;
    v12 = v9;
    do
    {
      ++v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", 86400.0));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "earlierDate:", v13));
      v12 = v13;
    }
    while (v14 != v8);
  }

  return v11;
}

- (id)fetchEmissionHistoriesForDays:(id)a3 fromRecords:(id)a4
{
  id v5;
  id v6;
  char *v7;
  void *v8;
  char *v9;
  __int128 v10;
  const __CFString *v12;
  char *v13;
  void *v14;
  char *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  NSObject *log;
  __CFString *v29;
  uint64_t v30;
  char *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  OS_os_log *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  __int128 v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BYTE buf[24];
  __CFString *v55;
  _QWORD v56[2];
  _QWORD v57[2];

  v5 = a3;
  v6 = a4;
  v7 = (char *)objc_msgSend(v5, "firstIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 96 * (_QWORD)objc_msgSend(v5, "count")));
  v49 = v5;
  v9 = (char *)objc_msgSend(v5, "indexGreaterThanIndex:", v7);
  if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = CFSTR("balancing_authority_id");
    *(_QWORD *)&v10 = 138412803;
    v46 = v10;
    v47 = v8;
    do
    {
      v13 = v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v9 - v7, v46));
      v15 = v7;
      v16 = v12;
      if (v13 > v7)
      {
        do
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v15));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v16));
          v19 = v14;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v18));
          objc_msgSend(v20, "doubleValue");
          v22 = v21;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("wall_energy_consumed")));
          objc_msgSend(v23, "doubleValue");
          v25 = v22 + v24;

          v14 = v19;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25));
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, v18);

          ++v15;
        }
        while (v13 != v15);
      }
      v12 = v16;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "keysSortedByValueUsingComparator:", &stru_100010660));
      v52 = v27;
      if (objc_msgSend(v27, "count"))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          v43 = log;
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("slot_date")));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v45;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v52;
          _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "sorted BA IDs for day %@: %@", buf, 0x16u);

          v27 = v52;
        }
      }
      if (objc_msgSend(v27, "count"))
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", 0));
      else
        v29 = &stru_100010C58;
      v51 = v14;
      if ((unint64_t)objc_msgSend(v27, "count") >= 2
        && -[__CFString isEqualToString:](v29, "isEqualToString:", &stru_100010C58))
      {
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", 1));

        v29 = (__CFString *)v30;
      }
      v31 = v7;
      if (v13 > v7)
      {
        do
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v31));
          v33 = objc_msgSend(v32, "mutableCopy");

          objc_msgSend(v33, "setObject:forKeyedSubscript:", v29, v16);
          objc_msgSend(v6, "setObject:atIndexedSubscript:", v33, v31);

          ++v31;
        }
        while (v13 != v31);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("slot_date")));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[EnergyTelemetry getUTCMidnightFor:](self, "getUTCMidnightFor:", v35));

      v50 = v36;
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dateByAddingTimeInterval:", 86400.0));
      if (v29 && !-[__CFString isEqualToString:](v29, "isEqualToString:", &stru_100010C58))
      {
        v8 = v47;
        if (!qword_100014B20)
        {
          *(_OWORD *)buf = off_100010680;
          *(_QWORD *)&buf[16] = 0;
          qword_100014B20 = _sl_dlopen(buf, 0);
        }
        v40 = v50;
        if (!qword_100014B20)
          goto LABEL_34;
        v41 = self->_log;
        if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v46;
          *(_QWORD *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v53;
          *(_WORD *)&buf[22] = 2113;
          v55 = v29;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v41, OS_LOG_TYPE_DEBUG, "Fetching emissions for %@ to %@ for \"%{private}@\", buf, 0x20u);
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[_GDSManager carbonIntensityHistoryForBA:from:to:](self->gridManager, "carbonIntensityHistoryForBA:from:to:", v29, v50, v53));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "historicalMap"));
        if (v42)
          objc_msgSend(v47, "addEntriesFromDictionary:", v42);

      }
      else
      {
        v56[0] = CFSTR("average");
        v56[1] = CFSTR("marginal");
        v57[0] = &off_100011360;
        v57[1] = &off_100011360;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 2));
        if (v13 <= v7)
        {
          v8 = v47;
        }
        else
        {
          v8 = v47;
          do
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("slot_date")));
            objc_msgSend(v47, "setObject:forKeyedSubscript:", v37, v39);

            ++v7;
          }
          while (v13 != v7);
        }
        v40 = v50;
      }

LABEL_34:
      v9 = (char *)objc_msgSend(v49, "indexGreaterThanIndex:", v13);
      v7 = v13;
    }
    while (v9 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->gridManager, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_utcMidnight, 0);
  objc_storeStrong((id *)&self->_utcFormatter, 0);
  objc_storeStrong((id *)&self->_utcCal, 0);
}

@end
