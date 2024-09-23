@implementation tma9779bbe69693407a3d3988874266227

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tma9779bbe69693407a3d3988874266227;
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
  unsigned int v8;
  float v9;
  int filteredBacklightCurrentLI2;
  int v11;
  int v12;
  int filteredMaxRadioTemp;
  int v14;
  int v15;
  int v16;
  int v17;
  int filteredMaxCameraTemp;
  id v19;
  float v20;
  double v21;
  double v22;
  float v23;
  id v24;
  float v25;
  double v26;
  id v27;
  double v28;
  float v29;
  id v30;
  float v31;
  double v32;
  id v33;
  double v34;
  float v35;
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
  unsigned int v50;
  float v51;
  id v52;
  double v53;
  id v54;
  double v55;
  id v56;
  double v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;

  v3 = a3;
  v5 = -[tma9779bbe69693407a3d3988874266227 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v6 = qword_1000A28B4;
  v7 = HIDWORD(qword_1000A28B4);
  v58 = dword_1000A28C0;
  v59 = qword_1000A28C4;
  v60 = dword_1000A28BC;
  v61 = dword_1000A2940;
  v62 = dword_1000A2944;
  if (v3)
    -[tma9779bbe69693407a3d3988874266227 resetVTFilterState](self, "resetVTFilterState");
  v8 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v9 = (double)(int)(v8 * v8) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0)
    v9 = (float)filteredBacklightCurrentLI2 + (float)((float)(v9 - (float)filteredBacklightCurrentLI2) * 0.14286);
  self->_filteredBacklightCurrentLI2 = (int)v9;
  v11 = qword_1000A2A68;
  if ((int)qword_1000A2A68 <= SHIDWORD(qword_1000A2A68))
    v11 = HIDWORD(qword_1000A2A68);
  v12 = v11 & ~(v11 >> 31);
  filteredMaxRadioTemp = self->_filteredMaxRadioTemp;
  if (filteredMaxRadioTemp < 0)
    v14 = v12;
  else
    v14 = (int)(float)((float)filteredMaxRadioTemp + (float)((float)(v12 - filteredMaxRadioTemp) * 0.25));
  self->_filteredMaxRadioTemp = v14;
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
  sub_10002E350(51, (int)((double)v5 * 0.29+ 6.0+ (double)v6 * 0.44+ (double)v7 * 0.24+ (double)self->_filteredMaxRadioTemp * -0.06+ (double)self->_filteredMaxCameraTemp * -0.03));
  sub_10002E350(49, (int)((double)v5 * 0.16+ 8.0+ (double)v6 * 0.62+ (double)v7 * 0.19+ (double)self->_filteredMaxRadioTemp * -0.05+ (double)self->_filteredMaxCameraTemp * -0.02));
  sub_10002E350(50, (int)((double)v5 * 0.3 + 389.0 + (double)v7 * 0.94 + (double)v58 * -0.58 + (double)v59 * 0.28));
  sub_10002E350(58, (int)((double)v5 * 0.71+ 204.0+ (double)v60 * 0.25+ (double)v58 * -0.07+ (double)self->_filteredBacklightCurrentLI2 * 0.02));
  sub_10002E350(54, 3000);
  sub_10002E350(57, (int)((double)v5 * 0.98+ 329.0+ (double)v58 * -0.11+ (double)self->_filteredBacklightCurrentLI2 * 0.04));
  sub_10002E350(60, (int)((double)v61 * 0.95 + -67.0 + (double)v60 * 0.1 + (double)(v62 & ~(v62 >> 31)) * -0.03));
  sub_10002E350(55, 3000);
  sub_10002E350(56, (int)((double)v5 * 0.26+ -65.0+ (double)v6 * 3.03+ (double)v7 * -0.39+ (double)v60 * -1.95+ (double)self->_filteredBacklightCurrentLI2 * 0.02));
  sub_10002E350(52, (int)((double)v6 * 0.3+ -70.0+ (double)v58 * 0.15+ (double)v59 * 0.12+ (double)v61 * 0.43+ (double)self->_filteredMaxRadioTemp * -0.04));
  sub_10002E350(53, (int)((double)v5 * 0.33 + 93.0 + (double)v7 * 0.34 + (double)v60 * 0.27 + (double)v12 * -0.01));
  v23 = (float)SHIDWORD(qword_1000A2A74);
  v24 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v25 = v23 / 100.0;
  *(float *)&v26 = v25;
  objc_msgSend(v24, "calculateControlEffort:", v26);
  v27 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v28 = v25;
  objc_msgSend(v27, "calculateControlEffort:", v28);
  v29 = (float)SHIDWORD(qword_1000A2A8C);
  v30 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  v31 = v29 / 100.0;
  *(float *)&v32 = v31;
  objc_msgSend(v30, "calculateControlEffort:", v32);
  v33 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  *(float *)&v34 = v31;
  objc_msgSend(v33, "calculateControlEffort:", v34);
  v35 = (float)dword_1000A2A9C;
  v36 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v37 = v35 / 100.0;
  objc_msgSend(v36, "calculateControlEffort:", v37);
  v38 = (float)(int)qword_1000A2A7C;
  v39 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v40 = v38 / 100.0;
  objc_msgSend(v39, "calculateControlEffort:", v40);
  v41 = (float)SHIDWORD(qword_1000A2A7C);
  v42 = -[CommonProduct findComponent:](self, "findComponent:", 25);
  *(float *)&v43 = v41 / 100.0;
  objc_msgSend(v42, "calculateControlEffort:", v43);
  v44 = (float)dword_1000A2A84;
  v45 = -[CommonProduct findComponent:](self, "findComponent:", 26);
  *(float *)&v46 = v44 / 100.0;
  objc_msgSend(v45, "calculateControlEffort:", v46);
  v47 = (float)dword_1000A2A88;
  v48 = -[CommonProduct findComponent:](self, "findComponent:", 27);
  *(float *)&v49 = v47 / 100.0;
  objc_msgSend(v48, "calculateControlEffort:", v49);
  v50 = -[CommonProduct getChargerState](self, "getChargerState");
  if (v50 - 10 > 0x3C)
    goto LABEL_21;
  v51 = (float)(int)qword_1000A2A74;
  if (((1 << (v50 - 10)) & 0x1004010000100000) == 0)
  {
    if (v50 == 10)
    {
      v56 = -[CommonProduct findComponent:](self, "findComponent:", 28);
      *(float *)&v57 = v51 / 100.0;
LABEL_23:
      objc_msgSend(v56, "calculateControlEffort:", v57);
      v54 = -[CommonProduct findComponent:](self, "findComponent:", 29);
      LODWORD(v55) = 30.0;
      goto LABEL_24;
    }
LABEL_21:
    if (v50)
      return;
    v56 = -[CommonProduct findComponent:](self, "findComponent:", 28);
    LODWORD(v57) = 30.0;
    goto LABEL_23;
  }
  v52 = -[CommonProduct findComponent:](self, "findComponent:", 28);
  LODWORD(v53) = 30.0;
  objc_msgSend(v52, "calculateControlEffort:", v53);
  v54 = -[CommonProduct findComponent:](self, "findComponent:", 29);
  *(float *)&v55 = v51 / 100.0;
