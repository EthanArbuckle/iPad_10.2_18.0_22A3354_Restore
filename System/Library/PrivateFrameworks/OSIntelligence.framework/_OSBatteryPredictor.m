@implementation _OSBatteryPredictor

- (_OSBatteryPredictor)init
{
  _OSBatteryPredictor *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_OSBatteryPredictor;
  v2 = -[_OSBatteryPredictor init](&v15, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "battery");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.OSIntelligence.battery"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v5;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF8DA178);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, v2);
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __27___OSBatteryPredictor_init__block_invoke;
    v12[3] = &unk_1E7D7B878;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", v12);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __27___OSBatteryPredictor_init__block_invoke_49;
    v10[3] = &unk_1E7D7B878;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", v10);
    -[NSXPCConnection resume](v2->_connection, "resume");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)_OSBatteryPredictor;
  -[_OSBatteryPredictor dealloc](&v4, sel_dealloc);
}

+ (id)predictor
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)lowSOCPredicted
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;

  -[_OSBatteryPredictor lowSOCPredictionWithError:](self, "lowSOCPredictionWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v7 = 0;
  if (v2)
  {
    objc_msgSend(v2, "confidence");
    v5 = v4;
    objc_msgSend(v3, "confidenceThreshold");
    if (v5 > v6)
      v7 = 1;
  }

  return v7;
}

- (id)lowSOCPredictionOutput
{
  return -[_OSBatteryPredictor lowSOCPredictionWithError:](self, "lowSOCPredictionWithError:", 0);
}

- (id)lowSOCPredictionWithError:(id *)a3
{
  NSObject *log;
  _OSBatteryLowSOCPredictorOutput *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v15[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1C34CE000, log, OS_LOG_TYPE_INFO, "Requesting for low SOC prediction", v15, 2u);
  }
  v5 = objc_alloc_init(_OSBatteryLowSOCPredictorOutput);
  -[_OSBatteryLowSOCPredictorOutput setConfidence:](v5, "setConfidence:", 0.0);
  -[_OSBatteryLowSOCPredictorOutput setLowSOCPredicted:](v5, "setLowSOCPredicted:", 0);
  -[_OSBatteryLowSOCPredictorOutput setConfidence:](v5, "setConfidence:", 0.0);
  -[_OSBatteryLowSOCPredictorOutput setConfidenceThreshold:](v5, "setConfidenceThreshold:", 0.0);
  -[_OSBatteryLowSOCPredictorOutput setModelName:](v5, "setModelName:", CFSTR("NoOpModel"));
  -[_OSBatteryLowSOCPredictorOutput setModelVersion:](v5, "setModelVersion:", CFSTR("0.0"));
  v6 = self->_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[_OSBatteryPredictor lowSOCPredictionWithError:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  return v5;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)lowSOCPredictionWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C34CE000, a1, a3, "Low SOC prediction is currently unsupported!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
