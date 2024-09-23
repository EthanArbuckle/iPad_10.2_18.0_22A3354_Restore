@implementation GKRemoveGamesCacheWriter

+ (id)writerWithDatabaseConnection:(id)a3 gameDescriptor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v9 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v8)), "initWithDatabaseConnection:gameDescriptor:", v6, v7);

  return v9;
}

- (GKRemoveGamesCacheWriter)initWithDatabaseConnection:(id)a3 gameDescriptor:(id)a4
{
  id v6;
  id v7;
  GKRemoveGamesCacheWriter *v8;
  GKRemoveGamesCacheWriter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKRemoveGamesCacheWriter;
  v8 = -[GKRemoveGamesCacheWriter init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[GKRemoveGamesCacheWriter setConnection:](v8, "setConnection:", v6);
    -[GKRemoveGamesCacheWriter setGameDescriptor:](v9, "setGameDescriptor:", v7);
  }

  return v9;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)requestsInsertSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("                           INSERT INTO requests(                          adam_id,                            bundle_id,                            bundle_version,                            external_version,                            player_gcid,                            time_stamp)                            VALUES (%s, %s, %s, %s, %s, %s)"), ":adam_id", ":bundle_id", ":bundle_version", ":external_version", ":player_gcid", ":time_stamp");
}

- (void)bindParametersForRequestsStatement:(sqlite3_stmt *)a3 playerID:(id)a4 digest:(id)a5
{
  NSNumber *v7;
  NSString *v8;
  NSString *v9;
  NSNumber *v10;
  NSString *v11;

  v11 = (NSString *)a4;
  GKBindParam(a3, ":player_gcid", v11);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_gameDescriptor, "objectForKeyedSubscript:", CFSTR("adam-id")));
  GKBindParam(a3, ":adam_id", v7);

  v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_gameDescriptor, "objectForKeyedSubscript:", CFSTR("bundle-id")));
  GKBindParam(a3, ":bundle_id", v8);

  v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_gameDescriptor, "objectForKeyedSubscript:", CFSTR("bundle-version")));
  GKBindParam(a3, ":bundle_version", v9);

  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_gameDescriptor, "objectForKeyedSubscript:", CFSTR("external-version")));
  GKBindParam(a3, ":external_version", v10);

}

- (id)removeGamesInsertSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("                           INSERT INTO remove_games(                          request_id,                            removed_bundle_id)                            VALUES (%s,%s);"),
           ":request_id",
           ":removed_bundle_id");
}

- (void)bindParametersForRemoveGamesStatement:(sqlite3_stmt *)a3 forRemovedBundleID:(id)a4 requestsRowID:(int64_t)a5
{
  NSString *v7;

  v7 = (NSString *)a4;
  GKBindParam(a3, ":request_id", a5);
  GKBindParam(a3, ":removed_bundle_id", v7);

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
  v28[2] = sub_1000CA024;
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
  GKDatabaseConnection *connection;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  GKRemoveGamesCacheWriter *v15;

  v6 = a3;
  v7 = a4;
  connection = self->_connection;
  v12 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000CA190;
  v13[3] = &unk_1002C1A08;
  v14 = v6;
  v15 = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CA594;
  v11[3] = &unk_1002C1A30;
  v9 = v7;
  v10 = v6;
  -[GKDatabaseConnection performAsyncTransaction:handler:](connection, "performAsyncTransaction:handler:", v13, v11);

}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSDictionary)gameDescriptor
{
  return self->_gameDescriptor;
}

- (void)setGameDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_gameDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameDescriptor, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
