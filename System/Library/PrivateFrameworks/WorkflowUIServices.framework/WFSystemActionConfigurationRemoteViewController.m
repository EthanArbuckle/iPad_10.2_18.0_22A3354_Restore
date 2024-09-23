@implementation WFSystemActionConfigurationRemoteViewController

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  getWFSystemActionConfigurationLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[WFSystemActionConfigurationRemoteViewController dealloc]";
    _os_log_impl(&dword_20CE0F000, v3, OS_LOG_TYPE_ERROR, "%s Destroying WFSystemActionConfigurationRemoteViewController", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)WFSystemActionConfigurationRemoteViewController;
  -[_UIRemoteViewController dealloc](&v4, sel_dealloc);
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
  getWFSystemActionConfigurationLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[WFSystemActionConfigurationRemoteViewController viewServiceDidTerminateWithError:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_20CE0F000, v5, OS_LOG_TYPE_ERROR, "%s viewServiceDidTerminateWithError, error = %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)WFSystemActionConfigurationRemoteViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v6, sel_viewServiceDidTerminateWithError_, v4);

}

- (void)setSelectedAction:(id)a3
{
  WFConfiguredSystemAction *v4;
  NSObject *v5;
  WFConfiguredSystemAction *selectedAction;
  WFConfiguredSystemAction *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  WFConfiguredSystemAction *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (WFConfiguredSystemAction *)a3;
  getWFSystemActionConfigurationLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[WFSystemActionConfigurationRemoteViewController setSelectedAction:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_20CE0F000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending selected action to remote view controller: %@", (uint8_t *)&v9, 0x16u);
  }

  selectedAction = self->_selectedAction;
  self->_selectedAction = v4;
  v7 = v4;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectedSystemAction:", v7);

}

- (void)didCancelSystemActionConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  WFConfiguredSystemAction *selectedAction;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFSystemActionConfigurationLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[WFSystemActionConfigurationRemoteViewController didCancelSystemActionConfiguration:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_20CE0F000, v5, OS_LOG_TYPE_DEFAULT, "%s System Action configuration finished, error = %@", (uint8_t *)&v8, 0x16u);
  }

  selectedAction = self->_selectedAction;
  self->_selectedAction = 0;

  -[WFSystemActionConfigurationRemoteViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationController:didFinishWithAction:error:", self, 0, v4);

}

- (void)didSelectSystemAction:(id)a3
{
  WFConfiguredSystemAction *v4;
  NSObject *v5;
  WFConfiguredSystemAction *selectedAction;
  WFConfiguredSystemAction *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  WFConfiguredSystemAction *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (WFConfiguredSystemAction *)a3;
  getWFSystemActionConfigurationLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[WFSystemActionConfigurationRemoteViewController didSelectSystemAction:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_20CE0F000, v5, OS_LOG_TYPE_DEFAULT, "%s System Action configuration finished, action = %@", (uint8_t *)&v9, 0x16u);
  }

  selectedAction = self->_selectedAction;
  self->_selectedAction = v4;
  v7 = v4;

  -[WFSystemActionConfigurationRemoteViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationController:didFinishWithAction:error:", self, v7, 0);

}

- (WFSystemActionConfigurationRemoteViewControllerDelegate)delegate
{
  return (WFSystemActionConfigurationRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFConfiguredSystemAction)selectedAction
{
  return self->_selectedAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C7BB8);
}

@end
