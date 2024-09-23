@implementation FMFCommandManager

- (double)lastSuccessfulResponseTimestamp
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager serverInteractionController](self, "serverInteractionController"));
  objc_msgSend(v2, "lastSuccessfulResponseTimestamp");
  v4 = v3;

  return v4;
}

- (BOOL)isIn5XXGracePeriod
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v15;
  NSObject *v16;
  int v17;
  double v18;
  __int16 v19;
  double v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager latest5XXTS](self, "latest5XXTS"));

  if (!v3)
  {
    v15 = sub_100011D0C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "isIn5XXGracePeriod: NO not in grace period due to self.latest5XXTS == nil", (uint8_t *)&v17, 2u);
    }

    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager latest5XXTS](self, "latest5XXTS"));

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager latest5XXTS](self, "latest5XXTS"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  -[FMFCommandManager graceInterval5XXInSec](self, "graceInterval5XXInSec");
  v10 = v9;
  v11 = sub_100011D0C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8 >= v10)
  {
    if (v13)
    {
      v17 = 134218240;
      v18 = v8;
      v19 = 2048;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "isIn5XXGracePeriod: NOLONGER in grace period intervalSinceLast5XX(%f) graceInterval5XXInSec(%f)", (uint8_t *)&v17, 0x16u);
    }

    -[FMFCommandManager setLatest5XXTS:](self, "setLatest5XXTS:", 0);
    return 0;
  }
  if (v13)
  {
    v17 = 134218240;
    v18 = v8;
    v19 = 2048;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "isIn5XXGracePeriod: YES in grace period intervalSinceLast5XX(%f) graceInterval5XXInSec(%f)", (uint8_t *)&v17, 0x16u);
  }

  return 1;
}

- (void)setCommandServerContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMFCommandManager serverContextQueue](self, "serverContextQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001414C;
  block[3] = &unk_100099348;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)exit5XXGracePeriod
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "exit5XXGracePeriod: Exiting 5XX grace period", v5, 2u);
  }

  -[FMFCommandManager setLatest5XXTS:](self, "setLatest5XXTS:", 0);
}

- (void)refreshDueToTapWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v7 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  objc_msgSend(v5, "updateTapMessagesCache:", v6);
  -[FMFCommandManager _refreshForSession:withReason:withCompletion:](self, "_refreshForSession:withReason:withCompletion:", 0, 0, 0);
}

- (id)stringForReasonCode:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager enumToStringMap](self, "enumToStringMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));

  return v5;
}

- (NSArray)enumToStringMap
{
  return self->_enumToStringMap;
}

- (NSDictionary)_serverContext
{
  return self->__serverContext;
}

- (void)sendCommand:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isUserAction"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    if (objc_msgSend(v8, "isAccountAuthorized"))
    {
LABEL_7:

      goto LABEL_8;
    }
    v9 = -[FMFCommandManager hasModelInitialized](self, "hasModelInitialized");

    if ((v9 & 1) == 0)
    {
      v10 = sub_100011D0C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User action initiated in model not initialized state and 401 unauthorized state. Resetting 401 state to allow init and user action attempt.", buf, 2u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
      objc_msgSend(v8, "setAccountStateAuthorizedDueTo401");
      goto LABEL_7;
    }
  }
LABEL_8:
  v12 = objc_opt_class(FMFInitCommand);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0
    || -[FMFCommandManager hasModelInitialized](self, "hasModelInitialized"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager serverInteractionController](self, "serverInteractionController"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001413C;
    v18[3] = &unk_10009AB30;
    v19 = v6;
    v20 = v7;
    v14 = v7;
    objc_msgSend(v13, "sendCommand:completionBlock:", v6, v18);

    v15 = v20;
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10004213C;
    v21[3] = &unk_10009AB58;
    v21[4] = self;
    v22 = v6;
    v23 = v7;
    v16 = v7;
    v17 = v6;
    -[FMFCommandManager refreshForSession:withReason:withCompletion:](self, "refreshForSession:withReason:withCompletion:", 0, 1, v21);

    v15 = v22;
  }

}

- (void)saveNotificationToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSMutableArray *v21;
  id v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[8];
  _BYTE v29[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager _serverContext](self, "_serverContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", off_1000B3018));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v4 == v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager _serverContext](self, "_serverContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", off_1000B3018));

  }
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Saving notification token", buf, 2u);
  }

  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", off_1000B3018));
    v12 = (NSMutableArray *)objc_msgSend(v11, "mutableCopy");

    if (!v12)
      v12 = objc_opt_new(NSMutableArray);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v12;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v17), "isEqualToString:", v7, (_QWORD)v24))
          {
            v22 = sub_100011D0C();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Token already saved", buf, 2u);
            }

            v21 = v13;
            goto LABEL_25;
          }
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v15)
          continue;
        break;
      }
    }

    -[NSMutableArray addObject:](v13, "addObject:", v7);
    if ((unint64_t)-[NSMutableArray count](v13, "count") >= 3)
      -[NSMutableArray removeObjectAtIndex:](v13, "removeObjectAtIndex:", 0);
    v18 = sub_100011D0C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Storing updated notification token", buf, 2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v20, "setObject:forKey:", v13, off_1000B3018);

    v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[NSMutableArray synchronize](v21, "synchronize");
LABEL_25:

  }
}

