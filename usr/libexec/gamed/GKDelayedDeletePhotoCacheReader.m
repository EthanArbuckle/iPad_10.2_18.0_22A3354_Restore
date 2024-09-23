@implementation GKDelayedDeletePhotoCacheReader

+ (id)readerWithDatabaseConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseConnection:", v4);

  return v5;
}

- (GKDelayedDeletePhotoCacheReader)initWithDatabaseConnection:(id)a3
{
  id v4;
  GKDelayedDeletePhotoCacheReader *v5;
  GKDelayedDeletePhotoCacheReader *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDelayedDeletePhotoCacheReader;
  v5 = -[GKDelayedDeletePhotoCacheReader init](&v8, "init");
  v6 = v5;
  if (v5)
    -[GKDelayedDeletePhotoCacheReader setConnection:](v5, "setConnection:", v4);

  return v6;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)deletePhotoDescriptorStatement
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_1000CB5D8(off_1002C1AF0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    SELECT %@     FROM requests     INNER JOIN delete_photos USING (request_id)     WHERE player_gcid = %s     ORDER BY time_stamp DESC;"),
                   v3,
                   ":player_gcid"));

  return v4;
}

- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
  GKBindParam(a3, ":player_gcid", (NSString *)a4);
}

- (id)deletePhotoDescriptorForExecutedStatement:(sqlite3_stmt *)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[3];

  v3 = +[NSDate _gkDateFromScalarServerTimestamp:](NSDate, "_gkDateFromScalarServerTimestamp:", sqlite3_column_int64(a3, 1));
  v7[0] = CFSTR("delete-approved");
  v7[1] = CFSTR("delete-pending");
  v8[0] = &__kCFBooleanTrue;
  v8[1] = &__kCFBooleanTrue;
  v7[2] = CFSTR("timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_gkServerTimestamp"));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));

  return v5;
}

- (void)readResources:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  dispatch_queue_global_t global_queue;
  void *v15;
  id v16;
  id v17;
  NSString *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is being asked to read photos for multiple players. This is not currently supported."), objc_opt_class(self, v8));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v19, 0));

    objc_exception_throw(v20);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDelayedDeletePhotoCacheReader.mm", 84, "-[GKDelayedDeletePhotoCacheReader readResources:handler:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v10, "setResult:", v11);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000CBA48;
  v24[3] = &unk_1002C1AA8;
  v24[4] = self;
  v12 = v6;
  v25 = v12;
  v13 = v10;
  v26 = v13;
  objc_msgSend(v13, "perform:", v24);
  global_queue = dispatch_get_global_queue(0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000CBD8C;
  v21[3] = &unk_1002C1AD0;
  v16 = v7;
  v23 = v16;
  v17 = v13;
  v22 = v17;
  objc_msgSend(v17, "notifyOnQueue:block:", v15, v21);

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
