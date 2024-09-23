@implementation WFWidgetConfigurationRemoteViewController

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549BF300);
}

- (void)startConfigurationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2830);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__WFWidgetConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke_32;
  v11[3] = &unk_24C5ABC18;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "startConfigurationWithRequest:completion:", v7, v11);

}

- (void)setConfigurationCardViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfigurationCardViewFrame:", x, y, width, height);

}

- (void)requestViewControllerDismissal
{
  id v2;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestViewControllerDismissal");

}

- (void)intentWasConfigured:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFWidgetConfigurationRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFWidgetConfigurationRemoteViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetConfigurationRemoteViewController:didReceiveConfiguredIntent:", self, v7);

  }
}

- (void)preferredCardSizeDidUpdate:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  char v7;
  id v8;

  height = a3.height;
  width = a3.width;
  -[WFWidgetConfigurationRemoteViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WFWidgetConfigurationRemoteViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widgetConfigurationRemoteViewController:preferredContentSizeDidChange:", self, width, height);

  }
}

- (WFWidgetConfigurationRemoteViewControllerDelegate)delegate
{
  return (WFWidgetConfigurationRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __86__WFWidgetConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke_32(uint64_t a1, void *a2)
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
  getWFWidgetConfigurationLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[WFWidgetConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
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
    v13 = "-[WFWidgetConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
    v6 = "%s Start Configuration Finished";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEBUG;
    v9 = 12;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3, v10, v11);
}

void __86__WFWidgetConfigurationRemoteViewController_startConfigurationWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  getWFWidgetConfigurationLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[WFWidgetConfigurationRemoteViewController startConfigurationWithRequest:completion:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_20CE0F000, v3, OS_LOG_TYPE_ERROR, "%s Failed to start configuration request with %@", (uint8_t *)&v4, 0x16u);
  }

}

@end
