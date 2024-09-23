@implementation SBDashBoardNotificationPresenter

- (void)presentModalBannerAndExpandForNotificationRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)SBApp;
  v4 = a3;
  objc_msgSend(v3, "notificationDispatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bannerDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentModalBannerAndExpandForNotificationRequest:", v4);

}

@end
