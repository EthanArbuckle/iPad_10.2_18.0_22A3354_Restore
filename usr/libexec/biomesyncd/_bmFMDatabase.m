@implementation _bmFMDatabase

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5
{
  return -[_bmFMDatabase _SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:](self, "_SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:", a3, a4, 0, a5, 0, 0, 0);
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5 ORDER_BY:(id)a6 LIMIT:(id)a7
{
  return -[_bmFMDatabase _SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:](self, "_SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:", a3, a4, 0, a5, 0, a6, a7);
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 ORDER_BY:(id)a7 LIMIT:(id)a8
{
  return -[_bmFMDatabase _SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:](self, "_SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:", a3, a4, a5, a6, 0, a7, a8);
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5 GROUP_BY:(id)a6
{
  return -[_bmFMDatabase _SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:](self, "_SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:", a3, a4, 0, a5, a6, 0, 0);
}

- (id)_SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 GROUP_BY:(id)a7 ORDER_BY:(id)a8 LIMIT:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  unint64_t v32;
  unint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _bmFMDatabase *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v42 = a9;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "componentsJoinedByString:", CFSTR(", ")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("SELECT %@ FROM %@"), v20, v15));

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = v16;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v21, "appendString:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v24);
  }

  if (v17)
  {
    v41 = self;
    v27 = v19;
    v28 = v18;
    v29 = v15;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)objc_msgSend(v17, "count") >> 1));
    objc_msgSend(v21, "appendString:", CFSTR(" WHERE "));
    v31 = objc_msgSend(v17, "count");
    if (v31)
    {
      v32 = (unint64_t)v31;
      for (j = 0; j < v32; j += 2)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", j));
        objc_msgSend(v21, "appendString:", v34);

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", j + 1));
        objc_msgSend(v30, "addObject:", v35);

      }
    }
    v15 = v29;
    v18 = v28;
    v19 = v27;
    self = v41;
  }
  else
  {
    v30 = 0;
  }
  if (objc_msgSend(v18, "count"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", ")));
    objc_msgSend(v21, "appendFormat:", CFSTR(" GROUP BY %@"), v36);

  }
  if (objc_msgSend(v19, "count"))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", ")));
    objc_msgSend(v21, "appendFormat:", CFSTR(" ORDER BY %@"), v37);

  }
  if ((uint64_t)objc_msgSend(v42, "integerValue") >= 1)
    objc_msgSend(v21, "appendFormat:", CFSTR(" LIMIT %@"), v42);
  objc_msgSend(v21, "appendString:", CFSTR(";"));
  if (v30)
    v38 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:](self, "executeQuery:withArgumentsInArray:", v21, v30));
  else
    v38 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", v21));
  v39 = (void *)v38;

  return v39;
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 GROUP_BY:(id)a7 HAVING:(id)a8 ORDER_BY:(id)a9 LIMIT:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  unint64_t v37;
  unint64_t k;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v47 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "componentsJoinedByString:", CFSTR(", ")));
  v46 = v15;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("SELECT %@ FROM %@"), v21, v15));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v23 = v16;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v22, "appendString:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v25);
  }

  if (v17)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)objc_msgSend(v17, "count") >> 1));
    objc_msgSend(v22, "appendString:", CFSTR(" WHERE "));
    v29 = objc_msgSend(v17, "count");
    if (v29)
    {
      v30 = (unint64_t)v29;
      for (j = 0; j < v30; j += 2)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", j));
        objc_msgSend(v22, "appendString:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", j + 1));
        objc_msgSend(v28, "addObject:", v33);

      }
    }
  }
  else
  {
    v28 = 0;
  }
  v34 = v47;
  if (objc_msgSend(v47, "count"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "componentsJoinedByString:", CFSTR(", ")));
    objc_msgSend(v22, "appendFormat:", CFSTR(" GROUP BY %@"), v35);

  }
  if (v18)
  {
    if (!v28)
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)objc_msgSend(v17, "count") >> 1));
    objc_msgSend(v22, "appendString:", CFSTR(" HAVING "));
    v36 = objc_msgSend(v18, "count");
    if (v36)
    {
      v37 = (unint64_t)v36;
      for (k = 0; k < v37; k += 2)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", k));
        objc_msgSend(v22, "appendString:", v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", k + 1));
        objc_msgSend(v28, "addObject:", v40);

      }
      v34 = v47;
    }
  }
  if (objc_msgSend(v19, "count"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", ")));
    objc_msgSend(v22, "appendFormat:", CFSTR(" ORDER BY %@"), v41);

  }
  if ((uint64_t)objc_msgSend(v20, "integerValue") >= 1)
    objc_msgSend(v22, "appendFormat:", CFSTR(" LIMIT %@"), v20);
  objc_msgSend(v22, "appendString:", CFSTR(";"));
  if (v28)
    v42 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:](self, "executeQuery:withArgumentsInArray:", v22, v28));
  else
    v42 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", v22));
  v43 = (void *)v42;

  return v43;
}

- (BOOL)UPDATE:(id)a3 SET:(id)a4 WHERE:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  unint64_t v20;
  unint64_t i;
  void *v22;
  void *v23;
  BOOL v24;
  void *v27;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("UPDATE OR FAIL %@ SET "), a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)objc_msgSend(v7, "count") + ((unint64_t)objc_msgSend(v8, "count") >> 1)));
  v27 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v12 = (char *)objc_msgSend(v11, "count");
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = v12 - 1;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v14));
      objc_msgSend(v9, "appendString:", v16);
      if ((objc_msgSend(v16, "containsString:", CFSTR("?")) & 1) == 0)
      {
        if (v14 >= v15)
          v17 = CFSTR(" = ?");
        else
          v17 = CFSTR(" = ?, ");
        objc_msgSend(v9, "appendString:", v17);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v16));
      objc_msgSend(v10, "addObject:", v18);

      ++v14;
    }
    while (v13 != v14);
  }
  objc_msgSend(v9, "appendString:", CFSTR(" WHERE "));
  v19 = objc_msgSend(v8, "count");
  if (v19)
  {
    v20 = (unint64_t)v19;
    for (i = 0; i < v20; i += 2)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", i));
      objc_msgSend(v9, "appendString:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", i + 1));
      objc_msgSend(v10, "addObject:", v23);

    }
  }
  objc_msgSend(v9, "appendString:", CFSTR(";"));
  v24 = -[_bmFMDatabase executeUpdate:withArgumentsInArray:](self, "executeUpdate:withArgumentsInArray:", v9, v10);

  return v24;
}

- (BOOL)INSERT_INTO:(id)a3 VALUES:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char *v8;
  id v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  unint64_t i;
  const __CFString *v19;
  BOOL v20;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("INSERT INTO %@"), a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  objc_msgSend(v6, "appendString:", CFSTR("("));
  v8 = (char *)objc_msgSend(v5, "count");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v5;
  v10 = (char *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      v23 = v12;
      v15 = v12 + 1;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v16));
        objc_msgSend(v7, "addObject:", v17);

        objc_msgSend(v6, "appendString:", v16);
        if (&v14[(_QWORD)v15] < v8)
          objc_msgSend(v6, "appendString:", CFSTR(","));
        ++v14;
      }
      while (v11 != v14);
      v12 = &v11[(_QWORD)v23];
      v11 = (char *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "appendString:", CFSTR(") VALUES ("));
  if (v8)
  {
    for (i = 0; (char *)i != v8; ++i)
    {
      if (i >= (unint64_t)(v8 - 1))
        v19 = CFSTR("?");
      else
        v19 = CFSTR("?,");
      objc_msgSend(v6, "appendString:", v19);
    }
  }
  objc_msgSend(v6, "appendString:", CFSTR(");"));
  v20 = -[_bmFMDatabase executeUpdate:withArgumentsInArray:](self, "executeUpdate:withArgumentsInArray:", v6, v7);

  return v20;
}

