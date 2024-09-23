@implementation APDBReportEventCount

- (Class)rowClass
{
  return (Class)objc_opt_class(APDBReportEventCountRow, a2);
}

- (BOOL)addCountForDayOfYear:(id)a3 purpose:(id)a4 event:(id)a5 value:(id)a6 environment:(id)a7 branch:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  char *v45;
  BOOL v46;
  NSObject *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[6];
  _BYTE v66[128];
  _QWORD v67[8];
  uint8_t buf[4];
  id v69;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCount manager](self, "manager"));
  if (!v20)
  {
    v25 = APLogForCategory(39);
    v22 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v69 = (id)objc_opt_class(self);
      v23 = v69;
      v24 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_14;
    }
LABEL_15:
    v27 = 0;
    goto LABEL_16;
  }
  if (!v14 || !v15 || !v16 || !v18)
  {
    v26 = APLogForCategory(11);
    v22 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v69 = (id)objc_opt_class(self);
      v23 = v69;
      v24 = "[%{private}@]: Error on Adding event count, NONNULL params are NULL";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ((uint64_t)objc_msgSend(v14, "integerValue") > 1231 || (uint64_t)objc_msgSend(v14, "integerValue") <= 100)
  {
    v21 = APLogForCategory(11);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v69 = (id)objc_opt_class(self);
      v23 = v69;
      v24 = "[%{private}@]: Error on Adding event count, day of year is out of range.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (v17)
    v22 = v17;
  else
    v22 = CFSTR("valueNullPlaceholder");
  v60 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v14);
  v59 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("purpose"), 0, v15);
  v58 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("event"), 0, v16);
  v57 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("value"), 3, v22);
  v55 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("count"), 0, &off_100228B38);
  v56 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("environment"), 3, v18);
  v29 = objc_alloc((Class)APDatabaseColumn);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v31 = objc_msgSend(v29, "initWithName:forColumnType:withValue:", CFSTR("lastCountDate"), 4, v30);

  objc_msgSend(v20, "beginTransaction");
  v67[0] = v60;
  v67[1] = v59;
  v67[2] = v58;
  v67[3] = v57;
  v67[4] = v55;
  v67[5] = v56;
  v67[6] = v31;
  v67[7] = v31;
  v54 = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 8));
  v33 = objc_msgSend(v20, "executeInsertQuery:withParameters:", CFSTR("INSERT INTO APDBReportEventCount (dayOfYear, purpose, event, value, count, environment, lastCountDate) VALUES (?, ?, ?, ?, ?, ?, ?) ON CONFLICT (dayOfYear, purpose, event, value, environment) DO UPDATE SET count = count + 1, lastCountDate = ?"), v32);

  if (v33 == (id)-1)
    goto LABEL_31;
  if (!objc_msgSend(v19, "count"))
    goto LABEL_30;
  v47 = v22;
  v48 = v20;
  v49 = v18;
  v50 = v17;
  v51 = v16;
  v52 = v15;
  v53 = v14;
  v34 = objc_alloc_init((Class)NSMutableArray);
  v35 = objc_alloc_init((Class)NSMutableArray);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v36 = v19;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v39)
          objc_enumerationMutation(v36);
        v41 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("branch"), 3, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i));
        v65[0] = v60;
        v65[1] = v59;
        v65[2] = v58;
        v65[3] = v57;
        v65[4] = v56;
        v65[5] = v41;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 6));
        objc_msgSend(v34, "addObjectsFromArray:", v42);

        objc_msgSend(v35, "addObject:", CFSTR("((SELECT rowid FROM APDBReportEventCount WHERE dayOfYear = ? AND purpose = ? AND event = ? AND value = ? AND environment = ?), ?)"));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v38);
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "componentsJoinedByString:", CFSTR(", ")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT INTO APDBEventBranch (eventId, branch) VALUES %@ ON CONFLICT (eventId, branch) DO NOTHING"), v43));
  v20 = v48;
  v45 = (char *)objc_msgSend(v48, "executeInsertQuery:withParameters:", v44, v34);

  v46 = v45 + 1 == 0;
  v15 = v52;
  v14 = v53;
  v17 = v50;
  v16 = v51;
  v18 = v49;
  v22 = v47;
  if (v46)
  {
LABEL_31:
    v27 = 0;
  }
  else
  {
LABEL_30:
    objc_msgSend(v20, "commitTransaction");
    v27 = 1;
  }

