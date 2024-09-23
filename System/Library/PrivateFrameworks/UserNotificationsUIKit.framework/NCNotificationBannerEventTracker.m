@implementation NCNotificationBannerEventTracker

+ (void)presentedNotificationRequestAsBanner:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedNotificationRequestAsBanner:", v3);

}

@end
