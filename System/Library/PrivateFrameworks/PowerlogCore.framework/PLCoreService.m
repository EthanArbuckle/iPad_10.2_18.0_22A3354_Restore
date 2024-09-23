@implementation PLCoreService

- (PLCoreService)init
{
  PLCoreService *v2;
  uint64_t v3;
  NSMutableDictionary *services;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCoreService;
  v2 = -[PLCoreOperator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    services = v2->_services;
    v2->_services = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)startServices
{
  NSObject *v3;
  uint64_t v4;
  objc_super v5;
  uint8_t buf[16];

  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Start Powerlog Services", buf, 2u);
  }

  v4 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)PLCoreService;
  -[PLCoreOperator startOperatorsOfSuperClassType:](&v5, sel_startOperatorsOfSuperClassType_, v4);
}

- (void)startPreUnlockServices
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Start Powerlog Services for pre unlock telemetry", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLCoreService;
  -[PLCoreOperator startServicesForPreUnlockTelemetry](&v4, sel_startServicesForPreUnlockTelemetry);
}

- (NSMutableDictionary)services
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
}

@end