LABEL_16:
  return v27;
}

- (id)groupedEventCountForDayOfYear:(id)a3 purpose:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  void *v18;
  _QWORD v19[2];
  uint8_t buf[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCount manager](self, "manager"));
  if (v8)
  {
    if (v6 && v7)
    {
      if ((uint64_t)objc_msgSend(v6, "integerValue") <= 1231 && (uint64_t)objc_msgSend(v6, "integerValue") > 100)
      {
        v10 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v6);
        v17 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("purpose"), 0, v7);
        v19[0] = v10;
        v19[1] = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeSelectQuery:forTable:withParameters:groupedByColumn:", CFSTR("SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear = ? AND purpose = ?"), self, v18, CFSTR("environment")));

        goto LABEL_14;
      }
      v9 = APLogForCategory(11);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v21 = (id)objc_opt_class(self);
        v11 = v21;
        v12 = "[%{private}@]: Error on getting event count, days are out of range.";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);

      }
    }
    else
    {
      v14 = APLogForCategory(11);
      v10 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v21 = (id)objc_opt_class(self);
        v11 = v21;
        v12 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
        goto LABEL_12;
      }
    }
  }
  else
  {
    v13 = APLogForCategory(39);
    v10 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v21 = (id)objc_opt_class(self);
      v11 = v21;
      v12 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_12;
    }
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (id)groupedEventCountForStartDay:(id)a3 endDay:(id)a4 purpose:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v28;
  _QWORD v29[3];
  _QWORD v30[5];
  uint8_t buf[4];
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCount manager](self, "manager"));
  if (!v11)
  {
    v21 = APLogForCategory(39);
    v12 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 138477827;
    v32 = (id)objc_opt_class(self);
    v22 = v32;
    v23 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);

    goto LABEL_18;
  }
  if (!v8 || !v9 || !v10)
  {
    v24 = APLogForCategory(11);
    v12 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 138477827;
    v32 = (id)objc_opt_class(self);
    v22 = v32;
    v23 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
    goto LABEL_17;
  }
  if ((uint64_t)objc_msgSend(v8, "integerValue") > 366
    || (uint64_t)objc_msgSend(v9, "integerValue") > 366
    || (uint64_t)objc_msgSend(v8, "integerValue") < 1
    || (uint64_t)objc_msgSend(v9, "integerValue") <= 0)
  {
    v25 = APLogForCategory(11);
    v12 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v32 = (id)objc_opt_class(self);
      v22 = v32;
      v23 = "[%{private}@]: Error on getting event count, days are out of range.";
      goto LABEL_17;
    }
LABEL_18:
    v26 = 0;
    goto LABEL_19;
  }
  v12 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v8);
  v13 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v9);
  v14 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("purpose"), 0, v10);
  v15 = objc_msgSend(v9, "integerValue");
  if ((uint64_t)v15 >= (uint64_t)objc_msgSend(v8, "integerValue"))
  {
    v29[0] = v12;
    v29[1] = v13;
    v29[2] = v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
    v20 = CFSTR("SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear >= ? AND dayOfYear <= ? AND purpose = ?");
  }
  else
  {
    v28 = v14;
    v16 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, &off_100228B50);
    v17 = v13;
    v18 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, &off_100228B38);
    v30[0] = v12;
    v30[1] = v16;
    v30[2] = v18;
    v30[3] = v17;
    v30[4] = v28;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 5));

    v13 = v17;
    v14 = v28;
    v20 = CFSTR("SELECT rowid, * FROM APDBReportEventCount WHERE ((dayOfYear >= ? AND dayOfYear <= ?) OR (dayOfYear >= ? AND dayOfYear <= ?)) AND purpose = ?");
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeSelectQuery:forTable:withParameters:groupedByColumn:", v20, self, v19, CFSTR("environment")));

