@implementation RTAccountManagerNotificationCloudSyncAuthorizationStateChanged

- (RTAccountManagerNotificationCloudSyncAuthorizationStateChanged)initWithCloudSyncAuthorizationState:(int64_t)a3
{
  RTAccountManagerNotificationCloudSyncAuthorizationStateChanged *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTAccountManagerNotificationCloudSyncAuthorizationStateChanged;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_cloudSyncAuthorizationState = a3;
  return result;
}

- (int64_t)cloudSyncAuthorizationState
{
  return self->_cloudSyncAuthorizationState;
}

@end
