@implementation CLClientManagerUsageSyncMessageError

- (void)dealloc
{
  objc_super v3;

  self->_message = 0;
  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLClientManagerUsageSyncMessageError;
  -[CLClientManagerUsageSyncMessageError dealloc](&v3, "dealloc");
}

- (CLClientManagerUsageSyncMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)recoverable
{
  return self->_recoverable;
}

- (void)setRecoverable:(BOOL)a3
{
  self->_recoverable = a3;
}

@end
