@implementation MusicCarPlayApplicationCapabilitiesController

+ (MusicCarPlayApplicationCapabilitiesController)sharedController
{
  if (sharedController_sOnceToken != -1)
    dispatch_once(&sharedController_sOnceToken, &__block_literal_global_8);
  return (MusicCarPlayApplicationCapabilitiesController *)(id)sharedController_sSharedController;
}

void __65__MusicCarPlayApplicationCapabilitiesController_sharedController__block_invoke(id a1)
{
  MusicCarPlayApplicationCapabilitiesController *v1;
  void *v2;

  v1 = objc_alloc_init(MusicCarPlayApplicationCapabilitiesController);
  v2 = (void *)sharedController_sSharedController;
  sharedController_sSharedController = (uint64_t)v1;

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
