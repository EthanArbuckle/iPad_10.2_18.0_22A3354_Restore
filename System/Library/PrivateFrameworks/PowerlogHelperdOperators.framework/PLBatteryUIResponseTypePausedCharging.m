@implementation PLBatteryUIResponseTypePausedCharging

- (id)dependencies
{
  return 0;
}

- (void)getChargingData
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "end");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a2, v6, "After monotonic conversion Query Range start=%@, end=%@", v7);

  OUTLINED_FUNCTION_8();
}

- (int)getState:(signed __int16)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v32 = v3;
    _os_log_debug_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_DEBUG, "Get state for type: %d", buf, 8u);
  }

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  v8 = v7;
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  v11 = v9 + v10;
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  v13 = v12;
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("((timestamp BETWEEN %f AND %f) OR (%@ BETWEEN %f AND %f)) AND %@=\"%hd\"), v8, *(_QWORD *)&v11, CFSTR("timestampEnd"), v13, v14 + v15, CFSTR("intervalType"), v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging storage](self, "storage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging chargingStateIntervalsEntryKey](self, "chargingStateIntervalsEntryKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastEntryForKey:withFilters:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging setLastEntry:](self, "setLastEntry:", v20);

  -[PLBatteryUIResponseTypePausedCharging lastEntry](self, "lastEntry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_INFO, "Entry exists in last 24hrs.", buf, 2u);
    }

    if ((_DWORD)v3 == 8)
    {
      -[PLBatteryUIResponseTypePausedCharging lastEntry](self, "lastEntry");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("chargeLimitTargetSoC"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[PLBatteryUIResponseTypePausedCharging lastEntry](self, "lastEntry");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("chargeLimitTargetSoC"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBatteryUIResponseTypePausedCharging setFixedChargingLimit:](self, "setFixedChargingLimit:", v27);

      }
    }
    -[PLBatteryUIResponseTypePausedCharging lastEntry](self, "lastEntry");
    v22 = objc_claimAutoreleasedReturnValue();
    v28 = -[PLBatteryUIResponseTypePausedCharging configureState:](self, "configureState:", v22);
  }
  else if (v23)
  {
    *(_WORD *)buf = 0;
    v28 = 1;
    _os_log_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_INFO, "No entries in 24hr time range", buf, 2u);
  }
  else
  {
    v28 = 1;
  }

  return v28;
}