- (BOOL)DELETE_FROM:(id)a3 WHERE:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t i;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("DELETE FROM %@"), a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)objc_msgSend(v6, "count") >> 1));
  objc_msgSend(v7, "appendString:", CFSTR(" WHERE "));
  v9 = objc_msgSend(v6, "count");
  if (v9)
  {
    v10 = (unint64_t)v9;
    for (i = 0; i < v10; i += 2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", i));
      objc_msgSend(v7, "appendString:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", i + 1));
      objc_msgSend(v8, "addObject:", v13);

    }
  }
  objc_msgSend(v7, "appendString:", CFSTR(";"));
  v14 = -[_bmFMDatabase executeUpdate:withArgumentsInArray:](self, "executeUpdate:withArgumentsInArray:", v7, v8);

  return v14;
}

- (void)setShouldCacheStatementsWithoutClearingExistingStatements:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase cachedStatements](self, "cachedStatements"));
  -[_bmFMDatabase setShouldCacheStatements:](self, "setShouldCacheStatements:", v3);
  if (!v3)
    -[_bmFMDatabase setCachedStatements:](self, "setCachedStatements:", v5);

}

+ (_bmFMDatabase)databaseWithPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v4);

  return (_bmFMDatabase *)v5;
}

+ (_bmFMDatabase)databaseWithURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return (_bmFMDatabase *)v5;
}

- (_bmFMDatabase)init
{
  return -[_bmFMDatabase initWithPath:](self, "initWithPath:", 0);
}

- (_bmFMDatabase)initWithURL:(id)a3
{
  void *v4;
  _bmFMDatabase *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v5 = -[_bmFMDatabase initWithPath:](self, "initWithPath:", v4);

  return v5;
}

- (_bmFMDatabase)initWithPath:(id)a3
{
  id v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  if (!sqlite3_threadsafe())
    sub_10003DD90();
  v11.receiver = self;
  v11.super_class = (Class)_bmFMDatabase;
  v5 = -[_bmFMDatabase init](&v11, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v6;

    v8 = objc_alloc_init((Class)NSMutableSet);
    v9 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v8;

    *((_QWORD *)v5 + 1) = 0;
    *(_WORD *)(v5 + 59) = 256;
    *((_QWORD *)v5 + 8) = 0x4000000000000000;
    v5[61] = 0;
  }

  return (_bmFMDatabase *)v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_bmFMDatabase close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)_bmFMDatabase;
  -[_bmFMDatabase dealloc](&v3, "dealloc");
}

- (NSURL)databaseURL
{
  void *v2;

  if (self->_databasePath)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:"));
  else
    v2 = 0;
  return (NSURL *)v2;
}

+ (id)FMDBUserVersion
{
  return CFSTR("2.7.7");
}

+ (int)FMDBVersion
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003ADAC;
  block[3] = &unk_100069900;
  block[4] = a1;
  if (qword_10007BE88 != -1)
    dispatch_once(&qword_10007BE88, block);
  return dword_10007BE90;
}

+ (id)sqliteLibVersion
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sqlite3_libversion());
}

+ (BOOL)isSQLiteThreadSafe
{
  return sqlite3_threadsafe() != 0;
}

- (void)sqliteHandle
{
  return self->_db;
}

- (const)sqlitePath
{
  NSString *databasePath;

  databasePath = self->_databasePath;
  if (!databasePath)
    return ":memory:";
  if (-[NSString length](databasePath, "length"))
    return -[NSString fileSystemRepresentation](self->_databasePath, "fileSystemRepresentation");
  return "";
}

- (int)limitFor:(int)a3 value:(int)a4
{
  return sqlite3_limit((sqlite3 *)self->_db, a3, a4);
}

- (BOOL)open
{
  BOOL result;
  void **p_db;
  uint64_t v5;

  if (self->_isOpen)
    return 1;
  p_db = &self->_db;
  if (self->_db)
    -[_bmFMDatabase close](self, "close");
  v5 = sqlite3_open(-[_bmFMDatabase sqlitePath](self, "sqlitePath"), (sqlite3 **)p_db);
  if ((_DWORD)v5)
  {
    NSLog(CFSTR("error opening!: %d"), v5);
    return 0;
  }
  else
  {
    if (self->_maxBusyRetryTimeInterval > 0.0)
      -[_bmFMDatabase setMaxBusyRetryTimeInterval:](self, "setMaxBusyRetryTimeInterval:");
    result = 1;
    self->_isOpen = 1;
  }
  return result;
}

- (BOOL)openWithFlags:(int)a3
{
  return -[_bmFMDatabase openWithFlags:vfs:](self, "openWithFlags:vfs:", *(_QWORD *)&a3, 0);
}

- (BOOL)openWithFlags:(int)a3 vfs:(id)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;

  v6 = a4;
  if (self->_isOpen)
  {
    v7 = 1;
  }
  else
  {
    if (self->_db)
      -[_bmFMDatabase close](self, "close");
    v8 = sqlite3_open_v2(-[_bmFMDatabase sqlitePath](self, "sqlitePath"), (sqlite3 **)&self->_db, a3, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    if ((_DWORD)v8)
    {
      NSLog(CFSTR("error opening!: %d"), v8);
      v7 = 0;
    }
    else
    {
      if (self->_maxBusyRetryTimeInterval > 0.0)
        -[_bmFMDatabase setMaxBusyRetryTimeInterval:](self, "setMaxBusyRetryTimeInterval:");
      v7 = 1;
      self->_isOpen = 1;
    }
  }

  return v7;
}

- (BOOL)close
{
  sqlite3 *db;
  uint64_t v4;
  sqlite3_stmt *stmt;
  sqlite3_stmt *v6;

  -[_bmFMDatabase clearCachedStatements](self, "clearCachedStatements");
  -[_bmFMDatabase closeOpenResultSets](self, "closeOpenResultSets");
  db = (sqlite3 *)self->_db;
  if (db)
  {
    v4 = sqlite3_close(db);
    if ((v4 - 5) > 1)
      goto LABEL_7;
    stmt = sqlite3_next_stmt((sqlite3 *)self->_db, 0);
    if (stmt)
    {
      v6 = stmt;
      do
      {
        NSLog(CFSTR("Closing leaked statement"));
        sqlite3_finalize(v6);
        v6 = sqlite3_next_stmt((sqlite3 *)self->_db, 0);
      }
      while (v6);
      v4 = sqlite3_close((sqlite3 *)self->_db);
      if ((v4 - 5) > 1)
      {
LABEL_7:
        if ((_DWORD)v4)
          NSLog(CFSTR("error closing!: %d"), v4);
      }
    }
    self->_db = 0;
    self->_isOpen = 0;
  }
  return 1;
}

