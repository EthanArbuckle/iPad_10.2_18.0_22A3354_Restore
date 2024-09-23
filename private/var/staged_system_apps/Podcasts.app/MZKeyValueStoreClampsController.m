@implementation MZKeyValueStoreClampsController

- (MZKeyValueStoreClampsController)init
{
  MZKeyValueStoreClampsController *v2;
  NSDictionary *v3;
  NSDictionary *transactionClamps;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MZKeyValueStoreClampsController;
  v2 = -[MZKeyValueStoreClampsController init](&v8, "init");
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactionClamps = v2->_transactionClamps;
    v2->_transactionClamps = v3;

    v2->_nextUserCancelBackOffInterval = 300.0;
    v5 = dispatch_queue_create("com.apple.MZKeyValueStoreClampsController", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *transactionClamps;
  id v6;

  v4 = a3;
  transactionClamps = self->_transactionClamps;
  v6 = v4;
  if (transactionClamps)
  {
    objc_msgSend(v4, "encodeObject:forKey:", transactionClamps, CFSTR("MZTransactionClamps"));
    v4 = v6;
  }
  if (fabs(self->_dsidCheckTimestamp) > 2.22044605e-16)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MZDSIDCheckTimestamp"));
    v4 = v6;
  }
  if (fabs(self->_authenticationNeededTimestamp) > 2.22044605e-16)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MZAuthenticationNeededTimestamp"));
    v4 = v6;
  }
  if (fabs(self->_userAcceptedSyncTimestamp) > 2.22044605e-16)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MZUserAcceptedSyncTimestamp"));
    v4 = v6;
  }
  if (fabs(self->_networkingBlockedUntil) > 2.22044605e-16)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MZNetworkingBlockedUntil"));
    v4 = v6;
  }
  if (fabs(self->_userCancelledSignInBackOffUntil) > 2.22044605e-16)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MZUserCancelledSignInBackOffUntil"));
    v4 = v6;
  }

}

- (NSDictionary)transactionClamps
{
  return self->_transactionClamps;
}

- (MZKeyValueStoreClampsController)initWithCoder:(id)a3
{
  id v4;
  MZKeyValueStoreClampsController *v5;
  MZKeyValueStoreClampsController *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = -[MZKeyValueStoreClampsController init](self, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend((id)objc_opt_class(v5), "_classesForTransactionClampsValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MZTransactionClamps")));
    v10 = objc_msgSend(v9, "mutableCopy");

    if (v10)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000481D4;
      v17[3] = &unk_1004A7868;
      v18 = v10;
      -[MZKeyValueStoreClampsController accessTransactionClampsWithBlock:](v6, "accessTransactionClampsWithBlock:", v17);

    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MZDSIDCheckTimestamp"));
    v6->_dsidCheckTimestamp = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MZAuthenticationNeededTimestamp"));
    v6->_authenticationNeededTimestamp = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MZUserAcceptedSyncTimestamp"));
    v6->_userAcceptedSyncTimestamp = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MZNetworkingBlockedUntil"));
    v6->_networkingBlockedUntil = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MZUserCancelledSignInBackOffUntil"));
    v6->_userCancelledSignInBackOffUntil = v15;

  }
  return v6;
}

