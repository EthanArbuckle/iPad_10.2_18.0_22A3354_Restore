@implementation RTWalletManager

- (void)onDefaultsUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  _QWORD v10[5];

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDefaultsManagerNotificationDefaultsChanged, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v4, "updatedKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", CFSTR("RTDefaultsWalletManagerMinimumUncertaintyThreshold"));

    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __36__RTWalletManager_onDefaultsUpdate___block_invoke;
      v10[3] = &unk_1E929FF88;
      v10[4] = self;
      -[RTWalletManager updateDoubleForKey:handler:](self, "updateDoubleForKey:handler:", CFSTR("RTDefaultsWalletManagerMinimumUncertaintyThreshold"), v10);
    }
  }

}

- (RTWalletManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTWalletManager)initWithDefaultsManager:(id)a3
{
  id v5;
  RTWalletManager *v6;
  RTWalletManager *v7;
  uint64_t v8;
  PKUsageNotificationClient *passKitClient;
  RTWalletManager *v10;
  _QWORD v12[4];
  RTWalletManager *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RTWalletManager;
  v6 = -[RTNotifier init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaultsManager, a3);
    v7->_maximumTransactionDistance = 1000.0;
    v8 = objc_opt_new();
    passKitClient = v7->_passKitClient;
    v7->_passKitClient = (PKUsageNotificationClient *)v8;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__RTWalletManager_initWithDefaultsManager___block_invoke;
    v12[3] = &unk_1E929FF88;
    v10 = v7;
    v13 = v10;
    -[RTWalletManager updateDoubleForKey:handler:](v10, "updateDoubleForKey:handler:", CFSTR("RTDefaultsWalletManagerMinimumUncertaintyThreshold"), v12);
    -[RTService setup](v10, "setup");

  }
  return v7;
}

uint64_t __43__RTWalletManager_initWithDefaultsManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMaximumTransactionDistance:");
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[RTWalletManager _unregisterForNotifications](self, "_unregisterForNotifications");
  -[RTWalletManager _unregisterPassUseCallbacks](self, "_unregisterPassUseCallbacks");
  -[RTWalletManager _unregisterPaymentUseCallbacks](self, "_unregisterPaymentUseCallbacks");
  -[RTWalletManager setPassKitClient:](self, "setPassKitClient:", 0);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)_registerForNotifications
{
  RTDefaultsManager *defaultsManager;
  id v4;

  defaultsManager = self->_defaultsManager;
  +[RTNotification notificationName](RTDefaultsManagerNotificationDefaultsChanged, "notificationName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTNotifier addObserver:selector:name:](defaultsManager, "addObserver:selector:name:", self, sel_onDefaultsUpdate_, v4);

}

- (void)_unregisterForNotifications
{
  RTDefaultsManager *defaultsManager;
  id v4;

  defaultsManager = self->_defaultsManager;
  +[RTNotification notificationName](RTDefaultsManagerNotificationDefaultsChanged, "notificationName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTNotifier removeObserver:fromNotification:](defaultsManager, "removeObserver:fromNotification:", self, v4);

}

void __36__RTWalletManager_onDefaultsUpdate___block_invoke(uint64_t a1, double a2)
{
  NSObject *v4;
  _QWORD v5[6];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__RTWalletManager_onDefaultsUpdate___block_invoke_2;
  v5[3] = &unk_1E9297BF0;
  v5[4] = *(_QWORD *)(a1 + 32);
  *(double *)&v5[5] = a2;
  dispatch_async(v4, v5);

}

uint64_t __36__RTWalletManager_onDefaultsUpdate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMaximumTransactionDistance:", *(double *)(a1 + 40));
}

- (void)updateDoubleForKey:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__RTWalletManager_updateDoubleForKey_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __46__RTWalletManager_updateDoubleForKey_handler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  __n128 v6;
  __n128 v7;
  NSObject *v8;
  __n128 v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWallet);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = *(const char **)(a1 + 40);
        v10 = 138412546;
        v11 = v4;
        v12 = 2048;
        v13 = 0;
        _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "onDefaultsUpdate %@ = %f", (uint8_t *)&v10, 0x16u);
      }

      v5 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v2, "doubleValue");
      (*(void (**)(uint64_t, __n128))(v5 + 16))(v5, v6);
    }
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("RTDefaultsWalletManagerMinimumUncertaintyThreshold")))
    {
      v7.n128_u64[0] = 0x408F400000000000;
      (*(void (**)(_QWORD, __n128))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315394;
        v11 = "-[RTWalletManager updateDoubleForKey:handler:]_block_invoke";
        v12 = 1024;
        LODWORD(v13) = 166;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "missing key from update (in %s:%d)", (uint8_t *)&v10, 0x12u);
      }

      v9.n128_u64[0] = 0;
      (*(void (**)(_QWORD, __n128))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v9);
    }
  }

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTWalletManagerNotificationPassUsed, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5) == 1)
      -[RTWalletManager _registerPassUseCallbacks](self, "_registerPassUseCallbacks");
  }
  else
  {
    +[RTNotification notificationName](RTWalletManagerNotificationPaymentUsed, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqualToString:", v8);

    if (v9)
    {
      if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5) == 1)
        -[RTWalletManager _registerPaymentUseCallbacks](self, "_registerPaymentUseCallbacks");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityWallet);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTWalletManagerNotificationPassUsed, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (!-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5))
      -[RTWalletManager _unregisterPassUseCallbacks](self, "_unregisterPassUseCallbacks");
  }
  else
  {
    +[RTNotification notificationName](RTWalletManagerNotificationPaymentUsed, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqualToString:", v8);

    if (v9)
    {
      if (!-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5))
        -[RTWalletManager _unregisterPaymentUseCallbacks](self, "_unregisterPaymentUseCallbacks");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityWallet);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)_registerPassUseCallbacks
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[RTWalletManager passKitClient](self, "passKitClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__RTWalletManager__registerPassUseCallbacks__block_invoke;
  v4[3] = &unk_1E929FFB0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "setPassUsageHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__RTWalletManager__registerPassUseCallbacks__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "passUsedWithTypeIdentifier:source:info:", v8, a3, v7);

}

