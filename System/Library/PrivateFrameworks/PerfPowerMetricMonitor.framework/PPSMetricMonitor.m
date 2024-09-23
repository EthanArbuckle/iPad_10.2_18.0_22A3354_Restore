@implementation PPSMetricMonitor

- (PPSMetricMonitor)initWithConfiguration:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PPSMetricMonitor *v19;
  NSObject *v20;
  NSArray *currentProcessPIDs;
  dispatch_queue_t v22;
  OS_dispatch_queue *xpcMessagingQueue;
  dispatch_queue_t v24;
  OS_dispatch_queue *delegateQueue;
  uint64_t v26;
  double v27;
  double v28;
  NSObject *v29;
  PPSMetricMonitor *v30;
  NSObject *v32;
  void *v33;
  void *v34;
  objc_super v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  PPSMetricMonitorLogHandleForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitor initWithConfiguration:delegate:error:].cold.3(v11, v12, v13, v14, v15, v16, v17, v18);

  v35.receiver = self;
  v35.super_class = (Class)PPSMetricMonitor;
  v19 = -[PPSMetricMonitor init](&v35, sel_init);
  if (!v19)
    goto LABEL_14;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v19->_delegate, v10);
  objc_storeStrong((id *)&v19->_config, a3);
  currentProcessPIDs = v19->_currentProcessPIDs;
  v19->_monitoringState = 0;
  v19->_currentProcessPIDs = 0;

  v19->_isInterrupted = 0;
  v22 = dispatch_queue_create("com.apple.PerfPowerMetricMonitor.xpcMessagingQueue", v20);
  xpcMessagingQueue = v19->_xpcMessagingQueue;
  v19->_xpcMessagingQueue = (OS_dispatch_queue *)v22;

  v24 = dispatch_queue_create("com.apple.PerfPowerMetricMonitor.delegateQueue", v20);
  delegateQueue = v19->_delegateQueue;
  v19->_delegateQueue = (OS_dispatch_queue *)v24;

  v26 = objc_msgSend(v9, "mode");
  v27 = 0.0;
  if ((unint64_t)(v26 - 1) < 3)
    goto LABEL_5;
  if (!v26)
  {
    objc_msgSend(v9, "updateInterval");
    v27 = 0.2;
    if (v28 < 0.2)
    {
      PPSMetricMonitorLogHandleForCategory(1);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[PPSMetricMonitor initWithConfiguration:delegate:error:].cold.2(v9, v29);

LABEL_5:
      objc_msgSend(v9, "setUpdateInterval:", v27);
    }
  }
  if (!objc_msgSend(v9, "updateDelegate") || (objc_opt_respondsToSelector() & 1) != 0)
  {

LABEL_14:
    v30 = v19;
    goto LABEL_15;
  }
  PPSMetricMonitorLogHandleForCategory(1);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    -[PPSMetricMonitor initWithConfiguration:delegate:error:].cold.1();

  if (a5)
  {
    v33 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FC8];
    v37[0] = CFSTR("Invalid configuration");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 0, v34);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v30 = 0;
LABEL_15:

  return v30;
}

- (BOOL)startMonitoringSystemMetricsWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[6];
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  PPSMetricMonitorLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243986000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "startMonitoringSystemMetrics", (const char *)&unk_24399707E, buf, 2u);
  }

  PPSMetricMonitorLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitor startMonitoringSystemMetricsWithError:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);

  if (-[PPSMetricMonitor monitoringState](self, "monitoringState")
    && !-[PPSMetricMonitor isInterrupted](self, "isInterrupted"))
  {
    if (a3)
    {
      PPSMetricMonitorLogHandleForCategory(1);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PPSMetricMonitor startMonitoringSystemMetricsWithError:].cold.1();

      v21 = (void *)MEMORY[0x24BDD1540];
      v32 = *MEMORY[0x24BDD0FC8];
      v33[0] = CFSTR("Already monitoring");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 7, v22);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    -[PPSMetricMonitor _resetMonitoringState](self, "_resetMonitoringState");
    -[PPSMetricMonitor connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (v15)
    {
      -[PPSMetricMonitor config](self, "config");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricMonitor _setUpXPCConnectionWithConfig:](self, "_setUpXPCConnectionWithConfig:", v16);

    }
    *(_QWORD *)buf = 0;
    v27 = buf;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = 0;
    -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke;
    v25[3] = &unk_251419B10;
    v25[4] = self;
    v25[5] = buf;
    dispatch_sync(v17, v25);

    v18 = (void *)*((_QWORD *)v27 + 5);
    v19 = v18 == 0;
    if (v18)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v18);
    }
    else
    {
      -[PPSMetricMonitor connection](self, "connection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        -[PPSMetricMonitor setMonitoringState:](self, "setMonitoringState:", 1);
    }
    _Block_object_dispose(buf, 8);

  }
  return v19;
}

void __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke_2;
  v3[3] = &unk_251419AE8;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "startMonitoringSystemMetricsWithCompletion:", v3);

}

void __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)startMonitoringSystemMetricsOnly
{
  -[PPSMetricMonitor startMonitoringSystemMetricsWithError:](self, "startMonitoringSystemMetricsWithError:", 0);
}

- (BOOL)startMonitoringProcessWithPID:(int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[6];
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v5 = *(_QWORD *)&a3;
  v31[1] = *MEMORY[0x24BDAC8D0];
  PPSMetricMonitorLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitor startMonitoringProcessWithPID:error:].cold.2(v5, v7);

  if (-[PPSMetricMonitor monitoringState](self, "monitoringState")
    && !-[PPSMetricMonitor isInterrupted](self, "isInterrupted"))
  {
    if (a4)
    {
      PPSMetricMonitorLogHandleForCategory(1);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PPSMetricMonitor startMonitoringProcessWithPID:error:].cold.1();

      v15 = (void *)MEMORY[0x24BDD1540];
      v30 = *MEMORY[0x24BDD0FC8];
      v31[0] = CFSTR("Already monitoring");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 7, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    -[PPSMetricMonitor _resetMonitoringState](self, "_resetMonitoringState");
    -[PPSMetricMonitor connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (v9)
    {
      -[PPSMetricMonitor config](self, "config");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricMonitor _setUpXPCConnectionWithConfig:](self, "_setUpXPCConnectionWithConfig:", v10);

    }
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__PPSMetricMonitor_startMonitoringProcessWithPID_error___block_invoke;
    block[3] = &unk_251419B38;
    v22 = v5;
    block[4] = self;
    block[5] = &v23;
    dispatch_sync(v11, block);

    v12 = (void *)v24[5];
    v13 = v12 == 0;
    if (v12)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      -[PPSMetricMonitor connection](self, "connection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[PPSMetricMonitor setMonitoringState:](self, "setMonitoringState:", 2);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v18;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPSMetricMonitor setCurrentProcessPIDs:](self, "setCurrentProcessPIDs:", v19);

      }
    }
    _Block_object_dispose(&v23, 8);

  }
  return v13;
}

void __56__PPSMetricMonitor_startMonitoringProcessWithPID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__PPSMetricMonitor_startMonitoringProcessWithPID_error___block_invoke_2;
  v5[3] = &unk_251419AE8;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "startMonitoringProcessesWithPID:completion:", v4, v5);

}

