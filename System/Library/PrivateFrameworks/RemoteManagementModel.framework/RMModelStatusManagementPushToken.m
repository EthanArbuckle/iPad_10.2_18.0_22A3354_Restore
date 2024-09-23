@implementation RMModelStatusManagementPushToken

+ (id)statusItemType
{
  return CFSTR("management.push-token");
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[6];
  _QWORD v35[8];

  v35[6] = *MEMORY[0x24BDAC8D0];
  v34[0] = &unk_25162AF60;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627F18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627F30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627F48);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v24;
  v34[1] = &unk_25162AF78;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627F60);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627F78);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627F90);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v20;
  v34[2] = &unk_25162AFA8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627FA8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627FC0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627FD8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v16;
  v34[3] = &unk_25162AF90;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251627FF0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628008);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628020);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v3;
  v34[4] = &unk_25162AFC0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628038);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628050);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628068);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v7;
  v34[5] = &unk_25162AFD8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628080);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628098);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516280B0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
