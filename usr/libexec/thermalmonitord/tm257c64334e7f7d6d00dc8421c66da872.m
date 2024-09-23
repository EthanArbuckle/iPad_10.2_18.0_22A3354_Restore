@implementation tm257c64334e7f7d6d00dc8421c66da872

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

  v4 = qword_1000A29AC;
  v5 = dword_1000A29CC;
  v12.receiver = self;
  v12.super_class = (Class)tm257c64334e7f7d6d00dc8421c66da872;
  -[tmab4b5a2f057efd0a64835b9c4226bf18 updateAllThermalLoad:](&v12, "updateAllThermalLoad:", a3);
  sub_10002E350(63, (int)((double)v4 * 0.105 + -164.3 + (double)v5 * 0.904));
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
  v6 = HIDWORD(qword_1000A29BC);
  v7 = *(uint64_t *)((char *)&qword_1000A2A7C + 4);
  v8 = (int32x2_t)qword_1000A2A8C;
  v9 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v10 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v11 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v12 = objc_msgSend((id)qword_1000A2E38, "getCurrentPackagePower");
  LODWORD(self) = -[CommonProduct getChargerState](self, "getChargerState");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003DF78;
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
