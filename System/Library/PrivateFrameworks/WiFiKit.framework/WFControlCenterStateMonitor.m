@implementation WFControlCenterStateMonitor

- (void)performAction
{
  -[WFControlCenterStateMonitor performAction:](self, "performAction:", 0);
}

- (void)performAction:(id)a3
{
  void (**v4)(id, int64_t);
  void *v5;
  int v6;
  _BOOL4 v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  os_log_type_t v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  os_log_type_t v15;
  WFControlCenterStateMonitor *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  __CFString *v23;
  __CFString *v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  os_log_type_t v33;
  BOOL v34;
  int v35;
  NSObject *v36;
  os_log_type_t v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  __CFString *v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  _BOOL4 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, int64_t))a3;
  -[WFWiFiStateMonitor client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPowerModificationDisabled");

  if (v6)
  {
LABEL_2:
    if (v4)
      v4[2](v4, -[WFWiFiStateMonitor state](self, "state"));
    goto LABEL_71;
  }
  v7 = -[WFControlCenterStateMonitor _airplaneModeEnabled](self, "_airplaneModeEnabled");
  v8 = -[WFWiFiStateMonitor state](self, "state");
  v9 = v8 - 2;
  WFLogForCategory(7uLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v10)
  {
    v12 = v10;
    if (os_log_type_enabled(v12, v11))
    {
      WFWiFiStateMonitorStringForState(v8);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v40 = 138543874;
      v41 = v13;
      v42 = 1024;
      v43 = v9 < 3;
      v44 = 1024;
      v45 = v7;
      _os_log_impl(&dword_219FC8000, v12, v11, "{ACTION+} current state='%{public}@' poweredOn=%d airplaneMode=%d", (uint8_t *)&v40, 0x18u);

    }
  }

  if (v8 == 1)
  {
    WFLogForCategory(7uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      LOWORD(v40) = 0;
      _os_log_impl(&dword_219FC8000, v14, v15, "{ACTION*} set powered to ON", (uint8_t *)&v40, 2u);
    }

    if (v4)
      v4[2](v4, 3);
    v16 = self;
    v17 = 3;
    goto LABEL_70;
  }
  v18 = !v7;
  if (v9 > 2)
    v18 = 1;
  if ((v18 & 1) == 0)
  {
    if (v8 == 2)
      v19 = 1;
    else
      v19 = 2;
    if (v8 == 2)
      v20 = 3;
    else
      v20 = 1;
    WFLogForCategory(7uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
    {
      v23 = CFSTR("Power Off");
      if (v8 == 2)
        v23 = CFSTR("Enable Auto Join");
      v40 = 138543362;
      v41 = v23;
      v24 = v23;
      _os_log_impl(&dword_219FC8000, v21, v22, "{ACTION*} airplane mode is ON, next action is %{public}@", (uint8_t *)&v40, 0xCu);

    }
    if (v4)
      v4[2](v4, v20);
    v16 = self;
    v17 = v19;
    goto LABEL_70;
  }
  if (v8 != 2)
  {
    if (v8 - 3 > 1)
    {
      if (v8 != 5)
        goto LABEL_2;
      WFLogForCategory(7uLL);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v36 && os_log_type_enabled(v36, v37))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_219FC8000, v36, v37, "{ACTION*} MIS active, prompting user", (uint8_t *)&v40, 2u);
      }

      if (v4)
        v4[2](v4, 5);
      v16 = self;
      v17 = 4;
    }
    else
    {
      WFLogForCategory(7uLL);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v27 && os_log_type_enabled(v27, v28))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_219FC8000, v27, v28, "{ACTION*} diassociate and set userAutoJoin=0", (uint8_t *)&v40, 2u);
      }

      if (v4)
        v4[2](v4, 2);
      v16 = self;
      v17 = 0;
    }
