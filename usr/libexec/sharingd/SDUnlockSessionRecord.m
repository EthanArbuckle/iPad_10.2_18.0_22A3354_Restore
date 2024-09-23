@implementation SDUnlockSessionRecord

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p> (unlockSession = %ld, expireTime = %lld, keyData = %@)"), v5, self, self->_unlockSessionID, self->_expireTime, self->_keyData));

  return v6;
}

- (NSData)keyData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKeyData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)unlockSessionID
{
  return self->_unlockSessionID;
}

- (void)setUnlockSessionID:(int64_t)a3
{
  self->_unlockSessionID = a3;
}

- (unint64_t)expireTime
{
  return self->_expireTime;
}

- (void)setExpireTime:(unint64_t)a3
{
  self->_expireTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
}

@end
