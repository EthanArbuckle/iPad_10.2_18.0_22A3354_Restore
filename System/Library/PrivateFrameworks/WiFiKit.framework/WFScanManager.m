@implementation WFScanManager

- (WFScanManager)initWithScanProxy:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *scanDispatchQueue;
  char v15;
  char v16;
  char v17;
  NSObject *p_super;
  os_log_type_t v19;
  _BOOL4 supportsUnfilteredScanning;
  _BOOL4 supportsHotspotHelper;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  os_log_type_t v29;
  int v30;
  _DWORD v31[7];

  *(_QWORD *)&v31[5] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "scanInterval");
  if (v9 < 1.0)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v24))
      goto LABEL_25;
    v30 = 67109120;
    v31[0] = 1;
    v25 = "Minimum scan interval is %d";
    v26 = v23;
    v27 = v24;
    v28 = 8;
    goto LABEL_24;
  }
  objc_msgSend(v7, "scanInterval");
  self->_scanInterval = v10;
  if (!v8)
  {
LABEL_26:
    p_super = &self->super;
    self = 0;
    goto LABEL_15;
  }
  objc_storeWeak((id *)&self->_delegate, v8);
  self->_state = 0;
  if (!v7)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v29 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v29))
      goto LABEL_25;
    v30 = 136315138;
    *(_QWORD *)v31 = "-[WFScanManager initWithScanProxy:delegate:]";
    v25 = "%s: nil wifiClient";
    v26 = v23;
    v27 = v29;
    v28 = 12;
LABEL_24:
    _os_log_impl(&dword_219FC8000, v26, v27, v25, (uint8_t *)&v30, v28);
LABEL_25:

    goto LABEL_26;
  }
  objc_storeStrong((id *)&self->_scanProxy, a3);
  v11 = (OS_dispatch_queue *)dispatch_queue_create(0, MEMORY[0x24BDAC9C0]);
  internalQueue = self->_internalQueue;
  self->_internalQueue = v11;

  if (!self->_internalQueue)
    goto LABEL_26;
  v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wifikit.scanmanager", 0);
  scanDispatchQueue = self->_scanDispatchQueue;
  self->_scanDispatchQueue = v13;

  if (!self->_scanDispatchQueue)
    goto LABEL_26;
  self->_doUnFilteredScanning = 0;
  self->_consecutiveZeroFilteredScanResults = 0;
  self->_consecutiveZeroUnFilteredScanResults = 0;
  v15 = objc_opt_respondsToSelector();
  v16 = 0;
  if ((v15 & 1) != 0)
    v16 = objc_msgSend(v8, "scanManagerShouldSupportUnfilteredScanning:", self);
  self->_supportsUnfilteredScanning = v16;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = objc_msgSend(v8, "scanManagerShouldSupportHotspotHelper:", self);
  else
    v17 = 0;
  self->_supportsHotspotHelper = v17;
  self->_hotspotHelperScanning = 0;
  WFLogForCategory(6uLL);
  p_super = objc_claimAutoreleasedReturnValue();
  v19 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && p_super && os_log_type_enabled(p_super, v19))
  {
    supportsUnfilteredScanning = self->_supportsUnfilteredScanning;
    supportsHotspotHelper = self->_supportsHotspotHelper;
    v30 = 67109376;
    v31[0] = supportsUnfilteredScanning;
    LOWORD(v31[1]) = 1024;
    *(_DWORD *)((char *)&v31[1] + 2) = supportsHotspotHelper;
    _os_log_impl(&dword_219FC8000, p_super, v19, "initiliazed scan manager (unfilteredScanning=%d, hotspot helper supported=%d)", (uint8_t *)&v30, 0xEu);
  }
LABEL_15:

  return self;
}

- (WFScanManager)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[WFScanManager init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)start
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  char v9;
  void *v10;
  os_log_type_t v11;
  NSObject *v12;
  unint64_t v13;
  __CFString *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(6uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      v6 = -[WFScanManager state](self, "state");
      if (v6 > 3)
        v7 = 0;
      else
        v7 = off_24DC35DC8[v6];
      v17 = 138412290;
      v18 = v7;
      _os_log_impl(&dword_219FC8000, v5, v4, "starting scan manager (current state='%@')", (uint8_t *)&v17, 0xCu);
    }

  }
  -[WFScanManager scanProxy](self, "scanProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isScanningAllowed");

  if ((v9 & 1) != 0)
  {
    if (-[WFScanManager state](self, "state"))
    {
      WFLogForCategory(6uLL);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = OSLogForWFLogLevel(2uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 2 && v10)
      {
        v12 = v10;
        if (os_log_type_enabled(v12, v11))
        {
          v13 = -[WFScanManager state](self, "state");
          if (v13 > 3)
            v14 = 0;
          else
            v14 = off_24DC35DC8[v13];
          v17 = 138412290;
          v18 = v14;
          _os_log_impl(&dword_219FC8000, v12, v11, "scanning is already started (state='%@').", (uint8_t *)&v17, 0xCu);
        }

      }
    }
    else
    {
      -[WFScanManager setState:](self, "setState:", 1);
      self->_numberOfScansPerformed = 0;
      -[WFScanManager _scan](self, "_scan");
      -[WFScanManager _startHotspotPluginScan](self, "_startHotspotPluginScan");
    }
  }
  else
  {
    WFLogForCategory(6uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v15 && os_log_type_enabled(v15, v16))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_219FC8000, v15, v16, "interface is powered OFF, pausing scan state.", (uint8_t *)&v17, 2u);
    }

    -[WFScanManager setState:](self, "setState:", 3);
  }
}

