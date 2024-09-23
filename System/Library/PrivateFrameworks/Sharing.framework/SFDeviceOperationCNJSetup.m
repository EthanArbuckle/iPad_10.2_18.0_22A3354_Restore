@implementation SFDeviceOperationCNJSetup

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFDeviceOperationCNJSetup_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceOperationCNJSetup_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = mach_absolute_time();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SFDeviceOperationCNJSetup_activate__block_invoke_2;
  v5[3] = &unk_1E482E320;
  v5[4] = v2;
  return objc_msgSend(v3, "sendRequestID:options:request:responseHandler:", CFSTR("_cnj"), 0, MEMORY[0x1E0C9AA70], v5);
}

void __37__SFDeviceOperationCNJSetup_activate__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _BYTE *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(_BYTE **)(a1 + 32);
  if (!v9[56])
  {
    if (v16)
    {
      v10 = v16;
LABEL_6:
      objc_msgSend(v9, "_complete:", v10);
      goto LABEL_7;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("done"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9 = *(_BYTE **)(a1 + 32);
      v10 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("re"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 104);
      *(_QWORD *)(v14 + 104) = v13;

    }
    objc_msgSend(*(id *)(a1 + 32), "_startClient");

  }
LABEL_7:

}

- (void)_startClient
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  SKSetupCaptiveNetworkJoinClient *v7;
  SKSetupCaptiveNetworkJoinClient *cnjClient;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = objc_alloc_init((Class)getSKDeviceClass[0]());
  -[SFSession peerDevice](self->_sfSession, "peerDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v6);

  v7 = (SKSetupCaptiveNetworkJoinClient *)objc_alloc_init((Class)getSKSetupCaptiveNetworkJoinClientClass[0]());
  cnjClient = self->_cnjClient;
  self->_cnjClient = v7;

  -[SKSetupCaptiveNetworkJoinClient setPeerDevice:](self->_cnjClient, "setPeerDevice:", v3);
  location = 0;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__SFDeviceOperationCNJSetup__startClient__block_invoke;
  v14[3] = &unk_1E4833320;
  objc_copyWeak(&v15, &location);
  -[SKSetupCaptiveNetworkJoinClient setSendDataHandler:](self->_cnjClient, "setSendDataHandler:", v14);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __41__SFDeviceOperationCNJSetup__startClient__block_invoke_2;
  v12[3] = &unk_1E4833348;
  objc_copyWeak(&v13, &location);
  -[SKSetupCaptiveNetworkJoinClient setEventHandler:](self->_cnjClient, "setEventHandler:", v12);
  -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_sfSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("A2A772B2-84C1-447A-B978-5793FF08E513"), 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SKSetupCaptiveNetworkJoinClient setPskData:](self->_cnjClient, "setPskData:", v10);
    -[SFSession registerForExternalIO:](self->_sfSession, "registerForExternalIO:", self->_cnjClient);
    -[SKSetupCaptiveNetworkJoinClient activate](self->_cnjClient, "activate");
  }
  else
  {
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationCNJSetup _complete:](self, "_complete:", v11);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __41__SFDeviceOperationCNJSetup__startClient__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "sfSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendExternalIO:", v3);

}

void __41__SFDeviceOperationCNJSetup__startClient__block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  id v4;
  id WeakRetained;
  id v6;
  id v7;

  v7 = a2;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    v6 = v7;
    LogPrintF();
  }
  v3 = objc_msgSend(v7, "eventType", v6);
  if (v3 == 20)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v7, "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_handleCompletedEventWithError:", v4);
    goto LABEL_9;
  }
  if (v3 == 200)
  {
    v4 = v7;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_handleCaptiveNetworkPresentEvent:", v4);
LABEL_9:

  }
}