- (void)_refreshForSession:(id)a3 withReason:(int64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  FMFCommandManager *v10;
  void *v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  NSDate *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;

  v8 = a3;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v12 = objc_msgSend(v11, "hasCredentials");

  if ((v12 & 1) != 0)
  {
    v13 = -[FMFCommandManager hasModelInitialized](v10, "hasModelInitialized");
    if (a4 == 13)
      v14 = 0;
    else
      v14 = v13;
    if ((v14 & 1) != 0)
    {
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue(+[FMFCommandCoalescer sharedInstance](FMFCommandCoalescer, "sharedInstance"));
      -[NSDate refreshLocationForHandles:forSession:callerId:priority:reason:completionBlock:](v15, "refreshLocationForHandles:forSession:callerId:priority:reason:completionBlock:", 0, v8, 0, a4 == 4, a4, v9);
    }
    else
    {
      v15 = objc_opt_new(NSDate);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager lastRefreshDate](v10, "lastRefreshDate"));
      if (!v17
        || (-[NSDate timeIntervalSince1970](v15, "timeIntervalSince1970"),
            v19 = v18,
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager lastRefreshDate](v10, "lastRefreshDate")),
            objc_msgSend(v20, "timeIntervalSince1970"),
            v22 = v19 - v21,
            v20,
            v17,
            v22 > 0.5)
        || a4 == 13)
      {
        -[FMFCommandManager setLastRefreshDate:](v10, "setLastRefreshDate:", v15);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100041E68;
        v24[3] = &unk_10009A080;
        v24[4] = v10;
        v26 = v9;
        v25 = v8;
        -[FMFCommandManager _sendInitForSession:withCompletion:](v10, "_sendInitForSession:withCompletion:", v25, v24);

      }
      else if (v9)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1015, 0));
        (*((void (**)(id, void *))v9 + 2))(v9, v23);

      }
    }

  }
  else if (v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1000, 0));
    (*((void (**)(id, void *))v9 + 2))(v9, v16);

  }
  objc_sync_exit(v10);

}

- (NSDictionary)commandServerContext
{
  NSObject *v3;
  id v4;
  _QWORD block[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100046660;
  v13 = sub_100046670;
  v14 = 0;
  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMFCommandManager serverContextQueue](self, "serverContextQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007C18;
  block[3] = &unk_10009AC38;
  block[4] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(v3, block);

  v4 = objc_msgSend((id)v10[5], "copy");
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v4;
}

- (OS_dispatch_queue)serverContextQueue
{
  return self->_serverContextQueue;
}

+ (id)sharedInstance
{
  if (qword_1000B3858 != -1)
    dispatch_once(&qword_1000B3858, &stru_10009AAE0);
  return (id)qword_1000B3850;
}

- (void)set_serverContext:(id)a3
{
  objc_storeStrong((id *)&self->__serverContext, a3);
}

- (void)setLatest5XXTS:(id)a3
{
  objc_storeStrong((id *)&self->_latest5XXTS, a3);
}

- (void)setCommandDataContext:(id)a3
{
  objc_storeStrong((id *)&self->_commandDataContext, a3);
}

- (FMFServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (NSDate)latest5XXTS
{
  return self->_latest5XXTS;
}

- (BOOL)hasModelInitialized
{
  return self->_hasModelInitialized;
}

- (NSDictionary)commandDataContext
{
  return self->_commandDataContext;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[FMFCommandManager setRegistrationRetries:](self, "setRegistrationRetries:", 0);
  v4.receiver = self;
  v4.super_class = (Class)FMFCommandManager;
  -[FMFCommandManager dealloc](&v4, "dealloc");
}

- (void)accountWasRemoved
{
  -[FMFCommandManager setHasModelInitialized:](self, "setHasModelInitialized:", 0);
  -[FMFCommandManager setRegistrationRetries:](self, "setRegistrationRetries:", 0);
  -[FMFCommandManager setCachedRedirects:](self, "setCachedRedirects:", 0);
}

- (void)cloudKitRecordsChanged:(id)a3
{
  -[FMFCommandManager _refreshForSession:withReason:withCompletion:](self, "_refreshForSession:withReason:withCompletion:", 0, 13, 0);
}

- (BOOL)sendInitWithLazyCheckForSession:(id)a3 withReason:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = sub_100011D0C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sendInitWithLazyCheck:", buf, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMFLazyInitController sharedInstance](FMFLazyInitController, "sharedInstance"));
  v13 = objc_msgSend(v12, "allowInitForSessionCreation");

  if (v13)
  {
    -[FMFCommandManager initializeModelForSession:withReason:completion:](self, "initializeModelForSession:withReason:completion:", v8, a4, v9);
  }
  else
  {
    v14 = sub_100011D0C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Skipping init and refresh due to no user data", v17, 2u);
    }

    if (v9)
      v9[2](v9, 0);
  }

  return v13;
}

- (void)_scheduleRegistrationSanityCheck
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041694;
  block[3] = &unk_1000993C8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performDeviceRegistrationCheck:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance", a3));
  v5 = objc_msgSend(v4, "isThisDeviceRegistered");

  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "This device has already registered, no need for any more sanity check", v10, 2u);
    }

    -[FMFCommandManager setRegistrationRetries:](self, "setRegistrationRetries:", 0);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "This device has not registered, posting darwin notification", buf, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("FMFCurrentDeviceNotRegistered"), 0, 0, 0);
    -[FMFCommandManager setRegistrationRetries:](self, "setRegistrationRetries:", (char *)-[FMFCommandManager registrationRetries](self, "registrationRetries") + 1);
    -[FMFCommandManager _scheduleRegistrationSanityCheck](self, "_scheduleRegistrationSanityCheck");
  }
}

- (void)_sendInitForSession:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  FMFInitCommand *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "\n    ************************************************************************\n            Sending Init...\n    ************************************************************************", buf, 2u);
  }

  v10 = -[FMFBaseCmd initWithClientSession:]([FMFInitCommand alloc], "initWithClientSession:", v7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100041AE4;
  v12[3] = &unk_10009AB08;
  v13 = v6;
  v11 = v6;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v10, v12);

}

- (id)_filterLocatableHandles:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;

  v3 = a3;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "followingHandles"));
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    v26 = 2112;
    v27 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Currently following friends: %@, trying to locate: %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance", (_QWORD)v19));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "followingHandleForIdentifier:", v16));

        if (v17)
          objc_msgSend(v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)clearDataAndServerContext
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing data context and server context", v5, 2u);
  }

  -[FMFCommandManager setCommandDataContext:](self, "setCommandDataContext:", 0);
  -[FMFCommandManager setCommandServerContext:](self, "setCommandServerContext:", 0);
}

- (void)resetModelToUninitialized
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting model state to uninitialized", v5, 2u);
  }

  -[FMFCommandManager setHasModelInitialized:](self, "setHasModelInitialized:", 0);
}

