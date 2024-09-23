@implementation tm1abb817bd9d9587b77a661846b96f9e4

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  float v6;
  id v7;
  float v8;
  double v9;
  id v10;
  double v11;
  objc_super v12;

  v4 = HIDWORD(qword_1000A29AC);
  v5 = HIDWORD(qword_1000A29BC);
  v12.receiver = self;
  v12.super_class = (Class)tm1abb817bd9d9587b77a661846b96f9e4;
  -[tm408f6d8c14caf38138befe9f3b97ef02 updateAllThermalLoad:](&v12, "updateAllThermalLoad:", a3);
  sub_10002E350(63, (int)((double)v4 * 0.17 + -31.03 + (double)v5 * 0.83));
  v6 = (float)dword_1000A2AA8;
  v7 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  v8 = v6 / 100.0;
  *(float *)&v9 = v8;
  objc_msgSend(v7, "calculateControlEffort:", v9);
  v10 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v11 = v8;
  objc_msgSend(v10, "calculateControlEffort:", v11);
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
  v12[2] = sub_10000DA88;
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
