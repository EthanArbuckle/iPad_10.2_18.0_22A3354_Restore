@implementation WFWebSheetViewController

- (WFWebSheetViewController)initWithDelegate:(id)a3
{
  id v4;
  WFWebSheetViewController *v5;
  WFWebSheetViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFWebSheetViewController;
  v5 = -[WFWebSheetViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[WFWebSheetViewController _requestRemoteViewController](v6, "_requestRemoteViewController");
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  -[WFWebSheetViewController cancelServiceInvocation](self, "cancelServiceInvocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFWebSheetViewController cancelServiceInvocation](self, "cancelServiceInvocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "invoke");

  }
  v6.receiver = self;
  v6.super_class = (Class)WFWebSheetViewController;
  -[WFWebSheetViewController dealloc](&v6, sel_dealloc);
}

- (void)_requestRemoteViewController
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__WFWebSheetViewController__requestRemoteViewController__block_invoke;
  v4[3] = &unk_24DB38150;
  v4[4] = self;
  +[WFRemoteWebSheetViewController requestViewControllerWithConnectionHandler:](WFRemoteWebSheetViewController, "requestViewControllerWithConnectionHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebSheetViewController setCancelServiceInvocation:](self, "setCancelServiceInvocation:", v3);

}

void __56__WFWebSheetViewController__requestRemoteViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[WFWebSheetViewController _requestRemoteViewController]_block_invoke";
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2196CC000, v7, v8, "%s: vc %@ error %@", buf, 0x20u);
  }

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v5);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "remoteViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v9);

    objc_msgSend(*(id *)(a1 + 32), "_showRemoteViewController");
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD1398];
    v15 = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi"), 100, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_finishSetupWithError:", v13);
  }

}

- (void)_finishSetupWithError:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v12 = 136315394;
    v13 = "-[WFWebSheetViewController _finishSetupWithError:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: error %@", (uint8_t *)&v12, 0x16u);
  }

  -[WFWebSheetViewController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WFWebSheetViewController _endDelayingPresentation](self, "_endDelayingPresentation");
  -[WFWebSheetViewController remoteViewController](self, "remoteViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebSheetViewController removeChildViewController:](self, "removeChildViewController:", v8);

  -[WFWebSheetViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
  -[WFWebSheetViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFWebSheetViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "webSheetViewController:didTerminateWithError:", self, v4);

  }
}

- (void)_showRemoteViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[WFWebSheetViewController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebSheetViewController addChildViewController:](self, "addChildViewController:", v3);

  -[WFWebSheetViewController remoteViewController](self, "remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[WFWebSheetViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v8);

  -[WFWebSheetViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v8, "setFrame:");

  -[WFWebSheetViewController remoteViewController](self, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didMoveToParentViewController:", self);

}

- (void)webSheetViewControllerServiceShouldTerminate
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v9 = 136315138;
    v10 = "-[WFWebSheetViewController webSheetViewControllerServiceShouldTerminate]";
    _os_log_impl(&dword_2196CC000, v3, v4, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[WFWebSheetViewController cancelServiceInvocation](self, "cancelServiceInvocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "invoke");

  -[WFWebSheetViewController remoteViewController](self, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "disconnect");

}

- (void)remoteWebSheetViewController:(id)a3 handleEvent:(unint64_t)a4 context:(id)a5
{
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  int v24;
  const char *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  WFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
  {
    v24 = 136315650;
    v25 = "-[WFWebSheetViewController remoteWebSheetViewController:handleEvent:context:]";
    v26 = 2048;
    v27 = a4;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_2196CC000, v8, v9, "%s: event %lu context %@", (uint8_t *)&v24, 0x20u);
  }

  switch(a4)
  {
    case 0uLL:
      -[WFWebSheetViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        -[WFWebSheetViewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "webSheetViewControllerContentDidFinishLoading:", self);
        goto LABEL_18;
      }
      break;
    case 1uLL:
      -[WFWebSheetViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        -[WFWebSheetViewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "webSheetViewControllerContentReadyForPresentation:", self);
        goto LABEL_18;
      }
      break;
    case 2uLL:
      -[WFWebSheetViewController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[WFWebSheetViewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "webSheetViewControllerContentDidStartLoading:", self);
        goto LABEL_18;
      }
      break;
    case 3uLL:
      if (v7)
      {
        objc_msgSend(v7, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      -[WFWebSheetViewController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        -[WFWebSheetViewController delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "webSheetViewController:didTerminateWithError:", self, v12);

      }
      -[WFWebSheetViewController cancelServiceInvocation](self, "cancelServiceInvocation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v20, "invoke");

      -[WFWebSheetViewController remoteViewController](self, "remoteViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (id)objc_msgSend(v22, "disconnect");

LABEL_18:
      break;
    default:
      break;
  }

}

- (BOOL)wantsModalPresentation
{
  return 1;
}

- (_UIAsyncInvocation)cancelServiceInvocation
{
  return self->_cancelServiceInvocation;
}

- (void)setCancelServiceInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_cancelServiceInvocation, a3);
}

- (WFRemoteWebSheetViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (WFWebSheetViewControllerDelegate)delegate
{
  return (WFWebSheetViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelServiceInvocation, 0);
}

@end
