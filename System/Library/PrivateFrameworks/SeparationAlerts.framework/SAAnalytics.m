@implementation SAAnalytics

- (SAAnalytics)init
{
  SAAnalyticsSettings *v3;
  SAAnalytics *v4;

  v3 = objc_alloc_init(SAAnalyticsSettings);
  v4 = -[SAAnalytics initWithSettings:](self, "initWithSettings:", v3);

  return v4;
}

- (SAAnalytics)initWithSettings:(id)a3
{
  id v5;
  SAAnalytics *v6;
  SAAnalytics *v7;
  NSDate *lastActivated;
  NSDate *lastSafeEntry;
  NSDate *lastUnsafeEntry;
  NSDate *lastTravelStart;
  id v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SAAnalytics;
  v6 = -[SAAnalytics init](&v14, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settings, a3);
  lastActivated = v7->_lastActivated;
  v7->_lastActivated = 0;

  lastSafeEntry = v7->_lastSafeEntry;
  v7->_lastSafeEntry = 0;

  lastUnsafeEntry = v7->_lastUnsafeEntry;
  v7->_lastUnsafeEntry = 0;

  lastTravelStart = v7->_lastTravelStart;
  v7->_lastTravelStart = 0;

  -[SAAnalytics setNumDevicesAtSafeExit:](v7, "setNumDevicesAtSafeExit:", -1);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SAAnalytics setNumEnabledPerType:](v7, "setNumEnabledPerType:", v12);

  return v7;
}

- (double)publishingInterval
{
  return 14400.0;
}

- (void)submitEvent:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[SAAnalyticsSettings enableSubmission](self->_settings, "enableSubmission");
  v9 = TASALog;
  v10 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 68289539;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = v6;
      v18 = 2113;
      v19 = v7;
      _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAAnalytics Submitting analytics event\", \"eventName\":\"%{private}@\", \"content\":\"%{private}@\"}", buf, 0x26u);
    }
    v11 = v7;
    AnalyticsSendEventLazy();

  }
  else if (v10)
  {
    *(_DWORD *)buf = 68289539;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = v6;
    v18 = 2113;
    v19 = v7;
    _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAAnalytics submission not enabled\", \"eventName\":\"%{private}@\", \"content\":\"%{private}@\"}", buf, 0x26u);
  }

}

