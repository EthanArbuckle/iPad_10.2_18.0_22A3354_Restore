@implementation tmb8686d62322e302fccf2995e45c72b1d

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tmb8686d62322e302fccf2995e45c72b1d;
  v3 = -[CommonProduct initProduct:](&v6, "initProduct:", a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "resetVTFilterState");
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = -1.0;
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000A29AC;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  id v11;
  float v12;
  double v13;
  double v14;
  double v15;
  float v16;
  id v17;
  float v18;
  double v19;
  id v20;
  double v21;
  unsigned int v22;
  float v23;
  float filteredBacklightCurrentLI2;
  float v25;
  id v26;
  double v27;
  float v28;
  id v29;
  double v30;
  int v31;

  v4 = dword_1000A29D8;
  v5 = qword_1000A29AC;
  v31 = HIDWORD(qword_1000A29AC);
  v6 = qword_1000A29B4;
  v7 = qword_1000A29BC;
  v8 = HIDWORD(qword_1000A29BC);
  v10 = dword_1000A29C8;
  v9 = dword_1000A29CC;
  v11 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v12 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v13 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v14 = v13;
  *(float *)&v13 = v12;
  objc_msgSend(v11, "calculateControlEffort:trigger:", v13, v14);
  v15 = (double)v5;
  sub_10002E350(52, (int)((double)v5 * 0.2 + -16.92 + (double)v8 * 0.79));
  sub_10002E350(53, (int)((double)v5 * 0.61 + 181.3 + (double)v7 * 0.28));
  v16 = (float)(int)qword_1000A2A7C;
  v17 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v18 = v16 / 100.0;
  *(float *)&v19 = v18;
  objc_msgSend(v17, "calculateControlEffort:", v19);
  v20 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v21 = v18;
  objc_msgSend(v20, "calculateControlEffort:", v21);
  v22 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v23 = (double)(int)(v22 * v22) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0.0)
    v23 = filteredBacklightCurrentLI2 + (float)((float)(v23 - filteredBacklightCurrentLI2) * 0.14286);
  self->_filteredBacklightCurrentLI2 = v23;
  sub_10002E350(54, (int)(v23 * 0.8 + -115.3 + v15 * 0.98 + (double)v6 * 0.05));
  sub_10002E350(56, (int)((double)v4 * 0.48 + -27.45 + (double)v6 * 0.3 + (double)v10 * 0.22));
  sub_10002E350(57, (int)((double)v4 * 0.51 + -71.07 + (double)v7 * 0.21 + (double)v10 * 0.29));
  sub_10002E350(58, (int)(v15 * 0.11 + -24.71 + (double)v4 * 0.96 + (double)v9 * -0.07));
  v25 = (float)dword_1000A2A84;
  v26 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v27 = v25 / 100.0;
  objc_msgSend(v26, "calculateControlEffort:", v27);
  sub_10002E350(55, (int)((double)v31 * -0.01 + -65.87 + (double)v6 * 1.02));
  v28 = (float)dword_1000A2A88;
  v29 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v30 = v28 / 100.0;
  objc_msgSend(v29, "calculateControlEffort:", v30);
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
  _QWORD v15[4];
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  unsigned __int8 v28;

  v13 = qword_1000A29AC;
  v14 = qword_1000A2A7C;
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
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004CBC8;
  v15[3] = &unk_10007D298;
  v16 = v13;
  v17 = v6;
  v18 = v4;
  v19 = v14;
  v20 = v7;
  v21 = v5;
  v22 = v10;
  v23 = v11;
  v24 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 2), "releaseMaxLI");
  v25 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 3), "releaseMaxLI");
  v26 = v8;
  v27 = v12;
  v28 = v9;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v15);
}

@end