LABEL_19:
  return v26;
}

- (id)groupedEventCountForDayOfYear:(id)a3 purpose:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[3];
  uint8_t buf[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCount manager](self, "manager"));
  if (v11)
  {
    if (v8 && v9 && v10)
    {
      if ((uint64_t)objc_msgSend(v8, "integerValue") <= 1231 && (uint64_t)objc_msgSend(v8, "integerValue") > 100)
      {
        v13 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v8);
        v20 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("purpose"), 0, v9);
        v21 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("event"), 0, v10);
        v23[0] = v13;
        v23[1] = v20;
        v23[2] = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 3));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeSelectQuery:forTable:withParameters:groupedByColumn:", CFSTR("SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear = ? AND purpose = ? AND event = ?"), self, v22, CFSTR("environment")));

        goto LABEL_15;
      }
      v12 = APLogForCategory(11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v25 = (id)objc_opt_class(self);
        v14 = v25;
        v15 = "[%{private}@]: Error on getting event count, days are out of range.";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

      }
    }
    else
    {
      v17 = APLogForCategory(11);
      v13 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v25 = (id)objc_opt_class(self);
        v14 = v25;
        v15 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
        goto LABEL_13;
      }
    }
  }
  else
  {
    v16 = APLogForCategory(39);
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v25 = (id)objc_opt_class(self);
      v14 = v25;
      v15 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_13;
    }
  }
  v18 = 0;
LABEL_15:

  return v18;
}

- (id)groupedEventCountForStartDay:(id)a3 endDay:(id)a4 purpose:(id)a5 event:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  _QWORD v34[6];
  uint8_t buf[4];
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCount manager](self, "manager"));
  if (!v14)
  {
    v19 = APLogForCategory(39);
    v16 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v36 = (id)objc_opt_class(self);
      v17 = v36;
      v18 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_16;
    }
LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  if (!v10 || !v11 || !v12 || !v13)
  {
    v20 = APLogForCategory(11);
    v16 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v36 = (id)objc_opt_class(self);
      v17 = v36;
      v18 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if ((uint64_t)objc_msgSend(v10, "integerValue") > 1231
    || (uint64_t)objc_msgSend(v11, "integerValue") > 1231
    || (uint64_t)objc_msgSend(v10, "integerValue") < 101
    || (uint64_t)objc_msgSend(v11, "integerValue") <= 100)
  {
    v15 = APLogForCategory(11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v36 = (id)objc_opt_class(self);
      v17 = v36;
      v18 = "[%{private}@]: Error on getting event count, days are out of range.";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v16 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v10);
  v23 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v11);
  v31 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("purpose"), 0, v12);
  v32 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("event"), 0, v13);
  v24 = objc_msgSend(v11, "integerValue");
  if ((uint64_t)v24 >= (uint64_t)objc_msgSend(v10, "integerValue"))
  {
    v33[0] = v16;
    v33[1] = v23;
    v26 = v31;
    v33[2] = v31;
    v33[3] = v32;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
    v28 = CFSTR("SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear >= ? AND dayOfYear <= ? AND purpose = ? AND event = ?");
  }
  else
  {
    v29 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, &off_100228B68);
    v30 = v23;
    v25 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, &off_100228B80);
    v34[0] = v16;
    v34[1] = v29;
    v26 = v31;
    v34[2] = v25;
    v34[3] = v30;
    v34[4] = v31;
    v34[5] = v32;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 6));

    v23 = v30;
    v28 = CFSTR("SELECT rowid, * FROM APDBReportEventCount WHERE ((dayOfYear >= ? AND dayOfYear <= ?) OR (dayOfYear >= ? AND dayOfYear <= ?)) AND purpose = ? AND event = ?");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "executeSelectQuery:forTable:withParameters:groupedByColumn:", v28, self, v27, CFSTR("environment"), v29));

