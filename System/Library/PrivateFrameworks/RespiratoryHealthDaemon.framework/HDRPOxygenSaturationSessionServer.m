@implementation HDRPOxygenSaturationSessionServer

- (HDRPOxygenSaturationSessionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  HDRPOxygenSaturationSessionServer *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  void *v10;
  uint64_t v11;
  HLOxygenSaturationSession *sensorSession;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HDRPOxygenSaturationSessionServer;
  v6 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v14, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  if (v6)
  {
    HKCreateSerialDispatchQueueWithQOSClass();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    -[HDStandardTaskServer profile](v6, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "respiratoryExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oxygenSaturationSessionWithDelegate:queue:", v6, v6->_queue);
    v11 = objc_claimAutoreleasedReturnValue();
    sensorSession = v6->_sensorSession;
    v6->_sensorSession = (HLOxygenSaturationSession *)v11;

  }
  return v6;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BE808C8], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDD3310];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BE808C8], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x24BE808C8], "clientInterface");
}

- (void)connectionInvalidated
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HDRPOxygenSaturationSessionServer_connectionInvalidated__block_invoke;
  block[3] = &unk_24DD429B8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__HDRPOxygenSaturationSessionServer_connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_abortSensorSession");
}

- (void)connectionInterrupted
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HDRPOxygenSaturationSessionServer_connectionInterrupted__block_invoke;
  block[3] = &unk_24DD429B8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__HDRPOxygenSaturationSessionServer_connectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_abortSensorSession");
}

- (void)remote_startWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HDRPOxygenSaturationSessionServer_remote_startWithCompletion___block_invoke;
  v7[3] = &unk_24DD42A58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __64__HDRPOxygenSaturationSessionServer_remote_startWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)remote_abortWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HDRPOxygenSaturationSessionServer_remote_abortWithCompletion___block_invoke;
  v7[3] = &unk_24DD42A58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __64__HDRPOxygenSaturationSessionServer_remote_abortWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_abortWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_startWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  NSObject *v6;
  id v7;
  unint64_t sessionState;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v7 = v12;
    _os_log_impl(&dword_21A8A8000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session start", buf, 0xCu);

  }
  sessionState = self->_sessionState;
  if (sessionState)
  {
    if (sessionState > 3)
      v9 = CFSTR("Not Started");
    else
      v9 = *(&off_24DD42AA0 + sessionState - 1);
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 100, CFSTR("Cannot start session in state: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v10);

  }
  else
  {
    -[HLOxygenSaturationSession begin](self->_sensorSession, "begin");
    self->_sessionState = 1;
    v4[2](v4, 1, 0);
  }

}

- (void)_queue_abortWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v10 = (id)objc_opt_class();
    v7 = v10;
    _os_log_impl(&dword_21A8A8000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session abort", buf, 0xCu);

  }
  if (self->_sessionState)
  {
    -[HDRPOxygenSaturationSessionServer _queue_abortSensorSession](self, "_queue_abortSensorSession");
    self->_sessionState = 3;
    v4[2](v4, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 100, CFSTR("Cannot abort session in state: %@"), CFSTR("Not Started"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v8);

  }
}

- (void)_queue_abortSensorSession
{
  HLOxygenSaturationSession *sensorSession;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HLOxygenSaturationSession abort](self->_sensorSession, "abort");
  sensorSession = self->_sensorSession;
  self->_sensorSession = 0;

}

- (void)_queue_notifyClientDidSendFeedback:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__HDRPOxygenSaturationSessionServer__queue_notifyClientDidSendFeedback___block_invoke;
  v6[3] = &unk_24DD42A80;
  v6[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientRemote_didSendFeedback:", a3);

}

void __72__HDRPOxygenSaturationSessionServer__queue_notifyClientDidSendFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
    __72__HDRPOxygenSaturationSessionServer__queue_notifyClientDidSendFeedback___block_invoke_cold_1(a1, v4);

}

- (void)_queue_notifyClientDidStartWithStartTime:(double)a3 expectedDuration:(double)a4
{
  void *v7;
  _QWORD v8[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__HDRPOxygenSaturationSessionServer__queue_notifyClientDidStartWithStartTime_expectedDuration___block_invoke;
  v8[3] = &unk_24DD42A80;
  v8[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientRemote_didStartWithStartTime:expectedDuration:", a3, a4);

}

void __95__HDRPOxygenSaturationSessionServer__queue_notifyClientDidStartWithStartTime_expectedDuration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
    __95__HDRPOxygenSaturationSessionServer__queue_notifyClientDidStartWithStartTime_expectedDuration___block_invoke_cold_1(a1, v4);

}

- (void)_queue_notifyClientDidEndWithReason:(int64_t)a3 saturation:(id)a4 barometricPressure:(id)a5 averageHeartRate:(id)a6 averageHeartRateUUID:(id)a7 error:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v30[5];

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v28 = a7;
  v16 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __147__HDRPOxygenSaturationSessionServer__queue_notifyClientDidEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke;
  v30[3] = &unk_24DD42A80;
  v30[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v18 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "percentUnit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v18, "quantityWithUnit:doubleValue:", v19, v20 / 100.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_3;
LABEL_6:
    v24 = 0;
    if (v15)
      goto LABEL_4;
LABEL_7:
    v27 = 0;
    goto LABEL_8;
  }
  v21 = 0;
  if (!v14)
    goto LABEL_6;
LABEL_3:
  v22 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "pascalUnitWithMetricPrefix:", 9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v22, "quantityWithUnit:doubleValue:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_7;
LABEL_4:
  v25 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v25, "quantityWithUnit:doubleValue:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  objc_msgSend(v17, "clientRemote_didEndWithReason:saturation:barometricPressure:averageHeartRate:averageHeartRateUUID:error:", a3, v21, v24, v27, v28, v16);

}

