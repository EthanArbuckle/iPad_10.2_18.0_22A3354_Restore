@implementation SCService

- (SCService)initWithDevice:(__IOHIDDevice *)a3
{
  SCService *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serviceQueue;
  uint64_t v8;
  SCPacketDropDetector *packetDropDetector;
  SCDevice *v10;
  SCDevice *device;
  SCTimeReference *v12;
  SCTimeReference *timeReference;
  SCPreferences *v14;
  SCPreferences *preferences;
  SCService *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SCService;
  v4 = -[SCService init](&v18, sel_init);
  if (!v4)
    goto LABEL_5;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.scandium.service", v5);
  serviceQueue = v4->_serviceQueue;
  v4->_serviceQueue = (OS_dispatch_queue *)v6;

  if (!v4->_serviceQueue)
    goto LABEL_5;
  v4->_firmwareState = 0;
  *(_WORD *)&v4->_ledState = 0;
  v8 = objc_opt_new();
  packetDropDetector = v4->_packetDropDetector;
  v4->_packetDropDetector = (SCPacketDropDetector *)v8;

  v10 = -[SCDevice initWithIOHIDDevice:delegate:queue:]([SCDevice alloc], "initWithIOHIDDevice:delegate:queue:", a3, v4, v4->_serviceQueue);
  device = v4->_device;
  v4->_device = v10;

  if (v4->_device)
  {
    v12 = -[SCTimeReference initWithRTPTicksPerSecond:onQueue:]([SCTimeReference alloc], "initWithRTPTicksPerSecond:onQueue:", 24000000, v4->_serviceQueue);
    timeReference = v4->_timeReference;
    v4->_timeReference = v12;

    v14 = -[SCPreferences initWithQueue:]([SCPreferences alloc], "initWithQueue:", v4->_serviceQueue);
    preferences = v4->_preferences;
    v4->_preferences = v14;

    arc4random_buf(&v4->_systemInstance, 8uLL);
    v16 = v4;
  }
  else
  {
LABEL_5:
    v16 = 0;
  }

  return v16;
}

- (void)start
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  dispatch_queue_t v6;

  -[SCService serviceQueue](self, "serviceQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __18__SCService_start__block_invoke;
    v5[3] = &unk_25169CE70;
    v5[4] = self;
    v6 = v3;
    dispatch_async(v6, v5);

  }
}

void __18__SCService_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  SCHealthLiteConnection *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint8_t buf[16];

  sc_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2457F9000, v2, OS_LOG_TYPE_DEFAULT, "starting Scandium service", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setStarted:", 1);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "latestRTPTimestampReference");
  }
  else
  {
    v11 = 0uLL;
    v12 = 0;
  }
  v5 = *(void **)(a1 + 32);
  v9 = v11;
  v10 = v12;
  objc_msgSend(v5, "setTimestampReference:", &v9);

  objc_msgSend(*(id *)(a1 + 32), "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOperatingMode:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9));

  sc_get_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2457F9000, v7, OS_LOG_TYPE_INFO, "assuming background is not allowed", buf, 2u);
  }

  v8 = -[SCHealthLiteConnection initWithDelegate:onQueue:]([SCHealthLiteConnection alloc], "initWithDelegate:onQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setConnection:", v8);

}

- (BOOL)ledState
{
  return self->_ledState;
}

- (void)setLedState:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_ledState != a3)
  {
    self->_ledState = a3;
    -[SCService connection](self, "connection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "healthlite");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ledStateDidChange:", self->_ledState);

  }
}

- (unsigned)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  if (self->_operatingMode != a3)
  {
    v3 = a3;
    self->_operatingMode = a3;
    -[SCService device](self, "device");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOperatingMode:", v3);

  }
}

- (unsigned)firmwareState
{
  return self->_firmwareState;
}