id __35__SAAnalytics_submitEvent_content___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)publishAndResetAggregation
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD v81[31];
  _QWORD v82[33];

  v82[31] = *MEMORY[0x1E0C80C00];
  -[SAAnalytics lastActivated](self, "lastActivated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics lastActivated](self, "lastActivated");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    -[SAAnalytics setAggActiveDuration:](self, "setAggActiveDuration:", -[SAAnalytics aggActiveDuration](self, "aggActiveDuration") + (unint64_t)v6);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics setLastActivated:](self, "setLastActivated:", v7);

  }
  -[SAAnalytics lastSafeEntry](self, "lastSafeEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics lastSafeEntry](self, "lastSafeEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    -[SAAnalytics setAggInSafeDuration:](self, "setAggInSafeDuration:", -[SAAnalytics aggInSafeDuration](self, "aggInSafeDuration") + (unint64_t)v11);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics setLastSafeEntry:](self, "setLastSafeEntry:", v12);

  }
  -[SAAnalytics lastUnsafeEntry](self, "lastUnsafeEntry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics lastUnsafeEntry](self, "lastUnsafeEntry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v15);
    -[SAAnalytics setAggInUnsafeDuration:](self, "setAggInUnsafeDuration:", -[SAAnalytics aggInUnsafeDuration](self, "aggInUnsafeDuration") + (unint64_t)v16);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics setLastUnsafeEntry:](self, "setLastUnsafeEntry:", v17);

  }
  -[SAAnalytics lastTravelStart](self, "lastTravelStart");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics lastTravelStart](self, "lastTravelStart");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v20);
    -[SAAnalytics setAggInTravelDuration:](self, "setAggInTravelDuration:", -[SAAnalytics aggInTravelDuration](self, "aggInTravelDuration") + (unint64_t)v21);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics setLastTravelStart:](self, "setLastTravelStart:", v22);

  }
  v81[0] = CFSTR("numAlerts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numAlerts](self, "numAlerts"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v80;
  v81[1] = CFSTR("numAlertsLeftBehind");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numAlertsLeftBehind](self, "numAlertsLeftBehind"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v79;
  v81[2] = CFSTR("numAlertsTraveling");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numAlertsTraveling](self, "numAlertsTraveling"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v78;
  v81[3] = CFSTR("numEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numEnabled](self, "numEnabled"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v77;
  v81[4] = CFSTR("numItems");
  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "objectForKey:", &unk_1E83DB218);
  v23 = objc_claimAutoreleasedReturnValue();
  v75 = (void *)v23;
  if (v23)
    v24 = (void *)v23;
  else
    v24 = &unk_1E83DB230;
  v82[4] = v24;
  v81[5] = CFSTR("numAccessories");
  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "objectForKey:", &unk_1E83DB248);
  v25 = objc_claimAutoreleasedReturnValue();
  v73 = (void *)v25;
  if (v25)
    v26 = (void *)v25;
  else
    v26 = &unk_1E83DB230;
  v82[5] = v26;
  v81[6] = CFSTR("numBTLE");
  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "objectForKey:", &unk_1E83DB260);
  v27 = objc_claimAutoreleasedReturnValue();
  v71 = (void *)v27;
  if (v27)
    v28 = (void *)v27;
  else
    v28 = &unk_1E83DB230;
  v82[6] = v28;
  v81[7] = CFSTR("numDevices");
  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "objectForKey:", &unk_1E83DB278);
  v29 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v29;
  if (v29)
    v30 = (void *)v29;
  else
    v30 = &unk_1E83DB230;
  v82[7] = v30;
  v81[8] = CFSTR("numiPhone");
  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectForKey:", &unk_1E83DB290);
  v31 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v31;
  if (v31)
    v32 = (void *)v31;
  else
    v32 = &unk_1E83DB230;
  v82[8] = v32;
  v81[9] = CFSTR("numiPad");
  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKey:", &unk_1E83DB2A8);
  v33 = objc_claimAutoreleasedReturnValue();
  v65 = (void *)v33;
  if (v33)
    v34 = (void *)v33;
  else
    v34 = &unk_1E83DB230;
  v82[9] = v34;
  v81[10] = CFSTR("numMacBook");
  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "objectForKey:", &unk_1E83DB2C0);
  v35 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v35;
  if (v35)
    v36 = (void *)v35;
  else
    v36 = &unk_1E83DB230;
  v82[10] = v36;
  v81[11] = CFSTR("numAirPods");
  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "objectForKey:", &unk_1E83DB2D8);
  v37 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v37;
  if (v37)
    v38 = (void *)v37;
  else
    v38 = &unk_1E83DB230;
  v82[11] = v38;
  v81[12] = CFSTR("numSafe");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numSafe](self, "numSafe"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v82[12] = v60;
  v81[13] = CFSTR("numSafeInUse");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numSafeInUse](self, "numSafeInUse"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v82[13] = v59;
  v81[14] = CFSTR("isAllUsingSameSafe");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SAAnalytics isAllUsingSameSafe](self, "isAllUsingSameSafe"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v82[14] = v58;
  v81[15] = CFSTR("numBTRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numBTRequests](self, "numBTRequests"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v82[15] = v57;
  v81[16] = CFSTR("numBTLeftBehindRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numBTLeftBehindRequests](self, "numBTLeftBehindRequests"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v82[16] = v56;
  v81[17] = CFSTR("numBTTravelingRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numBTTravelingRequests](self, "numBTTravelingRequests"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v82[17] = v55;
  v81[18] = CFSTR("numGpsRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numGpsRequests](self, "numGpsRequests"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v82[18] = v54;
  v81[19] = CFSTR("numWifiRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numWifiRequests](self, "numWifiRequests"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v82[19] = v53;
  v81[20] = CFSTR("numTimers");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numTimers](self, "numTimers"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v82[20] = v52;
  v81[21] = CFSTR("numDevicesAtSafeExit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numDevicesAtSafeExit](self, "numDevicesAtSafeExit"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v82[21] = v51;
  v81[22] = CFSTR("numUnsafe");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numUnsafe](self, "numUnsafe"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v82[22] = v50;
  v81[23] = CFSTR("numUnsafeWithLOI");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numUnsafeWithLOI](self, "numUnsafeWithLOI"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v82[23] = v49;
  v81[24] = CFSTR("numUnsafeWithoutLOI");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics numUnsafeWithoutLOI](self, "numUnsafeWithoutLOI"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v82[24] = v39;
  v81[25] = CFSTR("aggActiveDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics aggActiveDuration](self, "aggActiveDuration"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v82[25] = v40;
  v81[26] = CFSTR("aggInSafeDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics aggInSafeDuration](self, "aggInSafeDuration"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v82[26] = v41;
  v81[27] = CFSTR("aggInUnsafeDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics aggInUnsafeDuration](self, "aggInUnsafeDuration"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v82[27] = v42;
  v81[28] = CFSTR("aggInTravelDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAAnalytics aggInTravelDuration](self, "aggInTravelDuration"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v82[28] = v43;
  v81[29] = CFSTR("totalScanDuration");
  v44 = (void *)MEMORY[0x1E0CB37E8];
  -[SAAnalytics aggScanDuration](self, "aggScanDuration");
  objc_msgSend(v44, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v82[29] = v45;
  v81[30] = CFSTR("totalScanDurationForFindingRelevantItemsOnly");
  v46 = (void *)MEMORY[0x1E0CB37E8];
  -[SAAnalytics aggScanDurationForFindingRelevantItemsOnly](self, "aggScanDurationForFindingRelevantItemsOnly");
  objc_msgSend(v46, "numberWithDouble:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v82[30] = v47;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 31);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  -[SAAnalytics submitEvent:content:](self, "submitEvent:content:", CFSTR("com.apple.clx.alert.heartbeats"), v48);
  -[SAAnalytics resetAggregation](self, "resetAggregation");

}

- (void)resetAggregation
{
  -[SAAnalytics setNumAlerts:](self, "setNumAlerts:", 0);
  -[SAAnalytics setNumAlertsLeftBehind:](self, "setNumAlertsLeftBehind:", 0);
  -[SAAnalytics setNumAlertsTraveling:](self, "setNumAlertsTraveling:", 0);
  -[SAAnalytics setNumBTRequests:](self, "setNumBTRequests:", 0);
  -[SAAnalytics setNumBTLeftBehindRequests:](self, "setNumBTLeftBehindRequests:", 0);
  -[SAAnalytics setNumBTTravelingRequests:](self, "setNumBTTravelingRequests:", 0);
  -[SAAnalytics setNumGpsRequests:](self, "setNumGpsRequests:", 0);
  -[SAAnalytics setNumWifiRequests:](self, "setNumWifiRequests:", 0);
  -[SAAnalytics setNumTimers:](self, "setNumTimers:", 0);
  -[SAAnalytics setNumDevicesAtSafeExit:](self, "setNumDevicesAtSafeExit:", -1);
  -[SAAnalytics setNumUnsafe:](self, "setNumUnsafe:", 0);
  -[SAAnalytics setNumUnsafeWithLOI:](self, "setNumUnsafeWithLOI:", 0);
  -[SAAnalytics setNumUnsafeWithoutLOI:](self, "setNumUnsafeWithoutLOI:", 0);
  -[SAAnalytics setAggActiveDuration:](self, "setAggActiveDuration:", 0);
  -[SAAnalytics setAggInSafeDuration:](self, "setAggInSafeDuration:", 0);
  -[SAAnalytics setAggInUnsafeDuration:](self, "setAggInUnsafeDuration:", 0);
  -[SAAnalytics setAggInTravelDuration:](self, "setAggInTravelDuration:", 0);
  -[SAAnalytics setAggScanDuration:](self, "setAggScanDuration:", 0.0);
  -[SAAnalytics setAggScanDurationForFindingRelevantItemsOnly:](self, "setAggScanDurationForFindingRelevantItemsOnly:", 0.0);
}

- (void)submitDefaultAlertRateEvent
{
  uint64_t i;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v17)
  {
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(obj);
        v3 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v24[0] = CFSTR("numOfAlertsPerDay");
        v24[1] = CFSTR("deviceType");
        v25[0] = &unk_1E83DB230;
        v25[1] = v3;
        v24[2] = CFSTR("numEnabled");
        -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v3);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)v5;
        if (v5)
          v7 = (void *)v5;
        else
          v7 = &unk_1E83DB230;
        v24[3] = CFSTR("alertType");
        v25[2] = v7;
        v25[3] = &unk_1E83DB278;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[SAAnalytics submitEvent:content:](self, "submitEvent:content:", CFSTR("com.apple.clx.sa.alertRate"), v8);
        v22[0] = CFSTR("numOfAlertsPerDay");
        v22[1] = CFSTR("deviceType");
        v23[0] = &unk_1E83DB230;
        v23[1] = v3;
        v22[2] = CFSTR("numEnabled");
        -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v3);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (void *)v10;
        else
          v12 = &unk_1E83DB230;
        v22[3] = CFSTR("alertType");
        v23[2] = v12;
        v23[3] = &unk_1E83DB218;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[SAAnalytics submitEvent:content:](self, "submitEvent:content:", CFSTR("com.apple.clx.sa.alertRate"), v13);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v17);
  }

}

- (void)submitAlertRateEvent:(id)a3 alertType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[SAAnalyticsSettings enableSubmission](self->_settings, "enableSubmission"))
  {
    -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v15[0] = &unk_1E83DB2F0;
      v15[1] = v6;
      -[SAAnalytics numEnabledPerType](self, "numEnabledPerType", CFSTR("numOfAlertsPerDay"), CFSTR("deviceType"), CFSTR("numEnabled"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[3] = CFSTR("alertType");
      v15[2] = v11;
      v15[3] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[SAAnalytics submitEvent:content:](self, "submitEvent:content:", CFSTR("com.apple.clx.sa.alertRate"), v12);
    }
    else
    {
      v13 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289026;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        _os_log_impl(&dword_1CA04F000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"surfacing alert but there is no device being monitored\"}", buf, 0x12u);
      }
    }
  }

}

- (void)submitBeaconMonitoringEvent:(BOOL)a3 safeLocationsMatch:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v4 = a4;
  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("beaconGroupsComplete");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("safeLocationsMatch");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SAAnalytics submitEvent:content:](self, "submitEvent:content:", CFSTR("com.apple.clx.sa.beaconMonitoring"), v8);
}

- (void)addAlertWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[SAAnalytics setNumAlerts:](self, "setNumAlerts:", -[SAAnalytics numAlerts](self, "numAlerts") + 1);
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E83DB308);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  if (v6 == 1)
  {
    -[SAAnalytics setNumAlertsLeftBehind:](self, "setNumAlertsLeftBehind:", -[SAAnalytics numAlertsLeftBehind](self, "numAlertsLeftBehind") + 1);
  }
  else if (v6 == 2)
  {
    -[SAAnalytics setNumAlertsTraveling:](self, "setNumAlertsTraveling:", -[SAAnalytics numAlertsTraveling](self, "numAlertsTraveling") + 1);
  }
}

- (void)addScanDuration:(double)a3
{
  double v5;

  -[SAAnalytics aggScanDuration](self, "aggScanDuration");
  -[SAAnalytics setAggScanDuration:](self, "setAggScanDuration:", v5 + a3);
}

- (void)addScanDurationForFindingRelevantItemsOnly:(double)a3
{
  double v5;

  -[SAAnalytics aggScanDurationForFindingRelevantItemsOnly](self, "aggScanDurationForFindingRelevantItemsOnly");
  -[SAAnalytics setAggScanDurationForFindingRelevantItemsOnly:](self, "setAggScanDurationForFindingRelevantItemsOnly:", v5 + a3);
}

- (void)addDeviceFetchResultCount:(unint64_t)a3 type1count:(unint64_t)a4 type2count:(unint64_t)a5 type3count:(unint64_t)a6 type4count:(unint64_t)a7 type5count:(unint64_t)a8 type6count:(unint64_t)a9 type7count:(unint64_t)a10 type8count:(unint64_t)a11 safeCount:(unint64_t)a12 usingSameSafe:(BOOL)a13
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  -[SAAnalytics setNumEnabled:](self, "setNumEnabled:", a3);
  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, &unk_1E83DB218);

  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v22, &unk_1E83DB248);

  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v24, &unk_1E83DB260);

  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v26, &unk_1E83DB278);

  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKey:", v28, &unk_1E83DB290);

  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKey:", v30, &unk_1E83DB2A8);

  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKey:", v32, &unk_1E83DB2C0);

  -[SAAnalytics numEnabledPerType](self, "numEnabledPerType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKey:", v34, &unk_1E83DB2D8);

  -[SAAnalytics setNumSafeInUse:](self, "setNumSafeInUse:", a12);
  -[SAAnalytics setIsAllUsingSameSafe:](self, "setIsAllUsingSameSafe:", a13);
}

