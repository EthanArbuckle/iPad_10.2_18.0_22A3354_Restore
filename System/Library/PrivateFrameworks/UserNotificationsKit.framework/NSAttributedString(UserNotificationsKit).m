@implementation NSAttributedString(UserNotificationsKit)

+ (id)nc_safeAttributedStringWithString:()UserNotificationsKit
{
  objc_class *v3;
  id v4;
  void *v5;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDD1458];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