- (void)setFirmwareState:(unsigned __int8)a3
{
  int firmwareState;
  unsigned int v4;
  NSObject *v6;
  const char *v7;
  const char *v8;
  SCPowerAssertion *v9;
  _BOOL4 v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  firmwareState = self->_firmwareState;
  if (firmwareState != a3)
  {
    v4 = a3;
    self->_firmwareState = a3;
    sc_get_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if ((char)firmwareState > 3)
        v7 = "invalid";
      else
        v7 = off_25169CE90[(char)firmwareState];
      if (v4 > 3)
        v8 = "invalid";
      else
        v8 = off_25169CE90[(char)v4];
      v12 = 136446466;
      v13 = v7;
      v14 = 2082;
      v15 = v8;
      _os_log_impl(&dword_2457F9000, v6, OS_LOG_TYPE_DEFAULT, "firmware state: %{public}s -> %{public}s", (uint8_t *)&v12, 0x16u);
    }

    -[SCService setProcessor:](self, "setProcessor:", 0);
    if (v4 == 3)
    {
      v9 = -[SCPowerAssertion initWithName:]([SCPowerAssertion alloc], "initWithName:", CFSTR("com.apple.scandium.background"));
      -[SCService setPowerAssertion:](self, "setPowerAssertion:", v9);

      v10 = 0;
    }
    else
    {
      -[SCService setPowerAssertion:](self, "setPowerAssertion:", 0);
      v10 = v4 == 1;
      if (v4 <= 1)
        -[SCService setPreviousBackgroundReadingExists:](self, "setPreviousBackgroundReadingExists:", 0);
    }
    v11 = v4 == 3 || v10;
    -[SCService setLedState:](self, "setLedState:", v11);
  }
}

- (void)selectAnOperatingModeOtherThanForeground
{
  uint64_t v3;

  if (-[SCService backgroundIsAllowed](self, "backgroundIsAllowed"))
    v3 = 2;
  else
    v3 = 0;
  -[SCService setOperatingMode:](self, "setOperatingMode:", v3);
}

