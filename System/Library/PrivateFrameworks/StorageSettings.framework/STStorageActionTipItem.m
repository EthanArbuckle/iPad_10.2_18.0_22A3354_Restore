@implementation STStorageActionTipItem

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (BOOL)isRecoverable
{
  return self->_recoverable;
}

- (void)setRecoverable:(BOOL)a3
{
  self->_recoverable = a3;
}

- (NSDate)lastUsedDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastUsedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)createdDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
}

@end