- (void)addAggressiveScanRequest:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[SAAnalytics setNumBTRequests:](self, "setNumBTRequests:", -[SAAnalytics numBTRequests](self, "numBTRequests") + 1);
  if (v3)
    -[SAAnalytics setNumBTTravelingRequests:](self, "setNumBTTravelingRequests:", -[SAAnalytics numBTTravelingRequests](self, "numBTTravelingRequests") + 1);
  else
    -[SAAnalytics setNumBTLeftBehindRequests:](self, "setNumBTLeftBehindRequests:", -[SAAnalytics numBTLeftBehindRequests](self, "numBTLeftBehindRequests") + 1);
}

- (void)addGpsLocationRequest:(BOOL)a3
{
  -[SAAnalytics setNumGpsRequests:](self, "setNumGpsRequests:", -[SAAnalytics numGpsRequests](self, "numGpsRequests", a3) + 1);
}

- (void)addWifiLocationRequest:(BOOL)a3
{
  -[SAAnalytics setNumWifiRequests:](self, "setNumWifiRequests:", -[SAAnalytics numWifiRequests](self, "numWifiRequests", a3) + 1);
}

- (void)addWakeTimerRequest
{
  -[SAAnalytics setNumTimers:](self, "setNumTimers:", -[SAAnalytics numTimers](self, "numTimers") + 1);
}

