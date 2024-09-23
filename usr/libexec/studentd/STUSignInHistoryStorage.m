@implementation STUSignInHistoryStorage

- (STUSignInHistoryStorage)initWithFileSystemPrimitives:(id)a3 accountPrimitives:(id)a4 transactionPrimitives:(id)a5 timerPrimitives:(id)a6 limit:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  STUSignInHistoryStorage *v17;
  STUSignInHistoryStorage *v18;
  CRKConcreteDarwinNotificationPublisher *v19;
  CRKConcreteDarwinNotificationPublisher *publisher;
  id v21;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)STUSignInHistoryStorage;
  v17 = -[STUSignInHistoryStorage init](&v23, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fileSystemPrimitives, a3);
    objc_storeStrong((id *)&v18->_accountPrimitives, a4);
    objc_storeStrong((id *)&v18->_transactionPrimitives, a5);
    objc_storeStrong((id *)&v18->_timerPrimitives, a6);
    v18->_limit = a7;
    v18->_ownerRecheckInterval = 10.0;
    v19 = objc_opt_new(CRKConcreteDarwinNotificationPublisher);
    publisher = v18->_publisher;
    v18->_publisher = v19;

    v21 = -[STUSignInHistoryStorage history](v18, "history");
    -[STUSignInHistoryStorage subscribeForAccountChangeNotifications](v18, "subscribeForAccountChangeNotifications");
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[STUSignInHistoryStorage cancelHistoryOwnerRecheckTimer](self, "cancelHistoryOwnerRecheckTimer");
  v3.receiver = self;
  v3.super_class = (Class)STUSignInHistoryStorage;
  -[STUSignInHistoryStorage dealloc](&v3, "dealloc");
}

- (id)history
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage loadHistory](self, "loadHistory"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage validateHistoryAndRemoveIfNeeded:](self, "validateHistoryAndRemoveIfNeeded:", v3));
  else
    v4 = 0;

  return v4;
}

- (id)appendItem:(id)a3
{
  id v4;
  void *v5;
  STUSignInHistoryRecord *v6;
  void *v7;
  STUSignInHistoryRecord *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  STUSignInHistoryRecord *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage history](self, "history"));
  v6 = (STUSignInHistoryRecord *)objc_msgSend(v5, "copy");
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage accountPrimitives](self, "accountPrimitives"));
    v6 = (STUSignInHistoryRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryAppleID"));

    if (!v6 || !-[STUSignInHistoryRecord length](v6, "length"))
    {
      v13 = 0;
      goto LABEL_13;
    }
    v8 = -[STUSignInHistoryRecord initWithOwner:]([STUSignInHistoryRecord alloc], "initWithOwner:", v6);

    v6 = v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryRecord items](v6, "items"));
  v10 = objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "addObject:", v4);
  while (1)
  {
    v11 = objc_msgSend(v10, "count");
    if (v11 <= (id)-[STUSignInHistoryStorage limit](self, "limit"))
      break;
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
    -[STUSignInHistoryRecord setTruncated:](v6, "setTruncated:", 1);
  }
  -[STUSignInHistoryRecord setItems:](v6, "setItems:", v10);
  if (-[STUSignInHistoryStorage saveHistory:](self, "saveHistory:", v6))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "postNotificationName:object:", CRKMAIDSignInHistoryDidChangeNotificationName, 0);

    v13 = v6;
  }
  else
  {
    v13 = 0;
  }

LABEL_13:
  return v13;
}

- (id)removeItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSMutableIndexSet *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage history](self, "history"));
  if (objc_msgSend(v4, "count") && v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
    v7 = objc_msgSend(v6, "mutableCopy");

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
    v9 = objc_opt_new(NSMutableIndexSet);
    if (objc_msgSend(v7, "count"))
    {
      v10 = 0;
      do
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v13 = objc_msgSend(v8, "containsObject:", v12);

        if (v13)
          -[NSMutableIndexSet addIndex:](v9, "addIndex:", v10);

        ++v10;
      }
      while (v10 < (unint64_t)objc_msgSend(v7, "count"));
    }
    if (-[NSMutableIndexSet count](v9, "count"))
    {
      objc_msgSend(v7, "removeObjectsAtIndexes:", v9);
      if (!objc_msgSend(v7, "count"))
        objc_msgSend(v5, "setTruncated:", 0);
      objc_msgSend(v5, "setItems:", v7);
      if (!-[STUSignInHistoryStorage saveHistory:](self, "saveHistory:", v5))
      {
        v15 = 0;
        goto LABEL_16;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v14, "postNotificationName:object:", CRKMAIDSignInHistoryDidChangeNotificationName, 0);

    }
    v15 = v5;
LABEL_16:

    goto LABEL_17;
  }
  v15 = v5;
LABEL_17:

  return v15;
}