- (void)stop
{
  int64_t v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  unint64_t v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = -[WFScanManager state](self, "state");
  WFLogForCategory(6uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4)
    {
      v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        v7 = -[WFScanManager state](self, "state");
        if (v7 > 3)
          v8 = 0;
        else
          v8 = off_24DC35DC8[v7];
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_219FC8000, v6, v5, "stopping scan manager (current state='%@')", (uint8_t *)&v13, 0xCu);
      }

    }
    -[WFScanManager setState:](self, "setState:", 0);
    -[WFScanManager setNetworks:](self, "setNetworks:", 0);
    -[WFScanManager _removeQueuedScans](self, "_removeQueuedScans");
    -[WFScanManager _cancelQueuedScan](self, "_cancelQueuedScan");
    -[WFScanManager _stopNetworkPluginScan](self, "_stopNetworkPluginScan");
    self->_numberOfScansPerformed = 0;
  }
  else
  {
    v9 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v4)
    {
      v10 = v4;
      if (os_log_type_enabled(v10, (os_log_type_t)v9))
      {
        v11 = -[WFScanManager state](self, "state");
        if (v11 > 3)
          v12 = 0;
        else
          v12 = off_24DC35DC8[v11];
        v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_219FC8000, v10, (os_log_type_t)v9, "unable to stop scan manager, already paused (current state='%@')", (uint8_t *)&v13, 0xCu);
      }

    }
  }
}

- (void)pause
{
  int64_t v3;
  void *v4;
  os_log_type_t v5;
  BOOL v6;
  int v7;
  NSObject *v8;
  unint64_t v9;
  __CFString *v10;
  NSObject *v11;
  unint64_t v12;
  __CFString *v13;
  int v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[WFScanManager state](self, "state");
  WFLogForCategory(6uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (v3 == 3)
  {
    if (v7)
    {
      v8 = v4;
      if (os_log_type_enabled(v8, v5))
      {
        v9 = -[WFScanManager state](self, "state");
        if (v9 > 3)
          v10 = 0;
        else
          v10 = off_24DC35DC8[v9];
        v14 = 138412290;
        v15 = v10;
        _os_log_impl(&dword_219FC8000, v8, v5, "unable to pause scan manager, already paused (current state='%@')", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  else
  {
    if (v7)
    {
      v11 = v4;
      if (os_log_type_enabled(v11, v5))
      {
        v12 = -[WFScanManager state](self, "state");
        if (v12 > 3)
          v13 = 0;
        else
          v13 = off_24DC35DC8[v12];
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_219FC8000, v11, v5, "pausing scan manager (current state='%@')", (uint8_t *)&v14, 0xCu);
      }

    }
    -[WFScanManager setState:](self, "setState:", 3);
    -[WFScanManager setNetworks:](self, "setNetworks:", 0);
    -[WFScanManager _removeQueuedScans](self, "_removeQueuedScans");
    -[WFScanManager _cancelQueuedScan](self, "_cancelQueuedScan");
    -[WFScanManager _stopNetworkPluginScan](self, "_stopNetworkPluginScan");
  }
}

- (void)resume
{
  BOOL v3;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  int v7;
  NSObject *v8;
  unint64_t v9;
  __CFString *v10;
  NSObject *v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  int v15;
  os_log_type_t v16;
  int v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = -[WFScanManager _canResumeScanning](self, "_canResumeScanning");
  WFLogForCategory(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (v3)
  {
    if (v7)
    {
      v8 = v4;
      if (os_log_type_enabled(v8, v5))
      {
        v9 = -[WFScanManager state](self, "state");
        if (v9 > 3)
          v10 = 0;
        else
          v10 = off_24DC35DC8[v9];
        v17 = 138412290;
        v18 = v10;
        _os_log_impl(&dword_219FC8000, v8, v5, "resuming scan manager (current state='%@')", (uint8_t *)&v17, 0xCu);
      }

    }
    -[WFScanManager scanProxy](self, "scanProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isScanningAllowed");

    if (v15)
    {
      -[WFScanManager setState:](self, "setState:", 1);
      -[WFScanManager _scan](self, "_scan");
      -[WFScanManager _startHotspotPluginScan](self, "_startHotspotPluginScan");
      return;
    }
    WFLogForCategory(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v16))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_219FC8000, v4, v16, "can't resume scanning, power is off.", (uint8_t *)&v17, 2u);
    }
  }
  else if (v7)
  {
    v11 = v4;
    if (os_log_type_enabled(v11, v5))
    {
      v12 = -[WFScanManager state](self, "state");
      if (v12 > 3)
        v13 = 0;
      else
        v13 = off_24DC35DC8[v12];
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_219FC8000, v11, v5, "unable to resume scan manager, already resumed (current state='%@')", (uint8_t *)&v17, 0xCu);
    }

  }
}

- (void)setScanInterval:(double)a3
{
  NSObject *v5;
  os_log_type_t v6;
  double scanInterval;
  int v8;
  double v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_scanInterval != a3)
  {
    WFLogForCategory(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      scanInterval = self->_scanInterval;
      v8 = 134218240;
      v9 = scanInterval;
      v10 = 2048;
      v11 = a3;
      _os_log_impl(&dword_219FC8000, v5, v6, "scan interval changed from %f to %f", (uint8_t *)&v8, 0x16u);
    }

    self->_scanInterval = a3;
    if (-[WFScanManager state](self, "state") == 1)
    {
      -[WFScanManager _cancelQueuedScan](self, "_cancelQueuedScan");
      -[WFScanManager _queueScan](self, "_queueScan");
    }
  }
}

