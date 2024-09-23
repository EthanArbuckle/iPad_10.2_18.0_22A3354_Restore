@implementation tm2c2215485370d730a0de95e9234264e9

- (void)updateAllThermalLoad:(BOOL)a3
{
  uint64_t v4;
  int v5;
  int v6;
  id v7;
  double v8;
  float v9;
  id v10;
  float v11;
  double v12;
  id v13;
  double v14;

  v4 = qword_1000A29AC;
  v5 = qword_1000A29B4;
  v6 = dword_1000A29CC;
  v7 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v8 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  *(float *)&v8 = v8;
  objc_msgSend(v7, "calculateControlEffort:", v8);
  sub_10002E350(40, (int)((double)(int)v4 * 0.57 + 68.76 + (double)v6 * 0.42));
  sub_10002E350(41, (int)((double)v5 * 1.14 + 155.88 + (double)v6 * -0.29));
  sub_10002E350(42, v4);
  v9 = (float)dword_1000A2A4C;
  v10 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v11 = v9 / 100.0;
  *(float *)&v12 = v11;
  objc_msgSend(v10, "calculateControlEffort:", v12);
  v13 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v14 = v11;
  objc_msgSend(v13, "calculateControlEffort:", v14);
}

- (void)updateCoreAnalyticsInfo
{
  int v3;
  int32x2_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned __int8 v9;
  int v10;
  int v11;
  _QWORD v12[4];
  int v13;
  int32x2_t v14;
  int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  unsigned __int8 v24;

  v3 = qword_1000A29AC;
  v10 = dword_1000A29C4;
  v11 = dword_1000A2A4C;
  v4 = (int32x2_t)unk_1000A2A50;
  v5 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v6 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v7 = -[CommonProduct getChargerState](self, "getChargerState");
  v8 = sub_100008F14();
  v9 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000218EC;
  v12[3] = &unk_10007D0C0;
  v13 = v3;
  v14 = vrev64_s32(v4);
  v15 = v11;
  v16 = v10;
  v17 = v5;
  v18 = v6;
  v19 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 2), "releaseMaxLI");
  v20 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 3), "releaseMaxLI");
  v21 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 7), "releaseMaxLI");
  v22 = v8;
  v23 = v7;
  v24 = v9;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v12);
}

@end
