@implementation tmbb7eeddea74c8fcfad763f3ffbf59d08

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  float v6;
  id v7;
  float v8;
  double v9;
  id v10;
  double v11;
  objc_super v12;

  v4 = qword_1000A29AC;
  v5 = HIDWORD(qword_1000A29BC);
  v12.receiver = self;
  v12.super_class = (Class)tmbb7eeddea74c8fcfad763f3ffbf59d08;
  -[tm2c2215485370d730a0de95e9234264e9 updateAllThermalLoad:](&v12, "updateAllThermalLoad:", a3);
  sub_10002E350(43, (int)((double)v4 * 0.45 + 55.01 + (double)v5 * 0.51));
  v6 = (float)dword_1000A2A58;
  v7 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  v8 = v6 / 100.0;
  *(float *)&v9 = v8;
  objc_msgSend(v7, "calculateControlEffort:", v9);
  v10 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v11 = v8;
  objc_msgSend(v10, "calculateControlEffort:", v11);
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
  int v12;
  _QWORD v13[4];
  int v14;
  int32x2_t v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  unsigned __int8 v26;

  v3 = qword_1000A29AC;
  v11 = dword_1000A29C4;
  v12 = dword_1000A2A4C;
  v10 = dword_1000A2A58;
  v4 = (int32x2_t)unk_1000A2A50;
  v5 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v6 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v7 = -[CommonProduct getChargerState](self, "getChargerState");
  v8 = sub_100008F14();
  v9 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003E9AC;
  v13[3] = &unk_10007D080;
  v14 = v3;
  v15 = vrev64_s32(v4);
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = v5;
  v20 = v6;
  v21 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 2), "releaseMaxLI");
  v22 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 3), "releaseMaxLI");
  v23 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 7), "releaseMaxLI");
  v24 = v8;
  v25 = v7;
  v26 = v9;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v13);
}

@end
