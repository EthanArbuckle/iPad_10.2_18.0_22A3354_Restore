@implementation tm02cd0d89343c2a73d6860abb70b388bd

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tm02cd0d89343c2a73d6860abb70b388bd;
  v3 = -[CommonProduct initProduct:](&v6, "initProduct:", a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "resetVTFilterState");
  return v4;
}

- (void)resetVTFilterState
{
  self->_filteredBacklightCurrentLI2 = -1;
  self->_filteredArcModuleTemperature = -1;
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
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  float v12;
  int filteredBacklightCurrentLI2;
  int filteredArcModuleTemperature;
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
  double v45;
  float v46;
  id v47;
  double v48;
  float v49;
  id v50;
  double v51;
  unsigned int v52;
  id v53;
  double v54;
  id v55;
  double v56;
  float v57;
  id v58;
  double v59;
  float v60;
  id v61;
  double v62;
  float v63;
  id v64;
  double v65;
  float v66;
  id v67;
  double v68;
  id v69;
  double v70;
  id v71;
  double v72;
  int v73;

  v3 = a3;
  v5 = -[tm02cd0d89343c2a73d6860abb70b388bd gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v6 = HIDWORD(qword_1000A29AC);
  v73 = qword_1000A29B4;
  v8 = HIDWORD(qword_1000A29B4);
  v7 = qword_1000A29BC;
  v9 = HIDWORD(qword_1000A29BC);
  v10 = -[tm02cd0d89343c2a73d6860abb70b388bd arcModuleTemperature](self, "arcModuleTemperature");
  if (v3)
    -[tm02cd0d89343c2a73d6860abb70b388bd resetVTFilterState](self, "resetVTFilterState");
  v11 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 0), "currentLoadingIndex");
  v12 = (double)(int)(v11 * v11) / 100.0;
  filteredBacklightCurrentLI2 = self->_filteredBacklightCurrentLI2;
  if (filteredBacklightCurrentLI2 >= 0)
    v12 = (float)filteredBacklightCurrentLI2 + (float)((float)(v12 - (float)filteredBacklightCurrentLI2) * 0.076923);
  self->_filteredBacklightCurrentLI2 = (int)v12;
  filteredArcModuleTemperature = self->_filteredArcModuleTemperature;
  if ((filteredArcModuleTemperature & 0x80000000) == 0)
    v10 = (int)(float)((float)filteredArcModuleTemperature
                     + (float)((float)(v10 - filteredArcModuleTemperature) * 0.14286));
  self->_filteredArcModuleTemperature = v10;
  v15 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v16 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v17 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v18 = v17;
  *(float *)&v17 = v16;
  objc_msgSend(v15, "calculateControlEffort:trigger:", v17, v18);
  sub_10002E350(53, (int)((double)(int)v5 * 0.5 + 146.1 + (double)v9 * 0.42));
  sub_10002E350(52, (int)((double)(int)v5 * 0.46 + 152.1 + (double)v8 * 0.51));
  sub_10002E350(60, (int)((double)self->_filteredBacklightCurrentLI2 * -0.76 + 37.1 + (double)v6 * 0.96));
  sub_10002E350(57, (int)((double)self->_filteredBacklightCurrentLI2 * 9.57 + 635.0 + (double)v6 * 0.74));
  sub_10002E350(54, (int)((double)(int)v5 * 0.85 + -233.1 + (double)v8 * 0.05 + (double)v7 * 0.15));
  sub_10002E350(55, (int)((double)(int)v5 * 0.71 + 177.4 + (double)v8 * 0.1 + (double)v7 * 0.15));
  sub_10002E350(56, (int)((double)(int)v5 * 0.64 + 45.16 + (double)v8 * 0.32));
  sub_10002E350(58, (int)((double)v6 * 1.11+ -192.0+ (double)v73 * -0.09+ (double)self->_filteredArcModuleTemperature * 0.019));
  sub_10002E350(59, v5);
  v19 = (float)(int)qword_1000A2A7C;
  v20 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v21 = v19 / 100.0;
  *(float *)&v22 = v21;
  objc_msgSend(v20, "calculateControlEffort:", v22);
  v23 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v24 = v21;
  objc_msgSend(v23, "calculateControlEffort:", v24);
  v25 = (float)SHIDWORD(qword_1000A2A7C);
  v26 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  v27 = v25 / 100.0;
  *(float *)&v28 = v27;
  objc_msgSend(v26, "calculateControlEffort:", v28);
  v29 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v30 = v27;
  objc_msgSend(v29, "calculateControlEffort:", v30);
  v31 = (float)dword_1000A2A88;
  v32 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  v33 = v31 / 100.0;
  *(float *)&v34 = v33;
  objc_msgSend(v32, "calculateControlEffort:", v34);
  v35 = -[CommonProduct findComponent:](self, "findComponent:", 32);
  *(float *)&v36 = v33;
  objc_msgSend(v35, "calculateControlEffort:", v36);
  v37 = (float)dword_1000A2A84;
  v38 = -[CommonProduct findComponent:](self, "findComponent:", 27);
  v39 = v37 / 100.0;
  *(float *)&v40 = v39;
  objc_msgSend(v38, "calculateControlEffort:", v40);
  v41 = -[CommonProduct findComponent:](self, "findComponent:", 33);
  *(float *)&v42 = v39;
  objc_msgSend(v41, "calculateControlEffort:", v42);
  v43 = (float)(int)qword_1000A2A8C;
  v44 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v45 = v43 / 100.0;
  objc_msgSend(v44, "calculateControlEffort:", v45);
  v46 = (float)(int)qword_1000A2A94;
  v47 = -[CommonProduct findComponent:](self, "findComponent:", 25);
  *(float *)&v48 = v46 / 100.0;
  objc_msgSend(v47, "calculateControlEffort:", v48);
  v49 = (float)SHIDWORD(qword_1000A2A8C);
  v50 = -[CommonProduct findComponent:](self, "findComponent:", 26);
  *(float *)&v51 = v49 / 100.0;
  objc_msgSend(v50, "calculateControlEffort:", v51);
  v52 = -[CommonProduct getChargerState](self, "getChargerState");
  if (v52 - 10 > 0x3C)
    goto LABEL_12;
  if (((1 << (v52 - 10)) & 0x1004010000100000) == 0)
  {
    if (v52 == 10)
    {
      v63 = (float)dword_1000A2A88;
      v64 = -[CommonProduct findComponent:](self, "findComponent:", 28);
      *(float *)&v65 = v63 / 100.0;
      objc_msgSend(v64, "calculateControlEffort:", v65);
      v66 = (float)dword_1000A2A84;
      v67 = -[CommonProduct findComponent:](self, "findComponent:", 29);
      *(float *)&v68 = v66 / 100.0;
LABEL_14:
      objc_msgSend(v67, "calculateControlEffort:", v68);
      v71 = -[CommonProduct findComponent:](self, "findComponent:", 30);
      LODWORD(v72) = 30.0;
      objc_msgSend(v71, "calculateControlEffort:", v72);
      v61 = -[CommonProduct findComponent:](self, "findComponent:", 31);
      LODWORD(v62) = 30.0;
      goto LABEL_15;
    }
LABEL_12:
    if (v52)
      return;
    v69 = -[CommonProduct findComponent:](self, "findComponent:", 28);
    LODWORD(v70) = 30.0;
    objc_msgSend(v69, "calculateControlEffort:", v70);
    v67 = -[CommonProduct findComponent:](self, "findComponent:", 29);
    LODWORD(v68) = 30.0;
    goto LABEL_14;
  }
  v53 = -[CommonProduct findComponent:](self, "findComponent:", 28);
  LODWORD(v54) = 30.0;
  objc_msgSend(v53, "calculateControlEffort:", v54);
  v55 = -[CommonProduct findComponent:](self, "findComponent:", 29);
  LODWORD(v56) = 30.0;
  objc_msgSend(v55, "calculateControlEffort:", v56);
  v57 = (float)dword_1000A2A88;
  v58 = -[CommonProduct findComponent:](self, "findComponent:", 30);
  *(float *)&v59 = v57 / 100.0;
  objc_msgSend(v58, "calculateControlEffort:", v59);
  v60 = (float)dword_1000A2A84;
  v61 = -[CommonProduct findComponent:](self, "findComponent:", 31);
  *(float *)&v62 = v60 / 100.0;
LABEL_15:
  objc_msgSend(v61, "calculateControlEffort:", v62);
}

- (void)updateCoreAnalyticsInfo
{
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  _QWORD v13[4];
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned __int8 v25;

  v3 = -[tm02cd0d89343c2a73d6860abb70b388bd gasGaugeBatteryTemperature](self, "gasGaugeBatteryTemperature");
  v4 = HIDWORD(qword_1000A2A7C);
  v5 = dword_1000A2A84;
  v7 = qword_1000A2A8C;
  v6 = HIDWORD(qword_1000A2A8C);
  v8 = qword_1000A29B4;
  v9 = *(uint64_t *)((char *)&qword_1000A2A94 + 4);
  v10 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v11 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v12 = -[CommonProduct getChargerState](self, "getChargerState");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003DB8C;
  v13[3] = &unk_10007D080;
  v14 = v3;
  v15 = v8;
  v16 = v10;
  v17 = v11;
  v18 = v7;
  v19 = v5;
  v20 = v9;
  v21 = v4;
  v22 = v6;
  v25 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v23 = v12;
  v24 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v13);
}

@end
