@implementation RTStarkManager_CarKit

- (RTStarkManager_CarKit)initWithDefaultsManager:(id)a3
{
  RTStarkManager_CarKit *v3;
  RTStarkManager_CarKit *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTStarkManager_CarKit;
  v3 = -[RTStarkManager initWithDefaultsManager:](&v6, sel_initWithDefaultsManager_, a3);
  v4 = v3;
  if (v3)
    -[RTStarkManager_CarKit setup](v3, "setup");
  return v4;
}

- (void)_setup
{
  void *v3;
  void *v4;
  id v5;

  -[RTStarkManager defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("StarkTrustedConnectionEstablished"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_trustedConnectionEstablished = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_onPairedVehiclesDidChange_, CFSTR("CRPairedVehiclesDidChangeNotification"), 0);

}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__RTStarkManager_CarKit_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("CRPairedVehiclesDidChangeNotification"), 0);

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  RTStarkManagerNotificationTrustedConnectionEstablished *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTStarkManager_CarKit;
  v7 = a4;
  -[RTStarkManager internalAddObserver:name:](&v11, sel_internalAddObserver_name_, v6, v7);
  +[RTNotification notificationName](RTStarkManagerNotificationTrustedConnectionEstablished, "notificationName", v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v10 = -[RTStarkManagerNotificationTrustedConnectionEstablished initWithTrustedConnectionEstablished:]([RTStarkManagerNotificationTrustedConnectionEstablished alloc], "initWithTrustedConnectionEstablished:", -[RTStarkManager_CarKit trustedConnectionEstablished](self, "trustedConnectionEstablished"));
    -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v10, v6);

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTStarkManager_CarKit;
  v5 = a4;
  -[RTStarkManager internalRemoveObserver:name:](&v7, sel_internalRemoveObserver_name_, a3, v5);
  +[RTNotification notificationName](RTStarkManagerNotificationTrustedConnectionEstablished, "notificationName", v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isEqualToString:", v6);

}

- (void)setTrustedConnectionEstablished:(BOOL)a3
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  RTStarkManagerNotificationTrustedConnectionEstablished *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_trustedConnectionEstablished != a3)
  {
    self->_trustedConnectionEstablished = a3;
    _rt_log_facility_get_os_log(RTLogFacilityStark);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_trustedConnectionEstablished)
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "trusted connection established, %@", (uint8_t *)&v9, 0xCu);
    }

    -[RTStarkManager defaultsManager](self, "defaultsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_trustedConnectionEstablished);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("StarkTrustedConnectionEstablished"));

    v8 = -[RTStarkManagerNotificationTrustedConnectionEstablished initWithTrustedConnectionEstablished:]([RTStarkManagerNotificationTrustedConnectionEstablished alloc], "initWithTrustedConnectionEstablished:", self->_trustedConnectionEstablished);
    -[RTNotifier postNotification:](self, "postNotification:", v8);

  }
}

- (CRPairedVehicleManager)pairedVehicleManager
{
  CRPairedVehicleManager *pairedVehicleManager;
  CRPairedVehicleManager *v4;
  CRPairedVehicleManager *v5;

  pairedVehicleManager = self->_pairedVehicleManager;
  if (!pairedVehicleManager)
  {
    v4 = (CRPairedVehicleManager *)objc_alloc_init(MEMORY[0x1E0D0D370]);
    v5 = self->_pairedVehicleManager;
    self->_pairedVehicleManager = v4;

    pairedVehicleManager = self->_pairedVehicleManager;
  }
  return pairedVehicleManager;
}

- (void)_updateTrustedConnectionEstablished
{
  void *v3;
  _QWORD v4[5];

  -[RTStarkManager_CarKit pairedVehicleManager](self, "pairedVehicleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__RTStarkManager_CarKit__updateTrustedConnectionEstablished__block_invoke;
  v4[3] = &unk_1E9299DA0;
  v4[4] = self;
  objc_msgSend(v3, "fetchPairedVehiclesWithCompletion:", v4);

}

- (void)onPairedVehiclesDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__RTStarkManager_CarKit_onPairedVehiclesDidChange___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_fetchConnectionStateWithHandler:(id)a3
{
  objc_class *v3;
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  uint64_t v6;
  id v7;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0D0D340];
    v4 = (void (**)(id, uint64_t, _QWORD))a3;
    v7 = (id)objc_msgSend([v3 alloc], "initAndWaitUntilSessionUpdated");
    objc_msgSend(v7, "currentSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = 1;
    else
      v6 = 2;
    v4[2](v4, v6, 0);

  }
}

- (BOOL)trustedConnectionEstablished
{
  return self->_trustedConnectionEstablished;
}

- (void)setPairedVehicleManager:(id)a3
{
  objc_storeStrong((id *)&self->_pairedVehicleManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedVehicleManager, 0);
}

@end
