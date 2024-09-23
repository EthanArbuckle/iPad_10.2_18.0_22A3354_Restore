@implementation RTBluetoothManagerNotificationCarKitConnectionStateChanged

- (RTBluetoothManagerNotificationCarKitConnectionStateChanged)initWithCarKitConnectionState:(int64_t)a3
{
  RTBluetoothManagerNotificationCarKitConnectionStateChanged *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTBluetoothManagerNotificationCarKitConnectionStateChanged;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_carKitConnectionState = a3;
  return result;
}

- (int64_t)carKitConnectionState
{
  return self->_carKitConnectionState;
}

@end