- (void)handleScandiumInputReport:(id)a3
{
  id v4;
  id v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  SCProcessor *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  int v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  SCProcessor *v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  size_t v55;
  _BYTE buf[22];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[SCService started](self, "started") || !objc_msgSend(v4, "length"))
    goto LABEL_64;
  v5 = objc_retainAutorelease(v4);
  v6 = *(unsigned __int8 *)objc_msgSend(v5, "bytes");
  sc_get_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SCService handleScandiumInputReport:].cold.6(v5, v7);

  if (v6 <= 66)
  {
    if (v6 == 1)
    {
      if ((unint64_t)objc_msgSend(v5, "length") >= 3)
      {
        *(_WORD *)buf = 0;
        objc_msgSend(v5, "getBytes:range:", buf, 1, 2);
        -[SCService packetDropDetector](self, "packetDropDetector");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handlePacketWithReportID:frameIndex:size:", 1, *(unsigned __int16 *)buf, objc_msgSend(v5, "length"));

      }
      -[SCService processor](self, "processor");
      v9 = objc_claimAutoreleasedReturnValue();
      v34 = objc_retainAutorelease(v5);
      -[NSObject processPacket:ofLength:](v9, "processPacket:ofLength:", objc_msgSend(v34, "bytes"), objc_msgSend(v34, "length"));
      goto LABEL_43;
    }
    if (v6 != 2)
      goto LABEL_64;
    if ((unint64_t)objc_msgSend(v5, "length") >= 3)
    {
      *(_WORD *)buf = 0;
      objc_msgSend(v5, "getBytes:range:", buf, 1, 2);
      -[SCService packetDropDetector](self, "packetDropDetector");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handlePacketWithReportID:frameIndex:size:", 2, *(unsigned __int16 *)buf, objc_msgSend(v5, "length"));

    }
    -[SCService processor](self, "processor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      sc_get_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[SCService handleScandiumInputReport:].cold.4();

    }
    v55 = 32;
    if (!sysctlbyname("hw.model", buf, &v55, 0, 0))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        v50 = [SCProcessor alloc];
        v19 = objc_retainAutorelease(v5);
        v49 = objc_msgSend(v19, "bytes");
        v20 = objc_msgSend(v19, "length");
        -[SCService preferences](self, "preferences");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "signalQualityMetricsDisabled") ^ 1;
        -[SCService preferences](self, "preferences");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "bypassAlgorithms");
        -[SCService timeReference](self, "timeReference");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dateForRTPTimestamp:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[SCProcessor initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:](v50, "initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:", v49, v20, self, v22, v24, v26, v18);
        -[SCService setProcessor:](self, "setProcessor:", v27);

      }
    }
    -[SCService processor](self, "processor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      sc_get_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[SCService handleScandiumInputReport:].cold.1();
      goto LABEL_43;
    }
    -[SCService device](self, "device");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "latestRTPTimestampReference");
    }
    else
    {
      v53 = 0uLL;
      v54 = 0;
    }
    v51 = v53;
    v52 = v54;
    -[SCService setTimestampReference:](self, "setTimestampReference:", &v51);

    -[SCService processor](self, "processor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "forBackground");

    v38 = -[SCService firmwareState](self, "firmwareState");
    sc_get_log();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v37)
    {
      if (v38 == 3)
      {
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
LABEL_58:

          goto LABEL_64;
        }
        -[SCService processor](self, "processor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "startTimestamp");
        -[SCService processor](self, "processor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "expectedDuration");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v44;
        _os_log_impl(&dword_2457F9000, v40, OS_LOG_TYPE_DEFAULT, "0.000000 :: background session started at rtp timestamp %llu with expected duration of %.6f seconds", buf, 0x16u);
LABEL_57:

        goto LABEL_58;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        -[SCService handleScandiumInputReport:].cold.2();
    }
    else
    {
      if (v38 == 1)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          -[SCService processor](self, "processor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "startTimestamp");
          -[SCService processor](self, "processor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "expectedDuration");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v46;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v48;
          _os_log_impl(&dword_2457F9000, v40, OS_LOG_TYPE_DEFAULT, "0.000000 :: foreground session started at rtp timestamp %llu with expected duration of %.6f seconds", buf, 0x16u);

        }
        -[SCService connection](self, "connection");
        v40 = objc_claimAutoreleasedReturnValue();
        -[NSObject healthlite](v40, "healthlite");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCService processor](self, "processor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "expectedDuration");
        objc_msgSend(v41, "sessionDidBeginWithExpectedDuration:");
        goto LABEL_57;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        -[SCService handleScandiumInputReport:].cold.3();
    }

    -[SCService setProcessor:](self, "setProcessor:", 0);
    goto LABEL_64;
  }
  switch(v6)
  {
    case 67:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      *(_DWORD *)&buf[15] = 0;
      if (objc_msgSend(v5, "length") == 19)
      {
        objc_msgSend(v5, "getBytes:length:", buf, 19);
        if ((*(_WORD *)&buf[11] & 0x4000) != 0)
        {
          if ((buf[17] & 1) != 0)
            LOBYTE(v31) = 3;
          else
            LOBYTE(v31) = 2;
        }
        else
        {
          v31 = (*(_DWORD *)&buf[11] >> 13) & 1;
        }
      }
      else
      {
        sc_get_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          -[SCService handleScandiumInputReport:].cold.5(v35);

        LOBYTE(v31) = 0;
      }
      -[SCService setFirmwareState:](self, "setFirmwareState:", v31);
      break;
    case 146:
      sc_get_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2457F9000, v32, OS_LOG_TYPE_INFO, "escalation packet received", buf, 2u);
      }

      if ((unint64_t)objc_msgSend(v5, "length") >= 3)
      {
        *(_WORD *)buf = 0;
        objc_msgSend(v5, "getBytes:range:", buf, 1, 2);
        -[SCService packetDropDetector](self, "packetDropDetector");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(unsigned __int16 *)buf;
        v11 = objc_msgSend(v5, "length");
        v12 = v9;
        v13 = 146;
        goto LABEL_34;
      }
      break;
    case 147:
      sc_get_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2457F9000, v8, OS_LOG_TYPE_INFO, "de-escalation packet received", buf, 2u);
      }

      if ((unint64_t)objc_msgSend(v5, "length") >= 3)
      {
        *(_WORD *)buf = 0;
        objc_msgSend(v5, "getBytes:range:", buf, 1, 2);
        -[SCService packetDropDetector](self, "packetDropDetector");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(unsigned __int16 *)buf;
        v11 = objc_msgSend(v5, "length");
        v12 = v9;
        v13 = 147;
LABEL_34:
        -[NSObject handlePacketWithReportID:frameIndex:size:](v12, "handlePacketWithReportID:frameIndex:size:", v13, v10, v11);
LABEL_43:

      }
      break;
  }
