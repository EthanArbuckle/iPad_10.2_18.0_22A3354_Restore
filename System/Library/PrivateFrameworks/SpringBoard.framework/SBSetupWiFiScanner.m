@implementation SBSetupWiFiScanner

- (void)dealloc
{
  objc_super v3;

  -[SBSetupWiFiScanner _thread_closeWifiConnection](self, "_thread_closeWifiConnection");
  v3.receiver = self;
  v3.super_class = (Class)SBSetupWiFiScanner;
  -[SBSetupWiFiScanner dealloc](&v3, sel_dealloc);
}

- (void)beginScanningWithCompletionHandler:(id)a3
{
  id v4;

  -[SBSetupWiFiScanner _setCompletionHandler:](self, "_setCompletionHandler:", a3);
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", self, sel__wifiScanningThread, 0);
  objc_msgSend(v4, "setName:", CFSTR("com.apple.SpringBoard.BuddyWiFiScanning"));
  objc_msgSend(v4, "setQualityOfService:", 17);
  -[SBSetupWiFiScanner _setScanningThread:](self, "_setScanningThread:", v4);
  objc_msgSend(v4, "start");

}

- (void)_wifiScanningThread
{
  __CFRunLoop *Current;
  const __CFAllocator *v4;
  __WiFiManagerClient *v5;
  const __CFString *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  const void *ValueAtIndex;
  const void *v10;
  CFTypeID v11;
  CFDictionaryRef v12;
  int v13;
  CFAbsoluteTime v14;
  __CFRunLoopTimer *v15;

  Current = CFRunLoopGetCurrent();
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->_wifiManager = v5;
  if (!v5)
    goto LABEL_11;
  v6 = (const __CFString *)*MEMORY[0x1E0C9B280];
  WiFiManagerClientScheduleWithRunLoop();
  v7 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v7)
  {
    v8 = v7;
    if ((CFArrayGetCount(v7) & 0x8000000000000000) == 0)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v8, 0);
      if (ValueAtIndex)
      {
        v10 = ValueAtIndex;
        v11 = CFGetTypeID(ValueAtIndex);
        if (v11 == WiFiDeviceClientGetTypeID())
          self->_wifiDevice = (__WiFiDeviceClient *)CFRetain(v10);
      }
    }
    CFRelease(v8);
  }
  if (!self->_wifiDevice
    || (v12 = CFDictionaryCreate(v4, 0, 0, 0, 0, 0), v13 = WiFiDeviceClientScanAsync(), CFRelease(v12), v13))
  {
    -[SBSetupWiFiScanner _thread_closeWifiConnection](self, "_thread_closeWifiConnection");
LABEL_11:
    -[SBSetupWiFiScanner _thread_callCompletionHandlerWithGuessedCountries:](self, "_thread_callCompletionHandlerWithGuessedCountries:", 0);
    return;
  }
  -[SBSetupWiFiScanner _setState:](self, "_setState:", 1);
  v14 = CFAbsoluteTimeGetCurrent();
  v15 = CFRunLoopTimerCreate(v4, v14 + 1000000.0, 1.79769313e308, 0, 0, (CFRunLoopTimerCallBack)SetupWiFiScanTimerCallback, 0);
  CFRunLoopAddTimer(Current, v15, v6);
  while (-[SBSetupWiFiScanner _state](self, "_state") != 2)
    CFRunLoopRunInMode(v6, 1.79769313e308, 1u);
  CFRunLoopTimerInvalidate(v15);
  CFRelease(v15);
}

- (void)_thread_wifiScanComplete:(__CFArray *)a3 error:(BOOL)a4
{
  int64_t v7;
  void *v8;
  CFIndex Count;
  CFIndex v10;
  id v11;
  id v12;
  CFIndex v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *j;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  int v45;
  _BYTE v46[3];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = -[SBSetupWiFiScanner _state](self, "_state");
  if (a3 && v7 != 2)
  {
    if (a4)
    {
      -[SBSetupWiFiScanner _thread_callCompletionHandlerWithGuessedCountries:](self, "_thread_callCompletionHandlerWithGuessedCountries:", 0);
LABEL_41:
      -[SBSetupWiFiScanner _setState:](self, "_setState:", 2);
      -[SBSetupWiFiScanner _thread_closeWifiConnection](self, "_thread_closeWifiConnection");
      return;
    }
    v8 = (void *)MEMORY[0x1D17E5334]();
    Count = CFArrayGetCount(a3);
    if (Count < 1)
    {
      -[SBSetupWiFiScanner _thread_callCompletionHandlerWithGuessedCountries:](self, "_thread_callCompletionHandlerWithGuessedCountries:", 0);
LABEL_40:
      objc_autoreleasePoolPop(v8);
      goto LABEL_41;
    }
    v10 = Count;
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v13 = 0;
    v45 = 3;
    do
    {
      CFArrayGetValueAtIndex(a3, v13);
      if (WiFiNetworkGet11dCountryCodeFromIe())
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v46, 2, 1);
        objc_msgSend(v11, "addObject:", v14);

      }
      ++v13;
    }
    while (v10 != v13);
    v32 = v8;
    v15 = v11;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v17);
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v20 = v12;
    v21 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    if (v21)
    {
      v22 = 0;
      v23 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v20);
          v25 = objc_msgSend(v20, "countForObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j));
          if (v25 > v22)
            v22 = v25;
        }
        v21 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      }
      while (v21);

      if (!v22)
      {
        v21 = 0;
        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v26 = v20;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v34;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v34 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
            if (objc_msgSend(v26, "countForObject:", v31) == v22)
              objc_msgSend(v21, "addObject:", v31);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
        }
        while (v28);
      }
    }

LABEL_39:
    v8 = v32;
    -[SBSetupWiFiScanner _thread_callCompletionHandlerWithGuessedCountries:](self, "_thread_callCompletionHandlerWithGuessedCountries:", v21);

    goto LABEL_40;
  }
}

- (void)_thread_closeWifiConnection
{
  if (self->_wifiManager)
  {
    CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
  }
  if (self->_wifiDevice)
  {
    if (-[SBSetupWiFiScanner _state](self, "_state") == 1)
    {
      -[SBSetupWiFiScanner _setState:](self, "_setState:", 2);
      WiFiDeviceClientScanCancel();
    }
    CFRelease(self->_wifiDevice);
    self->_wifiDevice = 0;
  }
}

- (void)_thread_callCompletionHandlerWithGuessedCountries:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBSetupWiFiScanner _completionHandler](self, "_completionHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
    -[SBSetupWiFiScanner _setCompletionHandler:](self, "_setCompletionHandler:", 0);
  }

}

- (void)cancel
{
  void *v3;
  id v4;

  -[SBSetupWiFiScanner _scanningThread](self, "_scanningThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "cancel");
    -[SBSetupWiFiScanner performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__thread_cancelScanning, v4, 0, 0);
    v3 = v4;
  }

}

- (void)_thread_cancelScanning
{
  -[SBSetupWiFiScanner _thread_closeWifiConnection](self, "_thread_closeWifiConnection");
  -[SBSetupWiFiScanner _setState:](self, "_setState:", 2);
}

- (NSThread)_scanningThread
{
  return (NSThread *)objc_getProperty(self, a2, 24, 1);
}

- (void)_setScanningThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)_completionHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)_setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int64_t)_state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_scanningThread, 0);
}

@end
