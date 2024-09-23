@implementation PLLocationAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLLocationAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("ClientStatus");
  objc_msgSend(a1, "entryEventPointDefinitionClientStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("GeoFenceHandoff");
  objc_msgSend(a1, "entryEventPointDefinitionGeoFenceHandoff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("WifiLocationScanRequesters");
  objc_msgSend(a1, "entryEventPointDefinitionWifiLocationScanRequesters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("MiLoScanEvent");
  objc_msgSend(a1, "entryEventPointDefinitionMiLo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("MotionPacket");
  objc_msgSend(a1, "entryEventPointDefinitionMotionPacket");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventPointDefinitionClientStatus
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[8];
  _QWORD v25[8];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80248];
  v26[0] = *MEMORY[0x1E0D80318];
  v26[1] = v2;
  v27[0] = &unk_1EA1DA898;
  v27[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D80250];
  v26[2] = *MEMORY[0x1E0D80308];
  v26[3] = v3;
  v27[2] = MEMORY[0x1E0C9AAB0];
  v27[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_DateFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("Type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_StringFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("Client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("BundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat_withBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v15;
  v24[4] = CFSTR("Executable");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v5;
  v24[5] = CFSTR("Authorized");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v7;
  v24[6] = CFSTR("LocationDesiredAccuracy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_RealFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v9;
  v24[7] = CFSTR("LocationDistanceFilter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_RealFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventPointDefinitionGeoFenceHandoff
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitionWifiLocationScanRequesters
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DA898;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("scanRequester");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("numRequests");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionMiLo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[6];
  uint64_t v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[4];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = *MEMORY[0x1E0D80298];
  v20 = *MEMORY[0x1E0D80318];
  v21 = &unk_1EA1DA8A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("BTScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_RealFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("BleActiveScanRate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = CFSTR("NumLocalizations");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v3;
  v18[3] = CFSTR("NumRecordings");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v18[4] = CFSTR("TriggerType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v7;
  v18[5] = CFSTR("WiFiScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_RealFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionMotionPacket
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1EA1DA898;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("nonWaking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventForwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[8];
  _QWORD v15[8];
  _QWORD v16[9];
  _QWORD v17[11];

  v17[9] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "internalBuild") & 1) != 0)
  {
    v16[0] = CFSTR("TechStatus");
    objc_msgSend(a1, "entryEventForwardDefinitionTechStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v3;
    v16[1] = CFSTR("ClientStatus");
    objc_msgSend(a1, "entryEventForwardDefinitionClientStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v4;
    v16[2] = CFSTR("LogLevel");
    objc_msgSend(a1, "entryEventForwardDefinitionLogLevel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v5;
    v16[3] = CFSTR("StatusBar");
    objc_msgSend(a1, "entryEventForwardDefinitionStatusBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v6;
    v16[4] = CFSTR("GnssSession");
    objc_msgSend(a1, "entryEventForwardDefinitionGnssSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v7;
    v16[5] = CFSTR("GPSActivation");
    objc_msgSend(a1, "entryEventForwardDefinitionGPSSubscription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v8;
    v16[6] = CFSTR("Odometry");
    objc_msgSend(a1, "entryEventForwardDefinitionOdometry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v9;
    v16[7] = CFSTR("ViewObstructed");
    objc_msgSend(a1, "entryEventForwardDefinitionViewObstructed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v10;
    v16[8] = CFSTR("SuppressionManagerClient");
    objc_msgSend(a1, "entryEventForwardDefinitionSuppressionManagerClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[8] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "entryEventForwardDefinitionTechStatus", CFSTR("TechStatus"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v3;
    v14[1] = CFSTR("ClientStatus");
    objc_msgSend(a1, "entryEventForwardDefinitionClientStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v4;
    v14[2] = CFSTR("StatusBar");
    objc_msgSend(a1, "entryEventForwardDefinitionStatusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v5;
    v14[3] = CFSTR("GnssSession");
    objc_msgSend(a1, "entryEventForwardDefinitionGnssSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v6;
    v14[4] = CFSTR("GPSActivation");
    objc_msgSend(a1, "entryEventForwardDefinitionGPSSubscription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v7;
    v14[5] = CFSTR("Odometry");
    objc_msgSend(a1, "entryEventForwardDefinitionOdometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[5] = v8;
    v14[6] = CFSTR("ViewObstructed");
    objc_msgSend(a1, "entryEventForwardDefinitionViewObstructed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[6] = v9;
    v14[7] = CFSTR("SuppressionManagerClient");
    objc_msgSend(a1, "entryEventForwardDefinitionSuppressionManagerClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[7] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)entryEventForwardDefinitionTechStatus
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v28;
  _QWORD v29[11];
  _QWORD v30[11];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v33[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v31[0] = *MEMORY[0x1E0D80318];
  v31[1] = v2;
  v32[0] = &unk_1EA1DA8A8;
  v32[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E0D802F0];
  v29[0] = CFSTR("gps");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_BoolFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v29[1] = CFSTR("nmea");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_BoolFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_BoolFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  v29[3] = CFSTR("wifi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_BoolFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  v29[4] = CFSTR("skyhook");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_BoolFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v18;
  v29[5] = CFSTR("cell");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_BoolFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v16;
  v29[6] = CFSTR("lac");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_BoolFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v14;
  v29[7] = CFSTR("mcc");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v4;
  v29[8] = CFSTR("gps_coarse");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  v29[9] = CFSTR("pipeline");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("wifi2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionClientStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[8];
  _QWORD v26[8];
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v29[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80248];
  v27[0] = *MEMORY[0x1E0D80318];
  v27[1] = v2;
  v28[0] = &unk_1EA1DA8B8;
  v28[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D80340];
  v27[2] = *MEMORY[0x1E0D80308];
  v27[3] = v3;
  v28[2] = MEMORY[0x1E0C9AAB0];
  v28[3] = &unk_1EA1C0230;
  v4 = *MEMORY[0x1E0D80250];
  v27[4] = *MEMORY[0x1E0D80338];
  v27[5] = v4;
  v28[4] = &unk_1EA1DA8C8;
  v28[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E0D802F0];
  v25[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_DateFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  v25[1] = CFSTR("Type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  v25[2] = CFSTR("Client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat_withBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  v25[3] = CFSTR("BundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v16;
  v25[4] = CFSTR("Executable");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v6;
  v25[5] = CFSTR("LocationDesiredAccuracy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v8;
  v25[6] = CFSTR("LocationDistanceFilter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v10;
  v25[7] = CFSTR("InUseLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entryEventForwardDefinitionLogLevel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1EA1DA898;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("Level");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("RotationEnabled");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventForwardDefinitionStatusBar
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DA898;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("Status");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("BundleID");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionGnssSession
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1EA1DA8D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("eventStatus");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventForwardDefinitionGPSSubscription
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DA898;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("ServiceName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Register");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionOdometry
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1EA1DA898;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("odometryEvent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("updateInterval");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionSuppressionManagerClient
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1EA1DA898;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("clientEvent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("clientType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("clientNumbers");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventForwardDefinitionViewObstructed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DA898;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("VOEvent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventBackwardDefinitions
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isGPSClass:", 1008002) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isGPSClass:", 1008003) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isGPSClass:", 1008005) & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D80020], "isGPSClass:", 1008004))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v24 = CFSTR("GPSPower");
  v22[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v20[0] = *MEMORY[0x1E0D80318];
  v20[1] = v2;
  v21[0] = &unk_1EA1DA8D8;
  v21[1] = CFSTR("log");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("startTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("measuredInterval");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  v18[2] = CFSTR("activeInterval");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v5;
  v18[3] = CFSTR("averagePower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v7;
  v18[4] = CFSTR("activeL5IntervalSec");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("MapsBusyness");
  objc_msgSend(a1, "entryEventIntervalDefinitionMapsBusyness");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("SeparationAlert");
  objc_msgSend(a1, "entryEventIntervalDefinitionSeparationAlert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("PDR");
  objc_msgSend(a1, "entryEventIntervalDefinitionPDR");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventIntervalDefinitionMapsBusyness
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  _QWORD v24[9];
  _QWORD v25[9];
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v26 = *MEMORY[0x1E0D80318];
  v27 = &unk_1EA1DA8D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_DateFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("Launched");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("HarvestedRealTimeOnPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("HarvestedRealTimeOnBattery");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v15;
  v24[4] = CFSTR("HarvestedDifferential");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v13;
  v24[5] = CFSTR("RateLimit");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v3;
  v24[6] = CFSTR("LocationNotUsable");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("LocationNoAuth");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v7;
  v24[8] = CFSTR("LocationUnavailable");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventIntervalDefinitionSeparationAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  _QWORD v24[9];
  _QWORD v25[9];
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v26 = *MEMORY[0x1E0D80318];
  v27 = &unk_1EA1DA898;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_DateFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("DurationOfVisits");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_RealFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("NumberOfVisits");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("TotalGeoFence");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v15;
  v24[4] = CFSTR("GPSAttribution");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v13;
  v24[5] = CFSTR("BTScanCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v3;
  v24[6] = CFSTR("WifiScanCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("Notifications");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v7;
  v24[8] = CFSTR("DevicesMonitored");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventIntervalDefinitionPDR
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1EA1DA898;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("sessionEndTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_RealFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("numFences");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("sessionStartTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_RealFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isDebugEnabled"))
    return MEMORY[0x1E0C9AA70];
  v6 = CFSTR("ClientStatusDebug");
  objc_msgSend(a1, "entryEventNoneDefinitionClientStatusDebug");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventNoneDefinitionClientStatusDebug
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[18];
  _QWORD v44[18];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v47[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v45[0] = *MEMORY[0x1E0D80318];
  v45[1] = v2;
  v46[0] = &unk_1EA1DA898;
  v46[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v42;
  v47[1] = *MEMORY[0x1E0D802F0];
  v43[0] = CFSTR("Client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_StringFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v40;
  v43[1] = CFSTR("BundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_StringFormat_withBundleID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v38;
  v43[2] = CFSTR("Executable");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_StringFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v36;
  v43[3] = CFSTR("Authorized");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_BoolFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v34;
  v43[4] = CFSTR("LocationDesiredAccuracy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_RealFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v32;
  v43[5] = CFSTR("LocationDistanceFilter");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_RealFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v30;
  v43[6] = CFSTR("LocationTimeStarted");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v28;
  v43[7] = CFSTR("LocationTimeStopped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v26;
  v43[8] = CFSTR("FenceTimeStarted");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v24;
  v43[9] = CFSTR("FenceTimeStopped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[9] = v22;
  v43[10] = CFSTR("SignificantTimeStarted");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[10] = v20;
  v43[11] = CFSTR("SignificantTimeStopped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[11] = v18;
  v43[12] = CFSTR("BeaconRegionTimeStarted");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[12] = v16;
  v43[13] = CFSTR("BeaconRegionTimeStopped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[13] = v14;
  v43[14] = CFSTR("RangeTimeStarted");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[14] = v4;
  v43[15] = CFSTR("RangeTimeStopped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[15] = v6;
  v43[16] = CFSTR("VisitTimeStarted");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[16] = v8;
  v43[17] = CFSTR("VisitTimeStopped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_DateFormat_isCFAbsoluteTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44[17] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLLocationAgent)init
{
  PLLocationAgent *v2;
  uint64_t v3;
  NSMutableDictionary *clientStatusTypeStrings;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *localCache;
  NSNumber *techStatusLimiterIsActive;
  id v18;
  uint64_t v19;
  PLLocationAgent *v20;
  uint64_t v21;
  PLCFNotificationOperatorComposition *techStatusChangedNotification;
  uint64_t v23;
  NSMutableSet *processes;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  PLLocationAgent *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)PLLocationAgent;
  v2 = -[PLAgent init](&v40, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    clientStatusTypeStrings = v2->_clientStatusTypeStrings;
    v2->_clientStatusTypeStrings = (NSMutableDictionary *)v3;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = objc_msgSend(&unk_1EA1DBD88, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v28)
    {
      v27 = *(_QWORD *)v37;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(&unk_1EA1DBD88);
          v29 = v5;
          v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v5);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v27);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_clientStatusTypeStrings, "setObject:forKeyedSubscript:", v7, v6);

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v8 = objc_msgSend(&unk_1EA1DBDA0, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v33 != v10)
                  objc_enumerationMutation(&unk_1EA1DBDA0);
                v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(v6, "stringByAppendingString:", v12);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](v2->_clientStatusTypeStrings, "objectForKeyedSubscript:", v6);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v12);

              }
              v9 = objc_msgSend(&unk_1EA1DBDA0, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            }
            while (v9);
          }
          v5 = v29 + 1;
        }
        while (v29 + 1 != v28);
        v28 = objc_msgSend(&unk_1EA1DBD88, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v28);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    localCache = v2->_localCache;
    v2->_localCache = (NSMutableDictionary *)v15;

    techStatusLimiterIsActive = v2->_techStatusLimiterIsActive;
    v2->_techStatusLimiterIsActive = (NSNumber *)MEMORY[0x1E0C9AAA0];

    v18 = objc_alloc(MEMORY[0x1E0D7FF80]);
    v19 = *MEMORY[0x1E0C9E338];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __23__PLLocationAgent_init__block_invoke;
    v30[3] = &unk_1EA16D158;
    v20 = v2;
    v31 = v20;
    v21 = objc_msgSend(v18, "initWithOperator:forNotification:requireState:withBlock:", v20, v19, 0, v30);
    techStatusChangedNotification = v20->_techStatusChangedNotification;
    v20->_techStatusChangedNotification = (PLCFNotificationOperatorComposition *)v21;

    v23 = objc_opt_new();
    processes = v20->_processes;
    v20->_processes = (NSMutableSet *)v23;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v20, sel_processesOfInterest_, CFSTR("PLLocationAgent.addProcessesOfInterest"), 0);

  }
  return v2;
}

uint64_t __23__PLLocationAgent_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23__PLLocationAgent_init__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_defaultOnce, block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("techStatusChanged callback"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent init]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 928);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardTechStatus_withLimiter");
}

uint64_t __23__PLLocationAgent_init__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_classDebugEnabled = result;
  return result;
}

- (void)processesOfInterest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entry"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PLLocationAgent processes](self, "processes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entry"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unionSet:", v7);

    }
    v4 = v8;
  }

}

- (void)initOperatorDependancies
{
  NSMutableDictionary *bundleIDToWeightUsingGPSCache;
  NSMutableDictionary *bundleIDToWeightUsingWiFiCache;
  NSMutableDictionary *bundleIDToWeightUsingLocationCache;
  NSMutableDictionary *v6;
  NSMutableDictionary *activeClients;
  NSMutableSet *v8;
  NSMutableSet *activeBackgroundLocationClients;
  int v10;
  uint64_t v11;
  PLXPCListenerOperatorComposition *v12;
  PLXPCListenerOperatorComposition *logLevelNotification;
  PLXPCListenerOperatorComposition *v14;
  PLXPCListenerOperatorComposition *statusBarNotification;
  PLXPCListenerOperatorComposition *v16;
  PLXPCListenerOperatorComposition *clientStatusNotification;
  PLXPCListenerOperatorComposition *v18;
  PLXPCListenerOperatorComposition *separationAlertListener;
  PLXPCListenerOperatorComposition *v20;
  PLXPCListenerOperatorComposition *mapsBusynessStateListener;
  PLXPCListenerOperatorComposition *v22;
  PLXPCListenerOperatorComposition *locationGPSListener;
  PLEntryNotificationOperatorComposition *v24;
  PLEntryNotificationOperatorComposition *sbcLevelChanged;
  PLNSNotificationOperatorComposition *v26;
  PLNSNotificationOperatorComposition *thermalMonitorListener;
  PLXPCListenerOperatorComposition *v28;
  PLXPCListenerOperatorComposition *wifiLocationScanRequestersListener;
  PLXPCListenerOperatorComposition *v30;
  PLXPCListenerOperatorComposition *odometryListener;
  PLXPCListenerOperatorComposition *v32;
  PLXPCListenerOperatorComposition *pdrListener;
  void *v34;
  PLXPCListenerOperatorComposition *v35;
  PLXPCListenerOperatorComposition *miLoScansListener;
  PLXPCListenerOperatorComposition *v37;
  PLXPCListenerOperatorComposition *gpsSubscriptionListener;
  PLXPCListenerOperatorComposition *v39;
  PLXPCListenerOperatorComposition *gnssSessionListener;
  PLXPCListenerOperatorComposition *v41;
  PLXPCListenerOperatorComposition *motionPacketListener;
  PLXPCListenerOperatorComposition *v43;
  PLXPCListenerOperatorComposition *viewObstructedListener;
  PLXPCListenerOperatorComposition *v45;
  PLXPCListenerOperatorComposition *suppressionManagerClientListener;
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[5];

  bundleIDToWeightUsingGPSCache = self->_bundleIDToWeightUsingGPSCache;
  self->_bundleIDToWeightUsingGPSCache = 0;

  bundleIDToWeightUsingWiFiCache = self->_bundleIDToWeightUsingWiFiCache;
  self->_bundleIDToWeightUsingWiFiCache = 0;

  bundleIDToWeightUsingLocationCache = self->_bundleIDToWeightUsingLocationCache;
  self->_bundleIDToWeightUsingLocationCache = 0;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  activeClients = self->_activeClients;
  self->_activeClients = v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  activeBackgroundLocationClients = self->_activeBackgroundLocationClients;
  self->_activeBackgroundLocationClients = v8;

  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v10 = objc_msgSend(MEMORY[0x1E0D80020], "internalBuild");
    v11 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke;
      v64[3] = &unk_1EA16CF18;
      v64[4] = self;
      v12 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7B58, v64);
      logLevelNotification = self->_logLevelNotification;
      self->_logLevelNotification = v12;

    }
    -[PLLocationAgent logEventForwardClientStatuswithPayload:](self, "logEventForwardClientStatuswithPayload:", 0);
    v63[0] = v11;
    v63[1] = 3221225472;
    v63[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_278;
    v63[3] = &unk_1EA16CF18;
    v63[4] = self;
    v14 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7B80, v63);
    statusBarNotification = self->_statusBarNotification;
    self->_statusBarNotification = v14;

    v62[0] = v11;
    v62[1] = 3221225472;
    v62[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_289;
    v62[3] = &unk_1EA16CF18;
    v62[4] = self;
    v16 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7BA8, v62);
    clientStatusNotification = self->_clientStatusNotification;
    self->_clientStatusNotification = v16;

    v61[0] = v11;
    v61[1] = 3221225472;
    v61[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_296;
    v61[3] = &unk_1EA16CF18;
    v61[4] = self;
    v18 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7BD0, v61);
    separationAlertListener = self->_separationAlertListener;
    self->_separationAlertListener = v18;

    v60[0] = v11;
    v60[1] = 3221225472;
    v60[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_306;
    v60[3] = &unk_1EA16CF18;
    v60[4] = self;
    v20 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7BF8, v60);
    mapsBusynessStateListener = self->_mapsBusynessStateListener;
    self->_mapsBusynessStateListener = v20;

    if ((objc_msgSend(MEMORY[0x1E0D80020], "isGPSClass:", 1008002) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isGPSClass:", 1008003) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isGPSClass:", 1008005) & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D80020], "isGPSClass:", 1008004))
    {
      v59[0] = v11;
      v59[1] = 3221225472;
      v59[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_315;
      v59[3] = &unk_1EA16CF18;
      v59[4] = self;
      v22 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7C20, v59);
      locationGPSListener = self->_locationGPSListener;
      self->_locationGPSListener = v22;

      v58[0] = v11;
      v58[1] = 3221225472;
      v58[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_320;
      v58[3] = &unk_1EA16D158;
      v58[4] = self;
      objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v58);
      v24 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
      sbcLevelChanged = self->_sbcLevelChanged;
      self->_sbcLevelChanged = v24;

      v57[0] = v11;
      v57[1] = 3221225472;
      v57[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_328;
      v57[3] = &unk_1EA16D158;
      v57[4] = self;
      v26 = (PLNSNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80010]), "initWithOperator:forNotification:withBlock:", self, CFSTR("PLThermalMonitorNotification"), v57);
      thermalMonitorListener = self->_thermalMonitorListener;
      self->_thermalMonitorListener = v26;

    }
    v56[0] = v11;
    v56[1] = 3221225472;
    v56[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_338;
    v56[3] = &unk_1EA16CF18;
    v56[4] = self;
    v28 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7C48, v56);
    wifiLocationScanRequestersListener = self->_wifiLocationScanRequestersListener;
    self->_wifiLocationScanRequestersListener = v28;

    v55[0] = v11;
    v55[1] = 3221225472;
    v55[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_347;
    v55[3] = &unk_1EA16CF18;
    v55[4] = self;
    v30 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7C70, v55);
    odometryListener = self->_odometryListener;
    self->_odometryListener = v30;

    v54[0] = v11;
    v54[1] = 3221225472;
    v54[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_353;
    v54[3] = &unk_1EA16CF18;
    v54[4] = self;
    v32 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7C98, v54);
    pdrListener = self->_pdrListener;
    self->_pdrListener = v32;

    v53[0] = v11;
    v53[1] = 3221225472;
    v53[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_360;
    v53[3] = &unk_1EA16CF18;
    v53[4] = self;
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7CC0, v53);
    -[PLLocationAgent setCheckInSessionXPCListener:](self, "setCheckInSessionXPCListener:", v34);

    v52[0] = v11;
    v52[1] = 3221225472;
    v52[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_364;
    v52[3] = &unk_1EA16CF18;
    v52[4] = self;
    v35 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7CE8, v52);
    miLoScansListener = self->_miLoScansListener;
    self->_miLoScansListener = v35;

    v51[0] = v11;
    v51[1] = 3221225472;
    v51[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_370;
    v51[3] = &unk_1EA16CF18;
    v51[4] = self;
    v37 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7D10, v51);
    gpsSubscriptionListener = self->_gpsSubscriptionListener;
    self->_gpsSubscriptionListener = v37;

    v50[0] = v11;
    v50[1] = 3221225472;
    v50[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_374;
    v50[3] = &unk_1EA16CF18;
    v50[4] = self;
    v39 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7D38, v50);
    gnssSessionListener = self->_gnssSessionListener;
    self->_gnssSessionListener = v39;

    v49[0] = v11;
    v49[1] = 3221225472;
    v49[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_378;
    v49[3] = &unk_1EA16CF18;
    v49[4] = self;
    v41 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7D60, v49);
    motionPacketListener = self->_motionPacketListener;
    self->_motionPacketListener = v41;

    v48[0] = v11;
    v48[1] = 3221225472;
    v48[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_384;
    v48[3] = &unk_1EA16CF18;
    v48[4] = self;
    v43 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7D88, v48);
    viewObstructedListener = self->_viewObstructedListener;
    self->_viewObstructedListener = v43;

    v47[0] = v11;
    v47[1] = 3221225472;
    v47[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_390;
    v47[3] = &unk_1EA16CF18;
    v47[4] = self;
    v45 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7DB0, v47);
    suppressionManagerClientListener = self->_suppressionManagerClientListener;
    self->_suppressionManagerClientListener = v45;

  }
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_2_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_2_defaultOnce, &block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_2_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("log level changed with payload=%@"), v6, block, v17, v18, v19, v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 967);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("LogLevel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v14, v6);
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v15);

}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_2_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t v23;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_279;
    v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    v23 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_3_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_3_defaultOnce, &block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_3_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("status bar changed with payload=%@"), v6, block, v20, v21, v22, v23);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 983);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("StatusBar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v14);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Status"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("Status"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Pid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", objc_msgSend(v17, "intValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("BundleID"));

  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v15);
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_279(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_3_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_289(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_290;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_4_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_4_defaultOnce, &block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_4_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("client status XPC with payload=%@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 993);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardClientStatuswithPayload:", v6);

}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_290(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_4_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_296(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_297;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_5_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_5_defaultOnce, &block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_5_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SeparationAlert XPC with payload=%@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1022);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalSeparationAlert:", v6);

}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_297(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_5_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_306(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_307;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_6_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_6_defaultOnce, &block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_6_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received Maps BusynessState XPC with payload=%@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1033);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalMapsBusynessState:", v6);

}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_307(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_6_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_315(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_316;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_7_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_7_defaultOnce, &block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_7_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received GnssPowerMetric XPC with payload=%@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1059);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "updateGnssPowerMetric:", v6);

}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_316(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_7_classDebugEnabled = result;
  return result;
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_320(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];

  if (notify_post("com.apple.powerlog.gpslogtrigger")
    && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_322;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_8_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_8_defaultOnce, block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_8_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS Notification failed."));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent initOperatorDependancies]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1069);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "writeModeledPower");
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_322(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_8_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_328(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD block[5];

  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_329;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_defaultOnce, block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notification from ThermalMonitor: %@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent initOperatorDependancies]_block_invoke");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1081);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (notify_post("com.apple.powerlog.gpslogtrigger")
    && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__PLLocationAgent_initOperatorDependancies__block_invoke_334;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v11;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_defaultOnce_332 != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_defaultOnce_332, v18);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_classDebugEnabled_333)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS Notification failed."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent initOperatorDependancies]_block_invoke_2");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 1083);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "writeModeledPower");

}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_329(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_classDebugEnabled = result;
  return result;
}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_334(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_9_classDebugEnabled_333 = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_339;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_10_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_10_defaultOnce, &block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_10_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received WifiLocationScanRequesters XPC with payload=%@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1094);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventPointWifiLocationScanRequesters:", v6);

}

uint64_t __43__PLLocationAgent_initOperatorDependancies__block_invoke_2_339(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_10_classDebugEnabled = result;
  return result;
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_347(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_347_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardOdometry:", v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_353(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_353_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalPDR:", v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_360_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardCheckInSession:", v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_364_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointMiLoScans:", v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_370_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventFowardGPSSubscription:", v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_374_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardGnssSession:", v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_378_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointMotionPacket:", v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_384_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardViewObstructed:", v6);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__PLLocationAgent_initOperatorDependancies__block_invoke_390_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSuppressionManagerClient:", v6);
}

- (id)humanReadableNameForTechnology:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "intValue") - 1;
  if (v3 > 0xA)
    return CFSTR("unknown");
  else
    return off_1EA16F018[v3];
}

- (void)logEventPointClientStatus
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD block[5];
  id v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0D7F000uLL;
  v4 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (logEventPointClientStatus_defaultOnce != -1)
      dispatch_once(&logEventPointClientStatus_defaultOnce, block);
    if (logEventPointClientStatus_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventPointClientStatus]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1200);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v12 = (void *)CLCopyAppsUsingLocation();
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ClientStatus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v5;
  v39[1] = 3221225472;
  v39[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_396;
  v39[3] = &unk_1EA16EFA8;
  v39[4] = self;
  v15 = v13;
  v40 = v15;
  v16 = v14;
  v41 = v16;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v39);
  if (!objc_msgSend(v16, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v15);
    objc_msgSend(v24, "setIsErrorEntry:", 1);
    -[PLOperator logEntry:](self, "logEntry:", v24);
LABEL_24:

    goto LABEL_25;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v38[0] = v5;
    v38[1] = 3221225472;
    v38[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_408;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = objc_opt_class();
    if (logEventPointClientStatus_defaultOnce_406 != -1)
      dispatch_once(&logEventPointClientStatus_defaultOnce_406, v38);
    if (logEventPointClientStatus_classDebugEnabled_407)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logging newOpenEntries=%@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventPointClientStatus]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 1233);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v5 = MEMORY[0x1E0C809B0];
      v3 = 0x1E0D7F000uLL;
    }
  }
  v43 = v15;
  v44[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v23, v15);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v37[0] = v5;
    v37[1] = 3221225472;
    v37[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_413;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = objc_opt_class();
    if (logEventPointClientStatus_defaultOnce_411 != -1)
      dispatch_once(&logEventPointClientStatus_defaultOnce_411, v37);
    if (logEventPointClientStatus_classDebugEnabled_412)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: location start signal; newOpenEntries=%@"),
        "-[PLLocationAgent logEventPointClientStatus]",
        1235,
        v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventPointClientStatus]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 1235);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v5 = MEMORY[0x1E0C809B0];
      v3 = 0x1E0D7F000;
      goto LABEL_24;
    }
  }
LABEL_25:
  if (objc_msgSend(*(id *)(v3 + 4000), "debugEnabled"))
  {
    v36[0] = v5;
    v36[1] = 3221225472;
    v36[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_418;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = objc_opt_class();
    if (logEventPointClientStatus_defaultOnce_416 != -1)
      dispatch_once(&logEventPointClientStatus_defaultOnce_416, v36);
    if (logEventPointClientStatus_classDebugEnabled_417)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "lastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventPointClientStatus]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 1243);

      PLLogCommon();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointClientStatus_classDebugEnabled = result;
  return result;
}

void __44__PLLocationAgent_logEventPointClientStatus__block_invoke_396(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  _QWORD block[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v35 = a3;
  v34 = v5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_2;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v6;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_defaultOnce, v44);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("client=%@"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventPointClientStatus]_block_invoke");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 1209);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v5 = v34;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "processes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsObject:", v5) & 1) != 0)
  {

  }
  else
  {
    v14 = +[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd");

    if (v14)
      goto LABEL_28;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "clientStatusTypeStrings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = v35;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v41;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v41 != v37)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v16);
        objc_msgSend(*(id *)(a1 + 32), "clientStatusTypeStrings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TimeStarted"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "clientStatusTypeStrings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("TimeStopped"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v24);
        v25 = objc_claimAutoreleasedReturnValue();

        if (v21 | v25)
        {
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v26 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __44__PLLocationAgent_logEventPointClientStatus__block_invoke_401;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v26;
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_defaultOnce_399 != -1)
              dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_defaultOnce_399, block);
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_classDebugEnabled_400)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type=%@, timeStarted=%@, timeStopped=%@"), v17, v21, v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "lastPathComponent");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventPointClientStatus]_block_invoke_2");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 1219);

              PLLogCommon();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_debug_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v5 = v34;
              v15 = v35;
            }
          }
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 40), v15);
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v5, CFSTR("Client"));
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v17, CFSTR("Type"));
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v33);

        }
        ++v16;
      }
      while (v38 != v16);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v38);
  }

LABEL_28:
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_classDebugEnabled = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke_401(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_11_classDebugEnabled_400 = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke_408(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointClientStatus_classDebugEnabled_407 = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke_413(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointClientStatus_classDebugEnabled_412 = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventPointClientStatus__block_invoke_418(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointClientStatus_classDebugEnabled_417 = result;
  return result;
}

- (void)logEventPointWifiLocationScanRequesters:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", v4, CFSTR("WifiLocationScanRequesters"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointMiLoScans:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", v4, CFSTR("MiLoScanEvent"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointMotionPacket:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", v4, CFSTR("MotionPacket"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (BOOL)shouldRateLimitTechStatus
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd")
    || !objc_msgSend(MEMORY[0x1E0D7FFA0], "liteMode"))
  {
    return 0;
  }
  -[PLLocationAgent lastTechStatusNotificationDate](self, "lastTechStatusNotificationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLLocationAgent lastTechStatusNotificationDate](self, "lastTechStatusNotificationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5 >= -2.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLLocationAgent setLastTechStatusNotificationDate:](self, "setLastTechStatusNotificationDate:", v4);
    v6 = 0;
  }

  return v6;
}

- (void)logEventForwardTechStatus_withLimiter
{
  void *v3;
  void *v4;
  char v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  double v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD block[5];

  -[PLLocationAgent techStatusLimiterIsActive](self, "techStatusLimiterIsActive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[PLLocationAgent techStatusLimiterIsActive](self, "techStatusLimiterIsActive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    if (-[PLLocationAgent shouldRateLimitTechStatus](self, "shouldRateLimitTechStatus"))
    {
      v6 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      v7 = MEMORY[0x1E0C809B0];
      if (v6)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__PLLocationAgent_logEventForwardTechStatus_withLimiter__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = objc_opt_class();
        if (logEventForwardTechStatus_withLimiter_defaultOnce != -1)
          dispatch_once(&logEventForwardTechStatus_withLimiter_defaultOnce, block);
        if (logEventForwardTechStatus_withLimiter_classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rate-limiting CLTechStatusChangedNotification"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lastPathComponent");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventForwardTechStatus_withLimiter]");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1343);

          PLLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      -[PLLocationAgent setTechStatusLimiterIsActive:](self, "setTechStatusLimiterIsActive:", MEMORY[0x1E0C9AAB0]);
      -[PLLocationAgent lastTechStatusNotificationDate](self, "lastTechStatusNotificationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceNow");
      v16 = dispatch_time(1000000000 * (uint64_t)v15, 2000000000);
      -[PLOperator workQueue](self, "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18[0] = v7;
      v18[1] = 3221225472;
      v18[2] = __56__PLLocationAgent_logEventForwardTechStatus_withLimiter__block_invoke_424;
      v18[3] = &unk_1EA16D040;
      v18[4] = self;
      dispatch_after(v16, v17, v18);

    }
    else
    {
      -[PLLocationAgent logEventForwardTechStatus](self, "logEventForwardTechStatus");
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLocationAgent setLastTechStatusNotificationDate:](self, "setLastTechStatusNotificationDate:", v14);
    }

  }
  objc_sync_exit(v3);

}

uint64_t __56__PLLocationAgent_logEventForwardTechStatus_withLimiter__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardTechStatus_withLimiter_classDebugEnabled = result;
  return result;
}

void __56__PLLocationAgent_logEventForwardTechStatus_withLimiter__block_invoke_424(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardTechStatus");
  objc_msgSend(*(id *)(a1 + 32), "setTechStatusLimiterIsActive:", MEMORY[0x1E0C9AAA0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastTechStatusNotificationDate:", v2);

}

- (void)logEventForwardTechStatus
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  PLLocationAgent *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id obj;
  _QWORD v48[5];
  _QWORD block[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __44__PLLocationAgent_logEventForwardTechStatus__block_invoke;
    v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v58[4] = v4;
    if (logEventForwardTechStatus_defaultOnce != -1)
      dispatch_once(&logEventForwardTechStatus_defaultOnce, v58);
    if (logEventForwardTechStatus_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventForwardTechStatus]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1360);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("TechStatus"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v44);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v11, "definedKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v55;
    v16 = MEMORY[0x1E0C9AAA0];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v14);
  }

  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = (id)CLCopyTechnologiesInUse();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v51;
    v21 = MEMORY[0x1E0C9AAB0];
    v45 = v11;
    do
    {
      v22 = 0;
      v46 = v19;
      do
      {
        if (*(_QWORD *)v51 != v20)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v22);
        -[PLLocationAgent humanReadableNameForTechnology:](self, "humanReadableNameForTechnology:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v24);

        if (objc_msgSend(*(id *)(v3 + 4000), "debugEnabled"))
        {
          v25 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __44__PLLocationAgent_logEventForwardTechStatus__block_invoke_427;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v25;
          if (logEventForwardTechStatus_defaultOnce_425 != -1)
            dispatch_once(&logEventForwardTechStatus_defaultOnce_425, block);
          if (logEventForwardTechStatus_classDebugEnabled_426)
          {
            v26 = v20;
            v27 = v3;
            v28 = (void *)MEMORY[0x1E0CB3940];
            v29 = self;
            -[PLLocationAgent humanReadableNameForTechnology:](self, "humanReadableNameForTechnology:", v23);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "stringWithFormat:", CFSTR("Technology in use=%@"), v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "lastPathComponent");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventForwardTechStatus]");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 1372);

            PLLogCommon();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v31;
              _os_log_debug_impl(&dword_1DA9D6000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v3 = v27;
            self = v29;
            v20 = v26;
            v21 = MEMORY[0x1E0C9AAB0];
            v11 = v45;
            v19 = v46;
          }
        }
        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    }
    while (v19);
  }

  -[PLOperator logEntry:](self, "logEntry:", v11);
  if (objc_msgSend(*(id *)(v3 + 4000), "debugEnabled"))
  {
    v37 = objc_opt_class();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __44__PLLocationAgent_logEventForwardTechStatus__block_invoke_432;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v37;
    if (logEventForwardTechStatus_defaultOnce_430 != -1)
      dispatch_once(&logEventForwardTechStatus_defaultOnce_430, v48);
    if (logEventForwardTechStatus_classDebugEnabled_431)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "lastPathComponent");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventForwardTechStatus]");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v41, v42, 1376);

      PLLogCommon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __44__PLLocationAgent_logEventForwardTechStatus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardTechStatus_classDebugEnabled = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventForwardTechStatus__block_invoke_427(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardTechStatus_classDebugEnabled_426 = result;
  return result;
}

uint64_t __44__PLLocationAgent_logEventForwardTechStatus__block_invoke_432(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardTechStatus_classDebugEnabled_431 = result;
  return result;
}

- (void)updateLocalCacheWithClient:(id)a3 withType:(id)a4 withBundleID:(id)a5 withEntry:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
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
  uint64_t block;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  uint64_t v39;

  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __78__PLLocationAgent_updateLocalCacheWithClient_withType_withBundleID_withEntry___block_invoke;
    v38 = &__block_descriptor_40_e5_v8__0lu32l8;
    v39 = v14;
    if (updateLocalCacheWithClient_withType_withBundleID_withEntry__defaultOnce != -1)
      dispatch_once(&updateLocalCacheWithClient_withType_withBundleID_withEntry__defaultOnce, &block);
    if (updateLocalCacheWithClient_withType_withBundleID_withEntry__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("client=%@, type=%@, entry=%@"), v10, v11, v13, block, v36, v37, v38, v39);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateLocalCacheWithClient:withType:withBundleID:withEntry:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 1383);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (v10 && v11)
  {
    if (!v12)
      v12 = &stru_1EA174678;
    -[PLLocationAgent localCache](self, "localCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLocationAgent localCache](self, "localCache");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v10);

    }
    -[PLLocationAgent localCache](self, "localCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLocationAgent localCache](self, "localCache");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v10);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v28, v11);

    }
    v31 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PLLocationAgent localCache](self, "localCache");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v31, v12);

    if (!v13)
  }

}

uint64_t __78__PLLocationAgent_updateLocalCacheWithClient_withType_withBundleID_withEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateLocalCacheWithClient_withType_withBundleID_withEntry__classDebugEnabled = result;
  return result;
}

- (id)lastEntryWithClient:(id)a3 withType:(id)a4 withBundleID:(id)a5 withEntryKey:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  id v14;
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
  void *v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  v14 = 0;
  if (v10 && v11)
  {
    if (!v12)
      v12 = &stru_1EA174678;
    -[PLLocationAgent localCache](self, "localCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("Client"), v10, 0);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("Type"), v11, 0);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("BundleId"), v12, 0);
      -[PLOperator storage](self, "storage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v26;
      v27[1] = v19;
      v27[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastEntryForKey:withComparisons:isSingleton:", v13, v22, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLLocationAgent updateLocalCacheWithClient:withType:withBundleID:withEntry:](self, "updateLocalCacheWithClient:withType:withBundleID:withEntry:", v10, v11, v12, v18);
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == v23)
      v24 = 0;
    else
      v24 = v18;
    v14 = v24;

  }
  return v14;
}

- (void)resyncActiveClients
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD block[5];

  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PLLocationAgent_resyncActiveClients__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (resyncActiveClients_defaultOnce != -1)
      dispatch_once(&resyncActiveClients_defaultOnce, block);
    if (resyncActiveClients_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ResyncingActiveClients on powerlog init"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent resyncActiveClients]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1439);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLocationAgent setLastResyncActiveClientsDate:](self, "setLastResyncActiveClientsDate:", v11);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21[0] = v4;
    v21[1] = 3221225472;
    v21[2] = __38__PLLocationAgent_resyncActiveClients__block_invoke_444;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = objc_opt_class();
    if (resyncActiveClients_defaultOnce_442 != -1)
      dispatch_once(&resyncActiveClients_defaultOnce_442, v21);
    if (resyncActiveClients_classDebugEnabled_443)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[PLLocationAgent lastResyncActiveClientsDate](self, "lastResyncActiveClientsDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("lastResyncActiveClientsDate: %@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent resyncActiveClients]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 1441);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v20 = (void *)CLCopyAppsUsingLocation();
  -[PLLocationAgent updateClientsLocationInfo:](self, "updateClientsLocationInfo:", v20);

}

uint64_t __38__PLLocationAgent_resyncActiveClients__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  resyncActiveClients_classDebugEnabled = result;
  return result;
}

