@implementation PLBackgroundTransferEvent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLBackgroundTransferEvent startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundTransferEvent bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundTransferEvent taskUUIDs](self, "taskUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("startDate=%@, bundleID=%@, taskUUIDs=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableSet)taskUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskUUIDs, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
