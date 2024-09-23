@implementation tmb6716640bd4d840b4ec454b38cb27d3c

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

  v5 = qword_1000A29BC;
  v4 = HIDWORD(qword_1000A29BC);
  v12.receiver = self;
  v12.super_class = (Class)tmb6716640bd4d840b4ec454b38cb27d3c;
  -[tmb8686d62322e302fccf2995e45c72b1d updateAllThermalLoad:](&v12, "updateAllThermalLoad:", a3);
  sub_10002E350(59, (int)((double)v5 * 0.73 + -22.19 + (double)v4 * 0.27));
  v6 = (float)SHIDWORD(qword_1000A2A94);
  v7 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  v8 = v6 / 100.0;
  *(float *)&v9 = v8;
  objc_msgSend(v7, "calculateControlEffort:", v9);
  v10 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v11 = v8;
  objc_msgSend(v10, "calculateControlEffort:", v11);
}

- (void)updateCoreAnalyticsInfo
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  _QWORD v16[4];
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  unsigned __int8 v30;

  v15 = qword_1000A2A7C;
  v13 = qword_1000A29AC;
  v14 = HIDWORD(qword_1000A2A94);
  v4 = dword_1000A2A88;
  v3 = qword_1000A2A8C;
  if ((int)qword_1000A2A8C <= SHIDWORD(qword_1000A2A8C))
    v3 = HIDWORD(qword_1000A2A8C);
  if (v3 <= (int)qword_1000A2A94)
    v5 = qword_1000A2A94;
  else
    v5 = v3;
  v6 = *(uint64_t *)((char *)&qword_1000A2A7C + 4);
  v7 = qword_1000A29BC;
  v8 = sub_100008F14();
  v9 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v10 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v11 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v12 = -[CommonProduct getChargerState](self, "getChargerState");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000D670;
  v16[3] = &unk_10007D0A0;
  v17 = v13;
  v18 = v6;
  v19 = v4;
  v20 = v15;
  v21 = v14;
  v22 = v7;
  v23 = v5;
  v24 = v10;
  v25 = v11;
  v26 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 2), "releaseMaxLI");
  v27 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 3), "releaseMaxLI");
  v28 = v8;
  v29 = v12;
  v30 = v9;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v16);
}

@end