- (int)configureState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  int v31;
  void *v32;
  __int16 v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  int v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  id v72;
  id v73;
  uint8_t buf[4];
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypePausedCharging configureState:].cold.19();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypePausedCharging configureState:].cold.18(v4, v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    v13 = v12;

    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypePausedCharging configureState:].cold.17();

    -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15)
    {
      if (v17)
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.16(self, v16);

      -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
      if (v23)
      {
        if (v25)
          -[PLBatteryUIResponseTypePausedCharging configureState:].cold.15();

        -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSince1970");
        v29 = v28;

        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[PLBatteryUIResponseTypePausedCharging configureState:].cold.14();

        v31 = 1;
        if (v21 > v13 || v29 < v8)
          goto LABEL_76;
      }
      else
      {
        if (v25)
          -[PLBatteryUIResponseTypePausedCharging configureState:].cold.13();

        if (v21 > v13)
        {
          v31 = 1;
          goto LABEL_76;
        }
      }
    }
    else
    {
      if (v17)
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.12();

    }
    v31 = 4;
    goto LABEL_76;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intervalType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "intValue");

  PLLogCommon();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v75 = v33;
    _os_log_debug_impl(&dword_1DA9D6000, v34, OS_LOG_TYPE_DEBUG, "Entry is open: %d", buf, 8u);
  }

  v31 = 1;
  switch(v33)
  {
    case 2:
      PLLogCommon();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.6();

      -[PLBatteryUIResponseTypePausedCharging setSmartChargingDeadline:](self, "setSmartChargingDeadline:", 0);
      v36 = objc_alloc(MEMORY[0x1E0D7FE88]);
      v37 = (void *)objc_msgSend(v36, "initWithClientName:", *MEMORY[0x1E0D7FE98]);
      -[PLBatteryUIResponseTypePausedCharging setSmartChargingClient:](self, "setSmartChargingClient:", v37);

      -[PLBatteryUIResponseTypePausedCharging smartChargingClient](self, "smartChargingClient");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0;
      objc_msgSend(v38, "fullChargeDeadline:", &v73);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v73;

      if (v40)
      {
        PLLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          -[PLBatteryUIResponseTypePausedCharging configureState:].cold.5();

      }
      else
      {
        -[PLBatteryUIResponseTypePausedCharging setSmartChargingDeadline:](self, "setSmartChargingDeadline:", v39);
      }
      PLLogCommon();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.4(self, v70);
      goto LABEL_74;
    case 3:
      PLLogCommon();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.11();

      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "timeIntervalSinceDate:", v49);
      v51 = v50;

      PLLogCommon();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.10(v52, v51, v53, v54);
      if (v51 >= 960.0 || v51 <= 0.0)
        v56 = 1;
      else
        v56 = 2;
      if (v51 >= 960.0)
        v31 = 3;
      else
        v31 = v56;

      goto LABEL_76;
    case 7:
      PLLogCommon();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.9();

      -[PLBatteryUIResponseTypePausedCharging setCleanEnergyChargingDeadline:](self, "setCleanEnergyChargingDeadline:", 0);
      v43 = objc_alloc(MEMORY[0x1E0D7FE88]);
      v44 = (void *)objc_msgSend(v43, "initWithClientName:", *MEMORY[0x1E0D7FE98]);
      -[PLBatteryUIResponseTypePausedCharging setCleanEnergyChargingClient:](self, "setCleanEnergyChargingClient:", v44);

      -[PLBatteryUIResponseTypePausedCharging cleanEnergyChargingClient](self, "cleanEnergyChargingClient");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      objc_msgSend(v45, "cecFullChargeDeadline:", &v72);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v72;

      if (v40)
      {
        PLLogCommon();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          -[PLBatteryUIResponseTypePausedCharging configureState:].cold.8();

      }
      else
      {
        -[PLBatteryUIResponseTypePausedCharging setCleanEnergyChargingDeadline:](self, "setCleanEnergyChargingDeadline:", v39);
      }
      PLLogCommon();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.7(self, v70);
LABEL_74:

      goto LABEL_75;
    case 8:
      PLLogCommon();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.2();

      -[PLBatteryUIResponseTypePausedCharging fixedChargingLimit](self, "fixedChargingLimit");
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58)
        goto LABEL_75;
      v59 = (void *)v58;
      -[PLBatteryUIResponseTypePausedCharging currentChargeLevel](self, "currentChargeLevel");
      v60 = objc_claimAutoreleasedReturnValue();
      if (!v60)
      {

        goto LABEL_75;
      }
      v61 = (void *)v60;
      -[PLBatteryUIResponseTypePausedCharging fixedChargingLimit](self, "fixedChargingLimit");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "doubleValue");
      v64 = v63;
      -[PLBatteryUIResponseTypePausedCharging currentChargeLevel](self, "currentChargeLevel");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "doubleValue");
      v67 = v66;

      if (v64 >= v67)
      {
LABEL_75:
        v31 = 3;
        goto LABEL_76;
      }
      PLLogCommon();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.1();

      v31 = 5;
LABEL_76:

      return v31;
    case 9:
      if (!objc_msgSend(MEMORY[0x1E0D7FFF8], "supportsSlowCharging"))
        goto LABEL_76;
      PLLogCommon();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.3();

      goto LABEL_75;
    default:
      goto LABEL_76;
  }
}