uint64_t __38__PLLocationAgent_resyncActiveClients__block_invoke_444(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  resyncActiveClients_classDebugEnabled_443 = result;
  return result;
}

- (void)logEventForwardClientStatuswithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD block[5];
  _QWORD v43[5];

  v4 = a3;
  v5 = (void *)os_transaction_create();
  -[PLLocationAgent lastResyncActiveClientsDate](self, "lastResyncActiveClientsDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v6)
  {
    if (v7)
    {
      v8 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_452;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (logEventForwardClientStatuswithPayload__defaultOnce_450 != -1)
        dispatch_once(&logEventForwardClientStatuswithPayload__defaultOnce_450, block);
      if (logEventForwardClientStatuswithPayload__classDebugEnabled_451)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received Client status change notification"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventForwardClientStatuswithPayload:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 1459);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLocationAgent lastResyncActiveClientsDate](self, "lastResyncActiveClientsDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v16);
      v18 = v17;

      if (v18 >= 3600.0)
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v33 = objc_opt_class();
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_462;
          v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v40[4] = v33;
          if (logEventForwardClientStatuswithPayload__defaultOnce_460 != -1)
            dispatch_once(&logEventForwardClientStatuswithPayload__defaultOnce_460, v40);
          if (logEventForwardClientStatuswithPayload__classDebugEnabled_461)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("diff: %f"), *(_QWORD *)&v18);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "lastPathComponent");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventForwardClientStatuswithPayload:]");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 1468);

            PLLogCommon();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          }
        }
        -[PLLocationAgent resyncActiveClients](self, "resyncActiveClients");
      }
      else
      {
        -[PLLocationAgent updateClientsLocationInfo:](self, "updateClientsLocationInfo:", v4);
      }

    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v26 = objc_opt_class();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_457;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = v26;
      if (logEventForwardClientStatuswithPayload__defaultOnce_455 != -1)
        dispatch_once(&logEventForwardClientStatuswithPayload__defaultOnce_455, v41);
      if (logEventForwardClientStatuswithPayload__classDebugEnabled_456)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No payload!"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventForwardClientStatuswithPayload:]");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 1461);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
  }
  else
  {
    if (v7)
    {
      v19 = objc_opt_class();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v19;
      if (logEventForwardClientStatuswithPayload__defaultOnce != -1)
        dispatch_once(&logEventForwardClientStatuswithPayload__defaultOnce, v43);
      if (logEventForwardClientStatuswithPayload__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initializing lastResyncActiveClientsDate"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventForwardClientStatuswithPayload:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 1455);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    -[PLLocationAgent resyncActiveClients](self, "resyncActiveClients");
  }

}

uint64_t __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardClientStatuswithPayload__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_452(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardClientStatuswithPayload__classDebugEnabled_451 = result;
  return result;
}

uint64_t __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_457(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardClientStatuswithPayload__classDebugEnabled_456 = result;
  return result;
}

uint64_t __58__PLLocationAgent_logEventForwardClientStatuswithPayload___block_invoke_462(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardClientStatuswithPayload__classDebugEnabled_461 = result;
  return result;
}

- (id)getOpenEntryForClientSettings:(id)a3 withTimeStarted:(id)a4 withClient:(id)a5 withType:(id)a6 withEntryKey:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_msgSend(a3, "mutableCopy");
  v17 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v15, "doubleValue");
  v19 = v18;

  objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertFromSystemToMonotonic");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("entryDate"));

  v22 = v16;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v12, v22);

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("Client"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v13, CFSTR("Type"));
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLocationAgent updateLocalCacheWithClient:withType:withBundleID:withEntry:](self, "updateLocalCacheWithClient:withType:withBundleID:withEntry:", v14, v13, v24, v23);

  return v23;
}

