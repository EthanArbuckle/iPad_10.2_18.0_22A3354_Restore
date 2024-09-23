@implementation tmf02fbce43bb83f6eb51bd31374aa8279

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tmf02fbce43bb83f6eb51bd31374aa8279;
  v3 = -[CommonProduct initProduct:](&v6, "initProduct:", a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "resetVTFilterState");
  return v4;
}

- (int)gasGaugeBatteryTemperature
{
  return qword_1000A29AC;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  int v6;
  int v7;
  id v8;
  float v9;
  double v10;
  double v11;
  float v12;
  id v13;
  float v14;
  double v15;
  id v16;
  double v17;

  v4 = qword_1000A29AC;
  v5 = dword_1000A29C4;
  v7 = HIDWORD(qword_1000A29B4);
  v6 = qword_1000A29BC;
  v8 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v9 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v10 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v11 = v10;
  *(float *)&v10 = v9;
  objc_msgSend(v8, "calculateControlEffort:trigger:", v10, v11);
  sub_10002E350(52, (int)((double)v4 * 0.88 + -22.0 + (double)v6 * 0.13));
  sub_10002E350(51, (int)((double)v5 * 1.06 + 67.0 + (double)v7 * -0.08));
  v12 = (float)(int)qword_1000A2A7C;
  v13 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v14 = v12 / 100.0;
  *(float *)&v15 = v14;
  objc_msgSend(v13, "calculateControlEffort:", v15);
  v16 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v17 = v14;
  objc_msgSend(v16, "calculateControlEffort:", v17);
}

- (void)updateCoreAnalyticsInfo
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned __int8 v8;
  unsigned int v9;
  _QWORD v10[4];
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned __int8 v18;

  v3 = qword_1000A29AC;
  v4 = dword_1000A29C4;
  v5 = *(uint64_t *)((char *)&qword_1000A29B4 + 4);
  v6 = *(uint64_t *)((char *)&qword_1000A2A74 + 4);
  v7 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v8 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v9 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C5E4;
  v10[3] = &unk_10007D040;
  v11 = v3;
  v12 = v5;
  v13 = v4;
  v14 = v6;
  v15 = v7;
  v16 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 13), "releaseMaxLI");
  v18 = v8;
  v17 = v9;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v10);
}

@end