- (void)checkHeartbeat
{
  -[FMFCommandManager _refreshForSession:withReason:withCompletion:](self, "_refreshForSession:withReason:withCompletion:", 0, 6, 0);
}

- (void)fetchLocationForHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSErrorUserInfoKey v24;
  const __CFString *v25;
  uint8_t buf[4];
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager _filterLocatableHandles:](self, "_filterLocatableHandles:", v12));
  if (objc_msgSend(v16, "count"))
  {
    v17 = 9;
    if (a6 != 2)
      v17 = 1;
    if (a6 == 1)
      v18 = 4;
    else
      v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandCoalescer sharedInstance](FMFCommandCoalescer, "sharedInstance"));
    objc_msgSend(v19, "refreshLocationForHandles:forSession:callerId:priority:reason:completionBlock:", v16, v13, v14, a6, v18, v15);

  }
  else
  {
    v20 = sub_100011D0C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Not following any of the handles in %@, nothing to locate", buf, 0xCu);
    }

    v22 = FMFErrorDomain;
    v24 = NSLocalizedDescriptionKey;
    v25 = CFSTR("Not following any of the passed handles");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, 101, v19));
    (*((void (**)(id, void *))v15 + 2))(v15, v23);

  }
}

- (void)getLocationForHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  id v10;
  id v11;
  FMFRefreshCommand *v12;
  id v13;
  NSObject *v14;
  void *v15;
  FMFRefreshCommand *v16;
  FMFRefreshCommand *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  NSObject *v30;
  _BOOL4 v31;
  FMFRefreshCommand *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *j;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  FMFCommandManager *v58;
  id v60;
  void *v61;
  FMFRefreshCommand *v62;
  id v63;
  _QWORD v64[4];
  FMFRefreshCommand *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  FMFRefreshCommand *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  uint64_t v81;
  _BYTE v82[128];

  v58 = self;
  v10 = a3;
  v11 = a4;
  v63 = a5;
  v60 = a7;
  v61 = v11;
  v62 = -[FMFBaseCmd initWithClientSession:]([FMFRefreshCommand alloc], "initWithClientSession:", v11);
  v12 = (FMFRefreshCommand *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = sub_100011D0C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v16 = (FMFRefreshCommand *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "followingHandles"));
    *(_DWORD *)buf = 138412546;
    v77 = v16;
    v78 = 2112;
    v79 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Currently following friends: %@, trying to locate: %@", buf, 0x16u);

  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v17 = (FMFRefreshCommand *)v10;
  v18 = -[FMFRefreshCommand countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v72 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance", v58));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "followingHandleForIdentifier:", v24));

        if (v25)
          -[FMFRefreshCommand addObject:](v12, "addObject:", v22);

      }
      v19 = -[FMFRefreshCommand countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    }
    while (v19);
  }

  v26 = sub_100011D0C();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v12;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Filtered friends list to locate: %@", buf, 0xCu);
  }

  v28 = -[FMFRefreshCommand count](v12, "count");
  v29 = sub_100011D0C();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  v32 = v62;
  if (v28)
  {
    if (v31)
    {
      *(_DWORD *)buf = 138412290;
      v77 = v12;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Sending locate for friends: %@", buf, 0xCu);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand allObjects](v12, "allObjects"));
    -[FMFRefreshCommand setSelectedHandles:](v62, "setSelectedHandles:", v33);

    -[FMFRefreshCommand setIsShallowLocate:](v62, "setIsShallowLocate:", a6 == 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "identifier"));
    -[FMFBaseCmd setCallerIdentifier:](v62, "setCallerIdentifier:", v34);

    v35 = sub_100011D0C();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 2;
      if (a6 == 2)
        v37 = 9;
      if (a6 == 1)
        v38 = 4;
      else
        v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand coalescedAppContexts](v62, "coalescedAppContexts", v58));
      *(_DWORD *)buf = 138412802;
      v77 = v62;
      v78 = 2112;
      v79 = v39;
      v80 = 2048;
      v81 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Updating refresh command(%@, contextApp:%@, reason:%lu), building contextApp info from interested sessions", buf, 0x20u);

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "clientSessions"));
    v42 = objc_msgSend(v41, "copy");

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v30 = v42;
    v44 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(_QWORD *)v68 != v46)
            objc_enumerationMutation(v30);
          v48 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)j);
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "handles", v58));
          v50 = -[FMFRefreshCommand intersectsSet:](v12, "intersectsSet:", v49);

          if (v50)
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "clientPid"));

            if (v51)
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "clientPid"));
              objc_msgSend(v43, "addObject:", v52);

            }
          }
        }
        v45 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      }
      while (v45);
    }

    v53 = v60;
    v32 = v62;
    if (objc_msgSend(v43, "count"))
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "allObjects"));
      -[FMFRefreshCommand setCoalescedAppContexts:](v62, "setCoalescedAppContexts:", v54);

      v55 = sub_100011D0C();
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand coalescedAppContexts](v62, "coalescedAppContexts"));
        *(_DWORD *)buf = 138412546;
        v77 = v62;
        v78 = 2112;
        v79 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Updated contextApp for command(%@): %@", buf, 0x16u);

      }
    }
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100042AA4;
    v64[3] = &unk_10009AB80;
    v66 = v60;
    v65 = v17;
    -[FMFCommandManager sendCommand:completionBlock:](v58, "sendCommand:completionBlock:", v62, v64);

  }
  else
  {
    v53 = v60;
    if (v31)
    {
      *(_DWORD *)buf = 138412290;
      v77 = v17;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Returning, no friend to locate in list: %@", buf, 0xCu);
    }
  }

}

- (void)setHideMyLocationEnabled:(BOOL)a3 forSession:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  FMFHideLocationCommand *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  v10 = -[FMFHideLocationCommand initWithHideLocation:forSession:]([FMFHideLocationCommand alloc], "initWithHideLocation:forSession:", v6, v9);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100042C34;
  v12[3] = &unk_10009AB08;
  v13 = v8;
  v11 = v8;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v10, v12);

}