- (void)closeOpenEntryForClient:(id)a3 withOpenEntry:(id)a4 withTimeStopped:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
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
  NSObject *v28;
  _QWORD block[5];
  _QWORD v30[4];
  id v31;
  id v32;
  PLLocationAgent *v33;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a5, "doubleValue");
  objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertFromSystemToMonotonic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke;
  v30[3] = &unk_1EA16DCE0;
  v14 = v9;
  v31 = v14;
  v15 = v12;
  v32 = v15;
  v33 = self;
  -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v14, v30);
  -[PLLocationAgent activeClients](self, "activeClients");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("BundleId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLLocationAgent activeClients](self, "activeClients");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v8);

    if (v18)
    {
      -[PLLocationAgent activeBackgroundLocationClients](self, "activeBackgroundLocationClients");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObject:", v18);

    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke_469;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = objc_opt_class();
      if (closeOpenEntryForClient_withOpenEntry_withTimeStopped__defaultOnce != -1)
        dispatch_once(&closeOpenEntryForClient_withOpenEntry_withTimeStopped__defaultOnce, block);
      if (closeOpenEntryForClient_withOpenEntry_withTimeStopped__classDebugEnabled)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        -[PLLocationAgent activeClients](self, "activeClients");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("Active clients: %@"), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent closeOpenEntryForClient:withOpenEntry:withTimeStopped:]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 1518);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }

  }
}

