@implementation VSViewServiceRemoteViewController

- (VSViewServiceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  VSViewServiceRemoteViewController *v8;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  VSRequireMainThread();
  v10.receiver = self;
  v10.super_class = (Class)VSViewServiceRemoteViewController;
  v8 = -[VSViewServiceRemoteViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, v7, v6);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSViewServiceRemoteViewController;
  -[_UIRemoteViewController dealloc](&v3, sel_dealloc);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDF8CE0], "viewServiceInterface");
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDF8CE0], "viewServiceHostInterface");
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSViewServiceRemoteViewController;
  v4 = a3;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v6, sel_viewServiceDidTerminateWithError_, v4);
  -[VSViewServiceRemoteViewController delegate](self, "delegate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceRemoteViewController:didTerminateWithError:", self, v4);

}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (void)_presentViewController
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[VSViewServiceRemoteViewController _presentViewController]";
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v5, 0xCu);
  }

  -[VSViewServiceRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewServiceRemoteViewController:", self);

}

- (void)_dismissViewController
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[VSViewServiceRemoteViewController _dismissViewController]";
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v5, 0xCu);
  }

  -[VSViewServiceRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewServiceRemoteViewController:", self);

}

- (void)_request:(id)a3 didFinishWithResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[VSViewServiceRemoteViewController _request:didFinishWithResponse:]";
    _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v10, 0xCu);
  }

  -[VSViewServiceRemoteViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewServiceRemoteViewController:request:didFinishWithResponse:", self, v7, v6);

}

- (void)_request:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[VSViewServiceRemoteViewController _request:didFailWithError:]";
    _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v10, 0xCu);
  }

  -[VSViewServiceRemoteViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewServiceRemoteViewController:request:didFailWithError:", self, v7, v6);

}

- (void)_didChooseAdditionalProvidersForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[VSViewServiceRemoteViewController _didChooseAdditionalProvidersForRequest:]";
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  -[VSViewServiceRemoteViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewServiceRemoteViewController:didChooseAdditionalProvidersForRequest:", self, v4);

}

- (void)_didCancelRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[VSViewServiceRemoteViewController _didCancelRequest:]";
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  -[VSViewServiceRemoteViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewServiceRemoteViewController:didCancelRequest:", self, v4);

}

- (void)_didChooseProviderWithIdentifier:(id)a3 vetoHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[VSViewServiceRemoteViewController _didChooseProviderWithIdentifier:vetoHandler:]";
    _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v10, 0xCu);
  }

  -[VSViewServiceRemoteViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewServiceRemoteViewController:didSelectProviderWithIdentifier:vetoHandler:", self, v7, v6);

}

- (VSViewServiceRemoteViewControllerDelegate)delegate
{
  return (VSViewServiceRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