- (void)setAllowFriendRequestsEnabled:(BOOL)a3 forSession:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  FMFAllowFriendRequestsCommand *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  v10 = -[FMFAllowFriendRequestsCommand initWithAllowFriendRequests:forSession:]([FMFAllowFriendRequestsCommand alloc], "initWithAllowFriendRequests:forSession:", v6, v9);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100042D44;
  v12[3] = &unk_10009AB08;
  v13 = v8;
  v11 = v8;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v10, v12);

}

- (void)setActiveDevice:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMFSavePrefsCommand *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[FMFSavePrefsCommand initWithClientSession:device:]([FMFSavePrefsCommand alloc], "initWithClientSession:device:", v9, v10);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100042E60;
  v13[3] = &unk_10009AB08;
  v14 = v8;
  v12 = v8;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v11, v13);

}

- (void)removeDevice:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMFRemoveDeviceCommand *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[FMFRemoveDeviceCommand initWithClientSession:device:]([FMFRemoveDeviceCommand alloc], "initWithClientSession:device:", v9, v10);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100042F7C;
  v13[3] = &unk_10009AB08;
  v14 = v8;
  v12 = v8;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v11, v13);

}

- (void)canOfferToHandles:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  FMFCheckReachabilityStatus *v19;
  id v20;
  id v21;
  FMFCommandManager *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v22 = self;
  v7 = a3;
  v23 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFIDSMessageController sharedInstance](FMFIDSMessageController, "sharedInstance", v22));
        objc_msgSend(v16, "updateIDSStatusForHandle:", v15);

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "idsStatus")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "qualifiedIdentifier"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  v19 = -[FMFCheckReachabilityStatus initWithClientSession:idsClientStatusMap:]([FMFCheckReachabilityStatus alloc], "initWithClientSession:idsClientStatusMap:", v23, v9);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000431EC;
  v24[3] = &unk_10009AB80;
  v25 = v10;
  v26 = v8;
  v20 = v10;
  v21 = v8;
  -[FMFCommandManager sendCommand:completionBlock:](v22, "sendCommand:completionBlock:", v19, v24);

}

- (void)sendFriendshipOfferRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  FMFOfferLocationCommand *v18;
  void *v19;
  void *v20;
  void *v21;
  FMFOfferLocationCommand *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(id, _QWORD, void *);
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v15 = objc_msgSend(v14, "hasCredentials");

  if ((v15 & 1) == 0)
  {
    v24 = sub_100011D0C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Not sending offer due to missing credentials", buf, 2u);
    }

    +[FMFDUserNotification notLoggedIntoiCloudAlert](FMFDUserNotification, "notLoggedIntoiCloudAlert");
    v26 = FMFErrorDomain;
    v27 = 1000;
    goto LABEL_9;
  }
  if (-[FMFCommandManager hasModelInitialized](self, "hasModelInitialized"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v17 = objc_msgSend(v16, "canAddFollower");

    if ((v17 & 1) == 0)
    {
      +[FMFDUserNotification showMaxFollowersLimitReachedAlert](FMFDUserNotification, "showMaxFollowersLimitReachedAlert");
      v26 = FMFErrorDomain;
      v27 = 104;
LABEL_9:
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, v27, 0));
      v13[2](v13, 0, v28);

      goto LABEL_10;
    }
  }
  v18 = [FMFOfferLocationCommand alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "toHandles"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupId"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
  v22 = -[FMFOfferLocationCommand initWithClientSession:handles:groupId:expiresDate:](v18, "initWithClientSession:handles:groupId:expiresDate:", v11, v19, v20, v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  -[FMFBaseCmd setCallerIdentifier:](v22, "setCallerIdentifier:", v23);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10004365C;
  v29[3] = &unk_10009ABA8;
  v30 = v10;
  v31 = v13;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v22, v29);

LABEL_10:
}

- (void)extendFriendshipOfferRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FMFExtendOfferCommand *v14;
  void *v15;
  void *v16;
  void *v17;
  FMFExtendOfferCommand *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [FMFExtendOfferCommand alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "toHandles"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "groupId"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));

  v18 = -[FMFExtendOfferCommand initWithClientSession:handles:groupId:expiresDate:](v14, "initWithClientSession:handles:groupId:expiresDate:", v12, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

  -[FMFBaseCmd setCallerIdentifier:](v18, "setCallerIdentifier:", v19);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000439D0;
  v21[3] = &unk_10009AB08;
  v22 = v10;
  v20 = v10;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v18, v21);

}

- (void)sendFriendshipInviteRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  FMFInviteCommand *v18;
  void *v19;
  void *v20;
  void *v21;
  FMFInviteCommand *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  void (**v30)(id, _QWORD, void *);
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v15 = objc_msgSend(v14, "hasCredentials");

  if ((v15 & 1) == 0)
  {
    v24 = sub_100011D0C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Not sending friendship invite request due to missing credentials", buf, 2u);
    }

    +[FMFDUserNotification notLoggedIntoiCloudAlert](FMFDUserNotification, "notLoggedIntoiCloudAlert");
    v26 = FMFErrorDomain;
    v27 = 1000;
    goto LABEL_9;
  }
  if (-[FMFCommandManager hasModelInitialized](self, "hasModelInitialized"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v17 = objc_msgSend(v16, "canAddFriend");

    if ((v17 & 1) == 0)
    {
      v26 = FMFErrorDomain;
      v27 = 103;
LABEL_9:
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, v27, 0));
      v13[2](v13, 0, v28);

      goto LABEL_10;
    }
  }
  v18 = [FMFInviteCommand alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "toHandles"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupId"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
  v22 = -[FMFInviteCommand initWithClientSession:handles:groupId:expiresDate:](v18, "initWithClientSession:handles:groupId:expiresDate:", v11, v19, v20, v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  -[FMFBaseCmd setCallerIdentifier:](v22, "setCallerIdentifier:", v23);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100043CA0;
  v29[3] = &unk_10009AB08;
  v30 = v13;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v22, v29);

LABEL_10:
}

