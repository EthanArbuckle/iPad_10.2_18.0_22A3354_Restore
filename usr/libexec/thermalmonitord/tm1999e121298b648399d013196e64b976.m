@implementation tm1999e121298b648399d013196e64b976

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  int v6;
  int v7;
  id v8;
  double v9;
  float v10;
  id v11;
  float v12;
  double v13;
  id v14;
  double v15;
  id v16;
  double v17;

  v4 = qword_1000A29AC;
  v5 = qword_1000A29BC;
  v6 = dword_1000A29C8;
  v7 = dword_1000A29CC;
  v8 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v9 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  *(float *)&v9 = v9;
  objc_msgSend(v8, "calculateControlEffort:", v9);
  sub_10002E350(31, (int)((double)v5 * 1.06 + 67.0 + (double)v7 * -0.08));
  sub_10002E350(32, (int)((double)v4 * 0.88 + -22.0 + (double)v6 * 0.13));
  v10 = (float)dword_1000A2A2C;
  v11 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v12 = v10 / 100.0;
  *(float *)&v13 = v12;
  objc_msgSend(v11, "calculateControlEffort:", v13);
  v14 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v15 = v12;
  objc_msgSend(v14, "calculateControlEffort:", v15);
  v16 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  *(float *)&v17 = v12;
  objc_msgSend(v16, "calculateControlEffort:", v17);
}

- (void)updateCoreAnalyticsInfo
{
  uint64_t v3;
  _QWORD v4[4];
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned __int8 v12;

  v3 = unk_1000A2A28;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D118;
  v4[3] = &unk_10007D040;
  v5 = qword_1000A29AC;
  v6 = *(uint64_t *)((char *)&qword_1000A29B4 + 4);
  v7 = HIDWORD(qword_1000A29BC);
  v8 = dword_1000A29C8;
  v9 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v10 = v3;
  v12 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v11 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v4);
}

@end