- (void)setMaxBusyRetryTimeInterval:(double)a3
{
  _bmFMDatabase *v3;
  sqlite3 *db;
  int (__cdecl *v5)(void *, int);

  v3 = self;
  self->_maxBusyRetryTimeInterval = a3;
  db = (sqlite3 *)self->_db;
  if (db)
  {
    if (a3 <= 0.0)
    {
      v5 = 0;
      v3 = 0;
    }
    else
    {
      v5 = (int (__cdecl *)(void *, int))sub_10003B21C;
    }
    sqlite3_busy_handler(db, v5, v3);
  }
}

- (double)maxBusyRetryTimeInterval
{
  return self->_maxBusyRetryTimeInterval;
}

- (int)busyRetryTimeout
{
  NSLog(CFSTR("%s:%d"), a2, "-[_bmFMDatabase busyRetryTimeout]", 347);
  NSLog(CFSTR("FMDB: busyRetryTimeout no longer works, please use maxBusyRetryTimeInterval"));
  return -1;
}

- (void)setBusyRetryTimeout:(int)a3
{
  NSLog(CFSTR("%s:%d"), a2, *(_QWORD *)&a3, "-[_bmFMDatabase setBusyRetryTimeout:]", 354);
  NSLog(CFSTR("FMDB: setBusyRetryTimeout does nothing, please use setMaxBusyRetryTimeInterval:"));
}

- (BOOL)hasOpenResultSets
{
  return -[NSMutableSet count](self->_openResultSets, "count") != 0;
}

- (void)closeOpenResultSets
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = -[NSMutableSet copy](self->_openResultSets, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pointerValue", (_QWORD)v11));
        objc_msgSend(v10, "setParentDB:", 0);
        objc_msgSend(v10, "close");
        -[NSMutableSet removeObject:](self->_openResultSets, "removeObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)resultSetDidClose:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", a3));
  -[NSMutableSet removeObject:](self->_openResultSets, "removeObject:", v4);

}

- (void)clearCachedStatements
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_cachedStatements, "objectEnumerator"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v7);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects", 0));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v15;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v15 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "close");
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v11);
        }

        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_cachedStatements, "removeAllObjects");
}

- (id)cachedStatementForQuery:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cachedStatements, "objectForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectsPassingTest:", &stru_100069940));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));

  return v5;
}

- (void)setCachedStatement:(id)a3 forQuery:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "copy");

    objc_msgSend(v12, "setQuery:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cachedStatements, "objectForKey:", v9));
    if (!v10)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    objc_msgSend(v10, "addObject:", v12);
    -[NSMutableDictionary setObject:forKey:](self->_cachedStatements, "setObject:forKey:", v10, v9);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMDatabase.m"), 411, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    NSLog(CFSTR("API misuse, -[_bmFMDatabase setCachedStatement:forQuery:] query must not be nil"));
  }

}

- (BOOL)rekey:(id)a3
{
  id v4;
  id v5;
  id v6;
  const char *v7;
  NSData *v8;
  void *v9;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "UTF8String");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  v8 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v5, strlen(v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  LOBYTE(self) = -[_bmFMDatabase rekeyWithData:](self, "rekeyWithData:", v9);

  return (char)self;
}

- (BOOL)rekeyWithData:(id)a3
{
  return 0;
}

- (BOOL)setKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  const char *v7;
  NSData *v8;
  void *v9;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "UTF8String");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  v8 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v5, strlen(v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  LOBYTE(self) = -[_bmFMDatabase setKeyWithData:](self, "setKeyWithData:", v9);

  return (char)self;
}

- (BOOL)setKeyWithData:(id)a3
{
  return 0;
}

+ (id)storeableDateFormat:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v4, "setDateFormat:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v4, "setTimeZone:", v5);

  v6 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v4, "setLocale:", v6);

  return v4;
}

- (BOOL)hasDateFormatter
{
  return self->_dateFormat != 0;
}

- (void)setDateFormat:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormat, a3);
}

- (id)dateFromString:(id)a3
{
  return -[NSDateFormatter dateFromString:](self->_dateFormat, "dateFromString:", a3);
}

- (id)stringFromDate:(id)a3
{
  return -[NSDateFormatter stringFromDate:](self->_dateFormat, "stringFromDate:", a3);
}

- (BOOL)goodConnection
{
  void *v2;
  void *v3;
  BOOL v4;

  if (!self->_isOpen)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", CFSTR("select name from sqlite_master where type='table'")));
  v3 = v2;
  v4 = v2 != 0;
  if (v2)
    objc_msgSend(v2, "close");

  return v4;
}

- (void)warnInUse
{
  NSLog(CFSTR("The _bmFMDatabase %@ is currently in use."), self);
  if (self->_crashOnErrors)
    sub_10003DDB8((uint64_t)a2, (uint64_t)self);
}

- (BOOL)databaseExists
{
  _BOOL4 isOpen;

  isOpen = self->_isOpen;
  if (!self->_isOpen)
  {
    NSLog(CFSTR("The _bmFMDatabase %@ is not open."), self);
    if (self->_crashOnErrors)
      sub_10003DE14((uint64_t)a2, (uint64_t)self);
  }
  return isOpen;
}

- (id)lastErrorMessage
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sqlite3_errmsg((sqlite3 *)self->_db));
}

- (BOOL)hadError
{
  return -[_bmFMDatabase lastErrorCode](self, "lastErrorCode") - 1 < 0x63;
}

- (int)lastErrorCode
{
  return sqlite3_errcode((sqlite3 *)self->_db);
}

- (int)lastExtendedErrorCode
{
  return sqlite3_extended_errcode((sqlite3 *)self->_db);
}

- (id)errorWithMessage:(id)a3
{
  void *v4;
  NSError *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", a3, NSLocalizedDescriptionKey));
  v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("_bmFMDatabase"), sqlite3_errcode((sqlite3 *)self->_db), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)lastError
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastErrorMessage](self, "lastErrorMessage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase errorWithMessage:](self, "errorWithMessage:", v3));

  return v4;
}

- (int64_t)lastInsertRowId
{
  int64_t result;

  if (self->_isExecutingStatement)
  {
    -[_bmFMDatabase warnInUse](self, "warnInUse");
    return 0;
  }
  else
  {
    self->_isExecutingStatement = 1;
    result = sqlite3_last_insert_rowid((sqlite3 *)self->_db);
    self->_isExecutingStatement = 0;
  }
  return result;
}

- (int)changes
{
  int result;

  if (self->_isExecutingStatement)
  {
    -[_bmFMDatabase warnInUse](self, "warnInUse");
    return 0;
  }
  else
  {
    self->_isExecutingStatement = 1;
    result = sqlite3_changes((sqlite3 *)self->_db);
    self->_isExecutingStatement = 0;
  }
  return result;
}

