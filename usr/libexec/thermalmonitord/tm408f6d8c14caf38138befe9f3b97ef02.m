@implementation tm408f6d8c14caf38138befe9f3b97ef02

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm408f6d8c14caf38138befe9f3b97ef02;
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
  float v15;
  id v16;
  float v17;
  double v18;
  id v19;
  double v20;
  unsigned int v21;
  float v22;
  float filteredBacklightCurrentLI2;
  float v24;
  id v25;
  double v26;
  float v27;
  id v28;
  double v29;
  int v30;

  if (a3)
    -[tm408f6d8c14caf38138befe9f3b97ef02 resetVTFilterState](self, "resetVTFilterState");
  v5 = qword_1000A29AC;
  v4 = HIDWORD(qword_1000A29AC);
  v6 = HIDWORD(qword_1000A29B4);
  v7 = qword_1000A29BC;
  v8 = HIDWORD(qword_1000A29BC);
  v30 = dword_1000A29C4;
  v9 = dword_1000A29CC;
  v10 = dword_1000A29D0;
  v11 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v12 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v13 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v14 = v13;
  *(float *)&v13 = v12;
  objc_msgSend(v11, "calculateControlEffort:trigger:", v13, v14);
  sub_10002E350(55, (int)((double)v5 * 0.194 + -184.5 + (double)v8 * 0.341 + (double)v9 * 0.516));
  v15 = (float)dword_1000A2A88;
  v16 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v17 = v15 / 100.0;
  *(float *)&v18 = v17;
  objc_msgSend(v16, "calculateControlEffort:", v18);
  v19 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v20 = v17;
  objc_msgSend(v19, "calculateControlEffort:", v20);
  v21 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v22 = (double)(int)(v21 * v21) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0.0)
    v22 = filteredBacklightCurrentLI2 + (float)((float)(v22 - filteredBacklightCurrentLI2) * 0.076923);
  self->_filteredBacklightCurrentLI2 = v22;
  sub_10002E350(57, (int)((double)v4 * 0.37 + 113.9 + (double)v10 * 0.58 + v22 * 4.99));
  sub_10002E350(56, (int)((double)v4 * 0.39 + -103.38 + (double)v7 * 0.4 + (double)v9 * 0.19));
  sub_10002E350(59, (int)((double)v4 * 0.12 + -10.06 + (double)v10 * 0.83));
  v24 = (float)SHIDWORD(qword_1000A2A8C);
  v25 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v26 = v24 / 100.0;
  objc_msgSend(v25, "calculateControlEffort:", v26);
  sub_10002E350(60, (int)((double)v6 * 0.59 + 91.72 + (double)v7 * 0.35));
  sub_10002E350(58, (int)((double)v6 * 0.75 + -39.61 + (double)v30 * 0.25));
  v27 = (float)(int)qword_1000A2A94;
  v28 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v29 = v27 / 100.0;
  objc_msgSend(v28, "calculateControlEffort:", v29);
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
  v11[2] = sub_10001132C;
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
