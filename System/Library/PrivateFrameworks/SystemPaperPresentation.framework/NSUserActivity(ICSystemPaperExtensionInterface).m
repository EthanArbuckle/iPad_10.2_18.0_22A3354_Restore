@implementation NSUserActivity(ICSystemPaperExtensionInterface)

+ (id)ic_userActivityWithData:()ICSystemPaperExtensionInterface
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD1960];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "_initWithUserActivityData:", v4);

  return v5;
}

@end
