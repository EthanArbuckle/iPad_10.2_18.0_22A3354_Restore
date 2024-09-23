@implementation WLStatistics

+ (id)_statisticsWithContentType:(id)a3
{
  NSString *v3;
  WLStatistics *v4;
  NSString *contentType;

  v3 = (NSString *)a3;
  v4 = objc_alloc_init(WLStatistics);
  contentType = v4->_contentType;
  v4->_contentType = v3;

  return v4;
}

- (unint64_t)downloadBytesPerSecond
{
  unint64_t result;
  unint64_t downloadByteCount;

  result = -[WLStatistics downloadDuration](self, "downloadDuration");
  if (result)
  {
    downloadByteCount = self->_downloadByteCount;
    return (unint64_t)(double)(downloadByteCount / -[WLStatistics downloadDuration](self, "downloadDuration"));
  }
  return result;
}

- (unint64_t)importDuration
{
  double v2;

  -[NSDate timeIntervalSinceDate:](self->_importEndDate, "timeIntervalSinceDate:", self->_importStartDate);
  return vcvtpd_u64_f64(v2);
}

- (int64_t)importBytesUsed
{
  unint64_t importStartBytesFree;
  unint64_t importEndBytesFree;
  BOOL v4;
  int64_t v5;

  importStartBytesFree = self->_importStartBytesFree;
  importEndBytesFree = self->_importEndBytesFree;
  v4 = importStartBytesFree >= importEndBytesFree;
  v5 = importStartBytesFree - importEndBytesFree;
  if (v4)
    return v5;
  else
    return -1;
}

- (id)description
{
  NSString *contentType;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x24BDD17C8];
  contentType = self->_contentType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_selectedForMigration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_downloadByteCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WLStatistics downloadDuration](self, "downloadDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[WLStatistics downloadBytesPerSecond](self, "downloadBytesPerSecond"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_importRecordCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_importFailedRecordCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WLStatistics importDuration](self, "importDuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[WLStatistics importBytesUsed](self, "importBytesUsed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ : selected %@; download bytes %@, time %@, B/s %@; records imported %@, failed %@, time %@, space used %@"),
    contentType,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)aggregateContentType
{
  return CFSTR("<aggregate>");
}

+ (id)fetchContentType
{
  return CFSTR("<fetch>");
}

- (void)setFetchDuration:(unint64_t)a3
{
  self->_downloadDuration = a3;
}

- (void)setFetchStartBytesFree:(unint64_t)a3
{
  self->_importStartBytesFree = a3;
}

- (void)setFetchEndBytesFree:(unint64_t)a3
{
  self->_importEndBytesFree = a3;
}

- (void)addToFetchByteCount:(unint64_t)a3
{
  self->_downloadByteCount += a3;
}

- (void)incrementFetchRequestCount
{
  ++self->_importRecordCount;
}

- (void)incrementFetchFailedRequestCount
{
  ++self->_importFailedRecordCount;
}

- (id)fetchLogString
{
  void *v3;
  NSString *contentType;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  contentType = self->_contentType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_downloadByteCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WLStatistics downloadDuration](self, "downloadDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[WLStatistics downloadBytesPerSecond](self, "downloadBytesPerSecond"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_importRecordCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_importFailedRecordCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[WLStatistics importBytesUsed](self, "importBytesUsed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : fetch bytes %@, time %@, B/s %@; requests succeeded %@, failed %@, space used %@"),
    contentType,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (BOOL)selectedForMigration
{
  return self->_selectedForMigration;
}

- (void)setSelectedForMigration:(BOOL)a3
{
  self->_selectedForMigration = a3;
}

- (unint64_t)downloadDuration
{
  return self->_downloadDuration;
}

- (void)setDownloadDuration:(unint64_t)a3
{
  self->_downloadDuration = a3;
}

- (unint64_t)downloadByteCount
{
  return self->_downloadByteCount;
}

- (void)setDownloadByteCount:(unint64_t)a3
{
  self->_downloadByteCount = a3;
}

- (NSDate)importStartDate
{
  return self->_importStartDate;
}

- (void)setImportStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_importStartDate, a3);
}

- (NSDate)importEndDate
{
  return self->_importEndDate;
}

- (void)setImportEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_importEndDate, a3);
}

- (unint64_t)importStartBytesFree
{
  return self->_importStartBytesFree;
}

- (void)setImportStartBytesFree:(unint64_t)a3
{
  self->_importStartBytesFree = a3;
}

- (unint64_t)importEndBytesFree
{
  return self->_importEndBytesFree;
}

- (void)setImportEndBytesFree:(unint64_t)a3
{
  self->_importEndBytesFree = a3;
}

- (unint64_t)importRecordCount
{
  return self->_importRecordCount;
}

- (void)setImportRecordCount:(unint64_t)a3
{
  self->_importRecordCount = a3;
}

- (unint64_t)importFailedRecordCount
{
  return self->_importFailedRecordCount;
}

- (void)setImportFailedRecordCount:(unint64_t)a3
{
  self->_importFailedRecordCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importEndDate, 0);
  objc_storeStrong((id *)&self->_importStartDate, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

@end
