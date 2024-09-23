@implementation tm79a186acb73b90c8968af9e764432e15

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm79a186acb73b90c8968af9e764432e15;
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
  return dword_1000A28AC[0];
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  _BOOL4 v3;
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
  float v15;
  id v16;
  float v17;
  double v18;
  id v19;
  double v20;
  unsigned int v21;
  float filteredBacklightCurrentLI2;
  float v23;
  float v24;
  id v25;
  double v26;

  v3 = a3;
  v5 = -[tm79a186acb73b90c8968af9e764432e15 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v6 = HIDWORD(qword_1000A28B4);
  v8 = dword_1000A28C0;
  v7 = qword_1000A28C4;
  v9 = xmmword_1000A28CC;
  if (v3)
    -[tm79a186acb73b90c8968af9e764432e15 resetVTFilterState](self, "resetVTFilterState");
  v10 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v11 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v12 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v13 = v12;
  *(float *)&v12 = v11;
  objc_msgSend(v10, "calculateControlEffort:trigger:", v12, v13);
  v14 = (double)v5;
  sub_10002E350(47, (int)((double)v5 * 0.7 + -70.0 + (double)v6 * 0.24 + (double)v8 * 0.09));
  v15 = (float)(int)qword_1000A2A68;
  v16 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v17 = v15 / 100.0;
  *(float *)&v18 = v17;
  objc_msgSend(v16, "calculateControlEffort:", v18);
  v19 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v20 = v17;
  objc_msgSend(v19, "calculateControlEffort:", v20);
  v21 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  v23 = (double)(int)(v21 * v21) / 100.0;
  if (filteredBacklightCurrentLI2 >= 0.0)
    v23 = filteredBacklightCurrentLI2 + (float)((float)(v23 - filteredBacklightCurrentLI2) * 0.14286);
  self->_filteredBacklightCurrentLI2 = v23;
  sub_10002E350(49, (int)(v14 * 1.64 + 210.0 + (double)v6 * -0.42 + (double)v9 * -0.27));
  sub_10002E350(48, (int)(v14 * 1.34 + 83.0 + (double)v7 * -0.22 + (double)v9 * -0.18));
  sub_10002E350(50, (int)(v14 + 60.0));
  v24 = (float)(int)qword_1000A2A74;
  v25 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v26 = v24 / 100.0;
  objc_msgSend(v25, "calculateControlEffort:", v26);
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
  unsigned int v5;
  unsigned int v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _QWORD v21[4];
  int v22;
  int v23;
  __int128 v24;
  __int128 v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned __int8 v36;

  v3 = qword_1000A29AC;
  v4 = qword_1000A28B4;
  v14 = qword_1000A28C4;
  v15 = *(uint64_t *)((char *)&qword_1000A28B4 + 4);
  v18 = qword_1000A2A68;
  v19 = xmmword_1000A28CC;
  v20 = qword_1000A2A74;
  v17 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v5 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v16 = sub_100008F14();
  v6 = -[CommonProduct getChargerState](self, "getChargerState");
  v7 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v8 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  v9 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 13), "releaseMaxLI");
  v10 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 12), "releaseMaxLI");
  v11 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "releaseMaxLI");
  v12 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000368A8;
  v21[3] = &unk_10007CFB0;
  v22 = v3;
  v23 = v4;
  *(_QWORD *)&v13 = v15;
  *((_QWORD *)&v13 + 1) = v14;
  v24 = v13;
  *(_QWORD *)&v13 = v19;
  *((_QWORD *)&v13 + 1) = v18;
  v25 = v13;
  v26 = v20;
  v27 = v17;
  v28 = v5;
  v29 = v9;
  v30 = v10;
  v31 = v11;
  v36 = v7;
  v32 = v8;
  v33 = v16;
  v34 = v6;
  v35 = v12;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v21);
}

@end
