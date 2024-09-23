@implementation TSUDownloadTaskProgress

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)TSUDownloadTaskProgress;
  -[TSUDownloadTaskProgress description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \"%lld of %lld\"), v4, self->_totalBytesDownloaded, self->_totalBytesExpectedToBeDownloaded);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (int64_t)totalBytesDownloaded
{
  return self->_totalBytesDownloaded;
}

- (void)setTotalBytesDownloaded:(int64_t)a3
{
  self->_totalBytesDownloaded = a3;
}

- (int64_t)totalBytesExpectedToBeDownloaded
{
  return self->_totalBytesExpectedToBeDownloaded;
}

- (void)setTotalBytesExpectedToBeDownloaded:(int64_t)a3
{
  self->_totalBytesExpectedToBeDownloaded = a3;
}

@end
