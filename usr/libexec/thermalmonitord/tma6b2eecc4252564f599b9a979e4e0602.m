@implementation tma6b2eecc4252564f599b9a979e4e0602

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tma6b2eecc4252564f599b9a979e4e0602;
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
  self->_filteredTempArc = -1;
  self->_filteredBacklightCurrentLI2 = -1;
  self->_filteredTP3R = -1;
  self->_filteredTP3R_2DGrid = -1;
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
  _BOOL4 v3;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  int filteredBacklightCurrentLI2;
  float v12;
  int v13;
  int v14;
  int filteredTempRearCameraDie;
  int v16;
  int filteredTempRearCameraDieWithDefault;
  int v18;
  int filteredTempArc;
  int filteredTP3R;
  id v21;
  float v22;
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
  float v39;
  double v40;
  id v41;
  double v42;
  float v43;
  id v44;
  float v45;
  double v46;
  id v47;
  double v48;
  float v49;
  id v50;
  double v51;
  float v52;
  id v53;
  double v54;
  float v55;
  id v56;
  double v57;
  unsigned int v58;
  id v59;
  double v60;
  id v61;
  double v62;
  float v63;
  id v64;
  double v65;
  float v66;
  id v67;
  double v68;
  float v69;
  id v70;
  double v71;
  float v72;
  id v73;
  double v74;
  id v75;
  double v76;
  id v77;
  double v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;

  v3 = a3;
  v5 = -[tma6b2eecc4252564f599b9a979e4e0602 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v6 = HIDWORD(qword_1000A29B4);
  v81 = __PAIR64__(HIDWORD(qword_1000A2A68), HIDWORD(qword_1000A29AC));
  v7 = qword_1000A29BC;
  v79 = __PAIR64__(qword_1000A29B4, HIDWORD(qword_1000A29BC));
  v9 = qword_1000A2A7C;
  v8 = HIDWORD(qword_1000A2A7C);
  if (v3)
    -[tma6b2eecc4252564f599b9a979e4e0602 resetVTFilterState](self, "resetVTFilterState", __PAIR64__(qword_1000A29B4, HIDWORD(qword_1000A29BC)), __PAIR64__(HIDWORD(qword_1000A2A68), HIDWORD(qword_1000A29AC)));
  v10 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0, v79), "currentLoadingIndex");
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  v12 = (double)(int)(v10 * v10) / 100.0;
  if (filteredBacklightCurrentLI2 >= 0)
    v12 = (float)filteredBacklightCurrentLI2 + (float)((float)(v12 - (float)filteredBacklightCurrentLI2) * 0.11111);
  self->_filteredBacklightCurrentLI2 = (int)v12;
  if (v9 <= v8)
    v13 = v8;
  else
    v13 = v9;
  v14 = v13 & ~(v13 >> 31);
  filteredTempRearCameraDie = self->_filteredTempRearCameraDie;
  if ((filteredTempRearCameraDie & 0x80000000) == 0)
    v14 = (int)(float)((float)filteredTempRearCameraDie + (float)((float)(v14 - filteredTempRearCameraDie) * 0.25));
  self->_filteredTempRearCameraDie = v14;
  if (v6 <= v9)
    v16 = v9;
  else
    v16 = v6;
  if (v16 <= v8)
    v16 = v8;
  filteredTempRearCameraDieWithDefault = self->_filteredTempRearCameraDieWithDefault;
  if ((filteredTempRearCameraDieWithDefault & 0x80000000) == 0)
    v16 = (int)(float)((float)filteredTempRearCameraDieWithDefault
                     + (float)((float)(v16 - filteredTempRearCameraDieWithDefault) * 0.25));
  self->_filteredTempRearCameraDieWithDefault = v16;
  v18 = qword_1000A2A74;
  filteredTempArc = self->_filteredTempArc;
  if ((filteredTempArc & 0x80000000) == 0)
    v18 = (int)(float)((float)filteredTempArc + (float)((float)(qword_1000A2A74 - filteredTempArc) * 0.16667));
  self->_filteredTempArc = v18;
  filteredTP3R = self->_filteredTP3R;
  if ((filteredTP3R & 0x80000000) == 0)
    v7 = (int)(float)((float)filteredTP3R + (float)((float)(v7 - filteredTP3R) * 0.14286));
  self->_filteredTP3R = v7;
  v21 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v22 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v23 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v24 = v23;
  *(float *)&v23 = v22;
  objc_msgSend(v21, "calculateControlEffort:trigger:", v23, v24);
  sub_10002E350(55, (int)((double)(int)v5 * 0.5+ -80.17+ (double)(int)v80 * 0.49+ (double)self->_filteredTempRearCameraDie * 0.01));
  sub_10002E350(54, (int)((double)(int)v5 * 0.45 + 222.2 + (double)SHIDWORD(v80) * 0.48));
  sub_10002E350(57, (int)((double)(int)v5 * 0.3 + -31.18 + (double)self->_filteredTP3R * 0.7));
  sub_10002E350(60, (int)((double)(int)v5 * 0.7 + 109.92 + (double)(int)v81 * 0.22));
  sub_10002E350(59, (int)((double)(int)v5 * 0.14+ 146.3+ (double)self->_filteredBacklightCurrentLI2 * 1.19+ (double)SHIDWORD(v81) * 0.83));
  sub_10002E350(56, (int)((double)(int)v5 * 0.61 + -49.44 + (double)self->_filteredTP3R * 0.38));
  sub_10002E350(58, (int)((double)(int)v5 * 0.64 + -15.28 + (double)self->_filteredTempRearCameraDieWithDefault * 0.32));
  sub_10002E350(62, (int)((double)SHIDWORD(v81) * 0.88+ 330.2+ (double)SHIDWORD(v80) * 0.08+ (double)self->_filteredTempArc * 0.02));
  sub_10002E350(63, v5);
  v25 = (float)dword_1000A2A84;
  v26 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v27 = v25 / 100.0;
  *(float *)&v28 = v27;
  objc_msgSend(v26, "calculateControlEffort:", v28);
  v29 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v30 = v27;
  objc_msgSend(v29, "calculateControlEffort:", v30);
  v31 = (float)dword_1000A2A88;
  v32 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  v33 = v31 / 100.0;
  *(float *)&v34 = v33;
  objc_msgSend(v32, "calculateControlEffort:", v34);
  v35 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v36 = v33;
  objc_msgSend(v35, "calculateControlEffort:", v36);
  v37 = (float)SHIDWORD(qword_1000A2A8C);
  v38 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  v39 = v37 / 100.0;
  *(float *)&v40 = v39;
  objc_msgSend(v38, "calculateControlEffort:", v40);
  v41 = -[CommonProduct findComponent:](self, "findComponent:", 32);
  *(float *)&v42 = v39;
  objc_msgSend(v41, "calculateControlEffort:", v42);
  v43 = (float)(int)qword_1000A2A8C;
  v44 = -[CommonProduct findComponent:](self, "findComponent:", 27);
  v45 = v43 / 100.0;
  *(float *)&v46 = v45;
  objc_msgSend(v44, "calculateControlEffort:", v46);
  v47 = -[CommonProduct findComponent:](self, "findComponent:", 33);
  *(float *)&v48 = v45;
  objc_msgSend(v47, "calculateControlEffort:", v48);
  v49 = (float)(int)qword_1000A2A94;
  v50 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v51 = v49 / 100.0;
  objc_msgSend(v50, "calculateControlEffort:", v51);
  v52 = (float)dword_1000A2AA4;
  v53 = -[CommonProduct findComponent:](self, "findComponent:", 25);
  *(float *)&v54 = v52 / 100.0;
  objc_msgSend(v53, "calculateControlEffort:", v54);
  v55 = (float)SHIDWORD(qword_1000A2A94);
  v56 = -[CommonProduct findComponent:](self, "findComponent:", 26);
  *(float *)&v57 = v55 / 100.0;
  objc_msgSend(v56, "calculateControlEffort:", v57);
  v58 = -[CommonProduct getChargerState](self, "getChargerState");
  if (v58 - 10 > 0x3C)
    goto LABEL_26;
  if (((1 << (v58 - 10)) & 0x1004010000100000) == 0)
  {
    if (v58 == 10)
    {
      v69 = (float)SHIDWORD(qword_1000A2A8C);
      v70 = -[CommonProduct findComponent:](self, "findComponent:", 28);
      *(float *)&v71 = v69 / 100.0;
      objc_msgSend(v70, "calculateControlEffort:", v71);
      v72 = (float)(int)qword_1000A2A8C;
      v73 = -[CommonProduct findComponent:](self, "findComponent:", 29);
      *(float *)&v74 = v72 / 100.0;
LABEL_28:
      objc_msgSend(v73, "calculateControlEffort:", v74);
      v77 = -[CommonProduct findComponent:](self, "findComponent:", 30);
      LODWORD(v78) = 30.0;
      objc_msgSend(v77, "calculateControlEffort:", v78);
      v67 = -[CommonProduct findComponent:](self, "findComponent:", 31);
      LODWORD(v68) = 30.0;
      goto LABEL_29;
    }
LABEL_26:
    if (v58)
      return;
    v75 = -[CommonProduct findComponent:](self, "findComponent:", 28);
    LODWORD(v76) = 30.0;
    objc_msgSend(v75, "calculateControlEffort:", v76);
    v73 = -[CommonProduct findComponent:](self, "findComponent:", 29);
    LODWORD(v74) = 30.0;
    goto LABEL_28;
  }
  v59 = -[CommonProduct findComponent:](self, "findComponent:", 28);
  LODWORD(v60) = 30.0;
  objc_msgSend(v59, "calculateControlEffort:", v60);
  v61 = -[CommonProduct findComponent:](self, "findComponent:", 29);
  LODWORD(v62) = 30.0;
  objc_msgSend(v61, "calculateControlEffort:", v62);
  v63 = (float)SHIDWORD(qword_1000A2A8C);
  v64 = -[CommonProduct findComponent:](self, "findComponent:", 30);
  *(float *)&v65 = v63 / 100.0;
  objc_msgSend(v64, "calculateControlEffort:", v65);
  v66 = (float)(int)qword_1000A2A8C;
  v67 = -[CommonProduct findComponent:](self, "findComponent:", 31);
  *(float *)&v68 = v66 / 100.0;