void __56__PPSMetricMonitor_startMonitoringProcessWithPID_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)startMonitoringProcessesWithPID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  PPSMetricMonitor *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PPSMetricMonitorLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitor startMonitoringProcessesWithPID:error:].cold.2();

  if (-[PPSMetricMonitor monitoringState](self, "monitoringState")
    && !-[PPSMetricMonitor isInterrupted](self, "isInterrupted"))
  {
    if (a4)
    {
      PPSMetricMonitorLogHandleForCategory(1);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PPSMetricMonitor startMonitoringProcessWithPID:error:].cold.1();

      v16 = (void *)MEMORY[0x24BDD1540];
      v34 = *MEMORY[0x24BDD0FC8];
      v35[0] = CFSTR("Already monitoring");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 7, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = 0;
  }
  else
  {
    -[PPSMetricMonitor _resetMonitoringState](self, "_resetMonitoringState");
    -[PPSMetricMonitor connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (v9)
    {
      -[PPSMetricMonitor config](self, "config");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricMonitor _setUpXPCConnectionWithConfig:](self, "_setUpXPCConnectionWithConfig:", v10);

    }
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __58__PPSMetricMonitor_startMonitoringProcessesWithPID_error___block_invoke;
    v24 = &unk_251419B60;
    v25 = self;
    v12 = v6;
    v26 = v12;
    v27 = &v28;
    dispatch_sync(v11, &v21);

    v13 = (void *)v29[5];
    v14 = v13 == 0;
    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
    }
    else
    {
      -[PPSMetricMonitor connection](self, "connection", v21, v22, v23, v24, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[PPSMetricMonitor setMonitoringState:](self, "setMonitoringState:", 2);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v12);
        -[PPSMetricMonitor setCurrentProcessPIDs:](self, "setCurrentProcessPIDs:", v19);

      }
    }

    _Block_object_dispose(&v28, 8);
  }

  return v14;
}

void __58__PPSMetricMonitor_startMonitoringProcessesWithPID_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__PPSMetricMonitor_startMonitoringProcessesWithPID_error___block_invoke_2;
  v4[3] = &unk_251419AE8;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "startMonitoringProcessesWithPID:completion:", v3, v4);

}

void __58__PPSMetricMonitor_startMonitoringProcessesWithPID_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)startMonitoringProcessWithName:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PPSMetricMonitorLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitor startMonitoringProcessWithName:error:].cold.2();

  if (-[PPSMetricMonitor monitoringState](self, "monitoringState")
    && !-[PPSMetricMonitor isInterrupted](self, "isInterrupted"))
  {
    if (a4)
    {
      PPSMetricMonitorLogHandleForCategory(1);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PPSMetricMonitor startMonitoringProcessWithName:error:].cold.1();

      v16 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD0FC8];
      v32[0] = CFSTR("Already monitoring");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 7, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = 0;
  }
  else
  {
    -[PPSMetricMonitor _resetMonitoringState](self, "_resetMonitoringState");
    -[PPSMetricMonitor connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (v9)
    {
      -[PPSMetricMonitor config](self, "config");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricMonitor _setUpXPCConnectionWithConfig:](self, "_setUpXPCConnectionWithConfig:", v10);

    }
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__PPSMetricMonitor_startMonitoringProcessWithName_error___block_invoke;
    block[3] = &unk_251419B60;
    block[4] = self;
    v12 = v6;
    v22 = v12;
    v23 = &v24;
    dispatch_sync(v11, block);

    v13 = (void *)v25[5];
    v14 = v13 == 0;
    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
    }
    else
    {
      -[PPSMetricMonitor connection](self, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[PPSMetricMonitor setMonitoringState:](self, "setMonitoringState:", 2);
        v30 = v12;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPSMetricMonitor setCurrentProcessNames:](self, "setCurrentProcessNames:", v19);

      }
    }

    _Block_object_dispose(&v24, 8);
  }

  return v14;
}

void __57__PPSMetricMonitor_startMonitoringProcessWithName_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__PPSMetricMonitor_startMonitoringProcessWithName_error___block_invoke_2;
  v4[3] = &unk_251419AE8;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "startMonitoringProcessWithName:completion:", v3, v4);

}

