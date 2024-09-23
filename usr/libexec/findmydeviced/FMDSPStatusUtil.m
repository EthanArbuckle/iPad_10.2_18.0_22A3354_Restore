@implementation FMDSPStatusUtil

+ (id)sharedInstance
{
  if (qword_100306908 != -1)
    dispatch_once(&qword_100306908, &stru_1002C4DA8);
  return (id)qword_100306900;
}

- (FMDSPStatusUtil)init
{
  FMDSPStatusUtil *v2;
  void *v3;
  uint64_t v4;
  SPFMIPRegisterInfo *spFmipRegisterInfo;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  uint64_t v8;
  NSDictionary *rawStats;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FMDSPStatusUtil;
  v2 = -[FMDSPStatusUtil init](&v12, "init");
  if (v2)
  {
    v3 = (void *)objc_opt_new(SPOwnerInterface);
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fmipRegisterInfo"));
    spFmipRegisterInfo = v2->_spFmipRegisterInfo;
    v2->_spFmipRegisterInfo = (SPFMIPRegisterInfo *)v4;

    v6 = dispatch_queue_create("com.apple.icloud.spstats.queue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", off_100305910, kFMDNotBackedUpPrefDomain));
    rawStats = v2->_rawStats;
    v2->_rawStats = (NSDictionary *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "_userDidLogIn:", CFSTR("FMDUserLoggedInLocalNotification"), 0);

    if (!v2->_rawStats)
    {
      v2->_rawStats = (NSDictionary *)&__NSDictionary0__struct;

    }
  }
  return v2;
}

- (NSDate)beaconZoneCreationDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil rawStats](self, "rawStats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("beaconZoneCreationDate")));

  return (NSDate *)v3;
}

- (NSNumber)beaconZoneCreationErrorCode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil rawStats](self, "rawStats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("beaconZoneCreationErrorCode")));

  return (NSNumber *)v3;
}

- (NSDate)beaconLastKeyRollDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil rawStats](self, "rawStats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("beaconLastKeyRollDate")));

  return (NSDate *)v3;
}

- (NSString)octStatus
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil rawStats](self, "rawStats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("octStatus")));

  return (NSString *)v3;
}

- (NSString)octStatusError
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil rawStats](self, "rawStats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("octStatusError")));

  return (NSString *)v3;
}

- (NSString)mteStatus
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil rawStats](self, "rawStats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mteStatus")));

  return (NSString *)v3;
}

- (NSString)mteStatusError
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil rawStats](self, "rawStats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mteStatusError")));

  return (NSString *)v3;
}

- (void)cancelRefresh
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil serialQueue](self, "serialQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B1F58;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)clearCache
{
  -[FMDSPStatusUtil setRawStats:](self, "setRawStats:", &__NSDictionary0__struct);
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", off_100305910, kFMDNotBackedUpPrefDomain);
}

- (void)refreshBeaconStats
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil serialQueue](self, "serialQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B2094;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_serialQueue_refreshBeaconStats
{
  void *v3;
  uint64_t v4;
  double v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  _BOOL4 v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  dispatch_queue_global_t global_queue;
  NSObject *v39;
  id v40;
  NSObject *v41;
  void *v42;
  _QWORD block[4];
  NSObject *v44;
  _QWORD v45[4];
  id v46;
  id location;
  uint8_t buf[4];
  uint64_t v49;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil timer](self, "timer"));
  objc_msgSend(v3, "cancel");

  v4 = (uint64_t)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("SPStatusRecheckInterval"), kFMDNotBackedUpPrefDomain);
  if (v4 >= 1)
    v5 = (double)v4;
  else
    v5 = 1800.0;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v49 = (uint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting timer to refresh beacon stats in %ld seconds", buf, 0xCu);
  }

  v8 = objc_alloc((Class)FMDispatchTimer);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil serialQueue](self, "serialQueue"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000B26AC;
  v45[3] = &unk_1002C1378;
  objc_copyWeak(&v46, &location);
  v10 = objc_msgSend(v8, "initWithQueue:timeout:completion:", v9, v45, v5);
  -[FMDSPStatusUtil setTimer:](self, "setTimer:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil timer](self, "timer"));
  objc_msgSend(v11, "start");

  if (MKBDeviceUnlockedSinceBoot(v12, v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil rawStats](self, "rawStats"));
    v15 = objc_msgSend(v14, "copy");

    v16 = -[NSObject mutableCopy](v15, "mutableCopy");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil spFmipRegisterInfo](self, "spFmipRegisterInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "beaconZoneCreationErrorCode"));
    objc_msgSend(v16, "fm_safelyMapKey:toObject:", CFSTR("beaconZoneCreationErrorCode"), v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil spFmipRegisterInfo](self, "spFmipRegisterInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "beaconZoneCreationDate"));
    objc_msgSend(v16, "fm_safelyMapKey:toObject:", CFSTR("beaconZoneCreationDate"), v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil spFmipRegisterInfo](self, "spFmipRegisterInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastKeyRollDate"));
    objc_msgSend(v16, "fm_safelyMapKey:toObject:", CFSTR("lastKeyRollDate"), v22);

    v23 = objc_msgSend(v16, "copy");
    -[FMDSPStatusUtil setRawStats:](self, "setRawStats:", v23);

    v24 = -[NSObject isEqualToDictionary:](v15, "isEqualToDictionary:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil rawStats](self, "rawStats"));
    +[FMPreferencesUtil setDictionary:forKey:inDomain:](FMPreferencesUtil, "setDictionary:forKey:inDomain:", v25, off_100305910, kFMDNotBackedUpPrefDomain);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil spFmipRegisterInfo](self, "spFmipRegisterInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "serviceState"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil beaconZoneCreationErrorCode](self, "beaconZoneCreationErrorCode"));
    if (v28)
    {

    }
    else if (v27 != (void *)SPServiceStateEnabled
           || (v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil beaconZoneCreationDate](self, "beaconZoneCreationDate")),
               v33 = v32 == 0,
               v32,
               !v33))
    {
      if ((v24 & 1) != 0)
      {
        v34 = sub_1000031B8();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Basic beacon stats do not show any failure. Server already has the latest stats.", buf, 2u);
        }
      }
      else
      {
        v36 = sub_1000031B8();
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Basic beacon stats do not show any failure. Sending the updated stats to the server", buf, 2u);
        }

        v35 = objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil statsChangeHandler](self, "statsChangeHandler"));
        if (v35)
        {
          global_queue = dispatch_get_global_queue(0, 0);
          v39 = objc_claimAutoreleasedReturnValue(global_queue);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000B26D8;
          block[3] = &unk_1002C2060;
          v35 = v35;
          v44 = v35;
          dispatch_async(v39, block);

        }
      }

      v40 = sub_1000031B8();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Canceling beacon stats refresh timer", buf, 2u);
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil timer](self, "timer"));
      objc_msgSend(v42, "cancel");

      -[FMDSPStatusUtil setTimer:](self, "setTimer:", 0);
      goto LABEL_26;
    }
    v29 = sub_1000031B8();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Basic beacon stats is reporting a failure. Fetching detailed stats", buf, 2u);
    }

    -[FMDSPStatusUtil _refreshDetailedStats:](self, "_refreshDetailedStats:", v24 ^ 1);
