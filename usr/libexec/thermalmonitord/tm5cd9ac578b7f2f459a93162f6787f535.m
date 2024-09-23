@implementation tm5cd9ac578b7f2f459a93162f6787f535

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  int v6;
  float v7;
  id v8;
  float v9;
  double v10;
  id v11;
  double v12;
  objc_super v13;

  v4 = qword_1000A29AC;
  v5 = qword_1000A29BC;
  v6 = dword_1000A29C4;
  v13.receiver = self;
  v13.super_class = (Class)tm5cd9ac578b7f2f459a93162f6787f535;
  -[tmd86fe6187ee41b8649354ac4ec3a992b updateAllThermalLoad:](&v13, "updateAllThermalLoad:", a3);
  sub_10002E350(33, (int)((double)v4 * 0.325 + 23.0 + (double)v5 * 0.311 + (double)v6 * 0.356));
  v7 = (float)dword_1000A2A30;
  v8 = -[CommonProduct findComponent:](self, "findComponent:", 21);
  v9 = v7 / 100.0;
  *(float *)&v10 = v9;
  objc_msgSend(v8, "calculateControlEffort:", v10);
  v11 = -[CommonProduct findComponent:](self, "findComponent:", 22);
  *(float *)&v12 = v9;
  objc_msgSend(v11, "calculateControlEffort:", v12);
}

@end