- (unint64_t)removeAll
{
  void *v3;
  void *v4;
  id v5;
  unsigned int v6;
  unint64_t result;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage history](self, "history"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  v5 = objc_msgSend(v4, "count");

  v6 = -[STUSignInHistoryStorage removeHistoryFile](self, "removeHistoryFile");
  result = 0;
  if (v6)
  {
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "postNotificationName:object:", CRKMAIDSignInHistoryDidChangeNotificationName, 0);

      return (unint64_t)v5;
    }
  }
  return result;
}

- (id)loadHistory
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  STUSignInHistoryRecord *v13;
  id v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  id v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage fileSystemPrimitives](self, "fileSystemPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager signInHistoryPlistURL](NSFileManager, "signInHistoryPlistURL"));
  v5 = objc_msgSend(v3, "fileExistsAtURL:", v4);

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage fileSystemPrimitives](self, "fileSystemPrimitives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager signInHistoryPlistURL](NSFileManager, "signInHistoryPlistURL"));
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataWithContentsOfURL:error:", v7, &v22));
  v9 = v22;

  if (!v8)
  {
    v15 = sub_10006A780();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    v16 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v16)
        sub_10007DBEC(v9);

      v13 = 0;
      v11 = v9;
    }
    else
    {
      if (v16)
        sub_10007DBC0();
      v13 = 0;
    }
    goto LABEL_23;
  }
  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v8, 0, 0, &v21));
  v11 = v21;

  if (!v10)
  {
    v17 = sub_10006A780();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v19)
        sub_10007DC90(v11);
    }
    else if (v19)
    {
      sub_10007DC64();
    }
    goto LABEL_21;
  }
  v12 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0)
  {
    v20 = sub_10006A780();
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10007DD08();
LABEL_21:

    v13 = 0;
    goto LABEL_22;
  }
  v13 = -[STUSignInHistoryRecord initWithDictionary:]([STUSignInHistoryRecord alloc], "initWithDictionary:", v10);
LABEL_22:

LABEL_23:
  return v13;
}

- (BOOL)saveHistory:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  _BOOL4 v16;
  id v18;
  id v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dictionaryValue"));
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v19));
  v6 = v19;
  if (!v5)
  {
    v12 = sub_10006A780();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v14)
        sub_10007DD60(v6);
      goto LABEL_16;
    }
    if (v14)
      sub_10007DD34();
    goto LABEL_15;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage fileSystemPrimitives](self, "fileSystemPrimitives"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager signInHistoryPlistURL](NSFileManager, "signInHistoryPlistURL"));
  v18 = v6;
  v9 = objc_msgSend(v7, "writeData:toURL:options:error:", v5, v8, 0, &v18);
  v10 = v18;

  if ((v9 & 1) == 0)
  {
    v15 = sub_10006A780();
    v13 = objc_claimAutoreleasedReturnValue(v15);
    v16 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v16)
        sub_10007DE04(v10);
      v6 = v10;
      goto LABEL_16;
    }
    if (v16)
      sub_10007DDD8();
LABEL_15:
    v6 = 0;
LABEL_16:

    v11 = 0;
    v10 = v6;
    goto LABEL_17;
  }
  v11 = 1;
LABEL_17:

  return v11;
}

- (id)validateHistoryAndRemoveIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage accountPrimitives](self, "accountPrimitives"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryAppleID"));

  if (v6)
  {
    -[STUSignInHistoryStorage cancelHistoryOwnerRecheckTimer](self, "cancelHistoryOwnerRecheckTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ownerAppleID"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ownerAppleID"));
      v9 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v9 & 1) == 0)
      {
        v10 = sub_10006A780();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_10007DED4();
LABEL_13:

        -[STUSignInHistoryStorage removeHistoryFile](self, "removeHistoryFile");
        v14 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      if (objc_msgSend(v4, "historyVersion"))
      {
        v15 = sub_10006A780();
        v11 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_10007DEA8();
        goto LABEL_13;
      }
      objc_msgSend(v4, "setOwnerAppleID:", v6);
      objc_msgSend(v4, "setHistoryVersion:", 1);
      -[STUSignInHistoryStorage saveHistory:](self, "saveHistory:", v4);
    }
  }
  else
  {
    v12 = sub_10006A780();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10007DE7C();

    -[STUSignInHistoryStorage scheduleHistoryOwnerRecheckTimerIfNeeded](self, "scheduleHistoryOwnerRecheckTimerIfNeeded");
  }
  v14 = v4;
LABEL_14:

  return v14;
}