- (void)addVisit:(BOOL)a3 withRadius:(unint64_t)a4
{
  _BOOL4 v4;

  v4 = a3;
  -[SAAnalytics setNumUnsafe:](self, "setNumUnsafe:", -[SAAnalytics numUnsafe](self, "numUnsafe", a3, a4) + 1);
  if (v4)
    -[SAAnalytics setNumUnsafeWithLOI:](self, "setNumUnsafeWithLOI:", -[SAAnalytics numUnsafeWithLOI](self, "numUnsafeWithLOI") + 1);
  else
    -[SAAnalytics setNumUnsafeWithoutLOI:](self, "setNumUnsafeWithoutLOI:", -[SAAnalytics numUnsafeWithoutLOI](self, "numUnsafeWithoutLOI") + 1);
}

- (void)setActiveState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  NSDate *lastActivated;
  void *v10;

  v3 = a3;
  -[SAAnalytics lastActivated](self, "lastActivated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAAnalytics setLastActivated:](self, "setLastActivated:", v10);

    }
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics lastActivated](self, "lastActivated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    -[SAAnalytics setAggActiveDuration:](self, "setAggActiveDuration:", -[SAAnalytics aggActiveDuration](self, "aggActiveDuration") + (unint64_t)v8);

    lastActivated = self->_lastActivated;
    self->_lastActivated = 0;

  }
}

