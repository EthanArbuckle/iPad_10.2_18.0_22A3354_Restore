@implementation tmd86fe6187ee41b8649354ac4ec3a992b

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4;
  int v5;
  int v6;
  id v7;
  double v8;
  float v9;
  id v10;
  float v11;
  double v12;
  id v13;
  double v14;

  v4 = qword_1000A29AC;
  v5 = qword_1000A29B4;
  v6 = qword_1000A29BC;
  v7 = -[CommonProduct findComponent:](self, "findComponent:", 18);
  v8 = (double)-[CommonProduct dieTempMaxAverage](self, "dieTempMaxAverage") / 100.0;
  *(float *)&v8 = v8;
  objc_msgSend(v7, "calculateControlEffort:", v8);
  sub_10002E350(31, (int)((double)v4 * 0.2304 + 473.4 + (double)v6 * 0.6023));
  sub_10002E350(32, (int)((double)v4 * 0.689 + -214.0 + (double)v5 * 0.373));
  v9 = (float)dword_1000A2A2C;
  v10 = -[CommonProduct findComponent:](self, "findComponent:", 19);
  v11 = v9 / 100.0;
  *(float *)&v12 = v11;
  objc_msgSend(v10, "calculateControlEffort:", v12);
  v13 = -[CommonProduct findComponent:](self, "findComponent:", 20);
  *(float *)&v14 = v11;
  objc_msgSend(v13, "calculateControlEffort:", v14);
}

@end
