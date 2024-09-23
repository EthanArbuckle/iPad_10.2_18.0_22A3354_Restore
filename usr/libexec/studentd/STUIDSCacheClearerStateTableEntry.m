@implementation STUIDSCacheClearerStateTableEntry

- (BOOL)cacheClearInProgress
{
  return self->_cacheClearInProgress;
}

- (void)setCacheClearInProgress:(BOOL)a3
{
  self->_cacheClearInProgress = a3;
}

- (NSDate)lastCacheClearFinishDate
{
  return self->_lastCacheClearFinishDate;
}

- (void)setLastCacheClearFinishDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastCacheClearFinishDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCacheClearFinishDate, 0);
}

@end