- (void)setInSafeLocationState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  NSDate *lastSafeEntry;
  void *v10;

  v3 = a3;
  -[SAAnalytics lastSafeEntry](self, "lastSafeEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAAnalytics setLastSafeEntry:](self, "setLastSafeEntry:", v10);

    }
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics lastSafeEntry](self, "lastSafeEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    -[SAAnalytics setAggInSafeDuration:](self, "setAggInSafeDuration:", -[SAAnalytics aggInSafeDuration](self, "aggInSafeDuration") + (unint64_t)v8);

    lastSafeEntry = self->_lastSafeEntry;
    self->_lastSafeEntry = 0;

  }
}

- (void)setInUnsafeLocationState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  NSDate *lastUnsafeEntry;
  void *v10;

  v3 = a3;
  -[SAAnalytics lastUnsafeEntry](self, "lastUnsafeEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAAnalytics setLastUnsafeEntry:](self, "setLastUnsafeEntry:", v10);

    }
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics lastUnsafeEntry](self, "lastUnsafeEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    -[SAAnalytics setAggInUnsafeDuration:](self, "setAggInUnsafeDuration:", -[SAAnalytics aggInUnsafeDuration](self, "aggInUnsafeDuration") + (unint64_t)v8);

    lastUnsafeEntry = self->_lastUnsafeEntry;
    self->_lastUnsafeEntry = 0;

  }
}