void __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t block;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("timestampEnd"));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke_2;
    v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    v13 = v2;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_12_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_12_defaultOnce, &block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_12_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: location terminate signal; lastEntry=%@"),
        "-[PLLocationAgent closeOpenEntryForClient:withOpenEntry:withTimeStopped:]_block_invoke",
        1506,
        *(_QWORD *)(a1 + 32),
        block,
        v10,
        v11,
        v12,
        v13);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent closeOpenEntryForClient:withOpenEntry:withTimeStopped:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1506);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
}

uint64_t __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_12_classDebugEnabled = result;
  return result;
}

uint64_t __73__PLLocationAgent_closeOpenEntryForClient_withOpenEntry_withTimeStopped___block_invoke_469(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  closeOpenEntryForClient_withOpenEntry_withTimeStopped__classDebugEnabled = result;
  return result;
}

- (void)updateClientsLocationInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _QWORD block[5];
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1DF0A47AC]();
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ClientStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
    -[PLLocationAgent logEventNoneClientStatusDebugWithClients:](self, "logEventNoneClientStatusDebugWithClients:", v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLocationAgent activeBackgroundLocationClients](self, "activeBackgroundLocationClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke;
  v34[3] = &unk_1EA16EFD0;
  v34[4] = self;
  v12 = v6;
  v35 = v12;
  v13 = v7;
  v36 = v13;
  v14 = v8;
  v37 = v14;
  v31 = v4;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v34);
  if (objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v33[0] = v11;
      v33[1] = 3221225472;
      v33[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_527;
      v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v33[4] = objc_opt_class();
      if (updateClientsLocationInfo__defaultOnce != -1)
        dispatch_once(&updateClientsLocationInfo__defaultOnce, v33);
      if (updateClientsLocationInfo__classDebugEnabled)
      {
        v30 = v5;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logging newOpenEntries=%@"), v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 1666);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        v5 = v30;
        v11 = MEMORY[0x1E0C809B0];
      }
    }
    v38 = v12;
    v39[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v21, v12);
  }
  else
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
    objc_msgSend(v21, "setIsErrorEntry:", 1);
    -[PLOperator logEntry:](self, "logEntry:", v21);
  }

  -[PLLocationAgent updateLocationDistributionEvents](self, "updateLocationDistributionEvents");
  -[PLLocationAgent activeBackgroundLocationClients](self, "activeBackgroundLocationClients");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v10, "isEqualToSet:", v22);

  if ((v23 & 1) == 0)
    -[PLLocationAgent updateLocationQualificationEvents](self, "updateLocationQualificationEvents");

  objc_autoreleasePoolPop(v5);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_530;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (updateClientsLocationInfo__defaultOnce_528 != -1)
      dispatch_once(&updateClientsLocationInfo__defaultOnce_528, block);
    if (updateClientsLocationInfo__classDebugEnabled_529)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 1680);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

