@implementation SBNotificationLongLookBannerPresentationObservationToken

- (SBNotificationLongLookBannerPresentationObservationToken)initWithNotificationBannerDestination:(id)a3 scene:(id)a4
{
  id v7;
  SBNotificationLongLookBannerPresentationObservationToken *v8;
  SBNotificationLongLookBannerPresentationObservationToken *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBNotificationLongLookBannerPresentationObservationToken;
  v8 = -[SBPresentationObservationToken initWithScene:](&v11, sel_initWithScene_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationBannerDestination, a3);
    -[SBNotificationBannerDestination registerNotificationBannerDestinationObserver:](v9->_notificationBannerDestination, "registerNotificationBannerDestinationObserver:", v9);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SBNotificationBannerDestination unregisterNotificationBannerDestinationObserver:](self->_notificationBannerDestination, "unregisterNotificationBannerDestinationObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBNotificationLongLookBannerPresentationObservationToken;
  -[SBNotificationLongLookBannerPresentationObservationToken dealloc](&v3, sel_dealloc);
}

- (int64_t)state
{
  if (-[SBNotificationBannerDestination isPresentingBannerInLongLook](self->_notificationBannerDestination, "isPresentingBannerInLongLook"))
  {
    return 3;
  }
  else
  {
    return 0;
  }
}

- (SBNotificationBannerDestination)notificationBannerDestination
{
  return self->_notificationBannerDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationBannerDestination, 0);
}

@end
