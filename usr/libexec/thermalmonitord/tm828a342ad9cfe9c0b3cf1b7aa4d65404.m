@implementation tm828a342ad9cfe9c0b3cf1b7aa4d65404

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm828a342ad9cfe9c0b3cf1b7aa4d65404;
  v3 = -[CommonProduct initProduct:](&v6, "initProduct:", a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "resetVTFilterState");
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = -1;
  self->_filteredTempRearCameraDie = -1;
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000A29AC;
}

- (int)arcModuleTemperature
{
  return 3000;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  float v12;
  int filteredBacklightCurrentLI2;
  id v14;
  float v15;
  double v16;
  double v17;
  float v18;
  id v19;
  float v20;
  double v21;
  id v22;
  double v23;
  float v24;
  id v25;
  double v26;
  float v27;
  id v28;
  double v29;
  float v30;
  id v31;
  double v32;
  float v33;
  id v34;
  float v35;
  double v36;
  id v37;
  double v38;
  float v39;
  id v40;
  double v41;

  v3 = a3;
  v5 = -[tm828a342ad9cfe9c0b3cf1b7aa4d65404 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v6 = HIDWORD(qword_1000A29AC);
  v7 = qword_1000A29B4;
  v8 = HIDWORD(qword_1000A29B4);
  v9 = -[SensorDispatcherHelper getTemperatureFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getTemperatureFromSMCForKey:", CFSTR("TV0s"));
  if ((int)v9 <= -2501)
  {
    v10 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004FD98(v10);
    v9 = 4294967196;
  }
  if (v3)
    -[tm828a342ad9cfe9c0b3cf1b7aa4d65404 resetVTFilterState](self, "resetVTFilterState");
  v11 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v12 = (double)(int)(v11 * v11) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0)
    v12 = (float)filteredBacklightCurrentLI2 + (float)((float)(v12 - (float)filteredBacklightCurrentLI2) * 0.33333);
  self->_filteredBacklightCurrentLI2 = (int)v12;
  v14 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v15 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v16 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v17 = v16;
  *(float *)&v16 = v15;
  objc_msgSend(v14, "calculateControlEffort:trigger:", v16, v17);
  sub_10002E350(46, (int)((double)v7 * 0.55 + -33.0 + (double)v8 * 0.11));
  sub_10002E350(44, (int)((double)v7 * 0.57 + -30.0 + (double)v8 * 0.09));
  sub_10002E350(50, (int)((double)v6 * 0.11 + -54.0 + (double)v8 * 0.24));
  sub_10002E350(51, (int)((double)v5 * 1.27 + -108.08 + (double)v7 * -0.23));
  sub_10002E350(48, (int)((double)v5 * -0.79 + 199.0 + (double)v7 * 0.6));
  sub_10002E350(47, (int)((double)v7 * 0.26 + -87.0 + (double)v8 * 0.51));
  sub_10002E350(49, (int)((double)v6 * -0.02 + 61.0 + (double)self->_filteredBacklightCurrentLI2 * 7.56));
  sub_10002E350(45, v9);
  v18 = (float)dword_1000A2A64;
  v19 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v20 = v18 / 100.0;
  *(float *)&v21 = v20;
  objc_msgSend(v19, "calculateControlEffort:", v21);
  v22 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v23 = v20;
  objc_msgSend(v22, "calculateControlEffort:", v23);
  v24 = (float)unk_1000A2A70;
  v25 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v26 = v24 / 100.0;
  objc_msgSend(v25, "calculateControlEffort:", v26);
  v27 = (float)SHIDWORD(qword_1000A2A68);
  v28 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v29 = v27 / 100.0;
  objc_msgSend(v28, "calculateControlEffort:", v29);
  v30 = (float)SHIDWORD(qword_1000A2A74);
  v31 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  *(float *)&v32 = v30 / 100.0;
  objc_msgSend(v31, "calculateControlEffort:", v32);
  v33 = (float)(int)qword_1000A2A68;
  v34 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  v35 = v33 / 100.0;
  *(float *)&v36 = v35;
  objc_msgSend(v34, "calculateControlEffort:", v36);
  v37 = -[CommonProduct findComponent:](self, "findComponent:", 25);
  *(float *)&v38 = v35;
  objc_msgSend(v37, "calculateControlEffort:", v38);
  if (-[CommonProduct getChargerState](self, "getChargerState"))
  {
    v39 = (float)dword_1000A2A60;
    v40 = -[CommonProduct findComponent:](self, "findComponent:", 26);
    *(float *)&v41 = v39 / 100.0;
  }
  else
  {
    v40 = -[CommonProduct findComponent:](self, "findComponent:", 26);
    LODWORD(v41) = 30.0;
  }
  objc_msgSend(v40, "calculateControlEffort:", v41);
}

- (int)computeMaxCGTemp
{
  if ((int)qword_1000A2A74 <= SHIDWORD(qword_1000A2A6C))
    return HIDWORD(qword_1000A2A6C);
  else
    return qword_1000A2A74;
}

- (void)updateCoreAnalyticsInfo
{
  unsigned int v3;
  int v4;
  int v5;
  uint64_t v6;
  int32x2_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  _QWORD v11[4];
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int32x2_t v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned __int8 v21;

  v3 = -[tm828a342ad9cfe9c0b3cf1b7aa4d65404 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = dword_1000A2A64;
  v5 = qword_1000A2A74;
  v6 = *(uint64_t *)((char *)&qword_1000A29AC + 4);
  v7 = (int32x2_t)qword_1000A2A68;
  v8 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v9 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v10 = -[CommonProduct getChargerState](self, "getChargerState");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002CD50;
  v11[3] = &unk_10007D220;
  v12 = v3;
  v13 = v6;
  v14 = v8;
  v15 = v9;
  v16 = vrev64_s32(v7);
  v17 = v5;
  v18 = v4;
  v21 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v19 = v10;
  v20 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v11);
}

@end
