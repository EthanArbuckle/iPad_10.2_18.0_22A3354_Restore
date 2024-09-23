@implementation WFFocusConfigurationRemoteViewController

- (void)setServiceContext:(id)a3
{
  WFFocusConfigurationHostContext *v4;
  WFFocusConfigurationHostContext *serviceContext;
  WFFocusConfigurationHostContext *v6;

  v4 = (WFFocusConfigurationHostContext *)a3;
  -[WFFocusConfigurationHostContext setFocusConfigurationDelegate:](self->_serviceContext, "setFocusConfigurationDelegate:", 0);
  serviceContext = self->_serviceContext;
  self->_serviceContext = v4;
  v6 = v4;

  -[WFFocusConfigurationHostContext setFocusConfigurationDelegate:](self->_serviceContext, "setFocusConfigurationDelegate:", self);
}

- (void)startConfigurationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__WFFocusConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke;
  v14[3] = &unk_24C5ABC18;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __85__WFFocusConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke_32;
  v12[3] = &unk_24C5ABC18;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "startConfigurationWithRequest:completion:", v9, v12);

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFFocusConfigurationLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[WFFocusConfigurationRemoteViewController viewServiceDidTerminateWithError:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_20CE0F000, v5, OS_LOG_TYPE_ERROR, "%s viewServiceDidTerminateWithError, error = %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)WFFocusConfigurationRemoteViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v6, sel_viewServiceDidTerminateWithError_, v4);

}

- (void)notifyDelegateWithConfigurationUIState:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFFocusConfigurationRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFFocusConfigurationRemoteViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "focusConfigurationRemoteViewController:configurationUIStateDidChange:", self, v7);

  }
}

- (void)notifyDelegateWithPressedButtonIdentifier:(id)a3 cellFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  char v10;
  void *v11;
  id v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  -[WFFocusConfigurationRemoteViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFFocusConfigurationRemoteViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "focusConfigurationRemoteViewController:didPressButtonWithIdentifier:cellFrame:", self, v12, x, y, width, height);

  }
}

- (void)focusConfigurationHostContext:(id)a3 configurationUIStateDidChange:(id)a4
{
  -[WFFocusConfigurationRemoteViewController notifyDelegateWithConfigurationUIState:](self, "notifyDelegateWithConfigurationUIState:", a4);
}

- (void)focusConfigurationHostContext:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5
{
  -[WFFocusConfigurationRemoteViewController notifyDelegateWithPressedButtonIdentifier:cellFrame:](self, "notifyDelegateWithPressedButtonIdentifier:cellFrame:", a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (WFFocusConfigurationRemoteViewControllerDelegate)delegate
{
  return (WFFocusConfigurationRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFFocusConfigurationHostContext)serviceContext
{
  return self->_serviceContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __85__WFFocusConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  getWFFocusConfigurationLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[WFFocusConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_20CE0F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to start configuration request with %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__WFFocusConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  getWFFocusConfigurationLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[WFFocusConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
      v14 = 2112;
      v15 = v3;
      v6 = "%s Failed to start configuration request with %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 22;
LABEL_6:
      _os_log_impl(&dword_20CE0F000, v7, v8, v6, (uint8_t *)&v12, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[WFFocusConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
    v6 = "%s Start Configuration Finished";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEBUG;
    v9 = 12;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3, v10, v11);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549B0880);
}

@end