- (void)accessTransactionClampsWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreClampsController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C434;
  block[3] = &unk_1004A63C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)reset
{
  -[MZKeyValueStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", &stru_1004A78A8);
  -[MZKeyValueStoreClampsController clearDSIDCheckTimestamp](self, "clearDSIDCheckTimestamp");
  -[MZKeyValueStoreClampsController clearAuthenticationRequest](self, "clearAuthenticationRequest");
  -[MZKeyValueStoreClampsController clearBackOff](self, "clearBackOff");
  -[MZKeyValueStoreClampsController clearNetworkingBlocked](self, "clearNetworkingBlocked");
  -[MZKeyValueStoreClampsController clearUserAcceptedSyncTimestamp](self, "clearUserAcceptedSyncTimestamp");
  -[MZKeyValueStoreClampsController clearUserCancelledSignIn](self, "clearUserCancelledSignIn");
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)saveToUserDefaults
{
  NSObject *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreClampsController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029A90;
  block[3] = &unk_1004A6F38;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(v3, block);

  if (*((_BYTE *)v8 + 24))
  {
    v4 = dispatch_time(0, 2000000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10006E874;
    v5[3] = &unk_1004A6200;
    v5[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v5);
  }
  _Block_object_dispose(&v7, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setPendingUserDefaultArchivedData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSData)pendingUserDefaultArchivedData
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUserCancelledSignInBackOffUntil:(double)a3
{
  self->_userCancelledSignInBackOffUntil = a3;
}

- (void)setUserAcceptedSyncTimestamp:(double)a3
{
  self->_userAcceptedSyncTimestamp = a3;
}

- (void)setNetworkingBlockedUntil:(double)a3
{
  self->_networkingBlockedUntil = a3;
}

- (void)setDsidCheckTimestamp:(double)a3
{
  self->_dsidCheckTimestamp = a3;
}

- (void)setBackOffUntil:(double)a3
{
  self->_backOffUntil = a3;
}

- (void)setAuthenticationNeededTimestamp:(double)a3
{
  self->_authenticationNeededTimestamp = a3;
}

- (void)clearUserCancelledSignIn
{
  self->_nextUserCancelBackOffInterval = 300.0;
  -[MZKeyValueStoreClampsController setUserCancelledSignInBackOffUntil:](self, "setUserCancelledSignInBackOffUntil:", 0.0);
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearUserAcceptedSyncTimestamp
{
  -[MZKeyValueStoreClampsController setUserAcceptedSyncTimestamp:](self, "setUserAcceptedSyncTimestamp:", 0.0);
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearNetworkingBlocked
{
  -[MZKeyValueStoreClampsController setNetworkingBlockedUntil:](self, "setNetworkingBlockedUntil:", 0.0);
}

- (void)clearDSIDCheckTimestamp
{
  -[MZKeyValueStoreClampsController setDsidCheckTimestamp:](self, "setDsidCheckTimestamp:", 0.0);
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearBackOff
{
  -[MZKeyValueStoreClampsController setBackOffUntil:](self, "setBackOffUntil:", 0.0);
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearAuthenticationRequest
{
  -[MZKeyValueStoreClampsController setAuthenticationNeededTimestamp:](self, "setAuthenticationNeededTimestamp:", 0.0);
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

+ (id)sharedClampsController
{
  if (qword_100567308 != -1)
    dispatch_once(&qword_100567308, &stru_1004A7840);
  return (id)qword_100567310;
}

+ (id)_classesForTransactionClampsValues
{
  if (qword_100567320 != -1)
    dispatch_once(&qword_100567320, &stru_1004A78C8);
  return (id)qword_100567318;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", self->_dsidCheckTimestamp));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", self->_authenticationNeededTimestamp));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", self->_userAcceptedSyncTimestamp));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", self->_networkingBlockedUntil));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", self->_backOffUntil));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", self->_userCancelledSignInBackOffUntil));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p>\n                             Current Date = %@\n                             dsidCheckTimestamp = %@\n                             authenticationNeededTimestamp = %@\n                             userAcceptedSyncTimestamp = %@\n                             networkingBlockedUntil = %@\n                             backOffUntil= %@\n                             userCancelledSignInBackOffUntil = %@"), v5, self, v6, v7, v8, v9, v10, v11, v12));

  return v13;
}

- (BOOL)canScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[MZKeyValueStoreClampsController _canScheduleTransactionBasedOfNetworkingBlocked:error:](self, "_canScheduleTransactionBasedOfNetworkingBlocked:error:", v6, a4)&& -[MZKeyValueStoreClampsController _canScheduleTransactionBasedOnBackOff:error:](self, "_canScheduleTransactionBasedOnBackOff:error:", v6, a4)&& -[MZKeyValueStoreClampsController _canScheduleTransactionBasedOnUserCancelledSignIn:error:](self, "_canScheduleTransactionBasedOnUserCancelledSignIn:error:", v6, a4)&& -[MZKeyValueStoreClampsController _canScheduleTransactionBasedOnDSIDCheck:error:](self, "_canScheduleTransactionBasedOnDSIDCheck:error:", v6, a4))
  {
    v7 = -[MZKeyValueStoreClampsController _canScheduleTransactionBasedOnType:error:](self, "_canScheduleTransactionBasedOnType:error:", v6, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setTimestampForTransaction:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006EC10;
  v5[3] = &unk_1004A7868;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreClampsController _keyForTransaction:](self, "_keyForTransaction:", a3));
  v4 = v6;
  -[MZKeyValueStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", v5);

}

- (void)clearTimestampForTransaction:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006ECF8;
  v5[3] = &unk_1004A7868;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreClampsController _keyForTransaction:](self, "_keyForTransaction:", a3));
  v4 = v6;
  -[MZKeyValueStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", v5);
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");

}