- (void)sendNotNowRequest:(id)a3 forSession:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  FMFNotNowCommand *v16;
  void *v17;
  FMFNotNowCommand *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v15 = objc_msgSend(v14, "hasCredentials");

  if ((v15 & 1) != 0)
  {
    v16 = [FMFNotNowCommand alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "toHandles"));
    v18 = -[FMFNotNowCommand initWithClientSession:handles:](v16, "initWithClientSession:handles:", v11, v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    -[FMFBaseCmd setCallerIdentifier:](v18, "setCallerIdentifier:", v19);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100043EE8;
    v22[3] = &unk_10009AB08;
    v23 = v13;
    -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v18, v22);

  }
  else
  {
    v20 = sub_100011D0C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Not sending notNow request due to missing credentials", buf, 2u);
    }

    +[FMFDUserNotification notLoggedIntoiCloudAlert](FMFDUserNotification, "notLoggedIntoiCloudAlert");
    v18 = (FMFNotNowCommand *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1000, 0));
    (*((void (**)(id, _QWORD, FMFNotNowCommand *))v13 + 2))(v13, 0, v18);
  }

}

- (void)approveFriendshipRequest:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  FMFRespondToInviteCommand *v15;
  void *v16;
  FMFRespondToInviteCommand *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  void (**v25)(id, void *);
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v12 = objc_msgSend(v11, "hasCredentials");

  if ((v12 & 1) == 0)
  {
    v18 = sub_100011D0C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not approving friendship request due to missing credentials", buf, 2u);
    }

    +[FMFDUserNotification notLoggedIntoiCloudAlert](FMFDUserNotification, "notLoggedIntoiCloudAlert");
    v20 = FMFErrorDomain;
    v21 = 1000;
    goto LABEL_9;
  }
  if (-[FMFCommandManager hasModelInitialized](self, "hasModelInitialized"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v14 = objc_msgSend(v13, "canAddFollower");

    if ((v14 & 1) == 0)
    {
      +[FMFDUserNotification showMaxFollowersLimitReachedAlert](FMFDUserNotification, "showMaxFollowersLimitReachedAlert");
      v20 = FMFErrorDomain;
      v21 = 104;
LABEL_9:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, v21, 0));
      v10[2](v10, v22);

      goto LABEL_10;
    }
  }
  v15 = [FMFRespondToInviteCommand alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestId"));
  v17 = -[FMFRespondToInviteCommand initWithClientSession:friendRequestId:accepted:](v15, "initWithClientSession:friendRequestId:accepted:", v9, v16, 1);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100044164;
  v23[3] = &unk_10009ABA8;
  v24 = v8;
  v25 = v10;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v17, v23);

LABEL_10:
}

- (void)declineFriendshipRequest:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMFRespondToInviteCommand *v11;
  void *v12;
  FMFRespondToInviteCommand *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = [FMFRespondToInviteCommand alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestId"));
  v13 = -[FMFRespondToInviteCommand initWithClientSession:friendRequestId:accepted:](v11, "initWithClientSession:friendRequestId:accepted:", v10, v12, 0);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000442EC;
  v16[3] = &unk_10009ABA8;
  v17 = v8;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v13, v16);

}

- (void)stopSharingMyLocationWithHandles:(id)a3 forSession:(id)a4 groupId:(id)a5 callerId:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FMFRemoveFollowerCommand *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[FMFRemoveFollowerCommand initWithClientSession:handles:groupId:]([FMFRemoveFollowerCommand alloc], "initWithClientSession:handles:groupId:", v15, v16, v14);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  -[FMFBaseCmd setCallerIdentifier:](v17, "setCallerIdentifier:", v18);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100044490;
  v20[3] = &unk_10009AB08;
  v21 = v12;
  v19 = v12;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v17, v20);

}

- (void)checkStatusForHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 forSession:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FMFStatusCommand *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[FMFStatusCommand initWithClientSession:handles:groupId:]([FMFStatusCommand alloc], "initWithClientSession:handles:groupId:", v13, v16, v15);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  -[FMFBaseCmd setCallerIdentifier:](v17, "setCallerIdentifier:", v18);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100044624;
  v20[3] = &unk_10009AB08;
  v21 = v12;
  v19 = v12;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v17, v20);

}

- (void)getPendingMappingPacketsForHandle:(id)a3 groupId:(id)a4 forSession:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FMFStatusCommand *v14;
  void *v15;
  FMFStatusCommand *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [FMFStatusCommand alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v13));

  v16 = -[FMFStatusCommand initWithClientSession:handles:groupId:](v14, "initWithClientSession:handles:groupId:", v11, v15, v12);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100044840;
  v18[3] = &unk_10009AB08;
  v19 = v10;
  v17 = v10;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v16, v18);

}

- (void)importMappingPacket:(id)a3 forSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  FMFImportCommand *v24;
  _QWORD v25[4];
  FMFImportCommand *v26;
  id v27;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v12 = objc_msgSend(v11, "hasCredentials");

  if ((v12 & 1) != 0)
  {
    if (-[FMFCommandManager hasModelInitialized](self, "hasModelInitialized")
      && (v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance")),
          v14 = objc_msgSend(v13, "canAddFriend"),
          v13,
          (v14 & 1) == 0))
    {
      v19 = FMFErrorDomain;
      v20 = 103;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSystemInfo sharedInstance](FMFSystemInfo, "sharedInstance"));
      v16 = objc_msgSend(v15, "isAudioAccessory");

      if (!v16)
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100044B7C;
        v25[3] = &unk_10009AB80;
        v26 = -[FMFImportCommand initWithClientSession:mappingPacketToken:]([FMFImportCommand alloc], "initWithClientSession:mappingPacketToken:", v9, v8);
        v27 = v10;
        v24 = v26;
        -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v24, v25);

        goto LABEL_12;
      }
      v17 = sub_100011D0C();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not importing mapping packet on audio accessories", buf, 2u);
      }

      v19 = FMFErrorDomain;
      v20 = 205;
    }
  }
  else
  {
    v21 = sub_100011D0C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Not importing mapping packet due to missing credentials", buf, 2u);
    }

    v19 = FMFErrorDomain;
    v20 = 1000;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, v20, 0));
  (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v23);

