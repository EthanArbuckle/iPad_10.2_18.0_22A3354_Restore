@implementation tm099d3b858edfad880b4e38c9b3d8ab11

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm099d3b858edfad880b4e38c9b3d8ab11;
  v3 = -[CommonProduct initProduct:](&v6, "initProduct:", a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "resetVTFilterState");
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = -1;
  self->_filteredTempRearCameraDieWithDefault = -1;
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
  int v15;
  int v16;
  int filteredTempRearCameraDieWithDefault;
  id v18;
  float v19;
  double v20;
  double v21;
  float v22;
  id v23;
  float v24;
  double v25;
  id v26;
  double v27;
  float v28;
  id v29;
  float v30;
  double v31;
  id v32;
  double v33;
  float v34;
  id v35;
  double v36;
  float v37;
  id v38;
  double v39;
  float v40;
  id v41;
  float v42;
  double v43;
  id v44;
  double v45;
  float v46;
  id v47;
  double v48;
  int v49;
  int v50;
  int v51;
  int v52;

  v3 = a3;
  v49 = -[tm099d3b858edfad880b4e38c9b3d8ab11 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v5 = dword_1000A29C4;
  v6 = dword_1000A2A64;
  v50 = HIDWORD(qword_1000A29B4);
  v51 = qword_1000A2A68;
  v52 = unk_1000A2A70;
  v8 = HIDWORD(qword_1000A2A74);
  v7 = qword_1000A2A7C;
  v9 = HIDWORD(qword_1000A2A7C);
  v10 = -[SensorDispatcherHelper getTemperatureFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getTemperatureFromSMCForKey:", CFSTR("TV0s"));
  if ((int)v10 <= -2501)
  {
    v11 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004FD98(v11);
    v10 = 4294967196;
  }
  if (v3)
    -[tm099d3b858edfad880b4e38c9b3d8ab11 resetVTFilterState](self, "resetVTFilterState");
  v12 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v13 = (double)(int)(v12 * v12) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0)
    v13 = (float)filteredBacklightCurrentLI2 + (float)((float)(v13 - (float)filteredBacklightCurrentLI2) * 0.076923);
  self->_filteredBacklightCurrentLI2 = (int)v13;
  if (v8 <= v7)
    v15 = v7;
  else
    v15 = v8;
  if (v15 <= v9)
    v15 = v9;
  v16 = v15 & ~(v15 >> 31);
  filteredTempRearCameraDieWithDefault = self->_filteredTempRearCameraDieWithDefault;
  if ((filteredTempRearCameraDieWithDefault & 0x80000000) == 0)
    v16 = (int)(float)((float)filteredTempRearCameraDieWithDefault
                     + (float)((float)(v16 - filteredTempRearCameraDieWithDefault) * 0.16667));
  self->_filteredTempRearCameraDieWithDefault = v16;
  v18 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v19 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v20 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v21 = v20;
  *(float *)&v20 = v19;
  objc_msgSend(v18, "calculateControlEffort:trigger:", v20, v21);
  sub_10002E350(56, (int)((double)v5 * 0.299+ 6.19+ (double)v6 * 0.686+ (double)self->_filteredTempRearCameraDieWithDefault * -0.0193));
  sub_10002E350(54, (int)((double)v49 * 0.29 + 11.0 + (double)v50 * 0.67));
  sub_10002E350(55, v10);
  sub_10002E350(61, (int)((double)v5 * 0.22+ 284.0+ (double)v6 * 0.2+ (double)v51 * 0.48+ (double)self->_filteredBacklightCurrentLI2 * 1.73));
  sub_10002E350(63, (int)((double)v5 * 0.07 + 214.5 + (double)v51 * 0.893 + (double)(v52 & ~(v52 >> 31)) * 0.0046));
  sub_10002E350(59, (int)((double)v5 * -0.68 + -184.0 + (double)v6 * 1.73));
  sub_10002E350(57, (int)((double)v49 * 0.52 + 16.0 + (double)v50 * 0.45));
  sub_10002E350(58, (int)((double)v49 * 0.37 + 28.0 + (double)v50 * 0.59));
  sub_10002E350(60, (int)((double)self->_filteredBacklightCurrentLI2 * 0.655+ 274.0+ (double)v49 * 0.00135+ (double)v51 * 0.949));
  v22 = (float)(int)qword_1000A2A8C;
  v23 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v24 = v22 / 100.0;
  *(float *)&v25 = v24;
  objc_msgSend(v23, "calculateControlEffort:", v25);
  v26 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v27 = v24;
  objc_msgSend(v26, "calculateControlEffort:", v27);
  v28 = (float)dword_1000A2A9C;
  v29 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  v30 = v28 / 100.0;
  *(float *)&v31 = v30;
  objc_msgSend(v29, "calculateControlEffort:", v31);
  v32 = -[CommonProduct findComponent:](self, "findComponent:", 26);
  *(float *)&v33 = v30;
  objc_msgSend(v32, "calculateControlEffort:", v33);
  v34 = (float)SHIDWORD(qword_1000A2A94);
  v35 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v36 = v34 / 100.0;
  objc_msgSend(v35, "calculateControlEffort:", v36);
  v37 = (float)dword_1000A2AA8;
  v38 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  *(float *)&v39 = v37 / 100.0;
  objc_msgSend(v38, "calculateControlEffort:", v39);
  v40 = (float)SHIDWORD(qword_1000A2A8C);
  v41 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  v42 = v40 / 100.0;
  *(float *)&v43 = v42;
  objc_msgSend(v41, "calculateControlEffort:", v43);
  v44 = -[CommonProduct findComponent:](self, "findComponent:", 25);
  *(float *)&v45 = v42;
  objc_msgSend(v44, "calculateControlEffort:", v45);
  if (-[CommonProduct getChargerState](self, "getChargerState"))
  {
    v46 = (float)dword_1000A2A88;
    v47 = -[CommonProduct findComponent:](self, "findComponent:", 27);
    *(float *)&v48 = v46 / 100.0;
  }
  else
  {
    v47 = -[CommonProduct findComponent:](self, "findComponent:", 27);
    LODWORD(v48) = 30.0;
  }
  objc_msgSend(v47, "calculateControlEffort:", v48);
}