- (void)setState:(int64_t)a3
{
  unint64_t v5;
  NSObject *internalQueue;
  NSObject *v7;
  os_log_type_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  __CFString *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[WFScanManager state](self, "state") != a3)
  {
    v5 = -[WFScanManager state](self, "state");
    internalQueue = self->_internalQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __26__WFScanManager_setState___block_invoke;
    v12[3] = &unk_24DC348D0;
    v12[4] = self;
    v12[5] = a3;
    dispatch_barrier_async(internalQueue, v12);
    WFLogForCategory(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      if (v5 > 3)
        v9 = 0;
      else
        v9 = off_24DC35DC8[v5];
      if ((unint64_t)a3 > 3)
        v10 = 0;
      else
        v10 = off_24DC35DC8[a3];
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_219FC8000, v7, v8, "scan manager state changed from %@ to %@", buf, 0x16u);
    }

    -[WFScanManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "scanManager:stateDidChange:", self, a3);

  }
}

uint64_t __26__WFScanManager_setState___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(result + 40);
  return result;
}

- (int64_t)state
{
  NSObject *internalQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __22__WFScanManager_state__block_invoke;
  v5[3] = &unk_24DC353A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__WFScanManager_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (double)setTwentyPercentSkew:(double)a3
{
  double v3;
  double v4;
  uint32_t v5;

  v3 = a3 - a3 * 0.1;
  v4 = a3 * 0.1 + a3;
  v5 = arc4random();
  return v3 + (double)(v5 + ((v5 / 0x7FFFFFFF) | ((v5 / 0x7FFFFFFF) << 31))) / 2147483650.0 * (v4 - v3);
}

- (void)_queueScan
{
  dispatch_block_t v3;
  double v4;
  dispatch_time_t v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  unint64_t v9;
  __CFString *v10;
  NSObject *v11;
  os_log_type_t v12;
  _QWORD block[5];
  uint8_t v14[16];
  __int128 buf;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19[3];

  v19[2] = *(id *)MEMORY[0x24BDAC8D0];
  if (-[WFScanManager state](self, "state") == 1)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x3042000000;
    v17 = __Block_byref_object_copy__6;
    v18 = __Block_byref_object_dispose__6;
    objc_initWeak(v19, self);
    if (self->_singleScanBlock)
    {
      WFLogForCategory(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = OSLogForWFLogLevel(2uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 2 && v11 && os_log_type_enabled(v11, v12))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_219FC8000, v11, v12, "Won't dispatch another scan 'timer'(dispatch_after now) as there's already one waiting to execute", v14, 2u);
      }

    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __27__WFScanManager__queueScan__block_invoke;
      block[3] = &unk_24DC34710;
      block[4] = &buf;
      v3 = dispatch_block_create((dispatch_block_flags_t)0, block);
      -[WFScanManager setSingleScanBlock:](self, "setSingleScanBlock:", v3);

      -[WFScanManager setTwentyPercentSkew:](self, "setTwentyPercentSkew:", self->_scanInterval);
      v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      dispatch_after(v5, (dispatch_queue_t)self->_scanDispatchQueue, self->_singleScanBlock);
    }
    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(v19);
  }
  else
  {
    WFLogForCategory(6uLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        v9 = -[WFScanManager state](self, "state");
        if (v9 > 3)
          v10 = 0;
        else
          v10 = off_24DC35DC8[v9];
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_219FC8000, v8, v7, "can't queue scan, scanning state is not Idle, it's %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
}

void __27__WFScanManager__queueScan__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(WeakRetained, "_scan");

}

- (void)_cancelQueuedScan
{
  NSObject *scanDispatchQueue;
  _QWORD block[5];

  scanDispatchQueue = self->_scanDispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__WFScanManager__cancelQueuedScan__block_invoke;
  block[3] = &unk_24DC348F8;
  block[4] = self;
  dispatch_async(scanDispatchQueue, block);
}

void __34__WFScanManager__cancelQueuedScan__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "singleScanBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "singleScanBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setSingleScanBlock:", 0);
  }
}

