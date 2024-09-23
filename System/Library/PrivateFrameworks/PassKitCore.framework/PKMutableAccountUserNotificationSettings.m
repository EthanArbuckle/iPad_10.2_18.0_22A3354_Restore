@implementation PKMutableAccountUserNotificationSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PKAccountUserNotificationSettings initWithAccountUserNotificationSettings:](+[PKAccountUserNotificationSettings allocWithZone:](PKAccountUserNotificationSettings, "allocWithZone:", a3), "initWithAccountUserNotificationSettings:", self);
}

@end
