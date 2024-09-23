@implementation APDBDeliveredReport

- (Class)rowClass
{
  return (Class)objc_opt_class(APDBDeliveredReportRow, a2);
}

- (id)storeDeliveryReportType:(id)a3 dayOfYear:(id)a4 frequency:(id)a5 reportDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  int v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APDBDeliveredReport manager](self, "manager"));

  if (!v14)
  {
    v17 = APLogForCategory(39);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v23 = 138477827;
      v24 = (id)objc_opt_class(self);
      v19 = v24;
      v20 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v23, 0xCu);

    }
LABEL_13:

    v16 = 0;
    goto LABEL_16;
  }
  if (!v10 || !v11 || !v12 || !v13)
  {
    v21 = APLogForCategory(39);
    v18 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v23 = 138477827;
      v24 = (id)objc_opt_class(self);
      v19 = v24;
      v20 = "[%{private}@]: Error storing delivery report, NONNULL params are NULL";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v15 = -[APDBDeliveredReportRow initType:dayOfYear:frequency:reportDate:table:]([APDBDeliveredReportRow alloc], "initType:dayOfYear:frequency:reportDate:table:", v10, v11, v12, v13, self);
  if (objc_msgSend(v15, "save"))
    v16 = v15;
  else
    v16 = 0;

LABEL_16:
  return v16;
}

- (id)lastDeliveryReportWithType:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  NSObject *v15;
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBDeliveredReport manager](self, "manager"));
  if (!v5)
  {
    v10 = APLogForCategory(39);
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v17 = (id)objc_opt_class(self);
      v11 = v17;
      v12 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);

    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (!v4)
  {
    v13 = APLogForCategory(11);
    v6 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v17 = (id)objc_opt_class(self);
      v11 = v17;
      v12 = "[%{private}@]: Error getting last delivery report, NONNULL params are NULL";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v6 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("type"), 3, v4);
  v15 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeSelectQuery:forTable:withParameters:", CFSTR("SELECT rowid, * FROM APDBDeliveredReport WHERE type = ? ORDER BY reportDate DESC LIMIT 1"), self, v7));

  if (v8 && objc_msgSend(v8, "count"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  else
    v9 = 0;

LABEL_14:
  return v9;
}

- (id)deliveryReportsWithType:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBDeliveredReport manager](self, "manager"));
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
      v11 = "[%{private}@]: Error getting delivery report with type, NONNULL params are NULL";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v6 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("type"), 3, v4);
  v14 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeSelectQuery:forTable:withParameters:", CFSTR("SELECT rowid, * FROM APDBDeliveredReport WHERE type = ? ORDER BY reportDate"), self, v7));

LABEL_10:
  return v8;
}

- (id)deliveryReportWithType:(id)a3 dayOfYear:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  _QWORD v19[2];
  uint8_t buf[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDBDeliveredReport manager](self, "manager"));
  if (!v8)
  {
    v14 = APLogForCategory(39);
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v21 = (id)objc_opt_class(self);
      v15 = v21;
      v16 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    }
LABEL_12:
    v13 = 0;
    goto LABEL_15;
  }
  if (!v6 || !v7)
  {
    v17 = APLogForCategory(11);
    v9 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v21 = (id)objc_opt_class(self);
      v15 = v21;
      v16 = "[%{private}@]: Error getting delivery report with type and day of year, NONNULL params are NULL";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v9 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("type"), 3, v6);
  v10 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, v7);
  v19[0] = v9;
  v19[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeSelectQuery:forTable:withParameters:", CFSTR("SELECT rowid, * FROM APDBDeliveredReport WHERE type = ? AND dayOfYear = ? ORDER BY reportDate"), self, v11));

  if (v12 && objc_msgSend(v12, "count"))
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
  else
    v13 = 0;

LABEL_15:
  return v13;
}

- (BOOL)deleteReportsBetweenStartDay:(id)a3 endDay:(id)a4
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDBDeliveredReport manager](self, "manager"));
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
      v12 = "[%{private}@]: Error deleting delivery report between days, NONNULL params are NULL";
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
      v12 = "[%{private}@]: Error deleting delivery report between days, days out of range.";
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
    v22 = CFSTR("DELETE FROM APDBDeliveredReport WHERE dayOfYear >= ? AND dayOfYear <= ?");
  }
  else
  {
    v19 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, &off_100228B08);
    v20 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("dayOfYear"), 0, &off_100228B20);
    v24[0] = v10;
    v24[1] = v19;
    v24[2] = v20;
    v24[3] = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));

    v22 = CFSTR("DELETE FROM APDBDeliveredReport WHERE ((dayOfYear >= ? AND dayOfYear <= ?) OR (dayOfYear >= ? AND dayOfYear <= ?))");
  }
  v15 = objc_msgSend(v8, "executeQuery:withParameters:", v22, v21);

LABEL_16:
  return v15;
}

- (BOOL)deleteReportsOlderThan:(id)a3
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDBDeliveredReport manager](self, "manager"));
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
      v11 = "[%{private}@]: Error deleting delivery report older than, NONNULL params are NULL";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v6 = objc_msgSend(objc_alloc((Class)APDatabaseColumn), "initWithName:forColumnType:withValue:", CFSTR("reportDate"), 4, v4);
  v14 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v8 = objc_msgSend(v5, "executeQuery:withParameters:", CFSTR("DELETE FROM APDBDeliveredReport WHERE reportDate < ?"), v7);

LABEL_10:
  return v8;
}

@end
