@implementation RbdcConverterHelper

- (id)copyRBDCLogsToPath:(id)a3 withServiceType:(int)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("epsql_filepath"));

  -[RbdcConverterHelper processRbdc:withServiceType:](self, "processRbdc:withServiceType:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isProcessRbdcAllowed
{
  int DigitalIDAccessoryVersionInfo;
  int v3;
  NSObject *v4;
  BOOL v5;
  int v8;
  __int16 v9;

  v9 = 0;
  v8 = 0;
  IOAccessoryManagerGetServiceWithPrimaryPort();
  DigitalIDAccessoryVersionInfo = IOAccesoryManagerGetDigitalIDAccessoryVersionInfo();
  if (DigitalIDAccessoryVersionInfo)
  {
    v3 = DigitalIDAccessoryVersionInfo;
    logHandleRbdcHelper();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[RbdcConverterHelper isProcessRbdcAllowed].cold.2(v3, v4);
    v5 = 0;
  }
  else
  {
    v5 = 1;
    if (v8 <= 1u && (v8 != 1 || BYTE1(v8) == 0))
      v5 = 0;
    logHandleRbdcHelper();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[RbdcConverterHelper isProcessRbdcAllowed].cold.1((unsigned __int8 *)&v8, v4);
  }

  return v5;
}

- (id)processRbdc:(id)a3 withServiceType:(int)a4
{
  uint64_t v4;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  uint8_t v38[4];
  double v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint8_t buf[8];
  __int128 v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v4 = *(_QWORD *)&a4;
  v49 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  logHandleRbdcHelper();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v4;
    LOWORD(v45) = 2112;
    *(_QWORD *)((char *)&v45 + 2) = v34;
    _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_INFO, "processRbdc for service type (%d) with config %@", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RbdcConverterHelper createXPCConnection](self, "createXPCConnection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v45 = buf;
  *((_QWORD *)&v45 + 1) = 0x3032000000;
  v46 = __Block_byref_object_copy__17;
  v47 = __Block_byref_object_dispose__17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v4 == 1)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_13;
    v36[3] = &unk_1E6A53D60;
    v36[4] = buf;
    objc_msgSend(v32, "getHeatmapData:withReply:", v34, v36);
  }
  else if ((_DWORD)v4)
  {
    logHandleRbdcHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v38 = 67109120;
      LODWORD(v39) = v4;
      _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_INFO, "Unknown service type specified: %d", v38, 8u);
    }

  }
  else
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke;
    v37[3] = &unk_1E6A53D60;
    v37[4] = buf;
    objc_msgSend(v32, "getRbdcData:withReply:", v34, v37);
  }
  -[RbdcConverterHelper closeXPCConnection](self, "closeXPCConnection");
  logHandleRbdcHelper();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(double *)(v45 + 40);
    *(_DWORD *)v38 = 138412290;
    v39 = v9;
    _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_INFO, "RBDC reply received: result=%@", v38, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v33);
  v12 = v11;
  logHandleRbdcHelper();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v38 = 134218498;
    v39 = v12;
    v40 = 2112;
    v41 = v33;
    v42 = 2112;
    v43 = v10;
    _os_log_impl(&dword_1B6AB6000, v13, OS_LOG_TYPE_INFO, "Time for RBDC processing to run: %f, %@, %@", v38, 0x20u);
  }

  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("epsql_filepath"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v15, "attributesOfItemAtPath:error:", v14, &v35);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v35;

  if (v17)
  {
    logHandleRbdcHelper();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[RbdcConverterHelper processRbdc:withServiceType:].cold.2();

    v19 = 0;
  }
  else
  {
    v19 = objc_msgSend(v16, "fileSize");
  }
  +[PLUtilities deviceBootTime](PLUtilities, "deviceBootTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceDate:", v20);
  v23 = v22;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("serviceType"));

  objc_msgSend(*(id *)(v45 + 40), "objectForKeyedSubscript:", CFSTR("rbdcStatus"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("rbdcStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("rbdcDurationInSeconds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("uptimeInSeconds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("fileSizeInBytes"));

  logHandleRbdcHelper();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    -[RbdcConverterHelper processRbdc:withServiceType:].cold.1();

  _Block_object_dispose(buf, 8);
  return v24;
}

void __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  logHandleRbdcHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  logHandleRbdcHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_13_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (id)createXPCConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connectionToServer;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  logHandleRbdcHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_INFO, "PL establishing a connection", buf, 2u);
  }

  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.rbdcConverter"));
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF15EF18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToServer, "setRemoteObjectInterface:", v6);

  -[NSXPCConnection setInterruptionHandler:](self->_connectionToServer, "setInterruptionHandler:", &__block_literal_global_33);
  -[NSXPCConnection setInvalidationHandler:](self->_connectionToServer, "setInvalidationHandler:", &__block_literal_global_35_0);
  -[NSXPCConnection resume](self->_connectionToServer, "resume");
  logHandleRbdcHelper();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_INFO, "spinning up xpc svc", v9, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToServer, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_38_0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __42__RbdcConverterHelper_createXPCConnection__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  logHandleRbdcHelper();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __42__RbdcConverterHelper_createXPCConnection__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __42__RbdcConverterHelper_createXPCConnection__block_invoke_34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  logHandleRbdcHelper();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __42__RbdcConverterHelper_createXPCConnection__block_invoke_34_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __42__RbdcConverterHelper_createXPCConnection__block_invoke_36(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  logHandleRbdcHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__RbdcConverterHelper_createXPCConnection__block_invoke_36_cold_1(v2, v3);

}

- (void)closeXPCConnection
{
  -[NSXPCConnection suspend](self->_connectionToServer, "suspend");
  -[NSXPCConnection invalidate](self->_connectionToServer, "invalidate");
}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionToServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToServer, 0);
}

- (void)isProcessRbdcAllowed
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "GetVersionInfo failed with status %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

- (void)processRbdc:withServiceType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "RBDC metrics: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)processRbdc:withServiceType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, v0, v1, "Failed to get EPSQL file attributes with error %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "getRbdcDataWithReply: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __51__RbdcConverterHelper_processRbdc_withServiceType___block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "getHeatmapDataWithReply: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __42__RbdcConverterHelper_createXPCConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, a1, a3, "Connection was interrupted.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __42__RbdcConverterHelper_createXPCConnection__block_invoke_34_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, a1, a3, "Invalid connection handler is happening.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __42__RbdcConverterHelper_createXPCConnection__block_invoke_36_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, a2, v4, "Connection error happened %@", v5);

}

@end