void __147__HDRPOxygenSaturationSessionServer__queue_notifyClientDidEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
    __147__HDRPOxygenSaturationSessionServer__queue_notifyClientDidEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke_cold_1(a1, v4);

}

- (void)oxygenSaturationSession:(id)a3 didBeginWithStartTime:(double)a4 expectedDuration:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[HDRPOxygenSaturationSessionServer setStartTime:](self, "setStartTime:", a3);
  -[HDRPOxygenSaturationSessionServer setExpectedDuration:](self, "setExpectedDuration:", a5);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", -(CACurrentMediaTime() - a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRPOxygenSaturationSessionServer setExpectedEndDate:](self, "setExpectedEndDate:", v10);

  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_opt_class();
    v14 = v13;
    -[HDRPOxygenSaturationSessionServer expectedEndDate](self, "expectedEndDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v13;
    v18 = 2114;
    v19 = v9;
    v20 = 2050;
    v21 = a5;
    v22 = 2114;
    v23 = v15;
    _os_log_impl(&dword_21A8A8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session did begin with Start date: %{public}@, Duration: %{public}.1f sec, Expected end date: %{public}@", (uint8_t *)&v16, 0x2Au);

  }
  self->_sessionState = 2;
  -[HDRPOxygenSaturationSessionServer _queue_notifyClientDidStartWithStartTime:expectedDuration:](self, "_queue_notifyClientDidStartWithStartTime:expectedDuration:", a4, a5);

}

- (void)oxygenSaturationSession:(id)a3 feedbackDidChange:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  __CFString *v16;
  int v17;
  id v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HDRPOxygenSaturationSessionServer startTime](self, "startTime", a3);
  v7 = v6;
  -[HDRPOxygenSaturationSessionServer expectedDuration](self, "expectedDuration");
  v9 = v8;
  v10 = CACurrentMediaTime();
  _HKInitializeLogging();
  v11 = (id)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 + v9 - v10 >= 0.0)
      v12 = v7 + v9 - v10;
    else
      v12 = 0.0;
    v13 = (id)objc_opt_class();
    if (a4)
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v15 = v14;
      if ((a4 & 1) != 0)
        objc_msgSend(v14, "addObject:", CFSTR("Motion"));
      if ((a4 & 2) != 0)
        objc_msgSend(v15, "addObject:", CFSTR("Posture"));
      objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v15);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = CFSTR("None");
    }
    v17 = 138543874;
    v18 = v13;
    v19 = 2114;
    v20 = v16;
    v21 = 2050;
    v22 = v12;
    _os_log_impl(&dword_21A8A8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session feedback did change: (%{public}@) at %{public}.1f sec", (uint8_t *)&v17, 0x20u);

  }
  -[HDRPOxygenSaturationSessionServer _queue_notifyClientDidSendFeedback:](self, "_queue_notifyClientDidSendFeedback:", a4 & 3);
}

- (void)oxygenSaturationSession:(id)a3 didEndForReason:(unint64_t)a4 measurement:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  _HKInitializeLogging();
  v8 = (id)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    if (a4 - 1 > 4)
      v10 = CFSTR("Success");
    else
      v10 = *(&off_24DD42AB8 + a4 - 1);
    *(_DWORD *)v20 = 138543618;
    *(_QWORD *)&v20[4] = v9;
    *(_WORD *)&v20[12] = 2114;
    *(_QWORD *)&v20[14] = v10;
    v11 = v9;
    _os_log_impl(&dword_21A8A8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session did end with reason: %{public}@", v20, 0x16u);

  }
  if (a4 > 4)
    v12 = 4;
  else
    v12 = qword_21A8AEDF8[a4];
  self->_sessionState = 3;
  objc_msgSend(v7, "oxygenSaturationPercentage", *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pressureInKilopascals");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "averageHeartRateData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heartRate");
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "averageHeartRateData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRPOxygenSaturationSessionServer _queue_notifyClientDidEndWithReason:saturation:barometricPressure:averageHeartRate:averageHeartRateUUID:error:](self, "_queue_notifyClientDidEndWithReason:saturation:barometricPressure:averageHeartRate:averageHeartRateUUID:error:", v12, v13, v14, v17, v19, 0);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(int64_t)a3
{
  self->_sessionState = a3;
}

- (HLOxygenSaturationSession)sensorSession
{
  return self->_sensorSession;
}

- (void)setSensorSession:(id)a3
{
  objc_storeStrong((id *)&self->_sensorSession, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)expectedDuration
{
  return self->_expectedDuration;
}

- (void)setExpectedDuration:(double)a3
{
  self->_expectedDuration = a3;
}

- (NSDate)expectedEndDate
{
  return self->_expectedEndDate;
}

- (void)setExpectedEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_expectedEndDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedEndDate, 0);
  objc_storeStrong((id *)&self->_sensorSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__HDRPOxygenSaturationSessionServer__queue_notifyClientDidSendFeedback___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_3_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v5, v6, "[%{public}@] Error notifying Oxygen Saturation Session client of feedback update: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __95__HDRPOxygenSaturationSessionServer__queue_notifyClientDidStartWithStartTime_expectedDuration___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_3_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v5, v6, "[%{public}@] Error notifying Oxygen Saturation Session client of session start with expected end date: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __147__HDRPOxygenSaturationSessionServer__queue_notifyClientDidEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_3_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v5, v6, "[%{public}@] Error notifying Oxygen Saturation Session client of session end: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
