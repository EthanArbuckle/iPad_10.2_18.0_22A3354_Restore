@implementation PKPaymentAuthorizationPaymentUIInterface

- (PKPaymentAuthorizationPaymentUIInterface)initWithContext:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  PKPaymentAuthorizationPaymentUIInterface *v9;
  PKPaymentAuthorizationPaymentUIInterface *v10;
  PKPaymentRequestViewInterface *v11;
  PKPaymentRequestViewInterface *paymentUIInterface;
  PKPaymentRequestViewInterface *v13;
  uint64_t v14;
  PKPaymentAuthorizationServiceProtocol *serviceDelegate;
  uint64_t v16;
  UIViewController *primaryViewController;
  PKPaymentAuthorizationPaymentUIInterface *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentAuthorizationPaymentUIInterface;
  v9 = -[PKPaymentAuthorizationPaymentUIInterface init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    -[PKPaymentAuthorizationPaymentUIInterface createPaymentUIInterfaceWithContext:configuration:](v10, "createPaymentUIInterfaceWithContext:configuration:", v7, v8);
    v11 = (PKPaymentRequestViewInterface *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v18 = 0;
      goto LABEL_6;
    }
    paymentUIInterface = v10->_paymentUIInterface;
    v10->_paymentUIInterface = v11;
    v13 = v11;

    -[PKPaymentRequestViewInterface serviceDelegate](v13, "serviceDelegate");
    v14 = objc_claimAutoreleasedReturnValue();
    serviceDelegate = v10->_serviceDelegate;
    v10->_serviceDelegate = (PKPaymentAuthorizationServiceProtocol *)v14;

    -[PKPaymentRequestViewInterface viewController](v13, "viewController");
    v16 = objc_claimAutoreleasedReturnValue();
    primaryViewController = v10->_primaryViewController;
    v10->_primaryViewController = (UIViewController *)v16;

    -[PKPaymentAuthorizationPaymentUIInterface initializePrimaryViewController](v10, "initializePrimaryViewController");
  }
  v18 = v10;
LABEL_6:

  return v18;
}

- (void)initializePrimaryViewController
{
  void *v3;
  id v4;

  -[UIViewController setModalPresentationStyle:](self->_primaryViewController, "setModalPresentationStyle:", 5);
  -[UIViewController view](self->_primaryViewController, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (id)createPaymentUIInterfaceWithContext:(id)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  PKPaymentRequestViewInterface *v8;
  void *v9;
  PKPaymentRequestViewInterface *v10;

  v6 = a4;
  -[PKPaymentAuthorizationPaymentUIInterface createPaymentUIInterfaceConfigurationWithContext:configuration:](self, "createPaymentUIInterfaceConfigurationWithContext:configuration:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PKPaymentRequestViewInterface alloc];
  objc_msgSend(v6, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentRequestViewInterface initWithConfiguration:delegate:](v8, "initWithConfiguration:delegate:", v7, v9);
  return v10;
}

- (id)createPaymentUIInterfaceConfigurationWithContext:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  PKPaymentRequestViewInterfaceConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PKPaymentRequestViewInterfaceConfiguration);
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentRequestViewInterfaceConfiguration setRequest:](v7, "setRequest:", v8);

  objc_msgSend(v6, "hostLocalizedAppName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentRequestViewInterfaceConfiguration setLocalizedApplicationName:](v7, "setLocalizedApplicationName:", v9);

  objc_msgSend(v6, "hostBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentRequestViewInterfaceConfiguration setBundleIdentifier:](v7, "setBundleIdentifier:", v10);

  objc_msgSend(v6, "hostApplicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentRequestViewInterfaceConfiguration setApplicationIdentifier:](v7, "setApplicationIdentifier:", v11);

  objc_msgSend(v6, "paymentSheetExperiment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentRequestViewInterfaceConfiguration setPaymentSheetExperiment:](v7, "setPaymentSheetExperiment:", v12);
  objc_msgSend(v5, "relevantPassID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentRequestViewInterfaceConfiguration setRelevantPassUniqueID:](v7, "setRelevantPassUniqueID:", v13);

  objc_msgSend(v5, "presenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentRequestViewInterfaceConfiguration setPresenter:](v7, "setPresenter:", v14);
  return v7;
}

- (void)willAppear
{
  -[PKPaymentAuthorizationPaymentUIInterface _startObservingLockButtonPresses](self, "_startObservingLockButtonPresses");
  -[PKPaymentRequestViewInterface performSelector:](self->_paymentUIInterface, "performSelector:", sel_start);
}

- (void)didAppear
{
  id v2;

  -[PKPaymentAuthorizationContext paymentSheetExperiment](self->_context, "paymentSheetExperiment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isAA"))
    objc_msgSend(v2, "trackExperimentExposure");

}

- (void)invalidate
{
  -[PKPaymentAuthorizationPaymentUIInterface _stopObservingLockButtonPresses](self, "_stopObservingLockButtonPresses");
  -[PKPaymentRequestViewInterface performSelector:](self->_paymentUIInterface, "performSelector:", sel_invalidate);
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentAuthorizationPaymentUIInterface _stopObservingLockButtonPresses](self, "_stopObservingLockButtonPresses");
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationPaymentUIInterface;
  -[PKPaymentAuthorizationPaymentUIInterface dealloc](&v3, sel_dealloc);
}

- (void)_startObservingLockButtonPresses
{
  BSInvalidatable *v3;
  BSInvalidatable *lockButtonObserver;
  id v5;

  if (!self->_lockButtonObserver)
  {
    objc_msgSend(MEMORY[0x1E0DAAE70], "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 2, self, 0);
    v3 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    lockButtonObserver = self->_lockButtonObserver;
    self->_lockButtonObserver = v3;

  }
}

- (void)_stopObservingLockButtonPresses
{
  BSInvalidatable *lockButtonObserver;

  -[BSInvalidatable invalidate](self->_lockButtonObserver, "invalidate");
  lockButtonObserver = self->_lockButtonObserver;
  self->_lockButtonObserver = 0;

}

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentAuthorizationPaymentUIInterface_consumeSinglePressUpForButtonKind___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __78__PKPaymentAuthorizationPaymentUIInterface_consumeSinglePressUpForButtonKind___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 134349056;
    v9 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationPaymentUIInterface (%{public}p): Dismissing due to a lock button press", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requestType");

  if (v5 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didEncounterAuthorizationEvent:", 11);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissWithReason:error:completion:", 3, 0, 0);

}

- (UIViewController)primaryViewController
{
  return self->_primaryViewController;
}

- (PKPaymentAuthorizationServiceProtocol)serviceDelegate
{
  return self->_serviceDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDelegate, 0);
  objc_storeStrong((id *)&self->_primaryViewController, 0);
  objc_storeStrong((id *)&self->_lockButtonObserver, 0);
  objc_storeStrong((id *)&self->_paymentUIInterface, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