void __57__PPSMetricMonitor_startMonitoringProcessWithName_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)startMonitoringProcessesWithName:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  PPSMetricMonitor *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PPSMetricMonitorLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitor startMonitoringProcessesWithName:error:].cold.2();

  if (-[PPSMetricMonitor monitoringState](self, "monitoringState")
    && !-[PPSMetricMonitor isInterrupted](self, "isInterrupted"))
  {
    if (a4)
    {
      PPSMetricMonitorLogHandleForCategory(1);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PPSMetricMonitor startMonitoringProcessWithName:error:].cold.1();

      v16 = (void *)MEMORY[0x24BDD1540];
      v34 = *MEMORY[0x24BDD0FC8];
      v35[0] = CFSTR("Already monitoring");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 7, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = 0;
  }
  else
  {
    -[PPSMetricMonitor _resetMonitoringState](self, "_resetMonitoringState");
    -[PPSMetricMonitor connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (v9)
    {
      -[PPSMetricMonitor config](self, "config");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricMonitor _setUpXPCConnectionWithConfig:](self, "_setUpXPCConnectionWithConfig:", v10);

    }
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __59__PPSMetricMonitor_startMonitoringProcessesWithName_error___block_invoke;
    v24 = &unk_251419B60;
    v25 = self;
    v12 = v6;
    v26 = v12;
    v27 = &v28;
    dispatch_sync(v11, &v21);

    v13 = (void *)v29[5];
    v14 = v13 == 0;
    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
    }
    else
    {
      -[PPSMetricMonitor connection](self, "connection", v21, v22, v23, v24, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[PPSMetricMonitor setMonitoringState:](self, "setMonitoringState:", 2);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v12);
        -[PPSMetricMonitor setCurrentProcessNames:](self, "setCurrentProcessNames:", v19);

      }
    }

    _Block_object_dispose(&v28, 8);
  }

  return v14;
}

void __59__PPSMetricMonitor_startMonitoringProcessesWithName_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__PPSMetricMonitor_startMonitoringProcessesWithName_error___block_invoke_2;
  v4[3] = &unk_251419AE8;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "startMonitoringProcessesWithName:completion:", v3, v4);

}

void __59__PPSMetricMonitor_startMonitoringProcessesWithName_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)startMonitoringProcessesWithNames:(id)a3 PIDs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  PPSMetricMonitorLogHandleForCategory(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitor startMonitoringProcessesWithNames:PIDs:error:].cold.2();

  if (-[PPSMetricMonitor monitoringState](self, "monitoringState")
    && !-[PPSMetricMonitor isInterrupted](self, "isInterrupted"))
  {
    if (a5)
    {
      PPSMetricMonitorLogHandleForCategory(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PPSMetricMonitor startMonitoringProcessesWithNames:PIDs:error:].cold.1();

      v19 = (void *)MEMORY[0x24BDD1540];
      v34 = *MEMORY[0x24BDD0FC8];
      v35[0] = CFSTR("Already monitoring");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 7, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
  }
  else
  {
    -[PPSMetricMonitor _resetMonitoringState](self, "_resetMonitoringState");
    -[PPSMetricMonitor connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (v12)
    {
      -[PPSMetricMonitor config](self, "config");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricMonitor _setUpXPCConnectionWithConfig:](self, "_setUpXPCConnectionWithConfig:", v13);

    }
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__PPSMetricMonitor_startMonitoringProcessesWithNames_PIDs_error___block_invoke;
    block[3] = &unk_251419B88;
    block[4] = self;
    v25 = v8;
    v15 = v9;
    v26 = v15;
    v27 = &v28;
    dispatch_sync(v14, block);

    v16 = (void *)v29[5];
    v17 = v16 == 0;
    if (v16)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v16);
    }
    else
    {
      -[PPSMetricMonitor connection](self, "connection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[PPSMetricMonitor setMonitoringState:](self, "setMonitoringState:", 2);
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v15);
        -[PPSMetricMonitor setCurrentProcessPIDs:](self, "setCurrentProcessPIDs:", v22);

      }
    }

    _Block_object_dispose(&v28, 8);
  }

  return v17;
}

void __65__PPSMetricMonitor_startMonitoringProcessesWithNames_PIDs_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__PPSMetricMonitor_startMonitoringProcessesWithNames_PIDs_error___block_invoke_2;
  v5[3] = &unk_251419AE8;
  v5[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "startMonitoringProcessesWithNames:withPIDs:completion:", v3, v4, v5);

}

