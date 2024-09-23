@implementation tme2ace17794945a417c3590cb13e7cc18

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tme2ace17794945a417c3590cb13e7cc18;
  v3 = -[CommonProduct initProduct:](&v6, "initProduct:", a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "resetVTFilterState");
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = -1;
  self->_filteredMaxRadioTemp = -1;
  self->_filteredMaxCameraTemp = -1;
  self->_tsrrTransitionStepCount = 0;
}

- (int)gasGaugeBatteryTemperature
{
  return dword_1000A28AC[0];
}

- (int)arcModuleTemperature
{
  return dword_1000A2944;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  float v10;
  int filteredBacklightCurrentLI2;
  int v12;
  int v13;
  int filteredMaxRadioTemp;
  int v15;
  int v16;
  int v17;
  int filteredMaxCameraTemp;
  id v19;
  float v20;
  double v21;
  double v22;
  int tsrrTransitionStepCount;
  int v24;
  uint64_t v25;
  float v26;
  id v27;
  float v28;
  double v29;
  id v30;
  double v31;
  float v32;
  id v33;
  float v34;
  double v35;
  id v36;
  double v37;
  float v38;
  id v39;
  double v40;
  float v41;
  id v42;
  double v43;
  float v44;
  id v45;
  double v46;
  float v47;
  id v48;
  double v49;
  float v50;
  id v51;
  double v52;
  float v53;
  id v54;
  double v55;
  id v56;
  double v57;
  id v58;
  double v59;
  int v60;
  int v61;
  int v62;
  int v63;
  unsigned int v64;

  v3 = a3;
  v5 = -[tme2ace17794945a417c3590cb13e7cc18 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v6 = HIDWORD(qword_1000A28B4);
  v7 = dword_1000A28BC;
  v61 = dword_1000A28C0;
  v62 = qword_1000A28B4;
  v60 = qword_1000A28C4;
  v8 = dword_1000A2940;
  v63 = dword_1000A2944;
  v64 = -[CommonProduct getChargerState](self, "getChargerState");
  if (v3)
    -[tme2ace17794945a417c3590cb13e7cc18 resetVTFilterState](self, "resetVTFilterState");
  v9 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v10 = (double)(int)(v9 * v9) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0)
    v10 = (float)filteredBacklightCurrentLI2 + (float)((float)(v10 - (float)filteredBacklightCurrentLI2) * 0.14286);
  self->_filteredBacklightCurrentLI2 = (int)v10;
  v12 = qword_1000A2A68;
  if ((int)qword_1000A2A68 <= SHIDWORD(qword_1000A2A68))
    v12 = HIDWORD(qword_1000A2A68);
  v13 = v12 & ~(v12 >> 31);
  filteredMaxRadioTemp = self->_filteredMaxRadioTemp;
  if ((filteredMaxRadioTemp & 0x80000000) == 0)
    v13 = (int)(float)((float)filteredMaxRadioTemp + (float)((float)(v13 - filteredMaxRadioTemp) * 0.25));
  self->_filteredMaxRadioTemp = v13;
  v15 = dword_1000A2A58;
  v16 = dword_1000A2A5C;
  if (dword_1000A2A5C <= dword_1000A2A60)
    v16 = dword_1000A2A60;
  if (dword_1000A2A58 <= v16)
    v15 = v16;
  v17 = v15 & ~(v15 >> 31);
  filteredMaxCameraTemp = self->_filteredMaxCameraTemp;
  if ((filteredMaxCameraTemp & 0x80000000) == 0)
    v17 = (int)(float)((float)filteredMaxCameraTemp + (float)((float)(v17 - filteredMaxCameraTemp) * 0.25));
  self->_filteredMaxCameraTemp = v17;
  v19 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v20 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v21 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v22 = v21;
  *(float *)&v21 = v20;
  objc_msgSend(v19, "calculateControlEffort:trigger:", v21, v22);
  sub_10002E350(51, (int)((double)v5 * 0.14+ -58.0+ (double)v6 * 0.03+ (double)v7 * 0.64+ (double)v8 * 0.16+ (double)self->_filteredMaxRadioTemp * -0.11));
  sub_10002E350(49, (int)((double)v5 * 0.39+ -10.0+ (double)v6 * 0.55+ (double)v7 * 0.38+ (double)v60 * -0.33+ (double)self->_filteredMaxRadioTemp * -0.07));
  sub_10002E350(50, (int)((double)v5 * 0.53 + -114.0 + (double)v7 * 0.46 + (double)v61 * 0.31 + (double)v60 * -0.29));
  sub_10002E350(53, (int)((double)v62 * 1.89+ 71.0+ (double)v7 * -1.09+ (double)v60 * 0.16+ (double)self->_filteredMaxCameraTemp * -0.06));
  sub_10002E350(58, (int)((double)v5 * 0.76+ 156.0+ (double)v7 * 0.59+ (double)v60 * -0.43+ (double)self->_filteredBacklightCurrentLI2 * 0.01+ (double)self->_filteredMaxRadioTemp * -0.11));
  sub_10002E350(57, (int)((double)v61 * 0.18+ -40.0+ (double)v60 * -0.26+ (double)v8 * 1.13+ (double)self->_filteredBacklightCurrentLI2 * 0.02+ (double)(v63 & ~(v63 >> 31)) * -0.04));
  sub_10002E350(60, (int)((double)v8 * 0.89 + -29.0 + (double)v7 * 0.04 + (double)v61 * -0.09 + (double)v60 * 0.14));
  sub_10002E350(52, (int)((double)v7 * 0.57+ -391.0+ (double)v61 * -0.47+ (double)v60 * 0.88+ (double)self->_filteredMaxRadioTemp * -0.09));
  sub_10002E350(56, (int)((double)v62 * 2.51+ -131.0+ (double)v7 * -1.97+ (double)v8 * 0.41+ (double)self->_filteredBacklightCurrentLI2 * 0.02));
  sub_10002E350(54, 3000);
  sub_10002E350(55, 3000);
  tsrrTransitionStepCount = self->_tsrrTransitionStepCount;
  if (v64 == 10)
  {
    if (tsrrTransitionStepCount >= 10)
    {
      LODWORD(v25) = qword_1000A2A7C;
      goto LABEL_23;
    }
    v24 = 1;
  }
  else
  {
    if (tsrrTransitionStepCount <= 0)
    {
      v25 = qword_1000A2A7C;
      goto LABEL_25;
    }
    v24 = -1;
  }
  tsrrTransitionStepCount += v24;
  self->_tsrrTransitionStepCount = tsrrTransitionStepCount;
  v25 = qword_1000A2A7C;
  if (tsrrTransitionStepCount >= 1)
LABEL_23:
    v25 = ((HIDWORD(qword_1000A2A74) - (int)v25) * tsrrTransitionStepCount / 10 + v25);
LABEL_25:
  sub_10002E350(52, v25);
  v26 = (float)SHIDWORD(qword_1000A2A74);
  v27 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v28 = v26 / 100.0;
  *(float *)&v29 = v28;
  objc_msgSend(v27, "calculateControlEffort:", v29);
  v30 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v31 = v28;
  objc_msgSend(v30, "calculateControlEffort:", v31);
  v32 = (float)SHIDWORD(qword_1000A2A8C);
  v33 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  v34 = v32 / 100.0;
  *(float *)&v35 = v34;
  objc_msgSend(v33, "calculateControlEffort:", v35);
  v36 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  *(float *)&v37 = v34;
  objc_msgSend(v36, "calculateControlEffort:", v37);
  v38 = (float)dword_1000A2A9C;
  v39 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v40 = v38 / 100.0;
  objc_msgSend(v39, "calculateControlEffort:", v40);
  v41 = (float)(int)qword_1000A2A7C;
  v42 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v43 = v41 / 100.0;
  objc_msgSend(v42, "calculateControlEffort:", v43);
  v44 = (float)SHIDWORD(qword_1000A2A7C);
  v45 = -[CommonProduct findComponent:](self, "findComponent:", 25);
  *(float *)&v46 = v44 / 100.0;
  objc_msgSend(v45, "calculateControlEffort:", v46);
  v47 = (float)dword_1000A2A84;
  v48 = -[CommonProduct findComponent:](self, "findComponent:", 26);
  *(float *)&v49 = v47 / 100.0;
  objc_msgSend(v48, "calculateControlEffort:", v49);
  v50 = (float)dword_1000A2A88;
  v51 = -[CommonProduct findComponent:](self, "findComponent:", 27);
  *(float *)&v52 = v50 / 100.0;
  objc_msgSend(v51, "calculateControlEffort:", v52);
  if (!v64)
  {
    v54 = -[CommonProduct findComponent:](self, "findComponent:", 28);
    LODWORD(v55) = 30.0;
    goto LABEL_29;
  }
  v53 = (float)(int)qword_1000A2A74;
  if (v64 == 10)
  {
    v54 = -[CommonProduct findComponent:](self, "findComponent:", 28);
    *(float *)&v55 = v53 / 100.0;
LABEL_29:
    objc_msgSend(v54, "calculateControlEffort:", v55, 0x3FC1EB851EB851ECLL);
    v56 = -[CommonProduct findComponent:](self, "findComponent:", 29);
    LODWORD(v57) = 30.0;
LABEL_33:
    objc_msgSend(v56, "calculateControlEffort:", v57);
    return;
  }
  if (v64 - 30 <= 0x28 && ((1 << (v64 - 30)) & 0x10040100001) != 0)
  {
    v58 = -[CommonProduct findComponent:](self, "findComponent:", 28);
    LODWORD(v59) = 30.0;
    objc_msgSend(v58, "calculateControlEffort:", v59);
    v56 = -[CommonProduct findComponent:](self, "findComponent:", 29);
    *(float *)&v57 = v53 / 100.0;
    goto LABEL_33;
  }
}