- (int)bindObject:(id)a3 toColumn:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  const char *v15;
  int v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  double v37;
  id v38;
  int v39;
  sqlite3_int64 v40;
  id v41;
  float v42;

  v8 = a3;
  if (v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

    if (v9 != v8)
    {
      v11 = objc_opt_class(NSData, v10);
      if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
      {
        v13 = objc_retainAutorelease(v8);
        v14 = (const char *)objc_msgSend(v13, "bytes");
        if (v14)
          v15 = v14;
        else
          v15 = "";
        v16 = sqlite3_bind_blob(a5, a4, v15, (int)objc_msgSend(v13, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        goto LABEL_9;
      }
      v19 = objc_opt_class(NSDate, v12);
      if ((objc_opt_isKindOfClass(v8, v19) & 1) != 0)
      {
        if (-[_bmFMDatabase hasDateFormatter](self, "hasDateFormatter"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase stringFromDate:](self, "stringFromDate:", v8));
LABEL_33:
          v38 = objc_retainAutorelease(v21);
          v17 = sqlite3_bind_text(a5, a4, (const char *)objc_msgSend(v38, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          goto LABEL_10;
        }
        objc_msgSend(v8, "timeIntervalSince1970");
        goto LABEL_30;
      }
      v22 = objc_opt_class(NSNumber, v20);
      if ((objc_opt_isKindOfClass(v8, v22) & 1) == 0)
      {
        v36 = v8;
        goto LABEL_32;
      }
      v23 = objc_retainAutorelease(v8);
      if (strcmp((const char *)objc_msgSend(v23, "objCType"), "c"))
      {
        v24 = objc_retainAutorelease(v23);
        if (!strcmp((const char *)objc_msgSend(v24, "objCType"), "C"))
        {
          v39 = objc_msgSend(v24, "unsignedCharValue");
          goto LABEL_39;
        }
        v25 = objc_retainAutorelease(v24);
        if (!strcmp((const char *)objc_msgSend(v25, "objCType"), "s"))
        {
          v39 = objc_msgSend(v25, "shortValue");
          goto LABEL_39;
        }
        v26 = objc_retainAutorelease(v25);
        if (!strcmp((const char *)objc_msgSend(v26, "objCType"), "S"))
        {
          v39 = objc_msgSend(v26, "unsignedShortValue");
          goto LABEL_39;
        }
        v27 = objc_retainAutorelease(v26);
        if (!strcmp((const char *)objc_msgSend(v27, "objCType"), "i"))
        {
          v39 = objc_msgSend(v27, "intValue");
          goto LABEL_39;
        }
        v28 = objc_retainAutorelease(v27);
        if (!strcmp((const char *)objc_msgSend(v28, "objCType"), "I"))
        {
          v40 = objc_msgSend(v28, "unsignedIntValue");
        }
        else
        {
          v29 = objc_retainAutorelease(v28);
          if (!strcmp((const char *)objc_msgSend(v29, "objCType"), "q"))
          {
            v41 = objc_msgSend(v29, "longValue");
          }
          else
          {
            v30 = objc_retainAutorelease(v29);
            if (!strcmp((const char *)objc_msgSend(v30, "objCType"), "Q"))
            {
              v41 = objc_msgSend(v30, "unsignedLongValue");
            }
            else
            {
              v31 = objc_retainAutorelease(v30);
              if (!strcmp((const char *)objc_msgSend(v31, "objCType"), "q"))
              {
                v41 = objc_msgSend(v31, "longLongValue");
              }
              else
              {
                v32 = objc_retainAutorelease(v31);
                if (strcmp((const char *)objc_msgSend(v32, "objCType"), "Q"))
                {
                  v33 = objc_retainAutorelease(v32);
                  if (!strcmp((const char *)objc_msgSend(v33, "objCType"), "f"))
                  {
                    objc_msgSend(v33, "floatValue");
                    v37 = v42;
                  }
                  else
                  {
                    v34 = objc_retainAutorelease(v33);
                    if (strcmp((const char *)objc_msgSend(v34, "objCType"), "d"))
                    {
                      v35 = objc_retainAutorelease(v34);
                      if (strcmp((const char *)objc_msgSend(v35, "objCType"), "B"))
                      {
                        v36 = v35;
LABEL_32:
                        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "description"));
                        goto LABEL_33;
                      }
                      v39 = objc_msgSend(v35, "BOOLValue");
LABEL_39:
                      v16 = sqlite3_bind_int(a5, a4, v39);
                      goto LABEL_9;
                    }
                    objc_msgSend(v34, "doubleValue");
                  }
LABEL_30:
                  v16 = sqlite3_bind_double(a5, a4, v37);
                  goto LABEL_9;
                }
                v41 = objc_msgSend(v32, "unsignedLongLongValue");
              }
            }
          }
          v40 = (sqlite3_int64)v41;
        }
        v16 = sqlite3_bind_int64(a5, a4, v40);
        goto LABEL_9;
      }
      v39 = objc_msgSend(v23, "charValue");
      goto LABEL_39;
    }
  }
  v16 = sqlite3_bind_null(a5, a4);
LABEL_9:
  v17 = v16;
LABEL_10:

  return v17;
}

- (void)extractSQL:(id)a3 argumentsList:(char *)a4 intoString:(id)a5 arguments:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  id v17;
  id v18;
  unsigned int *v19;
  id v20;
  unsigned int *v21;
  unsigned int *v22;
  double *v23;
  char *v24;
  double v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  unsigned int v29;
  char *v30;
  char *v31;
  char *v32;
  id *v33;
  void *v34;
  uint64_t v35;
  unsigned __int16 *v36;
  char *v37;
  char *v38;
  char *v39;
  void *v40;
  const __CFString *v41;
  char *v42;
  uint64_t v43;
  char *v44;

  v9 = a3;
  v44 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v9, "length");
  if (v12)
  {
    v13 = (unint64_t)v12;
    LODWORD(v14) = 0;
    v15 = 0;
    while (1)
    {
      v16 = v14;
      v17 = objc_msgSend(v9, "characterAtIndex:", v15);
      v14 = (uint64_t)v17;
      if (v16 == 37)
        break;
      if ((_DWORD)v17 == 37)
        goto LABEL_48;
LABEL_45:
      v35 = v14;
      if ((_DWORD)v14)
      {
LABEL_46:
        v43 = v35;
        v40 = v10;
        v41 = CFSTR("%C");
        goto LABEL_47;
      }
LABEL_48:
      if (++v15 >= v13)
        goto LABEL_53;
    }
    if ((int)v17 > 98)
    {
      switch((int)v17)
      {
        case 'c':
          v18 = objc_alloc((Class)NSString);
          v19 = (unsigned int *)v44;
          v44 += 8;
          v20 = objc_msgSend(v18, "initWithFormat:", CFSTR("%c"), *v19);
          goto LABEL_31;
        case 'd':
        case 'i':
          goto LABEL_13;
        case 'f':
          v23 = (double *)v44;
          v44 += 8;
          v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *v23));
          goto LABEL_31;
        case 'g':
          v24 = v44;
          v44 += 8;
          v25 = *(double *)v24;
          *(float *)&v25 = *(double *)v24;
          v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25));
          goto LABEL_31;
        case 'h':
          v26 = v15 + 1;
          if (v15 + 1 >= v13)
            goto LABEL_36;
          if (objc_msgSend(v9, "characterAtIndex:", v15 + 1) == 105)
          {
            v27 = v44;
            v44 += 8;
            v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", *(__int16 *)v27));
            goto LABEL_42;
          }
          if (objc_msgSend(v9, "characterAtIndex:", v15 + 1) == 117)
          {
            v36 = (unsigned __int16 *)v44;
            v44 += 8;
            v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *v36));
            goto LABEL_42;
          }
