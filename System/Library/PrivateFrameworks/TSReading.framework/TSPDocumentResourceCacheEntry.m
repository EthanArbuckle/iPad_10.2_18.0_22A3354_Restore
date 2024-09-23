@implementation TSPDocumentResourceCacheEntry

- (TSPDocumentResourceCacheEntry)init
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDocumentResourceCacheEntry init]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDocumentResourceCacheEntry.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 12, CFSTR("Do not call method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSPDocumentResourceCacheEntry init]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (TSPDocumentResourceCacheEntry)initWithDigestString:(id)a3
{
  id v4;
  TSPDocumentResourceCacheEntry *v5;
  uint64_t v6;
  NSString *digestString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSPDocumentResourceCacheEntry;
  v5 = -[TSPDocumentResourceCacheEntry init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    digestString = v5->_digestString;
    v5->_digestString = (NSString *)v6;

  }
  return v5;
}

- (NSString)digestString
{
  return self->_digestString;
}

- (int64_t)accessCount
{
  return self->_accessCount;
}

- (void)setAccessCount:(int64_t)a3
{
  self->_accessCount = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (NSDate)contentAccessDate
{
  return self->_contentAccessDate;
}

- (void)setContentAccessDate:(id)a3
{
  objc_storeStrong((id *)&self->_contentAccessDate, a3);
}

- (BOOL)wasDownloaded
{
  return self->_wasDownloaded;
}

- (void)setWasDownloaded:(BOOL)a3
{
  self->_wasDownloaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAccessDate, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_digestString, 0);
}

@end
