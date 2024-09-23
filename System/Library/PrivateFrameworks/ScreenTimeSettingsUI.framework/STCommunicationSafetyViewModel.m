@implementation STCommunicationSafetyViewModel

- (BOOL)isCommunicationSafetyReceivingRestricted
{
  return self->_isCommunicationSafetyReceivingRestricted;
}

- (void)setIsCommunicationSafetyReceivingRestricted:(BOOL)a3
{
  self->_isCommunicationSafetyReceivingRestricted = a3;
}

- (BOOL)isCommunicationSafetySendingRestricted
{
  return self->_isCommunicationSafetySendingRestricted;
}

- (void)setIsCommunicationSafetySendingRestricted:(BOOL)a3
{
  self->_isCommunicationSafetySendingRestricted = a3;
}

- (BOOL)isCommunicationSafetyNotificationEnabled
{
  return self->_isCommunicationSafetyNotificationEnabled;
}

- (void)setIsCommunicationSafetyNotificationEnabled:(BOOL)a3
{
  self->_isCommunicationSafetyNotificationEnabled = a3;
}

- (BOOL)isCommunicationSafetyAnalyticsEnabled
{
  return self->_isCommunicationSafetyAnalyticsEnabled;
}

- (void)setIsCommunicationSafetyAnalyticsEnabled:(BOOL)a3
{
  self->_isCommunicationSafetyAnalyticsEnabled = a3;
}

@end