void __65__PPSMetricMonitor_startMonitoringProcessesWithNames_PIDs_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)collectMetricsOnDemand
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v27[6];
  _QWORD v28[5];
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  PPSMetricCollection *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  PPSMetricMonitorLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitor collectMetricsOnDemand].cold.2(v3, v4, v5, v6, v7, v8, v9, v10);

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = objc_alloc_init(PPSMetricCollection);
  v29 = 0;
  v30[0] = &v29;
  v30[1] = 0x3032000000;
  v30[2] = __Block_byref_object_copy_;
  v30[3] = __Block_byref_object_dispose_;
  v31 = 0;
  if (-[PPSMetricMonitor isInterrupted](self, "isInterrupted"))
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    v41[0] = CFSTR("Cannot collect metrics when interrupted");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 3, v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PPSMetricMonitor monitoringState](self, "monitoringState"))
      goto LABEL_8;
    v14 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FC8];
    v39 = CFSTR("Cannot collect metrics when not monitoring");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 10, v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v15 = *(void **)(v30[0] + 40);
  *(_QWORD *)(v30[0] + 40) = v13;

LABEL_8:
  if (*(_QWORD *)(v30[0] + 40))
  {
    PPSMetricMonitorLogHandleForCategory(1);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PPSMetricMonitor collectMetricsOnDemand].cold.1((uint64_t)v30, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    -[PPSMetricMonitor connection](self, "connection");
    v16 = objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __42__PPSMetricMonitor_collectMetricsOnDemand__block_invoke;
    v28[3] = &unk_251419AE8;
    v28[4] = &v29;
    -[NSObject synchronousRemoteObjectProxyWithErrorHandler:](v16, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    v27[1] = 3221225472;
    v27[2] = __42__PPSMetricMonitor_collectMetricsOnDemand__block_invoke_2;
    v27[3] = &unk_251419BB0;
    v27[4] = &v32;
    v27[5] = &v29;
    objc_msgSend(v24, "collectMetricsOnDemand:", v27);

  }
  v25 = (id)v33[5];
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v32, 8);
  return v25;
}

void __42__PPSMetricMonitor_collectMetricsOnDemand__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __42__PPSMetricMonitor_collectMetricsOnDemand__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)collectMetricsOnSnapshot:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[6];
  _QWORD v25[5];
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  PPSMetricMonitorLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = -[PPSMetricMonitor monitoringState](self, "monitoringState");
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = -[PPSMetricMonitor isInterrupted](self, "isInterrupted");
    _os_log_impl(&dword_243986000, v5, OS_LOG_TYPE_DEFAULT, "collecting snapshot, monitoringState=%ld, isInterrupted=%d", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v26 = 0;
  v27[0] = &v26;
  v27[1] = 0x3032000000;
  v27[2] = __Block_byref_object_copy_;
  v27[3] = __Block_byref_object_dispose_;
  v28 = 0;
  if (-[PPSMetricMonitor isInterrupted](self, "isInterrupted"))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    v32 = CFSTR("Cannot collect metrics when interrupted");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 3, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PPSMetricMonitor monitoringState](self, "monitoringState"))
      goto LABEL_8;
    v9 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30 = CFSTR("Cannot collect metrics when not monitoring");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 10, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = *(void **)(v27[0] + 40);
  *(_QWORD *)(v27[0] + 40) = v8;