void __45__PLLocationAgent_updateClientsLocationInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  int v89;
  void *v90;
  int v91;
  int v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  NSObject *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id obj;
  id v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *context;
  _QWORD v145[5];
  _QWORD v146[5];
  _QWORD v147[5];
  _QWORD v148[5];
  _QWORD v149[5];
  _QWORD v150[5];
  _QWORD v151[5];
  _QWORD v152[5];
  _QWORD v153[5];
  _QWORD v154[5];
  _QWORD block[5];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _QWORD v160[5];
  uint8_t buf[4];
  void *v162;
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v139 = a2;
  v5 = a3;
  v6 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    v160[0] = MEMORY[0x1E0C809B0];
    v160[1] = 3221225472;
    v160[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_2;
    v160[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v160[4] = v7;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce, v160);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("client=%@"), v139);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1541);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "clientStatusTypeStrings");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v141 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v163, 16);
    if (!v141)
      goto LABEL_121;
    v140 = *(_QWORD *)v157;
    v138 = v5;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v157 != v140)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v14);
        context = (void *)MEMORY[0x1DF0A47AC]();
        objc_msgSend(*(id *)(a1 + 32), "clientStatusTypeStrings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TimeStarted"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "clientStatusTypeStrings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = v15;
        objc_msgSend(v20, "objectForKeyedSubscript:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TimeStopped"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("InUseLevel"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
        {
          v25 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_476;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v25;
          if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_474 != -1)
            dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_474, block);
          if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_475)
          {
            v26 = v19;
            v27 = a1;
            v28 = v23;
            v29 = v24;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InUseLevel = %@"), v24);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "lastPathComponent");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 1564);

            PLLogCommon();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v162 = v30;
              _os_log_debug_impl(&dword_1DA9D6000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v5 = v138;
            v6 = 0x1E0D7F000uLL;
            v24 = v29;
            v23 = v28;
            a1 = v27;
            v19 = v26;
          }
        }
        if (v19 | v23)
        {
          v142 = v24;
          if (v19)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LocationDesiredAccuracy"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (v36 && objc_msgSend(v36, "integerValue") >= 6378136)
            {
              if (objc_msgSend(v37, "integerValue") != 2147483642)
                objc_msgSend(v37, "integerValue");
              goto LABEL_109;
            }
LABEL_35:

          }
          else if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
          {
            v38 = objc_opt_class();
            v154[0] = MEMORY[0x1E0C809B0];
            v154[1] = 3221225472;
            v154[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_482;
            v154[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v154[4] = v38;
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_480 != -1)
              dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_480, v154);
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_481)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type=%@, timeStarted=%@, timeStopped=%@"), v143, 0, v23);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "lastPathComponent");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v41, v42, 1580);

              PLLogCommon();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v162 = v37;
                _os_log_debug_impl(&dword_1DA9D6000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v5 = v138;
              v6 = 0x1E0D7F000uLL;
              goto LABEL_35;
            }
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleId"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "lastEntryWithClient:withType:withBundleID:withEntryKey:", v139, v143, v37, *(_QWORD *)(a1 + 40));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
          {
            v45 = objc_opt_class();
            v153[0] = MEMORY[0x1E0C809B0];
            v153[1] = 3221225472;
            v153[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_485;
            v153[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v153[4] = v45;
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_483 != -1)
              dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_483, v153);
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_484)
            {
              v128 = v23;
              v46 = v44;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastEntry=%@"), v44);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "lastPathComponent");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "logMessage:fromFile:fromFunction:fromLineNumber:", v47, v50, v51, 1587);

              PLLogCommon();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v162 = v47;
                _os_log_debug_impl(&dword_1DA9D6000, v52, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v5 = v138;
              v6 = 0x1E0D7F000uLL;
              v44 = v46;
              v23 = v128;
            }
          }
          if (!v44
            || (objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("timestampEnd")),
                v53 = (void *)objc_claimAutoreleasedReturnValue(),
                v53,
                v53))
          {
            if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
            {
              v54 = objc_opt_class();
              v152[0] = MEMORY[0x1E0C809B0];
              v152[1] = 3221225472;
              v152[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_490;
              v152[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v152[4] = v54;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_488 != -1)
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_488, v152);
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_489)
              {
                v129 = v44;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("last entry doesn't exist or last entry stopped"));
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "lastPathComponent");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v55, v58, v59, 1592);

                PLLogCommon();
                v60 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v162 = v55;
                  _os_log_debug_impl(&dword_1DA9D6000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v5 = v138;
                v6 = 0x1E0D7F000uLL;
                v44 = v129;
              }
            }
            if (v19)
            {
              objc_msgSend(*(id *)(a1 + 32), "getOpenEntryForClientSettings:withTimeStarted:withClient:withType:withEntryKey:", v5, v19, v139, v143, *(_QWORD *)(a1 + 40));
              v61 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v61);
              goto LABEL_54;
            }
            v61 = 0;
            v24 = v142;