- (BOOL)removeHistoryFile
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage fileSystemPrimitives](self, "fileSystemPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager signInHistoryPlistURL](NSFileManager, "signInHistoryPlistURL"));
  v5 = objc_msgSend(v3, "fileExistsAtURL:", v4);

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage fileSystemPrimitives](self, "fileSystemPrimitives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager signInHistoryPlistURL](NSFileManager, "signInHistoryPlistURL"));
  v14 = 0;
  v8 = objc_msgSend(v6, "removeItemAtURL:error:", v7, &v14);
  v9 = v14;

  if ((v8 & 1) == 0)
  {
    v10 = sub_10006A780();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v12)
        sub_10007DF2C(v9);
    }
    else if (v12)
    {
      sub_10007DF00();
    }

  }
  return v8;
}

- (void)scheduleHistoryOwnerRecheckTimerIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage recheckHistoryOwnerTimer](self, "recheckHistoryOwnerTimer"));

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage timerPrimitives](self, "timerPrimitives"));
    v5 = objc_msgSend((id)objc_opt_class(self), "ownerRecheckTimerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[STUSignInHistoryStorage ownerRecheckInterval](self, "ownerRecheckInterval");
    v8 = v7;
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10006AD40;
    v15 = &unk_1000C9F38;
    objc_copyWeak(&v16, &location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduleTimerWithIdentifier:timeInterval:fireHandler:", v6, &v12, v8));
    -[STUSignInHistoryStorage setRecheckHistoryOwnerTimer:](self, "setRecheckHistoryOwnerTimer:", v9, v12, v13, v14, v15);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage transactionPrimitives](self, "transactionPrimitives"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transactionWithReverseDNSReason:", CFSTR("com.apple.studentd.recheckHistoryOwner")));
    -[STUSignInHistoryStorage setRecheckHistoryOwnerTransaction:](self, "setRecheckHistoryOwnerTransaction:", v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)historyOwnerRecheckTimerAction
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage accountPrimitives](self, "accountPrimitives"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryAppleID"));

  if (!v4)
    -[STUSignInHistoryStorage removeHistoryFile](self, "removeHistoryFile");
  -[STUSignInHistoryStorage cancelHistoryOwnerRecheckTimer](self, "cancelHistoryOwnerRecheckTimer");

}

- (void)cancelHistoryOwnerRecheckTimer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage recheckHistoryOwnerTimer](self, "recheckHistoryOwnerTimer"));
  objc_msgSend(v3, "cancel");

  -[STUSignInHistoryStorage setRecheckHistoryOwnerTimer:](self, "setRecheckHistoryOwnerTimer:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage recheckHistoryOwnerTransaction](self, "recheckHistoryOwnerTransaction"));
  objc_msgSend(v4, "cancel");

  -[STUSignInHistoryStorage setRecheckHistoryOwnerTransaction:](self, "setRecheckHistoryOwnerTransaction:", 0);
}

- (void)subscribeForAccountChangeNotifications
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryStorage publisher](self, "publisher"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006AEBC;
  v5[3] = &unk_1000C97E8;
  v5[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscribeToNotificationWithName:handler:", ACDAccountStoreDidChangeNotification, v5));
  -[STUSignInHistoryStorage setAccountChangeSubscription:](self, "setAccountChangeSubscription:", v4);

}

+ (id)ownerRecheckTimerIdentifier
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class(a1);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-ownerRecheckTimerIdentifier"), v4));

  return v5;
}

- (CRKFileSystemPrimitives)fileSystemPrimitives
{
  return self->_fileSystemPrimitives;
}

- (STUAccountsPrimitives)accountPrimitives
{
  return self->_accountPrimitives;
}

- (CRKOSTransactionPrimitives)transactionPrimitives
{
  return self->_transactionPrimitives;
}

- (CRKTimerPrimitives)timerPrimitives
{
  return self->_timerPrimitives;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (CRKConcreteDarwinNotificationPublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (CRKCancelable)accountChangeSubscription
{
  return self->_accountChangeSubscription;
}

- (void)setAccountChangeSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangeSubscription, a3);
}

- (CRKCancelable)recheckHistoryOwnerTimer
{
  return self->_recheckHistoryOwnerTimer;
}

- (void)setRecheckHistoryOwnerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_recheckHistoryOwnerTimer, a3);
}

- (CRKCancelable)recheckHistoryOwnerTransaction
{
  return self->_recheckHistoryOwnerTransaction;
}

- (void)setRecheckHistoryOwnerTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_recheckHistoryOwnerTransaction, a3);
}

- (double)ownerRecheckInterval
{
  return self->_ownerRecheckInterval;
}

- (void)setOwnerRecheckInterval:(double)a3
{
  self->_ownerRecheckInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recheckHistoryOwnerTransaction, 0);
  objc_storeStrong((id *)&self->_recheckHistoryOwnerTimer, 0);
  objc_storeStrong((id *)&self->_accountChangeSubscription, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_timerPrimitives, 0);
  objc_storeStrong((id *)&self->_transactionPrimitives, 0);
  objc_storeStrong((id *)&self->_accountPrimitives, 0);
  objc_storeStrong((id *)&self->_fileSystemPrimitives, 0);
}

@end
