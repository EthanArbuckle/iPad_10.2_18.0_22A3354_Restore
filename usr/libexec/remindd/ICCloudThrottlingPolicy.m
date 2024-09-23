@implementation ICCloudThrottlingPolicy

- (ICCloudThrottlingPolicy)initWithThrottlingLevels:(id)a3 resetInterval:(double)a4
{
  id v6;
  ICCloudThrottlingPolicy *v7;
  ICUserDefaults *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD block[4];
  ICCloudThrottlingPolicy *v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICCloudThrottlingPolicy;
  v7 = -[ICCloudThrottlingPolicy init](&v17, "init");
  if (v7)
  {
    v8 = objc_opt_new(ICUserDefaults);
    -[ICCloudThrottlingPolicy setIcUserDefaults:](v7, "setIcUserDefaults:", v8);

    -[ICCloudThrottlingPolicy setThrottlingLevels:](v7, "setThrottlingLevels:", v6);
    -[ICCloudThrottlingPolicy setResetInterval:](v7, "setResetInterval:", a4);
    -[ICCloudThrottlingPolicy loadSavedPolicyState](v7, "loadSavedPolicyState");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy policyStartDate](v7, "policyStartDate"));
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = -v10;
    -[ICCloudThrottlingPolicy resetInterval](v7, "resetInterval");
    v13 = v12;

    if (v13 < v11)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001F2DC;
      block[3] = &unk_1007D7A60;
      v16 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
    -[ICCloudThrottlingPolicy startPolicyResetTimer](v7, "startPolicyResetTimer");
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F37C;
  v5[3] = &unk_1007D7A60;
  v5[4] = self;
  performBlockOnMainThread(v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICCloudThrottlingPolicy;
  -[ICCloudThrottlingPolicy dealloc](&v4, "dealloc");
}

- (void)incrementBatchCount
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  void *v25;

  -[ICCloudThrottlingPolicy setCurrentBatchCount:](self, "setCurrentBatchCount:", (char *)-[ICCloudThrottlingPolicy currentBatchCount](self, "currentBatchCount") + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy currentLevel](self, "currentLevel"));
  if (objc_msgSend(v3, "numberOfBatches"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy currentLevel](self, "currentLevel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfBatches")));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  }
  else
  {
    v6 = CFSTR("unlimited");
  }

  v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = -[ICCloudThrottlingPolicy currentBatchCount](self, "currentBatchCount");
    v9 = -[ICCloudThrottlingPolicy currentLevelIndex](self, "currentLevelIndex") + 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy throttlingLevels](self, "throttlingLevels"));
    v11 = objc_msgSend(v10, "count");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy currentLevel](self, "currentLevel"));
    *(_DWORD *)buf = 67110146;
    v17 = v8;
    v18 = 2112;
    v19 = v6;
    v20 = 1024;
    v21 = v9;
    v22 = 1024;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Processing cloud batch (%d of %@) in throttling level (%d of %d): %@", buf, 0x28u);

  }
  -[ICCloudThrottlingPolicy changeLevelIfNecessary](self, "changeLevelIfNecessary");
  global_queue = dispatch_get_global_queue(-32768, 0);
  v14 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F5C0;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async(v14, block);

}

- (void)changeLevelIfNecessary
{
  unint64_t v3;
  void *v4;
  char *v5;
  unint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  void *v21;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy currentLevel](self, "currentLevel"));
  if (objc_msgSend(v15, "numberOfBatches"))
  {
    v3 = -[ICCloudThrottlingPolicy currentLevelIndex](self, "currentLevelIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy throttlingLevels](self, "throttlingLevels"));
    v5 = (char *)objc_msgSend(v4, "count") - 1;

    if (v3 < (unint64_t)v5)
    {
      v6 = -[ICCloudThrottlingPolicy currentBatchCount](self, "currentBatchCount");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy currentLevel](self, "currentLevel"));
      v8 = objc_msgSend(v7, "numberOfBatches");

      if (v6 >= (unint64_t)v8)
      {
        -[ICCloudThrottlingPolicy setCurrentLevelIndex:](self, "setCurrentLevelIndex:", (char *)-[ICCloudThrottlingPolicy currentLevelIndex](self, "currentLevelIndex") + 1);
        -[ICCloudThrottlingPolicy setCurrentBatchCount:](self, "setCurrentBatchCount:", 0);
        v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = -[ICCloudThrottlingPolicy currentLevelIndex](self, "currentLevelIndex") + 1;
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy throttlingLevels](self, "throttlingLevels"));
          v12 = objc_msgSend(v11, "count");
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy currentLevel](self, "currentLevel"));
          *(_DWORD *)buf = 67109634;
          v17 = v10;
          v18 = 1024;
          v19 = v12;
          v20 = 2112;
          v21 = v13;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Switching to cloud throttling level (%d of %d): %@", buf, 0x18u);

        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v14, "postNotificationName:object:", CFSTR("ICCloudBatchIntervalDidChangeNotification"), self);

      }
    }
  }
  else
  {

  }
}