- (void)getCameraStreamingState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  uint8_t buf[16];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  v5 = v4;
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  v8 = v6 + v7;
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  v10 = v9;
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("((timestamp BETWEEN %f AND %f) AND (%@ BETWEEN %f AND %f)) AND %@=\"%hd\"), v5, *(_QWORD *)&v8, CFSTR("timestampEnd"), v10, v11 + v12, CFSTR("intervalType"), 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging storage](self, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging chargingStateIntervalsEntryKey](self, "chargingStateIntervalsEntryKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastEntryForKey:withFilters:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging setLastCameraStreamingEntry:](self, "setLastCameraStreamingEntry:", v17);

  -[PLBatteryUIResponseTypePausedCharging lastCameraStreamingEntry](self, "lastCameraStreamingEntry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_INFO, "Camera Streaming Entry exists in last 24hrs.", buf, 2u);
    }

    -[PLBatteryUIResponseTypePausedCharging configureCameraStreaming](self, "configureCameraStreaming");
  }
  else
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_INFO, "No Camera Streaming entries in 24hr time range", buf, 2u);
    }

  }
}

- (void)configureCameraStreaming
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  _BOOL4 v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  int v42;
  double v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypePausedCharging setWasCameraStreaming:](self, "setWasCameraStreaming:", 0);
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PLBatteryUIResponseTypePausedCharging lastCameraStreamingEntry](self, "lastCameraStreamingEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138412290;
    v43 = *(double *)&v4;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_INFO, "Camera Entry:%@", (uint8_t *)&v42, 0xCu);

  }
  -[PLBatteryUIResponseTypePausedCharging lastCameraStreamingEntry](self, "lastCameraStreamingEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_19;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[PLBatteryUIResponseTypePausedCharging lastCameraStreamingEntry](self, "lastCameraStreamingEntry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypePausedCharging lastCameraStreamingEntry](self, "lastCameraStreamingEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138412546;
    v43 = *(double *)&v9;
    v44 = 2112;
    v45 = *(double *)&v11;
    _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_INFO, "Last Camera Streaming Entry was opened at %@ and closed at %@", (uint8_t *)&v42, 0x16u);

  }
  -[PLBatteryUIResponseTypePausedCharging lastCameraStreamingEntry](self, "lastCameraStreamingEntry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  -[PLBatteryUIResponseTypePausedCharging lastCameraStreamingEntry](self, "lastCameraStreamingEntry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  v19 = v18;

  PLLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v42 = 134218240;
    v43 = v15;
    v44 = 2048;
    v45 = v19;
    _os_log_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_INFO, "Converted values to doubles: start: %f and end: %f", (uint8_t *)&v42, 0x16u);
  }

  -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v23)
    {
      -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138412290;
      v43 = *(double *)&v24;
      _os_log_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_INFO, "Connected Entry:%@", (uint8_t *)&v42, 0xCu);

    }
    -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

    -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
    if (v30)
    {
      if (v32)
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1DA9D6000, v31, OS_LOG_TYPE_INFO, "Closed External Connected Entry", (uint8_t *)&v42, 2u);
      }

      -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSince1970");
      v36 = v35;

      PLLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v42 = 134218240;
        v43 = v28;
        v44 = 2048;
        v45 = v36;
        _os_log_impl(&dword_1DA9D6000, v37, OS_LOG_TYPE_INFO, "start: %f, end: %f", (uint8_t *)&v42, 0x16u);
      }

      if (v28 <= v19 && v36 >= v15)
LABEL_18:
        -[PLBatteryUIResponseTypePausedCharging setWasCameraStreaming:](self, "setWasCameraStreaming:", 1);
    }
    else
    {
      if (v32)
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1DA9D6000, v31, OS_LOG_TYPE_INFO, "Open External Connected Entry", (uint8_t *)&v42, 2u);
      }

      if (v28 <= v19)
        goto LABEL_18;
    }
LABEL_19:
    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v38 = -[PLBatteryUIResponseTypePausedCharging wasCameraStreaming](self, "wasCameraStreaming");
      v42 = 67109120;
      LODWORD(v43) = v38;
      v39 = "Was Camera Streaming: %d";
      v40 = v22;
      v41 = 8;
LABEL_23:
      _os_log_impl(&dword_1DA9D6000, v40, OS_LOG_TYPE_INFO, v39, (uint8_t *)&v42, v41);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (v23)
  {
    LOWORD(v42) = 0;
    v39 = "No External Connected Entry exists in last 24hrs";
    v40 = v22;
    v41 = 2;
    goto LABEL_23;
  }
LABEL_24:

}

