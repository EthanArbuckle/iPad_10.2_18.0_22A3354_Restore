@implementation tm369e906e0930ab51a2b5dd8c680c4555

- (void)updateAllThermalLoad:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  int v6;
  int v7;
  float v8;
  id v9;
  float v10;
  double v11;
  id v12;
  double v13;
  objc_super v14;

  v3 = a3;
  v5 = -[tmb76592841479b191dd96577dabc78635 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v6 = qword_1000A28B4;
  v7 = dword_1000A28C0;
  v14.receiver = self;
  v14.super_class = (Class)tm369e906e0930ab51a2b5dd8c680c4555;
  -[tmb76592841479b191dd96577dabc78635 updateAllThermalLoad:](&v14, "updateAllThermalLoad:", v3);
  sub_10002E350(51, (int)((double)v5 * 0.16 + -118.0 + (double)v6 * 0.71 + (double)v7 * 0.14));
  v8 = (float)SHIDWORD(qword_1000A2A74);
  v9 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  v10 = v8 / 100.0;
  *(float *)&v11 = v10;
  objc_msgSend(v9, "calculateControlEffort:", v11);
  v12 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  *(float *)&v13 = v10;
  objc_msgSend(v12, "calculateControlEffort:", v13);
}

- (void)updateCoreAnalyticsInfo
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned int v11;
  __int128 v12;
  __int128 v13;
  int v14;
  _QWORD v15[4];
  int v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned __int8 v30;

  v14 = qword_1000A29AC;
  *(_QWORD *)&v3 = xmmword_1000A28CC;
  v4 = qword_1000A28C4;
  *((_QWORD *)&v3 + 1) = qword_1000A2A68;
  v12 = v3;
  v13 = *(_OWORD *)&qword_1000A28B4;
  v5 = qword_1000A2A74;
  v6 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v7 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v8 = sub_100008F14();
  v9 = -[CommonProduct getChargerState](self, "getChargerState");
  v10 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v11 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000BEB8;
  v15[3] = &unk_10007CFD0;
  v16 = v14;
  v17 = v13;
  v18 = v4;
  v19 = v12;
  v20 = v5;
  v21 = v6;
  v22 = v7;
  v23 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 13), "releaseMaxLI");
  v24 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 12), "releaseMaxLI");
  v30 = v10;
  v25 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "releaseMaxLI");
  v26 = v11;
  v27 = v8;
  v28 = v9;
  v29 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v15);
}

@end
