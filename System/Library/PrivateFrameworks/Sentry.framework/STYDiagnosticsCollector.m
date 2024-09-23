@implementation STYDiagnosticsCollector

+ (id)sharedDiagnosticsCollector
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__STYDiagnosticsCollector_sharedDiagnosticsCollector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDiagnosticsCollector_onceToken != -1)
    dispatch_once(&sharedDiagnosticsCollector_onceToken, block);
  return (id)sharedDiagnosticsCollector_sharedDiagnosticCollector;
}

void __53__STYDiagnosticsCollector_sharedDiagnosticsCollector__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  dispatch_queue_t v3;
  NSObject *v4;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDiagnosticsCollector_sharedDiagnosticCollector;
  sharedDiagnosticsCollector_sharedDiagnosticCollector = (uint64_t)v1;

  if (sharedDiagnosticsCollector_sharedDiagnosticCollector)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -15);
    v4 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_queue_create("com.apple.Sentry.Frameworking.framework.STYDiagnosticsCollector", v4);
    objc_msgSend((id)sharedDiagnosticsCollector_sharedDiagnosticCollector, "setSerialUtilityQueue:", v3);

  }
}

- (void)collectTailspinForScenarioReport:(id)a3 tailspinFileDescriptor:(int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v7;
  void (**v8)(id, _QWORD, uint64_t, id, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(id, _QWORD, uint64_t, id, void *);
  int v25;
  uint64_t v26;
  _QWORD v27[2];

  v6 = *(_QWORD *)&a4;
  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, uint64_t, id, void *))a5;
  if (fcntl(v6, 1))
  {
    v26 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("File descriptor check via fcntl failed"), &stru_1E86A0F60, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", STYDiagnosticsCollectorErrorDomain, -1001, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[STYDiagCollectorLogger sharedLogger](STYDiagCollectorLogger, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logHandle");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[STYDiagnosticsCollector collectTailspinForScenarioReport:tailspinFileDescriptor:completionHandler:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    v8[2](v8, 0, v6, v7, v12);
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __101__STYDiagnosticsCollector_collectTailspinForScenarioReport_tailspinFileDescriptor_completionHandler___block_invoke;
    v22[3] = &unk_1E86A0820;
    v24 = v8;
    v25 = v6;
    v23 = v7;
    v11 = (void *)MEMORY[0x1D17A02DC](v22);
    tailspin_dump_output();

    v12 = v24;
  }

}

void __101__STYDiagnosticsCollector_collectTailspinForScenarioReport_tailspinFileDescriptor_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Error dumping tailspin"), &stru_1E86A0F60, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", STYDiagnosticsCollectorErrorDomain, -1002, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[STYDiagCollectorLogger sharedLogger](STYDiagCollectorLogger, "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __101__STYDiagnosticsCollector_collectTailspinForScenarioReport_tailspinFileDescriptor_completionHandler___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (OS_dispatch_queue)serialUtilityQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSerialUtilityQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_serialUtilityQueue, 0);
}

- (void)collectTailspinForScenarioReport:(uint64_t)a3 tailspinFileDescriptor:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB87B000, a1, a3, "Invalid file descriptor supplied for tailspin.", a5, a6, a7, a8, 0);
}

void __101__STYDiagnosticsCollector_collectTailspinForScenarioReport_tailspinFileDescriptor_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB87B000, a1, a3, "Tailspin dump failed.", a5, a6, a7, a8, 0);
}

@end
