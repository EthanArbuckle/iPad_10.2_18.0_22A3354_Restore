@implementation SXSubscribeActionHandler

- (void)handleSubscribeActionOnPresenter:(id)a3 completionBlock:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a4;
  v5 = (void *)MEMORY[0x24BDF67F0];
  v6 = a3;
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Failed To Subscribe"), &stru_24D68E0F8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v8);
  objc_msgSend(v6, "presentViewController:animated:", v7, 1);

  if (v9)
    v9[2](v9, 0);

}

- (void)handleSubscribeActionOnPresenter:(id)a3 inAppPurchaseIdKey:(id)a4 completionBlock:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, _QWORD);

  v10 = (void (**)(id, _QWORD))a5;
  v6 = (void *)MEMORY[0x24BDF67F0];
  v7 = a3;
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Failed To Subscribe with specific IAP"), &stru_24D68E0F8, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v9);
  objc_msgSend(v7, "presentViewController:animated:", v8, 1);

  if (v10)
    v10[2](v10, 0);

}

@end
