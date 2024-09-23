@implementation MLRTaskSchedulingRecord

- (MLRTaskSchedulingRecord)initWithTaskID:(id)a3
{
  id v5;
  MLRTaskSchedulingRecord *v6;
  DESUserDefaultsStoreRecord *v7;
  DESUserDefaultsStoreRecord *storeRecord;
  uint64_t v9;
  NSDate *lastCompletionDate;
  MLRTaskSchedulingRecord *v11;
  objc_super v13;

  v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)MLRTaskSchedulingRecord;
    v6 = -[MLRTaskSchedulingRecord init](&v13, "init");
    if (v6)
    {
      v7 = (DESUserDefaultsStoreRecord *)objc_msgSend(objc_alloc((Class)DESUserDefaultsStoreRecord), "initWithRecordID:", v5);
      storeRecord = v6->_storeRecord;
      v6->_storeRecord = v7;

      objc_storeStrong((id *)&v6->_recordID, a3);
      v9 = objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord lastCompletionDate](v6->_storeRecord, "lastCompletionDate"));
      lastCompletionDate = v6->_lastCompletionDate;
      v6->_lastCompletionDate = (NSDate *)v9;

      v6->_performCount = (int64_t)-[DESUserDefaultsStoreRecord performCount](v6->_storeRecord, "performCount");
    }
    self = v6;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%@, %@, %ld)"), v5, self->_recordID, self->_lastCompletionDate, self->_performCount));

  return v6;
}

- (BOOL)commitWithError:(id *)a3
{
  -[DESUserDefaultsStoreRecord setLastCompletionDate:](self->_storeRecord, "setLastCompletionDate:", self->_lastCompletionDate);
  -[DESUserDefaultsStoreRecord setPerformCount:](self->_storeRecord, "setPerformCount:", self->_performCount);
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

- (int64_t)performCount
{
  return self->_performCount;
}

- (void)setPerformCount:(int64_t)a3
{
  self->_performCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_lastCompletionDate, 0);
  objc_storeStrong((id *)&self->_storeRecord, 0);
}

@end