- (id)getGridX
{
  return &off_100085888;
}

- (id)getGridY
{
  return &off_1000858A0;
}

- (int)compute2DGridTemps
{
  int v3;
  int v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int32x2_t v11;
  int32x4_t v12;
  uint64_t v13;
  int32x4_t v14;
  int32x4_t v15;

  v3 = -[tme2ace17794945a417c3590cb13e7cc18 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = dword_1000A28BC;
  v5 = dword_1000A2944;
  v6 = (double)(int)qword_1000A28B4;
  v7 = (double)SHIDWORD(qword_1000A28B4);
  v8 = (double)dword_1000A28C0;
  v9 = (double)(int)qword_1000A28C4;
  v10 = (double)dword_1000A2940;
  v11 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100061C10, (float64x2_t)xmmword_100061C00, (double)(int)qword_1000A28B4), (float64x2_t)xmmword_100061C20, (double)SHIDWORD(qword_1000A28B4)), (float64x2_t)xmmword_100061C30, (double)dword_1000A28C0), (float64x2_t)xmmword_100061C40, (double)(int)qword_1000A28C4), (float64x2_t)xmmword_100061C50, (double)dword_1000A2940)));
  *(int32x2_t *)self->super.baseVT = v11;
  self->super.baseVT[2] = (int)((double)v3 * 0.54
                              + -4.5
                              + v6 * 0.81
                              + v8 * 0.17
                              + v9 * -0.56
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[3] = (int)(v6 * 2.0
                              + -138.6
                              + v7 * -0.29
                              + (double)v4 * -1.16
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02
                              + v10 * 0.39);
  self->super.baseVT[4] = (int)(v6 * 2.11
                              + -97.8
                              + (double)v4 * -1.45
                              + v9 * -0.2
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v10 * 0.47);
  self->super.baseVT[5] = (int)((double)v3 * 0.42
                              + 58.0
                              + (double)v4 * 0.88
                              + v9 * -0.33
                              + (double)self->_filteredMaxRadioTemp * -0.16);
  self->super.baseVT[6] = (int)((double)v3 * 0.48
                              + -61.0
                              + (double)v4 * 0.62
                              + v9 * -0.13
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[7] = (int)((double)v3 * 0.56
                              + -53.4
                              + v6 * 0.57
                              + v9 * -0.15
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[8] = (int)((double)v3 * 0.69
                              + -44.9
                              + v6 * 0.61
                              + v9 * -0.34
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[9] = (int)((double)v3 * 0.72
                              + 23.2
                              + v6 * 0.58
                              + v9 * -0.37
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[10] = (int)((double)v3 * 0.37
                               + 28.6
                               + (double)v4 * 0.3
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01
                               + v10 * 0.28);
  self->super.baseVT[11] = (int)((double)v3 * 0.77
                               + -83.3
                               + (double)v4 * 0.43
                               + v9 * -0.22
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[12] = (int)((double)v3 * 0.76
                               + 156.0
                               + (double)v4 * 0.59
                               + v9 * -0.43
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01
                               + (double)self->_filteredMaxRadioTemp * -0.11);
  self->super.baseVT[13] = (int)((double)v3 * 0.89
                               + -42.0
                               + (double)v4 * 0.42
                               + v9 * -0.34
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[14] = (int)((double)v3 * 1.02 + -45.6 + v7 * 0.46 + (double)v4 * 0.27 + v9 * -0.76);
  self->super.baseVT[15] = (int)((double)v3 * 0.47
                               + -53.8
                               + (double)v4 * 0.21
                               + v9 * -0.18
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 0.48);
  self->super.baseVT[16] = (int)((double)v3 * 0.45
                               + -47.0
                               + (double)v4 * 0.2
                               + v9 * -0.17
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 0.5);
  self->super.baseVT[17] = (int)((double)v3 * 1.1
                               + -4.8
                               + v7 * 0.69
                               + v8 * -0.13
                               + v9 * -0.67
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[18] = (int)((double)v3 * 1.1
                               + 10.9
                               + v7 * 0.69
                               + v8 * -0.12
                               + v9 * -0.69
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[19] = (int)((double)v3 * 1.11
                               + -1.5
                               + v7 * 0.45
                               + (double)v4 * 0.15
                               + v9 * -0.73
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[20] = (int)((double)v3 * 0.41
                               + -75.0
                               + v7 * 0.27
                               + v9 * -0.43
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 0.74);
  self->super.baseVT[21] = (int)(v6 * -0.28
                               + 90.4
                               + (double)v4 * 0.34
                               + v9 * -0.11
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 1.03);
  self->super.baseVT[22] = (int)(v8 * 0.18
                               + -40.0
                               + v9 * -0.26
                               + v10 * 1.13
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + (double)(v5 & ~(v5 >> 31)) * -0.04);
  self->super.baseVT[23] = (int)(v7 * -0.65
                               + 166.5
                               + (double)v4 * 0.37
                               + v8 * 0.28
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 0.96);
  self->super.baseVT[24] = (int)((double)v3 * 0.53
                               + -21.4
                               + (double)v4 * 0.24
                               + v9 * -0.37
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v10 * 0.58);
  v12 = vdupq_lane_s32(v11, 0);
  v13 = 1;
  v14 = v12;
  do
  {
    v15 = *(int32x4_t *)&self->super.baseVT[v13];
    v12 = vminq_s32(v12, v15);
    v14 = vmaxq_s32(v14, v15);
    v13 += 4;
  }
  while (v13 != 25);
  sub_10002E350(59, (vmaxvq_s32(v14) - vminvq_s32(v12)));
  return self->super.baseVT;
}

- (void)updateCoreAnalyticsInfo
{
  unsigned int v3;
  int v4;
  int32x2_t v5;
  int32x2_t v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned __int8 v13;
  unsigned int v14;
  unsigned __int8 v15;
  __int128 v16;
  int v17;
  int v18;
  int v19;
  _QWORD v20[4];
  unsigned int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  __int128 v26;
  int v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned __int8 v34;
  unsigned __int8 v35;

  v3 = -[tme2ace17794945a417c3590cb13e7cc18 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = HIDWORD(qword_1000A29AC);
  v5 = *(int32x2_t *)((char *)&qword_1000A2A74 + 4);
  v6 = (int32x2_t)qword_1000A2A8C;
  v19 = qword_1000A2A94;
  v7 = unk_1000A2A70;
  v17 = HIDWORD(qword_1000A2A7C);
  v18 = qword_1000A2A74;
  v8 = qword_1000A28B4;
  v9 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v10 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v11 = -[CommonProduct getChargerState](self, "getChargerState");
  v12 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
  v13 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v14 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  v15 = -[AccessoryHelper isAccessoryAttached](self->super.accessoryHelper, "isAccessoryAttached");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100038D5C;
  v20[3] = &unk_10007D678;
  v21 = v3;
  v22 = v4;
  v23 = v8;
  v24 = v17;
  v25 = v7;
  *(int32x2_t *)&v16 = vrev64_s32(v5);
  *((int32x2_t *)&v16 + 1) = vrev64_s32(v6);
  v26 = v16;
  v27 = v19;
  v28 = v18;
  v29 = v9;
  v30 = v10;
  v31 = v12;
  v32 = v11;
  v34 = v13;
  v33 = v14;
  v35 = v15;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v20);
}

@end
