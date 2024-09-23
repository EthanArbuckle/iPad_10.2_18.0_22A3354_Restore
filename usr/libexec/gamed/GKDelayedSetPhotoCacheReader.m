@implementation GKDelayedSetPhotoCacheReader

+ (id)readerWithDatabaseConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseConnection:", v4);

  return v5;
}

- (GKDelayedSetPhotoCacheReader)initWithDatabaseConnection:(id)a3
{
  id v4;
  GKDelayedSetPhotoCacheReader *v5;
  GKDelayedSetPhotoCacheReader *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDelayedSetPhotoCacheReader;
  v5 = -[GKDelayedSetPhotoCacheReader init](&v8, "init");
  v6 = v5;
  if (v5)
    -[GKDelayedSetPhotoCacheReader setConnection:](v5, "setConnection:", v4);

  return v6;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)setPhotoDescriptorStatement
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_1000CA7B8((uint64_t)off_1002C1B50);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    SELECT %@     FROM requests     INNER JOIN photos USING (request_id)     WHERE player_gcid = %s     ORDER BY time_stamp DESC;"),
                   v3,
                   ":player_gcid"));

  return v4;
}

- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
  GKBindParam(a3, ":player_gcid", (NSString *)a4);
}

- (id)setPhotoDescriptorForExecutedStatement:(sqlite3_stmt *)a3
{
  NSData *v4;
  id v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v10;
  _QWORD v11[4];
  _QWORD v12[4];

  v10 = a3;
  v4 = sub_1000CCE10(&v10);
  v5 = +[NSDate _gkDateFromScalarServerTimestamp:](NSDate, "_gkDateFromScalarServerTimestamp:", sqlite3_column_int64(a3, 1));
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sqlite3_column_double(a3, 3));
  v12[0] = CFSTR("image/png");
  v11[0] = CFSTR("content-type");
  v11[1] = CFSTR("timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_gkServerTimestamp"));
  v12[1] = v7;
  v12[2] = v4;
  v11[2] = CFSTR("image-data");
  v11[3] = CFSTR("avatar-type");
  v12[3] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));

  return v8;
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
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDelayedSetPhotoCacheReader.mm", 91, "-[GKDelayedSetPhotoCacheReader readResources:handler:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v10, "setResult:", v11);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000CD0FC;
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
  v21[2] = sub_1000CD440;
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
