@implementation UIApplication(WFApplicationContextProvider)

- (id)notificationNameForApplicationStateEvent:()WFApplicationContextProvider applicationContext:
{
  if (a3 <= 3)
    a1 = **((id **)&unk_24E6041D8 + a3);
  return a1;
}

- (uint64_t)bundleForWFApplicationContext:()WFApplicationContextProvider
{
  return objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
}

- (id)currentUserInterfaceTypeForWFApplicationContext:()WFApplicationContextProvider
{
  return (id)*MEMORY[0x24BE19950];
}

- (uint64_t)userInterfaceStyle
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceStyle");

  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

@end
