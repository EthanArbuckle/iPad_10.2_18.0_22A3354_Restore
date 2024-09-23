@implementation GKDelayedSetPlayerStatusCacheWriter

+ (id)writerWithDatabaseConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseConnection:", v4);

  return v5;
}

- (GKDelayedSetPlayerStatusCacheWriter)initWithDatabaseConnection:(id)a3
{
  id v4;
  GKDelayedSetPlayerStatusCacheWriter *v5;
  GKDelayedSetPlayerStatusCacheWriter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDelayedSetPlayerStatusCacheWriter;
  v5 = -[GKDelayedSetPlayerStatusCacheWriter init](&v8, "init");
  v6 = v5;
  if (v5)
    -[GKDelayedSetPlayerStatusCacheWriter setConnection:](v5, "setConnection:", v4);

  return v6;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)requestsInsertSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT INTO requests(           player_gcid,             time_stamp)             VALUES (%s, %s);"),
           ":player_gcid",
           ":time_stamp");
}

- (void)bindParametersForRequestsStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
  NSDate *v5;
  NSString *v6;

  v6 = (NSString *)a4;
  GKBindParam(a3, ":player_gcid", v6);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  GKBindParam(a3, ":time_stamp", v5);

}

- (id)statusInsertSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT INTO statuses(           request_id,             status)             VALUES (%s, %s);"),
           ":request_id",
           ":status");
}

- (void)bindParametersForStatusStatement:(sqlite3_stmt *)a3 status:(id)a4 requestsRowID:(int64_t)a5
{
  NSString *v7;

  v7 = (NSString *)a4;
  GKBindParam(a3, ":request_id", a5);
  GKBindParam(a3, ":status", v7);

}

- (id)deleteOldStatusesSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM requests WHERE request_id = %s;"),
           ":request_id");
}

- (void)bindParametersForDeleteOldStatusesStatement:(sqlite3_stmt *)a3 requestsRowID:(int64_t)a4
{
  GKBindParam(a3, ":request_id", a4);
}

- (id)getOldStatusesSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("            SELECT request_id             FROM requests                 INNER JOIN statuses USING (request_id)             WHERE player_gcid = %s;"),
           ":player_gcid");
}

- (void)bindParametersForGetOldStatusesStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
  GKBindParam(a3, ":player_gcid", (NSString *)a4);
}

- (void)writeToDatabase:(sqlite3 *)a3 statementStore:(id)a4 withInsertSQL:(id)a5 updateSQL:(id)a6 bindOperation:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  int v19;
  id v20;
  int v21;
  NSString *v22;
  uint64_t v23;
  NSException *v24;
  id v25;
  NSException *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  const __CFString *v31;
  id v32;
  const __CFString *v33;
  id v34;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000D0CC0;
  v28[3] = &unk_1002C1990;
  v15 = v11;
  v29 = v15;
  v16 = v14;
  v30 = v16;
  v17 = objc_retainBlock(v28);
  v18 = v12;
  v19 = ((uint64_t (*)(_QWORD *, id))v17[2])(v17, v18);
  v20 = v18;
  if (v13 && v19 == 101)
  {
    v20 = v13;

    v19 = ((uint64_t (*)(_QWORD *, id))v17[2])(v17, v20);
  }
  if (v19 != 101)
  {
    v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sqlite3_errmsg(a3));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v33 = CFSTR("SQL");
    v34 = v20;
    v24 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1)));
    v25 = (id)objc_claimAutoreleasedReturnValue(v24);
    objc_exception_throw(v25);
  }
  v21 = sqlite3_changes(a3);
  if (v13 && !v21)
  {
    v31 = CFSTR("SQL");
    v32 = v20;
    v26 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("UPDATE statement didn't affect any rows, meaning record unsuccessfully inserted"), objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1)));
    v27 = (id)objc_claimAutoreleasedReturnValue(v26);
    objc_exception_throw(v27);
  }

}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  GKDatabaseConnection *connection;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  GKDelayedSetPlayerStatusCacheWriter *v19;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is being asked to write statuses for multiple players. This is not currently supported."), objc_opt_class(self, v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v13, 0));

    objc_exception_throw(v14);
  }
  connection = self->_connection;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000D0ED4;
  v17[3] = &unk_1002C1A08;
  v10 = v6;
  v18 = v10;
  v19 = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D1498;
  v15[3] = &unk_1002C1A30;
  v11 = v7;
  v16 = v11;
  -[GKDatabaseConnection performAsyncTransaction:handler:](connection, "performAsyncTransaction:handler:", v17, v15);

}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
