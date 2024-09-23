@implementation SafeguardsClient

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  v2 = os_log_create("com.apple.computesafeguards", "safeguardsclient");
  v3 = (void *)logger;
  logger = (uint64_t)v2;

}

- (SafeguardsClient)init
{
  SafeguardsClient *v2;
  os_log_t v3;
  void *v4;
  char v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSXPCConnection *connection;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v18[16];
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location[2];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SafeguardsClient;
  v2 = -[SafeguardsClient init](&v24, sel_init);
  v3 = os_log_create("com.apple.computesafeguards", "safeguardsclient");
  v4 = (void *)logger;
  logger = (uint64_t)v3;

  if (v2)
  {
    v5 = _os_feature_enabled_impl();
    v2->_featureEnabled = v5;
    if ((v5 & 1) != 0)
    {
      v6 = xpc_user_sessions_enabled();
      if (v6)
        v7 = 0;
      else
        v7 = 4096;
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.computesafeguards.violationhandler"), v7);
      connection = v2->_connection;
      v2->_connection = (NSXPCConnection *)v8;

      v10 = v2->_connection;
      if (clientInterface_onceToken != -1)
        dispatch_once(&clientInterface_onceToken, &__block_literal_global_36);
      -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", clientInterface_interface);
      if (v6)
      {
        LODWORD(location[0]) = 0;
        xpc_user_sessions_get_foreground_uid();
        -[NSXPCConnection _xpcConnection](v2->_connection, "_xpcConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_user_session_uid();

      }
      objc_initWeak(location, v2);
      v12 = v2->_connection;
      v13 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __24__SafeguardsClient_init__block_invoke;
      v21[3] = &unk_1E4166080;
      objc_copyWeak(&v22, location);
      -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v21);
      v14 = v2->_connection;
      v19[0] = v13;
      v19[1] = 3221225472;
      v19[2] = __24__SafeguardsClient_init__block_invoke_6;
      v19[3] = &unk_1E4166080;
      objc_copyWeak(&v20, location);
      -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", v19);
      -[NSXPCConnection resume](v2->_connection, "resume");
      v15 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_19EA99000, v15, OS_LOG_TYPE_INFO, "Initialized connection", v18, 2u);
      }
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak(location);
    }
    else
    {
      v16 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19EA99000, v16, OS_LOG_TYPE_INFO, "Not setting up connection as feature is not enabled.", (uint8_t *)location, 2u);
      }
    }
  }
  return v2;
}

void __24__SafeguardsClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19EA99000, v2, OS_LOG_TYPE_INFO, "Connection to service interrupted", v3, 2u);
    }
    objc_msgSend(WeakRetained, "setInterrupted:", 1);
  }

}

void __24__SafeguardsClient_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19EA99000, v2, OS_LOG_TYPE_INFO, "Connection to service invalidated", v3, 2u);
    }
  }

}

- (void)reportExcessiveCPUUseBy:(char)a3[33] pid:(int)a4 path:(char)a5[1024] timestamp:(mach_timespec)a6 observed_cpu_nsecs:(int64_t)a7 observation_nsecs:(int64_t)a8 cpu_nsecs_allowed:(int64_t)a9 limit_window_nsecs:(int64_t)a10 flags:(unint64_t)a11
{
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *__attribute__((__org_arrdim(0,33))) v27;
  __int16 v28;
  int v29;
  __int16 v30;
  char *__attribute__((__org_arrdim(0,1024))) v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  int v37;
  __int16 v38;
  double v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (self->_featureEnabled)
  {
    v17 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
    {
      v18 = "";
      if ((a11 & 0x100000000) != 0)
        v18 = "(FATAL) ";
      *(_DWORD *)buf = 136317186;
      v25 = v18;
      v26 = 2080;
      v27 = a3;
      v30 = 2080;
      v28 = 1024;
      v29 = a4;
      v31 = a5;
      v36 = 1024;
      v32 = 2048;
      v33 = (double)a7 / 1000000000.0;
      v34 = 2048;
      v35 = (double)a8 / 1000000000.0;
      v37 = 100 * a7 / a8;
      v38 = 2048;
      v39 = (double)a9 / 1000000000.0;
      v40 = 2048;
      v41 = a10 / 0x3B9ACA00uLL;
      _os_log_impl(&dword_19EA99000, v17, OS_LOG_TYPE_INFO, "Received %sCPU usage trigger: \n  %s[%d] (%s) used %.2fs of CPU over %.2f seconds (averaging %d%%), violating a CPU usage limit of %.2fs over %lld seconds.", buf, 0x54u);
    }
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:", a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = BYTE4(a11) & 1;
    objc_msgSend(v19, "reportExcessiveCPUUseBy:pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:", v20, a4, v21, a6, a7, a8, a9, a10, v22);

  }
}

void __143__SafeguardsClient_reportExcessiveCPUUseBy_pid_path_timestamp_observed_cpu_nsecs_observation_nsecs_cpu_nsecs_allowed_limit_window_nsecs_flags___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    __143__SafeguardsClient_reportExcessiveCPUUseBy_pid_path_timestamp_observed_cpu_nsecs_observation_nsecs_cpu_nsecs_allowed_limit_window_nsecs_flags___block_invoke_cold_1((uint64_t)v2, v3);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (BOOL)featureEnabled
{
  return self->_featureEnabled;
}

- (void)setFeatureEnabled:(BOOL)a3
{
  self->_featureEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)init
{
  int v2;
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  v4[0] = 67109378;
  v4[1] = v2;
  v5 = 2080;
  v6 = xpc_strerror();
  _os_log_error_impl(&dword_19EA99000, v3, OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v4, 0x12u);

}

void __143__SafeguardsClient_reportExcessiveCPUUseBy_pid_path_timestamp_observed_cpu_nsecs_observation_nsecs_cpu_nsecs_allowed_limit_window_nsecs_flags___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19EA99000, a2, OS_LOG_TYPE_ERROR, "Failed to report violation %@", (uint8_t *)&v2, 0xCu);
}

@end
