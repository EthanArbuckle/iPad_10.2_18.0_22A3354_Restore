@implementation tmb16d8e8edc0f89afd1f7fe25529ab7fa

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tmb16d8e8edc0f89afd1f7fe25529ab7fa;
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
  return dword_1000A2A64;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  int filteredTempRearCameraDie;
  unsigned int v14;
  float v15;
  int filteredBacklightCurrentLI2;
  id v17;
  float v18;
  double v19;
  double v20;
  float v21;
  id v22;
  float v23;
  double v24;
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
  double v35;
  float v36;
  id v37;
  float v38;
  double v39;
  id v40;
  double v41;
  float v42;
  id v43;
  double v44;
  int v45;

  v3 = a3;
  v45 = -[tmb16d8e8edc0f89afd1f7fe25529ab7fa gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v6 = HIDWORD(qword_1000A29AC);
  v5 = qword_1000A29B4;
  v7 = HIDWORD(qword_1000A29B4);
  v8 = dword_1000A2A5C;
  v9 = HIDWORD(qword_1000A2A68);
  v10 = -[SensorDispatcherHelper getTemperatureFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getTemperatureFromSMCForKey:", CFSTR("TV0s"));
  if ((int)v10 <= -2501)
  {
    v11 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004FD98(v11);
    v10 = 4294967196;
  }
  if (v3)
    -[tmb16d8e8edc0f89afd1f7fe25529ab7fa resetVTFilterState](self, "resetVTFilterState");
  v12 = v9 & ~(v9 >> 31);
  filteredTempRearCameraDie = self->_filteredTempRearCameraDie;
  if ((filteredTempRearCameraDie & 0x80000000) == 0)
    v12 = (int)(float)((float)filteredTempRearCameraDie + (float)((float)(v12 - filteredTempRearCameraDie) * 0.25));
  self->_filteredTempRearCameraDie = v12;
  v14 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v15 = (double)(int)(v14 * v14) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0)
    v15 = (float)filteredBacklightCurrentLI2 + (float)((float)(v15 - (float)filteredBacklightCurrentLI2) * 0.33333);
  self->_filteredBacklightCurrentLI2 = (int)v15;
  v17 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v18 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v19 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v20 = v19;
  *(float *)&v19 = v18;
  objc_msgSend(v17, "calculateControlEffort:trigger:", v19, v20);
  sub_10002E350(51, (int)((double)v5 * 0.55 + -33.0 + (double)v7 * 0.11 + (double)v8 * 0.33));
  sub_10002E350(49, (int)((double)v5 * 0.57 + -30.0 + (double)v7 * 0.09 + (double)v8 * 0.33));
  sub_10002E350(55, (int)((double)v6 * 0.11 + -54.0 + (double)v7 * 0.24 + (double)v8 * 0.63));
  sub_10002E350(56, (int)((double)v45 * 1.27 + -108.08 + (double)v5 * -0.23));
  sub_10002E350(53, (int)((double)v45 * -0.79+ 199.0+ (double)v5 * 0.6+ (double)v8 * 1.14+ (double)self->_filteredTempRearCameraDie * 0.06));
  sub_10002E350(52, (int)((double)v5 * 0.26 + -87.0 + (double)v7 * 0.51 + (double)v8 * 0.23));
  sub_10002E350(54, (int)((double)v6 * -0.02 + 61.0 + (double)v8 * 1.03 + (double)self->_filteredBacklightCurrentLI2* 7.56));
  sub_10002E350(50, v10);
  v21 = (float)SHIDWORD(qword_1000A2A74);
  v22 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v23 = v21 / 100.0;
  *(float *)&v24 = v23;
  objc_msgSend(v22, "calculateControlEffort:", v24);
  v25 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v26 = v23;
  objc_msgSend(v25, "calculateControlEffort:", v26);
  v27 = (float)dword_1000A2A84;
  v28 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v29 = v27 / 100.0;
  objc_msgSend(v28, "calculateControlEffort:", v29);
  v30 = (float)SHIDWORD(qword_1000A2A7C);
  v31 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v32 = v30 / 100.0;
  objc_msgSend(v31, "calculateControlEffort:", v32);
  v33 = (float)(int)qword_1000A2A8C;
  v34 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  *(float *)&v35 = v33 / 100.0;
  objc_msgSend(v34, "calculateControlEffort:", v35);
  v36 = (float)(int)qword_1000A2A7C;
  v37 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  v38 = v36 / 100.0;
  *(float *)&v39 = v38;
  objc_msgSend(v37, "calculateControlEffort:", v39);
  v40 = -[CommonProduct findComponent:](self, "findComponent:", 25);
  *(float *)&v41 = v38;
  objc_msgSend(v40, "calculateControlEffort:", v41);
  if (-[CommonProduct getChargerState](self, "getChargerState"))
  {
    v42 = (float)(int)qword_1000A2A74;
    v43 = -[CommonProduct findComponent:](self, "findComponent:", 26);
    *(float *)&v44 = v42 / 100.0;
  }
  else
  {
    v43 = -[CommonProduct findComponent:](self, "findComponent:", 26);
    LODWORD(v44) = 30.0;
  }
  objc_msgSend(v43, "calculateControlEffort:", v44);
}

- (int)computeMaxCGTemp
{
  if (dword_1000A2A88 <= dword_1000A2A84)
    return dword_1000A2A84;
  else
    return dword_1000A2A88;
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

  v3 = -[tmb16d8e8edc0f89afd1f7fe25529ab7fa gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = HIDWORD(qword_1000A2A74);
  v5 = dword_1000A2A88;
  v6 = *(uint64_t *)((char *)&qword_1000A29AC + 4);
  v7 = (int32x2_t)qword_1000A2A7C;
  v8 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v9 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v10 = -[CommonProduct getChargerState](self, "getChargerState");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001C2F4;
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