- (void)_scan
{
  void *v3;
  char v4;
  void *v5;
  NSObject *scanDispatchQueue;
  NSObject *v7;
  os_log_type_t v8;
  _QWORD block[5];
  uint8_t buf[16];

  -[WFScanManager scanProxy](self, "scanProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScanningAllowed");

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFScanManager setNetworks:](self, "setNetworks:", v5);

    -[WFScanManager _scanningWillStart](self, "_scanningWillStart");
    scanDispatchQueue = self->_scanDispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __22__WFScanManager__scan__block_invoke;
    block[3] = &unk_24DC348F8;
    block[4] = self;
    dispatch_async(scanDispatchQueue, block);
  }
  else
  {
    WFLogForCategory(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(2uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 2 && v7 && os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v7, v8, "stopping scan, power is OFF", buf, 2u);
    }

  }
}

void __22__WFScanManager__scan__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t j;
  void *v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  os_log_type_t v32;
  NSObject *v33;
  os_log_type_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  os_log_type_t v38;
  void *v39;
  os_log_type_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "scanProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scannableChannels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v46 = v3;
    WFSplitChannelsBetweenBands(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = a1;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 112);
    if (v6 >= 4)
    {
      *(_QWORD *)(v5 + 112) = 0;
      WFLogForCategory(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v7, v8, "resetting scan count for low priority", buf, 2u);
      }

    }
    v9 = v6 - 1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    v44 = v11;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v52 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          +[WFScanRequest scanRequestForChannels:](WFScanRequest, "scanRequestForChannels:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setIncludeBSSList:", 1);
          objc_msgSend(v17, "setLowPriorityScan:", v9 < 3);
          WFLogForCategory(6uLL);
          v18 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v19 = OSLogForWFLogLevel(4uLL);
            if ((unint64_t)WFCurrentLogLevel() >= 4 && v18 && os_log_type_enabled(v18, v19))
            {
              *(_DWORD *)buf = 138412290;
              v56 = (uint64_t)v17;
              _os_log_impl(&dword_219FC8000, v18, v19, "created scan request: %@", buf, 0xCu);
            }

            objc_msgSend(v10, "addObject:", v17);
          }
          else
          {
            v20 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v20))
            {
              *(_DWORD *)buf = 138543362;
              v56 = (uint64_t)v16;
              _os_log_impl(&dword_219FC8000, v18, v20, "Unable to create scan request from channels %{public}@", buf, 0xCu);
            }

            v11 = v44;
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v13);
    }

    objc_msgSend(*(id *)(v43 + 32), "_knownHiddenNetworkNames");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v45 = v10;
    if (v21)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v48;
        do
        {
          v26 = v22;
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v48 != v25)
              objc_enumerationMutation(v26);
            v28 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
            +[WFScanRequest scanRequestForSSID:channels:](WFScanRequest, "scanRequestForSSID:channels:", v28, v46);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setIncludeBSSList:", 1);
            objc_msgSend(v29, "setLowPriorityScan:", v9 < 3);
            WFLogForCategory(6uLL);
            v30 = objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v31 = OSLogForWFLogLevel(4uLL);
              if ((unint64_t)WFCurrentLogLevel() >= 4 && v30 && os_log_type_enabled(v30, v31))
              {
                *(_DWORD *)buf = 138412290;
                v56 = (uint64_t)v28;
                _os_log_impl(&dword_219FC8000, v30, v31, "created directed scan for %@", buf, 0xCu);
              }

              objc_msgSend(v45, "addObject:", v29);
            }
            else
            {
              v32 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v32))
              {
                *(_DWORD *)buf = 138412546;
                v56 = (uint64_t)v28;
                v57 = 2114;
                v58 = v46;
                _os_log_impl(&dword_219FC8000, v30, v32, "Unable to create scan request for ssid %@ from channels %{public}@", buf, 0x16u);
              }

            }
          }
          v22 = v26;
          v24 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        }
        while (v24);
      }
    }
    else
    {
      WFLogForCategory(6uLL);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v37 && os_log_type_enabled(v37, v38))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v37, v38, "no hidden networks to scan", buf, 2u);
      }

    }
    WFLogForCategory(6uLL);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = OSLogForWFLogLevel(1uLL);
    v3 = v46;
    if (WFCurrentLogLevel() && v39)
    {
      v41 = v39;
      if (os_log_type_enabled(v41, v40))
      {
        v42 = objc_msgSend(v45, "count");
        *(_DWORD *)buf = 134217984;
        v56 = v42;
        _os_log_impl(&dword_219FC8000, v41, v40, "queuing scans: %lu", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(v43 + 32), "setScanQueue:", v45);
    objc_msgSend(*(id *)(v43 + 32), "_processNextScan");

    v36 = v44;
  }
  else
  {
    WFLogForCategory(6uLL);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v33 && os_log_type_enabled(v33, v34))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v33, v34, "device scan channels are nil", buf, 2u);
    }

    v35 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "scanErrorWithReason:", 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "_scanningDidFinishWithError:", v36);
  }

}

