@implementation RMModelStatusDeviceOperatingSystemFamily

+ (id)statusItemType
{
  return CFSTR("device.operating-system.family");
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)supportedOS
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[6];
  _QWORD v29[8];

  v29[6] = *MEMORY[0x24BDAC8D0];
  v28[0] = &unk_25162A9F0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516274C8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516274E0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v28[1] = &unk_25162AA08;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516274F8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627510);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  v28[2] = &unk_25162AA20;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627528);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627540);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  v28[3] = &unk_25162AA38;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627558);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627570);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v4;
  v28[4] = &unk_25162AA50;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627588);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516275A0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v7;
  v28[5] = &unk_25162AA68;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516275B8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516275D0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