- (void)setInTravelState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  NSDate *lastTravelStart;
  void *v10;

  v3 = a3;
  -[SAAnalytics lastTravelStart](self, "lastTravelStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAAnalytics setLastTravelStart:](self, "setLastTravelStart:", v10);

    }
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAnalytics lastTravelStart](self, "lastTravelStart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    -[SAAnalytics setAggInTravelDuration:](self, "setAggInTravelDuration:", -[SAAnalytics aggInTravelDuration](self, "aggInTravelDuration") + (unint64_t)v8);

    lastTravelStart = self->_lastTravelStart;
    self->_lastTravelStart = 0;

  }
}

- (unint64_t)numAlerts
{
  return self->_numAlerts;
}

- (void)setNumAlerts:(unint64_t)a3
{
  self->_numAlerts = a3;
}

- (unint64_t)numAlertsLeftBehind
{
  return self->_numAlertsLeftBehind;
}

- (void)setNumAlertsLeftBehind:(unint64_t)a3
{
  self->_numAlertsLeftBehind = a3;
}

- (unint64_t)numAlertsTraveling
{
  return self->_numAlertsTraveling;
}

- (void)setNumAlertsTraveling:(unint64_t)a3
{
  self->_numAlertsTraveling = a3;
}

- (unint64_t)numEnabled
{
  return self->_numEnabled;
}

- (void)setNumEnabled:(unint64_t)a3
{
  self->_numEnabled = a3;
}

- (NSMutableDictionary)numEnabledPerType
{
  return self->_numEnabledPerType;
}

- (void)setNumEnabledPerType:(id)a3
{
  objc_storeStrong((id *)&self->_numEnabledPerType, a3);
}

- (unint64_t)numSafe
{
  return self->_numSafe;
}

- (void)setNumSafe:(unint64_t)a3
{
  self->_numSafe = a3;
}

- (unint64_t)numSafeInUse
{
  return self->_numSafeInUse;
}

- (void)setNumSafeInUse:(unint64_t)a3
{
  self->_numSafeInUse = a3;
}

- (BOOL)isAllUsingSameSafe
{
  return self->_isAllUsingSameSafe;
}

- (void)setIsAllUsingSameSafe:(BOOL)a3
{
  self->_isAllUsingSameSafe = a3;
}

- (unint64_t)numBTRequests
{
  return self->_numBTRequests;
}

- (void)setNumBTRequests:(unint64_t)a3
{
  self->_numBTRequests = a3;
}

- (unint64_t)numBTLeftBehindRequests
{
  return self->_numBTLeftBehindRequests;
}

- (void)setNumBTLeftBehindRequests:(unint64_t)a3
{
  self->_numBTLeftBehindRequests = a3;
}

- (unint64_t)numBTTravelingRequests
{
  return self->_numBTTravelingRequests;
}

- (void)setNumBTTravelingRequests:(unint64_t)a3
{
  self->_numBTTravelingRequests = a3;
}

