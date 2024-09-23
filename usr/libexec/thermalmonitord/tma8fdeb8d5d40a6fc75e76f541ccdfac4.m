@implementation tma8fdeb8d5d40a6fc75e76f541ccdfac4

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  int v6;
  float v7;
  id v8;
  float v9;
  double v10;
  id v11;
  double v12;
  objc_super v13;

  v4 = qword_1000A29B4;
  v5 = dword_1000A29C4;
  v6 = dword_1000A29CC;
  v13.receiver = self;
  v13.super_class = (Class)tma8fdeb8d5d40a6fc75e76f541ccdfac4;
  -[tm62a6a44d269463582cca62859fbfb389 updateAllThermalLoad:](&v13, "updateAllThermalLoad:", a3);
  sub_10002E350(55, (int)((double)v4 * 0.02 + -26.0 + (double)v5 * 0.83 + (double)v6 * 0.17));
  v7 = (float)dword_1000A2A88;
  v8 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  v9 = v7 / 100.0;
  *(float *)&v10 = v9;
  objc_msgSend(v8, "calculateControlEffort:", v10);
  v11 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v12 = v9;
  objc_msgSend(v11, "calculateControlEffort:", v12);
}

- (void)updateCoreAnalyticsInfo
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned __int8 v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  _QWORD v15[4];
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned __int8 v27;

  v3 = qword_1000A29AC;
  v14 = qword_1000A2A68;
  v4 = qword_1000A2A74;
  v5 = qword_1000A2A7C;
  v6 = dword_1000A2A88;
  v8 = HIDWORD(qword_1000A29BC);
  v7 = dword_1000A29C4;
  if ((int)qword_1000A2A7C <= SHIDWORD(qword_1000A2A7C))
    v5 = HIDWORD(qword_1000A2A7C);
  if (v5 <= dword_1000A2A84)
    v9 = dword_1000A2A84;
  else
    v9 = v5;
  v10 = *(uint64_t *)((char *)&qword_1000A2A68 + 4);
  v11 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v12 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v13 = -[CommonProduct getChargerState](self, "getChargerState");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100026390;
  v15[3] = &unk_10007D0C0;
  v16 = v3;
  v17 = v8;
  v18 = v10;
  v19 = v4;
  v20 = v14;
  v21 = v6;
  v22 = v9;
  v23 = v7;
  v24 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 13), "releaseMaxLI");
  v25 = v12;
  v26 = v13;
  v27 = v11;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v15);
}

@end
