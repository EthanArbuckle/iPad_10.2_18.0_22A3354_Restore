@implementation tm71ea1d52d4b62b0d91147eed52e11fbb

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm71ea1d52d4b62b0d91147eed52e11fbb;
  v3 = -[CommonProduct initProduct:](&v6, "initProduct:", a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "resetVTFilterState");
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredTempRearCameraDie = -1;
  self->_filteredTempRearCameraDieWithDefault = -1;
  self->_filteredBacklightCurrentLI2 = -1;
  self->_filteredArcModuleTemperature = -1;
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000A29AC;
}

- (int)arcModuleTemperature
{
  return qword_1000A2A74;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int filteredTempRearCameraDie;
  int v13;
  int filteredTempRearCameraDieWithDefault;
  unsigned int v15;
  float v16;
  int filteredBacklightCurrentLI2;
  int v18;
  int filteredArcModuleTemperature;
  id v20;
  float v21;
  double v22;
  double v23;
  float v24;
  id v25;
  float v26;
  double v27;
  id v28;
  double v29;
  float v30;
  id v31;
  float v32;
  double v33;
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
  float v44;
  double v45;
  id v46;
  double v47;
  float v48;
  id v49;
  double v50;
  float v51;
  id v52;
  double v53;
  float v54;
  id v55;
  double v56;
  unsigned int v57;
  id v58;
  double v59;
  id v60;
  double v61;
  float v62;
  id v63;
  double v64;
  float v65;
  id v66;
  double v67;
  float v68;
  id v69;
  double v70;
  float v71;
  id v72;
  double v73;
  id v74;
  double v75;
  tm71ea1d52d4b62b0d91147eed52e11fbb *v76;
  uint64_t v77;
  id v78;
  double v79;
  id v80;
  double v81;
  id v82;
  double v83;
  unint64_t v84;
  uint64_t v85;
  int v86;
  int v87;

  v4 = qword_1000A29AC;
  v5 = qword_1000A29B4;
  v84 = __PAIR64__(HIDWORD(qword_1000A29B4), HIDWORD(qword_1000A29AC));
  v6 = qword_1000A29BC;
  v7 = dword_1000A29C4;
  v9 = qword_1000A2A7C;
  v8 = HIDWORD(qword_1000A2A7C);
  v86 = HIDWORD(qword_1000A2A68);
  v87 = HIDWORD(qword_1000A29BC);
  if (a3)
    -[tm71ea1d52d4b62b0d91147eed52e11fbb resetVTFilterState](self, "resetVTFilterState");
  if (v9 <= v8)
    v10 = v8;
  else
    v10 = v9;
  v11 = v10 & ~(v10 >> 31);
  filteredTempRearCameraDie = self->_filteredTempRearCameraDie;
  if ((filteredTempRearCameraDie & 0x80000000) == 0)
    v11 = (int)(float)((float)filteredTempRearCameraDie + (float)((float)(v11 - filteredTempRearCameraDie) * 0.25));
  self->_filteredTempRearCameraDie = v11;
  if (v6 <= v9)
    v13 = v9;
  else
    v13 = v6;
  if (v13 <= v8)
    v13 = v8;
  filteredTempRearCameraDieWithDefault = self->_filteredTempRearCameraDieWithDefault;
  if ((filteredTempRearCameraDieWithDefault & 0x80000000) == 0)
    v13 = (int)(float)((float)filteredTempRearCameraDieWithDefault
                     + (float)((float)(v13 - filteredTempRearCameraDieWithDefault) * 0.25));
  self->_filteredTempRearCameraDieWithDefault = v13;
  v15 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0, v84), "currentLoadingIndex");
  v16 = (double)(int)(v15 * v15) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0)
    v16 = (float)filteredBacklightCurrentLI2 + (float)((float)(v16 - (float)filteredBacklightCurrentLI2) * 0.14286);
  self->_filteredBacklightCurrentLI2 = (int)v16;
  v18 = qword_1000A2A74 & ~((int)qword_1000A2A74 >> 31);
  filteredArcModuleTemperature = self->_filteredArcModuleTemperature;
  if ((filteredArcModuleTemperature & 0x80000000) == 0)
    v18 = (int)(float)((float)filteredArcModuleTemperature
                     + (float)((float)(v18 - filteredArcModuleTemperature) * 0.16667));
  self->_filteredArcModuleTemperature = v18;
  v20 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v21 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v22 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v23 = v22;
  *(float *)&v22 = v21;
  objc_msgSend(v20, "calculateControlEffort:trigger:", v22, v23);
  sub_10002E350(55, (int)((double)(int)v4 * 0.44+ -10.62+ (double)v7 * 0.52+ (double)self->_filteredTempRearCameraDie * 0.021));
  sub_10002E350(54, (int)((double)v5 * 0.61 + 144.25 + (double)v7 * 0.32));
  sub_10002E350(60, (int)((double)(int)v85 * 1.01 + -106.0 + (double)SHIDWORD(v85) * -0.02));
  sub_10002E350(59, (int)((double)v86 * 0.59+ -30.85+ (double)self->_filteredBacklightCurrentLI2 * 0.85+ (double)(int)v4 * 0.4));
  sub_10002E350(56, (int)((double)(int)v85 * 0.37 + -63.16 + (double)v87 * 0.59));
  sub_10002E350(57, (int)((double)v5 * 0.58 + -74.85 + (double)v87 * 0.4));
  sub_10002E350(58, (int)((double)(int)v85 * 0.64 + -1.74 + (double)self->_filteredTempRearCameraDieWithDefault * 0.32));
  sub_10002E350(62, (int)((double)v86 * 0.82+ 330.2+ (double)SHIDWORD(v85) * 0.08+ (double)self->_filteredArcModuleTemperature * 0.05));
  sub_10002E350(63, v4);
  v24 = (float)dword_1000A2A84;
  v25 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v26 = v24 / 100.0;
  *(float *)&v27 = v26;
  objc_msgSend(v25, "calculateControlEffort:", v27);
  v28 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v29 = v26;
  objc_msgSend(v28, "calculateControlEffort:", v29);
  v30 = (float)dword_1000A2A88;
  v31 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  v32 = v30 / 100.0;
  *(float *)&v33 = v32;
  objc_msgSend(v31, "calculateControlEffort:", v33);
  v34 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v35 = v32;
  objc_msgSend(v34, "calculateControlEffort:", v35);
  v36 = (float)SHIDWORD(qword_1000A2A8C);
  v37 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  v38 = v36 / 100.0;
  *(float *)&v39 = v38;
  objc_msgSend(v37, "calculateControlEffort:", v39);
  v40 = -[CommonProduct findComponent:](self, "findComponent:", 28);
  *(float *)&v41 = v38;
  objc_msgSend(v40, "calculateControlEffort:", v41);
  v42 = (float)(int)qword_1000A2A8C;
  v43 = -[CommonProduct findComponent:](self, "findComponent:", 27);
  v44 = v42 / 100.0;
  *(float *)&v45 = v44;
  objc_msgSend(v43, "calculateControlEffort:", v45);
  v46 = -[CommonProduct findComponent:](self, "findComponent:", 29);
  *(float *)&v47 = v44;
  objc_msgSend(v46, "calculateControlEffort:", v47);
  v48 = (float)(int)qword_1000A2A94;
  v49 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v50 = v48 / 100.0;
  objc_msgSend(v49, "calculateControlEffort:", v50);
  v51 = (float)dword_1000A2AA4;
  v52 = -[CommonProduct findComponent:](self, "findComponent:", 25);
  *(float *)&v53 = v51 / 100.0;
  objc_msgSend(v52, "calculateControlEffort:", v53);
  v54 = (float)SHIDWORD(qword_1000A2A94);
  v55 = -[CommonProduct findComponent:](self, "findComponent:", 26);
  *(float *)&v56 = v54 / 100.0;
  objc_msgSend(v55, "calculateControlEffort:", v56);
  v57 = -[CommonProduct getChargerState](self, "getChargerState");
  if (v57 - 10 > 0x3C)
    goto LABEL_24;
  if (((1 << (v57 - 10)) & 0x1004010000100000) == 0)
  {
    if (v57 == 10)
    {
      v68 = (float)SHIDWORD(qword_1000A2A8C);
      v69 = -[CommonProduct findComponent:](self, "findComponent:", 32);
      *(float *)&v70 = v68 / 100.0;
      objc_msgSend(v69, "calculateControlEffort:", v70);
      v71 = (float)(int)qword_1000A2A8C;
      v72 = -[CommonProduct findComponent:](self, "findComponent:", 33);
      *(float *)&v73 = v71 / 100.0;
      objc_msgSend(v72, "calculateControlEffort:", v73);
      v74 = -[CommonProduct findComponent:](self, "findComponent:", 30);
      LODWORD(v75) = 30.0;
      objc_msgSend(v74, "calculateControlEffort:", v75);
      v76 = self;
      v77 = 31;
LABEL_26:
      v66 = -[CommonProduct findComponent:](v76, "findComponent:", v77);
      LODWORD(v67) = 30.0;
      goto LABEL_27;
    }
LABEL_24:
    if (v57)
      return;
    v78 = -[CommonProduct findComponent:](self, "findComponent:", 30);
    LODWORD(v79) = 30.0;
    objc_msgSend(v78, "calculateControlEffort:", v79);
    v80 = -[CommonProduct findComponent:](self, "findComponent:", 31);
    LODWORD(v81) = 30.0;
    objc_msgSend(v80, "calculateControlEffort:", v81);
    v82 = -[CommonProduct findComponent:](self, "findComponent:", 32);
    LODWORD(v83) = 30.0;
    objc_msgSend(v82, "calculateControlEffort:", v83);
    v76 = self;
    v77 = 33;
    goto LABEL_26;
  }
  v58 = -[CommonProduct findComponent:](self, "findComponent:", 32);
  LODWORD(v59) = 30.0;
  objc_msgSend(v58, "calculateControlEffort:", v59);
  v60 = -[CommonProduct findComponent:](self, "findComponent:", 33);
  LODWORD(v61) = 30.0;
  objc_msgSend(v60, "calculateControlEffort:", v61);
  v62 = (float)SHIDWORD(qword_1000A2A8C);
  v63 = -[CommonProduct findComponent:](self, "findComponent:", 30);
  *(float *)&v64 = v62 / 100.0;
  objc_msgSend(v63, "calculateControlEffort:", v64);
  v65 = (float)(int)qword_1000A2A8C;
  v66 = -[CommonProduct findComponent:](self, "findComponent:", 31);
  *(float *)&v67 = v65 / 100.0;
