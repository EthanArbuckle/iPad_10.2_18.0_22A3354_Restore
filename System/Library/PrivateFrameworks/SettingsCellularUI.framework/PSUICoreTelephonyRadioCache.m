@implementation PSUICoreTelephonyRadioCache

+ (id)sharedInstance
{
  if (qword_253E96FA8 != -1)
    dispatch_once(&qword_253E96FA8, &__block_literal_global_2);
  return (id)_MergedGlobals_56;
}

void __45__PSUICoreTelephonyRadioCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUICoreTelephonyRadioCache initPrivate]([PSUICoreTelephonyRadioCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_56;
  _MergedGlobals_56 = (uint64_t)v0;

}

- (id)initPrivate
{
  PSUICoreTelephonyRadioCache *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSUICoreTelephonyRadioCache;
  v2 = -[PSUICoreTelephonyRadioCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC2810]);
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("radio_queue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithQueue:", v4);

    v2 = -[PSUICoreTelephonyRadioCache initWithCoreTelephonyClient:](v2, "initWithCoreTelephonyClient:", v5);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_willEnterForeground, *MEMORY[0x24BEBE008], 0);

  }
  return v2;
}

- (PSUICoreTelephonyRadioCache)init
{
  NSObject *v2;
  uint8_t v3[16];

  -[PSUICoreTelephonyRadioCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (PSUICoreTelephonyRadioCache)initWithCoreTelephonyClient:(id)a3
{
  id v5;
  PSUICoreTelephonyRadioCache *v6;
  PSUICoreTelephonyRadioCache *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUICoreTelephonyRadioCache;
  v6 = -[PSUICoreTelephonyRadioCache init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreTelephonyClient, a3);
    -[CoreTelephonyClient setDelegate:](v7->_coreTelephonyClient, "setDelegate:", v7);
    -[PSUICoreTelephonyRadioCache setStatusFetched:](v7, "setStatusFetched:", 0);
    -[PSUICoreTelephonyRadioCache setHealthStatus:](v7, "setHealthStatus:", 0);
    -[PSUICoreTelephonyRadioCache setHealthDiagCode:](v7, "setHealthDiagCode:", -255);
  }

  return v7;
}

- (void)willEnterForeground
{
  -[PSUICoreTelephonyRadioCache setStatusFetched:](self, "setStatusFetched:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSUICoreTelephonyRadioCache;
  -[PSUICoreTelephonyRadioCache dealloc](&v4, sel_dealloc);
}

- (int)checkCellularHealthStatus
{
  PSUICoreTelephonyRadioCache *v2;
  NSObject *v3;
  int v4;
  CoreTelephonyClient *coreTelephonyClient;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  PSUICoreTelephonyRadioCache *v11;
  NSObject *v12;
  int v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (-[PSUICoreTelephonyRadioCache statusFetched](v2, "statusFetched"))
  {
    -[PSUICoreTelephonyRadioCache getLogger](v2, "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = -[PSUICoreTelephonyRadioCache healthStatus](v2, "healthStatus");
      _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "skip query and return healthStatus %d", buf, 8u);
    }

    v4 = -[PSUICoreTelephonyRadioCache healthStatus](v2, "healthStatus");
    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    coreTelephonyClient = v2->_coreTelephonyClient;
    v15 = 0;
    v6 = -[CoreTelephonyClient checkCellularDiagnosticsStatusDetails:](coreTelephonyClient, "checkCellularDiagnosticsStatusDetails:", &v15);
    v8 = v7;
    v9 = (char *)v15;
    if (v9)
    {
      -[PSUICoreTelephonyRadioCache getLogger](v2, "getLogger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_error_impl(&dword_2161C6000, v10, OS_LOG_TYPE_ERROR, "checking cellular health status error: %@", buf, 0xCu);
      }

    }
    v11 = v2;
    objc_sync_enter(v11);
    -[PSUICoreTelephonyRadioCache setStatusFetched:](v11, "setStatusFetched:", 1);
    -[PSUICoreTelephonyRadioCache setHealthDiagCode:](v11, "setHealthDiagCode:", v8);
    -[PSUICoreTelephonyRadioCache setHealthStatus:](v11, "setHealthStatus:", (v6 & 0xFFFFFFFFFFFFFFFELL) == 2);
    objc_sync_exit(v11);

    -[PSUICoreTelephonyRadioCache getLogger](v11, "getLogger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[PSUICoreTelephonyRadioCache healthStatus](v11, "healthStatus");
      *(_DWORD *)buf = 136315906;
      v17 = "-[PSUICoreTelephonyRadioCache checkCellularHealthStatus]";
      v18 = 1024;
      v19 = v13;
      v20 = 2048;
      v21 = v6;
      v22 = 2048;
      v23 = v8;
      _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s Cellular health status updated to %d [CTHealthStatus=%ld, diagCode=%ld]", buf, 0x26u);
    }

    v4 = -[PSUICoreTelephonyRadioCache healthStatus](v11, "healthStatus");
    v2 = (PSUICoreTelephonyRadioCache *)v9;
  }

  return v4;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("RadioCache"));
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (BOOL)statusFetched
{
  return self->_statusFetched;
}

- (void)setStatusFetched:(BOOL)a3
{
  self->_statusFetched = a3;
}

- (int)healthStatus
{
  return self->_healthStatus;
}

- (void)setHealthStatus:(int)a3
{
  self->_healthStatus = a3;
}

- (int64_t)healthDiagCode
{
  return self->_healthDiagCode;
}

- (void)setHealthDiagCode:(int64_t)a3
{
  self->_healthDiagCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end