- (void)getTLCWithCameraStreamingState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  uint8_t buf[16];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  v5 = v4;
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  v8 = v6 + v7;
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  v10 = v9;
  -[PLBatteryUIResponseTypePausedCharging range](self, "range");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("((timestamp BETWEEN %f AND %f) AND (%@ BETWEEN %f AND %f)) AND %@=\"%hd\"), v5, *(_QWORD *)&v8, CFSTR("timestampEnd"), v10, v11 + v12, CFSTR("intervalType"), 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging storage](self, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging chargingStateIntervalsEntryKey](self, "chargingStateIntervalsEntryKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastEntryForKey:withFilters:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging setLastTLCWithCameraStreamingEntry:](self, "setLastTLCWithCameraStreamingEntry:", v17);

  -[PLBatteryUIResponseTypePausedCharging lastTLCWithCameraStreamingEntry](self, "lastTLCWithCameraStreamingEntry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_INFO, "TLC with Camera Streaming Entry exists in last 24hrs.", buf, 2u);
    }

    -[PLBatteryUIResponseTypePausedCharging configureTLCWithCameraStreaming](self, "configureTLCWithCameraStreaming");
  }
  else
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_INFO, "No TLC with Camera Streaming entries in 24hr time range", buf, 2u);
    }

  }
}

- (void)configureTLCWithCameraStreaming
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  _BOOL4 v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  int v42;
  double v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypePausedCharging setWasTLCWithCameraStreaming:](self, "setWasTLCWithCameraStreaming:", 0);
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PLBatteryUIResponseTypePausedCharging lastTLCWithCameraStreamingEntry](self, "lastTLCWithCameraStreamingEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138412290;
    v43 = *(double *)&v4;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_INFO, "TLC with Camera Entry:%@", (uint8_t *)&v42, 0xCu);

  }
  -[PLBatteryUIResponseTypePausedCharging lastTLCWithCameraStreamingEntry](self, "lastTLCWithCameraStreamingEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_19;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[PLBatteryUIResponseTypePausedCharging lastTLCWithCameraStreamingEntry](self, "lastTLCWithCameraStreamingEntry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypePausedCharging lastTLCWithCameraStreamingEntry](self, "lastTLCWithCameraStreamingEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138412546;
    v43 = *(double *)&v9;
    v44 = 2112;
    v45 = *(double *)&v11;
    _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_INFO, "Last TLC with Camera Streaming Entry was opened at %@ and closed at %@", (uint8_t *)&v42, 0x16u);

  }
  -[PLBatteryUIResponseTypePausedCharging lastTLCWithCameraStreamingEntry](self, "lastTLCWithCameraStreamingEntry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  -[PLBatteryUIResponseTypePausedCharging lastTLCWithCameraStreamingEntry](self, "lastTLCWithCameraStreamingEntry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  v19 = v18;

  PLLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v42 = 134218240;
    v43 = v15;
    v44 = 2048;
    v45 = v19;
    _os_log_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_INFO, "Converted values to doubles: start: %f and end: %f", (uint8_t *)&v42, 0x16u);
  }

  -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v23)
    {
      -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138412290;
      v43 = *(double *)&v24;
      _os_log_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_INFO, "Connected Entry:%@", (uint8_t *)&v42, 0xCu);

    }
    -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

    -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
    if (v30)
    {
      if (v32)
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1DA9D6000, v31, OS_LOG_TYPE_INFO, "Closed External Connected Entry", (uint8_t *)&v42, 2u);
      }

      -[PLBatteryUIResponseTypePausedCharging lastConnectedEntry](self, "lastConnectedEntry");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSince1970");
      v36 = v35;

      PLLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v42 = 134218240;
        v43 = v28;
        v44 = 2048;
        v45 = v36;
        _os_log_impl(&dword_1DA9D6000, v37, OS_LOG_TYPE_INFO, "start: %f, end: %f", (uint8_t *)&v42, 0x16u);
      }

      if (v28 <= v19 && v36 >= v15)
LABEL_18:
        -[PLBatteryUIResponseTypePausedCharging setWasTLCWithCameraStreaming:](self, "setWasTLCWithCameraStreaming:", 1);
    }
    else
    {
      if (v32)
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1DA9D6000, v31, OS_LOG_TYPE_INFO, "Open External Connected Entry", (uint8_t *)&v42, 2u);
      }

      if (v28 <= v19)
        goto LABEL_18;
    }