- (void)setDSIDCheckTimestamp
{
  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  -[MZKeyValueStoreClampsController setDsidCheckTimestamp:](self, "setDsidCheckTimestamp:");
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)setAuthenticationRequest
{
  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  -[MZKeyValueStoreClampsController setAuthenticationNeededTimestamp:](self, "setAuthenticationNeededTimestamp:");
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (BOOL)hasAuthenticatedTooRecentlyForTransaction:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v6 = a3;
  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  v8 = v7;
  -[MZKeyValueStoreClampsController authenticationNeededTimestamp](self, "authenticationNeededTimestamp");
  v10 = v8 - v9;
  if (a4 && v10 < 1.0)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError userClampErrorWithTransaction:retrySeconds:underlyingError:](MZKeyValueStoreError, "userClampErrorWithTransaction:retrySeconds:underlyingError:", v6, 0, 1.0 - v10));

  return v10 < 1.0;
}

- (void)setUserAcceptedSyncTimestamp
{
  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  -[MZKeyValueStoreClampsController setUserAcceptedSyncTimestamp:](self, "setUserAcceptedSyncTimestamp:");
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (BOOL)hasUserRecentlyAcceptedSync
{
  double v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;

  -[MZKeyValueStoreClampsController userAcceptedSyncTimestamp](self, "userAcceptedSyncTimestamp");
  if (fabs(v3) > 2.22044605e-16
    && (-[MZKeyValueStoreClampsController _rightNow](self, "_rightNow"),
        v5 = v4,
        -[MZKeyValueStoreClampsController userAcceptedSyncTimestamp](self, "userAcceptedSyncTimestamp"),
        v5 - v6 <= 60.0))
  {
    v7 = 1;
  }
  else
  {
    -[MZKeyValueStoreClampsController setUserAcceptedSyncTimestamp:](self, "setUserAcceptedSyncTimestamp:", 0.0);
    v7 = 0;
  }
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
  return v7;
}

- (void)setUserCancelledSignIn
{
  double v3;
  void *v4;

  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  -[MZKeyValueStoreClampsController setUserCancelledSignInBackOffUntil:](self, "setUserCancelledSignInBackOffUntil:", v3 + self->_nextUserCancelBackOffInterval);
  self->_nextUserCancelBackOffInterval = fmin(self->_nextUserCancelBackOffInterval * 12.0, 18000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");

  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)backOffForTimeInterval:(double)a3
{
  double v5;

  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  -[MZKeyValueStoreClampsController setBackOffUntil:](self, "setBackOffUntil:", v5 + a3);
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)setNetworkingBlocked
{
  double v3;

  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  -[MZKeyValueStoreClampsController setNetworkingBlockedUntil:](self, "setNetworkingBlockedUntil:", v3 + 31536000.0);
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (BOOL)isNetworkingBlocked
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[MZKeyValueStoreClampsController networkingBlockedUntil](self, "networkingBlockedUntil");
  if (fabs(v3) > 2.22044605e-16)
  {
    -[MZKeyValueStoreClampsController networkingBlockedUntil](self, "networkingBlockedUntil");
    v5 = v4;
    -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
    if (v5 > v6)
      return 1;
    -[MZKeyValueStoreClampsController clearNetworkingBlocked](self, "clearNetworkingBlocked");
  }
  return 0;
}

- (double)_rightNow
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (id)_keyForTransaction:(id)a3
{
  id v3;
  id v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "processor"));
  v6 = (objc_class *)objc_opt_class(v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keys"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d-%@-%lu"), v4, v8, objc_msgSend(v9, "count")));
  return v10;
}