- (double)batchInterval
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy currentLevel](self, "currentLevel"));
  objc_msgSend(v2, "batchInterval");
  v4 = v3;

  return v4;
}

- (ICCloudThrottlingLevel)currentLevel
{
  unint64_t v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;

  v3 = -[ICCloudThrottlingPolicy currentLevelIndex](self, "currentLevelIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy throttlingLevels](self, "throttlingLevels"));
  v5 = (char *)objc_msgSend(v4, "count") - 1;

  if (v3 >= (unint64_t)v5)
    v3 = (unint64_t)v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy throttlingLevels](self, "throttlingLevels"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v3));

  return (ICCloudThrottlingLevel *)v7;
}

- (void)resetPolicy
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy policyResetTimer](self, "policyResetTimer"));
  objc_msgSend(v3, "invalidate");

  -[ICCloudThrottlingPolicy setPolicyResetTimer:](self, "setPolicyResetTimer:", 0);
  -[ICCloudThrottlingPolicy setCurrentLevelIndex:](self, "setCurrentLevelIndex:", 0);
  -[ICCloudThrottlingPolicy setCurrentBatchCount:](self, "setCurrentBatchCount:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[ICCloudThrottlingPolicy setPolicyStartDate:](self, "setPolicyStartDate:", v4);

  -[ICCloudThrottlingPolicy startPolicyResetTimer](self, "startPolicyResetTimer");
  v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy currentLevel](self, "currentLevel"));
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting cloud throttling policy to the first level: %@", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICCloudBatchIntervalDidChangeNotification"), self);

  global_queue = dispatch_get_global_queue(-32768, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FA30;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async(v9, block);

}

- (void)startPolicyResetTimer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FA90;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (void)resetSavedPolicyState
{
  void *v2;
  ICUserDefaults *v3;

  v3 = objc_opt_new(ICUserDefaults);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICUserDefaults userDefaults](v3, "userDefaults"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("ThrottlingPolicyCurrentBatchCount"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("ThrottlingPolicyCurrentLevelIndex"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("ThrottlingPolicyStartTime"));

}

- (void)loadSavedPolicyState
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy icUserDefaults](self, "icUserDefaults"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userDefaults"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("ThrottlingPolicyCurrentBatchCount")));
  -[ICCloudThrottlingPolicy setCurrentBatchCount:](self, "setCurrentBatchCount:", objc_msgSend(v4, "unsignedIntegerValue"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("ThrottlingPolicyCurrentLevelIndex")));
  -[ICCloudThrottlingPolicy setCurrentLevelIndex:](self, "setCurrentLevelIndex:", objc_msgSend(v5, "unsignedIntegerValue"));

  objc_msgSend(v9, "doubleForKey:", CFSTR("ThrottlingPolicyStartTime"));
  if (v6 == 0.0)
    v7 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v8 = (void *)v7;
  -[ICCloudThrottlingPolicy setPolicyStartDate:](self, "setPolicyStartDate:", v7);

}

- (void)savePolicyState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy icUserDefaults](self, "icUserDefaults"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userDefaults"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[ICCloudThrottlingPolicy currentBatchCount](self, "currentBatchCount")));
  objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("ThrottlingPolicyCurrentBatchCount"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[ICCloudThrottlingPolicy currentLevelIndex](self, "currentLevelIndex")));
  objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("ThrottlingPolicyCurrentLevelIndex"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudThrottlingPolicy policyStartDate](self, "policyStartDate"));
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "setDouble:forKey:", CFSTR("ThrottlingPolicyStartTime"));

}

- (NSArray)throttlingLevels
{
  return self->_throttlingLevels;
}

- (void)setThrottlingLevels:(id)a3
{
  objc_storeStrong((id *)&self->_throttlingLevels, a3);
}

- (double)resetInterval
{
  return self->_resetInterval;
}

- (void)setResetInterval:(double)a3
{
  self->_resetInterval = a3;
}

- (ICUserDefaults)icUserDefaults
{
  return self->_icUserDefaults;
}

- (void)setIcUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_icUserDefaults, a3);
}

- (unint64_t)currentBatchCount
{
  return self->_currentBatchCount;
}

- (void)setCurrentBatchCount:(unint64_t)a3
{
  self->_currentBatchCount = a3;
}

- (unint64_t)currentLevelIndex
{
  return self->_currentLevelIndex;
}

- (void)setCurrentLevelIndex:(unint64_t)a3
{
  self->_currentLevelIndex = a3;
}

- (NSDate)policyStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPolicyStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSTimer)policyResetTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPolicyResetTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyResetTimer, 0);
  objc_storeStrong((id *)&self->_policyStartDate, 0);
  objc_storeStrong((id *)&self->_icUserDefaults, 0);
  objc_storeStrong((id *)&self->_throttlingLevels, 0);
}

@end
