@implementation ICSystemPaperExtensionHostViewController

- (ICSystemPaperExtensionHostViewController)initWithConfiguration:(id)a3
{
  ICSystemPaperExtensionHostViewController *v3;
  ICSystemPaperExtensionHostViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSystemPaperExtensionHostViewController;
  v3 = -[_EXHostViewController initWithConfiguration:](&v6, sel_initWithConfiguration_, a3);
  v4 = v3;
  if (v3)
    -[_EXHostViewController setDelegate:](v3, "setDelegate:", v3);
  return v4;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  void *v2;
  void *v3;

  -[ICSystemPaperExtensionHostViewController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIRemoteViewController *)v3;
}

- (void)addChildViewController:(id)a3
{
  id v4;
  char isKindOfClass;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSystemPaperExtensionHostViewController;
  v4 = a3;
  -[ICSystemPaperExtensionHostViewController addChildViewController:](&v6, sel_addChildViewController_, v4);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[ICSystemPaperExtensionHostViewController _invokeAndReleaseStartHostingBlock](self, "_invokeAndReleaseStartHostingBlock", v6.receiver, v6.super_class);
}

- (void)_invokeAndReleaseStartHostingBlock
{
  void *v3;
  void (**v4)(void);

  -[ICSystemPaperExtensionHostViewController startHostingBlock](self, "startHostingBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICSystemPaperExtensionHostViewController startHostingBlock](self, "startHostingBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[ICSystemPaperExtensionHostViewController setStartHostingBlock:](self, "setStartHostingBlock:", 0);
  }
}

- (void)_finishAndNotifyDelegateWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICSystemPaperExtensionHostViewController _invokeAndReleaseStartHostingBlock](self, "_invokeAndReleaseStartHostingBlock");
  if (!-[ICSystemPaperExtensionHostViewController didFinish](self, "didFinish"))
  {
    -[ICSystemPaperExtensionHostViewController setDidFinish:](self, "setDidFinish:", 1);
    -[ICSystemPaperExtensionHostViewController presentationDelegate](self, "presentationDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[ICSystemPaperExtensionHostViewController presentationDelegate](self, "presentationDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "systemPaperDidFinishWithError:", v7);
    }
    else
    {
      -[ICSystemPaperExtensionHostViewController presentingViewController](self, "presentingViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
    }

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICSystemPaperExtensionHostViewController;
  -[_EXHostViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (!-[ICSystemPaperExtensionHostViewController didFinish](self, "didFinish"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSystemPaperExtensionHostViewController _finishAndNotifyDelegateWithError:](self, "_finishAndNotifyDelegateWithError:", v4);

  }
  -[ICSystemPaperExtensionHostViewController teardown](self, "teardown");
}

- (void)teardown
{
  void *v3;

  -[ICSystemPaperExtensionHostViewController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[ICSystemPaperExtensionHostViewController setConnection:](self, "setConnection:", 0);
  -[_EXHostViewController setConfiguration:](self, "setConfiguration:", 0);
  -[ICSystemPaperExtensionHostViewController setPresentationDelegate:](self, "setPresentationDelegate:", 0);
}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  id v28;

  v4 = a3;
  v28 = 0;
  -[_EXHostViewController makeXPCConnectionWithError:](self, "makeXPCConnectionWithError:", &v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v28;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "ic_hostInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v7);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x24BDD1990], "ic_extensionInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v8);

    objc_initWeak(&location, self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_1);
    v9 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_14;
    v25[3] = &unk_24F964250;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v5, "setInvalidationHandler:", v25);
    objc_msgSend(v5, "resume");
    -[ICSystemPaperExtensionHostViewController userActivityData](self, "userActivityData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICSystemPaperExtensionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ICSystemPaperExtensionHostViewController hostViewControllerDidActivate:].cold.2();

    objc_msgSend(v5, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_16;
    v22[3] = &unk_24F964278;
    v13 = v10;
    v23 = v13;
    v14 = v5;
    v24 = v14;
    objc_msgSend(v12, "checkInWithReply:", v22);

    -[ICSystemPaperExtensionHostViewController setConnection:](self, "setConnection:", v14);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    ICSystemPaperExtensionLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ICSystemPaperExtensionHostViewController hostViewControllerDidActivate:].cold.1((uint64_t)v6, v15, v16, v17, v18, v19, v20, v21);

  }
}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  ICSystemPaperExtensionLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22D8F4000, v0, OS_LOG_TYPE_DEFAULT, "Connection to extension interrupted", v1, 2u);
  }

}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_14(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  ICSystemPaperExtensionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D8F4000, v2, OS_LOG_TYPE_DEFAULT, "Connection to extension invalidated", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_15;
  block[3] = &unk_24F964250;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v4);
}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_15(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;

  ICSystemPaperExtensionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_16_cold_2();

  if (*(_QWORD *)(a1 + 32))
  {
    ICSystemPaperExtensionLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_16_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addUserActivityData:", *(_QWORD *)(a1 + 32));

  }
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  -[ICSystemPaperExtensionHostViewController _finishAndNotifyDelegateWithError:](self, "_finishAndNotifyDelegateWithError:", a4);
}

- (void)dismissViewControllerCancelled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  ICSystemPaperExtensionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICSystemPaperExtensionHostViewController dismissViewControllerCancelled:].cold.1();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __75__ICSystemPaperExtensionHostViewController_dismissViewControllerCancelled___block_invoke;
  v6[3] = &unk_24F9642A0;
  v7 = a3;
  v6[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
}

void __75__ICSystemPaperExtensionHostViewController_dismissViewControllerCancelled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)v2;
  objc_msgSend(*(id *)(a1 + 32), "_finishAndNotifyDelegateWithError:", v2);

}

- (void)openURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  ICSystemPaperExtensionLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICSystemPaperExtensionHostViewController openURL:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke;
  v17[3] = &unk_24F9642C8;
  v17[4] = self;
  v10 = v6;
  v18 = v10;
  v19 = v7;
  v11 = v7;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_18;
  block[3] = &unk_24F9642F0;
  v15 = v10;
  v16 = (id)MEMORY[0x22E31B578](v17);
  v12 = v16;
  v13 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  ICSystemPaperExtensionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_finishAndNotifyDelegateWithError:", 0);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_cold_2(a1, v5, v6, v7, v8, v9, v10, v11);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_18(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x24BDF74F8];
  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "canOpenURL:", *(_QWORD *)(a1 + 32)))
    return objc_msgSend(*v2, "_openURL:originatingView:completionHandler:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (id)startHostingBlock
{
  return self->_startHostingBlock;
}

- (void)setStartHostingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (ICSystemPaperPresentationDelegate)presentationDelegate
{
  return (ICSystemPaperPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong(&self->_startHostingBlock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

- (void)hostViewControllerDidActivate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22D8F4000, a2, a3, "Error creating XPC connection to extension: %{private}@", a5, a6, a7, a8, 3u);
}

- (void)hostViewControllerDidActivate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D8F4000, v0, v1, "Checking in with extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D8F4000, v0, v1, "Sending user activity data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__ICSystemPaperExtensionHostViewController_hostViewControllerDidActivate___block_invoke_16_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D8F4000, v0, v1, "Got reply from extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dismissViewControllerCancelled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D8F4000, v0, v1, "Received -dismissViewController from extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)openURL:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D8F4000, v0, v1, "Received -openURL:completion: from extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D8F4000, v0, v1, "Opened URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__ICSystemPaperExtensionHostViewController_openURL_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22D8F4000, a2, a3, "Failed to open URL: %{private}@", a5, a6, a7, a8, 3u);
}

@end
