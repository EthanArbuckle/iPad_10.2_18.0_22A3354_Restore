@implementation NCMutableNotificationSound

- (void)setSoundType:(int64_t)a3
{
  self->super._soundType = a3;
}

- (void)setSystemSoundID:(unsigned int)a3
{
  self->super._systemSoundID = a3;
}

- (void)setSoundBehavior:(unint64_t)a3
{
  self->super._soundBehavior = a3;
}

- (void)setRingtoneName:(id)a3
{
  NSString *v4;
  NSString *ringtoneName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  ringtoneName = self->super._ringtoneName;
  self->super._ringtoneName = v4;

}

- (void)setVibrationPattern:(id)a3
{
  NSDictionary *v4;
  NSDictionary *vibrationPattern;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  vibrationPattern = self->super._vibrationPattern;
  self->super._vibrationPattern = v4;

}

- (void)setRepeats:(BOOL)a3
{
  self->super._repeats = a3;
}

- (void)setMaxDuration:(double)a3
{
  self->super._maxDuration = a3;
}

- (void)setControllerAttributes:(id)a3
{
  NSDictionary *v4;
  NSDictionary *controllerAttributes;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  controllerAttributes = self->super._controllerAttributes;
  self->super._controllerAttributes = v4;

}

- (void)setAlertConfiguration:(id)a3
{
  TLAlertConfiguration *v4;
  TLAlertConfiguration *alertConfiguration;

  v4 = (TLAlertConfiguration *)objc_msgSend(a3, "copy");
  alertConfiguration = self->super._alertConfiguration;
  self->super._alertConfiguration = v4;

}

- (void)setSongPath:(id)a3
{
  NSString *v4;
  NSString *songPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  songPath = self->super._songPath;
  self->super._songPath = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NCNotificationSound initWithNotificationSound:]([NCNotificationSound alloc], "initWithNotificationSound:", self);
}

@end
