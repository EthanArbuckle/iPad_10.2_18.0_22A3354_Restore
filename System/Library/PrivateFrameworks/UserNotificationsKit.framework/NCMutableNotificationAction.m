@implementation NCMutableNotificationAction

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->super._identifier;
  self->super._identifier = v4;

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->super._title;
  self->super._title = v4;

}

- (void)setIconImageName:(id)a3
{
  NSString *v4;
  NSString *iconImageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  iconImageName = self->super._iconImageName;
  self->super._iconImageName = v4;

}

- (void)setIconImageBundlePath:(id)a3
{
  NSString *v4;
  NSString *iconImageBundlePath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  iconImageBundlePath = self->super._iconImageBundlePath;
  self->super._iconImageBundlePath = v4;

}

- (void)setActivationMode:(unint64_t)a3
{
  self->super._activationMode = a3;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->super._requiresAuthentication = a3;
}

- (void)setLaunchURL:(id)a3
{
  NSURL *v4;
  NSURL *launchURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  launchURL = self->super._launchURL;
  self->super._launchURL = v4;

}

- (void)setLaunchBundleID:(id)a3
{
  NSString *v4;
  NSString *launchBundleID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  launchBundleID = self->super._launchBundleID;
  self->super._launchBundleID = v4;

}

- (void)setBehavior:(unint64_t)a3
{
  self->super._behavior = a3;
}

- (void)setBehaviorParameters:(id)a3
{
  NSDictionary *v4;
  NSDictionary *behaviorParameters;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  behaviorParameters = self->super._behaviorParameters;
  self->super._behaviorParameters = v4;

}

- (void)setActionRunner:(id)a3
{
  objc_storeStrong((id *)&self->super._actionRunner, a3);
}

- (void)setDestructiveAction:(BOOL)a3
{
  self->super._destructiveAction = a3;
}

- (void)setShouldDismissNotification:(BOOL)a3
{
  self->super._shouldDismissNotification = a3;
}

- (void)setIsSiriActionCandidate:(BOOL)a3
{
  self->super._isSiriActionCandidate = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NCNotificationAction initWithNotificationAction:]([NCNotificationAction alloc], "initWithNotificationAction:", self);
}

- (BOOL)isSiriAction
{
  return 0;
}

@end