LABEL_108:

LABEL_109:
            goto LABEL_110;
          }
          v81 = v142;
          if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
          {
            v82 = objc_opt_class();
            v151[0] = MEMORY[0x1E0C809B0];
            v151[1] = 3221225472;
            v151[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_495;
            v151[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v151[4] = v82;
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_493 != -1)
              dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_493, v151);
            if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_494)
            {
              v132 = v44;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("last entry exists and is still open"));
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "lastPathComponent");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "logMessage:fromFile:fromFunction:fromLineNumber:", v83, v86, v87, 1604);

              PLLogCommon();
              v88 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v162 = v83;
                _os_log_debug_impl(&dword_1DA9D6000, v88, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v5 = v138;
              v81 = v142;
              v44 = v132;
            }
          }
          v89 = objc_msgSend(v81, "intValue");
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("InUseLevel"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v90, "intValue");

          v92 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
          if (!v19 || v89 == v91)
          {
            v6 = 0x1E0D7F000;
            if (v23)
            {
              v24 = v142;
              if (v92)
              {
                v110 = objc_opt_class();
                v148[0] = MEMORY[0x1E0C809B0];
                v148[1] = 3221225472;
                v148[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_511;
                v148[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v148[4] = v110;
                if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_509 != -1)
                  dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_509, v148);
                if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_510)
                {
                  v127 = v37;
                  v135 = v44;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Location event stopped"));
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  v112 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v113, "lastPathComponent");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v112, "logMessage:fromFile:fromFunction:fromLineNumber:", v111, v114, v115, 1627);

                  PLLogCommon();
                  v116 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v162 = v111;
                    _os_log_debug_impl(&dword_1DA9D6000, v116, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v5 = v138;
                  v24 = v142;
                  v37 = v127;
                  v44 = v135;
                }
              }
              objc_msgSend(*(id *)(a1 + 32), "closeOpenEntryForClient:withOpenEntry:withTimeStopped:", v139, v44, v23);
              v61 = 0;
              goto LABEL_108;
            }
            v24 = v142;
            if (v92)
            {
              v117 = objc_opt_class();
              v147[0] = MEMORY[0x1E0C809B0];
              v147[1] = 3221225472;
              v147[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_516;
              v147[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v147[4] = v117;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_514 != -1)
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_514, v147);
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_515)
              {
                v136 = v44;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Location event still open"));
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                v119 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "lastPathComponent");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "logMessage:fromFile:fromFunction:fromLineNumber:", v118, v121, v122, 1633);

                PLLogCommon();
                v123 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v162 = v118;
                  _os_log_debug_impl(&dword_1DA9D6000, v123, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v5 = v138;
                v6 = 0x1E0D7F000;
                v24 = v142;
                v44 = v136;
              }
            }
            v61 = v44;
          }
          else
          {
            if (v92)
            {
              v93 = objc_opt_class();
              v150[0] = MEMORY[0x1E0C809B0];
              v150[1] = 3221225472;
              v150[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_500;
              v150[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v150[4] = v93;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_498 != -1)
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_498, v150);
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_499)
              {
                v94 = (void *)MEMORY[0x1E0CB3940];
                v133 = v44;
                objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("InUseLevel"));
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "stringWithFormat:", CFSTR("Inuse level changed from %@ to %@"), v95, v142);
                v96 = (void *)objc_claimAutoreleasedReturnValue();

                v97 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "lastPathComponent");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "logMessage:fromFile:fromFunction:fromLineNumber:", v96, v99, v100, 1607);

                PLLogCommon();
                v101 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v162 = v96;
                  _os_log_debug_impl(&dword_1DA9D6000, v101, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v5 = v138;
                v44 = v133;
              }
            }
            v102 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceReferenceDate");
            objc_msgSend(v102, "numberWithDouble:");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v104 = objc_opt_class();
              v149[0] = MEMORY[0x1E0C809B0];
              v149[1] = 3221225472;
              v149[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_506;
              v149[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v149[4] = v104;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_504 != -1)
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_504, v149);
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_505)
              {
                v134 = v44;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TimestampStarted: %@ TimestampInUseLevel: %@"), v19, v103);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                v105 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "lastPathComponent");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v105, "logMessage:fromFile:fromFunction:fromLineNumber:", v125, v107, v108, 1610);

                PLLogCommon();
                v109 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v162 = v125;
                  _os_log_debug_impl(&dword_1DA9D6000, v109, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v5 = v138;
                v44 = v134;
              }
            }
            objc_msgSend(*(id *)(a1 + 32), "closeOpenEntryForClient:withOpenEntry:withTimeStopped:", v139, v44, v103);
            objc_msgSend(*(id *)(a1 + 32), "getOpenEntryForClientSettings:withTimeStarted:withClient:withType:withEntryKey:", v5, v103, v139, v143, *(_QWORD *)(a1 + 40));
            v61 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v61);

            v6 = 0x1E0D7F000;
LABEL_54:
            v24 = v142;
            if (!v61)
              goto LABEL_108;
          }
          if (objc_msgSend(v143, "isEqualToString:", CFSTR("Location")))
          {
            v126 = v37;
            if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
            {
              v62 = objc_opt_class();
              v146[0] = MEMORY[0x1E0C809B0];
              v146[1] = 3221225472;
              v146[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_521;
              v146[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v146[4] = v62;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_519 != -1)
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_519, v146);
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_520)
              {
                v130 = v44;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("still open location openEntry=%@"), v61);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "lastPathComponent");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "logMessage:fromFile:fromFunction:fromLineNumber:", v63, v66, v67, 1652);

                PLLogCommon();
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v162 = v63;
                  _os_log_debug_impl(&dword_1DA9D6000, v68, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v5 = v138;
                v6 = 0x1E0D7F000uLL;
                v24 = v142;
                v44 = v130;
              }
            }
            objc_msgSend(*(id *)(a1 + 32), "activeClients");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setObject:forKeyedSubscript:", v61, v139);

            if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
            {
              v70 = objc_opt_class();
              v145[0] = MEMORY[0x1E0C809B0];
              v145[1] = 3221225472;
              v145[2] = __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_526;
              v145[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v145[4] = v70;
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_524 != -1)
                dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_defaultOnce_524, v145);
              if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_525)
              {
                v131 = v44;
                v71 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(*(id *)(a1 + 32), "activeClients");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "stringWithFormat:", CFSTR("Active clients: %@"), v72);
                v73 = (void *)objc_claimAutoreleasedReturnValue();

                v74 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "lastPathComponent");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateClientsLocationInfo:]_block_invoke_2");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "logMessage:fromFile:fromFunction:fromLineNumber:", v73, v76, v77, 1654);

                PLLogCommon();
                v78 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v162 = v73;
                  _os_log_debug_impl(&dword_1DA9D6000, v78, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v5 = v138;
                v6 = 0x1E0D7F000;
                v24 = v142;
                v44 = v131;
              }
            }
            objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("BundleId"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            if (v79 && !objc_msgSend(v24, "intValue"))
            {
              objc_msgSend(*(id *)(a1 + 32), "activeBackgroundLocationClients");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "addObject:", v79);

              v24 = v142;
            }

            v37 = v126;
          }
          goto LABEL_108;
        }