LABEL_36:
          v35 = 104;
          goto LABEL_46;
        case 'l':
          v26 = v15 + 1;
          if (v15 + 1 >= v13)
            goto LABEL_33;
          v29 = objc_msgSend(v9, "characterAtIndex:", v15 + 1);
          if (v29 == 100)
          {
            v38 = v44;
            v44 += 8;
            v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", *(_QWORD *)v38));
            goto LABEL_42;
          }
          if (v29 == 117)
          {
            v39 = v44;
            v44 += 8;
            v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *(_QWORD *)v39));
            goto LABEL_42;
          }
          if (v29 != 108)
          {
LABEL_33:
            v35 = 108;
            goto LABEL_46;
          }
          v15 += 2;
          if (v15 < v13)
          {
            if (objc_msgSend(v9, "characterAtIndex:", v15) == 100)
            {
              v30 = v44;
              v44 += 8;
              v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *(_QWORD *)v30));
              goto LABEL_31;
            }
            if (objc_msgSend(v9, "characterAtIndex:", v15) == 117)
            {
              v42 = v44;
              v44 += 8;
              v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)v42));
              goto LABEL_31;
            }
          }
          v35 = 108;
          v15 = v26;
          goto LABEL_46;
        case 'q':
          v26 = v15 + 1;
          if (v15 + 1 >= v13)
            goto LABEL_39;
          if (objc_msgSend(v9, "characterAtIndex:", v15 + 1) == 105)
          {
            v31 = v44;
            v44 += 8;
            v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *(_QWORD *)v31));
          }
          else
          {
            if (objc_msgSend(v9, "characterAtIndex:", v15 + 1) != 117)
            {
LABEL_39:
              v35 = 113;
              goto LABEL_46;
            }
            v37 = v44;
            v44 += 8;
            v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)v37));
          }
LABEL_42:
          v34 = (void *)v28;
          v15 = v26;
          if (!v28)
            goto LABEL_43;
          goto LABEL_32;
        case 's':
          v32 = v44;
          v44 += 8;
          v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)v32));
          goto LABEL_31;
        case 'u':
          goto LABEL_12;
        default:
          goto LABEL_43;
      }
    }
    switch((_DWORD)v17)
    {
      case '@':
        v33 = (id *)v44;
        v44 += 8;
        v20 = *v33;
        break;
      case 'D':
LABEL_13:
        v22 = (unsigned int *)v44;
        v44 += 8;
        v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *v22));
        break;
      case 'U':
LABEL_12:
        v21 = (unsigned int *)v44;
        v44 += 8;
        v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *v21));
        break;
      default:
LABEL_43:
        if ((_DWORD)v14 == 64)
        {
          v40 = v10;
          v41 = CFSTR("NULL");
LABEL_47:
          objc_msgSend(v40, "appendFormat:", v41, v43);
          goto LABEL_48;
        }
        goto LABEL_45;
    }
LABEL_31:
    v34 = v20;
    if (v20)
    {
LABEL_32:
      objc_msgSend(v10, "appendString:", CFSTR("?"));
      objc_msgSend(v11, "addObject:", v34);

      goto LABEL_48;
    }
    goto LABEL_43;
  }
LABEL_53:

}

- (id)executeQuery:(id)a3 withParameterDictionary:(id)a4
{
  return -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, a4, 0, 1);
}

- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6 shouldBind:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  id v14;
  id v15;
  id v16;
  _bmFMStatement *v18;
  _bmFMStatement *v19;
  sqlite3 *db;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  sqlite3_stmt *ppStmt;

  v7 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (!-[_bmFMDatabase databaseExists](self, "databaseExists"))
    goto LABEL_4;
  if (!self->_isExecutingStatement)
  {
    self->_isExecutingStatement = 1;
    ppStmt = 0;
    if (v13 && self->_traceExecution)
      NSLog(CFSTR("%@ executeQuery: %@"), self, v13);
    if (self->_shouldCacheStatements)
    {
      v18 = (_bmFMStatement *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase cachedStatementForQuery:](self, "cachedStatementForQuery:", v13));
      v19 = v18;
      if (v18)
      {
        ppStmt = -[_bmFMStatement statement](v18, "statement");
        -[_bmFMStatement reset](v19, "reset");
        if (ppStmt)
          goto LABEL_20;
      }
      else
      {
        ppStmt = 0;
        objc_msgSend(0, "reset");
      }
    }
    else
    {
      v19 = 0;
    }
    db = (sqlite3 *)self->_db;
    v21 = objc_retainAutorelease(v13);
    if (sqlite3_prepare_v2(db, (const char *)objc_msgSend(v21, "UTF8String"), -1, &ppStmt, 0))
    {
      if (self->_logsErrors)
      {
        v22 = -[_bmFMDatabase lastErrorCode](self, "lastErrorCode");
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastErrorMessage](self, "lastErrorMessage"));
        NSLog(CFSTR("DB Error: %d \"%@\"), v22, v23);

        NSLog(CFSTR("DB Query: %@"), v21);
        NSLog(CFSTR("DB Path: %@"), self->_databasePath);
      }
      if (self->_crashOnErrors)
        sub_10003DE70(self, (uint64_t)a2);
      sqlite3_finalize(ppStmt);
      v16 = 0;
      ppStmt = 0;
      self->_isExecutingStatement = 0;
LABEL_28:

      goto LABEL_5;
    }
LABEL_20:
    if (v7
      && !-[_bmFMDatabase bindStatement:WithArgumentsInArray:orDictionary:orVAList:](self, "bindStatement:WithArgumentsInArray:orDictionary:orVAList:", ppStmt, v14, v15, a6))
    {
      v16 = 0;
    }
    else
    {
      if (!v19)
      {
        v19 = objc_alloc_init(_bmFMStatement);
        -[_bmFMStatement setStatement:](v19, "setStatement:", ppStmt);
        if (v13)
        {
          if (self->_shouldCacheStatements)
            -[_bmFMDatabase setCachedStatement:forQuery:](self, "setCachedStatement:forQuery:", v19, v13);
        }
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[_bmFMResultSet resultSetWithStatement:usingParentDatabase:shouldAutoClose:](_bmFMResultSet, "resultSetWithStatement:usingParentDatabase:shouldAutoClose:", v19, self, v7));
      objc_msgSend(v24, "setQuery:", v13);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v24));
      -[NSMutableSet addObject:](self->_openResultSets, "addObject:", v25);
      -[_bmFMStatement setUseCount:](v19, "setUseCount:", (char *)-[_bmFMStatement useCount](v19, "useCount") + 1);
      self->_isExecutingStatement = 0;
      v16 = v24;

    }
    goto LABEL_28;
  }
  -[_bmFMDatabase warnInUse](self, "warnInUse");
LABEL_4:
  v16 = 0;
LABEL_5:

  return v16;
}

