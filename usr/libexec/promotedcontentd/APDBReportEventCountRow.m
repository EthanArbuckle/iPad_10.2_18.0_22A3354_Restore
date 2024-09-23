@implementation APDBReportEventCountRow

- (NSString)value
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCountRow valueForColumnName:](self, "valueForColumnName:", CFSTR("value")));
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("valueNullPlaceholder")) & 1) != 0)
    v3 = 0;
  else
    v3 = v2;

  return (NSString *)v3;
}

- (void)setValue:(id)a3
{
  if (!a3)
    a3 = CFSTR("valueNullPlaceholder");
  -[APDBReportEventCountRow setValue:forColumnName:](self, "setValue:forColumnName:", a3, CFSTR("value"));
}

- (NSArray)branch
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v13;
  uint8_t buf[4];
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCountRow table](self, "table"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manager"));

  if (v4)
  {
    v5 = objc_alloc((Class)APDatabaseColumn);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APDBReportEventCountRow rowid](self, "rowid"));
    v7 = objc_msgSend(v5, "initWithName:forColumnType:withValue:", CFSTR("rowid"), 0, v6);

    v13 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeSelectStringsQuery:withParameters:", CFSTR("SELECT branch FROM APDBEventBranch WHERE eventId = ?"), v8));

  }
  else
  {
    v10 = APLogForCategory(39);
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v15 = (id)objc_opt_class(self);
      v11 = v15;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nill.", buf, 0xCu);

    }
    v9 = 0;
  }

  return (NSArray *)v9;
}

@end
