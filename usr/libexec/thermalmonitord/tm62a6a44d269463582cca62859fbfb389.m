@implementation tm62a6a44d269463582cca62859fbfb389

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm62a6a44d269463582cca62859fbfb389;
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
  _BOOL4 v3;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  id v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  id v19;
  float v20;
  double v21;
  id v22;
  double v23;
  unsigned int v24;
  float v25;
  float filteredBacklightCurrentLI2;
  float v27;
  id v28;
  double v29;
  float v30;
  id v31;
  double v32;
  double v33;

  v3 = a3;
  v5 = -[tm62a6a44d269463582cca62859fbfb389 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v7 = qword_1000A29BC;
  v6 = HIDWORD(qword_1000A29BC);
  v9 = dword_1000A29C4;
  v8 = dword_1000A29C8;
  v11 = dword_1000A29CC;
  v10 = dword_1000A29D0;
  if (v3)
    -[tm62a6a44d269463582cca62859fbfb389 resetVTFilterState](self, "resetVTFilterState");
  v12 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v13 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v14 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v15 = v14;
  *(float *)&v14 = v13;
  objc_msgSend(v12, "calculateControlEffort:trigger:", v14, v15);
  v16 = (double)v5;
  v33 = (double)v7;
  v17 = (double)v6;
  sub_10002E350(47, (int)((double)v5 * 0.56 + -109.0 + (double)v7 * 0.53 + (double)v6 * -0.07));
  v18 = (float)(int)qword_1000A2A68;
  v19 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v20 = v18 / 100.0;
  *(float *)&v21 = v20;
  objc_msgSend(v19, "calculateControlEffort:", v21);
  v22 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v23 = v20;
  objc_msgSend(v22, "calculateControlEffort:", v23);
  v24 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v25 = (double)(int)(v24 * v24) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0.0)
    v25 = filteredBacklightCurrentLI2 + (float)((float)(v25 - filteredBacklightCurrentLI2) * 0.14286);
  self->_filteredBacklightCurrentLI2 = v25;
  sub_10002E350(49, (int)(v17 * -0.69 + -39.0 + (double)v11 * -0.33 + (double)v10 * 2.0 + v25 * 7.2));
  sub_10002E350(48, (int)(v17 * -0.38 + -148.0 + (double)v9 * 0.73 + (double)v8 * -0.42 + (double)v10 * 1.09));
  sub_10002E350(51, (int)((double)v9 * 1.25 + 30.0 + (double)v8 * -0.28));
  v27 = (float)unk_1000A2A70;
  v28 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v29 = v27 / 100.0;
  objc_msgSend(v28, "calculateControlEffort:", v29);
  sub_10002E350(52, (int)(v16 * 1.44 + 91.0 + v33 * -0.16 + v17 * -0.25));
  sub_10002E350(53, (int)(v16 * 1.08 + -152.0 + v17 * -0.28 + (double)v9 * 0.24));
  sub_10002E350(54, (int)(v16 * 1.28 + -183.0 + v33 * -0.31 + v17 * -0.38 + (double)v9 * 0.48));
  sub_10002E350(50, (int)(v16 * 0.52 + -33.0 + (double)v10 * 0.48));
  v30 = (float)(int)qword_1000A2A74;
  v31 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v32 = v30 / 100.0;
  objc_msgSend(v31, "calculateControlEffort:", v32);
}

- (int)computeMaxCGTemp
{
  if ((int)qword_1000A2A6C <= SHIDWORD(qword_1000A2A6C))
    return HIDWORD(qword_1000A2A6C);
  else
    return qword_1000A2A6C;
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
  _QWORD v14[4];
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned __int8 v25;

  v3 = qword_1000A29AC;
  v4 = qword_1000A2A68;
  v5 = qword_1000A2A74;
  v6 = qword_1000A2A7C;
  v8 = HIDWORD(qword_1000A29BC);
  v7 = dword_1000A29C4;
  if ((int)qword_1000A2A7C <= SHIDWORD(qword_1000A2A7C))
    v6 = HIDWORD(qword_1000A2A7C);
  if (v6 <= dword_1000A2A84)
    v9 = dword_1000A2A84;
  else
    v9 = v6;
  v10 = *(uint64_t *)((char *)&qword_1000A2A68 + 4);
  v11 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v12 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v13 = -[CommonProduct getChargerState](self, "getChargerState");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004B6AC;
  v14[3] = &unk_10007D220;
  v15 = v3;
  v16 = v8;
  v17 = v10;
  v18 = v5;
  v19 = v4;
  v20 = v9;
  v21 = v7;
  v22 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 13), "releaseMaxLI");
  v23 = v12;
  v24 = v13;
  v25 = v11;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v14);
}

@end
