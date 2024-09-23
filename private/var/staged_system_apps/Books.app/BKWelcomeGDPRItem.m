@implementation BKWelcomeGDPRItem

- (BOOL)welcomeScreenShouldShow
{
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "launchedToTest");

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)BKWelcomeGDPRItem;
  return -[BKWelcomeGDPRItem welcomeScreenShouldShow](&v6, "welcomeScreenShouldShow");
}

@end