LABEL_8:
  if (*(_QWORD *)(v27[0] + 40))
  {
    PPSMetricMonitorLogHandleForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PPSMetricMonitor collectMetricsOnSnapshot:].cold.1((uint64_t)v27, v11, v12, v13, v14, v15, v16, v17);

  }
  else
  {
    -[PPSMetricMonitor connection](self, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __45__PPSMetricMonitor_collectMetricsOnSnapshot___block_invoke;
    v25[3] = &unk_251419AE8;
    v25[4] = &v26;
    objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    v24[1] = 3221225472;
    v24[2] = __45__PPSMetricMonitor_collectMetricsOnSnapshot___block_invoke_2;
    v24[3] = &unk_251419BB0;
    v24[4] = buf;
    v24[5] = &v26;
    objc_msgSend(v20, "collectMetricsOnSnapshotWithError:completion:", a3, v24);

    v21 = *(void **)(v27[0] + 40);
    if (v21)
      *a3 = objc_retainAutorelease(v21);
  }
  v22 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(buf, 8);
  return v22;
}

void __45__PPSMetricMonitor_collectMetricsOnSnapshot___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __45__PPSMetricMonitor_collectMetricsOnSnapshot___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)stopMonitoring
{
  OUTLINED_FUNCTION_3(&dword_243986000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __34__PPSMetricMonitor_stopMonitoring__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "remoteProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishMonitoringAndSendMetrics");

}

- (BOOL)setUpdateInterval:(double)a3 error:(id *)a4
{
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = 0.2;
  if (a3 >= 0.2)
  {
    v6 = a3;
  }
  else
  {
    PPSMetricMonitorLogHandleForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PPSMetricMonitor setUpdateInterval:error:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  -[PPSMetricMonitor remoteProxy](self, "remoteProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __44__PPSMetricMonitor_setUpdateInterval_error___block_invoke;
  v19[3] = &unk_251419AE8;
  v19[4] = &v20;
  objc_msgSend(v15, "setUpdateInterval:completion:", v16, v19);

  v17 = (void *)v21[5];
  if (a4 && v17)
    *a4 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v20, 8);

  return v17 == 0;
}

void __44__PPSMetricMonitor_setUpdateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_resetMonitoringState
{
  -[PPSMetricMonitor setMonitoringState:](self, "setMonitoringState:", 0);
  -[PPSMetricMonitor setCurrentProcessPIDs:](self, "setCurrentProcessPIDs:", 0);
  -[PPSMetricMonitor setCurrentProcessNames:](self, "setCurrentProcessNames:", 0);
  -[PPSMetricMonitor setIsInterrupted:](self, "setIsInterrupted:", 0);
}

- (void)updateWithMetricCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  PPSMetricMonitor *v17;
  id v18;

  v4 = a3;
  -[PPSMetricMonitor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PPSMetricMonitor delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PPSMetricMonitor delegateQueue](self, "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __47__PPSMetricMonitor_updateWithMetricCollection___block_invoke;
      v16 = &unk_251419C00;
      v17 = self;
      v18 = v4;
      dispatch_async(v8, &v13);

      goto LABEL_9;
    }
    PPSMetricMonitorLogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PPSMetricMonitor updateWithMetricCollection:].cold.2();
  }
  else
  {
    PPSMetricMonitorLogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PPSMetricMonitor updateWithMetricCollection:].cold.1();
  }

LABEL_9:
  -[PPSMetricMonitor config](self, "config", v13, v14, v15, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mode");

  if (v11 == 1)
  {
    -[PPSMetricMonitor connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

  }
}

void __47__PPSMetricMonitor_updateWithMetricCollection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricMonitor:didUpdateWithMetrics:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)endWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PPSMetricMonitor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metricMonitor:didEndWithError:", self, v4);

  -[PPSMetricMonitor _resetMonitoringState](self, "_resetMonitoringState");
}

