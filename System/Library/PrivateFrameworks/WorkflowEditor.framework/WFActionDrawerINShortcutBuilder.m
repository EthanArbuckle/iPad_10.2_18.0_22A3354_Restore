@implementation WFActionDrawerINShortcutBuilder

+ (id)createActionWithIntent:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BDDA168];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "_initWithIntent:", v6);

  objc_msgSend(MEMORY[0x24BEC3A60], "sharedRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createActionWithShortcut:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
