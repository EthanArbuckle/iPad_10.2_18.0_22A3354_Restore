@implementation tma7d85a7cc26d3b1c4eac409f958562c0

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tma7d85a7cc26d3b1c4eac409f958562c0;
  v3 = -[CommonProduct initProduct:](&v6, "initProduct:", a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "resetVTFilterState");
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = 1;
  self->_filteredMaxRadioTemp = -1;
  self->_filteredMaxCameraTemp = -1;
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
  int v9;
  unsigned int v10;
  float v11;
  int filteredBacklightCurrentLI2;
  int v13;
  int v14;
  int filteredMaxRadioTemp;
  int v16;
  int v17;
  int filteredMaxCameraTemp;
  id v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  id v26;
  float v27;
  double v28;
  id v29;
  double v30;
  float v31;
  id v32;
  float v33;
  double v34;
  id v35;
  double v36;
  float v37;
  id v38;
  double v39;
  float v40;
  id v41;
  double v42;
  float v43;
  id v44;
  double v45;
  float v46;
  id v47;
  double v48;
  float v49;
  id v50;
  double v51;
  unsigned int v52;
  float v53;
  id v54;
  double v55;
  id v56;
  double v57;
  id v58;
  double v59;
  float v60;
  id v61;
  double v62;
  uint64_t v63;
  int v64;
  double v65;
  int v66;
  int v67;

  v3 = a3;
  v5 = -[tma7d85a7cc26d3b1c4eac409f958562c0 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v6 = qword_1000A28B4;
  LODWORD(v63) = HIDWORD(qword_1000A28B4);
  v8 = dword_1000A28BC;
  v7 = dword_1000A28C0;
  v9 = dword_1000A2940;
  v66 = qword_1000A28C4;
  v67 = dword_1000A2944;
  if (v3)
    -[tma7d85a7cc26d3b1c4eac409f958562c0 resetVTFilterState](self, "resetVTFilterState");
  v10 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0, v63), "currentLoadingIndex");
  v11 = (double)(int)(v10 * v10) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0)
    v11 = (float)filteredBacklightCurrentLI2 + (float)((float)(v11 - (float)filteredBacklightCurrentLI2) * 0.14286);
  self->_filteredBacklightCurrentLI2 = (int)v11;
  v13 = qword_1000A2A68;
  if ((int)qword_1000A2A68 <= SHIDWORD(qword_1000A2A68))
    v13 = HIDWORD(qword_1000A2A68);
  v14 = v13 & ~(v13 >> 31);
  filteredMaxRadioTemp = self->_filteredMaxRadioTemp;
  if ((filteredMaxRadioTemp & 0x80000000) == 0)
    v14 = (int)(float)((float)filteredMaxRadioTemp + (float)((float)(v14 - filteredMaxRadioTemp) * 0.25));
  self->_filteredMaxRadioTemp = v14;
  v16 = dword_1000A2A58;
  if (dword_1000A2A58 <= dword_1000A2A60)
    v16 = dword_1000A2A60;
  v17 = v16 & ~(v16 >> 31);
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
  sub_10002E350(51, (int)((double)v6 * 0.24 + -80.0 + (double)v8 * 0.18 + (double)v7 * 0.14 + (double)v9 * 0.45));
  v23 = (double)v64;
  v65 = (double)v5 * 0.47 + -70.0 + (double)v6 * -0.38 + (double)v64 * 0.14 + (double)v8 * 0.79;
  sub_10002E350(49, (int)(v65 + (double)self->_filteredMaxRadioTemp * -0.05));
  sub_10002E350(50, (int)((double)v5 * 0.91 + 71.0 + (double)v6 * -0.21 + v23 * 0.09 + (double)v8 * 0.23));
  sub_10002E350(57, (int)((double)v5 * 1.07+ 55.0+ v23 * -0.16+ (double)v8 * 0.16+ (double)v7 * 0.34+ (double)v66 * -0.42));
  sub_10002E350(56, (int)((double)v5 * 1.13+ 94.0+ (double)v8 * 0.29+ (double)v7 * 0.24+ (double)v66 * -0.7+ (double)self->_filteredMaxCameraTemp * 0.07));
  sub_10002E350(58, (int)((double)v5+ 65.0+ (double)v8 * 0.19+ (double)v7 * 0.15+ (double)v66 * -0.36+ (double)self->_filteredMaxRadioTemp * -0.04));
  v24 = (double)(v67 & ~(v67 >> 31));
  sub_10002E350(60, (int)((double)v9 * 0.92 + -52.0 + v23 * -0.05 + (double)v8 * 0.13 + v24 * -0.06));
  sub_10002E350(52, (int)((double)v8 * 0.12+ 138.0+ (double)v66 * 0.22+ (double)v9 * 0.69+ (double)self->_filteredMaxRadioTemp * -0.12+ (double)self->_filteredMaxCameraTemp * -0.12+ v24 * -0.09));
  sub_10002E350(53, (int)(v65 + (double)self->_filteredMaxRadioTemp * -0.05));
  sub_10002E350(54, 3000);
  sub_10002E350(55, 3000);
  v25 = (float)unk_1000A2A70;
  v26 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v27 = v25 / 100.0;
  *(float *)&v28 = v27;
  objc_msgSend(v26, "calculateControlEffort:", v28);
  v29 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v30 = v27;
  objc_msgSend(v29, "calculateControlEffort:", v30);
  v31 = (float)SHIDWORD(qword_1000A2A8C);
  v32 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  v33 = v31 / 100.0;
  *(float *)&v34 = v33;
  objc_msgSend(v32, "calculateControlEffort:", v34);
  v35 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  *(float *)&v36 = v33;
  objc_msgSend(v35, "calculateControlEffort:", v36);
  v37 = (float)dword_1000A2A9C;
  v38 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v39 = v37 / 100.0;
  objc_msgSend(v38, "calculateControlEffort:", v39);
  v40 = (float)(int)qword_1000A2A7C;
  v41 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v42 = v40 / 100.0;
  objc_msgSend(v41, "calculateControlEffort:", v42);
  v43 = (float)SHIDWORD(qword_1000A2A7C);
  v44 = -[CommonProduct findComponent:](self, "findComponent:", 25);
  *(float *)&v45 = v43 / 100.0;
  objc_msgSend(v44, "calculateControlEffort:", v45);
  v46 = (float)dword_1000A2A84;
  v47 = -[CommonProduct findComponent:](self, "findComponent:", 26);
  *(float *)&v48 = v46 / 100.0;
  objc_msgSend(v47, "calculateControlEffort:", v48);
  v49 = (float)dword_1000A2A88;
  v50 = -[CommonProduct findComponent:](self, "findComponent:", 27);
  *(float *)&v51 = v49 / 100.0;
  objc_msgSend(v50, "calculateControlEffort:", v51);
  v52 = -[CommonProduct getChargerState](self, "getChargerState");
  if (v52 - 10 <= 0x3C)
  {
    v53 = (float)(int)qword_1000A2A74;
    if (((1 << (v52 - 10)) & 0x1004010000100000) != 0)
    {
      v54 = -[CommonProduct findComponent:](self, "findComponent:", 28);
      LODWORD(v55) = 30.0;
      objc_msgSend(v54, "calculateControlEffort:", v55);
      v56 = -[CommonProduct findComponent:](self, "findComponent:", 29);
      *(float *)&v57 = v53 / 100.0;
LABEL_21:
      objc_msgSend(v56, "calculateControlEffort:", v57, *(_QWORD *)&v65);
      goto LABEL_22;
    }
    if (v52 == 10)
    {
      v58 = -[CommonProduct findComponent:](self, "findComponent:", 28);
      *(float *)&v59 = v53 / 100.0;
LABEL_20:
      objc_msgSend(v58, "calculateControlEffort:", v59, *(_QWORD *)&v65);
      v56 = -[CommonProduct findComponent:](self, "findComponent:", 29);
      LODWORD(v57) = 30.0;
      goto LABEL_21;
    }
  }
  if (!v52)
  {
    v58 = -[CommonProduct findComponent:](self, "findComponent:", 28);
    LODWORD(v59) = 30.0;
    goto LABEL_20;
  }