- (void)_setUpXPCConnectionWithConfig:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[8];
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location;

  v4 = a3;
  PPSMetricMonitorLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PPSMetricMonitor _setUpXPCConnectionWithConfig:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.PerfPowerMetricMonitor.xpc"), 4096);
  -[PPSMetricMonitor setConnection:](self, "setConnection:", v13);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2572DCEA8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricMonitor connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRemoteObjectInterface:", v14);

  -[PPSMetricMonitor connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "remoteObjectInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_setUpWithConfiguration_completion_, 0, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2572DC690);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricMonitor connection](self, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setExportedInterface:", v19);

  -[PPSMetricMonitor connection](self, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "exportedInterface");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_updateWithMetricCollection_, 0, 0);

  -[PPSMetricMonitor connection](self, "connection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setExportedObject:", self);

  objc_initWeak(&location, self);
  -[PPSMetricMonitor connection](self, "connection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricMonitor setRemoteProxy:](self, "setRemoteProxy:", v26);

  -[PPSMetricMonitor connection](self, "connection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_55;
  v39[3] = &unk_251419C48;
  objc_copyWeak(&v40, &location);
  objc_msgSend(v27, "setInterruptionHandler:", v39);

  -[PPSMetricMonitor connection](self, "connection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v28;
  v37[1] = 3221225472;
  v37[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_56;
  v37[3] = &unk_251419C48;
  objc_copyWeak(&v38, &location);
  objc_msgSend(v29, "setInvalidationHandler:", v37);

  PPSMetricMonitorLogHandleForCategory(3);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243986000, v30, OS_LOG_TYPE_DEFAULT, "Connecting to powerlogHelperd", buf, 2u);
  }

  -[PPSMetricMonitor connection](self, "connection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "resume");

  -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
  v32 = objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v34[1] = 3221225472;
  v34[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_60;
  v34[3] = &unk_251419C00;
  v34[4] = self;
  v35 = v4;
  v33 = v4;
  dispatch_async(v32, v34);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  PPSMetricMonitorLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_55(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  PPSMetricMonitorLogHandleForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_55_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleXPCInterruption");

}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_56(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;

  PPSMetricMonitorLogHandleForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_56_cold_1();

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setConnection:", 0);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "setRemoteProxy:", 0);

  v6 = objc_loadWeakRetained(v3);
  v7 = objc_msgSend(v6, "monitoringState");

  if (v7)
  {
    v8 = objc_loadWeakRetained(v3);
    objc_msgSend(v8, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_57;
    block[3] = &unk_251419C48;
    objc_copyWeak(&v11, v3);
    dispatch_async(v9, block);

    objc_destroyWeak(&v11);
  }
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_57(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BDD0FC8];
  v6[0] = CFSTR("XPC connection invalidated");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "endWithError:", v4);

}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_60(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_2;
  v4[3] = &unk_251419C48;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "setUpWithConfiguration:completion:", v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_3;
    block[3] = &unk_251419C48;
    objc_copyWeak(&v8, v1);
    dispatch_async(v6, block);

    objc_destroyWeak(&v8);
  }
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "metricMonitorDidBecomeReady:", WeakRetained);

}

- (void)_handleXPCInterruption
{
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[5];

  -[PPSMetricMonitor setIsInterrupted:](self, "setIsInterrupted:", 1);
  -[PPSMetricMonitor delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    -[PPSMetricMonitor delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke;
    block[3] = &unk_251419BD8;
    block[4] = self;
    dispatch_async(v6, block);

  }
  -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_2;
  v8[3] = &unk_251419BD8;
  v8[4] = self;
  dispatch_async(v7, v8);

}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricMonitorInterruptionDidBegin:", *(_QWORD *)(a1 + 32));

}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_3;
  v4[3] = &unk_251419C48;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "setUpWithConfiguration:completion:", v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[16];

  PPSMetricMonitorLogHandleForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243986000, v2, OS_LOG_TYPE_DEFAULT, "Resumed XPC connection to powerlogHelperd", buf, 2u);
  }

  dispatch_get_global_queue(33, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_65;
  block[3] = &unk_251419C48;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_65(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resumeMonitoring");

}

- (void)_resumeMonitoring
{
  OUTLINED_FUNCTION_2(&dword_243986000, a2, a3, "Failed to resume monitoring system metrics: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __37__PPSMetricMonitor__resumeMonitoring__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricMonitorInterruptionDidEnd:", *(_QWORD *)(a1 + 32));

}

void __37__PPSMetricMonitor__resumeMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Failed to resume after interruption"), *MEMORY[0x24BDD0FC8]);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v2, *MEMORY[0x24BDD1398]);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerMetricMonitor"), 3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endWithError:", v4);

}

