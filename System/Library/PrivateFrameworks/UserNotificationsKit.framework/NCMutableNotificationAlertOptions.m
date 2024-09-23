@implementation NCMutableNotificationAlertOptions

- (void)setSuppression:(unint64_t)a3
{
  self->super._suppression = a3;
}

- (void)setIntelligentBehavior:(unint64_t)a3
{
  self->super._intelligentBehavior = a3;
}

- (void)setReason:(unint64_t)a3
{
  self->super._reason = a3;
}

- (void)setActiveModeUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *activeModeUUID;

  v4 = (NSUUID *)objc_msgSend(a3, "copy");
  activeModeUUID = self->super._activeModeUUID;
  self->super._activeModeUUID = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NCNotificationAlertOptions initWithNotificationAlertOptions:]([NCNotificationAlertOptions alloc], "initWithNotificationAlertOptions:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NCNotificationAlertOptions initWithNotificationAlertOptions:]([NCMutableNotificationAlertOptions alloc], "initWithNotificationAlertOptions:", self);
}

@end
