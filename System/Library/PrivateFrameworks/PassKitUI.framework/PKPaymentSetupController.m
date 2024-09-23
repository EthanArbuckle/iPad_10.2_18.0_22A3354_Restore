@implementation PKPaymentSetupController

+ (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0D66F08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paymentSetupFeaturesForConfiguration:completion:", v7, v6);

}

- (void)presentPaymentSetupRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  if (PKIsPad())
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v11, "interfaceOrientation"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &unk_1E3FADB10;
  }
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentPaymentSetupRequest:orientation:completion:", v6, v13, v5);

}

@end
