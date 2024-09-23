@implementation UIAlertController(ICQUI)

+ (id)sheetAlertControllerWithTitle:()ICQUI message:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BEBD538];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom") != 0;

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