LABEL_26:

    goto LABEL_27;
  }
  v31 = sub_1000031B8();
  v15 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device not unlocked since boot. Will refresh beacon stats on next timer trigger.", buf, 2u);
  }
LABEL_27:

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
}

- (void)_refreshDetailedStats:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  FMDSPStatusUtil *v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  FMDSPStatusUtil *v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  BOOL v34;
  id location;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1000B2998;
  v38[4] = sub_1000B29A8;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_1000B2998;
  v36[4] = sub_1000B29A8;
  v37 = 0;
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil rawStats](self, "rawStats"));
  v7 = objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "mutableCopy");
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000B29B0;
  v27[3] = &unk_1002C4DD0;
  objc_copyWeak(&v33, &location);
  v31 = v38;
  v16 = v5;
  v28 = v16;
  v32 = v36;
  v9 = v8;
  v29 = v9;
  v10 = v7;
  v30 = v10;
  v34 = a3;
  v11 = objc_retainBlock(v27);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000B2BEC;
  v22[3] = &unk_1002C4DF8;
  v12 = v9;
  v26 = v38;
  v23 = v12;
  v24 = self;
  v13 = v11;
  v25 = v13;
  +[FMDOctStatusUtil fetchOctStatusWithCompletion:](FMDOctStatusUtil, "fetchOctStatusWithCompletion:", v22);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000B2CE0;
  v17[3] = &unk_1002C4DF8;
  v14 = v12;
  v21 = v36;
  v18 = v14;
  v19 = self;
  v15 = v13;
  v20 = v15;
  +[FMDMteStatusUtil fetchMteStatusWithCompletion:](FMDMteStatusUtil, "fetchMteStatusWithCompletion:", v17);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
}

- (void)_requestDetailedStatsFromUserAgent
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[FMDSPStatusUtil setWaitingForDetailedStats:](self, "setWaitingForDetailedStats:", 1);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.findmydeviced.fetch_spstats"), 0, 0, 1u);
}

- (void)updateDetailedSPStats:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSPStatusUtil serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B2EE4;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_userDidLogIn:(id)a3
{
  dispatch_time_t v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;

  if (-[FMDSPStatusUtil waitingForDetailedStats](self, "waitingForDetailedStats", a3))
  {
    v3 = dispatch_time(0, 5000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_after(v3, v5, &stru_1002C4E18);

  }
}

- (id)statsChangeHandler
{
  return self->_statsChangeHandler;
}

- (void)setStatsChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)rawStats
{
  return self->_rawStats;
}

- (void)setRawStats:(id)a3
{
  objc_storeStrong((id *)&self->_rawStats, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (SPFMIPRegisterInfo)spFmipRegisterInfo
{
  return self->_spFmipRegisterInfo;
}

- (void)setSpFmipRegisterInfo:(id)a3
{
  objc_storeStrong((id *)&self->_spFmipRegisterInfo, a3);
}

- (FMDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (BOOL)waitingForDetailedStats
{
  return self->_waitingForDetailedStats;
}

- (void)setWaitingForDetailedStats:(BOOL)a3
{
  self->_waitingForDetailedStats = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_spFmipRegisterInfo, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_rawStats, 0);
  objc_storeStrong(&self->_statsChangeHandler, 0);
}

@end
