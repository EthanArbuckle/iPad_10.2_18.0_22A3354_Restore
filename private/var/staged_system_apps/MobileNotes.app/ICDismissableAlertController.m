@implementation ICDismissableAlertController

+ (id)alertControllerWithTitle:(id)a3 description:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  ICActionSheetHeaderView *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  v12 = objc_alloc_init((Class)UIViewController);
  v13 = -[ICActionSheetHeaderView initWithTitle:snippet:iconImage:]([ICActionSheetHeaderView alloc], "initWithTitle:snippet:iconImage:", v10, v9, v8);

  objc_msgSend(v12, "setView:", v13);
  objc_msgSend(v11, "setContentViewController:", v12);

  return v11;
}

@end