LABEL_22:
  v60 = (float)SHIDWORD(qword_1000A2A74);
  v61 = -[CommonProduct findComponent:](self, "findComponent:", 30, *(_QWORD *)&v65);
  *(float *)&v62 = v60 / 100.0;
  objc_msgSend(v61, "calculateControlEffort:", v62);
}

- (id)getGridX
{
  return &off_100085810;
}

- (id)getGridY
{
  return &off_100085828;
}

- (int)compute2DGridTemps
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  double v7;
  double v8;
  unsigned int v9;
  int32x4_t v10;
  uint64_t v11;
  int32x4_t v12;
  int32x4_t v13;

  v3 = -[tma7d85a7cc26d3b1c4eac409f958562c0 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = qword_1000A28B4;
  v6 = dword_1000A28BC;
  v5 = dword_1000A28C0;
  v7 = (double)(int)qword_1000A28C4;
  v8 = (double)dword_1000A2940;
  v9 = (int)((double)v3 * 0.53
           + 130.8
           + (double)(int)qword_1000A28C4 * -0.24
           + (double)self->_filteredBacklightCurrentLI2 * 0.01
           + (double)dword_1000A2940 * 0.65);
  self->super.baseVT[0] = v9;
  self->super.baseVT[1] = (int)((double)v3 * 0.54
                              + 282.1
                              + v7 * -0.22
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.61);
  self->super.baseVT[2] = (int)((double)v3 * 0.83
                              + 364.2
                              + v7 * -0.29
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.39);
  self->super.baseVT[3] = (int)((double)v3
                              + 334.9
                              + v7 * -0.35
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.27);
  self->super.baseVT[4] = (int)((double)v3 * 1.1 + 291.9 + (double)v6 * 0.07 + v7 * -0.43 + v8 * 0.17);
  self->super.baseVT[5] = (int)((double)v3 * 0.48
                              + -5.4
                              + (double)v6 * 0.14
                              + v7 * -0.04
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.4);
  self->super.baseVT[6] = (int)((double)v3 * 0.63
                              + 80.9
                              + (double)v6 * 0.14
                              + v7 * -0.12
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.32);
  self->super.baseVT[7] = (int)((double)v3 * 0.76
                              + 135.7
                              + (double)v6 * 0.15
                              + v7 * -0.19
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.23);
  self->super.baseVT[8] = (int)((double)v3 * 0.84
                              + 179.1
                              + (double)v6 * 0.17
                              + v7 * -0.25
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.17);
  self->super.baseVT[9] = (int)((double)v3 * 1.14
                              + 100.9
                              + (double)(int)v4 * -0.39
                              + (double)v6 * 0.54
                              + v7 * -0.41
                              + v8 * 0.1);
  self->super.baseVT[10] = (int)((double)v3 * 0.44
                               + -96.5
                               + (double)v6 * 0.35
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01
                               + v8 * 0.2);
  self->super.baseVT[11] = (int)((double)v3 * 0.52
                               + -10.6
                               + (double)v6 * 0.29
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01
                               + v8 * 0.15);
  self->super.baseVT[12] = (int)((double)v3
                               + 65.0
                               + (double)v6 * 0.19
                               + (double)v5 * 0.15
                               + v7 * -0.36
                               + (double)self->_filteredMaxRadioTemp * -0.04);
  self->super.baseVT[13] = (int)((double)v3 * 1.07
                               + 220.4
                               + (double)SHIDWORD(v4) * 0.35
                               + v7 * -0.5
                               + (double)self->_filteredBacklightCurrentLI2 * 0.0);
  self->super.baseVT[14] = (int)((double)v3 * 0.93
                               + 170.0
                               + (double)v6 * 0.27
                               + v7 * -0.28
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[15] = (int)((double)v3 * 0.74
                               + 10.9
                               + (double)v6 * 0.39
                               + (double)v5 * 0.25
                               + v7 * -0.41
                               + (double)self->_filteredBacklightCurrentLI2 * 0.0);
  self->super.baseVT[16] = (int)((double)v3 * 0.7
                               + -37.1
                               + (double)v6 * 0.48
                               + v7 * -0.21
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[17] = (int)((double)v3 * 0.77
                               + -2.1
                               + (double)v6 * 0.47
                               + v7 * -0.28
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[18] = (int)((double)v3 * 0.85
                               + 30.5
                               + (double)v6 * 0.39
                               + v7 * -0.28
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[19] = (int)((double)v3 * 0.98
                               + 112.4
                               + (double)v6 * 0.31
                               + (double)v5 * 0.12
                               + v7 * -0.48
                               + (double)self->_filteredBacklightCurrentLI2 * 0.0);
  self->super.baseVT[20] = (int)((double)v3 * 0.86
                               + 122.7
                               + (double)(int)v4 * 0.21
                               + (double)v6 * 0.32
                               + (double)v5 * 0.29
                               + v7 * -0.73);
  self->super.baseVT[21] = (int)((double)v3 * 0.75
                               + 96.4
                               + (double)(int)v4 * 0.51
                               + (double)v5 * 0.24
                               + v7 * -0.56
                               + (double)self->_filteredBacklightCurrentLI2 * 0.0);
  self->super.baseVT[22] = (int)((double)v3 * 1.07
                               + 55.0
                               + (double)SHIDWORD(v4) * -0.16
                               + (double)v6 * 0.16
                               + (double)v5 * 0.34
                               + v7 * -0.42);
  self->super.baseVT[23] = (int)((double)v3 * 0.82
                               + 122.3
                               + (double)(int)v4 * 0.53
                               + (double)v5 * 0.17
                               + v7 * -0.59
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[24] = (int)((double)v3 * 0.92
                               + 124.8
                               + (double)(int)v4 * 0.48
                               + (double)v5 * 0.16
                               + v7 * -0.65
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  v10 = vdupq_n_s32(v9);
  v11 = 1;
  v12 = v10;
  do
  {
    v13 = *(int32x4_t *)&self->super.baseVT[v11];
    v10 = vminq_s32(v10, v13);
    v12 = vmaxq_s32(v12, v13);
    v11 += 4;
  }
  while (v11 != 25);
  sub_10002E350(59, (vmaxvq_s32(v12) - vminvq_s32(v10)));
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

  v3 = -[tma7d85a7cc26d3b1c4eac409f958562c0 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
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
  v20[2] = sub_1000213F4;
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
