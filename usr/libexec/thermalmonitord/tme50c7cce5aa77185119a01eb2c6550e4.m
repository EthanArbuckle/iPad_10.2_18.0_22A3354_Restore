@implementation tme50c7cce5aa77185119a01eb2c6550e4

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

  v5 = HIDWORD(qword_1000A29BC);
  v4 = dword_1000A29C4;
  v12.receiver = self;
  v12.super_class = (Class)tme50c7cce5aa77185119a01eb2c6550e4;
  -[tmf02fbce43bb83f6eb51bd31374aa8279 updateAllThermalLoad:](&v12, "updateAllThermalLoad:", a3);
  sub_10002E350(53, (int)((double)v4 * 0.66 + 11.0 + (double)v5 * 0.36));
  v6 = (float)SHIDWORD(qword_1000A2A7C);
  v7 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  v8 = v6 / 100.0;
  *(float *)&v9 = v8;
  objc_msgSend(v7, "calculateControlEffort:", v9);
  v10 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v11 = v8;
  objc_msgSend(v10, "calculateControlEffort:", v11);
}

- (void)updateCoreAnalyticsInfo
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int32x2_t v7;
  unsigned int v8;
  unsigned __int8 v9;
  unsigned int v10;
  _QWORD v11[4];
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  int32x2_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned __int8 v20;

  v3 = qword_1000A29AC;
  v4 = qword_1000A29BC;
  v5 = dword_1000A29C4;
  v6 = qword_1000A29B4;
  v7 = *(int32x2_t *)((char *)&qword_1000A2A74 + 4);
  v8 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v9 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v10 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C930;
  v11[3] = &unk_10007D060;
  v12 = v3;
  v13 = v6;
  v14 = v4;
  v15 = v5;
  v16 = vrev64_s32(v7);
  v17 = v8;
  v18 = 100 - objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 13), "releaseMaxLI");
  v20 = v9;
  v19 = v10;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v11);
}

@end