- (unint64_t)numGpsRequests
{
  return self->_numGpsRequests;
}

- (void)setNumGpsRequests:(unint64_t)a3
{
  self->_numGpsRequests = a3;
}

- (unint64_t)numWifiRequests
{
  return self->_numWifiRequests;
}

- (void)setNumWifiRequests:(unint64_t)a3
{
  self->_numWifiRequests = a3;
}

- (unint64_t)numTimers
{
  return self->_numTimers;
}

- (void)setNumTimers:(unint64_t)a3
{
  self->_numTimers = a3;
}

- (unint64_t)numDevicesAtSafeExit
{
  return self->_numDevicesAtSafeExit;
}

- (void)setNumDevicesAtSafeExit:(unint64_t)a3
{
  self->_numDevicesAtSafeExit = a3;
}

- (unint64_t)numUnsafe
{
  return self->_numUnsafe;
}

- (void)setNumUnsafe:(unint64_t)a3
{
  self->_numUnsafe = a3;
}

- (unint64_t)numUnsafeWithLOI
{
  return self->_numUnsafeWithLOI;
}

- (void)setNumUnsafeWithLOI:(unint64_t)a3
{
  self->_numUnsafeWithLOI = a3;
}

- (unint64_t)numUnsafeWithoutLOI
{
  return self->_numUnsafeWithoutLOI;
}

- (void)setNumUnsafeWithoutLOI:(unint64_t)a3
{
  self->_numUnsafeWithoutLOI = a3;
}

- (unint64_t)aggActiveDuration
{
  return self->_aggActiveDuration;
}

- (void)setAggActiveDuration:(unint64_t)a3
{
  self->_aggActiveDuration = a3;
}

- (unint64_t)aggInSafeDuration
{
  return self->_aggInSafeDuration;
}

- (void)setAggInSafeDuration:(unint64_t)a3
{
  self->_aggInSafeDuration = a3;
}

- (unint64_t)aggInUnsafeDuration
{
  return self->_aggInUnsafeDuration;
}

- (void)setAggInUnsafeDuration:(unint64_t)a3
{
  self->_aggInUnsafeDuration = a3;
}

- (unint64_t)aggInTravelDuration
{
  return self->_aggInTravelDuration;
}

- (void)setAggInTravelDuration:(unint64_t)a3
{
  self->_aggInTravelDuration = a3;
}

- (double)aggScanDuration
{
  return self->_aggScanDuration;
}

- (void)setAggScanDuration:(double)a3
{
  self->_aggScanDuration = a3;
}

- (double)aggScanDurationForFindingRelevantItemsOnly
{
  return self->_aggScanDurationForFindingRelevantItemsOnly;
}

- (void)setAggScanDurationForFindingRelevantItemsOnly:(double)a3
{
  self->_aggScanDurationForFindingRelevantItemsOnly = a3;
}

- (NSDate)lastActivated
{
  return self->_lastActivated;
}

- (void)setLastActivated:(id)a3
{
  objc_storeStrong((id *)&self->_lastActivated, a3);
}

- (NSDate)lastSafeEntry
{
  return self->_lastSafeEntry;
}

- (void)setLastSafeEntry:(id)a3
{
  objc_storeStrong((id *)&self->_lastSafeEntry, a3);
}

- (NSDate)lastUnsafeEntry
{
  return self->_lastUnsafeEntry;
}

- (void)setLastUnsafeEntry:(id)a3
{
  objc_storeStrong((id *)&self->_lastUnsafeEntry, a3);
}

- (NSDate)lastTravelStart
{
  return self->_lastTravelStart;
}

- (void)setLastTravelStart:(id)a3
{
  objc_storeStrong((id *)&self->_lastTravelStart, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTravelStart, 0);
  objc_storeStrong((id *)&self->_lastUnsafeEntry, 0);
  objc_storeStrong((id *)&self->_lastSafeEntry, 0);
  objc_storeStrong((id *)&self->_lastActivated, 0);
  objc_storeStrong((id *)&self->_numEnabledPerType, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