- (void)_processNextScan
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 *p_buf;
  id v24;
  id location;
  __int128 buf;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[WFScanManager scanQueue](self, "scanQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

    goto LABEL_18;
  }
  v4 = -[WFScanManager _isScanning](self, "_isScanning");

  if (!v4)
  {
LABEL_18:
    -[WFScanManager _scanningDidFinishWithError:](self, "_scanningDidFinishWithError:", 0);
    return;
  }
  -[WFScanManager scanQueue](self, "scanQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_219FC8000, v7, v8, "{SCAN+} starting scan: %@", (uint8_t *)&buf, 0xCu);
  }

  -[WFScanManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFScanManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scanManager:willStartScanRequest:", self, v6);

  }
  if (-[WFScanManager supportsUnfilteredScanning](self, "supportsUnfilteredScanning") && self->_doUnFilteredScanning)
  {
    WFLogForCategory(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_219FC8000, v12, v13, "removing scan filter", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(v6, "setApplyRssiThresholdFilter:", 0);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x2020000000;
  v28 = 0;
  objc_msgSend(v6, "ssid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  v28 = v16;
  objc_initWeak(&location, self);
  -[WFScanManager scanProxy](self, "scanProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __33__WFScanManager__processNextScan__block_invoke;
  v20[3] = &unk_24DC35D40;
  objc_copyWeak(&v24, &location);
  v18 = v14;
  v21 = v18;
  v19 = v6;
  v22 = v19;
  p_buf = &buf;
  objc_msgSend(v17, "performScanWithRequest:reply:", v19, v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

void __33__WFScanManager__processNextScan__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "scanDispatchQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "scanDispatchQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __33__WFScanManager__processNextScan__block_invoke_2;
      v11[3] = &unk_24DC35D18;
      v12 = *(id *)(a1 + 32);
      v13 = v5;
      v14 = *(id *)(a1 + 40);
      v15 = v6;
      v16 = v8;
      v17 = *(_QWORD *)(a1 + 48);
      dispatch_async(v10, v11);

    }
  }

}

void __33__WFScanManager__processNextScan__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  double v21;
  NSObject *v22;
  os_log_type_t v23;
  double v24;
  void *v25;
  os_log_type_t v26;
  NSObject *v27;
  double v28;
  void *v29;
  void *v30;
  char v31;
  int v32;
  double v33;
  __int16 v34;
  _BYTE v35[18];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v3 = -v2;
  v4 = *(_QWORD *)(a1 + 40);
  WFLogForCategory(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (v4)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v32 = 134218498;
      v33 = v3;
      v34 = 2112;
      *(_QWORD *)v35 = v9;
      *(_WORD *)&v35[8] = 2112;
      *(_QWORD *)&v35[10] = v10;
      _os_log_impl(&dword_219FC8000, v5, v6, "{SCAN-} %f sec, scan error %@ for request: %@", (uint8_t *)&v32, 0x20u);
    }
  }
  else if (v8)
  {
    v11 = v5;
    if (os_log_type_enabled(v11, v6))
    {
      v12 = objc_msgSend(*(id *)(a1 + 56), "count");
      v13 = *(_QWORD *)(a1 + 48);
      v32 = 134218498;
      v33 = v3;
      v34 = 1024;
      *(_DWORD *)v35 = v12;
      *(_WORD *)&v35[4] = 2112;
      *(_QWORD *)&v35[6] = v13;
      _os_log_impl(&dword_219FC8000, v11, v6, "{SCAN-} %f sec, networks found %d for request: %@", (uint8_t *)&v32, 0x1Cu);
    }

  }
  objc_msgSend(*(id *)(a1 + 64), "scanQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", *(_QWORD *)(a1 + 48));

  if ((v15 & 1) == 0)
  {
    WFLogForCategory(6uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
    {
      v21 = *(double *)(a1 + 48);
      v32 = 138412290;
      v33 = v21;
      _os_log_impl(&dword_219FC8000, v19, v20, "scan request='%@' was cancelled, disregarding result", (uint8_t *)&v32, 0xCu);
    }
    goto LABEL_45;
  }
  v16 = *(void **)(a1 + 40);
  if (v16 && objc_msgSend(v16, "code"))
  {
    WFLogForCategory(6uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_219FC8000, v17, v18, "deferring scans until device is available", (uint8_t *)&v32, 2u);
    }

    objc_msgSend(*(id *)(a1 + 64), "_removeQueuedScans");
    objc_msgSend(*(id *)(a1 + 64), "_scanningDidFinishWithError:", *(_QWORD *)(a1 + 40));
  }
  if (objc_msgSend(*(id *)(a1 + 64), "_isScanning"))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) && !objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      WFLogForCategory(6uLL);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v25)
      {
        v27 = v25;
        if (os_log_type_enabled(v27, v26))
        {
          objc_msgSend(*(id *)(a1 + 48), "ssid");
          v28 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          v32 = 138412290;
          v33 = v28;
          _os_log_impl(&dword_219FC8000, v27, v26, "no result for hidden network %@", (uint8_t *)&v32, 0xCu);

        }
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "_updatePartialScanResults:", *(_QWORD *)(a1 + 56));
    }
    objc_msgSend(*(id *)(a1 + 64), "scanQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeObject:", *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 64), "_processNextScan");
  }
  else
  {
    WFLogForCategory(6uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
    {
      v24 = *(double *)(a1 + 48);
      v32 = 138412290;
      v33 = v24;
      _os_log_impl(&dword_219FC8000, v22, v23, "discarding results from: %@, this request was cancelled.", (uint8_t *)&v32, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 64), "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 64), "delegate");
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSObject scanManager:didFinishScanRequest:results:error:timeElapsed:](v19, "scanManager:didFinishScanRequest:results:error:timeElapsed:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v3);
LABEL_45:

  }
}

- (void)_updatePartialScanResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  os_log_type_t v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  os_log_type_t v33;
  NSObject *v34;
  int v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFScanManager networks](self, "networks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFScanManager networks](self, "networks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "intersectSet:", v4);
    if (objc_msgSend(v7, "count"))
    {
      WFLogForCategory(6uLL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8)
      {
        v10 = v8;
        if (os_log_type_enabled(v10, v9))
        {
          v11 = objc_msgSend(v7, "count");
          objc_msgSend(v7, "logStringWithScanRecords");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          v44 = v11;
          v45 = 2112;
          v46 = v12;
          _os_log_impl(&dword_219FC8000, v10, v9, "found duplicate (%d networks): %@", buf, 0x12u);

        }
      }

    }
    v13 = (void *)objc_msgSend(v4, "mutableCopy");
    -[WFScanManager networks](self, "networks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minusSet:", v14);

    if (v13)
    {
      WFLogForCategory(6uLL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v15)
      {
        v17 = v15;
        if (os_log_type_enabled(v17, v16))
        {
          v18 = objc_msgSend(v13, "count");
          objc_msgSend(v13, "logStringWithScanRecords");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          v44 = v18;
          v45 = 2112;
          v46 = v19;
          _os_log_impl(&dword_219FC8000, v17, v16, "found new networks (%d networks): %@", buf, 0x12u);

        }
      }

    }
  }
  -[WFScanManager networks](self, "networks");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "compareAndUpdateDuplicateScanRecords:", v4);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[WFScanManager networks](self, "networks", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[WFScanManager hotspotHelperForScanRecord:](self, "hotspotHelperForScanRecord:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          objc_msgSend(v27, "label");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setHotspotPluginLabel:", v29);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v23);
  }

  -[WFScanManager networks](self, "networks");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "mutableCopy");

  objc_msgSend(v31, "intersectSet:", v4);
  WFLogForCategory(6uLL);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v32)
  {
    v34 = v32;
    if (os_log_type_enabled(v34, v33))
    {
      v35 = objc_msgSend(v31, "count");
      objc_msgSend(v31, "logStringWithScanRecords");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v44 = v35;
      v45 = 2112;
      v46 = v36;
      _os_log_impl(&dword_219FC8000, v34, v33, "partial scan results (%d networks): %@", buf, 0x12u);

    }
  }

  -[WFScanManager delegate](self, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "scanManager:updatedPartialResults:", self, v31);

}