- (BOOL)bindStatement:(sqlite3_stmt *)a3 WithArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6
{
  id v10;
  int v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  BOOL v35;
  const char *v36;
  int v38;
  id v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  char *v46;
  _BYTE v47[128];

  v39 = a4;
  v10 = a5;
  v46 = a6;
  v11 = sqlite3_bind_parameter_count(a3);
  v38 = v11;
  if (v10)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v12)
    {
      v13 = v12;
      LODWORD(v41) = 0;
      v14 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR(":%@"), v16);
          if (self->_traceExecution)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v16));
            NSLog(CFSTR("%@ = %@"), v17, v18);

          }
          v19 = objc_retainAutorelease(v17);
          v20 = sqlite3_bind_parameter_index(a3, (const char *)objc_msgSend(v19, "UTF8String"));
          if ((int)v20 < 1)
          {
            NSLog(CFSTR("Could not find index for %@"), v16);
          }
          else
          {
            v21 = v20;
            v22 = v10;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v16));
            v24 = -[_bmFMDatabase bindObject:toColumn:inStatement:](self, "bindObject:toColumn:inStatement:", v23, v21, a3);

            if ((_DWORD)v24)
            {
              v36 = sqlite3_errmsg((sqlite3 *)self->_db);
              NSLog(CFSTR("Error: unable to bind (%d, %s"), v24, v36);
              sqlite3_finalize(a3);
              self->_isExecutingStatement = 0;

              v26 = 0;
              v35 = 0;
              v10 = v22;
              goto LABEL_37;
            }
            LODWORD(v41) = v41 + 1;
            v10 = v22;
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      LODWORD(v41) = 0;
    }

    v27 = 0;
  }
  else
  {
    v25 = 0;
    v26 = 0;
    v41 = v11 & ~(v11 >> 31);
    while (1)
    {
      v27 = v26;
      if (v41 == v25)
        break;
      if (v39 && v25 < (int)objc_msgSend(v39, "count"))
      {
        v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndex:", v25));
      }
      else
      {
        if (!v46)
        {
          LODWORD(v41) = v25;
          break;
        }
        v29 = (id *)v46;
        v46 += 8;
        v28 = *v29;
      }
      v26 = v28;

      if (self->_traceExecution)
      {
        v31 = objc_opt_class(NSData, v30);
        if ((objc_opt_isKindOfClass(v26, v31) & 1) != 0)
          NSLog(CFSTR("data: %ld bytes"), objc_msgSend(v26, "length"));
        else
          NSLog(CFSTR("obj: %@"), v26);
      }
      v32 = -[_bmFMDatabase bindObject:toColumn:inStatement:](self, "bindObject:toColumn:inStatement:", v26, ++v25, a3);
      if ((_DWORD)v32)
      {
        v33 = v32;
        v34 = sqlite3_errmsg((sqlite3 *)self->_db);
        NSLog(CFSTR("Error: unable to bind (%d, %s"), v33, v34);
        sqlite3_finalize(a3);
        v35 = 0;
        self->_isExecutingStatement = 0;
        goto LABEL_37;
      }
    }
  }
  if ((_DWORD)v41 == v38)
  {
    v35 = 1;
  }
  else
  {
    NSLog(CFSTR("Error: the bind count is not correct for the # of variables (executeQuery)"));
    sqlite3_finalize(a3);
    v35 = 0;
    self->_isExecutingStatement = 0;
  }
  v26 = v27;
LABEL_37:

  return v35;
}

- (id)executeQuery:(id)a3
{
  uint64_t v4;

  return (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, 0, &v4, 1));
}

- (id)executeQueryWithFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", objc_msgSend(v4, "length")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[_bmFMDatabase extractSQL:argumentsList:intoString:arguments:](self, "extractSQL:argumentsList:intoString:arguments:", v4, &v9, v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:](self, "executeQuery:withArgumentsInArray:", v5, v6));
  return v7;
}

- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4
{
  return -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, a4, 0, 0, 1);
}

- (id)executeQuery:(id)a3 values:(id)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;

  v7 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, a4, 0, 0, 1));
  v8 = (void *)v7;
  if (a5 && !v7)
    *a5 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self, "lastError"));
  return v8;
}

- (id)executeQuery:(id)a3 withVAList:(char *)a4
{
  return -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, 0, a4, 1);
}

- (BOOL)executeUpdate:(id)a3 error:(id *)a4 withArgumentsInArray:(id)a5 orDictionary:(id)a6 orVAList:(char *)a7
{
  void *v9;
  void *v10;
  BOOL v11;
  id v12;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, a5, a6, a7, 1));
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "internalStepWithError:", a4) == 101;
  }
  else if (a4)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self, "lastError"));
    v11 = 0;
    *a4 = v12;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)executeUpdate:(id)a3
{
  uint64_t v4;

  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:](self, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:", a3, 0, 0, 0, &v4);
}

- (BOOL)executeUpdate:(id)a3 withArgumentsInArray:(id)a4
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:](self, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:", a3, 0, a4, 0, 0);
}

- (BOOL)executeUpdate:(id)a3 values:(id)a4 error:(id *)a5
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:](self, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:", a3, a5, a4, 0, 0);
}

- (BOOL)executeUpdate:(id)a3 withParameterDictionary:(id)a4
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:](self, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:", a3, 0, 0, a4, 0);
}

- (BOOL)executeUpdate:(id)a3 withVAList:(char *)a4
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:](self, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:", a3, 0, 0, 0, a4);
}

- (BOOL)executeUpdateWithFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", objc_msgSend(v4, "length")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[_bmFMDatabase extractSQL:argumentsList:intoString:arguments:](self, "extractSQL:argumentsList:intoString:arguments:", v4, &v8, v5, v6);

  LOBYTE(self) = -[_bmFMDatabase executeUpdate:withArgumentsInArray:](self, "executeUpdate:withArgumentsInArray:", v5, v6);
  return (char)self;
}

- (BOOL)executeStatements:(id)a3
{
  return -[_bmFMDatabase executeStatements:withResultBlock:](self, "executeStatements:withResultBlock:", a3, 0);
}

- (BOOL)executeStatements:(id)a3 withResultBlock:(id)a4
{
  id v6;
  id v7;
  sqlite3 *v8;
  id v9;
  const char *v10;
  int (__cdecl *v11)(void *, int, char **, char **);
  int v12;
  char *errmsg;

  errmsg = 0;
  v6 = a4;
  v7 = a3;
  v8 = -[_bmFMDatabase sqliteHandle](self, "sqliteHandle");
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  if (v6)
    v11 = (int (__cdecl *)(void *, int, char **, char **))sub_10003CEBC;
  else
    v11 = 0;
  v12 = sqlite3_exec(v8, v10, v11, v6, &errmsg);

  if (errmsg)
  {
    if (-[_bmFMDatabase logsErrors](self, "logsErrors"))
      NSLog(CFSTR("Error inserting batch: %s"), errmsg);
    if (errmsg)
      sqlite3_free(errmsg);
  }
  return v12 == 0;
}

- (BOOL)executeUpdate:(id)a3 withErrorAndBindings:(id *)a4
{
  uint64_t v5;

  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:](self, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:", a3, a4, 0, 0, &v5);
}

- (BOOL)update:(id)a3 withErrorAndBindings:(id *)a4
{
  uint64_t v5;

  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:](self, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:", a3, a4, 0, 0, &v5);
}

- (id)prepare:(id)a3
{
  return -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, 0, 0, 0);
}

- (BOOL)rollback
{
  _BOOL4 v3;

  v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", CFSTR("rollback transaction"));
  if (v3)
    self->_isInTransaction = 0;
  return v3;
}

- (BOOL)commit
{
  _BOOL4 v3;

  v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", CFSTR("commit transaction"));
  if (v3)
    self->_isInTransaction = 0;
  return v3;
}

- (BOOL)beginTransaction
{
  _BOOL4 v3;

  v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", CFSTR("begin exclusive transaction"));
  if (v3)
    self->_isInTransaction = 1;
  return v3;
}

- (BOOL)beginDeferredTransaction
{
  _BOOL4 v3;

  v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", CFSTR("begin deferred transaction"));
  if (v3)
    self->_isInTransaction = 1;
  return v3;
}

- (BOOL)beginImmediateTransaction
{
  _BOOL4 v3;

  v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", CFSTR("begin immediate transaction"));
  if (v3)
    self->_isInTransaction = 1;
  return v3;
}

