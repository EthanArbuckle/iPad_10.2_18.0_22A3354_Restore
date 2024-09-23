@implementation GKRemoveGamesCacheReader

+ (id)readerWithDatabaseConnection:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  GKRemoveGamesCacheReader *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[GKRemoveGamesCacheReader initWithDatabaseConnection:bundleID:]([GKRemoveGamesCacheReader alloc], "initWithDatabaseConnection:bundleID:", v5, v6);

  return v7;
}

- (GKRemoveGamesCacheReader)initWithDatabaseConnection:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  GKRemoveGamesCacheReader *v8;
  GKRemoveGamesCacheReader *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKRemoveGamesCacheReader;
  v8 = -[GKRemoveGamesCacheReader init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[GKRemoveGamesCacheReader setConnection:](v8, "setConnection:", v6);
    -[GKRemoveGamesCacheReader setBundleID:](v9, "setBundleID:", v7);
  }

  return v9;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)getRemoveGamesDescriptorsStatement
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_1000CA7B8((uint64_t)off_1002C1A50);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %@     FROM requests     INNER JOIN remove_games USING (request_id)     WHERE player_gcid = %s;"),
                   v3,
                   ":player_gcid"));

  return v4;
}

- (id)getAllRemoveGamesRequestIDsStatement
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_1000CA904(&off_1002C1A70);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %@     FROM requests INNER JOIN remove_games USING (request_id)     WHERE player_gcid = %s;"),
                   v3,
                   ":player_gcid"));

  return v4;
}

- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4 bundleID:(id)a5
{
  NSString *v7;
  NSString *v8;

  v8 = (NSString *)a4;
  v7 = (NSString *)a5;
  GKBindParam(a3, ":player_gcid", v8);
  GKBindParam(a3, ":bundle_id", v7);

}

- (id)removeGamesForExecutedStatement:(sqlite3_stmt *)a3
{
  unsigned __int8 *v4;
  sqlite3_int64 v5;
  void *v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v10;

  v10 = a3;
  v4 = sub_1000CAB0C(&v10);
  v5 = sqlite3_column_int64(a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, CFSTR("bundle-id"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, CFSTR("game"), v7, CFSTR("timestamp"), 0));

  return v8;
}

- (void)readResources:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  dispatch_queue_global_t global_queue;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKRemoveGamesCacheReader.mm", 101, "-[GKRemoveGamesCacheReader readResources:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v9, "setResult:", v10);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000CAD54;
  v20[3] = &unk_1002C1AA8;
  v20[4] = self;
  v11 = v6;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  objc_msgSend(v12, "perform:", v20);
  global_queue = dispatch_get_global_queue(0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000CB3A8;
  v17[3] = &unk_1002C1AD0;
  v15 = v7;
  v19 = v15;
  v16 = v12;
  v18 = v16;
  objc_msgSend(v16, "notifyOnQueue:block:", v14, v17);

}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
