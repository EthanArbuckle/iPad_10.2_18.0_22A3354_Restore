@implementation MLRPluginSchedulingRecord

- (MLRPluginSchedulingRecord)initWithPluginID:(id)a3
{
  id v5;
  MLRPluginSchedulingRecord *v6;
  DESUserDefaultsStoreRecord *v7;
  DESUserDefaultsStoreRecord *storeRecord;
  uint64_t v9;
  NSDate *lastCompletionDate;
  void *v11;
  void *v12;
  MLRPluginSchedulingRecord *v13;
  objc_super v15;

  v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)MLRPluginSchedulingRecord;
    v6 = -[MLRPluginSchedulingRecord init](&v15, "init");
    if (v6)
    {
      v7 = (DESUserDefaultsStoreRecord *)objc_msgSend(objc_alloc((Class)DESUserDefaultsStoreRecord), "initWithRecordID:", v5);
      storeRecord = v6->_storeRecord;
      v6->_storeRecord = v7;

      objc_storeStrong((id *)&v6->_recordID, a3);
      v9 = objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord lastCompletionDate](v6->_storeRecord, "lastCompletionDate"));
      lastCompletionDate = v6->_lastCompletionDate;
      v6->_lastCompletionDate = (NSDate *)v9;

      v6->_periodInSeconds = kDESDodMLPolicy_DefaultPeriod;
      if (allowCustomWakeUpPeriod())
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord periodInSeconds](v6->_storeRecord, "periodInSeconds"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord periodInSeconds](v6->_storeRecord, "periodInSeconds"));
          v6->_periodInSeconds = (unint64_t)objc_msgSend(v12, "unsignedIntegerValue");

        }
      }
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%@, %@, %lu)"), v5, self->_recordID, self->_lastCompletionDate, self->_periodInSeconds));

  return v6;
}

- (BOOL)commitWithError:(id *)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;

  if (allowCustomWakeUpPeriod(-[DESUserDefaultsStoreRecord setLastCompletionDate:](self->_storeRecord, "setLastCompletionDate:", self->_lastCompletionDate)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord periodInSeconds](self->_storeRecord, "periodInSeconds"));
    if (v4)
      v5 = 0;
    else
      v5 = self->_periodInSeconds != kDESDodMLPolicy_DefaultPeriod;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord periodInSeconds](self->_storeRecord, "periodInSeconds"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord periodInSeconds](self->_storeRecord, "periodInSeconds"));
      v8 = objc_msgSend(v7, "unsignedIntegerValue") != (id)self->_periodInSeconds;

    }
    else
    {
      v8 = 0;
    }

    if (v5 || v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_periodInSeconds));
      -[DESUserDefaultsStoreRecord setPeriodInSeconds:](self->_storeRecord, "setPeriodInSeconds:", v9);

    }
  }
  return 1;
}

- (NSDate)lastCompletionDate
{
  return self->_lastCompletionDate;
}

- (void)setLastCompletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastCompletionDate, a3);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (unint64_t)periodInSeconds
{
  return self->_periodInSeconds;
}

- (void)setPeriodInSeconds:(unint64_t)a3
{
  self->_periodInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_lastCompletionDate, 0);
  objc_storeStrong((id *)&self->_storeRecord, 0);
}

@end
