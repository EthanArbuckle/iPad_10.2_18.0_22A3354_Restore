@implementation tm57b622634d75d34f6315daf54954a970

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm57b622634d75d34f6315daf54954a970;
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
  id v10;
  float v11;
  double v12;
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
    -[tm57b622634d75d34f6315daf54954a970 resetVTFilterState](self, "resetVTFilterState");
  v4 = qword_1000A29AC;
  v5 = qword_1000A29B4;
  v7 = HIDWORD(qword_1000A29BC);
  v6 = dword_1000A29C4;
  v9 = dword_1000A29C8;
  v8 = dword_1000A29CC;
  v10 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v11 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v12 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v13 = v12;
  *(float *)&v12 = v11;
  objc_msgSend(v10, "calculateControlEffort:trigger:", v12, v13);
  v14 = (double)v5;
  v15 = (double)v7;
  sub_10002E350(53, (int)((double)v5 * 0.4 + -126.0 + (double)v7 * 0.22 + (double)v9 * 0.39));
  v16 = (float)SHIDWORD(qword_1000A2A7C);
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
  sub_10002E350(55, (int)((double)v4 * 0.89 + 181.0 + (double)v6 * -0.29 + (double)v8 * 0.42 + v23 * 8.64));
  sub_10002E350(54, (int)((double)v4 * 0.55 + -9.0 + v15 * 0.26 + (double)v9 * 0.22));
  sub_10002E350(57, (int)((double)v4 * 0.81 + 54.0 + v15 * 0.32 + (double)v6 * -0.13));
  v25 = (float)dword_1000A2A88;
  v26 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v27 = v25 / 100.0;
  objc_msgSend(v26, "calculateControlEffort:", v27);
  sub_10002E350(58, (int)((double)v4 * 0.4 + -38.0 + v14 * 0.46 + (double)v6 * 0.15));
  sub_10002E350(56, (int)(v14 * 1.1 + -75.0 + v15 * -0.25 + (double)v6 * 0.15));
  v28 = (float)(int)qword_1000A2A8C;
  v29 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v30 = v28 / 100.0;
  objc_msgSend(v29, "calculateControlEffort:", v30);
}

- (int)computeMaxCGTemp
{
  if (dword_1000A2A84 <= dword_1000A2A88)
    return dword_1000A2A88;
  else
    return dword_1000A2A84;
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
  unsigned int v11;
  _QWORD v12[5];
  int v13;
  int32x2_t v14;
  int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned __int8 v22;

  v3 = dword_1000A2A88;
  v4 = qword_1000A2A94;
  v5 = dword_1000A29CC;
  v6 = *(uint64_t *)((char *)&qword_1000A2A7C + 4);
  v7 = (int32x2_t)qword_1000A2A8C;
  v8 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v9 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v10 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v11 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
  LODWORD(self) = -[CommonProduct getChargerState](self, "getChargerState");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100022ED0;
  v12[3] = &unk_10007D0C0;
  v12[4] = v6;
  v13 = v3;
  v14 = vrev64_s32(v7);
  v15 = v4;
  v16 = v5;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = sub_100008F14();
  v21 = (int)self;
  v22 = v8;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v12);
}

@end