LABEL_19:
    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v38 = -[PLBatteryUIResponseTypePausedCharging wasTLCWithCameraStreaming](self, "wasTLCWithCameraStreaming");
      v42 = 67109120;
      LODWORD(v43) = v38;
      v39 = "Was TLC with Camera Streaming: %d";
      v40 = v22;
      v41 = 8;
LABEL_23:
      _os_log_impl(&dword_1DA9D6000, v40, OS_LOG_TYPE_INFO, v39, (uint8_t *)&v42, v41);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (v23)
  {
    LOWORD(v42) = 0;
    v39 = "No External Connected Entry exists in last 24hrs";
    v40 = v22;
    v41 = 2;
    goto LABEL_23;
  }
LABEL_24:

}

- (void)configure:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  -[PLBatteryUIResponseTypePausedCharging setPausedChargingState:](self, "setPausedChargingState:", 100);
  -[PLBatteryUIResponseTypePausedCharging setIntervalStateTLC:](self, "setIntervalStateTLC:", 1);
  -[PLBatteryUIResponseTypePausedCharging setIntervalStateSmartCharging:](self, "setIntervalStateSmartCharging:", 1);
  -[PLBatteryUIResponseTypePausedCharging getChargingData](self, "getChargingData");
  -[PLBatteryUIResponseTypePausedCharging getCameraStreamingState](self, "getCameraStreamingState");
  -[PLBatteryUIResponseTypePausedCharging getTLCWithCameraStreamingState](self, "getTLCWithCameraStreamingState");
  -[PLBatteryUIResponseTypePausedCharging setIntervalStateFixedCharging:](self, "setIntervalStateFixedCharging:", -[PLBatteryUIResponseTypePausedCharging getState:](self, "getState:", 8));
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypePausedCharging configure:].cold.5(self);

  if (objc_msgSend(MEMORY[0x1E0D7FFF8], "supportsSlowCharging"))
  {
    -[PLBatteryUIResponseTypePausedCharging setIntervalStateChargingSpeed:](self, "setIntervalStateChargingSpeed:", -[PLBatteryUIResponseTypePausedCharging getState:](self, "getState:", 9));
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypePausedCharging configure:].cold.4(self);

  }
  -[PLBatteryUIResponseTypePausedCharging setIntervalStateSmartCharging:](self, "setIntervalStateSmartCharging:", -[PLBatteryUIResponseTypePausedCharging getState:](self, "getState:", 2));
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypePausedCharging configure:].cold.3(self);

  -[PLBatteryUIResponseTypePausedCharging setIntervalStateCEC:](self, "setIntervalStateCEC:", -[PLBatteryUIResponseTypePausedCharging getState:](self, "getState:", 7));
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypePausedCharging configure:].cold.2(self);

  -[PLBatteryUIResponseTypePausedCharging setIntervalStateTLC:](self, "setIntervalStateTLC:", -[PLBatteryUIResponseTypePausedCharging getState:](self, "getState:", 3));
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypePausedCharging configure:].cold.1(self);

}

