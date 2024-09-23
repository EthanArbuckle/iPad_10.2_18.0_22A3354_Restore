@implementation tm104528f6cf383f53644bfb589f67ad6c

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
  v12.super_class = (Class)tm104528f6cf383f53644bfb589f67ad6c;
  -[tmbcef8363c84453940399f01f368bea58 updateAllThermalLoad:](&v12, "updateAllThermalLoad:", a3);
  sub_10002E350(53, (int)((double)v4 * 0.66 + -89.0 + (double)v5 * 0.36));
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
  int32x2_t v5;
  int v6;
  unsigned int v7;
  unsigned __int8 v8;
  unsigned int v9;
  unsigned int v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[4];
  int v14;
  int v15;
  __int128 v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned __int8 v21;

  v3 = qword_1000A29AC;
  v4 = qword_1000A29BC;
  v12 = *(_QWORD *)&dword_1000A29C8;
  v5 = *(int32x2_t *)((char *)&qword_1000A2A74 + 4);
  v6 = HIDWORD(qword_1000A2A7C);
  v7 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v8 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v9 = -[CommonProduct thermalPressureLevel](self, "thermalPressureLevel");
  v10 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 13), "releaseMaxLI");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D0B8;
  v13[3] = &unk_10007D060;
  v14 = v3;
  v15 = v4;
  *(_QWORD *)&v11 = v12;
  *((int32x2_t *)&v11 + 1) = vrev64_s32(v5);
  v16 = v11;
  v17 = v6;
  v18 = v7;
  v21 = v8;
  v19 = 100 - v10;
  v20 = v9;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v13);
}

@end