LABEL_27:
  objc_msgSend(v66, "calculateControlEffort:", v67);
}

- (id)getGridX
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045D10;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_1000A2408 != -1)
    dispatch_once(&qword_1000A2408, block);
  return self->gridX;
}

- (id)getGridY
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045DCC;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_1000A2410 != -1)
    dispatch_once(&qword_1000A2410, block);
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
  int *baseVT;
  int32x2_t v10;
  int32x2_t v11;
  int32x4_t v12;
  uint64_t v13;
  int32x4_t v14;
  int32x4_t v15;

  v3 = -[tm71ea1d52d4b62b0d91147eed52e11fbb gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = HIDWORD(qword_1000A29B4);
  v6 = HIDWORD(qword_1000A29BC);
  v5 = dword_1000A29C4;
  v7 = (double)(int)qword_1000A29B4;
  v8 = (double)SHIDWORD(qword_1000A2A68);
  baseVT = self->super.baseVT;
  v10 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060600, (float64x2_t)xmmword_1000605F0, (double)v3), (float64x2_t)xmmword_100060610, (double)(int)qword_1000A29B4), (float64x2_t)xmmword_100060620, (double)SHIDWORD(qword_1000A2A68))));
  v11 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100061DE0, (float64x2_t)xmmword_100060630, (double)v3), (float64x2_t)xmmword_100061DF0, (double)(int)qword_1000A29B4), (float64x2_t)xmmword_100061E00, (double)SHIDWORD(qword_1000A2A68))));
  *(int32x2_t *)baseVT = v10;
  *((int32x2_t *)baseVT + 1) = v11;
  baseVT[4] = (int)(v7 * 0.55 + -135.0 + v8 * 0.42);
  *(int32x2_t *)(baseVT + 5) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100061E10, (float64x2_t)xmmword_100060670, (double)v3), (float64x2_t)xmmword_100061E20, v7), (float64x2_t)xmmword_1000606A0, v8)));
  *(int32x2_t *)(baseVT + 7) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100061E30, (float64x2_t)xmmword_1000606B0, (double)v3), (float64x2_t)xmmword_100061E40, v7), (float64x2_t)xmmword_1000606E0, v8)));
  baseVT[9] = (int)(v7 * 0.13 + -262.0 + (double)v4 * 0.34 + v8 * 0.59);
  *((int32x2_t *)baseVT + 5) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000606F0, (float64x2_t)vdupq_n_s64(0x3FD1DB22D0E56042uLL), (double)v3), (float64x2_t)xmmword_100060700, v7), (float64x2_t)xmmword_100060710, v8)));
  *((int32x2_t *)baseVT + 6) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060730, (float64x2_t)xmmword_100060720, (double)v3), (float64x2_t)xmmword_100061E50, v7), (float64x2_t)xmmword_100061E60, v8)));
  baseVT[14] = (int)(v7 * 0.1 + -243.0 + (double)v6 * 0.29 + v8 * 0.71);
  *(int32x2_t *)(baseVT + 15) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100061E80, (float64x2_t)xmmword_100061E70, (double)v3), (float64x2_t)xmmword_100061E90, v8)));
  *(int32x2_t *)(baseVT + 17) = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000607A0, (float64x2_t)xmmword_100060790, (double)v3), (float64x2_t)xmmword_100061EA0, v8)));
  baseVT[19] = (int)((double)v3 * 0.13 + -142.0 + (double)v5 * 0.01 + v8 * 0.91);
  baseVT[20] = (int)((double)v3 * -0.148 + 3.0 + v8 * 1.13);
  baseVT[21] = (int)((double)v6 * -0.02 + -92.1 + v8 * 1.05);
  baseVT[22] = (int)((double)v3 * -0.01 + -21.0 + v8 * 1.05);
  baseVT[23] = (int)((double)v3 * 0.07 + 13.1 + v7 * -0.05 + v8 * 0.99);
  baseVT[24] = (int)((double)v3 * -0.02 + -118.0 + (double)v5 * -0.04 + v8 * 1.13);
  v12 = vdupq_lane_s32(v10, 0);
  v13 = 1;
  v14 = v12;
  do
  {
    v15 = *(int32x4_t *)&baseVT[v13];
    v12 = vminq_s32(v12, v15);
    v14 = vmaxq_s32(v14, v15);
    v13 += 4;
  }
  while (v13 != 25);
  sub_10002E350(61, (vmaxvq_s32(v14) - vminvq_s32(v12)));
  return baseVT;
}

- (void)updateCoreAnalyticsInfo
{
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  _QWORD v14[4];
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned __int8 v27;

  v3 = -[tm71ea1d52d4b62b0d91147eed52e11fbb gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v12 = dword_1000A2A9C;
  v13 = dword_1000A2AA0;
  v4 = dword_1000A2AA8;
  v6 = dword_1000A2A88;
  v5 = qword_1000A2A8C;
  v7 = qword_1000A2A94;
  v8 = qword_1000A29B4;
  v9 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v10 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v11 = -[CommonProduct getChargerState](self, "getChargerState");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000462E0;
  v14[3] = &unk_10007D080;
  v15 = v3;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = v7;
  v20 = v5;
  v21 = v4;
  v22 = v12;
  v23 = v6;
  v24 = v13;
  v27 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v25 = v11;
  v26 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v14);
}

@end
