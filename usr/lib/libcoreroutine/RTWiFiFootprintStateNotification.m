@implementation RTWiFiFootprintStateNotification

- (RTWiFiFootprintStateNotification)initWithFootprintState:(int64_t)a3
{
  RTWiFiFootprintStateNotification *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTWiFiFootprintStateNotification;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_state = a3;
  return result;
}

- (int64_t)state
{
  return self->_state;
}

@end