- (BOOL)_canScheduleTransactionBasedOnType:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  BOOL v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100046614;
  v22 = sub_10004698C;
  v23 = 0;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10006F268;
  v15 = &unk_1004A78F0;
  v17 = &v18;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreClampsController _keyForTransaction:](self, "_keyForTransaction:", v6));
  v16 = v7;
  -[MZKeyValueStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", &v12);
  v8 = (void *)v19[5];
  if (!v8)
    goto LABEL_6;
  objc_msgSend(v8, "timeIntervalSinceNow", v12, v13, v14, v15);
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 > 5.0)
  {
    -[MZKeyValueStoreClampsController clearTimestampForTransaction:](self, "clearTimestampForTransaction:", v6);
LABEL_6:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError clientClampErrorWithTransaction:retrySeconds:underlyingError:](MZKeyValueStoreError, "clientClampErrorWithTransaction:retrySeconds:underlyingError:", v6, 0, 5.0 - v9));
LABEL_9:

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (BOOL)_canScheduleTransactionBasedOfNetworkingBlocked:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;

  v6 = a3;
  v7 = -[MZKeyValueStoreClampsController isNetworkingBlocked](self, "isNetworkingBlocked");
  if (v7)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError networkingBlockedErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "networkingBlockedErrorWithTransaction:underlyingError:", v6, 0));

  return v7 ^ 1;
}

- (BOOL)_canScheduleTransactionBasedOnDSIDCheck:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  -[MZKeyValueStoreClampsController dsidCheckTimestamp](self, "dsidCheckTimestamp");
  v8 = v7;
  if (a4 && v7 != 0.0)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError userClampErrorWithTransaction:retrySeconds:underlyingError:](MZKeyValueStoreError, "userClampErrorWithTransaction:retrySeconds:underlyingError:", v6, 0, 0.0));

  return v8 == 0.0;
}

- (BOOL)_canScheduleTransactionBasedOnBackOff:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v13;

  v6 = a3;
  -[MZKeyValueStoreClampsController backOffUntil](self, "backOffUntil");
  if (fabs(v7) <= 2.22044605e-16)
    goto LABEL_4;
  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  v9 = v8;
  -[MZKeyValueStoreClampsController backOffUntil](self, "backOffUntil");
  if (v9 > v10)
  {
    -[MZKeyValueStoreClampsController clearBackOff](self, "clearBackOff");
LABEL_4:
    v11 = 1;
    goto LABEL_5;
  }
  -[MZKeyValueStoreClampsController backOffUntil](self, "backOffUntil");
  v11 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError serverClampErrorWithTransaction:retrySeconds:underlyingError:](MZKeyValueStoreError, "serverClampErrorWithTransaction:retrySeconds:underlyingError:", v6, 0, v13 - v9));
LABEL_5:

  return v11;
}

- (BOOL)_canScheduleTransactionBasedOnUserCancelledSignIn:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v13;

  v6 = a3;
  -[MZKeyValueStoreClampsController userCancelledSignInBackOffUntil](self, "userCancelledSignInBackOffUntil");
  if (fabs(v7) <= 2.22044605e-16)
    goto LABEL_4;
  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  v9 = v8;
  -[MZKeyValueStoreClampsController userCancelledSignInBackOffUntil](self, "userCancelledSignInBackOffUntil");
  if (v9 > v10)
  {
    -[MZKeyValueStoreClampsController clearUserCancelledSignIn](self, "clearUserCancelledSignIn");
LABEL_4:
    v11 = 1;
    goto LABEL_5;
  }
  -[MZKeyValueStoreClampsController userAcceptedSyncTimestamp](self, "userAcceptedSyncTimestamp");
  v11 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError userClampErrorWithTransaction:retrySeconds:underlyingError:](MZKeyValueStoreError, "userClampErrorWithTransaction:retrySeconds:underlyingError:", v6, 0, v13 - v9));
LABEL_5:

  return v11;
}

- (void)setTransactionClamps:(id)a3
{
  objc_storeStrong((id *)&self->_transactionClamps, a3);
}

- (double)dsidCheckTimestamp
{
  return self->_dsidCheckTimestamp;
}

- (double)authenticationNeededTimestamp
{
  return self->_authenticationNeededTimestamp;
}

- (double)userAcceptedSyncTimestamp
{
  return self->_userAcceptedSyncTimestamp;
}

- (double)networkingBlockedUntil
{
  return self->_networkingBlockedUntil;
}

- (double)backOffUntil
{
  return self->_backOffUntil;
}

- (double)userCancelledSignInBackOffUntil
{
  return self->_userCancelledSignInBackOffUntil;
}

- (double)nextUserCancelBackOffInterval
{
  return self->_nextUserCancelBackOffInterval;
}

- (void)setNextUserCancelBackOffInterval:(double)a3
{
  self->_nextUserCancelBackOffInterval = a3;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingUserDefaultArchivedData, 0);
  objc_storeStrong((id *)&self->_transactionClamps, 0);
}

@end
