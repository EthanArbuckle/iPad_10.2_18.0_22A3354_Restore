@implementation tm48f05d1771cf4a49db2ccd3808afb48c

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm48f05d1771cf4a49db2ccd3808afb48c;
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
  int filteredBacklightCurrentLI2;
  float v14;
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

  v3 = a3;
  v5 = -[tm48f05d1771cf4a49db2ccd3808afb48c gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v6 = HIDWORD(qword_1000A29B4);
  v49 = dword_1000A29C4;
  v7 = dword_1000A2A64;
  v50 = qword_1000A2A68;
  v51 = qword_1000A29B4;
  v8 = HIDWORD(qword_1000A2A74);
  v9 = qword_1000A2A7C;
  v10 = -[SensorDispatcherHelper getTemperatureFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getTemperatureFromSMCForKey:", CFSTR("TV0s"));
  if ((int)v10 <= -2501)
  {
    v11 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004FD98(v11);
    v10 = 4294967196;
  }
  if (v3)
    -[tm48f05d1771cf4a49db2ccd3808afb48c resetVTFilterState](self, "resetVTFilterState");
  v12 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  v14 = (double)(int)(v12 * v12) / 100.0;
  if (filteredBacklightCurrentLI2 >= 0)
    v14 = (float)filteredBacklightCurrentLI2 + (float)((float)(v14 - (float)filteredBacklightCurrentLI2) * 0.14286);
  self->_filteredBacklightCurrentLI2 = (int)v14;
  if (v8 <= v9)
    v15 = v9;
  else
    v15 = v8;
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
  sub_10002E350(56, (int)((double)v6 * 0.2962+ 35.0+ (double)v7 * 0.6829+ (double)self->_filteredTempRearCameraDieWithDefault * -0.005));
  sub_10002E350(54, (int)((double)v5 * 0.102 + 100.0 + (double)v49 * 0.513 + (double)v7 * 0.35));
  sub_10002E350(55, v10);
  sub_10002E350(61, (int)((double)self->_filteredBacklightCurrentLI2 * 0.366+ 129.7+ (double)v7 * 0.589+ (double)v50 * 0.338));
  sub_10002E350(60, (int)((double)self->_filteredBacklightCurrentLI2 * 5.5+ 120.0+ (double)v5 * -0.175+ (double)v7 * 0.16+ (double)v50 * 0.927));
  sub_10002E350(57, (int)((double)v5 * 0.19 + 300.0 + (double)v6 * 0.68));
  sub_10002E350(58, (int)((double)v5 * 0.59 + 33.0 + (double)v49 * 0.41));
  sub_10002E350(59, (int)((double)self->_filteredBacklightCurrentLI2 * 0.437+ 152.3+ (double)v6 * -0.493+ (double)v7 * 1.479+ (double)self->_filteredTempRearCameraDieWithDefault * 0.0223));
  sub_10002E350(63, (int)((double)v5 * -0.132 + 130.0 + (double)v51 * 0.089 + (double)v50 * 1.021));
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
  block[2] = sub_10001D7C8;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_1000A1D20 != -1)
    dispatch_once(&qword_1000A1D20, block);
  return self->gridX;
}

- (id)getGridY
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D884;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_1000A1D28 != -1)
    dispatch_once(&qword_1000A1D28, block);
  return self->gridY;
}

