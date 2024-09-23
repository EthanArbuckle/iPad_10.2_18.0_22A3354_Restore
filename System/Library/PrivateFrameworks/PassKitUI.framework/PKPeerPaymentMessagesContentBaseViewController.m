@implementation PKPeerPaymentMessagesContentBaseViewController

- (PKPeerPaymentMessagesContentBaseViewController)initWithMessagesAppController:(id)a3
{
  id v4;
  PKPeerPaymentMessagesContentBaseViewController *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  PKPeerPaymentMessagesContentBaseViewController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentMessagesContentBaseViewController;
  v5 = -[PKPeerPaymentMessagesContentBaseViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
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
  }

  return v5;
}

- (void)loadView
{
  PKPeerPaymentMessagesContentView *v3;
  PKPeerPaymentMessagesContentView *contentView;

  v3 = objc_alloc_init(PKPeerPaymentMessagesContentView);
  contentView = self->_contentView;
  self->_contentView = v3;

  -[PKPeerPaymentMessagesContentBaseViewController setView:](self, "setView:", self->_contentView);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesContentBaseViewController;
  -[PKPeerPaymentMessagesContentBaseViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPeerPaymentMessagesContentBaseViewController reloadContent](self, "reloadContent");
}

- (PKPeerPaymentMessagesAppViewController)appController
{
  return (PKPeerPaymentMessagesAppViewController *)objc_loadWeakRetained((id *)&self->_appController);
}

- (PKPeerPaymentMessagesContentView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_appController);
}

@end
