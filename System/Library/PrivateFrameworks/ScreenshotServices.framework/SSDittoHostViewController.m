@implementation SSDittoHostViewController

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSDittoHostViewController;
  v3 = -[SSDittoHostViewController becomeFirstResponder](&v7, sel_becomeFirstResponder);
  if (v3)
  {
    -[SSDittoHostViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "makeKeyWindow");

  }
  return v3;
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D2D1B8);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D12360);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SSDittoHostViewController viewServiceDidTerminateWithError:].cold.1(v4, v5);

  v7.receiver = self;
  v7.super_class = (Class)SSDittoHostViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v7, sel_viewServiceDidTerminateWithError_, v4);
  -[SSDittoHostViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteViewControllerDisconnectedFromHostViewController:withError:", self, v4);

}

- (void)screenshotExperienceHasDismissed
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213892000, v3, OS_LOG_TYPE_INFO, "Received dismiss notification from service", v5, 2u);
  }

  -[SSDittoHostViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteViewControllerOfHostViewControllerHasDismissedScreenshots:", self);

}

- (void)dismissScreenshotExperience
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213892000, v3, OS_LOG_TYPE_INFO, "Notifying service to tear down screenshot experience", v5, 2u);
  }

  -[SSDittoHostViewController _serviceProxy](self, "_serviceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tearDownScreenshotExperience");

}

- (void)dismiss
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213892000, v3, OS_LOG_TYPE_INFO, "Received dismiss request from service", v5, 2u);
  }

  -[SSDittoHostViewController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, 0);

}

+ (BOOL)__shouldHostRemoteTextEffectsWindow
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SSDittoHostViewControllerDelegate)delegate
{
  return (SSDittoHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewServiceDidTerminateWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_213892000, a2, OS_LOG_TYPE_ERROR, "Service Terminated with error %@", (uint8_t *)&v4, 0xCu);

}

@end
