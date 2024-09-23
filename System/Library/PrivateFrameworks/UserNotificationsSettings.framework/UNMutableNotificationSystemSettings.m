@implementation UNMutableNotificationSystemSettings

- (void)setShowPreviewsSetting:(int64_t)a3
{
  self->super._showPreviewsSetting = a3;
  self->super._modifiedSettings |= 1uLL;
}

- (void)setAnnouncementSetting:(int64_t)a3
{
  self->super._announcementSetting = a3;
  self->super._modifiedSettings |= 2uLL;
}

- (void)setAnnouncementHeadphonesSetting:(int64_t)a3
{
  self->super._announcementHeadphonesSetting = a3;
  self->super._modifiedSettings |= 4uLL;
}

- (void)setAnnouncementCarPlaySetting:(int64_t)a3
{
  self->super._announcementCarPlaySetting = a3;
  self->super._modifiedSettings |= 8uLL;
}

- (void)setScheduledDeliverySetting:(int64_t)a3
{
  self->super._scheduledDeliverySetting = a3;
  self->super._modifiedSettings |= 0x10uLL;
}

- (void)setScheduledDeliveryTimes:(id)a3
{
  objc_storeStrong((id *)&self->super._scheduledDeliveryTimes, a3);
  self->super._modifiedSettings |= 0x20uLL;
}

- (void)setScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  unint64_t v3;

  v3 = self->super._modifiedSettings | 0x40;
  self->super._scheduledDeliveryShowNextSummarySetting = a3;
  self->super._modifiedSettings = v3;
}

- (void)setNotificationListDisplayStyleSetting:(int64_t)a3
{
  self->super._modifiedSettings |= 0x80uLL;
  self->super._notificationListDisplayStyleSetting = a3;
}

- (void)setRemoteNotificationsSetting:(int64_t)a3
{
  self->super._remoteNotificationsSetting = a3;
  self->super._modifiedSettings |= 0x100uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:remoteNotificationsSetting:modifiedSettings:", self->super._showPreviewsSetting, self->super._announcementSetting, self->super._announcementHeadphonesSetting, self->super._announcementCarPlaySetting, self->super._scheduledDeliverySetting, self->super._scheduledDeliveryTimes, self->super._scheduledDeliveryShowNextSummarySetting, self->super._notificationListDisplayStyleSetting, self->super._remoteNotificationsSetting, self->super._modifiedSettings);
}

@end
