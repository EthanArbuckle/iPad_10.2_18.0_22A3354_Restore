@implementation SSRemoteAlertHandleProvider

- (SSRemoteAlertHandleProvider)init
{
  SSRemoteAlertHandleProvider *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSRemoteAlertHandleProvider;
  v2 = -[SSRemoteAlertHandleProvider init](&v4, sel_init);
  -[SSRemoteAlertHandleProvider prepare](v2, "prepare");
  return v2;
}

- (void)activate
{
  SBSRemoteAlertHandle *handle;

  handle = self->_handle;
  if (!handle || (-[SBSRemoteAlertHandle isValid](handle, "isValid") & 1) == 0)
  {
    -[SSRemoteAlertHandleProvider invalidate](self, "invalidate");
    -[SSRemoteAlertHandleProvider prepare](self, "prepare");
  }
  -[SBSRemoteAlertHandle activateWithContext:](self->_handle, "activateWithContext:", 0);
}

- (BOOL)isActive
{
  return -[SBSRemoteAlertHandle isActive](self->_handle, "isActive");
}

- (void)preheat
{
  SBSRemoteAlertHandle *handle;

  handle = self->_handle;
  if (!handle || (-[SBSRemoteAlertHandle isValid](handle, "isValid") & 1) == 0)
  {
    -[SSRemoteAlertHandleProvider invalidate](self, "invalidate");
    -[SSRemoteAlertHandleProvider prepare](self, "prepare");
  }
}

- (void)prepare
{
  NSObject *v3;
  SBSRemoteAlertHandle *handle;
  SBSRemoteAlertHandle *v5;
  SBSRemoteAlertHandle *v6;
  SBSRemoteAlertHandle *v7;
  uint8_t v8[16];

  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_213892000, v3, OS_LOG_TYPE_INFO, "Preparing remote alert handle", v8, 2u);
  }

  handle = self->_handle;
  if (handle)
  {
    -[SBSRemoteAlertHandle invalidate](handle, "invalidate");
    v5 = self->_handle;
    self->_handle = 0;

  }
  -[SSRemoteAlertHandleProvider screenshotServicesAlertHandle](self, "screenshotServicesAlertHandle");
  v6 = (SBSRemoteAlertHandle *)objc_claimAutoreleasedReturnValue();
  v7 = self->_handle;
  self->_handle = v6;

}

- (void)invalidate
{
  NSObject *v3;
  SBSRemoteAlertHandle *handle;
  void *v5;
  uint8_t v6[16];

  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213892000, v3, OS_LOG_TYPE_INFO, "Invalidating remote alert handle", v6, 2u);
  }

  -[SBSRemoteAlertHandle invalidate](self->_handle, "invalidate");
  handle = self->_handle;
  self->_handle = 0;

  -[SSRemoteAlertHandleProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteAlertHandleProvider:didInvalidateWithError:", self, 0);

}

- (void)_callDelegate:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SSRemoteAlertHandleProvider__callDelegate___block_invoke;
  block[3] = &unk_24D06BA10;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __45__SSRemoteAlertHandleProvider__callDelegate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v4 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213892000, v4, OS_LOG_TYPE_INFO, "Remote alert handle activated", buf, 2u);
  }

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__SSRemoteAlertHandleProvider_remoteAlertHandleDidActivate___block_invoke;
  v5[3] = &unk_24D06BE08;
  v5[4] = self;
  -[SSRemoteAlertHandleProvider _callDelegate:](self, "_callDelegate:", v5);
}

void __60__SSRemoteAlertHandleProvider_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteAlertHandleProviderDidActivate:", *(_QWORD *)(a1 + 32));

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v4 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213892000, v4, OS_LOG_TYPE_INFO, "Remote alert handle deactivated", buf, 2u);
  }

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__SSRemoteAlertHandleProvider_remoteAlertHandleDidDeactivate___block_invoke;
  v5[3] = &unk_24D06BE08;
  v5[4] = self;
  -[SSRemoteAlertHandleProvider _callDelegate:](self, "_callDelegate:", v5);
}

void __62__SSRemoteAlertHandleProvider_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteAlertHandleProviderDidDeactivate:", *(_QWORD *)(a1 + 32));

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SSRemoteAlertHandleProvider remoteAlertHandle:didInvalidateWithError:].cold.1((uint64_t)v5, v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__SSRemoteAlertHandleProvider_remoteAlertHandle_didInvalidateWithError___block_invoke;
  v8[3] = &unk_24D06BBA0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[SSRemoteAlertHandleProvider _callDelegate:](self, "_callDelegate:", v8);

}

void __72__SSRemoteAlertHandleProvider_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteAlertHandleProvider:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_screenshotServicesServiceAlertDefinition
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0AE8]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.ScreenshotServicesService"), CFSTR("SSSDittoRemoteAlertViewController"));
  objc_msgSend(v2, "setPrefersEmbeddedDisplayPresentation:", 1);
  return v2;
}

- (id)screenshotServicesAlertHandle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BEB0AF8];
  -[SSRemoteAlertHandleProvider _screenshotServicesServiceAlertDefinition](self, "_screenshotServicesServiceAlertDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lookupHandlesForDefinition:creatingIfNone:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObserver:", self);
  return v6;
}

- (SSRemoteAlertHandleProviderDelegate)delegate
{
  return (SSRemoteAlertHandleProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)remoteAlertHandle:(uint64_t)a1 didInvalidateWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_213892000, a2, OS_LOG_TYPE_ERROR, "Remote alert handle invalidated with error %@", (uint8_t *)&v2, 0xCu);
}

@end
