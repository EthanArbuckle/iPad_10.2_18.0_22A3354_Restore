@implementation tm94e2445bba4a565b83e88425e97b1ef1

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

  v4 = qword_1000A29BC;
  v5 = dword_1000A29C4;
  v12.receiver = self;
  v12.super_class = (Class)tm94e2445bba4a565b83e88425e97b1ef1;
  -[tm1999e121298b648399d013196e64b976 updateAllThermalLoad:](&v12, "updateAllThermalLoad:", a3);
  sub_10002E350(33, (int)((double)v4 * 0.66 + 11.0 + (double)v5 * 0.36));
  v6 = (float)dword_1000A2A30;
  v7 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  v8 = v6 / 100.0;
  *(float *)&v9 = v8;
  objc_msgSend(v7, "calculateControlEffort:", v9);
  v10 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  *(float *)&v11 = v8;
  objc_msgSend(v10, "calculateControlEffort:", v11);
}

- (void)updateCoreAnalyticsInfo
{
  int v3;
  uint64_t v4;
  _QWORD v5[4];
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned __int8 v14;

  v3 = dword_1000A2A30;
  v4 = unk_1000A2A28;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A27C;
  v5[3] = &unk_10007D060;
  v6 = qword_1000A29AC;
  v7 = *(uint64_t *)((char *)&qword_1000A29B4 + 4);
  v8 = HIDWORD(qword_1000A29BC);
  v9 = dword_1000A29C8;
  v10 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v11 = v4;
  v14 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v12 = v3;
  v13 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v5);
}

@end
