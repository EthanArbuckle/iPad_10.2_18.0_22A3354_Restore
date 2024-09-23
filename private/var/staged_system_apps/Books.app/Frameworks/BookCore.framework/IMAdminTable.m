@implementation IMAdminTable

- (IMAdminTable)initWithDatabaseHandle:(id)a3
{
  id v5;
  IMAdminTable *v6;
  IMAdminTable *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMAdminTable;
  v6 = -[IMAdminTable init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("create table if not exists admin (pk %@, domain %@, key %@, stringValue %@, intValue %@, blobValue %@)"), CFSTR("integer primary key"), CFSTR("text"), CFSTR("text"), CFSTR("text"), CFSTR("integer"), CFSTR("blob")));
    -[IMDatabaseHandle runStatement:arguments:](v7->_db, "runStatement:arguments:", v8, 0);

  }
  return v7;
}

- (int64_t)databaseVersion
{
  IMDatabaseHandle *db;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  db = self->_db;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("version"), CFSTR("database"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select intValue from admin where key = ? and domain = ?"), v3, 0));

  if (objc_msgSend(v4, "count"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("intValue")));
  v7 = objc_msgSend(v6, "integerValue");

  return (int64_t)v7;
}

- (void)setDatabaseVersion:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[IMAdminTable setProperty:forKey:domain:](self, "setProperty:forKey:domain:", v4, CFSTR("version"), CFSTR("database"));

}

- (BOOL)hasDatabaseVersion
{
  IMDatabaseHandle *db;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  db = self->_db;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("version"), CFSTR("database"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](db, "arrayForQuery:arguments:rawRows:", CFSTR("select count(*) from admin where key = ? and domain = ?"), v3, 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = objc_msgSend(v6, "integerValue");

  return (uint64_t)v7 > 0;
}

- (void)setLastAccessDate:(id)a3
{
  id v4;
  double v5;
  void *v6;
  id v7;

  v4 = a3;
  if (!v4)
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = v4;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  *(float *)&v5 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  -[IMAdminTable setProperty:forKey:domain:](self, "setProperty:forKey:domain:", v6, CFSTR("lastAccessDate"), CFSTR("database"));

}

- (id)lastAccessDate
{
  void *v2;
  float v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMAdminTable numberValueForKey:domain:](self, "numberValueForKey:domain:", CFSTR("lastAccessDate"), CFSTR("database")));
  objc_msgSend(v2, "floatValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v3));

  return v4;
}

- (void)setProperty:(id)a3 forKey:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSArray *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;

  v29 = a3;
  v8 = a4;
  v9 = a5;
  v10 = CFSTR("select count(*) from admin where key = ? and domain = ?");
  if (!v9)
    v10 = CFSTR("select count(*) from admin where key = ?");
  v11 = v10;
  v12 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v8, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](self->_db, "arrayForQuery:arguments:rawRows:", v11, v12, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
  v16 = objc_msgSend(v15, "integerValue");

  v17 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v29, v17) & 1) != 0)
  {
    v18 = CFSTR("blobValue");
  }
  else
  {
    v19 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v29, v19) & 1) != 0)
    {
      v18 = CFSTR("intValue");
    }
    else
    {
      v20 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v29, v20) & 1) != 0
        || (v21 = objc_opt_class(NSDate), (objc_opt_isKindOfClass(v29, v21) & 1) != 0))
      {
        v18 = CFSTR("stringValue");
      }
      else
      {
        v18 = 0;
      }
    }
  }
  if (v16)
  {
    if (v9)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("update admin set %@ = ? where key = ? and domain = ?"), v18));
      v26 = v9;
      v28 = 0;
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("update admin set %@ = ? where key = ?"), v18));
      v26 = 0;
    }
    v23 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v29, v8, v26, v28);
  }
  else
  {
    if (v9)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("insert into admin (key, domain, %@) values (?,?,?)"), v18));
      v27 = v29;
      v28 = 0;
      v25 = v9;
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("insert into admin (key, %@) values (?,?)"), v18));
      v25 = v29;
      v27 = 0;
    }
    v23 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, v25, v27, v28);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  -[IMDatabaseHandle runStatement:arguments:](self->_db, "runStatement:arguments:", v22, v24);
}

- (id)blobValueForKey:(id)a3 domain:(id)a4
{
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, a4, 0));
    v6 = CFSTR("select blobValue from admin where key = ? and domain = ?");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
    v6 = CFSTR("select blobValue from admin where key = ?");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](self->_db, "arrayForQuery:arguments:rawRows:", v6, v5, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  return v9;
}

- (id)stringValueForKey:(id)a3 domain:(id)a4
{
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, a4, 0));
    v6 = CFSTR("select stringValue from admin where key = ? and domain = ?");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
    v6 = CFSTR("select stringValue from admin where key = ?");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](self->_db, "arrayForQuery:arguments:rawRows:", v6, v5, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  return v9;
}

- (id)numberValueForKey:(id)a3 domain:(id)a4
{
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, a4, 0));
    v6 = CFSTR("select intValue from admin where key = ? and domain = ?");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
    v6 = CFSTR("select intValue from admin where key = ?");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMDatabaseHandle arrayForQuery:arguments:rawRows:](self->_db, "arrayForQuery:arguments:rawRows:", v6, v5, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
