@implementation SCDevice

- (SCDevice)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  __IOHIDManager *v8;
  const __CFDictionary *v9;
  CFSetRef v10;
  __IOHIDDevice *v11;
  SCDevice *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 8u);
  if (v8)
  {
    v14[0] = CFSTR("DeviceUsagePage");
    v14[1] = CFSTR("DeviceUsage");
    v15[0] = &unk_2516A1170;
    v15[1] = &unk_2516A1188;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    IOHIDManagerSetDeviceMatching(v8, v9);
    v10 = IOHIDManagerCopyDevices(v8);
    CFRelease(v8);
    -[__CFSet anyObject](v10, "anyObject");
    v11 = (__IOHIDDevice *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v11)
    {
      if (IOHIDDeviceOpen(v11, 0))
      {
        CFRelease(v8);
        v8 = 0;
      }
      else
      {
        v12 = -[SCDevice initWithIOHIDDevice:delegate:queue:](self, "initWithIOHIDDevice:delegate:queue:", v8, v6, v7);
        CFRelease(v8);
        self = v12;
        v8 = (__IOHIDManager *)self;
      }
    }

  }
  return (SCDevice *)v8;
}

- (SCDevice)initWithIOHIDDevice:(__IOHIDDevice *)a3 delegate:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t *v18;
  objc_super v20;

  v8 = a4;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SCDevice;
  v10 = -[SCDevice init](&v20, sel_init);
  if (!v10)
    goto LABEL_10;
  CFRetain(a3);
  *((_QWORD *)v10 + 1) = a3;
  objc_storeWeak((id *)v10 + 2, v8);
  objc_storeStrong((id *)v10 + 3, a5);
  v11 = objc_opt_new();
  v12 = (void *)*((_QWORD *)v10 + 6);
  *((_QWORD *)v10 + 6) = v11;

  if (*((_QWORD *)v10 + 6))
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13
      && (v14 = dispatch_queue_create("com.apple.scandium.input_report", v13),
          v15 = (void *)*((_QWORD *)v10 + 4),
          *((_QWORD *)v10 + 4) = v14,
          v15,
          *((_QWORD *)v10 + 4)))
    {
      IOHIDDeviceGetProperty(*((IOHIDDeviceRef *)v10 + 1), CFSTR("MaxInputReportSize"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16
        && objc_msgSend(v16, "integerValue") >= 1
        && objc_msgSend(v17, "unsignedIntValue") <= 0x1000)
      {
        v18 = (uint8_t *)malloc_type_malloc(objc_msgSend(v17, "unsignedIntValue"), 0x624FDBA9uLL);
        *((_QWORD *)v10 + 5) = v18;
        if (v18)
        {
          IOHIDDeviceRegisterInputReportCallback(*((IOHIDDeviceRef *)v10 + 1), v18, objc_msgSend(v17, "unsignedIntValue"), (IOHIDReportCallback)input_report_callback, v10);
          IOHIDDeviceSetDispatchQueue(*((IOHIDDeviceRef *)v10 + 1), *((dispatch_queue_t *)v10 + 4));
          IOHIDDeviceActivate(*((IOHIDDeviceRef *)v10 + 1));
          v18 = (uint8_t *)v10;
        }
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
LABEL_10:
    v18 = 0;
  }

  return (SCDevice *)v18;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_inputReportBuffer);

  v3.receiver = self;
  v3.super_class = (Class)SCDevice;
  -[SCDevice dealloc](&v3, sel_dealloc);
}

- (int)setFeatureReport:(const char *)a3 ofLength:(unint64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  IOReturn v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD v26[2];
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v10 = -536870206;
    sc_get_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[SCDevice setFeatureReport:ofLength:].cold.1(v8, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_12;
  }
  sc_get_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a4)
  {
    v10 = -536870206;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCDevice setFeatureReport:ofLength:].cold.2(v8, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(unsigned __int8 *)a3;
    v26[0] = 67109634;
    v26[1] = v9;
    v27 = 1040;
    v28 = a4;
    v29 = 2098;
    v30 = a3;
    _os_log_impl(&dword_2457F9000, v8, OS_LOG_TYPE_DEFAULT, "IOHIDDeviceSetReport (0x%02x) : %{public}.*P", (uint8_t *)v26, 0x18u);
  }

  v10 = IOHIDDeviceSetReport(self->_device, kIOHIDReportTypeFeature, *(unsigned __int8 *)a3, (const uint8_t *)a3, a4);
  if (v10)
  {
    sc_get_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCDevice setFeatureReport:ofLength:].cold.3((unsigned __int8 *)a3, v10, v8);
LABEL_12:

  }
  return v10;
}

