@implementation DADiagnosticsRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  return (id)objc_msgSend(a1, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("DARootViewController"), CFSTR("com.apple.Diagnostics"), a3);
}

- (void)viewDidLoad
{
  DADiagnosticResponder *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DADiagnosticsRemoteViewController;
  -[DADiagnosticsRemoteViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_alloc_init(DADiagnosticResponder);
  -[DADiagnosticsRemoteViewController setResponder:](self, "setResponder:", v3);

  BKSDisplayBrightnessGetCurrent();
  -[DADiagnosticsRemoteViewController setOriginalScreenBrightness:](self, "setOriginalScreenBrightness:");
  -[DADiagnosticsRemoteViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdleTimerDisabled:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DADiagnosticsRemoteViewController;
  -[_UIRemoteViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[DADiagnosticsRemoteViewController _viewServiceInterface](self, "_viewServiceInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteViewControllerDidDisappear");

  -[DADiagnosticsRemoteViewController responder](self, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableVolumeHUD:", 1);

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADiagnosticsRemoteViewController originalScreenBrightness](self, "originalScreenBrightness");
  objc_msgSend(v6, "setBrightness:", v7);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdleTimerDisabled:", 0);

}

- (void)requiredSerialNumbers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DADiagnosticsRemoteViewController _viewServiceInterface](self, "_viewServiceInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteViewControllerDidSetRequiredSerialNumbers:", v4);

}

- (void)selectableSerialNumbers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DADiagnosticsRemoteViewController _viewServiceInterface](self, "_viewServiceInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteViewControllerDidSetSelectableSerialNumbers:", v4);

}

- (void)sessionToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DADiagnosticsRemoteViewController _viewServiceInterface](self, "_viewServiceInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteViewControllerDidSetSessionToken:", v4);

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
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  DiagnosticLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[DADiagnosticsRemoteViewController viewServiceDidTerminateWithError:].cold.1((uint64_t)v4, v5);

  -[DADiagnosticsRemoteViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[DADiagnosticsRemoteViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteViewController:didFinishWithReason:", self, 4);

  }
}

- (void)viewServiceDidFinishWithReason:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  DiagnosticLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[DADiagnosticsRemoteViewController _stringForReason:](self, "_stringForReason:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[DADiagnosticsRemoteViewController viewServiceDidFinishWithReason:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_22AEC1000, v5, OS_LOG_TYPE_DEFAULT, "%s reason: %@", buf, 0x16u);

  }
  -[DADiagnosticsRemoteViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__DADiagnosticsRemoteViewController_viewServiceDidFinishWithReason___block_invoke;
    v9[3] = &unk_24F53DDC0;
    v9[4] = self;
    v9[5] = a3;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);
  }
}

void __68__DADiagnosticsRemoteViewController_viewServiceDidFinishWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewController:didFinishWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)viewServiceDidEnableVolumeHUD:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  DiagnosticLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[DADiagnosticsRemoteViewController viewServiceDidEnableVolumeHUD:]";
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_22AEC1000, v5, OS_LOG_TYPE_DEFAULT, "%s enableVolumeHUD: %d", buf, 0x12u);
  }

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__DADiagnosticsRemoteViewController_viewServiceDidEnableVolumeHUD___block_invoke;
  v6[3] = &unk_24F53DDE8;
  v6[4] = self;
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
}

void __67__DADiagnosticsRemoteViewController_viewServiceDidEnableVolumeHUD___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "responder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableVolumeHUD:", *(unsigned __int8 *)(a1 + 40));

}

- (void)viewServiceDidSetScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  _QWORD v8[5];
  float v9;
  BOOL v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  DiagnosticLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[DADiagnosticsRemoteViewController viewServiceDidSetScreenToBrightness:animate:]";
    v13 = 2048;
    v14 = a3;
    v15 = 1024;
    v16 = v4;
    _os_log_impl(&dword_22AEC1000, v7, OS_LOG_TYPE_DEFAULT, "%s brightness: %f animate: %d", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__DADiagnosticsRemoteViewController_viewServiceDidSetScreenToBrightness_animate___block_invoke;
  v8[3] = &unk_24F53DE10;
  v8[4] = self;
  v9 = a3;
  v10 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);
}

void __81__DADiagnosticsRemoteViewController_viewServiceDidSetScreenToBrightness_animate___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "responder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setScreenToBrightness:animate:", *(unsigned __int8 *)(a1 + 44), v2);

}

- (void)viewServiceDidSuspend
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  DiagnosticLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[DADiagnosticsRemoteViewController viewServiceDidSuspend]";
    _os_log_impl(&dword_22AEC1000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global);
}

uint64_t __58__DADiagnosticsRemoteViewController_viewServiceDidSuspend__block_invoke()
{
  return objc_msgSend((id)*MEMORY[0x24BDF74F8], "suspend");
}

- (id)_stringForReason:(unint64_t)a3
{
  if (a3 > 8)
    return CFSTR("UnknownReason");
  else
    return off_24F53DE70[a3];
}

- (DADiagnosticsRemoteViewControllerDelegate)delegate
{
  return (DADiagnosticsRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[DADiagnosticsRemoteViewController viewServiceDidTerminateWithError:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_22AEC1000, a2, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v2, 0x16u);
}

@end