LABEL_12:
}

- (void)invalidateMappingPackets:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  FMFRemoveFollowerCommand *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = -[FMFRemoveFollowerCommand initWithClientSession:handles:groupId:]([FMFRemoveFollowerCommand alloc], "initWithClientSession:handles:groupId:", 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  -[FMFRemoveFollowerCommand setPacketsToInvalidate:](v8, "setPacketsToInvalidate:", v9);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100044CE4;
  v12[3] = &unk_10009ABA8;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v8, v12);

}

- (NSDictionary)cachedRedirects
{
  NSDictionary *cachedRedirects;
  void *v4;

  cachedRedirects = self->_cachedRedirects;
  if (!cachedRedirects)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager cachedRedirectsFromDefaults](self, "cachedRedirectsFromDefaults"));
    -[FMFCommandManager setCachedRedirects:](self, "setCachedRedirects:", v4);

    cachedRedirects = self->_cachedRedirects;
  }
  return cachedRedirects;
}

- (void)setCachedRedirects:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRedirects, a3);
}

- (void)hostRedirected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FMFCommandManager *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMFCommandManager redirectsUpdaterQueue](self, "redirectsUpdaterQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044E5C;
  v7[3] = &unk_100099348;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)cachedRedirectsFromDefaults
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("kFMFHostRedirects")));

  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  v5 = v4;

  return v5;
}

- (void)updateRedirectsCache:(id)a3
{
  -[FMFCommandManager setCachedRedirects:](self, "setCachedRedirects:", a3);
  -[FMFCommandManager storeRedirectsToDefaults](self, "storeRedirectsToDefaults");
}

- (void)storeRedirectsToDefaults
{
  void *v3;
  id v4;
  NSObject *v5;
  NSDictionary *cachedRedirects;
  void *v7;
  int v8;
  NSDictionary *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setObject:forKey:", self->_cachedRedirects, CFSTR("kFMFHostRedirects"));

  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    cachedRedirects = self->_cachedRedirects;
    v8 = 138412290;
    v9 = cachedRedirects;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Storing updated redirects map: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "synchronize");

}

- (void)clearRedirectsCache
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMFCommandManager redirectsUpdaterQueue](self, "redirectsUpdaterQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004522C;
  block[3] = &unk_1000993C8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)showAlertFromServerResponse:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  FMFServerUserNotification *v37;
  BOOL v38;
  __CFString *v39;
  BOOL v40;
  __CFString *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  dispatch_time_t v50;
  void *v51;
  NSBundle *v52;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  id v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSBundle *v62;
  void *v63;
  void *v64;
  NSBundle *v65;
  void *v66;
  void *v67;
  void *v68;
  NSBundle *v69;
  void *v70;
  void *v71;
  NSBundle *v72;
  void *v73;
  void *v74;
  FMFServerUserNotification *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  FMFCommandManager *v80;
  id v81;
  void *v82;
  void *v83;
  uint64_t v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[5];
  _QWORD block[4];
  FMFServerUserNotification *v89;
  _QWORD v90[4];
  __CFString *v91;
  id v92;
  _QWORD v93[4];
  __CFString *v94;
  id v95;
  uint8_t buf[4];
  double v97;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v97 = *(double *)&v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Showing alert : %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v7 == v8)
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alertType")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v10 == v11)
    v12 = 0;
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alertType")));

  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v13 == v14)
      v15 = 0;
    else
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text")));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButtonTitle")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v18 == v19)
      v84 = 0;
    else
      v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButtonTitle")));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButtonURL")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v78 = v12;
    if (v20 == v21)
      v22 = 0;
    else
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButtonURL")));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButtonAction")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v23 == v24)
      v25 = 0;
    else
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButtonAction")));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelButtonTitle")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v26 == v27)
      v83 = 0;
    else
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelButtonTitle")));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelButtonURL")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v28 == v29)
      v30 = 0;
    else
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelButtonURL")));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelButtonAction")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v31 == v32)
      v33 = 0;
    else
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelButtonAction")));

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("delay")));
    objc_msgSend(v34, "doubleValue");
    v36 = v35;

    v37 = objc_alloc_init(FMFServerUserNotification);
    -[FMFServerUserNotification setCategory:](v37, "setCategory:", 4);
    -[FMFServerUserNotification setShowMessage:](v37, "setShowMessage:", 1);
    v79 = v9;
    -[FMFServerUserNotification setMsgTitle:](v37, "setMsgTitle:", v9);
    v81 = v15;
    -[FMFServerUserNotification setMsgText:](v37, "setMsgText:", v15);
    -[FMFServerUserNotification setShowMsgInLockScreen:](v37, "setShowMsgInLockScreen:", 0);
    -[FMFServerUserNotification setDismissMsgOnUnlock:](v37, "setDismissMsgOnUnlock:", 0);
    -[FMFServerUserNotification setDismissMsgOnLock:](v37, "setDismissMsgOnLock:", 0);
    -[FMFServerUserNotification setDefaultButtonTitle:](v37, "setDefaultButtonTitle:", v84);
    if (v22)
      v38 = v25 == 0;
    else
      v38 = 0;
    if (v38)
      v39 = CFSTR("open-url");
    else
      v39 = (__CFString *)v25;
    if (v30)
      v40 = v33 == 0;
    else
      v40 = 0;
    if (v40)
      v41 = CFSTR("open-url");
    else
      v41 = (__CFString *)v33;
    if (v39)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager alertActionInfoForAction:andURL:](self, "alertActionInfoForAction:andURL:", v39, v22));
      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472;
      v93[2] = sub_100045EAC;
      v93[3] = &unk_100099348;
      v94 = v39;
      v95 = v42;
      v43 = v42;
      -[FMFServerUserNotification setDefaultButtonAction:](v37, "setDefaultButtonAction:", v93);

    }
    -[FMFServerUserNotification setAlternateButtonTitle:](v37, "setAlternateButtonTitle:", v83);
    if (v41)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandManager alertActionInfoForAction:andURL:](self, "alertActionInfoForAction:andURL:", v41, v30));
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_100045F60;
      v90[3] = &unk_100099348;
      v91 = v41;
      v92 = v44;
      v45 = v44;
      -[FMFServerUserNotification setAlternateButtonAction:](v37, "setAlternateButtonAction:", v90);

    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerUserNotification defaultButtonTitle](v37, "defaultButtonTitle"));
    if (!v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerUserNotification alternateButtonTitle](v37, "alternateButtonTitle"));

      if (v47)
        goto LABEL_53;
      v52 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
      v46 = (void *)objc_claimAutoreleasedReturnValue(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10009B948, 0));
      -[FMFServerUserNotification setDefaultButtonTitle:](v37, "setDefaultButtonTitle:", v53);

    }
    v15 = v81;