LABEL_70:
    -[WFControlCenterStateMonitor _performAction:](v16, "_performAction:", v17);
    goto LABEL_71;
  }
  if (-[WFWiFiStateMonitor associatedToCarPlayOnly](self, "associatedToCarPlayOnly"))
  {
    WFLogForCategory(7uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
    {
      LOWORD(v40) = 0;
      _os_log_impl(&dword_219FC8000, v25, v26, "{ACTION*} associated to CarPlay Only network, prompting user", (uint8_t *)&v40, 2u);
    }

    v16 = self;
    v17 = 6;
    goto LABEL_70;
  }
  if (-[WFControlCenterStateMonitor _isCellularOutrankingWiFi](self, "_isCellularOutrankingWiFi"))
  {
    -[WFWiFiStateMonitor client](self, "client");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "interface");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "currentNetwork");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    WFLogForCategory(7uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v34 = v32 == 0;
    else
      v34 = 1;
    v35 = !v34;
    if (v31)
    {
      if (v35 && os_log_type_enabled(v32, v33))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_219FC8000, v32, v33, "{ACTION*} cellular is outranking WiFi, promping user", (uint8_t *)&v40, 2u);
      }

      v16 = self;
      v17 = 8;
      goto LABEL_70;
    }
    if (v35 && os_log_type_enabled(v32, v33))
    {
      LOWORD(v40) = 0;
      _os_log_impl(&dword_219FC8000, v32, v33, "Cellular outrank is in progress with no current network", (uint8_t *)&v40, 2u);
    }

  }
  WFLogForCategory(7uLL);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v38 && os_log_type_enabled(v38, v39))
  {
    LOWORD(v40) = 0;
    _os_log_impl(&dword_219FC8000, v38, v39, "{ACTION*} setting userAutoJoin=1", (uint8_t *)&v40, 2u);
  }

  if (v4)
    v4[2](v4, 3);
  -[WFControlCenterStateMonitor _performAction:](self, "_performAction:", 1);
  -[WFWiFiStateMonitor _updateState](self, "_updateState");
LABEL_71:

}

- (void)_performAction:(int64_t)a3
{
  NSObject *v5;
  os_log_type_t v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  os_log_type_t v27;
  NSObject *v28;
  os_log_type_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  os_log_type_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    if ((unint64_t)a3 > 9)
      v7 = CFSTR("Unknown");
    else
      v7 = off_24DC356C0[a3];
    *(_DWORD *)buf = 138543362;
    v47 = (const char *)v7;
    _os_log_impl(&dword_219FC8000, v5, v6, "{ACTION-} performing action='%{public}@'", buf, 0xCu);
  }

  switch(a3)
  {
    case 0:
      WFLogForCategory(7uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_219FC8000, v9, v10, "%s: disabling user autojoin", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      -[WFWiFiStateMonitor client](self, "client");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_3;
      v40[3] = &unk_24DC347A0;
      objc_copyWeak(&v41, (id *)buf);
      objc_msgSend(v11, "setUserAutoJoinState:completion:", 0, v40);

      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)buf);
      break;
    case 1:
      WFLogForCategory(7uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_219FC8000, v12, v13, "%s: enabling user autojoin", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      -[WFWiFiStateMonitor client](self, "client");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_1;
      v42[3] = &unk_24DC347A0;
      objc_copyWeak(&v43, (id *)buf);
      objc_msgSend(v14, "setUserAutoJoinState:completion:", 1, v42);

      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)buf);
      break;
    case 2:
    case 3:
      objc_initWeak((id *)buf, self);
      -[WFWiFiStateMonitor client](self, "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke;
      v44[3] = &unk_24DC35010;
      objc_copyWeak(&v45, (id *)buf);
      objc_msgSend(v8, "setPoweredToggle:handler:", a3 == 3, v44);

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);
      break;
    case 4:
      WFLogForCategory(7uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_219FC8000, v15, v16, "%s: prompting to disable MIS", buf, 0xCu);
      }

      -[WFControlCenterStateMonitor _promptMISDisable](self, "_promptMISDisable");
      break;
    case 5:
      WFLogForCategory(7uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_219FC8000, v22, v23, "%s: disable MIS", buf, 0xCu);
      }

      -[WFWiFiStateMonitor client](self, "client");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setMISDiscoveryState:immediateDisable:", 0, 1);

      -[WFWiFiStateMonitor client](self, "client");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setMISState:", 0);

      -[WFWiFiStateMonitor _updateState](self, "_updateState");
      break;
    case 6:
      WFLogForCategory(7uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v26 && os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_219FC8000, v26, v27, "%s: prompting to disable CarPlay", buf, 0xCu);
      }

      -[WFControlCenterStateMonitor _promptCarPlayDisable](self, "_promptCarPlayDisable");
      break;
    case 7:
      WFLogForCategory(7uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v28 && os_log_type_enabled(v28, v29))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_219FC8000, v28, v29, "%s: disable CarPlay", buf, 0xCu);
      }

      -[WFWiFiStateMonitor client](self, "client");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "interface");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_5;
        v39[3] = &unk_24DC348F8;
        v39[4] = self;
        objc_msgSend(v31, "disassociateFromCurrentNetworkWithCompletion:", v39);
      }
      else
      {
        WFLogForCategory(7uLL);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v36 && os_log_type_enabled(v36, v37))
        {
          *(_DWORD *)buf = 136315138;
          v47 = "-[WFControlCenterStateMonitor _performAction:]";
          _os_log_impl(&dword_219FC8000, v36, v37, "%s: failed to get WFInterface", buf, 0xCu);
        }

      }
      break;
    case 8:
      WFLogForCategory(7uLL);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v32 && os_log_type_enabled(v32, v33))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_219FC8000, v32, v33, "%s: prompting to disable cellular outrank", buf, 0xCu);
      }

      -[WFControlCenterStateMonitor _promptCellularOutankDisable](self, "_promptCellularOutankDisable");
      break;
    case 9:
      WFLogForCategory(7uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_219FC8000, v17, v18, "%s: disabling cellular outrank", buf, 0xCu);
      }

      -[WFWiFiStateMonitor client](self, "client");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "interface");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v20, "currentNetwork");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_6;
        v38[3] = &unk_24DC356A0;
        v38[4] = self;
        objc_msgSend(v20, "asyncAssociateToNetwork:profile:reply:", v21, 0, v38);

      }
      else
      {
        WFLogForCategory(7uLL);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v34 && os_log_type_enabled(v34, v35))
        {
          *(_DWORD *)buf = 136315138;
          v47 = "-[WFControlCenterStateMonitor _performAction:]";
          _os_log_impl(&dword_219FC8000, v34, v35, "%s: failed to get WFInterface", buf, 0xCu);
        }

      }
      break;
    default:
      return;
  }
}