- (id)getGridX
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037148;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_1000A23D8 != -1)
    dispatch_once(&qword_1000A23D8, block);
  return self->gridX;
}

- (id)getGridY
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037204;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_1000A23E0 != -1)
    dispatch_once(&qword_1000A23E0, block);
  return self->gridY;
}

- (int)compute2DGridTemps
{
  int v3;
  double v4;
  double v5;
  double v6;
  int v7;
  int v8;
  int32x2_t v9;
  int v10;
  int32x4_t v11;
  uint64_t v12;
  int32x4_t v13;
  int32x4_t v14;

  v3 = -[tm099d3b858edfad880b4e38c9b3d8ab11 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = (double)dword_1000A2A64;
  v5 = (double)(int)qword_1000A2A68;
  v6 = (double)SHIDWORD(qword_1000A29BC);
  v8 = HIDWORD(qword_1000A29B4);
  v7 = qword_1000A29B4;
  v9 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100061AB0, (float64x2_t)xmmword_100061AA0, (double)dword_1000A2A64), (float64x2_t)xmmword_100061AC0, (double)(int)qword_1000A2A68), (float64x2_t)vdupq_n_s64(0xBFCC28F5C28F5C29), (double)SHIDWORD(qword_1000A29BC))));
  v10 = (int)((double)dword_1000A2A64 * 1.12
            + 89.0
            + (double)(int)qword_1000A2A68 * 0.05
            + (double)SHIDWORD(qword_1000A29BC) * -0.21);
  *(int32x2_t *)self->super.baseVT = v9;
  self->super.baseVT[2] = v10;
  *(int32x2_t *)&self->super.baseVT[3] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100061AE0, (float64x2_t)xmmword_100061AD0, v4), (float64x2_t)vdupq_n_s64(0xBFCD70A3D70A3D71), v6)));
  self->super.baseVT[5] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.76
                              + 148.0
                              + v4 * 0.78
                              + v5 * 0.22
                              + v6 * -0.08);
  self->super.baseVT[6] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.795
                              + 130.5
                              + v4 * 0.815
                              + v5 * 0.185
                              + v6 * -0.08);
  self->super.baseVT[7] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.625
                              + 89.0
                              + v4 * 0.865
                              + v5 * 0.135
                              + v6 * -0.065);
  self->super.baseVT[8] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.546
                              + -11.4
                              + (double)v3 * 0.256
                              + (double)self->_filteredTempRearCameraDieWithDefault * 0.136
                              + v4 * 0.498
                              + v5 * 0.078);
  self->super.baseVT[9] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.25
                              + -45.5
                              + v4 * 1.17
                              + v5 * 0.035
                              + (double)v8 * -0.22);
  self->super.baseVT[10] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.53
                               + 106.0
                               + (double)v3 * 0.14
                               + v4 * 0.45
                               + v5 * 0.3);
  self->super.baseVT[11] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.66
                               + 93.0
                               + (double)v3 * 0.19
                               + v4 * 0.47
                               + v5 * 0.24);
  self->super.baseVT[12] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.11 + 176.0 + v4 * 0.61 + v5 * 0.3);
  self->super.baseVT[13] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.45
                               + 90.0
                               + v6 * 0.06
                               + v4 * 0.63
                               + v5 * 0.23);
  self->super.baseVT[14] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.86
                               + 25.0
                               + (double)v3 * 0.33
                               + v6 * 0.08
                               + v4 * 0.53);
  self->super.baseVT[15] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.8
                               + 132.0
                               + (double)v3 * 0.18
                               + v4 * 0.24
                               + v5 * 0.48);
  self->super.baseVT[16] = (int)((double)self->_filteredBacklightCurrentLI2 * 2.04
                               + 128.0
                               + (double)v3 * 0.24
                               + v4 * 0.23
                               + v5 * 0.42);
  self->super.baseVT[17] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.98
                               + 136.0
                               + (double)v3 * 0.33
                               + v4 * 0.22
                               + v5 * 0.35);
  self->super.baseVT[18] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.9
                               + 134.0
                               + (double)v3 * 0.41
                               + v4 * 0.2
                               + v5 * 0.3);
  self->super.baseVT[19] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.11
                               + 110.0
                               + (double)v3 * 0.42
                               + v4 * 0.26
                               + v5 * 0.23);
  self->super.baseVT[20] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.42
                               + 161.0
                               + (double)v7 * -0.12
                               + v4 * 0.28
                               + v5 * 0.77);
  self->super.baseVT[21] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.63
                               + 133.0
                               + (double)v3 * 0.68
                               + v6 * -0.09
                               + v5 * 0.35);
  self->super.baseVT[22] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.27 + 309.0 + v4 * 0.2 + v5 * 0.7);
  self->super.baseVT[23] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.64
                               + 141.0
                               + (double)v3 * 0.83
                               + v6 * -0.11
                               + v5 * 0.21);
  self->super.baseVT[24] = (int)((double)v3 * 0.64 + 6.0 + v6 * -0.28 + v4 * 0.44 + v5 * 0.18);
  v11 = vdupq_lane_s32(v9, 0);
  v12 = 1;
  v13 = v11;
  do
  {
    v14 = *(int32x4_t *)&self->super.baseVT[v12];
    v11 = vminq_s32(v11, v14);
    v13 = vmaxq_s32(v13, v14);
    v12 += 4;
  }
  while (v12 != 25);
  sub_10002E350(62, (vmaxvq_s32(v13) - vminvq_s32(v11)));
  return self->super.baseVT;
}

