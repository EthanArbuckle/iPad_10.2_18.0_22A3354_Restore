@implementation UNNotificationMuteAssertion

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UNNotificationMuteAssertion;
  return -[UNNotificationMuteAssertion init](&v3, sel_init);
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNNotificationMuteAssertion)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UNNotificationMuteAssertion;
  return -[UNNotificationMuteAssertion init](&v4, sel_init, a3);
}

@end