LABEL_64:

}

- (void)handleAbort:(unsigned __int8)a3 withAnalytics:(const SCAnalytics *)a4 atTimestamp:(double)a5
{
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  double v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0u:
      sc_get_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[SCService handleAbort:withAnalytics:atTimestamp:].cold.1();

      v9 = 0;
      v10 = "thermistor broken";
      break;
    case 1u:
      v10 = "motion";
      v9 = 3;
      break;
    case 2u:
      v10 = "posture";
      v9 = 4;
      break;
    case 3u:
      v10 = "low heart rate";
      goto LABEL_21;
    case 4u:
      v10 = "high heart rate";
      goto LABEL_21;
    case 5u:
      v10 = "poor signal";
      goto LABEL_21;
    case 6u:
      sc_get_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[SCService handleAbort:withAnalytics:atTimestamp:].cold.2();

      v9 = 0;
      v10 = "samples dropped";
      break;
    case 7u:
      sc_get_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[SCService handleAbort:withAnalytics:atTimestamp:].cold.3();

      v9 = 0;
      v10 = "hardware recovery";
      break;
    case 8u:
      sc_get_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[SCService handleAbort:withAnalytics:atTimestamp:].cold.4();

      v9 = 0;
      v10 = "general error";
      break;
    case 9u:
      v10 = "poor accel signal";
LABEL_21:
      v9 = 2;
      break;
    case 0xAu:
      v9 = 0;
      v10 = "excessive invalid samples";
      break;
    default:
      v9 = 0;
      v10 = "(invalid reason code)";
      break;
  }
  -[SCService processor](self, "processor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "forBackground");

  sc_get_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      v22 = 134218242;
      v23 = a5;
      v24 = 2080;
      v25 = v10;
      _os_log_impl(&dword_2457F9000, v16, OS_LOG_TYPE_DEFAULT, "%.6f :: background session aborted due to %s", (uint8_t *)&v22, 0x16u);
    }

    -[SCService device](self, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCService processor](self, "processor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reportBackgroundSessionOutcome:forTimestamp:", 0, objc_msgSend(v19, "startTimestamp"));

    -[SCService reportBackgroundIntervalAnalyticsWithSuccess:](self, "reportBackgroundIntervalAnalyticsWithSuccess:", 0);
    if (!a4)
      goto LABEL_31;
LABEL_30:
    -[SCService reportSessionAnalytics:withTimestamp:](self, "reportSessionAnalytics:withTimestamp:", a4, a5);
    goto LABEL_31;
  }
  if (v17)
  {
    v22 = 134218242;
    v23 = a5;
    v24 = 2080;
    v25 = v10;
    _os_log_impl(&dword_2457F9000, v16, OS_LOG_TYPE_DEFAULT, "%.6f :: foreground session aborted due to %s", (uint8_t *)&v22, 0x16u);
  }

  -[SCService connection](self, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "healthlite");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sessionDidNotProduceResultForReason:", v9);

  -[SCService selectAnOperatingModeOtherThanForeground](self, "selectAnOperatingModeOtherThanForeground");
  if (a4)
    goto LABEL_30;
LABEL_31:
  -[SCService setProcessor:](self, "setProcessor:", 0);
}

