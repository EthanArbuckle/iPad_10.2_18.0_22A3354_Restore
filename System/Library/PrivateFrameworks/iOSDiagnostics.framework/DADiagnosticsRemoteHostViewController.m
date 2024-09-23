@implementation DADiagnosticsRemoteHostViewController

+ (void)requestDiagnosticsRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __101__DADiagnosticsRemoteHostViewController_requestDiagnosticsRemoteViewControllerWithConnectionHandler___block_invoke;
  v8[3] = &unk_24F53DF88;
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x22E2E9864](v8);
  if ((requestDiagnosticsRemoteViewControllerWithConnectionHandler__alreadyRequestingController & 1) == 0)
  {
    requestDiagnosticsRemoteViewControllerWithConnectionHandler__alreadyRequestingController = 1;
    v7 = (id)objc_msgSend(a1, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("DARootViewController"), CFSTR("com.apple.Diagnostics"), v6);
  }

}

uint64_t __101__DADiagnosticsRemoteHostViewController_requestDiagnosticsRemoteViewControllerWithConnectionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  requestDiagnosticsRemoteViewControllerWithConnectionHandler__alreadyRequestingController = 0;
  return result;
}

- (void)viewDidLoad
{
  DADiagnosticResponder *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DADiagnosticsRemoteHostViewController;
  -[DADiagnosticsRemoteHostViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_alloc_init(DADiagnosticResponder);
  -[DADiagnosticsRemoteHostViewController setResponder:](self, "setResponder:", v3);

  BKSDisplayBrightnessGetCurrent();
  -[DADiagnosticsRemoteHostViewController setOriginalScreenBrightness:](self, "setOriginalScreenBrightness:");
  -[DADiagnosticsRemoteHostViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdleTimerDisabled:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DADiagnosticsRemoteHostViewController;
  -[_UIRemoteViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[DADiagnosticsRemoteHostViewController _viewServiceInterface](self, "_viewServiceInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteViewControllerDidDisappear");

  -[DADiagnosticsRemoteHostViewController responder](self, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableVolumeHUD:", 1);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdleTimerDisabled:", 0);

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADiagnosticsRemoteHostViewController originalScreenBrightness](self, "originalScreenBrightness");
  objc_msgSend(v7, "setBrightness:", v8);

}

- (id)disconnect
{
  return 0;
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B67858);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B5F680);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DADiagnosticsRemoteHostViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DADiagnosticsRemoteHostViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didTerminateWithError:", v7);

  }
}

- (void)viewServiceDidFinishWithReason:(unint64_t)a3
{
  void *v4;
  char v5;
  _QWORD block[5];

  -[DADiagnosticsRemoteHostViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__DADiagnosticsRemoteHostViewController_viewServiceDidFinishWithReason___block_invoke;
    block[3] = &unk_24F53DFB0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __72__DADiagnosticsRemoteHostViewController_viewServiceDidFinishWithReason___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didTerminateWithError:", 0);

}

- (void)viewServiceDidEnableVolumeHUD:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__DADiagnosticsRemoteHostViewController_viewServiceDidEnableVolumeHUD___block_invoke;
  v3[3] = &unk_24F53DDE8;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __71__DADiagnosticsRemoteHostViewController_viewServiceDidEnableVolumeHUD___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "responder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableVolumeHUD:", *(unsigned __int8 *)(a1 + 40));

}

- (void)viewServiceDidSetScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  _QWORD v4[5];
  float v5;
  BOOL v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __85__DADiagnosticsRemoteHostViewController_viewServiceDidSetScreenToBrightness_animate___block_invoke;
  v4[3] = &unk_24F53DE10;
  v4[4] = self;
  v5 = a3;
  v6 = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
}

void __85__DADiagnosticsRemoteHostViewController_viewServiceDidSetScreenToBrightness_animate___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "responder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setScreenToBrightness:animate:", *(unsigned __int8 *)(a1 + 44), v2);

}

- (DADiagnosticsRemoteDelegate)delegate
{
  return (DADiagnosticsRemoteDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DADiagnosticResponder)responder
{
  return self->_responder;
}

- (void)setResponder:(id)a3
{
  objc_storeStrong((id *)&self->_responder, a3);
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responder, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
