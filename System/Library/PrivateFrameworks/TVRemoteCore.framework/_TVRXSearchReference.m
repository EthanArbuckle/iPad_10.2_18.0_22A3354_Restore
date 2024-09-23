@implementation _TVRXSearchReference

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSTimer)expirationTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_expirationTimer);
}

- (void)setExpirationTimer:(id)a3
{
  objc_storeWeak((id *)&self->_expirationTimer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_expirationTimer);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