LABEL_53:
    if (v36 <= 0.0)
    {
      -[FMFServerUserNotification activate](v37, "activate");
    }
    else
    {
      v48 = sub_100011D0C();
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v97 = v36;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Showing alert after %.2f seconds...", buf, 0xCu);
      }

      v50 = dispatch_time(0, (uint64_t)(v36 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100046014;
      block[3] = &unk_1000993C8;
      v89 = v37;
      dispatch_after(v50, (dispatch_queue_t)&_dispatch_main_q, block);

      v15 = v81;
    }

    goto LABEL_59;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("SAVEME")))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alertId")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v16 == v17)
      v15 = 0;
    else
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alertId")));

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stringForKey:", CFSTR("lastShownAlertId")));

    if (v15 && v51 && (objc_msgSend(v51, "isEqualToString:", v15) & 1) != 0)
      goto LABEL_61;
    v55 = +[FMFUtils locationServicesEnabled](FMFUtils, "locationServicesEnabled");
    v56 = sub_100011D0C();
    v22 = objc_claimAutoreleasedReturnValue(v56);
    v57 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if ((v55 & 1) == 0)
    {
      if (v57)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Location services is disabled. Not acking the alert", buf, 2u);
      }
      goto LABEL_60;
    }
    v80 = self;
    v82 = v15;
    v78 = v12;
    v79 = 0;
    if (v57)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Location services is enabled. Displaying the alert & acking it", buf, 2u);
    }
    v84 = (uint64_t)v51;

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "deviceSharingLocation"));

    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "deviceName"));
    v61 = objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ME_ALERT_EXISTING_TITLE")));
    v62 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    v77 = (void *)v61;
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", v61, &stru_10009B948, 0));

    v65 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    if (v60)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("ME_ALERT_EXISTING_MESSAGE_HAS_ME"), &stru_10009B948, 0));
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v67, v60));

    }
    else
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("ME_ALERT_EXISTING_MESSAGE_NO_ME"), &stru_10009B948, 0));
    }

    v69 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
    v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("ME_ALERT_NOT_NOW_BUTTON_TITLE"), &stru_10009B948, 0));

    v72 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
    v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("ME_ALERT_USE_BUTTON_TITLE"), &stru_10009B948, 0));

    v75 = objc_alloc_init(FMFServerUserNotification);
    -[FMFServerUserNotification setCategory:](v75, "setCategory:", 4);
    -[FMFServerUserNotification setShowMessage:](v75, "setShowMessage:", 1);
    -[FMFServerUserNotification setMsgTitle:](v75, "setMsgTitle:", v64);
    -[FMFServerUserNotification setMsgText:](v75, "setMsgText:", v68);
    -[FMFServerUserNotification setShowMsgInLockScreen:](v75, "setShowMsgInLockScreen:", 0);
    -[FMFServerUserNotification setDismissMsgOnUnlock:](v75, "setDismissMsgOnUnlock:", 0);
    -[FMFServerUserNotification setDismissMsgOnLock:](v75, "setDismissMsgOnLock:", 0);
    -[FMFServerUserNotification setAlternateButtonTitle:](v75, "setAlternateButtonTitle:", v71);
    -[FMFServerUserNotification setDefaultButtonTitle:](v75, "setDefaultButtonTitle:", v74);
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_10004601C;
    v87[3] = &unk_1000993C8;
    v87[4] = v80;
    -[FMFServerUserNotification setDefaultButtonAction:](v75, "setDefaultButtonAction:", v87);
    -[FMFServerUserNotification activate](v75, "activate");

    v15 = v82;
    if (!v82)
    {
      v12 = v78;
      v9 = 0;
      v51 = (void *)v84;
      goto LABEL_61;
    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v76, "setObject:forKey:", v82, CFSTR("lastShownAlertId"));

    v22 = -[FMFAlertAckCommand initWithAlertId:]([FMFAlertAckCommand alloc], "initWithAlertId:", v82);
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_1000461A0;
    v85[3] = &unk_10009AC10;
    v15 = v82;
    v86 = v15;
    -[FMFCommandManager sendCommand:completionBlock:](v80, "sendCommand:completionBlock:", v22, v85);

LABEL_59:
    v12 = v78;
    v9 = v79;
    v51 = (void *)v84;
LABEL_60:

LABEL_61:
  }

}

- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  unsigned int v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];

  v5 = a3;
  v6 = (__CFString *)a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("settings")))
  {

    v6 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE")));
    v19[0] = CFSTR("url");
    v19[1] = CFSTR("sensitive");
    v20[0] = v7;
    v20[1] = &__kCFBooleanTrue;
    v8 = v20;
    v9 = v19;
LABEL_10:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v9, 2));

    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("fmf-settings")))
  {

    v6 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/LOCATION_SHARING");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/LOCATION_SHARING")));
    v17[0] = CFSTR("url");
    v17[1] = CFSTR("sensitive");
    v18[0] = v7;
    v18[1] = &__kCFBooleanTrue;
    v8 = v18;
    v9 = v17;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("fmip-settings")))
  {

    v6 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/DEVICE_LOCATOR");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/DEVICE_LOCATOR")));
    v15[0] = CFSTR("url");
    v15[1] = CFSTR("sensitive");
    v16[0] = v7;
    v16[1] = &__kCFBooleanTrue;
    v8 = v16;
    v9 = v15;
    goto LABEL_10;
  }
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("open-url"));
  v11 = 0;
  if (v6 && v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v13[0] = CFSTR("url");
    v13[1] = CFSTR("sensitive");
    v14[0] = v7;
    v14[1] = &__kCFBooleanFalse;
    v8 = v14;
    v9 = v13;
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

- (void)enter5XXGracePeriod
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "enter5XXGracePeriod: Entering 5XX grace period", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[FMFCommandManager setLatest5XXTS:](self, "setLatest5XXTS:", v5);

}

