@implementation SignpostReaderHelper

- (id)getSignpostMetricsWithStartDate:(id)a3 withEndDate:(id)a4 processMXSignpost:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    -[SignpostReaderHelper customGetNearestMidnight](self, "customGetNearestMidnight");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x1E0C9AA70];
  if (v8 && v9)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("end_date"));
    objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("start_date"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("process_mxsignpost"));

    -[SignpostReaderHelper processSignpostWithConfig:withServiceType:](self, "processSignpostWithConfig:withServiceType:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)getSignpostSummaryWithAllowlist:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  void *v5;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0C9AA70];
  if (a3 && a4 && a5)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99E08];
    v10 = a5;
    v11 = a4;
    v12 = a3;
    v13 = objc_alloc_init(v9);
    objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("taskingAllowlist"));

    objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("taskingStartDate"));
    objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("taskingEndDate"));

    -[SignpostReaderHelper processSignpostWithConfig:withServiceType:](self, "processSignpostWithConfig:withServiceType:", v13, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)generateSignpostSubmissionWithTagConfig:(id)a3 withAllowlist:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6 includeSPFile:(BOOL)a7
{
  void *v7;
  _BOOL8 v10;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v7 = (void *)MEMORY[0x1E0C9AA70];
  if (a3 && a4 && a5 && a6)
  {
    v10 = a7;
    v13 = (objc_class *)MEMORY[0x1E0C99E08];
    v14 = a6;
    v15 = a5;
    v16 = a4;
    v17 = a3;
    v18 = objc_alloc_init(v13);
    objc_msgSend(v18, "setObject:forKey:", v16, CFSTR("taskingAllowlist"));

    objc_msgSend(v18, "setObject:forKey:", v15, CFSTR("taskingStartDate"));
    objc_msgSend(v18, "setObject:forKey:", v14, CFSTR("taskingEndDate"));

    objc_msgSend(v18, "setObject:forKey:", v17, CFSTR("taskingTagConfig"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("taskingSubmitSP"));

    -[SignpostReaderHelper processSignpostWithConfig:withServiceType:](self, "processSignpostWithConfig:withServiceType:", v18, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)generateRapidSignpostSummaryWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("start_date"));
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("end_date"));
    -[SignpostReaderHelper processSignpostWithConfig:withServiceType:](self, "processSignpostWithConfig:withServiceType:", v9, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    logHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SignpostReaderHelper generateRapidSignpostSummaryWithStartDate:endDate:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (id)generateRapidMSSWithStartDate:(id)a3 endDate:(id)a4 atPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("start_date"));
    objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("end_date"));
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("mss_filepath"));
    -[SignpostReaderHelper processSignpostWithConfig:withServiceType:](self, "processSignpostWithConfig:withServiceType:", v12, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    logHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_1DA9D6000, v14, OS_LOG_TYPE_ERROR, "Invalid arguments: startDate=%@ endDate=%@ path=%@", (uint8_t *)&v16, 0x20u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)generateTaskingMSSWithStartDate:(id)a3 endDate:(id)a4 atPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("start_date"));
    objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("end_date"));
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("mss_filepath"));
    -[SignpostReaderHelper processSignpostWithConfig:withServiceType:](self, "processSignpostWithConfig:withServiceType:", v12, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    logHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_1DA9D6000, v14, OS_LOG_TYPE_ERROR, "Invalid arguments: startDate=%@ endDate=%@ path=%@", (uint8_t *)&v16, 0x20u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)processSignpostWithConfig:(id)a3 withServiceType:(int)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t v25[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint8_t buf[8];
  __int128 v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  logHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a4;
    LOWORD(v32) = 2112;
    *(_QWORD *)((char *)&v32 + 2) = v6;
    _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_INFO, "processSignpost for service type (%d) with config %@", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostReaderHelper createXPCConnection](self, "createXPCConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v32 = buf;
  *((_QWORD *)&v32 + 1) = 0x3032000000;
  v33 = __Block_byref_object_copy__18;
  v34 = __Block_byref_object_dispose__18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 0:
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke;
      v24[3] = &unk_1EA1726F0;
      v24[4] = buf;
      objc_msgSend(v9, "submitSignpostDataWithConfig:withReply:", v6, v24);
      break;
    case 1:
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_26;
      v23[3] = &unk_1EA1726F0;
      v23[4] = buf;
      objc_msgSend(v9, "summarizeSignpostMetrics:withReply:", v6, v23);
      break;
    case 2:
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_27;
      v22[3] = &unk_1EA1726F0;
      v22[4] = buf;
      objc_msgSend(v9, "aggregateSignpostData:withReply:", v6, v22);
      break;
    case 3:
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_28;
      v21[3] = &unk_1EA1726F0;
      v21[4] = buf;
      objc_msgSend(v9, "readRawSignpostData:withReply:", v6, v21);
      break;
    case 4:
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_29;
      v20[3] = &unk_1EA1726F0;
      v20[4] = buf;
      objc_msgSend(v9, "generateMSSReportForRAPID:withReply:", v6, v20);
      break;
    case 5:
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_30;
      v19[3] = &unk_1EA1726F0;
      v19[4] = buf;
      objc_msgSend(v9, "generateMSSReportForTasking:withReply:", v6, v19);
      break;
    default:
      logHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v25 = 67109120;
        LODWORD(v26) = a4;
        _os_log_impl(&dword_1DA9D6000, v10, OS_LOG_TYPE_INFO, "Unknown service type specified: %d", v25, 8u);
      }

      break;
  }
  -[SignpostReaderHelper closeXPCConnection](self, "closeXPCConnection");
  logHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(v32 + 40);
    *(_DWORD *)v25 = 138412290;
    v26 = v12;
    _os_log_impl(&dword_1DA9D6000, v11, OS_LOG_TYPE_INFO, "The successful reply happened: %@", v25, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v8);
  v15 = v14;
  logHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v25 = 134218498;
    v26 = v15;
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1DA9D6000, v16, OS_LOG_TYPE_INFO, "Time for signpost reading to run: %f, %@, %@", v25, 0x20u);
  }

  v17 = *(id *)(v32 + 40);
  _Block_object_dispose(buf, 8);

  return v17;
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  logHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  logHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_26_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  logHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_27_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  logHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_28_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  logHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_29_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  logHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_30_cold_1();

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

  logHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_INFO, "PL establishing a connection", buf, 2u);
  }

  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.PerfPowerServicesSignpostReader"));
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F02BB668);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToServer, "setRemoteObjectInterface:", v6);

  -[NSXPCConnection setInterruptionHandler:](self->_connectionToServer, "setInterruptionHandler:", &__block_literal_global_41);
  -[NSXPCConnection setInvalidationHandler:](self->_connectionToServer, "setInvalidationHandler:", &__block_literal_global_43);
  -[NSXPCConnection resume](self->_connectionToServer, "resume");
  logHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_INFO, "spinning up xpc svc", v9, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToServer, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_46);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  logHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__SignpostReaderHelper_createXPCConnection__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke_42()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  logHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__SignpostReaderHelper_createXPCConnection__block_invoke_42_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke_44(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  logHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __43__SignpostReaderHelper_createXPCConnection__block_invoke_44_cold_1(v2, v3);

}

- (void)closeXPCConnection
{
  -[NSXPCConnection invalidate](self->_connectionToServer, "invalidate");
}

- (id)customGetNearestMidnight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 28, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

- (void)generateRapidSignpostSummaryWithStartDate:endDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1DA9D6000, v1, OS_LOG_TYPE_ERROR, "Invalid arguments: startDate=%@ endDate=%@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "submitSignpostDataWithConfig: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "summarizeSignpostMetrics: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_27_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "aggregateSignpostData : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "readRawSignpostData : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_29_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "generateMSSReportForRAPID : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__SignpostReaderHelper_processSignpostWithConfig_withServiceType___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "generateMSSReportForTasking : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, a1, a3, "Connection was interrupted.", a5, a6, a7, a8, 0);
}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke_42_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, a1, a3, "Invalid connection handler is happening.", a5, a6, a7, a8, 0);
}

void __43__SignpostReaderHelper_createXPCConnection__block_invoke_44_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_ERROR, "Connection error happened %@", v4, 0xCu);

}

@end