- (void)_scanningWillStart
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  uint8_t v6[16];

  WFLogForCategory(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "scanning will start", v6, 2u);
  }

  -[WFScanManager setState:](self, "setState:", 2);
  -[WFScanManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "scanManagerScanningWillStart:", self);

}

- (void)_scanningDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  unint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id singleScanBlock;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(6uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      v8 = -[WFScanManager state](self, "state");
      if (v8 > 3)
        v9 = 0;
      else
        v9 = off_24DC35DC8[v8];
      -[WFScanManager networks](self, "networks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v9;
      v21 = 2048;
      v22 = objc_msgSend(v10, "count");
      v23 = 1024;
      v24 = -[WFScanManager supportsUnfilteredScanning](self, "supportsUnfilteredScanning");
      _os_log_impl(&dword_219FC8000, v7, v6, "scanning did finish (current state='%@'), results=%lu, supportsUnfilteredScanning=%u", buf, 0x1Cu);

    }
  }

  ++self->_numberOfScansPerformed;
  if (-[WFScanManager supportsUnfilteredScanning](self, "supportsUnfilteredScanning"))
  {
    if (v4)
      -[WFScanManager _resetNoNetworksFoundCounters](self, "_resetNoNetworksFoundCounters");
    else
      -[WFScanManager _checkForNoNetworksFound](self, "_checkForNoNetworksFound");
  }
  -[WFScanManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFScanManager networks](self, "networks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scanManagerScanningDidFinish:withResults:error:", self, v12, v4);

  -[WFScanManager networks](self, "networks");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[WFScanManager hotspotPluginNetworks](self, "hotspotPluginNetworks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[WFScanManager hotspotPluginNetworks](self, "hotspotPluginNetworks");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scanManager:didFindHotspotHelperNetworks:", self, v16);

      }
    }
  }
  if (-[WFScanManager state](self, "state") != 3 && -[WFScanManager state](self, "state"))
  {
    -[WFScanManager setState:](self, "setState:", 1);
    singleScanBlock = self->_singleScanBlock;
    self->_singleScanBlock = 0;

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__WFScanManager__scanningDidFinishWithError___block_invoke;
    block[3] = &unk_24DC348F8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __45__WFScanManager__scanningDidFinishWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueScan");
}