LABEL_18:
  return v21;
}

- (id)groupedEventCountForDayOfYear:(id)a3 purpose:(id)a4 event:(id)a5 value:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  uint8_t buf[4];
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCount manager](self, "manager"));
  if (!v14)
  {
    v19 = APLogForCategory(39);
    v16 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v31 = (id)objc_opt_class(self);
      v17 = v31;
      v18 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_13;
    }
LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }
  if (!v10 || !v11 || !v12)
  {
    v20 = APLogForCategory(11);
    v16 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v31 = (id)objc_opt_class(self);
      v17 = v31;
      v18 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ((uint64_t)objc_msgSend(v10, "integerValue") > 1231 || (uint64_t)objc_msgSend(v10, "integerValue") <= 100)
  {
    v15 = APLogForCategory(11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v31 = (id)objc_opt_class(self);
      v17 = v31;
      v18 = "[%{private}@]: Error on getting event count, days are out of range.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v13)
    v16 = v13;
  else
    v16 = CFSTR("valueNullPlaceholder");
  v28 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v10);
  v27 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("purpose"), 0, v11);
  v23 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("event"), 0, v12);
  v24 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("value"), 3, v16);
  v29[0] = v28;
  v29[1] = v27;
  v29[2] = v23;
  v29[3] = v24;
  v25 = v23;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "executeSelectQuery:forTable:withParameters:groupedByColumn:", CFSTR("SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear = ? AND purpose = ? AND event = ? AND value = ?"), self, v26, CFSTR("environment")));

LABEL_15:
  return v21;
}

- (id)groupedEventCountForStartDay:(id)a3 endDay:(id)a4 purpose:(id)a5 event:(id)a6 value:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v26;
  id v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  _QWORD v38[7];
  uint8_t buf[4];
  id v40;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCount manager](self, "manager"));
  if (!v17)
  {
    v22 = APLogForCategory(39);
    v19 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v40 = (id)objc_opt_class(self);
      v20 = v40;
      v21 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_16;
    }
LABEL_17:
    v24 = 0;
    goto LABEL_18;
  }
  if (!v12 || !v13 || !v14 || !v15)
  {
    v23 = APLogForCategory(11);
    v19 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v40 = (id)objc_opt_class(self);
      v20 = v40;
      v21 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if ((uint64_t)objc_msgSend(v12, "integerValue") > 1231
    || (uint64_t)objc_msgSend(v13, "integerValue") > 1231
    || (uint64_t)objc_msgSend(v12, "integerValue") < 101
    || (uint64_t)objc_msgSend(v13, "integerValue") <= 100)
  {
    v18 = APLogForCategory(11);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v40 = (id)objc_opt_class(self);
      v20 = v40;
      v21 = "[%{private}@]: Error on getting event count, days are out of range.";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (v16)
    v19 = v16;
  else
    v19 = CFSTR("valueNullPlaceholder");
  v32 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v12);
  v36 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v13);
  v35 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("purpose"), 0, v14);
  v34 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("event"), 0, v15);
  v33 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("value"), 3, v19);
  v26 = objc_msgSend(v13, "integerValue");
  if ((uint64_t)v26 >= (uint64_t)objc_msgSend(v12, "integerValue"))
  {
    v29 = v32;
    v37[0] = v32;
    v37[1] = v36;
    v37[2] = v35;
    v37[3] = v34;
    v37[4] = v33;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 5));
    v30 = CFSTR("SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear >= ? AND dayOfYear <= ? AND purpose = ? AND event = ? AND value = ?");
  }
  else
  {
    v31 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, &off_100228B68);
    v27 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, &off_100228B80);
    v38[0] = v32;
    v38[1] = v31;
    v38[2] = v27;
    v38[3] = v36;
    v38[4] = v35;
    v38[5] = v34;
    v38[6] = v33;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 7));

    v29 = v32;
    v30 = CFSTR("SELECT rowid, * FROM APDBReportEventCount WHERE ((dayOfYear >= ? AND dayOfYear <= ?) OR (dayOfYear >= ? AND dayOfYear <= ?)) AND purpose = ? AND event = ? AND value = ?");
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "executeSelectQuery:forTable:withParameters:groupedByColumn:", v30, self, v28, CFSTR("environment"), v31));

