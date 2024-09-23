@implementation tm11ac97aa803917d90e120a9af82ff31b

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

  v4 = qword_1000A29B4;
  v5 = dword_1000A29D8;
  v12.receiver = self;
  v12.super_class = (Class)tm11ac97aa803917d90e120a9af82ff31b;
  -[tm0624042662bdd34b4bbbfc0f7da95deb updateAllThermalLoad:](&v12, "updateAllThermalLoad:", a3);
  sub_10002E350(55, (int)((double)v4 * 0.37 + 107.62 + (double)v5 * 0.58));
  v6 = (float)dword_1000A2A88;
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
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  _QWORD v19[4];
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  unsigned __int8 v34;

  v15 = qword_1000A29AC;
  v16 = qword_1000A2A7C;
  v17 = dword_1000A2A88;
  v18 = HIDWORD(qword_1000A2A74);
  v3 = -[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage");
  v4 = -[CommonProduct dieTempMaxMax](self, "dieTempMaxMax");
  v5 = -[CommonProduct getChargerState](self, "getChargerState");
  v6 = sub_100008F14();
  v7 = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
  v8 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 2), "releaseMaxLI");
  v9 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 3), "releaseMaxLI");
  v10 = objc_msgSend(-[CommonProduct findComponent:](self, "findComponent:", 7), "releaseMaxLI");
  v11 = -[CommonProduct isBackLightOn](self, "isBackLightOn");
  v12 = qword_1000A2A68;
  v13 = HIDWORD(qword_1000A2A7C);
  v14 = dword_1000A2A84;
  if (!v11)
  {
    v14 = -12700;
    v13 = -12700;
    v12 = -12700;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100015E74;
  v19[3] = &unk_10007D298;
  v20 = v12;
  v21 = v15;
  v22 = v16;
  v23 = v14;
  v24 = v13;
  v25 = v18;
  v26 = v17;
  v27 = v3;
  v28 = v4;
  v29 = 100 - v8;
  v30 = 100 - v9;
  v31 = 100 - v10;
  v32 = v6;
  v33 = v5;
  v34 = v7;
  AnalyticsSendEventLazy(CFSTR("com.apple.thermalmonitor"), v19);
}

@end
