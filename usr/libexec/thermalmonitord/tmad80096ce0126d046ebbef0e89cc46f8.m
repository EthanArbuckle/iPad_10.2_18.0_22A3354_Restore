@implementation tmad80096ce0126d046ebbef0e89cc46f8

- (id)initProduct:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)tmad80096ce0126d046ebbef0e89cc46f8;
  return -[CommonProduct initProduct:](&v4, "initProduct:", a3);
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
  double v16;
  float v17;
  id v18;
  float v19;
  double v20;
  id v21;
  double v22;
  unsigned int v23;
  float v24;
  float filteredBacklightCurrentLI2;
  float v26;
  id v27;
  double v28;
  float v29;
  id v30;
  double v31;
  int v32;

  v4 = qword_1000A29AC;
  v5 = dword_1000A29D8;
  v6 = qword_1000A29BC;
  v32 = HIDWORD(qword_1000A29B4);
  v7 = HIDWORD(qword_1000A29BC);
  v8 = dword_1000A29C4;
  v9 = dword_1000A29C8;
  v10 = dword_1000A29CC;
  v11 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v12 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v13 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v14 = v13;
  *(float *)&v13 = v12;
  objc_msgSend(v11, "calculateControlEffort:trigger:", v13, v14);
  sub_10002E350(52, (int)((double)v6 * 0.4 + -43.94 + (double)v9 * 0.59));
  v15 = (double)v7;
  v16 = (double)v8;
  sub_10002E350(53, (int)((double)v7 * 0.72 + -49.02 + (double)v8 * 0.29));
  v17 = (float)(int)qword_1000A2A7C;
  v18 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v19 = v17 / 100.0;
  *(float *)&v20 = v19;
  objc_msgSend(v18, "calculateControlEffort:", v20);
  v21 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v22 = v19;
  objc_msgSend(v21, "calculateControlEffort:", v22);
  v23 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v24 = (double)(int)(v23 * v23) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0.0)
    v24 = filteredBacklightCurrentLI2 + (float)((float)(v24 - filteredBacklightCurrentLI2) * 0.14286);
  self->_filteredBacklightCurrentLI2 = v24;
  sub_10002E350(54, (int)(v24 * 2.74 + 230.79 + (double)v4 * 1.4 + v16 * -0.38));
  v26 = (float)dword_1000A2A84;
  v27 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v28 = v26 / 100.0;
  objc_msgSend(v27, "calculateControlEffort:", v28);
  sub_10002E350(56, (int)((double)v5 * 0.34 + -10.0 + v15 * 0.52 + v16 * 0.14));
  sub_10002E350(57, (int)(v15 * 0.62 + -28.27 + v16 * 0.28 + (double)v10 * 0.1));
  sub_10002E350(58, (int)((double)v32 * 0.09 + 49.39 + (double)v6 * 0.41 + v15 * 0.47));
  sub_10002E350(55, (int)((double)v4 * 0.62 + -8.64 + (double)v9 * 0.39));
  v29 = (float)dword_1000A2A88;
  v30 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v31 = v29 / 100.0;
  objc_msgSend(v30, "calculateControlEffort:", v31);
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
  v15[2] = sub_10003B0E4;
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
