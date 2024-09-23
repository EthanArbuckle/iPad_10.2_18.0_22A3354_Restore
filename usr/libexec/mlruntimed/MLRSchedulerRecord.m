@implementation MLRSchedulerRecord

- (MLRSchedulerRecord)init
{
  MLRSchedulerRecord *v2;
  MLRSchedulerRecord *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLRSchedulerRecord;
  v2 = -[MLRSchedulerRecord init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_wakeUpPeriodInSeconds = 86400;
    if (allowCustomWakeUpPeriod(v2))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[DESUserDefaultsStoreRecord schedulerWakeupPeriodInSeconds](DESUserDefaultsStoreRecord, "schedulerWakeupPeriodInSeconds"));
      v5 = v4;
      if (v4)
        v3->_wakeUpPeriodInSeconds = (uint64_t)fmax((double)(unint64_t)objc_msgSend(v4, "unsignedIntegerValue"), 1800.0);

    }
  }
  return v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%lu)"), v5, self->_wakeUpPeriodInSeconds));

  return v6;
}

- (id)fetchAllPluginIDs
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DESBundleRegistry sharedInstance](DESBundleRegistry, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allUnrestrictedBundleIds"));

  return v3;
}

- (void)updateWakeUpPeriodInSeconds
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  MLRPluginSchedulingRecord *v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (allowCustomWakeUpPeriod(self))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MLRSchedulerRecord fetchAllPluginIDs](self, "fetchAllPluginIDs"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v3);
          v9 = -[MLRPluginSchedulingRecord initWithPluginID:]([MLRPluginSchedulingRecord alloc], "initWithPluginID:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i));
          v6 = binaryGCD(v6, (unint64_t)fmax((double)-[MLRPluginSchedulingRecord periodInSeconds](v9, "periodInSeconds")/ 1800.0, 1.0));

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
      v10 = (unint64_t)((double)v6 * 1800.0);
      if (v10)
        v11 = v10 == 86400;
      else
        v11 = 1;
      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
        +[DESUserDefaultsStoreRecord setSchedulerWakeupPeriodInSeconds:](DESUserDefaultsStoreRecord, "setSchedulerWakeupPeriodInSeconds:", v12);

      }
    }

  }
}

- (int64_t)wakeUpPeriodInSeconds
{
  return self->_wakeUpPeriodInSeconds;
}

@end