- (BOOL)beginExclusiveTransaction
{
  _BOOL4 v3;

  v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", CFSTR("begin exclusive transaction"));
  if (v3)
    self->_isInTransaction = 1;
  return v3;
}

- (BOOL)inTransaction
{
  return self->_isInTransaction;
}

- (BOOL)interrupt
{
  void *db;

  db = self->_db;
  if (db)
    sqlite3_interrupt((sqlite3 *)-[_bmFMDatabase sqliteHandle](self, "sqliteHandle"));
  return db != 0;
}

- (BOOL)startSavePointWithName:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMDatabase.m"), 1256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v8 = objc_alloc((Class)NSString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''")));
  v10 = objc_msgSend(v8, "initWithFormat:", CFSTR("savepoint '%@';"), v9);

  v11 = -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:](self, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:", v10, a4, 0, 0, 0);
  return v11;
}

- (BOOL)releaseSavePointWithName:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMDatabase.m"), 1270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v8 = objc_alloc((Class)NSString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''")));
  v10 = objc_msgSend(v8, "initWithFormat:", CFSTR("release savepoint '%@';"), v9);

  v11 = -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:](self, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:", v10, a4, 0, 0, 0);
  return v11;
}

- (BOOL)rollbackToSavePointWithName:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMDatabase.m"), 1284, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v8 = objc_alloc((Class)NSString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''")));
  v10 = objc_msgSend(v8, "initWithFormat:", CFSTR("rollback transaction to savepoint '%@';"), v9);

  v11 = -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:](self, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:", v10, a4, 0, 0, 0);
  return v11;
}

- (id)inSavePoint:(id)a3
{
  void (**v4)(id, _BYTE *);
  id v5;
  uint64_t v6;
  id v7;
  unsigned int v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  id v15;
  id v16;
  char v17;

  v4 = (void (**)(id, _BYTE *))a3;
  v5 = objc_alloc((Class)NSString);
  v6 = qword_10007BE98++;
  v7 = objc_msgSend(v5, "initWithFormat:", CFSTR("dbSavePoint%ld"), v6);
  v17 = 0;
  v16 = 0;
  v8 = -[_bmFMDatabase startSavePointWithName:error:](self, "startSavePointWithName:error:", v7, &v16);
  v9 = v16;
  if (v8)
  {
    if (v4)
    {
      v4[2](v4, &v17);
      if (v17)
      {
        v15 = v9;
        -[_bmFMDatabase rollbackToSavePointWithName:error:](self, "rollbackToSavePointWithName:error:", v7, &v15);
        v10 = v15;

        v9 = v10;
      }
    }
    v14 = v9;
    -[_bmFMDatabase releaseSavePointWithName:error:](self, "releaseSavePointWithName:error:", v7, &v14);
    v11 = v14;

    v9 = v11;
  }
  v12 = v9;

  return v12;
}

- (BOOL)checkpoint:(int)a3 error:(id *)a4
{
  return -[_bmFMDatabase checkpoint:name:logFrameCount:checkpointCount:error:](self, "checkpoint:name:logFrameCount:checkpointCount:error:", *(_QWORD *)&a3, 0, 0, 0, a4);
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5
{
  return -[_bmFMDatabase checkpoint:name:logFrameCount:checkpointCount:error:](self, "checkpoint:name:logFrameCount:checkpointCount:error:", *(_QWORD *)&a3, a4, 0, 0, a5);
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7
{
  id v13;
  int v14;
  void *v15;

  v13 = objc_retainAutorelease(a4);
  v14 = sqlite3_wal_checkpoint_v2((sqlite3 *)self->_db, (const char *)objc_msgSend(v13, "UTF8String"), a3, a5, a6);
  if (v14)
  {
    if (a7)
      *a7 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self, "lastError"));
    if (-[_bmFMDatabase logsErrors](self, "logsErrors"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastErrorMessage](self, "lastErrorMessage"));
      NSLog(CFSTR("%@"), v15);

    }
    if (-[_bmFMDatabase crashOnErrors](self, "crashOnErrors"))
      sub_10003DEF4(self, (uint64_t)a2);
  }

  return v14 == 0;
}

- (BOOL)shouldCacheStatements
{
  return self->_shouldCacheStatements;
}

- (void)setShouldCacheStatements:(BOOL)a3
{
  void *v4;

  self->_shouldCacheStatements = a3;
  if (!a3
    || !self->_cachedStatements
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary")),
        -[_bmFMDatabase setCachedStatements:](self, "setCachedStatements:", v4),
        v4,
        !self->_shouldCacheStatements))
  {
    -[_bmFMDatabase setCachedStatements:](self, "setCachedStatements:", 0);
  }
}

- (void)makeFunctionNamed:(id)a3 maximumArguments:(int)a4 withBlock:(id)a5
{
  -[_bmFMDatabase makeFunctionNamed:arguments:block:](self, "makeFunctionNamed:arguments:block:", a3, *(_QWORD *)&a4, a5);
}

- (void)makeFunctionNamed:(id)a3 arguments:(int)a4 block:(id)a5
{
  id v8;
  id v9;
  NSMutableSet *v10;
  NSMutableSet *openFunctions;
  id v12;
  sqlite3 *v13;
  id v14;

  v8 = a3;
  v9 = a5;
  if (!self->_openFunctions)
  {
    v10 = objc_opt_new(NSMutableSet);
    openFunctions = self->_openFunctions;
    self->_openFunctions = v10;

  }
  v12 = objc_msgSend(v9, "copy");
  -[NSMutableSet addObject:](self->_openFunctions, "addObject:", v12);
  v13 = -[_bmFMDatabase sqliteHandle](self, "sqliteHandle");
  v14 = objc_retainAutorelease(v8);
  sqlite3_create_function(v13, (const char *)objc_msgSend(v14, "UTF8String"), a4, 1, v12, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_10003D848, 0, 0);

}

- (int)valueType:(void *)a3
{
  return sqlite3_value_type((sqlite3_value *)a3);
}

- (int)valueInt:(void *)a3
{
  return sqlite3_value_int((sqlite3_value *)a3);
}

- (int64_t)valueLong:(void *)a3
{
  return sqlite3_value_int64((sqlite3_value *)a3);
}

- (double)valueDouble:(void *)a3
{
  return sqlite3_value_double((sqlite3_value *)a3);
}

- (id)valueData:(void *)a3
{
  const void *v4;
  int v5;
  void *v6;

  v4 = sqlite3_value_blob((sqlite3_value *)a3);
  v5 = sqlite3_value_bytes((sqlite3_value *)a3);
  if (v4)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, v5));
  else
    v6 = 0;
  return v6;
}

- (id)valueString:(void *)a3
{
  unsigned __int8 *v3;

  v3 = (unsigned __int8 *)sqlite3_value_text((sqlite3_value *)a3);
  if (v3)
    v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
  return v3;
}

- (void)resultNullInContext:(void *)a3
{
  sqlite3_result_null((sqlite3_context *)a3);
}

- (void)resultInt:(int)a3 context:(void *)a4
{
  sqlite3_result_int((sqlite3_context *)a4, a3);
}

- (void)resultLong:(int64_t)a3 context:(void *)a4
{
  sqlite3_result_int64((sqlite3_context *)a4, a3);
}

- (void)resultDouble:(double)a3 context:(void *)a4
{
  sqlite3_result_double((sqlite3_context *)a4, a3);
}

