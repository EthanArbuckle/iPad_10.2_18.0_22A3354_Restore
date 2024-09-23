@implementation tma603bec8e9fff217df1da4b628b0272a

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  int v6;
  float v7;
  id v8;
  float v9;
  double v10;
  id v11;
  double v12;
  objc_super v13;

  v4 = qword_1000A29AC;
  v5 = qword_1000A29BC;
  v6 = dword_1000A29D4;
  v13.receiver = self;
  v13.super_class = (Class)tma603bec8e9fff217df1da4b628b0272a;
  -[tm91a569e8580a631617d0559c35066014 updateAllThermalLoad:](&v13, "updateAllThermalLoad:", a3);
  sub_10002E350(63, (int)((double)v4 * 0.16 + -68.02 + (double)v5 * 0.21 + (double)v6 * 0.63));
  v7 = (float)dword_1000A2AA8;
  v8 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  v9 = v7 / 100.0;
  *(float *)&v10 = v9;
  objc_msgSend(v8, "calculateControlEffort:", v10);
  v11 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v12 = v9;
  objc_msgSend(v11, "calculateControlEffort:", v12);
}

- (void)updateCoreAnalyticsInfo
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int32x2_t v8;
  unsigned __int8 v9;
  unsigned int v10;
  unsigned int v11;
  _QWORD v12[5];
  int v13;
  int32x2_t v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned __int8 v22;

  v3 = HIDWORD(qword_1000A2A8C);
  v4 = dword_1000A2A9C;
  v5 = dword_1000A29C4;
  v6 = dword_1000A2AA8;
  v7 = *(_QWORD *)&dword_1000A2A88;
  v8 = (int32x2_t)qword_1000A2A94;
  v9 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v10 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v11 = -[CommonProduct getChargerState](self, "getChargerState");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003B4F8;
  v12[3] = &unk_10007D0C0;
  v12[4] = v7;
  v13 = v3;
  v14 = vrev64_s32(v8);
  v15 = v4;
  v16 = v5;
  v17 = v6;
  v18 = v10;
  v19 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v20 = v11;
  v22 = v9;
  v21 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v12);
}

@end