LABEL_29:
  objc_msgSend(v67, "calculateControlEffort:", v68);
}

- (id)getGridX
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011C98;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_10009A388 != -1)
    dispatch_once(&qword_10009A388, block);
  return self->gridX;
}

- (id)getGridY
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011D54;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_10009A390 != -1)
    dispatch_once(&qword_10009A390, block);
  return self->gridY;
}

- (int)compute2DGridTemps
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int filteredTP3R_2DGrid;
  int32x2_t v10;
  int32x4_t v11;
  uint64_t v12;
  int32x4_t v13;
  int32x4_t v14;

  v3 = -[tma6b2eecc4252564f599b9a979e4e0602 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v5 = HIDWORD(qword_1000A29AC);
  v4 = qword_1000A29B4;
  v6 = qword_1000A29BC;
  v7 = dword_1000A29C4;
  v8 = HIDWORD(qword_1000A2A68);
  filteredTP3R_2DGrid = self->_filteredTP3R_2DGrid;
  if ((filteredTP3R_2DGrid & 0x80000000) == 0)
    v6 = (int)(float)((float)filteredTP3R_2DGrid + (float)((float)(qword_1000A29BC - filteredTP3R_2DGrid) * 0.33333));
  self->_filteredTP3R_2DGrid = v6;
  v10 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060600, (float64x2_t)xmmword_1000605F0, (double)v3), (float64x2_t)xmmword_100060610, (double)v5), (float64x2_t)xmmword_100060620, (double)v8)));
  *(int32x2_t *)self->super.baseVT = v10;
  *(int32x2_t *)&self->super.baseVT[2] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060640, (float64x2_t)xmmword_100060630, (double)v3), (float64x2_t)xmmword_100060650, (double)v5), (float64x2_t)xmmword_100060660, (double)v8)));
  self->super.baseVT[4] = (int)((double)v5 * 0.55 + -165.0 + (double)v8 * 0.48);
  *(int32x2_t *)&self->super.baseVT[5] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060680, (float64x2_t)xmmword_100060670, (double)v3), (float64x2_t)xmmword_100060690, (double)v5), (float64x2_t)xmmword_1000606A0, (double)v8)));
  *(int32x2_t *)&self->super.baseVT[7] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000606C0, (float64x2_t)xmmword_1000606B0, (double)v3), (float64x2_t)xmmword_1000606D0, (double)v5), (float64x2_t)xmmword_1000606E0, (double)v8)));
  self->super.baseVT[9] = (int)((double)v5 * 0.13 + -262.0 + (double)v4 * 0.34 + (double)v8 * 0.59);
  *(int32x2_t *)&self->super.baseVT[10] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000606F0, (float64x2_t)vdupq_n_s64(0x3FD1DB22D0E56042uLL), (double)v3), (float64x2_t)xmmword_100060700, (double)v5), (float64x2_t)xmmword_100060710, (double)v8)));
  *(int32x2_t *)&self->super.baseVT[12] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060730, (float64x2_t)xmmword_100060720, (double)v3), (float64x2_t)xmmword_100060740, (double)v5), (float64x2_t)xmmword_100060750, (double)v8)));
  self->super.baseVT[14] = (int)((double)v5 * 0.09
                               + -293.0
                               + (double)self->_filteredTP3R_2DGrid * 0.29
                               + (double)v8 * 0.71);
  *(int32x2_t *)&self->super.baseVT[15] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100060770, (float64x2_t)xmmword_100060760, (double)v3), (float64x2_t)xmmword_100060780, (double)v8)));
  *(int32x2_t *)&self->super.baseVT[17] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000607A0, (float64x2_t)xmmword_100060790, (double)v3), (float64x2_t)xmmword_1000607B0, (double)v8)));
  self->super.baseVT[19] = (int)((double)v3 * 0.13 + -142.0 + (double)v7 * 0.01 + (double)v8 * 0.91);
  self->super.baseVT[20] = (int)((double)v3 * -0.148 + -208.0 + (double)v8 * 1.23);
  self->super.baseVT[21] = (int)((double)self->_filteredTP3R_2DGrid * -0.02 + -92.1 + (double)v8 * 1.07);
  self->super.baseVT[22] = (int)((double)v3 * -0.01 + -21.0 + (double)v8 * 1.05);
  self->super.baseVT[23] = (int)((double)v3 * 0.07 + 13.1 + (double)v5 * -0.05 + (double)v8 * 1.02);
  self->super.baseVT[24] = (int)((double)v3 * -0.02 + -118.0 + (double)v7 * -0.04 + (double)v8 * 1.13);
  v11 = vdupq_lane_s32(v10, 0);
  v12 = 1;
  v13 = v11;
  do
  {
    v14 = *(int32x4_t *)&self->super.baseVT[v12];
    v13 = vminq_s32(v13, v14);
    v11 = vmaxq_s32(v11, v14);
    v12 += 4;
  }
  while (v12 != 25);
  sub_10002E350(61, (vmaxvq_s32(v11) - vminvq_s32(v13)));
  return self->super.baseVT;
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

  v3 = -[tma6b2eecc4252564f599b9a979e4e0602 gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v12 = dword_1000A2A9C;
  v13 = dword_1000A2AA0;
  v4 = dword_1000A2AA8;
  v6 = dword_1000A2A88;
  v5 = qword_1000A2A8C;
  v7 = qword_1000A2A94;
  v8 = *(uint64_t *)((char *)&qword_1000A29AC + 4);
  v9 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v10 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v11 = -[CommonProduct getChargerState](self, "getChargerState");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000122BC;
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
