@implementation _PASNotificationToken

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (unint64_t)token
{
  return self->_token;
}

@end
