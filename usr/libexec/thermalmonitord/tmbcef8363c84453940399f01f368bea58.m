@implementation tmbcef8363c84453940399f01f368bea58

- (id)initProduct:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)tmbcef8363c84453940399f01f368bea58;
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
  v5 = qword_1000A29BC;
  v6 = dword_1000A29C8;
  v7 = dword_1000A29CC;
  v8 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v9 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  v10 = (double)-[CommonProduct dieTempFilteredMaxAverage](self, "dieTempFilteredMaxAverage") / 100.0;
  *(float *)&v11 = v10;
  *(float *)&v10 = v9;
  objc_msgSend(v8, "calculateControlEffort:trigger:", v10, v11);
  sub_10002E350(52, (int)((double)v5 * 1.06 + 67.0 + (double)v7 * -0.08));
  sub_10002E350(51, (int)((double)v4 * 0.88 + -22.0 + (double)v6 * 0.13));
  v12 = (float)SHIDWORD(qword_1000A2A74);
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
  int32x2_t v5;
  unsigned int v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned int v9;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[4];
  int v13;
  int v14;
  __int128 v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned __int8 v19;

  v3 = qword_1000A29AC;
  v4 = qword_1000A29BC;
  v11 = *(_QWORD *)&dword_1000A29C8;
  v5 = *(int32x2_t *)((char *)&qword_1000A2A74 + 4);
  v6 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v7 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v8 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  v9 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 13), "releaseMaxLI");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100012BA8;
  v12[3] = &unk_10007D040;
  *(_QWORD *)&v10 = v11;
  *((int32x2_t *)&v10 + 1) = vrev64_s32(v5);
  v13 = v3;
  v14 = v4;
  v15 = v10;
  v16 = v6;
  v17 = 100 - v9;
  v19 = v7;
  v18 = v8;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v12);
}

@end
