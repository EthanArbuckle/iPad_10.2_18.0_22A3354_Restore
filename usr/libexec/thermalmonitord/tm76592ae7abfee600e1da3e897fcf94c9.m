@implementation tm76592ae7abfee600e1da3e897fcf94c9

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm76592ae7abfee600e1da3e897fcf94c9;
  v3 = -[CommonProduct initProduct:](&v6, "initProduct:", a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "resetVTFilterState");
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = -1;
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000A29AC;
}

- (int)arcModuleTemperature
{
  return HIDWORD(qword_1000A2A6C);
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
  unsigned int v12;
  float v13;
  int filteredBacklightCurrentLI2;
  id v15;
  float v16;
  double v17;
  double v18;
  float v19;
  id v20;
  float v21;
  double v22;
  id v23;
  double v24;
  float v25;
  id v26;
  double v27;
  float v28;
  id v29;
  double v30;
  float v31;
  id v32;
  double v33;
  float v34;
  id v35;
  float v36;
  double v37;
  id v38;
  double v39;
  int v40;
  int v41;

  v3 = a3;
  v6 = qword_1000A29B4;
  v5 = HIDWORD(qword_1000A29B4);
  v7 = HIDWORD(qword_1000A29BC);
  v40 = dword_1000A29C4;
  v41 = qword_1000A29BC;
  v8 = dword_1000A2A64;
  v9 = qword_1000A2A68;
  v10 = -[SensorDispatcherHelper getTemperatureFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getTemperatureFromSMCForKey:", CFSTR("TV0s"));
  if ((int)v10 <= -2501)
  {
    v11 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004FD98(v11);
    v10 = 4294967196;
  }
  if (v3)
    -[tm76592ae7abfee600e1da3e897fcf94c9 resetVTFilterState](self, "resetVTFilterState");
  v12 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v13 = (double)(int)(v12 * v12) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0)
    v13 = (float)filteredBacklightCurrentLI2 + (float)((float)(v13 - (float)filteredBacklightCurrentLI2) * 0.076923);
  self->_filteredBacklightCurrentLI2 = (int)v13;
  v15 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v16 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v17 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v18 = v17;
  *(float *)&v17 = v16;
  objc_msgSend(v15, "calculateControlEffort:trigger:", v17, v18);
  sub_10002E350(54, (int)((double)v6 * 0.48 + 110.0 + (double)v5 * 0.45));
  sub_10002E350(53, (int)((double)v6 * 0.36 + 157.0 + (double)v5 * 0.57));
  sub_10002E350(59, (int)((double)v6 * 0.65+ 78.0+ (double)v7 * -0.13+ (double)v9 * 0.44+ (double)self->_filteredBacklightCurrentLI2 * -1.99));
  sub_10002E350(55, (int)((double)v6 * 0.67 + 262.0 + (double)v5 * 0.23));
  sub_10002E350(56, (int)((double)v6 * 0.867 + -108.0 + (double)v8 * 0.0532 + (double)v9 * 0.0811));
  sub_10002E350(58, (int)((double)v6 * 0.6+ 107.0+ (double)v7 * -0.26+ (double)v9 * 0.63+ (double)self->_filteredBacklightCurrentLI2 * 4.67));
  sub_10002E350(57, (int)((double)v5 * 1.29 + -99.0 + (double)v7 * -0.65 + (double)v40 * -0.14 + (double)v8 * 0.49));
  sub_10002E350(60, (int)((double)v6 * 1.23 + -12.7 - (double)v41 + (double)v40 * 0.372 + (double)v9 * 0.374));
  sub_10002E350(61, v10);
  v19 = (float)dword_1000A2A84;
  v20 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v21 = v19 / 100.0;
  *(float *)&v22 = v21;
  objc_msgSend(v20, "calculateControlEffort:", v22);
  v23 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v24 = v21;
  objc_msgSend(v23, "calculateControlEffort:", v24);
  v25 = (float)(int)qword_1000A2A94;
  v26 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v27 = v25 / 100.0;
  objc_msgSend(v26, "calculateControlEffort:", v27);
  v28 = (float)SHIDWORD(qword_1000A2A8C);
  v29 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v30 = v28 / 100.0;
  objc_msgSend(v29, "calculateControlEffort:", v30);
  v31 = (float)dword_1000A2A9C;
  v32 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  *(float *)&v33 = v31 / 100.0;
  objc_msgSend(v32, "calculateControlEffort:", v33);
  v34 = (float)dword_1000A2A88;
  v35 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  v36 = v34 / 100.0;
  *(float *)&v37 = v36;
  objc_msgSend(v35, "calculateControlEffort:", v37);
  v38 = -[CommonProduct findComponent:](self, "findComponent:", 25);
  *(float *)&v39 = v36;
  objc_msgSend(v38, "calculateControlEffort:", v39);
}

- (int)computeMaxCGTemp
{
  if (SHIDWORD(qword_1000A2A94) <= (int)qword_1000A2A94)
    return qword_1000A2A94;
  else
    return HIDWORD(qword_1000A2A94);
}

- (void)updateCoreAnalyticsInfo
{
  unsigned int v3;
  int v4;
  int32x2_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned __int8 v11;
  unsigned int v12;
  NSNumber *v13;
  __int128 v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  _QWORD v20[5];
  unsigned int v21;
  int v22;
  __int128 v23;
  int v24;
  int32x2_t v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned __int8 v34;

  v3 = -[tm76592ae7abfee600e1da3e897fcf94c9 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = HIDWORD(qword_1000A29AC);
  v17 = qword_1000A29B4;
  v15 = *(_QWORD *)&dword_1000A2A88;
  v16 = dword_1000A2A84;
  v5 = *(int32x2_t *)((char *)&qword_1000A2A8C + 4);
  v18 = HIDWORD(qword_1000A2A94);
  v19 = dword_1000A2AA0;
  v6 = dword_1000A2A64;
  v7 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v8 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v9 = -[CommonProduct getChargerState](self, "getChargerState");
  v10 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
  v11 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v12 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  v13 = (NSNumber *)objc_msgSend(+[_CDClientContext userContext](_CDClientContext, "userContext"), "objectForKeyedSubscript:", +[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  if (!v13)
    v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002D920;
  v20[3] = &unk_10007DF08;
  v21 = v3;
  v22 = v4;
  *(_QWORD *)&v14 = v17;
  *((_QWORD *)&v14 + 1) = v15;
  v23 = v14;
  v24 = v16;
  v25 = vrev64_s32(v5);
  v26 = v18;
  v27 = v6;
  v28 = v19;
  v29 = v7;
  v30 = v8;
  v31 = v10;
  v34 = v11;
  v32 = v9;
  v33 = v12;
  v20[4] = v13;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v20);
}

@end
