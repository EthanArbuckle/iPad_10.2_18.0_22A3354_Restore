@implementation TRINotificationState

- (TRINotificationState)initWithToken:(int)a3
{
  TRINotificationState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRINotificationState;
  result = -[TRINotificationState init](&v5, sel_init);
  if (result)
    result->_token = a3;
  return result;
}

- (int)token
{
  return self->_token;
}

@end
