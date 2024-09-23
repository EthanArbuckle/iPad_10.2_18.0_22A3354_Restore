@implementation ICCloudContextSyncMetrics

- (ICCloudContextSyncMetrics)initWithSyncReason:(id)a3
{
  id v5;
  ICCloudContextSyncMetrics *v6;
  ICCloudContextSyncMetrics *v7;
  uint64_t v8;
  NSDate *startDate;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCloudContextSyncMetrics;
  v6 = -[ICCloudContextSyncMetrics init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_syncReason, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    startDate = v7->_startDate;
    v7->_startDate = (NSDate *)v8;

  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[12];
  _QWORD v42[12];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContextSyncMetrics endDate](self, "endDate"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContextSyncMetrics startDate](self, "startDate"));
  v40 = v6;
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  v10 = (uint64_t)((double)-[ICCloudContextSyncMetrics processedRecordCount](self, "processedRecordCount") / v9);
  v41[0] = CFSTR("reason");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContextSyncMetrics syncReason](self, "syncReason"));
  v42[0] = v39;
  v41[1] = CFSTR("fetchedRecordCount");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[ICCloudContextSyncMetrics fetchedRecordCount](self, "fetchedRecordCount")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringValue"));
  v42[1] = v37;
  v41[2] = CFSTR("deletedRecordsCount");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[ICCloudContextSyncMetrics deletedRecordsCount](self, "deletedRecordsCount")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stringValue"));
  v42[2] = v35;
  v41[3] = CFSTR("modifiedRecordCount");
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[ICCloudContextSyncMetrics modifiedRecordCount](self, "modifiedRecordCount")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringValue"));
  v42[3] = v33;
  v41[4] = CFSTR("processedRecordCount");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[ICCloudContextSyncMetrics processedRecordCount](self, "processedRecordCount")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringValue"));
  v42[4] = v31;
  v41[5] = CFSTR("success");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICCloudContextSyncMetrics success](self, "success")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringValue"));
  v42[5] = v29;
  v41[6] = CFSTR("pid");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v28, "processIdentifier")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringValue"));
  v42[6] = v26;
  v41[7] = CFSTR("startDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContextSyncMetrics startDate](self, "startDate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description"));
  v42[7] = v24;
  v41[8] = CFSTR("operationCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[ICCloudContextSyncMetrics operationCount](self, "operationCount")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
  v42[8] = v12;
  v41[9] = CFSTR("averageRecordsPerSecond");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));
  v42[9] = v14;
  v41[10] = CFSTR("saveCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[ICCloudContextSyncMetrics saveCount](self, "saveCount")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
  v42[10] = v16;
  v41[11] = CFSTR("duration");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.4f"), *(_QWORD *)&v9));
  v42[11] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 12));
  v19 = objc_msgSend(v18, "mutableCopy");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContextSyncMetrics endDate](self, "endDate"));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudContextSyncMetrics endDate](self, "endDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "description"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("endDate"));

  }
  return v19;
}

- (void)finishWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[ICCloudContextSyncMetrics setEndDate:](self, "setEndDate:", v5);

  -[ICCloudContextSyncMetrics setSuccess:](self, "setSuccess:", v3);
}

- (NSString)syncReason
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSyncReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)fetchedRecordCount
{
  return self->_fetchedRecordCount;
}

- (void)setFetchedRecordCount:(int64_t)a3
{
  self->_fetchedRecordCount = a3;
}

- (int64_t)deletedRecordsCount
{
  return self->_deletedRecordsCount;
}

- (void)setDeletedRecordsCount:(int64_t)a3
{
  self->_deletedRecordsCount = a3;
}

- (int64_t)modifiedRecordCount
{
  return self->_modifiedRecordCount;
}

- (void)setModifiedRecordCount:(int64_t)a3
{
  self->_modifiedRecordCount = a3;
}

- (int64_t)processedRecordCount
{
  return self->_processedRecordCount;
}

- (void)setProcessedRecordCount:(int64_t)a3
{
  self->_processedRecordCount = a3;
}

- (int64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(int64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (int64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (void)setBytesUploaded:(int64_t)a3
{
  self->_bytesUploaded = a3;
}

- (int64_t)operationCount
{
  return self->_operationCount;
}

- (void)setOperationCount:(int64_t)a3
{
  self->_operationCount = a3;
}

- (int64_t)saveCount
{
  return self->_saveCount;
}

- (void)setSaveCount:(int64_t)a3
{
  self->_saveCount = a3;
}

- (int64_t)averageRecordsPerSecond
{
  return self->_averageRecordsPerSecond;
}

- (void)setAverageRecordsPerSecond:(int64_t)a3
{
  self->_averageRecordsPerSecond = a3;
}

- (double)cloudKitDuration
{
  return self->_cloudKitDuration;
}

- (void)setCloudKitDuration:(double)a3
{
  self->_cloudKitDuration = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_syncReason, 0);
}

@end