- (void)_checkForNoNetworksFound
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  id v6;

  -[WFScanManager networks](self, "networks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[WFScanManager _resetNoNetworksFoundCounters](self, "_resetNoNetworksFoundCounters");
    return;
  }
  if (!self->_doUnFilteredScanning)
  {
    ++self->_consecutiveZeroFilteredScanResults;
    self->_doUnFilteredScanning = 1;
    goto LABEL_7;
  }
  v5 = self->_consecutiveZeroUnFilteredScanResults + 1;
  self->_consecutiveZeroUnFilteredScanResults = v5;
  if (v5 >= 2)
  {
LABEL_7:
    -[WFScanManager scanProxy](self, "scanProxy");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "initiateNoNetworksSoftError");

  }
}

- (void)_resetNoNetworksFoundCounters
{
  self->_doUnFilteredScanning = 0;
  self->_consecutiveZeroFilteredScanResults = 0;
  self->_consecutiveZeroUnFilteredScanResults = 0;
}

- (BOOL)_isScanning
{
  return -[WFScanManager state](self, "state") == 2;
}

- (void)_startHotspotPluginScan
{
  NSObject *v3;
  os_log_type_t v4;
  os_log_type_t v5;
  id v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  int v11;
  id v12;
  id buf[2];
  uint8_t v14[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!-[WFScanManager supportsHotspotHelper](self, "supportsHotspotHelper"))
  {
    WFLogForCategory(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v5))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_219FC8000, v3, v5, "hotspot helper is not supported", (uint8_t *)buf, 2u);
    }
    goto LABEL_7;
  }
  if (-[WFScanManager hotspotHelperScanning](self, "hotspotHelperScanning"))
  {
    WFLogForCategory(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "hotspot helper is already scanning", (uint8_t *)buf, 2u);
    }
LABEL_7:

    return;
  }
  objc_initWeak(buf, self);
  v6 = MEMORY[0x24BDAC9B8];
  objc_copyWeak(&v12, buf);
  v7 = CNScanListFilterStart();

  WFLogForCategory(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v8 && os_log_type_enabled(v8, v9))
  {
    *(_DWORD *)v14 = 67109120;
    v15 = v7;
    _os_log_impl(&dword_219FC8000, v8, v9, "starting hotspot helper scanning success=%d", v14, 8u);
  }

  if (v7)
  {
    -[WFScanManager setHotspotHelperScanning:](self, "setHotspotHelperScanning:", 1);
  }
  else
  {
    WFLogForCategory(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, (os_log_type_t)v11))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_219FC8000, v10, (os_log_type_t)v11, "unable to register for CN scan list filtering", v14, 2u);
    }

  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

void __40__WFScanManager__startHotspotPluginScan__block_invoke(uint64_t a1, WFHotspotHelperNetwork *a2, void *a3)
{
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  WFHotspotHelperNetwork *v22;
  NSObject *v23;
  os_log_type_t v24;
  id WeakRetained;
  id obj;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  WFHotspotHelperNetwork *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412546;
    v36 = a2;
    v37 = 2112;
    v38 = a3;
    _os_log_impl(&dword_219FC8000, v5, v6, "CN Callback(%@): %@", buf, 0x16u);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v28 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(obj);
        CNNetworkGetSSIDString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        CNNetworkGetPassword();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CNNetworkGetPluginBundleID();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)CNNetworkCopyPluginNames();
        if (v13)
        {
          v14 = v13;
          v15 = (void *)MEMORY[0x24BDD16A8];
          objc_msgSend(v13, "objectAtIndex:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v14, "count") >= 2)
          {
            v18 = 2;
            v19 = 1;
            do
            {
              objc_msgSend(v14, "objectAtIndex:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "appendFormat:", CFSTR(", %@"), v20);

              v19 = v18;
            }
            while (objc_msgSend(v14, "count") > (unint64_t)v18++);
          }
          CFRelease(v14);
        }
        else
        {
          v17 = 0;
        }
        v22 = -[WFHotspotHelperNetwork initWithSSID:bundleIdentifier:password:label:]([WFHotspotHelperNetwork alloc], "initWithSSID:bundleIdentifier:password:label:", v10, v12, v11, v17);
        objc_msgSend(v29, "addObject:", v22);
        WFLogForCategory(6uLL);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v24))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v22;
          _os_log_impl(&dword_219FC8000, v23, v24, "found hotspot helper network=%@", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHotspotPluginNetworks:", v29);

}