- (PPSMetricMonitorDelegate)delegate
{
  return (PPSMetricMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PPSMetricMonitorConfiguration)config
{
  return (PPSMetricMonitorConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PPSMetricMonitorServiceInterface)remoteProxy
{
  return (PPSMetricMonitorServiceInterface *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemoteProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)monitoringState
{
  return self->_monitoringState;
}

- (void)setMonitoringState:(int64_t)a3
{
  self->_monitoringState = a3;
}

- (NSArray)currentProcessPIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentProcessPIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)currentProcessNames
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentProcessNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isInterrupted
{
  return self->_isInterrupted;
}

- (void)setIsInterrupted:(BOOL)a3
{
  self->_isInterrupted = a3;
}

- (OS_dispatch_queue)xpcMessagingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setXpcMessagingQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_xpcMessagingQueue, 0);
  objc_storeStrong((id *)&self->_currentProcessNames, 0);
  objc_storeStrong((id *)&self->_currentProcessPIDs, 0);
  objc_storeStrong((id *)&self->_remoteProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithConfiguration:delegate:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_243986000, v0, v1, "Must implement metricMonitor:didUpdateWithMetrics: if updateDelegate is YES", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithConfiguration:(void *)a1 delegate:(NSObject *)a2 error:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "updateInterval");
  v4 = 134217984;
  v5 = v3;
  _os_log_error_impl(&dword_243986000, a2, OS_LOG_TYPE_ERROR, "Update interval smaller than 0.2 s is not supported (got %f); defaulting to 0.2 s",
    (uint8_t *)&v4,
    0xCu);
}

- (void)initWithConfiguration:(uint64_t)a3 delegate:(uint64_t)a4 error:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_243986000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startMonitoringSystemMetricsWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_243986000, v0, v1, "startMonitoringSystemMetricsWithError called while already monitoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)startMonitoringSystemMetricsWithError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_243986000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startMonitoringProcessWithPID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_243986000, v0, v1, "startMonitoringProcessWithPID called while already monitoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)startMonitoringProcessWithPID:(int)a1 error:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[PPSMetricMonitor startMonitoringProcessWithPID:error:]";
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl(&dword_243986000, a2, OS_LOG_TYPE_DEBUG, "%s %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)startMonitoringProcessesWithPID:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_243986000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startMonitoringProcessWithName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_243986000, v0, v1, "startMonitoringProcessWithName called while already monitoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)startMonitoringProcessWithName:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_243986000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startMonitoringProcessesWithName:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_243986000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startMonitoringProcessesWithNames:PIDs:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_243986000, v0, v1, "startMonitoringProcessesWithNames:withPIDs called while already monitoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)startMonitoringProcessesWithNames:PIDs:error:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_6();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_243986000, v2, OS_LOG_TYPE_DEBUG, "%s %@ %@", (uint8_t *)v3, 0x20u);
}

- (void)collectMetricsOnDemand
{
  OUTLINED_FUNCTION_3(&dword_243986000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)collectMetricsOnSnapshot:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_243986000, a2, a3, "collectMetricsOnSnapshot error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setUpdateInterval:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_243986000, a1, a3, "Update interval smaller than 0.2 s is not supported (got %f); defaulting to 0.2 s",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithMetricCollection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_243986000, v0, v1, "PPSMetricMonitor delegate is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateWithMetricCollection:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_243986000, v0, OS_LOG_TYPE_DEBUG, "metricMonitor:didUpdateWithMetrics: is not implemented", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_setUpXPCConnectionWithConfig:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_243986000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_243986000, a2, a3, "Remote object proxy error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_55_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_243986000, v0, v1, "XPC connection to powerlogHelperd interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_56_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_243986000, v0, v1, "XPC connection to powerlogHelperd invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
