@implementation UIAlertController(IC)

+ (uint64_t)ic_showAlertWithTitle:()IC viewController:
{
  return objc_msgSend(a1, "ic_showAlertWithTitle:message:viewController:", a3, 0, a4);
}

+ (void)ic_showAlertWithTitle:()IC message:viewController:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v7 = a5;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v11);

  v14 = v7;
  v15 = v8;
  v12 = v8;
  v13 = v7;
  performBlockOnMainThread();

}

@end
