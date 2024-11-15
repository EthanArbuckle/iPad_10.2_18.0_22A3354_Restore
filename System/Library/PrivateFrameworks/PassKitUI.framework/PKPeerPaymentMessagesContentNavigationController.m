@implementation PKPeerPaymentMessagesContentNavigationController

- (PKPeerPaymentMessagesContentNavigationController)initWithMessagesAppController:(id)a3
{
  id v4;
  PKPeerPaymentMessagesContentNavigationController *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  PKPeerPaymentMessagesContentNavigationController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentMessagesContentNavigationController;
  v5 = -[PKNavigationController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      v13 = 2048;
      v14 = v5;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p>: Initialized.", buf, 0x16u);

    }
    objc_storeWeak((id *)&v5->_appController, v4);
    -[PKPeerPaymentMessagesContentNavigationController setDelegate:](v5, "setDelegate:", v5);
  }

  return v5;
}

- (void)reloadContent
{
  void *v2;
  id v3;

  -[PKPeerPaymentMessagesContentNavigationController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "reloadContent");
}

- (PKPeerPaymentMessagesContentView)contentView
{
  void *v2;
  void *v3;
  void *v4;

  -[PKPeerPaymentMessagesContentNavigationController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPeerPaymentMessagesContentView *)v4;
}

- (PKPeerPaymentMessagesAppViewController)appController
{
  return (PKPeerPaymentMessagesAppViewController *)objc_loadWeakRetained((id *)&self->_appController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appController);
}

@end
