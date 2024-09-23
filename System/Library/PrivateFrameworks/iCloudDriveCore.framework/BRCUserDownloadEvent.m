@implementation BRCUserDownloadEvent

- (BRCUserDownloadEvent)init
{
  BRCUserDownloadEvent *v2;
  uint64_t v3;
  NSMutableSet *fileObjectIDs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCUserDownloadEvent;
  v2 = -[BRCUserDownloadEvent init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    fileObjectIDs = v2->_fileObjectIDs;
    v2->_fileObjectIDs = (NSMutableSet *)v3;

  }
  return v2;
}

- (id)additionalPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("didSucceed");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didSucceed);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("isDownloadingForBackup");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDownloadingForBackup);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("isRecursiveDownload");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isRecursiveDownload);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("itemCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_itemCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("totalContentSize");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalContentSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)subDescription
{
  const char *v2;
  const char *v3;

  if (self->_isRecursiveDownload)
    v2 = "recursive ";
  else
    v2 = "";
  if (self->_isDownloadingForBackup)
    v3 = "for-backup";
  else
    v3 = "";
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" sz:%lld cnt:%lld %s%s"), self->_totalContentSize, self->_itemCount, v2, v3);
}

- (id)associatedAppTelemetryEvent
{
  -[BRCEventMetric duration](self, "duration");
  return +[AppTelemetryTimeSeriesEvent newUserDownloadEventWithDuration:](AppTelemetryTimeSeriesEvent, "newUserDownloadEventWithDuration:");
}

- (NSUUID)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
  objc_storeStrong((id *)&self->_operationID, a3);
}

- (NSMutableSet)fileObjectIDs
{
  return self->_fileObjectIDs;
}

- (void)setFileObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_fileObjectIDs, a3);
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (BOOL)isDownloadingForBackup
{
  return self->_isDownloadingForBackup;
}

- (void)setIsDownloadingForBackup:(BOOL)a3
{
  self->_isDownloadingForBackup = a3;
}

- (BOOL)isRecursiveDownload
{
  return self->_isRecursiveDownload;
}

- (void)setIsRecursiveDownload:(BOOL)a3
{
  self->_isRecursiveDownload = a3;
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(unint64_t)a3
{
  self->_itemCount = a3;
}

- (unint64_t)totalContentSize
{
  return self->_totalContentSize;
}

- (void)setTotalContentSize:(unint64_t)a3
{
  self->_totalContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileObjectIDs, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

@end