LABEL_110:

        objc_autoreleasePoolPop(context);
        ++v14;
      }
      while (v141 != v14);
      v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v163, 16);
      v141 = v124;
      if (!v124)
      {
LABEL_121:

        break;
      }
    }
  }

}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_476(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_475 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_482(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_481 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_485(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_484 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_490(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_489 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_495(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_494 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_500(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_499 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_506(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_505 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_511(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_510 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_516(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_515 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_521(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_520 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_526(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_13_classDebugEnabled_525 = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_527(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateClientsLocationInfo__classDebugEnabled = result;
  return result;
}

uint64_t __45__PLLocationAgent_updateClientsLocationInfo___block_invoke_530(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateClientsLocationInfo__classDebugEnabled_529 = result;
  return result;
}

- (unint64_t)convertClientEvent:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("enabled")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("disabled")))
  {
    v4 = 0;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (unint64_t)convertViewObstructedEvent:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("suppress")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("unsuppress")))
  {
    v4 = 0;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)logEventForwardSuppressionManagerClient:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", v4, CFSTR("SuppressionManagerClient"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v10, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PLLocationAgent convertClientEvent:](self, "convertClientEvent:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("clientEvent"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardViewObstructed:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", v4, CFSTR("ViewObstructed"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VOEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PLLocationAgent convertViewObstructedEvent:](self, "convertViewObstructedEvent:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VOEvent"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventFowardGPSSubscription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("GPSActivation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ServiceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("peer silo:"));
  v9 = v8;
  v10 = objc_msgSend(v6, "rangeOfString:", CFSTR(">"));
  v11 = 0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "substringWithRange:", v7 + v9, v10 - (v7 + v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("ServiceName"));
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Register"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("Register"));

  -[PLOperator logEntry:](self, "logEntry:", v5);
}

- (void)logEventForwardGnssSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("GnssSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventCfTimeSec"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventCfTimeSec"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "convertFromSystemToMonotonic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PLLocationAgent logEventForwardGnssSession:].cold.1(v4, (uint64_t)v10, v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v5, v10);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("eventType"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventStatus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("eventStatus"));

    -[PLOperator logEntry:](self, "logEntry:", v12);
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v5, v4);
    -[PLOperator logEntry:](self, "logEntry:", v10);
  }

}

- (unint64_t)convertOdometryEvent:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("start")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("stop")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PLLocationAgent convertOdometryEvent:].cold.1();

    v4 = 2;
  }

  return v4;
}

- (unint64_t)convertCheckInEvent:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("start")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("stop")))
  {
    v4 = 0;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)logEventForwardOdometry:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", v4, CFSTR("Odometry"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("odometryEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLLocationAgent convertOdometryEvent:](self, "convertOdometryEvent:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("odometryEvent"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updateInterval"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("updateInterval"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("identifier"));
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventForwardCheckInSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("event"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PLLocationAgent convertCheckInEvent:](self, "convertCheckInEvent:", v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("event"));

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLLocationAgent logEventForwardCheckInSession:].cold.1();

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("CoreRoutine"), CFSTR("CheckInSession"), v5);
}

- (void)logEventIntervalSeparationAlert:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", v4, CFSTR("SeparationAlert"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v13, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertFromSystemToMonotonic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryDate:", v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("timestampEnd"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventIntervalMapsBusynessState:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", v4, CFSTR("MapsBusyness"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v21);
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA1C0290);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertFromSystemToMonotonic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryDate:", v11);

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA1C02A8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("Launched"));

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA1C02C0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("HarvestedRealTimeOnPower"));

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA1C02D8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("HarvestedRealTimeOnBattery"));

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA1C02F0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("HarvestedDifferential"));

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA1C0308);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("RateLimit"));

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA1C0320);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("LocationNotUsable"));

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA1C0338);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("LocationNoAuth"));

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA1C0350);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("LocationUnavailable"));
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("timestampEnd"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventIntervalPDR:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", v4, CFSTR("PDR"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventNoneClientStatus
{
  id v3;

  v3 = (id)CLCopyAppsUsingLocation();
  -[PLLocationAgent logEventNoneClientStatusDebugWithClients:](self, "logEventNoneClientStatusDebugWithClients:", v3);

}

- (void)logEventNoneClientStatusDebugWithClients:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;
  PLLocationAgent *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D80388];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", v4, CFSTR("ClientStatusDebug"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __60__PLLocationAgent_logEventNoneClientStatusDebugWithClients___block_invoke;
  v14 = &unk_1EA16EFF8;
  v15 = v6;
  v16 = v7;
  v17 = self;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v11);

  v18 = v9;
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1, v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v10, v9);

}

void __60__PLLocationAgent_logEventNoneClientStatusDebugWithClients___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 32), v6);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("Client"));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __60__PLLocationAgent_logEventNoneClientStatusDebugWithClients___block_invoke_2;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v8;
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_14_defaultOnce != -1)
      dispatch_once(&kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_14_defaultOnce, &block);
    if (kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_14_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client=%@ entry=%@ clientSettings=%@"), v5, v7, v6, block, v16, v17, v18, v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent logEventNoneClientStatusDebugWithClients:]_block_invoke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 1921);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __60__PLLocationAgent_logEventNoneClientStatusDebugWithClients___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLLocationAgentAddProcessesOfInterestNotificationName_block_invoke_14_classDebugEnabled = result;
  return result;
}

- (void)updateLocationDistributionEvents
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  int v59;
  char v60;
  char v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  PLLocationAgent *v71;
  void *v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[5];
  _QWORD block[5];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  void *v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    -[PLLocationAgent activeClients](self, "activeClients");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = self;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v4 = objc_opt_class();
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke;
      v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v88[4] = v4;
      if (updateLocationDistributionEvents_defaultOnce != -1)
        dispatch_once(&updateLocationDistributionEvents_defaultOnce, v88);
      if (updateLocationDistributionEvents_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientToOpenEntry=%@"), v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateLocationDistributionEvents]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1956);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v11 = v3;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
    v72 = v11;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v85;
      v73 = *(_QWORD *)v85;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v85 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v17 = (void *)MEMORY[0x1DF0A47AC]();
            objc_msgSend(v11, "objectForKeyedSubscript:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v19 = objc_opt_class();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke_574;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v19;
              if (updateLocationDistributionEvents_defaultOnce_572 != -1)
                dispatch_once(&updateLocationDistributionEvents_defaultOnce_572, block);
              if (updateLocationDistributionEvents_classDebugEnabled_573)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientID=%@, openEntry=%@"), v16, v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "lastPathComponent");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateLocationDistributionEvents]");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 1965);

                PLLogCommon();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v92 = v20;
                  _os_log_debug_impl(&dword_1DA9D6000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v11 = v72;
              }
            }
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("LocationDesiredAccuracy"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v26)
            {
              objc_msgSend(v26, "doubleValue");
              if (v28 < 1000.0)
              {
                objc_msgSend(v18, "entryDate");
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29)
                {
                  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BundleId"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v30)
                    goto LABEL_74;
                  if (objc_msgSend(v16, "hasPrefix:", CFSTR("com.apple.locationd.bundle-")))
                  {
                    objc_msgSend(v16, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.locationd.bundle-"), "length"));
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v40);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    +[PLUtilities bundleIDFromURL:](PLUtilities, "bundleIDFromURL:", v41);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();

                    v11 = v72;
                    if (v30)
                    {
LABEL_74:
                      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
                      {
                        v31 = objc_opt_class();
                        v82[0] = MEMORY[0x1E0C809B0];
                        v82[1] = 3221225472;
                        v82[2] = __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke_582;
                        v82[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                        v82[4] = v31;
                        if (updateLocationDistributionEvents_defaultOnce_580 != -1)
                          dispatch_once(&updateLocationDistributionEvents_defaultOnce_580, v82);
                        if (updateLocationDistributionEvents_classDebugEnabled_581)
                        {
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@"), v30);
                          v32 = objc_claimAutoreleasedReturnValue();
                          v68 = (void *)MEMORY[0x1E0D7FF98];
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLLocationAgent.m");
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v33, "lastPathComponent");
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLLocationAgent updateLocationDistributionEvents]");
                          v35 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v68, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v34, v35, 1986);

                          v36 = (void *)v32;
                          PLLogCommon();
                          v37 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            v92 = v36;
                            _os_log_debug_impl(&dword_1DA9D6000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                          }

                          v11 = v72;
                        }
                      }
                      objc_msgSend(v27, "doubleValue");
                      if (v38 >= 100.0)
                        v39 = v69;
                      else
                        v39 = v70;
                      objc_msgSend(v39, "setObject:forKeyedSubscript:", &unk_1EA1C02A8, v30);

                    }
                  }
                }
              }
            }

            objc_autoreleasePoolPop(v17);
            v14 = v73;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
      }
      while (v13);
    }

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    objc_msgSend(v70, "allKeys");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v79 != v45)
            objc_enumerationMutation(v42);
          v47 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / (double)(unint64_t)objc_msgSend(v70, "count"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v48, v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
      }
      while (v44);
    }

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(v69, "allKeys");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v75;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v75 != v52)
            objc_enumerationMutation(v49);
          v54 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / (double)(unint64_t)objc_msgSend(v69, "count"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v55, v54);

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
      }
      while (v51);
    }

    if (objc_msgSend(v70, "count"))
      v56 = v70;
    else
      v56 = v69;
    v57 = v67;
    objc_msgSend(v67, "setValuesForKeysWithDictionary:", v56);
    v58 = objc_msgSend(v70, "isEqualToDictionary:", v71->_bundleIDToWeightUsingGPSCache);
    v59 = objc_msgSend(v69, "isEqualToDictionary:", v71->_bundleIDToWeightUsingWiFiCache);
    v60 = objc_msgSend(v67, "isEqualToDictionary:", v71->_bundleIDToWeightUsingLocationCache);
    v61 = v60;
    if (v58 && v59 && (v60 & 1) != 0)
      goto LABEL_67;
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v58 & 1) != 0)
    {
      if ((v59 & 1) != 0)
        goto LABEL_64;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 23, v70, v62);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 24, v70, v62);

      v57 = v67;
      objc_storeStrong((id *)&v71->_bundleIDToWeightUsingGPSCache, v70);
      if ((v59 & 1) != 0)
      {
LABEL_64:
        if ((v61 & 1) != 0)
        {
LABEL_66:

LABEL_67:
          return;
        }
LABEL_65:
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 30, v57, v62);

        objc_storeStrong((id *)&v71->_bundleIDToWeightUsingLocationCache, v57);
        goto LABEL_66;
      }
    }
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 25, v69, v62);

    v57 = v67;
    objc_storeStrong((id *)&v71->_bundleIDToWeightUsingWiFiCache, v69);
    if ((v61 & 1) != 0)
      goto LABEL_66;
    goto LABEL_65;
  }
}

