@implementation RTCameraManagerNotificationCameraPowerChanged

- (RTCameraManagerNotificationCameraPowerChanged)initWithCameraType:(int64_t)a3 powerState:(int64_t)a4
{
  RTCameraManagerNotificationCameraPowerChanged *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTCameraManagerNotificationCameraPowerChanged;
  result = -[RTNotification init](&v7, sel_init);
  if (result)
  {
    result->_cameraType = a3;
    result->_powerState = a4;
  }
  return result;
}

- (int64_t)powerState
{
  return self->_powerState;
}

- (int64_t)cameraType
{
  return self->_cameraType;
}

@end
