@implementation PLDuetEventTransition

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLDuetEventTransition bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuetEventTransition date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("bundleID=%@, date=%f, isStart=%i"), v4, v6, -[PLDuetEventTransition isStart](self, "isStart"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void)setIsStart:(BOOL)a3
{
  self->_isStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