- (void)reportBackgroundIntervalAnalyticsWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v3 = a3;
  v17[3] = *MEMORY[0x24BDAC8D0];
  -[SCService preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "bypassAlgorithms");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v8 = v7;
    if (-[SCService previousBackgroundReadingExists](self, "previousBackgroundReadingExists"))
    {
      v16[0] = CFSTR("seconds_since_last_read");
      v9 = (void *)MEMORY[0x24BDD16E0];
      -[SCService previousBackgroundReadingWallclock](self, "previousBackgroundReadingWallclock");
      objc_msgSend(v9, "numberWithDouble:", v8 - v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v11;
      v16[1] = CFSTR("last_read_was_successful");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SCService previousBackgroundReadingWasSuccessful](self, "previousBackgroundReadingWasSuccessful"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v12;
      v16[2] = CFSTR("current_read_was_successful");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      sc_get_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[SCService reportBackgroundIntervalAnalyticsWithSuccess:].cold.1((uint64_t)v14, v15);

      AnalyticsSendEvent();
    }
    else
    {
      -[SCService setPreviousBackgroundReadingExists:](self, "setPreviousBackgroundReadingExists:", 1);
    }
    -[SCService setPreviousBackgroundReadingWasSuccessful:](self, "setPreviousBackgroundReadingWasSuccessful:", v3);
    -[SCService setPreviousBackgroundReadingWallclock:](self, "setPreviousBackgroundReadingWallclock:", v8);
  }
}

- (void)handleMotionStatusChange:(BOOL)a3 atTimestamp:(double)a4
{
  _BOOL8 v5;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v5 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "good";
    if (v5)
      v8 = "bad";
    v11 = 134218242;
    v12 = a4;
    v13 = 2080;
    v14 = v8;
    _os_log_impl(&dword_2457F9000, v7, OS_LOG_TYPE_DEFAULT, "%.6f :: motion status changed to %s", (uint8_t *)&v11, 0x16u);
  }

  -[SCService connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "healthlite");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleMotionStatusChange:", v5);

}

- (void)handlePostureStatusChange:(BOOL)a3 atTimestamp:(double)a4
{
  _BOOL8 v5;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v5 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "good";
    if (v5)
      v8 = "bad";
    v11 = 134218242;
    v12 = a4;
    v13 = 2080;
    v14 = v8;
    _os_log_impl(&dword_2457F9000, v7, OS_LOG_TYPE_DEFAULT, "%.6f :: posture status changed to %s", (uint8_t *)&v11, 0x16u);
  }

  -[SCService connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "healthlite");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handlePostureStatusChange:", v5);

}

- (double)wallclockForRTPTimestamp:(unint64_t)a3
{
  unint64_t v5;
  int v7;
  unint64_t v8;
  double v9;

  -[SCService timestampReference](self, "timestampReference");
  -[SCService timestampReference](self, "timestampReference");
  -[SCService timestampReference](self, "timestampReference");
  LODWORD(v5) = v7;
  return v9 + ((double)a3 - (double)v8) / (double)v5;
}

