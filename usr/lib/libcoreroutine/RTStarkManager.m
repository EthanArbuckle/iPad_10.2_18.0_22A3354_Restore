@implementation RTStarkManager

uint64_t __30__RTStarkManager_CarKit_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

void __60__RTStarkManager_CarKit__updateTrustedConnectionEstablished__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTStarkManager_CarKit__updateTrustedConnectionEstablished__block_invoke_2;
  block[3] = &unk_1E9299D78;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

uint64_t __60__RTStarkManager_CarKit__updateTrustedConnectionEstablished__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityStark);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "error retrieving paired vehicles, %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "setTrustedConnectionEstablished:", objc_msgSend(*(id *)(a1 + 48), "count") != 0);
}

uint64_t __51__RTStarkManager_CarKit_onPairedVehiclesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTrustedConnectionEstablished");
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[RTStarkManager allocWithZone:](RTStarkManager_CarKit, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTStarkManager;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (RTStarkManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTStarkManager)initWithDefaultsManager:(id)a3
{
  id v5;
  RTStarkManager *v6;
  RTStarkManager *v7;
  RTStarkManager *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTStarkManager;
    v6 = -[RTNotifier init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_defaultsManager, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTStarkManager initWithDefaultsManager:]";
      v14 = 1024;
      v15 = 50;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityStark);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityStark);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[RTNotification notificationName](RTStarkManagerNotificationTrustedConnectionEstablished, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)fetchConnectionStateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__RTStarkManager_fetchConnectionStateWithHandler___block_invoke;
    v6[3] = &unk_1E9297650;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __50__RTStarkManager_fetchConnectionStateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchConnectionStateWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchConnectionStateWithHandler:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = *MEMORY[0x1E0CB2D50];
    v8[0] = CFSTR("Not supported on this platform.");
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = (void (**)(id, _QWORD, void *))a3;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v6);

  }
}

+ (id)connectionStateToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Connected");
  if (a3 == 2)
    return CFSTR("Disconnected");
  else
    return (id)v3;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
