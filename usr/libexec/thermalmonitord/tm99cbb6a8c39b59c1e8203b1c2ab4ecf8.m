@implementation tm99cbb6a8c39b59c1e8203b1c2ab4ecf8

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  int v6;
  int v7;
  float v8;
  id v9;
  float v10;
  double v11;
  id v12;
  double v13;
  objc_super v14;

  v4 = HIDWORD(qword_1000A29B4);
  v5 = HIDWORD(qword_1000A29BC);
  v6 = dword_1000A29C8;
  v7 = dword_1000A29D0;
  v14.receiver = self;
  v14.super_class = (Class)tm99cbb6a8c39b59c1e8203b1c2ab4ecf8;
  -[tm57b622634d75d34f6315daf54954a970 updateAllThermalLoad:](&v14, "updateAllThermalLoad:", a3);
  sub_10002E350(63, (int)((double)v4 * 0.23 + -0.06 + (double)v5 * 0.25 + (double)v6 * 0.01 + (double)v7 * 0.5));
  v8 = (float)dword_1000A2AA8;
  v9 = -[CommonProduct findComponent:](self, "findComponent:", 23);
  v10 = v8 / 100.0;
  *(float *)&v11 = v10;
  objc_msgSend(v9, "calculateControlEffort:", v11);
  v12 = -[CommonProduct findComponent:](self, "findComponent:", 24);
  *(float *)&v13 = v10;
  objc_msgSend(v12, "calculateControlEffort:", v13);
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
  unsigned int v12;
  _QWORD v13[5];
  int v14;
  int32x2_t v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned __int8 v24;

  v3 = dword_1000A2A88;
  v4 = qword_1000A2A94;
  v5 = dword_1000A2AA8;
  v6 = dword_1000A29CC;
  v7 = *(uint64_t *)((char *)&qword_1000A2A7C + 4);
  v8 = (int32x2_t)qword_1000A2A8C;
  v9 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v10 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v11 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v12 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
  LODWORD(self) = -[CommonProduct getChargerState](self, "getChargerState");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000CCE8;
  v13[3] = &unk_10007D080;
  v13[4] = v7;
  v14 = v3;
  v15 = vrev64_s32(v8);
  v16 = v4;
  v17 = v6;
  v18 = v5;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = sub_100008F14();
  v23 = (int)self;
  v24 = v9;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v13);
}

@end