- (void)handleResult:(const SCResult *)a3 withAnalytics:(const SCAnalytics *)a4 atTimestamp:(double)a5
{
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  float var0;
  float var1;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  _BYTE v31[20];
  double v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  sc_get_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SCService processor](self, "processor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "forBackground");
    v12 = "foreground";
    var0 = a3->var0;
    var1 = a3->var1;
    v30 = 134218755;
    if (v11)
      v12 = "background";
    *(double *)v31 = a5;
    *(_WORD *)&v31[8] = 2080;
    *(_QWORD *)&v31[10] = v12;
    *(_WORD *)&v31[18] = 2049;
    v32 = var0;
    v33 = 2049;
    v34 = var1;
    _os_log_impl(&dword_2457F9000, v9, OS_LOG_TYPE_DEFAULT, "%.6f :: %s session completed with an SpO2 of %{private}g %% and a heart rate of %{private}g BPM", (uint8_t *)&v30, 0x2Au);

  }
  v16 = a3->var0;
  v15 = a3->var1;
  -[SCService processor](self, "processor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCService wallclockForRTPTimestamp:](self, "wallclockForRTPTimestamp:", objc_msgSend(v17, "startTimestamp"));
  v19 = v18;
  -[SCService processor](self, "processor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "expectedDuration");
  v22 = v21;

  -[SCService processor](self, "processor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "forBackground");

  -[SCService connection](self, "connection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "healthlite");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v30 = LODWORD(v16);
  *(float *)v31 = v15;
  *(_QWORD *)&v31[4] = v19;
  *(_QWORD *)&v31[12] = v22;
  if (v24)
  {
    objc_msgSend(v26, "handleBackgroundMeasurement:", &v30);

    -[SCService device](self, "device");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCService processor](self, "processor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "reportBackgroundSessionOutcome:forTimestamp:", 1, objc_msgSend(v29, "startTimestamp"));

    -[SCService reportBackgroundIntervalAnalyticsWithSuccess:](self, "reportBackgroundIntervalAnalyticsWithSuccess:", 1);
  }
  else
  {
    objc_msgSend(v26, "sessionDidProduceMeasurement:", &v30);

    -[SCService selectAnOperatingModeOtherThanForeground](self, "selectAnOperatingModeOtherThanForeground");
  }
  -[SCService reportSessionAnalytics:withTimestamp:](self, "reportSessionAnalytics:withTimestamp:", a4, a5);
  -[SCService setProcessor:](self, "setProcessor:", 0);
}

- (void)reportSessionAnalytics:(const SCAnalytics *)a3 withTimestamp:(double)a4
{
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  -[SCService preferences](self, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "bypassAlgorithms");

  if ((v8 & 1) == 0)
  {
    -[SCService processor](self, "processor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SCService systemInstance](self, "systemInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryForAnalytics:sessionDuration:systemInterface:", a3, v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SCService connection](self, "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "healthlite");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCService processor](self, "processor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reportScandiumSessionAnalytics:forBackground:", v12, objc_msgSend(v15, "forBackground"));

    }
    else
    {
      sc_get_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[SCService reportSessionAnalytics:withTimestamp:].cold.1((uint64_t)a3, self, v16);

    }
  }
}

- (void)handleInitialConnect
{
  OUTLINED_FUNCTION_0(&dword_2457F9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleConnectionInvalidation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, v0, v1, "connection to healthlited was invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleHealthLiteDeath
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_2457F9000, v0, OS_LOG_TYPE_ERROR, "healthlited died", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)abortSession
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_2457F9000, v0, OS_LOG_TYPE_DEBUG, "asked to abort foreground session when not in the foreground operating mode", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)beginSession
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, v0, v1, "attempt to begin foreground session when already in the foreground operating mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setBackgroundAllowed:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  uint8_t *v16;
  __int16 v17;
  __int16 v18;

  v3 = a3;
  sc_get_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SCService setBackgroundAllowed:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  if (-[SCService backgroundIsAllowed](self, "backgroundIsAllowed") != v3)
  {
    -[SCService setBackgroundIsAllowed:](self, "setBackgroundIsAllowed:", v3);
    sc_get_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (!v14)
        goto LABEL_10;
      v18 = 0;
      v15 = "background is now allowed";
      v16 = (uint8_t *)&v18;
    }
    else
    {
      if (!v14)
        goto LABEL_10;
      v17 = 0;
      v15 = "background is no longer allowed";
      v16 = (uint8_t *)&v17;
    }
    _os_log_impl(&dword_2457F9000, v13, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
LABEL_10:

    if (-[SCService operatingMode](self, "operatingMode") != 1)
      -[SCService selectAnOperatingModeOtherThanForeground](self, "selectAnOperatingModeOtherThanForeground");
  }
}

- (OS_dispatch_queue)serviceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (SCDevice)device
{
  return self->_device;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (SCProcessor)processor
{
  return self->_processor;
}

- (void)setProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_processor, a3);
}

- (SCTimeReference)timeReference
{
  return self->_timeReference;
}

- (void)setTimeReference:(id)a3
{
  objc_storeStrong((id *)&self->_timeReference, a3);
}

- (SCHealthLiteConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)backgroundIsAllowed
{
  return self->_backgroundIsAllowed;
}