- (void)_registerPaymentUseCallbacks
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[RTWalletManager passKitClient](self, "passKitClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__RTWalletManager__registerPaymentUseCallbacks__block_invoke;
  v4[3] = &unk_1E929FFD8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "setPaymentUsageHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__RTWalletManager__registerPaymentUseCallbacks__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "paymentMadeWithIdentifier:transactionIdentifier:info:", v9, v8, v7);

}

- (void)_unregisterPassUseCallbacks
{
  id v2;

  -[RTWalletManager passKitClient](self, "passKitClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPassUsageHandler:", 0);

}

- (void)_unregisterPaymentUseCallbacks
{
  id v2;

  -[RTWalletManager passKitClient](self, "passKitClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPaymentPassUsageHandler:", 0);

}

- (void)passUsedWithTypeIdentifier:(id)a3 source:(int64_t)a4 info:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__RTWalletManager_passUsedWithTypeIdentifier_source_info___block_invoke;
  v13[3] = &unk_1E9298238;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __58__RTWalletManager_passUsedWithTypeIdentifier_source_info___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_passUsedWithTypeIdentifier:source:info:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_passUsedWithTypeIdentifier:(id)a3 source:(int64_t)a4 info:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  RTWalletManagerNotificationPassUsed *v12;
  int v13;
  id v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _rt_log_facility_get_os_log(RTLogFacilityWallet);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v13 = 138412802;
    v14 = v8;
    v15 = 2048;
    v16 = a4;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "pass used with identifier, %@, source, %ld, pass info, %@", (uint8_t *)&v13, 0x20u);
  }

  v11 = objc_msgSend((id)objc_opt_class(), "passUseSourceFromUsageNotificationSource:", a4);
  if (v11)
  {
    v12 = -[RTWalletManagerNotificationPassUsed initWithPassTypeIdentifier:source:info:]([RTWalletManagerNotificationPassUsed alloc], "initWithPassTypeIdentifier:source:info:", v8, v11, v9);
    -[RTNotifier postNotification:](self, "postNotification:", v12);

  }
}

- (void)paymentMadeWithIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__RTWalletManager_paymentMadeWithIdentifier_transactionIdentifier_info___block_invoke;
  v15[3] = &unk_1E929E650;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __72__RTWalletManager_paymentMadeWithIdentifier_transactionIdentifier_info___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paymentMadeWithIdentifier:transactionIdentifier:info:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_paymentMadeWithIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  RTWalletManagerNotificationPaymentUsed *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _rt_log_facility_get_os_log(RTLogFacilityWallet);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v16 = 138412802;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "payment made with identifier, %@, transaction identifier, %@, payment info, %@", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D6BBA0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "horizontalAccuracy");
    if (v14 <= *MEMORY[0x1E0C9E4B8])
    {
      v15 = -[RTWalletManagerNotificationPaymentUsed initWithPassIdentifier:transactionIdentifier:info:]([RTWalletManagerNotificationPaymentUsed alloc], "initWithPassIdentifier:transactionIdentifier:info:", v8, v9, v10);
      -[RTNotifier postNotification:](self, "postNotification:", v15);

    }
  }

}

+ (int64_t)passUseSourceFromUsageNotificationSource:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (void)setMaximumTransactionDistance:(double)a3
{
  NSObject *v4;
  double maximumTransactionDistance;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_maximumTransactionDistance != a3)
  {
    self->_maximumTransactionDistance = a3;
    _rt_log_facility_get_os_log(RTLogFacilityWallet);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      maximumTransactionDistance = self->_maximumTransactionDistance;
      v6 = 134217984;
      v7 = maximumTransactionDistance;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "update maximum transaction distance to %f", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (double)maximumTransactionDistance
{
  return self->_maximumTransactionDistance;
}

- (PKUsageNotificationClient)passKitClient
{
  return self->_passKitClient;
}

- (void)setPassKitClient:(id)a3
{
  objc_storeStrong((id *)&self->_passKitClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passKitClient, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