- (void)_stopNetworkPluginScan
{
  BOOL v3;
  NSObject *v4;
  os_log_type_t v5;
  os_log_type_t v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (-[WFScanManager supportsHotspotHelper](self, "supportsHotspotHelper"))
  {
    v3 = -[WFScanManager hotspotHelperScanning](self, "hotspotHelperScanning");
    WFLogForCategory(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v5 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v4 && os_log_type_enabled(v4, v5))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_219FC8000, v4, v5, "stopping hotspot helper scanning", v7, 2u);
      }

      CNScanListFilterStop();
      -[WFScanManager setHotspotHelperScanning:](self, "setHotspotHelperScanning:", 0);
    }
    else
    {
      v6 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v6))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v4, v6, "hotspot helper is not scanning", buf, 2u);
      }

    }
  }
}

- (id)hotspotHelperForScanRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_log_type_t v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFScanManager hotspotPluginNetworks](self, "hotspotPluginNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFScanManager hotspotPluginNetworks](self, "hotspotPluginNetworks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[WFScanManager hotspotPluginNetworks](self, "hotspotPluginNetworks");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(v4, "ssid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateWithFormat:", CFSTR("ssid == %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredSetUsingPredicate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        WFLogForCategory(6uLL);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v14)
        {
          v16 = v14;
          if (os_log_type_enabled(v16, v15))
          {
            objc_msgSend(v4, "ssid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v20 = v17;
            v21 = 2112;
            v22 = v5;
            _os_log_impl(&dword_219FC8000, v16, v15, "found hotspot network for %@ (helper %@)", buf, 0x16u);

          }
        }

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)_knownHiddenNetworkNames
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[WFScanManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFScanManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scanManagerKnownHiddenNetworkNames:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_canResumeScanning
{
  return -[WFScanManager state](self, "state") == 3 || -[WFScanManager state](self, "state") == 0;
}

- (void)_removeQueuedScans
{
  NSObject *scanDispatchQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  scanDispatchQueue = self->_scanDispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__WFScanManager__removeQueuedScans__block_invoke;
  v4[3] = &unk_24DC347A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(scanDispatchQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __35__WFScanManager__removeQueuedScans__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  os_log_type_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WFLogForCategory(6uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2)
  {
    v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      objc_msgSend(WeakRetained, "scanQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_219FC8000, v4, v3, "removing scan queue contents: %@", (uint8_t *)&v7, 0xCu);

    }
  }

  objc_msgSend(WeakRetained, "scanQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

- (unint64_t)consecutiveZeroFilteredScanResults
{
  return self->_consecutiveZeroFilteredScanResults;
}

- (void)setConsecutiveZeroFilteredScanResults:(unint64_t)a3
{
  self->_consecutiveZeroFilteredScanResults = a3;
}

- (unint64_t)consecutiveZeroUnFilteredScanResults
{
  return self->_consecutiveZeroUnFilteredScanResults;
}

- (void)setConsecutiveZeroUnFilteredScanResults:(unint64_t)a3
{
  self->_consecutiveZeroUnFilteredScanResults = a3;
}

- (BOOL)doUnFilteredScanning
{
  return self->_doUnFilteredScanning;
}

- (void)setDoUnFilteredScanning:(BOOL)a3
{
  self->_doUnFilteredScanning = a3;
}

- (WFScanManagerDelegate)delegate
{
  return (WFScanManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)scanInterval
{
  return self->_scanInterval;
}

- (WFScanManagerScanProxy)scanProxy
{
  return self->_scanProxy;
}

- (void)setScanProxy:(id)a3
{
  objc_storeStrong((id *)&self->_scanProxy, a3);
}

- (NSMutableSet)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_networks, a3);
}

- (NSMutableArray)scanQueue
{
  return self->_scanQueue;
}

- (void)setScanQueue:(id)a3
{
  objc_storeStrong((id *)&self->_scanQueue, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (OS_dispatch_queue)scanDispatchQueue
{
  return self->_scanDispatchQueue;
}

- (void)setScanDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_scanDispatchQueue, a3);
}

- (id)singleScanBlock
{
  return self->_singleScanBlock;
}

- (void)setSingleScanBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSMutableSet)hotspotPluginNetworks
{
  return self->_hotspotPluginNetworks;
}

- (void)setHotspotPluginNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_hotspotPluginNetworks, a3);
}

- (BOOL)supportsHotspotHelper
{
  return self->_supportsHotspotHelper;
}

- (void)setSupportsHotspotHelper:(BOOL)a3
{
  self->_supportsHotspotHelper = a3;
}

- (BOOL)supportsUnfilteredScanning
{
  return self->_supportsUnfilteredScanning;
}

- (void)setSupportsUnfilteredScanning:(BOOL)a3
{
  self->_supportsUnfilteredScanning = a3;
}

- (BOOL)hotspotHelperScanning
{
  return self->_hotspotHelperScanning;
}

- (void)setHotspotHelperScanning:(BOOL)a3
{
  self->_hotspotHelperScanning = a3;
}

- (int64_t)numberOfScansPerformed
{
  return self->_numberOfScansPerformed;
}

- (void)setNumberOfScansPerformed:(int64_t)a3
{
  self->_numberOfScansPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotPluginNetworks, 0);
  objc_storeStrong(&self->_singleScanBlock, 0);
  objc_storeStrong((id *)&self->_scanDispatchQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_scanQueue, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_scanProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