uint64_t __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateLocationDistributionEvents_classDebugEnabled = result;
  return result;
}

uint64_t __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke_574(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateLocationDistributionEvents_classDebugEnabled_573 = result;
  return result;
}

uint64_t __51__PLLocationAgent_updateLocationDistributionEvents__block_invoke_582(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateLocationDistributionEvents_classDebugEnabled_581 = result;
  return result;
}

- (void)updateLocationQualificationEvents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PLLocationAgent activeBackgroundLocationClients](self, "activeBackgroundLocationClients");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 15, v4, v5);

  }
}

- (void)updateGnssPowerMetric:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  double v17;
  void *v18;
  double v19;
  id v20;

  v20 = a3;
  +[PLOperator entryKeyForType:andName:](PLLocationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("GPSPower"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
  objc_msgSend(v20, "objectForKey:", CFSTR("intervalStartTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("startTime"));

  objc_msgSend(v20, "objectForKey:", CFSTR("measuredInterval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("measuredInterval"));

  objc_msgSend(v20, "objectForKey:", CFSTR("activeInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("activeInterval"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v20, "objectForKey:", CFSTR("averagePower"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v9, "numberWithInt:", (100 * (int)v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("averagePower"));

  objc_msgSend(v20, "objectForKey:", CFSTR("activeL5IntervalSec"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("activeL5IntervalSec"));

  -[PLOperator logEntry:](self, "logEntry:", v5);
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(v5, "entryDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("averagePower"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
    objc_msgSend(v20, "objectForKey:", CFSTR("measuredInterval"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    -[PLLocationAgent modelGpsSegmentPower:withGpsPower:withTotalDuration:](self, "modelGpsSegmentPower:withGpsPower:withTotalDuration:", v14, v17, v19);

  }
}

- (void)modelGpsSegmentPower:(id)a3 withGpsPower:(double)a4 withTotalDuration:(double)a5
{
  char v9;
  void *v10;
  double v11;
  double v12;
  double gps_segment_lastWrittenTimestamp;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  v9 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  v10 = v17;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v17, "timeIntervalSince1970");
    v12 = v11;
    if (self->_gps_segment_lastWrittenDate)
    {
      gps_segment_lastWrittenTimestamp = self->_gps_segment_lastWrittenTimestamp;
      v14 = self->_gps_segment_timestamp - gps_segment_lastWrittenTimestamp;
      v15 = 0.0;
      if (v14 > 0.0)
        v15 = v14 * self->_gps_segment_power;
      v16 = v12 - gps_segment_lastWrittenTimestamp;
      v10 = v17;
      if (v16 > 0.0)
      {
        self->_gps_segment_power = (v15 + a4 * a5) / v16;
        objc_storeStrong((id *)&self->_gps_segment_date, a3);
        v10 = v17;
        self->_gps_segment_timestamp = v12;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_gps_segment_lastWrittenDate, a3);
      self->_gps_segment_lastWrittenTimestamp = v12;
      objc_storeStrong((id *)&self->_gps_segment_date, a3);
      self->_gps_segment_timestamp = self->_gps_segment_lastWrittenTimestamp;
      self->_gps_segment_power = a4;
      v10 = v17;
    }
  }

}

- (void)writeModeledPower
{
  void *v3;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0
    && self->_gps_segment_timestamp != self->_gps_segment_lastWrittenTimestamp)
  {
    if (self->_gps_segment_power > 1000.0)
      self->_gps_segment_power = 1000.0;
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 48, self->_gps_segment_date, self->_gps_segment_power);

    objc_storeStrong((id *)&self->_gps_segment_lastWrittenDate, self->_gps_segment_date);
    self->_gps_segment_lastWrittenTimestamp = self->_gps_segment_timestamp;
  }
}

- (PLCFNotificationOperatorComposition)techStatusChangedNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTechStatusChangedNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)lastTechStatusNotificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastTechStatusNotificationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)techStatusLimiterIsActive
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTechStatusLimiterIsActive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)logLevelNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLogLevelNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)statusBarNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStatusBarNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLXPCListenerOperatorComposition)clientStatusNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setClientStatusNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLXPCListenerOperatorComposition)gpsSubscriptionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setGpsSubscriptionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLXPCListenerOperatorComposition)mapsBusynessStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMapsBusynessStateListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLXPCListenerOperatorComposition)separationAlertListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSeparationAlertListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLXPCListenerOperatorComposition)locationGPSListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLocationGPSListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLEntryNotificationOperatorComposition)sbcLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSbcLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLXPCListenerOperatorComposition)wifiLocationScanRequestersListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setWifiLocationScanRequestersListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLXPCListenerOperatorComposition)odometryListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOdometryListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLXPCListenerOperatorComposition)pdrListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPdrListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLXPCListenerOperatorComposition)checkInSessionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCheckInSessionXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLXPCListenerOperatorComposition)miLoScansListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMiLoScansListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSMutableDictionary)localCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLocalCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSMutableDictionary)clientStatusTypeStrings
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setClientStatusTypeStrings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSMutableSet)processes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 200, 1);
}

- (void)setProcesses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSMutableDictionary)bundleIDToWeightUsingGPSCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setBundleIDToWeightUsingGPSCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSMutableDictionary)bundleIDToWeightUsingWiFiCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBundleIDToWeightUsingWiFiCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSMutableDictionary)bundleIDToWeightUsingLocationCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBundleIDToWeightUsingLocationCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSMutableDictionary)activeClients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setActiveClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSMutableSet)activeBackgroundLocationClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 240, 1);
}

- (void)setActiveBackgroundLocationClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSDate)lastResyncActiveClientsDate
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
}

- (void)setLastResyncActiveClientsDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (double)gps_segment_power
{
  return self->_gps_segment_power;
}

- (void)setGps_segment_power:(double)a3
{
  self->_gps_segment_power = a3;
}

- (NSDate)gps_segment_lastWrittenDate
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setGps_segment_lastWrittenDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (double)gps_segment_lastWrittenTimestamp
{
  return self->_gps_segment_lastWrittenTimestamp;
}

- (void)setGps_segment_lastWrittenTimestamp:(double)a3
{
  self->_gps_segment_lastWrittenTimestamp = a3;
}

- (NSDate)gps_segment_date
{
  return (NSDate *)objc_getProperty(self, a2, 280, 1);
}

- (void)setGps_segment_date:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (double)gps_segment_timestamp
{
  return self->_gps_segment_timestamp;
}

- (void)setGps_segment_timestamp:(double)a3
{
  self->_gps_segment_timestamp = a3;
}

- (PLXPCListenerOperatorComposition)viewObstructedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 296, 1);
}

- (void)setViewObstructedListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (PLXPCListenerOperatorComposition)suppressionManagerClientListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSuppressionManagerClientListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (PLXPCListenerOperatorComposition)gnssSessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 312, 1);
}

- (void)setGnssSessionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (PLXPCListenerOperatorComposition)motionPacketListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 320, 1);
}

- (void)setMotionPacketListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionPacketListener, 0);
  objc_storeStrong((id *)&self->_gnssSessionListener, 0);
  objc_storeStrong((id *)&self->_suppressionManagerClientListener, 0);
  objc_storeStrong((id *)&self->_viewObstructedListener, 0);
  objc_storeStrong((id *)&self->_gps_segment_date, 0);
  objc_storeStrong((id *)&self->_gps_segment_lastWrittenDate, 0);
  objc_storeStrong((id *)&self->_lastResyncActiveClientsDate, 0);
  objc_storeStrong((id *)&self->_activeBackgroundLocationClients, 0);
  objc_storeStrong((id *)&self->_activeClients, 0);
  objc_storeStrong((id *)&self->_bundleIDToWeightUsingLocationCache, 0);
  objc_storeStrong((id *)&self->_bundleIDToWeightUsingWiFiCache, 0);
  objc_storeStrong((id *)&self->_bundleIDToWeightUsingGPSCache, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_clientStatusTypeStrings, 0);
  objc_storeStrong((id *)&self->_localCache, 0);
  objc_storeStrong((id *)&self->_miLoScansListener, 0);
  objc_storeStrong((id *)&self->_checkInSessionXPCListener, 0);
  objc_storeStrong((id *)&self->_pdrListener, 0);
  objc_storeStrong((id *)&self->_odometryListener, 0);
  objc_storeStrong((id *)&self->_wifiLocationScanRequestersListener, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_sbcLevelChanged, 0);
  objc_storeStrong((id *)&self->_locationGPSListener, 0);
  objc_storeStrong((id *)&self->_separationAlertListener, 0);
  objc_storeStrong((id *)&self->_mapsBusynessStateListener, 0);
  objc_storeStrong((id *)&self->_gpsSubscriptionListener, 0);
  objc_storeStrong((id *)&self->_clientStatusNotification, 0);
  objc_storeStrong((id *)&self->_statusBarNotification, 0);
  objc_storeStrong((id *)&self->_logLevelNotification, 0);
  objc_storeStrong((id *)&self->_techStatusLimiterIsActive, 0);
  objc_storeStrong((id *)&self->_lastTechStatusNotificationDate, 0);
  objc_storeStrong((id *)&self->_techStatusChangedNotification, 0);
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_347_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Received InertialOdometryPowerMetric XPC with payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_353_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Received PedestrianFencePowerMetric XPC with payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_360_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "CheckInSession callback %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_364_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Received MiLoScanEvent XPC with payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_370_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Received gpsactivation XPC with payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_374_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Received GnssSession XPC with payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_378_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Received MotionPacket XPC with payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_384_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "ViewObstructed state change XPC with payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__PLLocationAgent_initOperatorDependancies__block_invoke_390_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "SuppressionManager client state change XPC with payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logEventForwardGnssSession:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("eventCfTimeSec"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = objc_msgSend(v5, "intValue");
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1DA9D6000, a3, OS_LOG_TYPE_DEBUG, "GnssSession logging absolute time %d as logging timestamp %@", (uint8_t *)v6, 0x12u);

}

- (void)convertOdometryEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Unknown odometryEvent %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logEventForwardCheckInSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "CheckInSession updated payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
