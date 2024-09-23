@implementation BRCFSEventToSyncUpEvent

- (id)additionalPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("isPackage");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPackage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("contentSize");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_contentSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("syncUpBatchSize");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_syncUpBatchSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)subDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BRCItemID debugItemIDString](self->_itemID, "debugItemIDString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_isPackage)
    v6 = "pkg ";
  else
    v6 = "";
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" i:%@ %ssz:%lld su-batch:%lld"), v4, v6, self->_contentSize, self->_syncUpBatchSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)associatedAppTelemetryEvent
{
  -[BRCEventMetric duration](self, "duration");
  return +[AppTelemetryTimeSeriesEvent newFSEventToSyncUpEventWithDuration:](AppTelemetryTimeSeriesEvent, "newFSEventToSyncUpEventWithDuration:");
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (void)setFileID:(unint64_t)a3
{
  self->_fileID = a3;
}

- (unsigned)genID
{
  return self->_genID;
}

- (void)setGenID:(unsigned int)a3
{
  self->_genID = a3;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (unint64_t)mtime
{
  return self->_mtime;
}

- (void)setMtime:(unint64_t)a3
{
  self->_mtime = a3;
}

- (unint64_t)contentSize
{
  return self->_contentSize;
}

- (void)setContentSize:(unint64_t)a3
{
  self->_contentSize = a3;
}

- (BOOL)isPackage
{
  return self->_isPackage;
}

- (void)setIsPackage:(BOOL)a3
{
  self->_isPackage = a3;
}

- (unint64_t)syncUpBatchSize
{
  return self->_syncUpBatchSize;
}

- (void)setSyncUpBatchSize:(unint64_t)a3
{
  self->_syncUpBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
