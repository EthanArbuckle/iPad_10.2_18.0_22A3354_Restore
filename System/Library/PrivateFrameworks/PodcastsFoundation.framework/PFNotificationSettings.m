@implementation PFNotificationSettings

+ (BOOL)canSendNotification
{
  return _s18PodcastsFoundation20NotificationSettingsC07canSendC0SbyFZ_0() & 1;
}

- (PFNotificationSettings)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PFNotificationSettings init](&v3, sel_init);
}

@end