- (int)compute2DGridTemps
{
  int v3;
  int v4;
  int v5;
  int v6;
  double v7;
  double v8;
  double v9;
  int32x2_t v10;
  int32x4_t v11;
  uint64_t v12;
  int32x4_t v13;
  int32x4_t v14;

  v3 = -[tm48f05d1771cf4a49db2ccd3808afb48c gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v5 = HIDWORD(qword_1000A29B4);
  v4 = qword_1000A29B4;
  v6 = dword_1000A29C4;
  v7 = (double)SHIDWORD(qword_1000A29BC);
  v8 = (double)dword_1000A2A64;
  v9 = (double)(int)qword_1000A2A68;
  v10 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100061210, (float64x2_t)xmmword_100061200, (double)SHIDWORD(qword_1000A29BC)), (float64x2_t)xmmword_100061220, (double)dword_1000A2A64), (float64x2_t)xmmword_100061230, (double)(int)qword_1000A2A68)));
  *(int32x2_t *)self->super.baseVT = v10;
  self->super.baseVT[2] = (int)(v7 * -0.205 + 12.2 + v8 * 1.06 + v9 * 0.106);
  *(int32x2_t *)&self->super.baseVT[3] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100061250, (float64x2_t)xmmword_100061240, v7), (float64x2_t)xmmword_100061260, v8)));
  self->super.baseVT[5] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.236
                              + 135.4
                              + v8 * 0.7335
                              + v9 * 0.268
                              + v7 * -0.0835);
  self->super.baseVT[6] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.46
                              + 117.6
                              + v8 * 0.7605
                              + v9 * 0.2455
                              + v7 * -0.079);
  self->super.baseVT[7] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.352
                              + 73.1
                              + v8 * 0.815
                              + v9 * 0.1985
                              + v7 * -0.0685);
  self->super.baseVT[8] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.105
                              + -4.713
                              + (double)v5 * -0.065
                              + v7 * -0.026
                              + v8 * 0.944
                              + v9 * 0.126);
  self->super.baseVT[9] = (int)((double)self->_filteredBacklightCurrentLI2 * -0.0745
                              + -48.05
                              + v8 * 1.12
                              + v9 * 0.051
                              + (double)v5 * -0.1715);
  self->super.baseVT[10] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.544 + 202.0 + v8 * 0.485 + v9 * 0.408);
  self->super.baseVT[11] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.825 + 200.0 + v8 * 0.505 + v9 * 0.392);
  self->super.baseVT[12] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.366 + 129.7 + v8 * 0.589 + v9 * 0.338);
  self->super.baseVT[13] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.85 + 102.0 + v8 * 0.664 + v9 * 0.285);
  self->super.baseVT[14] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.562
                               + 69.1
                               + (double)v6 * 0.177
                               + v8 * 0.521
                               + v9 * 0.252);
  self->super.baseVT[15] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.917 + 215.7 + v8 * 0.298 + v9 * 0.603);
  self->super.baseVT[16] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.112 + 214.4 + v8 * 0.308 + v9 * 0.599);
  self->super.baseVT[17] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.075 + 236.0 + v8 * 0.328 + v9 * 0.579);
  self->super.baseVT[18] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.12
                               + 241.0
                               + (double)v3 * 0.086
                               + v8 * 0.317
                               + v9 * 0.5);
  self->super.baseVT[19] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.8
                               + 255.0
                               + (double)v3 * 0.11
                               + v8 * 0.33
                               + v9 * 0.46);
  self->super.baseVT[20] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.791
                               + 201.0
                               + (double)v3 * -0.175
                               + v8 * 0.16
                               + v9 * 0.927);
  self->super.baseVT[21] = (int)((double)self->_filteredBacklightCurrentLI2 * 1.25 + 189.0 + v8 * 0.106 + v9 * 0.832);
  self->super.baseVT[22] = (int)((double)self->_filteredBacklightCurrentLI2 * 0.366 + 129.0 + v8 * 0.589 + v9 * 0.338);
  *(int32x2_t *)&self->super.baseVT[23] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100061280, (float64x2_t)xmmword_100061270, (double)v3), (float64x2_t)xmmword_100061290, (double)v4), (float64x2_t)xmmword_1000612A0, v8), (float64x2_t)xmmword_1000612B0, v9)));
  v11 = vdupq_lane_s32(v10, 0);
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
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  _QWORD v21[5];
  unsigned int v22;
  int v23;
  __int128 v24;
  int v25;
  int32x2_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned __int8 v36;

  v3 = -[tm48f05d1771cf4a49db2ccd3808afb48c gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = HIDWORD(qword_1000A29AC);
  v16 = *(uint64_t *)((char *)&qword_1000A2A8C + 4);
  v17 = qword_1000A29B4;
  v5 = *(int32x2_t *)((char *)&qword_1000A2A94 + 4);
  v6 = qword_1000A2A8C;
  v19 = dword_1000A2A88;
  v20 = dword_1000A2A64;
  v15 = dword_1000A2AA0;
  v18 = dword_1000A2AA4;
  v7 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v8 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v9 = -[CommonProduct getChargerState](self, "getChargerState");
  v10 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
  v11 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v12 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  v13 = (NSNumber *)objc_msgSend(+[_CDClientContext userContext](_CDClientContext, "userContext"), "objectForKeyedSubscript:", +[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  if (!v13)
    v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001E060;
  v21[3] = &unk_10007D928;
  v22 = v3;
  v23 = v4;
  *(_QWORD *)&v14 = v17;
  *((_QWORD *)&v14 + 1) = v16;
  v24 = v14;
  v25 = v6;
  v26 = vrev64_s32(v5);
  v27 = v15;
  v28 = v20;
  v29 = v19;
  v30 = v18;
  v31 = v7;
  v32 = v8;
  v33 = v10;
  v34 = v9;
  v36 = v11;
  v35 = v12;
  v21[4] = v13;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v21);
}

@end
