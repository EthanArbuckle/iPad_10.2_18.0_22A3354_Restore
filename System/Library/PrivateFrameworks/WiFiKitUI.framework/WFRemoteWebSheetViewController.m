@implementation WFRemoteWebSheetViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("WebSheetViewController"), CFSTR("com.apple.NanoWebSheet"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550D0DD8);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550D0E38);
}

- (void)viewDidLoad
{
  NSObject *v3;
  os_log_type_t v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteWebSheetViewController;
  -[WFRemoteWebSheetViewController viewDidLoad](&v5, sel_viewDidLoad);
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[WFRemoteWebSheetViewController viewDidLoad]";
    _os_log_impl(&dword_2196CC000, v3, v4, "%s", buf, 0xCu);
  }

  -[WFRemoteWebSheetViewController _setupButtonListener](self, "_setupButtonListener");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFRemoteWebSheetViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (void)webSheetViewControllerContentDidStartLoading
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v6 = 136315138;
    v7 = "-[WFRemoteWebSheetViewController webSheetViewControllerContentDidStartLoading]";
    _os_log_impl(&dword_2196CC000, v3, v4, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[WFRemoteWebSheetViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteWebSheetViewController:handleEvent:context:", self, 0, 0);

}

- (void)webSheetViewControllerContentReadyForPresentation
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v6 = 136315138;
    v7 = "-[WFRemoteWebSheetViewController webSheetViewControllerContentReadyForPresentation]";
    _os_log_impl(&dword_2196CC000, v3, v4, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[WFRemoteWebSheetViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteWebSheetViewController:handleEvent:context:", self, 1, 0);

}

- (void)webSheetViewControllerContentDidFinishLoading
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v6 = 136315138;
    v7 = "-[WFRemoteWebSheetViewController webSheetViewControllerContentDidFinishLoading]";
    _os_log_impl(&dword_2196CC000, v3, v4, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[WFRemoteWebSheetViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteWebSheetViewController:handleEvent:context:", self, 2, 0);

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  WFRemoteWebSheetViewControllerErrorContext *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v11 = 136315394;
    v12 = "-[WFRemoteWebSheetViewController viewServiceDidTerminateWithError:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: error %@", (uint8_t *)&v11, 0x16u);
  }

  if (v4)
  {
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEBEC00]))
      objc_msgSend(v4, "code");

  }
  -[WFRemoteWebSheetViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(WFRemoteWebSheetViewControllerErrorContext);
    -[WFRemoteWebSheetViewControllerErrorContext setError:](v9, "setError:", v4);
    -[WFRemoteWebSheetViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteWebSheetViewController:handleEvent:context:", self, 3, v9);

  }
}

- (WFRemoteWebSheetViewControllerDelegate)delegate
{
  return (WFRemoteWebSheetViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
