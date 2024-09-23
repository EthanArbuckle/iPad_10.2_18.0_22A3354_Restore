@implementation tmab4b5a2f057efd0a64835b9c4226bf18

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tmab4b5a2f057efd0a64835b9c4226bf18;
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

  if (a3)
    -[tmab4b5a2f057efd0a64835b9c4226bf18 resetVTFilterState](self, "resetVTFilterState");
  v4 = qword_1000A29AC;
  v6 = qword_1000A29B4;
  v5 = HIDWORD(qword_1000A29B4);
  v7 = qword_1000A29BC;
  v8 = HIDWORD(qword_1000A29BC);
  v9 = dword_1000A29C4;
  v10 = dword_1000A29C8;
  v11 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v12 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v13 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v14 = v13;
  *(float *)&v13 = v12;
  objc_msgSend(v11, "calculateControlEffort:trigger:", v13, v14);
  v15 = (double)v6;
  v16 = (double)v10;
  sub_10002E350(53, (int)((double)v6 * 0.32 + -61.0 + (double)v8 * 0.37 + (double)v10 * 0.29));
  v17 = (float)SHIDWORD(qword_1000A2A7C);
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
    v24 = filteredBacklightCurrentLI2 + (float)((float)(v24 - filteredBacklightCurrentLI2) * 0.076923);
  self->_filteredBacklightCurrentLI2 = v24;
  sub_10002E350(55, (int)((double)v4 * 1.22 + 3.0 + (double)v9 * -0.09 + v16 * -0.1 + v24 * 5.78));
  sub_10002E350(54, (int)((double)v4 * 0.42 + -49.0 + (double)v7 * 0.43 + v16 * 0.15));
  sub_10002E350(57, (int)((double)v5 * -0.3 + 119.0 + (double)v7 * 1.31 + v16 * -0.05));
  v26 = (float)dword_1000A2A88;
  v27 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v28 = v26 / 100.0;
  objc_msgSend(v27, "calculateControlEffort:", v28);
  sub_10002E350(58, (int)(v15 * 0.87 + -29.0 + (double)v5 * -0.28 + (double)v8 * 0.39));
  sub_10002E350(56, (int)(v15 * 1.21 + 16.0 + (double)v7 * -0.38 + v16 * 0.14));
  v29 = (float)(int)qword_1000A2A8C;
  v30 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v31 = v29 / 100.0;
  objc_msgSend(v30, "calculateControlEffort:", v31);
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
  v5 = HIDWORD(qword_1000A29BC);
  v6 = *(uint64_t *)((char *)&qword_1000A2A7C + 4);
  v7 = (int32x2_t)qword_1000A2A8C;
  v8 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v9 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v10 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v11 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
  LODWORD(self) = -[CommonProduct getChargerState](self, "getChargerState");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100022130;
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
