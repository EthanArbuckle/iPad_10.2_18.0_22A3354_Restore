@implementation PLDuetActivitySchedulerUsageSnapshot

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLDuetActivitySchedulerUsageSnapshot startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuetActivitySchedulerUsageSnapshot stopDate](self, "stopDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuetActivitySchedulerUsageSnapshot numberOfBytesUploadedCell](self, "numberOfBytesUploadedCell");
  v7 = v6;
  -[PLDuetActivitySchedulerUsageSnapshot numberOfBytesDownloadedCell](self, "numberOfBytesDownloadedCell");
  v9 = v8;
  -[PLDuetActivitySchedulerUsageSnapshot numberOfBytesUploadedWiFi](self, "numberOfBytesUploadedWiFi");
  v11 = v10;
  -[PLDuetActivitySchedulerUsageSnapshot numberOfBytesDownloadedWiFi](self, "numberOfBytesDownloadedWiFi");
  v13 = v12;
  -[PLDuetActivitySchedulerUsageSnapshot bundleID](self, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PLDuetActivitySchedulerUsageSnapshot (%@, %@, %f, %f, %f, %f, %@)"), v4, v5, v7, v9, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)stopDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStopDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)numberOfBytesUploadedWiFi
{
  return self->_numberOfBytesUploadedWiFi;
}

- (void)setNumberOfBytesUploadedWiFi:(double)a3
{
  self->_numberOfBytesUploadedWiFi = a3;
}

- (double)numberOfBytesDownloadedWiFi
{
  return self->_numberOfBytesDownloadedWiFi;
}

- (void)setNumberOfBytesDownloadedWiFi:(double)a3
{
  self->_numberOfBytesDownloadedWiFi = a3;
}

- (double)numberOfBytesUploadedCell
{
  return self->_numberOfBytesUploadedCell;
}

- (void)setNumberOfBytesUploadedCell:(double)a3
{
  self->_numberOfBytesUploadedCell = a3;
}

- (double)numberOfBytesDownloadedCell
{
  return self->_numberOfBytesDownloadedCell;
}

- (void)setNumberOfBytesDownloadedCell:(double)a3
{
  self->_numberOfBytesDownloadedCell = a3;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_stopDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
