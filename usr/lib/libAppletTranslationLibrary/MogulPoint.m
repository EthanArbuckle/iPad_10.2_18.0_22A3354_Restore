@implementation MogulPoint

- (NSNumber)balance
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBalance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDateComponents)expiration
{
  return (NSDateComponents *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExpiration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)isExpired
{
  return self->_isExpired;
}

- (void)setIsExpired:(BOOL)a3
{
  self->_isExpired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_balance, 0);
}

@end
