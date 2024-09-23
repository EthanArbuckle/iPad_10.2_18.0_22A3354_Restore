@implementation NCNotificationSectionMuteAssertion

+ (id)sectionMuteAssertion
{
  return -[NCNotificationSectionMuteAssertion _init]([NCNotificationSectionMuteAssertion alloc], "_init");
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSectionMuteAssertion;
  return -[NCNotificationSectionMuteAssertion init](&v3, sel_init);
}

- (unint64_t)activeMuteAssertionLevelForThreadIdentifier:(id)a3
{
  return 2;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 31;
}

@end
