@implementation RTStarkManagerNotificationTrustedConnectionEstablished

- (RTStarkManagerNotificationTrustedConnectionEstablished)initWithTrustedConnectionEstablished:(BOOL)a3
{
  RTStarkManagerNotificationTrustedConnectionEstablished *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTStarkManagerNotificationTrustedConnectionEstablished;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_trustedConnectionEstablished = a3;
  return result;
}

- (BOOL)trustedConnectionEstablished
{
  return self->_trustedConnectionEstablished;
}

- (void)setTrustedConnectionEstablished:(BOOL)a3
{
  self->_trustedConnectionEstablished = a3;
}

@end