LABEL_18:
  return v24;
}

- (BOOL)deleteCountsBetweenStartDay:(id)a3 endDay:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];
  _QWORD v24[4];
  uint8_t buf[4];
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCount manager](self, "manager"));
  if (!v8)
  {
    v13 = APLogForCategory(39);
    v10 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v26 = (id)objc_opt_class(self);
      v11 = v26;
      v12 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_14;
    }
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  if (!v6 || !v7)
  {
    v14 = APLogForCategory(11);
    v10 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v26 = (id)objc_opt_class(self);
      v11 = v26;
      v12 = "[%{private}@]: Error on delete counts between dates, days are null.";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ((uint64_t)objc_msgSend(v6, "integerValue") > 1231
    || (uint64_t)objc_msgSend(v7, "integerValue") > 1231
    || (uint64_t)objc_msgSend(v6, "integerValue") < 101
    || (uint64_t)objc_msgSend(v7, "integerValue") <= 100)
  {
    v9 = APLogForCategory(11);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v26 = (id)objc_opt_class(self);
      v11 = v26;
      v12 = "[%{private}@]: Error on delete counts between dates, days are out of range.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v10 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v6);
  v17 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v7);
  v18 = objc_msgSend(v7, "integerValue");
  if ((uint64_t)v18 >= (uint64_t)objc_msgSend(v6, "integerValue"))
  {
    v23[0] = v10;
    v23[1] = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
    v22 = CFSTR("DELETE FROM APDBReportEventCount WHERE dayOfYear >= ? AND dayOfYear <= ?");
  }
  else
  {
    v19 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, &off_100228B68);
    v20 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, &off_100228B80);
    v24[0] = v10;
    v24[1] = v19;
    v24[2] = v20;
    v24[3] = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));

    v22 = CFSTR("DELETE FROM APDBReportEventCount WHERE ((dayOfYear >= ? AND dayOfYear <= ?) OR (dayOfYear >= ? AND dayOfYear <= ?))");
  }
  v15 = objc_msgSend(v8, "executeQuery:withParameters:", v22, v21);

LABEL_16:
  return v15;
}

- (BOOL)deleteCountsOlderThan:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCount manager](self, "manager"));
  if (!v5)
  {
    v9 = APLogForCategory(39);
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v16 = (id)objc_opt_class(self);
      v10 = v16;
      v11 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);

    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (!v4)
  {
    v12 = APLogForCategory(11);
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v16 = (id)objc_opt_class(self);
      v10 = v16;
      v11 = "[%{private}@]: Error on Delete event counts older than, date is nil.";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v6 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("lastCountDate"), 4, v4);
  v14 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v8 = objc_msgSend(v5, "executeQuery:withParameters:", CFSTR("DELETE FROM APDBReportEventCount WHERE lastCountDate < ?"), v7);

LABEL_10:
  return v8;
}

- (id)environments
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  int v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCount manager](self, "manager"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeSelectStringsQuery:withParameters:", CFSTR("SELECT environment FROM APDBReportEventCount GROUP BY environment"), &__NSArray0__struct));
  }
  else
  {
    v6 = APLogForCategory(39);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138477827;
      v11 = (id)objc_opt_class(self);
      v8 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nill.", (uint8_t *)&v10, 0xCu);

    }
    v5 = 0;
  }

  return v5;
}

@end