- (void)setBackgroundIsAllowed:(BOOL)a3
{
  self->_backgroundIsAllowed = a3;
}

- (SCPacketDropDetector)packetDropDetector
{
  return self->_packetDropDetector;
}

- (SCPreferences)preferences
{
  return self->_preferences;
}

- (SCPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_powerAssertion, a3);
}

- (BOOL)previousBackgroundReadingExists
{
  return self->_previousBackgroundReadingExists;
}

- (void)setPreviousBackgroundReadingExists:(BOOL)a3
{
  self->_previousBackgroundReadingExists = a3;
}

- (BOOL)previousBackgroundReadingWasSuccessful
{
  return self->_previousBackgroundReadingWasSuccessful;
}

- (void)setPreviousBackgroundReadingWasSuccessful:(BOOL)a3
{
  self->_previousBackgroundReadingWasSuccessful = a3;
}

- (double)previousBackgroundReadingWallclock
{
  return self->_previousBackgroundReadingWallclock;
}

- (void)setPreviousBackgroundReadingWallclock:(double)a3
{
  self->_previousBackgroundReadingWallclock = a3;
}

- (unint64_t)systemInstance
{
  return self->_systemInstance;
}

- (SCRTPTimestampReference)timestampReference
{
  *retstr = self[4];
  return self;
}

- (void)setTimestampReference:(SCRTPTimestampReference *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->cfAbsoluteTime;
  *(_QWORD *)&self->_timestampReference.ticksPerSecond = *(_QWORD *)&a3->ticksPerSecond;
  *(_OWORD *)&self->_timestampReference.cfAbsoluteTime = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_packetDropDetector, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_timeReference, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

- (void)handleScandiumInputReport:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, v0, v1, "failed to instantiate the SCProcessor object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleScandiumInputReport:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, v0, v1, "received a background start packet outside of a background escalation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleScandiumInputReport:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, v0, v1, "received a foreground start packet outside of foreground mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleScandiumInputReport:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, v0, v1, "start packet received while the processor object is still instantiated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleScandiumInputReport:(os_log_t)log .cold.5(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = 67;
  _os_log_fault_impl(&dword_2457F9000, log, OS_LOG_TYPE_FAULT, "input report 0x%x is the wrong size", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleScandiumInputReport:(void *)a1 .cold.6(void *a1, NSObject *a2)
{
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4[0] = 68157954;
  v4[1] = objc_msgSend(a1, "length");
  v5 = 2096;
  v6 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  _os_log_debug_impl(&dword_2457F9000, a2, OS_LOG_TYPE_DEBUG, "input report: %.*P", (uint8_t *)v4, 0x12u);
}

- (void)handleAbort:withAnalytics:atTimestamp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, v0, v1, "scandium session aborted due to broken thermistor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleAbort:withAnalytics:atTimestamp:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, v0, v1, "scandium session aborted due to dropped samples (e.g. pre-UVLO)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleAbort:withAnalytics:atTimestamp:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, v0, v1, "scandium session aborted due to hardware recovery", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleAbort:withAnalytics:atTimestamp:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, v0, v1, "scandium session aborted due to general error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)reportBackgroundIntervalAnalyticsWithSuccess:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("com.apple.hid.scandium.background_interval");
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_2457F9000, a2, OS_LOG_TYPE_DEBUG, "sending %@ to CoreAnalytics: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)reportSessionAnalytics:(NSObject *)a3 withTimestamp:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 208);
  objc_msgSend(a2, "processor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "forBackground"))
    v7 = "background";
  else
    v7 = "foreground";
  objc_msgSend(a2, "processor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v5;
  v11 = 2082;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_fault_impl(&dword_2457F9000, a3, OS_LOG_TYPE_FAULT, "stats is nil. Skip sending analytics. analytics->is_complete: %{public}@ self.processor.forBackground: %{public}s self.processor = %{public}@", (uint8_t *)&v9, 0x20u);

}

- (void)setBackgroundAllowed:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2457F9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