- (void)setCurrentlyChargingStates
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Setting Currently Charging States", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setChargingPausedStates
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Unknown reason for pause, surfacing normal charging string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setTerminatedChargingStates
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Unknown reason", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)run
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Charge is at 100", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (id)result
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLBatteryUIResponseTypePausedCharging setResultDictionary:](self, "setResultDictionary:", v3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBatteryUIResponseTypePausedCharging pausedChargingState](self, "pausedChargingState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging resultDictionary](self, "resultDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("PLBatteryUIPausedChargingStateKey"));

  -[PLBatteryUIResponseTypePausedCharging currentChargeLevel](self, "currentChargeLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypePausedCharging resultDictionary](self, "resultDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("PLBatteryUIPausedChargingCurrentPercentageKey"));

  -[PLBatteryUIResponseTypePausedCharging fixedChargingLimit](self, "fixedChargingLimit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLBatteryUIResponseTypePausedCharging fixedChargingLimit](self, "fixedChargingLimit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypePausedCharging resultDictionary](self, "resultDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("PLBatteryUIPausedChargingFixedChargeLimitKey"));

  }
  -[PLBatteryUIResponseTypePausedCharging smartChargingDeadline](self, "smartChargingDeadline");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v13)
      -[PLBatteryUIResponseTypePausedCharging result].cold.4(self, v12);

    -[PLBatteryUIResponseTypePausedCharging smartChargingDeadline](self, "smartChargingDeadline");
    v12 = objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypePausedCharging resultDictionary](self, "resultDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("PLBatteryUIScheduleOBCKey"));

  }
  else if (v13)
  {
    -[PLBatteryUIResponseTypePausedCharging result].cold.3();
  }

  -[PLBatteryUIResponseTypePausedCharging cleanEnergyChargingDeadline](self, "cleanEnergyChargingDeadline");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (v15)
  {
    if (v17)
      -[PLBatteryUIResponseTypePausedCharging result].cold.2(self, v16);

    -[PLBatteryUIResponseTypePausedCharging cleanEnergyChargingDeadline](self, "cleanEnergyChargingDeadline");
    v16 = objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypePausedCharging resultDictionary](self, "resultDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("PLBatteryUIScheduleCECKey"));

  }
  else if (v17)
  {
    -[PLBatteryUIResponseTypePausedCharging result].cold.1();
  }

  -[PLBatteryUIResponseTypePausedCharging resultDictionary](self, "resultDictionary");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 40, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PLEntry)lastSmartChargingEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastSmartChargingEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int)intervalStateSmartCharging
{
  return self->_intervalStateSmartCharging;
}

- (void)setIntervalStateSmartCharging:(int)a3
{
  self->_intervalStateSmartCharging = a3;
}

- (PowerUISmartChargeClient)smartChargingClient
{
  return (PowerUISmartChargeClient *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSmartChargingClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)smartChargingDeadline
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSmartChargingDeadline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PowerUISmartChargeClient)cleanEnergyChargingClient
{
  return (PowerUISmartChargeClient *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCleanEnergyChargingClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (int)intervalStateCEC
{
  return self->_intervalStateCEC;
}

- (void)setIntervalStateCEC:(int)a3
{
  self->_intervalStateCEC = a3;
}

- (NSDate)cleanEnergyChargingDeadline
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCleanEnergyChargingDeadline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLEntry)lastCameraStreamingEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastCameraStreamingEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)wasCameraStreaming
{
  return self->_wasCameraStreaming;
}

- (void)setWasCameraStreaming:(BOOL)a3
{
  self->_wasCameraStreaming = a3;
}

- (PLEntry)lastTLCWithCameraStreamingEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastTLCWithCameraStreamingEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)wasTLCWithCameraStreaming
{
  return self->_wasTLCWithCameraStreaming;
}

- (void)setWasTLCWithCameraStreaming:(BOOL)a3
{
  self->_wasTLCWithCameraStreaming = a3;
}

- (PLEntry)lastEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (int)intervalStateTLC
{
  return self->_intervalStateTLC;
}

- (void)setIntervalStateTLC:(int)a3
{
  self->_intervalStateTLC = a3;
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (_PLTimeIntervalRange)range
{
  double v2;
  double v3;
  _QWORD v4[2];
  _PLTimeIntervalRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRange:(_PLTimeIntervalRange)a3
{
  _PLTimeIntervalRange v3;

  v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (PLCoreStorage)storage
{
  return (PLCoreStorage *)objc_getProperty(self, a2, 128, 1);
}

- (void)setStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)isFixedCharge
{
  return self->_isFixedCharge;
}

- (void)setIsFixedCharge:(BOOL)a3
{
  self->_isFixedCharge = a3;
}

- (int)intervalStateFixedCharging
{
  return self->_intervalStateFixedCharging;
}

- (void)setIntervalStateFixedCharging:(int)a3
{
  self->_intervalStateFixedCharging = a3;
}

- (NSNumber)fixedChargingLimit
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFixedChargingLimit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (int)intervalStateChargingSpeed
{
  return self->_intervalStateChargingSpeed;
}

- (void)setIntervalStateChargingSpeed:(int)a3
{
  self->_intervalStateChargingSpeed = a3;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  self->_isCharging = a3;
}

- (BOOL)externalConnected
{
  return self->_externalConnected;
}

- (void)setExternalConnected:(BOOL)a3
{
  self->_externalConnected = a3;
}

- (NSNumber)currentChargeLevel
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCurrentChargeLevel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLEntry)lastConnectedEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastConnectedEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)chargingStateIntervalsEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setChargingStateIntervalsEntryKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (int)pausedChargingState
{
  return self->_pausedChargingState;
}