- (void)resultData:(id)a3 context:(void *)a4
{
  id v5;
  id v6;
  int v7;

  v5 = a3;
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  sqlite3_result_blob((sqlite3_context *)a4, v6, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)resultString:(id)a3 context:(void *)a4
{
  sqlite3_result_text((sqlite3_context *)a4, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)resultError:(id)a3 context:(void *)a4
{
  sqlite3_result_error((sqlite3_context *)a4, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), -1);
}

- (void)resultErrorCode:(int)a3 context:(void *)a4
{
  sqlite3_result_error_code((sqlite3_context *)a4, a3);
}

- (void)resultErrorNoMemoryInContext:(void *)a3
{
  sqlite3_result_error_nomem((sqlite3_context *)a3);
}

- (void)resultErrorTooBigInContext:(void *)a3
{
  sqlite3_result_error_toobig((sqlite3_context *)a3);
}

- (BOOL)traceExecution
{
  return self->_traceExecution;
}

- (void)setTraceExecution:(BOOL)a3
{
  self->_traceExecution = a3;
}

- (BOOL)checkedOut
{
  return self->_checkedOut;
}

- (void)setCheckedOut:(BOOL)a3
{
  self->_checkedOut = a3;
}

- (BOOL)crashOnErrors
{
  return self->_crashOnErrors;
}

- (void)setCrashOnErrors:(BOOL)a3
{
  self->_crashOnErrors = a3;
}

- (BOOL)logsErrors
{
  return self->_logsErrors;
}

- (void)setLogsErrors:(BOOL)a3
{
  self->_logsErrors = a3;
}

- (NSMutableDictionary)cachedStatements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedStatements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (BOOL)isInTransaction
{
  return self->_isInTransaction;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_cachedStatements, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_openFunctions, 0);
  objc_storeStrong((id *)&self->_openResultSets, 0);
}

- (id)stringForQuery:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, 0, &v6, 1));
  v4 = 0;
  if (objc_msgSend(v3, "next"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForColumnIndex:", 0));
    objc_msgSend(v3, "close");
    objc_msgSend(v3, "setParentDB:", 0);
  }

  return v4;
}

- (int)intForQuery:(id)a3
{
  void *v3;
  int v4;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, 0, &v6, 1));
  if (objc_msgSend(v3, "next"))
  {
    v4 = objc_msgSend(v3, "intForColumnIndex:", 0);
    objc_msgSend(v3, "close");
    objc_msgSend(v3, "setParentDB:", 0);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)longForQuery:(id)a3
{
  void *v3;
  id v4;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, 0, &v6, 1));
  v4 = 0;
  if (objc_msgSend(v3, "next"))
  {
    v4 = objc_msgSend(v3, "longForColumnIndex:", 0);
    objc_msgSend(v3, "close");
    objc_msgSend(v3, "setParentDB:", 0);
  }

  return (int64_t)v4;
}

- (BOOL)BOOLForQuery:(id)a3
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, 0, &v6, 1));
  if (objc_msgSend(v3, "next"))
  {
    v4 = objc_msgSend(v3, "BOOLForColumnIndex:", 0);
    objc_msgSend(v3, "close");
    objc_msgSend(v3, "setParentDB:", 0);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)doubleForQuery:(id)a3
{
  void *v3;
  double v4;
  double v5;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, 0, &v7, 1));
  v4 = 0.0;
  if (objc_msgSend(v3, "next"))
  {
    objc_msgSend(v3, "doubleForColumnIndex:", 0);
    v4 = v5;
    objc_msgSend(v3, "close");
    objc_msgSend(v3, "setParentDB:", 0);
  }

  return v4;
}

- (id)dataForQuery:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, 0, &v6, 1));
  v4 = 0;
  if (objc_msgSend(v3, "next"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataForColumnIndex:", 0));
    objc_msgSend(v3, "close");
    objc_msgSend(v3, "setParentDB:", 0);
  }

  return v4;
}

- (id)dateForQuery:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:](self, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:", a3, 0, 0, &v6, 1));
  v4 = 0;
  if (objc_msgSend(v3, "next"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateForColumnIndex:", 0));
    objc_msgSend(v3, "close");
    objc_msgSend(v3, "setParentDB:", 0);
  }

  return v4;
}

- (BOOL)tableExists:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", CFSTR("select [sql] from sqlite_master where [type] = 'table' and lower(name) = ?"), v4));
  v6 = objc_msgSend(v5, "next");
  objc_msgSend(v5, "close");

  return v6;
}

- (id)getSchema
{
  return -[_bmFMDatabase executeQuery:](self, "executeQuery:", CFSTR("SELECT type, name, tbl_name, rootpage, sql FROM (SELECT * FROM sqlite_master UNION ALL SELECT * FROM sqlite_temp_master) WHERE type != 'meta' AND name NOT LIKE 'sqlite_%' ORDER BY tbl_name, type DESC, name"));
}

- (id)getTableSchema:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("pragma table_info('%@')"), v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", v5));
  return v6;
}

- (BOOL)columnExists:(id)a3 inTableWithName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "lowercaseString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase getTableSchema:](self, "getTableSchema:", v7));
  do
  {
    v10 = objc_msgSend(v9, "next");
    if (!v10)
      break;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForColumn:", CFSTR("name")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));
    v13 = objc_msgSend(v12, "isEqualToString:", v8);

  }
  while (!v13);
  objc_msgSend(v9, "close");

  return v10;
}

- (unsigned)applicationID
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", CFSTR("pragma application_id")));
  if (objc_msgSend(v2, "next"))
    v3 = objc_msgSend(v2, "longLongIntForColumnIndex:", 0);
  else
    v3 = 0;
  objc_msgSend(v2, "close");

  return v3;
}

- (void)setApplicationID:(unsigned int)a3
{
  void *v4;
  id v5;

  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("pragma application_id=%d"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", v5));
  objc_msgSend(v4, "next");
  objc_msgSend(v4, "close");

}

- (unsigned)userVersion
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", CFSTR("pragma user_version")));
  if (objc_msgSend(v2, "next"))
    v3 = objc_msgSend(v2, "longLongIntForColumnIndex:", 0);
  else
    v3 = 0;
  objc_msgSend(v2, "close");

  return v3;
}

- (void)setUserVersion:(unsigned int)a3
{
  void *v4;
  id v5;

  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("pragma user_version = %d"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", v5));
  objc_msgSend(v4, "next");
  objc_msgSend(v4, "close");

}

- (BOOL)columnExists:(id)a3 columnName:(id)a4
{
  return -[_bmFMDatabase columnExists:inTableWithName:](self, "columnExists:inTableWithName:", a4, a3);
}

- (BOOL)validateSQL:(id)a3 error:(id *)a4
{
  id v6;
  sqlite3 *v7;
  id v8;
  const char *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v6 = a3;
  v7 = -[_bmFMDatabase sqliteHandle](self, "sqliteHandle");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  v10 = sqlite3_prepare_v2(v7, v9, -1, &ppStmt, 0);
  v11 = v10;
  if (a4 && v10)
  {
    v12 = -[_bmFMDatabase lastErrorCode](self, "lastErrorCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastErrorMessage](self, "lastErrorMessage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v13, NSLocalizedDescriptionKey));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, v12, v14));

  }
  sqlite3_finalize(ppStmt);
  return v11 == 0;
}

@end