- (void)updateCoreAnalyticsInfo
{
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned int v11;
  NSNumber *v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  _QWORD v22[5];
  unsigned int v23;
  int v24;
  __int128 v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned __int8 v38;

  v3 = -[tm099d3b858edfad880b4e38c9b3d8ab11 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = HIDWORD(qword_1000A29AC);
  v21 = qword_1000A29B4;
  v15 = *(uint64_t *)((char *)&qword_1000A2A8C + 4);
  v19 = dword_1000A2A64;
  v20 = HIDWORD(qword_1000A2A94);
  v5 = qword_1000A2A8C;
  v18 = dword_1000A2A88;
  v14 = dword_1000A2AA0;
  v16 = dword_1000A2A9C;
  v17 = dword_1000A2AA4;
  v6 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v7 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v8 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
  v9 = -[CommonProduct getChargerState](self, "getChargerState");
  v10 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v11 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  v12 = (NSNumber *)objc_msgSend(+[_CDClientContext userContext](_CDClientContext, "userContext"), "objectForKeyedSubscript:", +[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  if (!v12)
    v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100037A50;
  v22[3] = &unk_10007D928;
  v23 = v3;
  v24 = v4;
  *(_QWORD *)&v13 = v21;
  *((_QWORD *)&v13 + 1) = v15;
  v25 = v13;
  v26 = v16;
  v27 = v5;
  v28 = v20;
  v29 = v14;
  v30 = v19;
  v31 = v18;
  v32 = v17;
  v33 = v6;
  v34 = v7;
  v35 = v8;
  v38 = v10;
  v36 = v9;
  v37 = v11;
  v22[4] = v12;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v22);
}

@end