- (void)setPausedChargingState:(int)a3
{
  self->_pausedChargingState = a3;
}

- (NSMutableDictionary)resultDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setResultDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_chargingStateIntervalsEntryKey, 0);
  objc_storeStrong((id *)&self->_lastConnectedEntry, 0);
  objc_storeStrong((id *)&self->_currentChargeLevel, 0);
  objc_storeStrong((id *)&self->_fixedChargingLimit, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_lastEntry, 0);
  objc_storeStrong((id *)&self->_lastTLCWithCameraStreamingEntry, 0);
  objc_storeStrong((id *)&self->_lastCameraStreamingEntry, 0);
  objc_storeStrong((id *)&self->_cleanEnergyChargingDeadline, 0);
  objc_storeStrong((id *)&self->_cleanEnergyChargingClient, 0);
  objc_storeStrong((id *)&self->_smartChargingDeadline, 0);
  objc_storeStrong((id *)&self->_smartChargingClient, 0);
  objc_storeStrong((id *)&self->_lastSmartChargingEntry, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)configureState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Entry discharging", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)configureState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Open Fixed Limit Entry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)configureState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Open Slow Charging Entry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)configureState:(void *)a1 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "smartChargingDeadline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "Smart Charge Deadline: %@", v5);

  OUTLINED_FUNCTION_8_0();
}

- (void)configureState:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, v0, v1, "Smart Charge Deadline Error: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)configureState:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Open Smart Charging Entry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)configureState:(void *)a1 .cold.7(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "cleanEnergyChargingDeadline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "Clean Energy Charge Deadline: %@", v5);

  OUTLINED_FUNCTION_8_0();
}

- (void)configureState:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, v0, v1, "Clean Energy Charge Deadline Error: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)configureState:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Open Clean Energy Charging Entry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)configureState:(uint64_t)a3 .cold.10(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a1, a4, "Time in TLC: %f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)configureState:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Open TLC Entry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)configureState:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "No External Connected Entry exists in last 24hrs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)configureState:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Open External Connected Entry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)configureState:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, v0, v1, "start: %f, end: %f", v2);
  OUTLINED_FUNCTION_1();
}

- (void)configureState:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Closed External Connected Entry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)configureState:(void *)a1 .cold.16(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastConnectedEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "Connected Entry:%@", v5);

  OUTLINED_FUNCTION_8_0();
}

- (void)configureState:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, v0, v1, "Converted values to doubles: start: %f and end: %f", v2);
  OUTLINED_FUNCTION_1();
}

- (void)configureState:(void *)a1 .cold.18(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a2, v6, "Last entry was opened at %@ and closed at %@", v7);

  OUTLINED_FUNCTION_8();
}

- (void)configureState:.cold.19()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, v0, v1, "Entry: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)configure:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "intervalStateTLC");
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v1, v2, "TLC Interval State set to: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (void)configure:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "intervalStateCEC");
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v1, v2, "Clean Energy Charging Interval State set to: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (void)configure:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "intervalStateSmartCharging");
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v1, v2, "Smart Charging Interval State set to: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (void)configure:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "intervalStateChargingSpeed");
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v1, v2, "Interval State Charging Speed State set to: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (void)configure:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "intervalStateFixedCharging");
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v1, v2, "Fixed Charging Interval State set to: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (void)result
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "smartChargingDeadline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, a2, v4, "Adding Smart Charge Deadline to response: %@", v5);

  OUTLINED_FUNCTION_8_0();
}

@end
