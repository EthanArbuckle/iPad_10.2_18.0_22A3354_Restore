@implementation MusicCarPlayApplicationCapabilitiesController

+ (MusicCarPlayApplicationCapabilitiesController)sharedController
{
  if (qword_1011ECD40 != -1)
    dispatch_once(&qword_1011ECD40, &stru_1010A9208);
  return (MusicCarPlayApplicationCapabilitiesController *)(id)qword_1011ECD38;
}

- (void)setAllowsRadioContent:(BOOL)a3
{
  id v4;

  if (self->_allowsRadioContent != a3)
  {
    self->_allowsRadioContent = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("MusicCarPlayApplicationCapabilitiesControllerAllowsRadioContentDidChangeNotification"), self);

  }
}

- (void)setSubscriptionCapabilities:(unint64_t)a3
{
  id v4;

  if (self->_subscriptionCapabilities != a3)
  {
    self->_subscriptionCapabilities = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("MusicCarPlayApplicationCapabilitiesControllerSubscriptionCapabilitiesDidChangeNotification"), self);

  }
}

- (void)setUserSubscriptionState:(int64_t)a3
{
  id v4;

  if (self->_userSubscriptionState != a3)
  {
    self->_userSubscriptionState = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("MusicCarPlayApplicationCapabilitiesControllerUserSubscriptionStateDidChangeNotification"), self);

  }
}

- (BOOL)allowsRadioContent
{
  return self->_allowsRadioContent;
}

- (unint64_t)subscriptionCapabilities
{
  return self->_subscriptionCapabilities;
}

- (int64_t)userSubscriptionState
{
  return self->_userSubscriptionState;
}

@end
