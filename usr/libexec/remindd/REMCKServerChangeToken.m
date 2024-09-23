@implementation REMCKServerChangeToken

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCKServerChangeToken"));
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCKServerChangeToken");
}

- (CKServerChangeToken)serverChangeToken
{
  CKServerChangeToken *serverChangeToken;
  void *v4;
  CKServerChangeToken *v5;
  CKServerChangeToken *v6;

  serverChangeToken = self->_serverChangeToken;
  if (!serverChangeToken)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCKServerChangeToken serverChangeTokenData](self, "serverChangeTokenData"));
    if (v4)
    {
      v5 = (CKServerChangeToken *)objc_msgSend(objc_alloc((Class)CKServerChangeToken), "initWithData:", v4);
      v6 = self->_serverChangeToken;
      self->_serverChangeToken = v5;

    }
    serverChangeToken = self->_serverChangeToken;
  }
  return serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCKServerChangeToken serverChangeToken](self, "serverChangeToken"));
  v6 = objc_msgSend(v5, "isEqual:", v8);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serverChangeToken, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
    -[REMCKServerChangeToken setServerChangeTokenData:](self, "setServerChangeTokenData:", v7);

  }
}

+ (id)addServerChangeTokenForAccount:(id)a3 ckServerChangeToken:(id)a4 zoneID:(id)a5 databaseScope:(int64_t)a6 context:(id)a7
{
  __int16 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  NSObject *v24;

  v8 = a6;
  v12 = a5;
  v13 = a7;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entity"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));

  if (!v17)
  {
    v24 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      sub_1006826D8((uint64_t)a1, v24);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v17, v13));
  objc_msgSend(v18, "setAccount:", v15);
  objc_msgSend(v15, "addCkServerChangeTokensObject:", v18);

  objc_msgSend(v18, "setServerChangeToken:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  objc_msgSend(v18, "setZoneName:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ownerName"));
  v21 = objc_msgSend(v20, "isEqualToString:", CKCurrentUserDefaultName);

  if ((v21 & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ownerName"));
    objc_msgSend(v18, "setOwnerName:", v22);

  }
  objc_msgSend(v18, "setDatabaseScope:", v8);

  return v18;
}

+ (id)serverChangeTokenForAccount:(id)a3 zoneID:(id)a4 databaseScope:(int64_t)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[4];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ownerName")),
        v14 = objc_msgSend(v13, "isEqualToString:", CKCurrentUserDefaultName),
        v13,
        (v14 & 1) == 0))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ownerName"));
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("account == %@"), v10));
  v27[0] = v16;
  v26 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("zoneName == %@"), v17));
  v27[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ownerName == %@"), v15));
  v27[2] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("databaseScope == %ld"), a5));
  v27[3] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v21));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serverChangeTokensMatchingPredicate:inContext:", v22, v12));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));

  return v24;
}

+ (id)serverChangeTokensMatchingPredicate:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequest"));
  objc_msgSend(v8, "setPredicate:", v7);

  v13 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v8, &v13));

  v10 = v13;
  if (v10)
  {
    v11 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10068274C((uint64_t)v10, v11);

  }
  return v9;
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  REMCKServerChangeToken *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCKServerChangeToken managedObjectContext](self, "managedObjectContext"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000729F4;
  v8[3] = &unk_1007D7C68;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v5;
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
}

@end
