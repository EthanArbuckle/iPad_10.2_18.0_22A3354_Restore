@implementation WPZoneTracker

- (WPZoneTracker)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  WPZoneTracker *v7;
  WPZoneTracker *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPZoneTracker;
  v7 = -[WPClient initWithQueue:machName:](&v10, sel_initWithQueue_machName_, a4, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_wantEntry = 1;
    v8->_wantExit = 1;
  }

  return v8;
}

- (WPZoneTracker)initWithDelegate:(id)a3
{
  return -[WPZoneTracker initWithDelegate:queue:](self, "initWithDelegate:queue:", a3, 0);
}

- (void)invalidate
{
  objc_super v3;

  -[WPZoneTracker setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WPZoneTracker;
  -[WPClient invalidate](&v3, sel_invalidate);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v9.receiver = self;
  v9.super_class = (Class)WPZoneTracker;
  -[WPClient description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WPZoneTracker wantExit](self, "wantExit"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[WPZoneTracker wantExit](self, "wantExit"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR(". Entry = %@, Exit = %@"), v6, v7);
  return v5;
}

- (id)clientAsString
{
  return CFSTR("WPZoneTracker");
}

- (void)registerForZoneChangesMatching:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  int64x2_t v16;
  uint64_t v17;

  v4 = a3;
  -[WPZoneTracker setWantEntry:](self, "setWantEntry:", 1);
  -[WPZoneTracker setWantExit:](self, "setWantExit:", 1);
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("ZTZoneEntry"));

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ZTZoneEntry"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPZoneTracker setWantEntry:](self, "setWantEntry:", objc_msgSend(v7, "BOOLValue"));

  }
  objc_msgSend(v4, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("ZTZoneExit"));

  if (v9)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ZTZoneExit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPZoneTracker setWantExit:](self, "setWantExit:", objc_msgSend(v10, "BOOLValue"));

  }
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setClientType:", 2);
  v16 = vdupq_n_s64(0x3C6uLL);
  v17 = 30;
  objc_msgSend(v11, "setScanningRates:", &v16);
  v12 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ZTZonesArray"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setZones:", v14);

  v15.receiver = self;
  v15.super_class = (Class)WPZoneTracker;
  -[WPClient startTrackingZone:](&v15, sel_startTrackingZone_, v11);

}

- (void)unregisterForZoneChanges:(id)a3
{
  void *v4;
  objc_super v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ZTZonesArray"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)WPZoneTracker;
  -[WPClient stopTrackingZones:](&v5, sel_stopTrackingZones_, v4);

}

- (void)unregisterAllZoneChanges
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WPZoneTracker;
  -[WPClient stopTrackingAllZones](&v2, sel_stopTrackingAllZones);
}

- (void)getCurrentTrackedZones
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WPZoneTracker;
  -[WPClient getAllTrackedZones](&v2, sel_getAllTrackedZones);
}

- (void)enteredZone:(id)a3 manufacturerData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[WPZoneTracker wantEntry](self, "wantEntry"))
  {
    -[WPZoneTracker delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[WPZoneTracker delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "zoneTracker:enteredZone:", self, v6);

    }
  }
  if (-[WPZoneTracker wantEntry](self, "wantEntry"))
  {
    -[WPZoneTracker delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v46 = 0uLL;
      v13 = objc_retainAutorelease(v7);
      v14 = objc_msgSend(v13, "bytes");
      v15 = objc_msgSend(v13, "length");
      if (v15 < 0x10 || (v46 = *(_OWORD *)v14, v15 < 0x12))
      {
        v18 = 0;
        v16 = 0;
      }
      else
      {
        v16 = __rev16(*(unsigned __int16 *)(v14 + 16));
        if (v15 >= 0x14)
        {
          v17 = __rev16(*(unsigned __int16 *)(v14 + 18));
          if (v15 == 20)
            v18 = 0;
          else
            v18 = *(char *)(v14 + 20);
          goto LABEL_13;
        }
        v18 = 0;
      }
      v17 = 0;
LABEL_13:
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v46, 16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_116_1);
        v20 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413570;
          v35 = v19;
          v36 = 2048;
          v37 = v16;
          v38 = 2048;
          v39 = v16;
          v40 = 2048;
          v41 = v17;
          v42 = 2048;
          v43 = v17;
          v44 = 1024;
          v45 = v18;
          _os_log_impl(&dword_209E41000, v20, OS_LOG_TYPE_DEFAULT, "Entered zone %@ with major %ld (0x%lx), minor %ld (0x%lx), tx (%d)", buf, 0x3Au);
        }
        v33[0] = v19;
        v32[0] = CFSTR("WPZoneTrackerKeyZone");
        v32[1] = CFSTR("WPZoneTrackerKeyMajor");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v33[1] = v21;
        v32[2] = CFSTR("WPZoneTrackerKeyMinor");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_120_0);
        v24 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v23;
          _os_log_impl(&dword_209E41000, v24, OS_LOG_TYPE_DEFAULT, "dicToSend: %@", buf, 0xCu);
        }
        -[WPZoneTracker delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v6;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16, CFSTR("WPZoneTrackerKeyZone"), CFSTR("WPZoneTrackerKeyMajor"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v26;
        v30[2] = CFSTR("WPZoneTrackerKeyMinor");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v31[2] = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "zoneTracker:enteredZoneInfo:", self, v28);

      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_15);
        v29 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPZoneTracker enteredZone:manufacturerData:].cold.1(v29);
      }

    }
  }

}

- (void)exitedZone:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[WPZoneTracker wantExit](self, "wantExit"))
  {
    -[WPZoneTracker delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[WPZoneTracker delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "zoneTracker:exitedZone:", self, v7);

    }
  }

}

- (void)failedToRegisterZones:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WPZoneTracker delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[WPZoneTracker delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("ZTZonesArray");
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "zoneTracker:didFailToRegisterZones:withError:", self, v11, v7);

  }
}

- (void)fetchedCurrentlyTrackedZones:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WPZoneTracker delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPZoneTracker delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infoForCurrentlyTrackedZones:", v7);

  }
}

- (void)stateDidChange:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WPZoneTracker;
  -[WPClient stateDidChange:](&v7, sel_stateDidChange_, a3);
  -[WPZoneTracker delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPZoneTracker delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneTrackerDidUpdateState:", self);

  }
}

- (WPZoneTrackerDelegate)delegate
{
  return (WPZoneTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)wantEntry
{
  return self->_wantEntry;
}

- (void)setWantEntry:(BOOL)a3
{
  self->_wantEntry = a3;
}

- (BOOL)wantExit
{
  return self->_wantExit;
}

- (void)setWantExit:(BOOL)a3
{
  self->_wantExit = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)enteredZone:(os_log_t)log manufacturerData:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209E41000, log, OS_LOG_TYPE_ERROR, "Failed to create zoneUUID data", v1, 2u);
}

@end
