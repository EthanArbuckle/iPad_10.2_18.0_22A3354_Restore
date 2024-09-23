@implementation UIMutableUserNotificationAction

- (id)copyWithZone:(_NSZone *)a3
{
  UIUserNotificationAction *v4;
  void *v5;
  void *v6;
  UIUserNotificationActionBehavior v7;
  void *v8;
  UIUserNotificationActivationMode v9;
  _BOOL8 v10;
  UIUserNotificationAction *v11;
  uint64_t v13;

  v4 = [UIUserNotificationAction alloc];
  -[UIUserNotificationAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUserNotificationAction title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIUserNotificationAction behavior](self, "behavior");
  -[UIUserNotificationAction parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIUserNotificationAction activationMode](self, "activationMode");
  v10 = -[UIUserNotificationAction isAuthenticationRequired](self, "isAuthenticationRequired");
  LOBYTE(v13) = -[UIUserNotificationAction isDestructive](self, "isDestructive");
  v11 = -[UIUserNotificationAction initWithIdentifier:title:behavior:parameters:activationMode:isAuthenticationRequired:isDestructive:](v4, "initWithIdentifier:title:behavior:parameters:activationMode:isAuthenticationRequired:isDestructive:", v5, v6, v7, v8, v9, v10, v13);

  return v11;
}

@end