- (double)graceInterval5XXInSec
{
  void *v2;
  double v3;
  double v4;
  id v5;
  NSObject *v6;
  int v8;
  double v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v2, "graceInterval5XXInSec");
  v4 = v3;

  if (v4 <= 0.0)
    v4 = 60.0;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "graceInterval5XXInSec: %f", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (void)updateFence:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  FMFUpdateGeoFenceCommand *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100011D0C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: updateFence: %@", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v14 = objc_msgSend(v13, "hasCredentials");

  if ((v14 & 1) != 0)
  {
    v15 = -[FMFUpdateGeoFenceCommand initWithClientSession:andFence:]([FMFUpdateGeoFenceCommand alloc], "initWithClientSession:andFence:", v9, v8);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100046854;
    v25[3] = &unk_10009AB08;
    v26 = v10;
    -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v15, v25);

  }
  else
  {
    v16 = sub_100011D0C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100064A84(v17, v18, v19, v20, v21, v22, v23, v24);

    +[FMFDUserNotification notLoggedIntoiCloudAlert](FMFDUserNotification, "notLoggedIntoiCloudAlert");
    v15 = (FMFUpdateGeoFenceCommand *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1000, 0));
    (*((void (**)(id, FMFUpdateGeoFenceCommand *))v10 + 2))(v10, v15);
  }

}

- (void)saveFavorites:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  FMFSaveFavoritesCommand *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100011D0C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: saveFavorites: %@", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v14 = objc_msgSend(v13, "hasCredentials");

  if ((v14 & 1) != 0)
  {
    v15 = -[FMFSaveFavoritesCommand initWithClientSession:andFavorites:]([FMFSaveFavoritesCommand alloc], "initWithClientSession:andFavorites:", v9, v8);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100046B84;
    v25[3] = &unk_10009AB08;
    v26 = v10;
    -[FMFCommandManager sendCommand:completionBlock:](self, "sendCommand:completionBlock:", v15, v25);

  }
  else
  {
    v16 = sub_100011D0C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100064AB8(v17, v18, v19, v20, v21, v22, v23, v24);

    +[FMFDUserNotification notLoggedIntoiCloudAlert](FMFDUserNotification, "notLoggedIntoiCloudAlert");
    v15 = (FMFSaveFavoritesCommand *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1000, 0));
    (*((void (**)(id, FMFSaveFavoritesCommand *))v10 + 2))(v10, v15);
  }

}

- (void)setHasModelInitialized:(BOOL)a3
{
  self->_hasModelInitialized = a3;
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_serverInteractionController, a3);
}

- (BOOL)isPendingRefresh
{
  return self->_isPendingRefresh;
}

- (void)setIsPendingRefresh:(BOOL)a3
{
  self->_isPendingRefresh = a3;
}

- (BOOL)isRefreshInProgress
{
  return self->_isRefreshInProgress;
}

- (void)setIsRefreshInProgress:(BOOL)a3
{
  self->_isRefreshInProgress = a3;
}

- (NSMutableSet)handlesToBeLocated
{
  return self->_handlesToBeLocated;
}

- (void)setHandlesToBeLocated:(id)a3
{
  objc_storeStrong((id *)&self->_handlesToBeLocated, a3);
}

- (void)setEnumToStringMap:(id)a3
{
  objc_storeStrong((id *)&self->_enumToStringMap, a3);
}

- (int64_t)preferredColeasedRefreshPriority
{
  return self->_preferredColeasedRefreshPriority;
}

- (void)setPreferredColeasedRefreshPriority:(int64_t)a3
{
  self->_preferredColeasedRefreshPriority = a3;
}

- (NSCountedSet)skippedRefreshReasons
{
  return self->_skippedRefreshReasons;
}

- (void)setSkippedRefreshReasons:(id)a3
{
  objc_storeStrong((id *)&self->_skippedRefreshReasons, a3);
}

- (NSTimer)registrationCheckTimer
{
  return self->_registrationCheckTimer;
}

- (void)setRegistrationCheckTimer:(id)a3
{
  objc_storeStrong((id *)&self->_registrationCheckTimer, a3);
}

- (int64_t)registrationRetries
{
  return self->_registrationRetries;
}

- (void)setRegistrationRetries:(int64_t)a3
{
  self->_registrationRetries = a3;
}

- (OS_dispatch_queue)redirectsUpdaterQueue
{
  return self->_redirectsUpdaterQueue;
}

- (void)setRedirectsUpdaterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_redirectsUpdaterQueue, a3);
}

- (void)setServerContextQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serverContextQueue, a3);
}

- (NSDate)lastRefreshDate
{
  return self->_lastRefreshDate;
}

- (void)setLastRefreshDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRefreshDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRefreshDate, 0);
  objc_storeStrong((id *)&self->__serverContext, 0);
  objc_storeStrong((id *)&self->_latest5XXTS, 0);
  objc_storeStrong((id *)&self->_serverContextQueue, 0);
  objc_storeStrong((id *)&self->_redirectsUpdaterQueue, 0);
  objc_storeStrong((id *)&self->_registrationCheckTimer, 0);
  objc_storeStrong((id *)&self->_skippedRefreshReasons, 0);
  objc_storeStrong((id *)&self->_enumToStringMap, 0);
  objc_storeStrong((id *)&self->_handlesToBeLocated, 0);
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
  objc_storeStrong((id *)&self->_commandDataContext, 0);
  objc_storeStrong((id *)&self->_cachedRedirects, 0);
}

@end