void __46__WFControlCenterStateMonitor__performAction___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  os_log_type_t v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(7uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v7 = 136315394;
    v8 = "-[WFControlCenterStateMonitor _performAction:]_block_invoke";
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: power toggle handler called, powered=%d", (uint8_t *)&v7, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateState");

}

void __46__WFControlCenterStateMonitor__performAction___block_invoke_1(uint64_t a1)
{
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_2;
  block[3] = &unk_24DC348F8;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __46__WFControlCenterStateMonitor__performAction___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

void __46__WFControlCenterStateMonitor__performAction___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_2_4;
  block[3] = &unk_24DC348F8;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __46__WFControlCenterStateMonitor__performAction___block_invoke_2_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

uint64_t __46__WFControlCenterStateMonitor__performAction___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

void __46__WFControlCenterStateMonitor__performAction___block_invoke_6(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WFLogForCategory(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_219FC8000, v6, v7, "cellular outrank association success=%d error='%@'", (uint8_t *)v8, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

- (BOOL)_airplaneModeEnabled
{
  const __SCPreferences *v2;
  const __SCPreferences *v3;
  BOOL v4;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("com.apple.wifikit"), CFSTR("com.apple.radios.plist"));
  if (v2)
  {
    v3 = v2;
    v4 = SCPreferencesGetValue(v2, CFSTR("AirplaneMode")) == (CFPropertyListRef)*MEMORY[0x24BDBD270];
    CFRelease(v3);
  }
  else
  {
    WFLogForCategory(7uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      v8 = 136315138;
      v9 = "-[WFControlCenterStateMonitor _airplaneModeEnabled]";
      _os_log_impl(&dword_219FC8000, v6, v7, "%s: failed to create preferences ref", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
  return v4;
}

- (BOOL)_isCellularOutrankingWiFi
{
  void *v2;
  char v3;

  -[WFWiFiStateMonitor client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCellularOutrankingWiFi");

  return v3;
}

- (void)_promptMISDisable
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id from;
  id location;

  +[WFMISDisablePromptOperation misDisablePromptOperation](WFMISDisablePromptOperation, "misDisablePromptOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__WFControlCenterStateMonitor__promptMISDisable__block_invoke;
  v5[3] = &unk_24DC34DA0;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  objc_msgSend(v3, "setCompletionBlock:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __48__WFControlCenterStateMonitor__promptMISDisable__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__WFControlCenterStateMonitor__promptMISDisable__block_invoke_2;
  v5[3] = &unk_24DC34BE8;
  v6 = WeakRetained;
  v7 = v3;
  v4 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __48__WFControlCenterStateMonitor__promptMISDisable__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  int v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "result");
  WFLogForCategory(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v5 = v3 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (v2 == 2)
  {
    if (v6)
    {
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v3, v4, "User accepted prompt to disable MIS", buf, 2u);
      }
    }

    objc_msgSend(*(id *)(a1 + 40), "_performAction:", 5);
  }
  else
  {
    if (v6 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "User did not accept prompt to disable MIS", v7, 2u);
    }

  }
}

- (void)_promptCarPlayDisable
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id from;
  id location;

  +[WFCarPlayDisablePromptOperation carPlayDisablePromptOperation](WFCarPlayDisablePromptOperation, "carPlayDisablePromptOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__WFControlCenterStateMonitor__promptCarPlayDisable__block_invoke;
  v5[3] = &unk_24DC34DA0;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  objc_msgSend(v3, "setCompletionBlock:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __52__WFControlCenterStateMonitor__promptCarPlayDisable__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__WFControlCenterStateMonitor__promptCarPlayDisable__block_invoke_2;
  v5[3] = &unk_24DC34BE8;
  v6 = WeakRetained;
  v7 = v3;
  v4 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __52__WFControlCenterStateMonitor__promptCarPlayDisable__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  int v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "result");
  WFLogForCategory(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v5 = v3 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (v2 == 2)
  {
    if (v6)
    {
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v3, v4, "User accepted prompt to disable CarPlay", buf, 2u);
      }
    }

    objc_msgSend(*(id *)(a1 + 40), "_performAction:", 7);
  }
  else
  {
    if (v6 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "User did not accept prompt to disable CarPlay", v7, 2u);
    }

  }
}

- (void)_promptCellularOutankDisable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  os_log_type_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  id location[2];

  -[WFWiFiStateMonitor client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentNetwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFWiFiStateMonitor client](self, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:](WFCellularOutrankPromptOperation, "cellularOutrankPromptOperationWithNetworkName:privateCellular:", v6, objc_msgSend(v7, "cellularOutrankState") == 5);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v8);

    objc_initWeak(location, v8);
    objc_initWeak(&from, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__WFControlCenterStateMonitor__promptCellularOutankDisable__block_invoke;
    v11[3] = &unk_24DC34DA0;
    objc_copyWeak(&v12, location);
    objc_copyWeak(&v13, &from);
    -[NSObject setCompletionBlock:](v8, "setCompletionBlock:", v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    WFLogForCategory(7uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v10))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_219FC8000, v8, v10, "nil network name, unable to prompt for cellular outrank", (uint8_t *)location, 2u);
    }
  }

}

void __59__WFControlCenterStateMonitor__promptCellularOutankDisable__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__WFControlCenterStateMonitor__promptCellularOutankDisable__block_invoke_2;
  v5[3] = &unk_24DC34BE8;
  v6 = WeakRetained;
  v7 = v3;
  v4 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __59__WFControlCenterStateMonitor__promptCellularOutankDisable__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  int v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "result");
  WFLogForCategory(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v5 = v3 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (v2 == 2)
  {
    if (v6)
    {
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v3, v4, "User accepted prompt to disable cellular outrank", buf, 2u);
      }
    }

    objc_msgSend(*(id *)(a1 + 40), "_performAction:", 9);
  }
  else
  {
    if (v6 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_219FC8000, v3, v4, "User did not accept prompt to disable cellular outrank", v7, 2u);
    }

  }
}

@end