- (void)showWebSheet
{
  void *v3;

  if (self->_cnjEvent)
  {
    -[SFDeviceOperationCNJSetup _showCaptiveSheet:](self, "_showCaptiveSheet:");
  }
  else if (gLogCategory_SFDeviceOperationCNJ <= 90
         && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    v3 = _Block_copy(self->_promptForConfirmationHandler);
    LogPrintF();

  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFDeviceOperationCNJSetup_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFDeviceOperationCNJSetup_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  objc_msgSend(*(id *)(a1 + 32), "handleDismissal");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "deregisterRequestID:", CFSTR("_cnjExtIO"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

- (void)_handleCaptiveNetworkPresentEvent:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (self->_promptForConfirmationHandler)
  {
    objc_storeStrong((id *)&self->_cnjEvent, a3);
    (*((void (**)(void))self->_promptForConfirmationHandler + 2))();
  }
  else
  {
    -[SFDeviceOperationCNJSetup _showCaptiveSheet:](self, "_showCaptiveSheet:", v5);
  }

}

- (void)_complete:(id)a3
{
  id v4;
  double v5;
  id completionHandler;
  id v7;

  v4 = a3;
  if (!self->_invalidateCalled && self->_completionHandler)
  {
    v7 = v4;
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricTotalSeconds = v5;
    if (v7)
    {
      if (gLogCategory_SFDeviceOperationCNJ > 60
        || gLogCategory_SFDeviceOperationCNJ == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_13;
      }
    }
    else if (gLogCategory_SFDeviceOperationCNJ > 30
           || gLogCategory_SFDeviceOperationCNJ == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_13;
    }
    LogPrintF();
LABEL_13:
    (*((void (**)(id, id))self->_completionHandler + 2))(self->_completionHandler, v7);
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    v4 = v7;
  }

}

- (void)_showCaptiveSheet:(id)a3
{
  void *v4;
  void *v5;
  WSWebSheetViewController *v6;
  WSWebSheetViewController *webSheetViewController;
  WSWebSheetViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  UIViewController *presentingViewController;
  WSWebSheetViewController *v13;
  void *v14;
  const char *v15;
  id v16;

  v16 = a3;
  if (gLogCategory_SFDeviceOperationCNJ <= 50
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    v15 = "-[SFDeviceOperationCNJSetup _showCaptiveSheet:]";
    LogPrintF();
  }
  -[UIViewController view](self->_presentingViewController, "view", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (WSWebSheetViewController *)objc_alloc_init((Class)getWSWebSheetViewControllerClass[0]());
    webSheetViewController = self->_webSheetViewController;
    self->_webSheetViewController = v6;

    v8 = self->_webSheetViewController;
    objc_msgSend(v16, "captiveURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "captiveSSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "captiveInterfaceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WSWebSheetViewController startWithURL:ssid:interface:proxyConfiguration:showCancelMenu:delegate:](v8, "startWithURL:ssid:interface:proxyConfiguration:showCancelMenu:delegate:", v9, v10, v11, 0, 0, self);

    -[WSWebSheetViewController setModalPresentationStyle:](self->_webSheetViewController, "setModalPresentationStyle:", 5);
    presentingViewController = self->_presentingViewController;
    v13 = self->_webSheetViewController;
    if (self->_isSetup)
      -[UIViewController showViewController:sender:](presentingViewController, "showViewController:sender:", v13, 0);
    else
      -[UIViewController presentViewController:animated:completion:](presentingViewController, "presentViewController:animated:completion:", v13, 1, 0);
    self->_isShowingWebSheet = 1;
  }
  else
  {
    NSErrorWithOSStatusF();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationCNJSetup _complete:](self, "_complete:", v14);

  }
}

- (void)_handleCompletedEventWithError:(id)a3
{
  id v4;
  id v5;
  int v6;
  const char *v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_isShowingWebSheet)
  {
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      v7 = "-[SFDeviceOperationCNJSetup _handleCompletedEventWithError:]";
      LogPrintF();
    }
    -[WSWebSheetViewController dismissViewController:](self->_webSheetViewController, "dismissViewController:", 0, v7);
  }
  else
  {
    v5 = v4;
    if (gLogCategory_SFDeviceOperationCNJ <= 50
      && (gLogCategory_SFDeviceOperationCNJ != -1 || (v6 = _LogCategory_Initialize(), v5 = v9, v6)))
    {
      v8 = v5;
      LogPrintF();
      -[SFDeviceOperationCNJSetup _complete:](self, "_complete:", v9, v8);
    }
    else
    {
      -[SFDeviceOperationCNJSetup _complete:](self, "_complete:", v5, v7);
    }
  }

}

- (void)handleWebNavigationWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  const char *v5;
  void (**v6)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (self->_isShowingWebSheet)
  {
    v6 = v4;
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      v5 = "-[SFDeviceOperationCNJSetup handleWebNavigationWithCompletionHandler:]";
      LogPrintF();
    }
    -[SKSetupCaptiveNetworkJoinClient postEventType:](self->_cnjClient, "postEventType:", 201, v5);
    v6[2](v6, 4);
    v4 = v6;
  }

}

- (void)handleDismissal
{
  void *v3;
  id v4;

  if (self->_isShowingWebSheet)
  {
    self->_isShowingWebSheet = 0;
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[UIViewController presentedViewController](self->_presentingViewController, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    if (self->_webSheetResult)
    {
      if (gLogCategory_SFDeviceOperationCNJ <= 30
        && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_promptForConfirmationHandler)
      {
        NSErrorWithOSStatusF();
        v4 = (id)objc_claimAutoreleasedReturnValue();
        -[SFDeviceOperationCNJSetup _complete:](self, "_complete:", v4);

      }
    }
    else
    {
      -[SFDeviceOperationCNJSetup _complete:](self, "_complete:", 0);
    }
  }
}

- (void)handleCompleteNotificationWithRedirectURLtype:(int64_t)a3 result:(int64_t)a4
{
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_webSheetResult = a4;
}

- (void)scrapeCredentialsUsingPOSTMessage:(id)a3 loginURL:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (BOOL)isSetup
{
  return self->_isSetup;
}

- (void)setIsSetup:(BOOL)a3
{
  self->_isSetup = a3;
}

- (id)promptForConfirmationHandler
{
  return self->_promptForConfirmationHandler;
}

- (void)setPromptForConfirmationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSError)reachabilityError
{
  return self->_reachabilityError;
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityError, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_promptForConfirmationHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_webSheetViewController, 0);
  objc_storeStrong((id *)&self->_cnjEvent, 0);
  objc_storeStrong((id *)&self->_cnjClient, 0);
}

@end
