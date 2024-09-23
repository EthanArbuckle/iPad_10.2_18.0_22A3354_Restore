@implementation WFCaptiveContext

- (WFCaptiveContext)init
{
  WFCaptiveContext *v2;
  uint64_t v3;
  WFWebSheetViewController *webSheetViewController;
  uint64_t v5;
  void *timer;
  NSObject *v8;
  os_log_type_t v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)WFCaptiveContext;
  v2 = -[WFCaptiveContext init](&v10, sel_init);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BEC29A8]), "initWithDelegate:", v2);
  webSheetViewController = v2->_webSheetViewController;
  v2->_webSheetViewController = (WFWebSheetViewController *)v3;

  if (v2->_webSheetViewController)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v2, sel__presentationTimerFired_, 0, 0, 10.0);
    v5 = objc_claimAutoreleasedReturnValue();
    timer = v2->_timer;
    v2->_timer = (NSTimer *)v5;
  }
  else
  {
    WFLogForCategory(2uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFCaptiveContext init]";
      _os_log_impl(&dword_219FC8000, v8, v9, "%s: web sheet view controller is nil", buf, 0xCu);
    }

    timer = v2;
    v2 = 0;
  }

  return v2;
}

- (void)cancel
{
  NSObject *v3;
  os_log_type_t v4;
  void (**v5)(void);
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v6 = 136315138;
    v7 = "-[WFCaptiveContext cancel]";
    _os_log_impl(&dword_219FC8000, v3, v4, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[WFCaptiveContext completionHandler](self, "completionHandler");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

}

- (void)_presentationTimerFired:(id)a3
{
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[WFCaptiveContext readyForPresentation](self, "readyForPresentation", a3))
  {
    WFLogForCategory(2uLL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4)
    {
      v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        -[WFCaptiveContext webSheetViewController](self, "webSheetViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 136315394;
        v10 = "-[WFCaptiveContext _presentationTimerFired:]";
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_219FC8000, v6, v5, "%s: presenting view controller %@", (uint8_t *)&v9, 0x16u);

      }
    }

    -[WFCaptiveContext webSheetViewController](self, "webSheetViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCaptiveContext _readyForPresentation:](self, "_readyForPresentation:", v8);

  }
}

- (void)_readyForPresentation:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[WFCaptiveContext readyForPresentationHandler](self, "readyForPresentationHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);

  -[WFCaptiveContext timer](self, "timer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[WFCaptiveContext setTimer:](self, "setTimer:", 0);
}

- (void)webSheetViewControllerContentReadyForPresentation:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(2uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v7 = 136315394;
    v8 = "-[WFCaptiveContext webSheetViewControllerContentReadyForPresentation:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: viewController %@", (uint8_t *)&v7, 0x16u);
  }

  -[WFCaptiveContext _readyForPresentation:](self, "_readyForPresentation:", v4);
}

- (void)webSheetViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  WFLogForCategory(2uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8 = 136315394;
    v9 = "-[WFCaptiveContext webSheetViewController:didTerminateWithError:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: error %@", (uint8_t *)&v8, 0x16u);
  }

  -[WFCaptiveContext cancel](self, "cancel");
}

- (WFNetworkListRecord)network
{
  return self->network;
}

- (int64_t)requestedFields
{
  return self->requestedFields;
}

- (id)readyForPresentationHandler
{
  return self->_readyForPresentationHandler;
}

- (void)setReadyForPresentationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (WFWebSheetViewController)webSheetViewController
{
  return self->_webSheetViewController;
}

- (void)setWebSheetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_webSheetViewController, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (BOOL)readyForPresentation
{
  return self->_readyForPresentation;
}

- (void)setReadyForPresentation:(BOOL)a3
{
  self->_readyForPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_webSheetViewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_readyForPresentationHandler, 0);
  objc_storeStrong((id *)&self->network, 0);
}

@end
