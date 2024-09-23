@implementation MOTimeZoneManager

- (MOTimeZoneManager)initWithUniverse:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MOTimeZoneManager;
  return -[MOTimeZoneManager init](&v4, "init", a3);
}

- (void)processTimeZoneEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MOTimeZoneManager *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id os_log;
  NSObject *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  MOTimeZoneManager *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  id v55;

  v4 = a3;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("timeZone != nil")));
  v38 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:"));
  v36 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("endDate"), 1);
  v55 = v36;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingDescriptors:", v6));

  v8 = self;
  v9 = objc_opt_new(NSMutableDictionary);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  v40 = self;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeZoneManager keywordForDate:](v8, "keywordForDate:", v15));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeZone"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v18, v16);

        os_log = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
        v20 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = NSStringFromSelector(a2);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeZone"));
          *(_DWORD *)buf = 138413058;
          v47 = v22;
          v48 = 2112;
          v49 = v23;
          v50 = 2112;
          v51 = v16;
          v52 = 2112;
          v53 = v24;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@, raw timeZone, date %@, keyword, %@, event.timeZone, %@", buf, 0x2Au);

          v8 = v40;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v11);
  }

  if (!-[NSMutableDictionary count](v9, "count"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeZoneManager keywordForDate:](v40, "keywordForDate:", v25));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v28, v26);

  }
  v29 = -[NSMutableDictionary copy](v9, "copy");
  -[MOTimeZoneManager setTimeZoneRecords:](v40, "setTimeZoneRecords:", v29);

  v30 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    -[MOTimeZoneManager processTimeZoneEvents:].cold.2(a2, v9);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeZoneManager timeZoneRecords](v40, "timeZoneRecords"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeZoneManager condensedRecordsFromRecords:](v40, "condensedRecordsFromRecords:", v32));
  -[MOTimeZoneManager setCondensedRecords:](v40, "setCondensedRecords:", v33);

  v34 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    -[MOTimeZoneManager processTimeZoneEvents:].cold.1(a2, v40);

}

- (id)condensedRecordsFromRecords:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id os_log;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSString *v22;
  NSString *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingSelector:", "compare:"));

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        v13 = v10;
        v14 = v9;
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v15));
        if (v13 && (objc_msgSend(v14, "isEqualToString:", v9) & 1) == 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v13));

          if (!v16)
          {
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, v13);
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
            v18 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              v22 = NSStringFromSelector(a2);
              v31 = (void *)objc_claimAutoreleasedReturnValue(v22);
              *(_DWORD *)buf = 138412802;
              v40 = v31;
              v41 = 2112;
              v42 = v13;
              v43 = 2112;
              v44 = v14;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@, TimeZone entry, keyword, %@, event.timeZone, %@ ADD", buf, 0x20u);

            }
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v15));

          if (!v19)
          {
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, v15);
            v20 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v23 = NSStringFromSelector(a2);
              v32 = (void *)objc_claimAutoreleasedReturnValue(v23);
              *(_DWORD *)buf = 138412802;
              v40 = v32;
              v41 = 2112;
              v42 = v15;
              v43 = 2112;
              v44 = v9;
              _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@, TimeZone entry, keyword, %@, event.timeZone, %@ ADD", buf, 0x20u);

            }
          }
        }
        v10 = v15;

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

  v24 = -[NSMutableDictionary count](v4, "count");
  if (v10 && !v24)
  {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, v10);
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v29 = NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      *(_DWORD *)buf = 138412802;
      v40 = v30;
      v41 = 2112;
      v42 = v10;
      v43 = 2112;
      v44 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%@, TimeZone entry, keyword, %@, event.timeZone, %@ ADD", buf, 0x20u);

    }
  }
  v27 = -[NSMutableDictionary copy](v4, "copy");

  return v27;
}

- (id)timeZoneAtDate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  id os_log;
  NSObject *v30;
  id v31;
  NSObject *v32;
  NSString *v34;
  void *v35;
  NSString *v36;
  void *v37;
  void *v38;
  NSString *v39;
  void *v40;
  const char *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeZoneManager keywordForDate:](self, "keywordForDate:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeZoneManager condensedRecords](self, "condensedRecords"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (!v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeZoneManager condensedRecords](self, "condensedRecords"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keysSortedByValueUsingSelector:", "compare:"));

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v15)
    {
      v16 = v15;
      v41 = a2;
      v42 = v5;
      v17 = 0;
      v18 = *(_QWORD *)v44;
      v19 = 1.79769313e308;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeZoneManager condensedRecords](self, "condensedRecords"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v21));

          objc_msgSend(v6, "doubleValue");
          v25 = v24;
          objc_msgSend(v21, "doubleValue");
          v27 = vabdd_f64(v25, v26);
          if (v27 < v19)
          {
            v28 = v23;

            v19 = v27;
            v17 = v28;
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v16);

      v8 = 0;
      v5 = v42;
      a2 = v41;
      if (v17)
      {
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
        v30 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          v39 = NSStringFromSelector(v41);
          v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
          *(_DWORD *)buf = 138413058;
          v49 = v40;
          v50 = 2112;
          v51 = v42;
          v52 = 2112;
          v53 = v6;
          v54 = 2112;
          v55 = v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@, date %@, keyword, %@, timeZone, %@, source, interpolated", buf, 0x2Au);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v17));

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {

    }
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v36 = NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
      *(_DWORD *)buf = 138413058;
      v49 = v37;
      v50 = 2112;
      v51 = v5;
      v52 = 2112;
      v53 = v6;
      v54 = 2112;
      v55 = v38;
      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%@, date %@, keyword, %@, timeZone, %@, source, system", buf, 0x2Au);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
    goto LABEL_22;
  }
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v34 = NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    *(_DWORD *)buf = 138413058;
    v49 = v35;
    v50 = 2112;
    v51 = v5;
    v52 = 2112;
    v53 = v6;
    v54 = 2112;
    v55 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@, date %@, keyword, %@, timeZone, %@, source, lookup", buf, 0x2Au);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v8));
LABEL_23:

  return v11;
}

- (id)keywordForDate:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)(v3 / 3600.0));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("TimeZone records:")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeZoneManager condensedRecords](self, "condensedRecords"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingSelector:", "compare:"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeZoneManager condensedRecords](self, "condensedRecords"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v12));

        objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%@>"), v12, v14, (_QWORD)v17);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = objc_msgSend(v3, "copy");
  return v15;
}

- (NSDictionary)timeZoneRecords
{
  return self->_timeZoneRecords;
}

- (void)setTimeZoneRecords:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneRecords, a3);
}

- (NSDictionary)condensedRecords
{
  return self->_condensedRecords;
}

- (void)setCondensedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_condensedRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condensedRecords, 0);
  objc_storeStrong((id *)&self->_timeZoneRecords, 0);
}

- (void)processTimeZoneEvents:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  NSString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "condensedRecords"));
  objc_msgSend(v5, "count");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v6, v7, "%@, TimeZoneManager.condensedRecords, %lu", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_0();
}

- (void)processTimeZoneEvents:(const char *)a1 .cold.2(const char *a1, void *a2)
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v5, v6, "%@, TimeZoneManager.timeZoneRecords, %lu", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

@end
