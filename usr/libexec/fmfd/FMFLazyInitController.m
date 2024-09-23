@implementation FMFLazyInitController

- (void)updateFriendsFollowersCount:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[FMFLazyInitController numberOfFriendsAndFollowers](self, "numberOfFriendsAndFollowers"));
  if (!v4
    || (v5 = (void *)v4,
        v6 = objc_msgSend(v9, "integerValue"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLazyInitController numberOfFriendsAndFollowers](self, "numberOfFriendsAndFollowers")),
        v8 = objc_msgSend(v7, "integerValue"),
        v7,
        v5,
        v6 != v8))
  {
    -[FMFLazyInitController setNumberOfFriendsAndFollowers:](self, "setNumberOfFriendsAndFollowers:", v9);
  }

}

- (NSNumber)numberOfFriendsAndFollowers
{
  NSNumber *numberOfFriendsAndFollowers;
  void *v4;
  void *v5;

  numberOfFriendsAndFollowers = self->_numberOfFriendsAndFollowers;
  if (!numberOfFriendsAndFollowers)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("numberOfFriendsFollowersKey")));
    -[FMFLazyInitController setNumberOfFriendsAndFollowers:](self, "setNumberOfFriendsAndFollowers:", v5);

    numberOfFriendsAndFollowers = self->_numberOfFriendsAndFollowers;
  }
  return numberOfFriendsAndFollowers;
}

+ (id)sharedInstance
{
  if (qword_1000B36C8 != -1)
    dispatch_once(&qword_1000B36C8, &stru_100099C48);
  return (id)qword_1000B36C0;
}

- (BOOL)allowInitForSessionCreation
{
  id v3;
  NSObject *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  _DWORD v25[2];
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  _BOOL4 v33;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFLazyInitController checking allowInitForSessionCreation", (uint8_t *)v25, 2u);
  }

  -[FMFLazyInitController lazyInitTimeoutInSecStoredValue](self, "lazyInitTimeoutInSecStoredValue");
  v6 = v5;
  v7 = objc_claimAutoreleasedReturnValue(-[FMFLazyInitController numberOfFriendsAndFollowers](self, "numberOfFriendsAndFollowers"));
  if (!v7)
    goto LABEL_6;
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLazyInitController numberOfFriendsAndFollowers](self, "numberOfFriendsAndFollowers"));
  if (objc_msgSend(v9, "unsignedIntegerValue"))
  {

LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLazyInitController lastSuccessfulInitDate](self, "lastSuccessfulInitDate"));

  v10 = 1;
  if (v19 && v6 > 0.0)
  {
    v20 = sub_100011D0C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "FMFLazyInitController has friends/followers/lastdate info", (uint8_t *)v25, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v22, "timeIntervalSinceDate:", self->_lastSuccessfulInitDate);
    v24 = v23;

    v10 = v24 > v6;
  }
LABEL_7:
  v11 = sub_100011D0C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLazyInitController numberOfFriendsAndFollowers](self, "numberOfFriendsAndFollowers"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLazyInitController numberOfFriendsAndFollowers](self, "numberOfFriendsAndFollowers"));
    v15 = objc_msgSend(v14, "unsignedIntegerValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLazyInitController lastSuccessfulInitDate](self, "lastSuccessfulInitDate"));
    -[FMFLazyInitController lazyInitTimeoutInSecStoredValue](self, "lazyInitTimeoutInSecStoredValue");
    v25[0] = 67110146;
    v25[1] = v13 == 0;
    v26 = 2048;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    v30 = 2048;
    v31 = v17;
    v32 = 1024;
    v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "allowInitForSessionCreation FF is nil: %d, FF count: %lu, last init date: %@, lazy timeout stored value: %f, allow init: %d", (uint8_t *)v25, 0x2Cu);

  }
  return v10;
}

- (BOOL)lastLazyCheckWasInLazyStateDueToNoFriendsOrFollower
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLazyInitController numberOfFriendsAndFollowers](self, "numberOfFriendsAndFollowers"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLazyInitController numberOfFriendsAndFollowers](self, "numberOfFriendsAndFollowers"));
    v5 = objc_msgSend(v4, "unsignedIntegerValue") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)accountWasRemoved:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[FMFLazyInitController setLastSuccessfulInitDate:](self, "setLastSuccessfulInitDate:", 0);
  -[FMFLazyInitController setNumberOfFriendsAndFollowers:](self, "setNumberOfFriendsAndFollowers:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("lastSuccessfulInitDateKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("numberOfFriendsFollowersKey"));

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "synchronize");

}

- (void)modelDidLoadSuccessfully:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  -[FMFLazyInitController setLastSuccessfulInitDate:](self, "setLastSuccessfulInitDate:", v4);

}

- (NSDate)lastSuccessfulInitDate
{
  NSDate *lastSuccessfulInitDate;
  void *v4;
  void *v5;

  lastSuccessfulInitDate = self->_lastSuccessfulInitDate;
  if (!lastSuccessfulInitDate)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("lastSuccessfulInitDateKey")));
    -[FMFLazyInitController setLastSuccessfulInitDate:](self, "setLastSuccessfulInitDate:", v5);

    lastSuccessfulInitDate = self->_lastSuccessfulInitDate;
  }
  return lastSuccessfulInitDate;
}

- (void)setLastSuccessfulInitDate:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_lastSuccessfulInitDate, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setObject:forKey:", self->_lastSuccessfulInitDate, CFSTR("lastSuccessfulInitDateKey"));

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "synchronize");

}

- (void)setNumberOfFriendsAndFollowers:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_numberOfFriendsAndFollowers, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setObject:forKey:", self->_numberOfFriendsAndFollowers, CFSTR("numberOfFriendsFollowersKey"));

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "synchronize");

}

- (double)lazyInitTimeoutInSecStoredValue
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[FMFLazyInitController lazyTimeLoaded](self, "lazyTimeLoaded"))
  {
    -[FMFLazyInitController setLazyTimeLoaded:](self, "setLazyTimeLoaded:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    objc_msgSend(v3, "lazyInitTimeoutInSec");

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("lazyInitTimeSecsStoredKey")));
    objc_msgSend(v5, "doubleValue");
    -[FMFLazyInitController setLazyInitTimeoutInSecStoredValue:](self, "setLazyInitTimeoutInSecStoredValue:");

  }
  return self->_lazyInitTimeoutInSecStoredValue;
}

- (void)setLazyInitTimeoutInSecStoredValue:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  self->_lazyInitTimeoutInSecStoredValue = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_lazyInitTimeoutInSecStoredValue));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("lazyInitTimeSecsStoredKey"));

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "synchronize");

}

- (void)expireInitTimestamp
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[FMFLazyInitController setLastSuccessfulInitDate:](self, "setLastSuccessfulInitDate:", v3);

}

- (BOOL)lazyTimeLoaded
{
  return self->_lazyTimeLoaded;
}

- (void)setLazyTimeLoaded:(BOOL)a3
{
  self->_lazyTimeLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfFriendsAndFollowers, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulInitDate, 0);
}

@end
