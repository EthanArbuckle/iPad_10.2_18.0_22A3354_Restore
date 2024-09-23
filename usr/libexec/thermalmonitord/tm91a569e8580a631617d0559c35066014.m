@implementation tm91a569e8580a631617d0559c35066014

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm91a569e8580a631617d0559c35066014;
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

  if (a3)
    -[tm91a569e8580a631617d0559c35066014 resetVTFilterState](self, "resetVTFilterState");
  v4 = qword_1000A29AC;
  v5 = HIDWORD(qword_1000A29B4);
  v6 = HIDWORD(qword_1000A29BC);
  v7 = dword_1000A29C4;
  v8 = dword_1000A29C8;
  v9 = dword_1000A29CC;
  v10 = dword_1000A29D0;
  v11 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v12 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v13 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v14 = v13;
  *(float *)&v13 = v12;
  objc_msgSend(v11, "calculateControlEffort:trigger:", v13, v14);
  v15 = (double)v4;
  sub_10002E350(55, (int)((double)v4 * 0.71 + 110.45 + (double)v9 * 0.35));
  v16 = (float)dword_1000A2A88;
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
    v23 = filteredBacklightCurrentLI2 + (float)((float)(v23 - filteredBacklightCurrentLI2) * 0.125);
  self->_filteredBacklightCurrentLI2 = v23;
  sub_10002E350(57, (int)((double)v10 * 0.91 + 396.03 + v23 * 7.41));
  sub_10002E350(56, (int)(v15 * 0.6 + -161.14 + (double)v7 * 0.35 + (double)v9 * 0.1));
  sub_10002E350(59, (int)(v15 * 0.63 + 168.86 + (double)v10 * 0.3));
  v25 = (float)SHIDWORD(qword_1000A2A8C);
  v26 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v27 = v25 / 100.0;
  objc_msgSend(v26, "calculateControlEffort:", v27);
  sub_10002E350(60, (int)((double)v6 * 0.74 + 26.19 + (double)v7 * 0.25));
  sub_10002E350(58, (int)((double)v5 * 0.8 + 35.11 + (double)v8 * 0.2));
  v28 = (float)(int)qword_1000A2A94;
  v29 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v30 = v28 / 100.0;
  objc_msgSend(v29, "calculateControlEffort:", v30);
}

- (int)computeMaxCGTemp
{
  if ((int)qword_1000A2A8C <= SHIDWORD(qword_1000A2A8C))
    return HIDWORD(qword_1000A2A8C);
  else
    return qword_1000A2A8C;
}

- (void)updateCoreAnalyticsInfo
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int32x2_t v7;
  unsigned __int8 v8;
  unsigned int v9;
  unsigned int v10;
  _QWORD v11[5];
  int v12;
  int32x2_t v13;
  int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned __int8 v20;

  v3 = HIDWORD(qword_1000A2A8C);
  v4 = dword_1000A2A9C;
  v5 = dword_1000A29C4;
  v6 = *(_QWORD *)&dword_1000A2A88;
  v7 = (int32x2_t)qword_1000A2A94;
  v8 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v9 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v10 = -[CommonProduct getChargerState](self, "getChargerState");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001E71C;
  v11[3] = &unk_10007D220;
  v11[4] = v6;
  v12 = v3;
  v13 = vrev64_s32(v7);
  v14 = v4;
  v15 = v5;
  v16 = v9;
  v17 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v20 = v8;
  v18 = v10;
  v19 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v11);
}

@end