- (void)setOperatingMode:(unsigned __int8)a3
{
  void *v5;
  _QWORD v6[4];
  id v7;
  unsigned __int8 v8;
  id location;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __29__SCDevice_setOperatingMode___block_invoke;
  v6[3] = &unk_25169CEB8;
  v8 = a3;
  objc_copyWeak(&v7, &location);
  v5 = (void *)MEMORY[0x24953C1A4](v6);
  -[SCDevice enqueueFeatureReportAttempt:](self, "enqueueFeatureReportAttempt:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

BOOL __29__SCDevice_setOperatingMode___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v2;
  __int16 v4;

  v4 = 0;
  HIBYTE(v4) = *(_BYTE *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "setFeatureReport:ofLength:", &v4, 2);

  return v2 != -536870184;
}

- (void)reportBackgroundSessionOutcome:(BOOL)a3 forTimestamp:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12[2];
  BOOL v13;
  id location;

  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __56__SCDevice_reportBackgroundSessionOutcome_forTimestamp___block_invoke;
  v11 = &unk_25169CEE0;
  v13 = a3;
  v12[1] = (id)a4;
  objc_copyWeak(v12, &location);
  v7 = (void *)MEMORY[0x24953C1A4](&v8);
  -[SCDevice enqueueFeatureReportAttempt:](self, "enqueueFeatureReportAttempt:", v7, v8, v9, v10, v11);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

uint64_t __56__SCDevice_reportBackgroundSessionOutcome_forTimestamp___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _BYTE v3[2];
  uint64_t v4;

  v3[0] = -109;
  v3[1] = *(_BYTE *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setFeatureReport:ofLength:", v3, 10);

  return 1;
}

- (void)enqueueFeatureReportAttempt:(id)a3
{
  uint64_t (**v4)(_QWORD);
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = (uint64_t (**)(_QWORD))a3;
  -[SCDevice featureReportQueue](self, "featureReportQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    v6 = v4[2](v4);

    if ((v6 & 1) != 0)
      goto LABEL_7;
  }
  -[SCDevice delegateQueue](self, "delegateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SCDevice featureReportQueue](self, "featureReportQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24953C1A4](v4);
    objc_msgSend(v8, "addObject:", v9);

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __40__SCDevice_enqueueFeatureReportAttempt___block_invoke;
    v10[3] = &unk_25169CF08;
    objc_copyWeak(&v11, &location);
    dispatch_async(v7, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

LABEL_7:
}

void __40__SCDevice_enqueueFeatureReportAttempt___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "attemptToDrainFeatureReportQueue");

}

- (void)attemptToDrainFeatureReportQueue
{
  SCDevice *i;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t (**v6)(void);
  int v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  for (i = self; ; self = i)
  {
    -[SCDevice featureReportQueue](self, "featureReportQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
      break;
    -[SCDevice featureReportQueue](i, "featureReportQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v7 = v6[2]();

    if (!v7)
    {
      objc_initWeak(&location, i);
      -[SCDevice delegateQueue](i, "delegateQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = dispatch_time(0, 125000000);
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __44__SCDevice_attemptToDrainFeatureReportQueue__block_invoke;
        v11[3] = &unk_25169CF08;
        objc_copyWeak(&v12, &location);
        dispatch_after(v10, v9, v11);
        objc_destroyWeak(&v12);
      }

      objc_destroyWeak(&location);
      return;
    }
    -[SCDevice featureReportQueue](i, "featureReportQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", 0);

  }
}

void __44__SCDevice_attemptToDrainFeatureReportQueue__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "attemptToDrainFeatureReportQueue");

}

- (SCRTPTimestampReference)latestRTPTimestampReference
{
  SCRTPTimestampReference *result;
  uint64_t v6;
  unint64_t v7;
  CFIndex pReportLength;
  uint8_t report[16];

  *(_OWORD *)&retstr->cfAbsoluteTime = xmmword_245825B88;
  *(_QWORD *)&retstr->ticksPerSecond = 0x8000;
  while (1)
  {
    *(_QWORD *)&report[5] = 0;
    pReportLength = 13;
    *(_QWORD *)report = 0;
    result = (SCRTPTimestampReference *)IOHIDDeviceGetReport(self->_device, kIOHIDReportTypeFeature, 214, report, &pReportLength);
    if ((_DWORD)result)
      break;
    v6 = *(_QWORD *)&report[1];
    v7 = *(unsigned int *)&report[9];
    retstr->ticksPerSecond = *(_DWORD *)&report[9];
    retstr->cfAbsoluteTime = CFAbsoluteTimeGetCurrent();
    result = (SCRTPTimestampReference *)IOHIDDeviceGetReport(self->_device, kIOHIDReportTypeFeature, 214, report, &pReportLength);
    if ((_DWORD)result)
      break;
    if (*(_QWORD *)&report[1] - v6 <= v7 >> 3)
    {
      retstr->rtpTimestamp = (unint64_t)(*(_QWORD *)&report[1] + v6) >> 1;
      return result;
    }
  }
  return result;
}

- (__IOHIDDevice)device
{
  return self->_device;
}

- (SCDeviceDelegate)delegate
{
  return (SCDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (OS_dispatch_queue)inputReportQueue
{
  return self->_inputReportQueue;
}

- (void)inputReportBuffer
{
  return self->_inputReportBuffer;
}

- (NSMutableArray)featureReportQueue
{
  return self->_featureReportQueue;
}

- (void)setFeatureReportQueue:(id)a3
{
  objc_storeStrong((id *)&self->_featureReportQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureReportQueue, 0);
  objc_storeStrong((id *)&self->_inputReportQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setFeatureReport:(uint64_t)a3 ofLength:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, a1, a3, "null report buffer", a5, a6, a7, a8, 0);
}

- (void)setFeatureReport:(uint64_t)a3 ofLength:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2457F9000, a1, a3, "length cannot be 0", a5, a6, a7, a8, 0);
}

- (void)setFeatureReport:(NSObject *)a3 ofLength:.cold.3(unsigned __int8 *a1, int a2, NSObject *a3)
{
  int v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6[0] = 67109634;
  v6[1] = v5;
  v7 = 2080;
  v8 = ioreturn_string(a2);
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_2457F9000, a3, OS_LOG_TYPE_ERROR, "IOHIDDeviceSetReport for report ID 0x%02x failed: %s (0x%x)", (uint8_t *)v6, 0x18u);
}

@end