LABEL_24:
  objc_msgSend(v54, "calculateControlEffort:", v55);
}

- (id)getGridX
{
  return &off_100085780;
}

- (id)getGridY
{
  return &off_100085798;
}

- (int)compute2DGridTemps
{
  int v3;
  uint64_t v4;
  int v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  int32x4_t v10;
  uint64_t v11;
  int32x4_t v12;
  int32x4_t v13;

  v3 = -[tma9779bbe69693407a3d3988874266227 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = qword_1000A28B4;
  v5 = qword_1000A28C4;
  v6 = (double)dword_1000A28BC;
  v7 = (double)dword_1000A28C0;
  v8 = (double)dword_1000A2940;
  v9 = (int)((double)dword_1000A28BC * 1.01
           + -116.6
           + (double)dword_1000A28C0 * -0.31
           + (double)self->_filteredBacklightCurrentLI2 * 0.01
           + (double)dword_1000A2940 * 0.27);
  self->super.baseVT[0] = v9;
  self->super.baseVT[1] = (int)((double)SHIDWORD(v4) * -0.69
                              + -117.3
                              + v6 * 1.44
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.24);
  self->super.baseVT[2] = (int)((double)(int)v4 * 1.3
                              + -110.5
                              + (double)SHIDWORD(v4) * -0.55
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.24);
  self->super.baseVT[3] = (int)((double)(int)v4 * 1.35
                              + -46.7
                              + (double)SHIDWORD(v4) * -0.63
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.24);
  self->super.baseVT[4] = (int)((double)(int)v4 * 1.43
                              + -129.5
                              + (double)SHIDWORD(v4) * -0.75
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.27);
  self->super.baseVT[5] = (int)((double)v3 * 0.22
                              + -17.3
                              + (double)(int)v4 * 0.66
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.08);
  self->super.baseVT[6] = (int)((double)SHIDWORD(v4) * -0.29
                              + -85.6
                              + v6 * 0.95
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02
                              + v8 * 0.32);
  self->super.baseVT[7] = (int)((double)(int)v4 * 0.83
                              + -54.0
                              + (double)SHIDWORD(v4) * -0.25
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02
                              + v8 * 0.4);
  self->super.baseVT[8] = (int)((double)(int)v4 * 0.86
                              + -31.4
                              + (double)SHIDWORD(v4) * -0.33
                              + (double)self->_filteredBacklightCurrentLI2 * 0.02
                              + v8 * 0.44);
  self->super.baseVT[9] = (int)((double)SHIDWORD(v4) * -0.6
                              + -3.6
                              + v6 * 1.15
                              + (double)self->_filteredBacklightCurrentLI2 * 0.01
                              + v8 * 0.41);
  self->super.baseVT[10] = (int)((double)v3 * 0.44
                               + 121.8
                               + (double)SHIDWORD(v4) * 0.13
                               + v6 * 0.15
                               + (double)v5 * 0.2
                               + (double)self->_filteredBacklightCurrentLI2 * 0.01);
  self->super.baseVT[11] = (int)((double)v3 * 0.26
                               + -117.6
                               + (double)SHIDWORD(v4) * -0.18
                               + v6 * 0.61
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.31);
  self->super.baseVT[12] = (int)((double)v3 * 0.71
                               + 204.0
                               + v6 * 0.25
                               + v7 * -0.07
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02);
  self->super.baseVT[13] = (int)((double)v3 * 0.3
                               + -65.2
                               + (double)SHIDWORD(v4) * -0.39
                               + v6 * 0.71
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.35);
  self->super.baseVT[14] = (int)((double)v3 * 0.32
                               + -33.5
                               + (double)SHIDWORD(v4) * -0.41
                               + v6 * 0.7
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.34);
  self->super.baseVT[15] = (int)((double)v3 * 0.22
                               + -39.4
                               + (double)SHIDWORD(v4) * -0.14
                               + v6 * 0.31
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.59);
  self->super.baseVT[16] = (int)((double)v3 * 0.25
                               + -5.8
                               + (double)SHIDWORD(v4) * -0.26
                               + v6 * 0.43
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03
                               + v8 * 0.56);
  self->super.baseVT[17] = (int)((double)v3 * 0.29
                               + 10.3
                               + (double)SHIDWORD(v4) * -0.34
                               + v6 * 0.52
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03
                               + v8 * 0.52);
  self->super.baseVT[18] = (int)((double)v3 * 0.3
                               + 27.9
                               + (double)SHIDWORD(v4) * -0.38
                               + v6 * 0.56
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03
                               + v8 * 0.49);
  self->super.baseVT[19] = (int)((double)v3 * 0.31
                               + 27.6
                               + (double)SHIDWORD(v4) * -0.42
                               + v6 * 0.58
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03
                               + v8 * 0.49);
  self->super.baseVT[20] = (int)((double)v3 * 0.26
                               + -86.4
                               + v6 * 0.2
                               + (double)v5 * -0.41
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.95);
  self->super.baseVT[21] = (int)((double)(int)v4 * -0.73
                               + 76.4
                               + (double)SHIDWORD(v4) * -0.4
                               + v6 * 1.19
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03
                               + v8 * 0.92);
  self->super.baseVT[22] = (int)(v8 * 0.15
                               + 84.0
                               + v7 * -0.85
                               + (double)v5 * 1.64
                               + (double)self->_filteredBacklightCurrentLI2 * 0.03);
  self->super.baseVT[23] = (int)((double)v3 * 0.26
                               + 141.7
                               + (double)SHIDWORD(v4) * -0.47
                               + v6 * 0.57
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.59);
  self->super.baseVT[24] = (int)((double)v3 * 0.27
                               + 20.3
                               + (double)SHIDWORD(v4) * -0.72
                               + v6 * 0.85
                               + (double)self->_filteredBacklightCurrentLI2 * 0.02
                               + v8 * 0.56);
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

  v3 = -[tma9779bbe69693407a3d3988874266227 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
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
  v20[2] = sub_100018300;
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
