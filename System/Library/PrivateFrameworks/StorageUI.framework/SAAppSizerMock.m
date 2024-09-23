@implementation SAAppSizerMock

- (void)startObservingWithUpdateHandler:(id)a3
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  NSLog(CFSTR("SAAppSizer - startObservingWithUpdateHandler"));
  v4 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SAAppSizerMock_startObservingWithUpdateHandler___block_invoke;
  block[3] = &unk_251924E50;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

void __50__SAAppSizerMock_startObservingWithUpdateHandler___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[8];
  _QWORD v23[10];

  v23[8] = *MEMORY[0x24BDAC8D0];
  v20 = objc_alloc_init(MEMORY[0x24BEAFB80]);
  objc_msgSend(v20, "setFixedSize:", 1000000000);
  v1 = objc_alloc_init(MEMORY[0x24BEAFB80]);
  objc_msgSend(v1, "setFixedSize:", 190000000);
  v19 = v1;
  objc_msgSend(v1, "setDataSize:", 794000000);
  v2 = objc_alloc_init(MEMORY[0x24BEAFB80]);
  objc_msgSend(v2, "setFixedSize:", 250000000);
  objc_msgSend(v2, "setDataSize:", 6000000);
  v18 = objc_alloc_init(MEMORY[0x24BEAFB80]);
  objc_msgSend(v18, "setFixedSize:", 17000000000);
  v17 = objc_alloc_init(MEMORY[0x24BEAFB80]);
  objc_msgSend(v17, "setFixedSize:", 20000000000);
  v15 = objc_alloc_init(MEMORY[0x24BEAFB80]);
  objc_msgSend(v15, "setFixedSize:", 5000000000);
  v3 = objc_alloc_init(MEMORY[0x24BEAFB80]);
  objc_msgSend(v3, "setFixedSize:", 3000000000);
  v12 = objc_alloc_init(MEMORY[0x24BEAFB80]);
  objc_msgSend(v12, "setFixedSize:", 200000000000);
  v13 = objc_alloc_init(MEMORY[0x24BEAFB88]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.dt.Xcode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v23[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.company.app1"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  v23[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.company.app2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v4;
  v23[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SACategoryIdentifierTrash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v5;
  v23[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SACategoryIdentifierSystem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v23[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SACategoryIdentifierSystemData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v7;
  v23[5] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SACategoryIdentifierOtherUsers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v8;
  v23[6] = v3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SACategoryIdentifierDocuments"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v9;
  v23[7] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAppData:", v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("SAAppSizer - startObservingWithUpdateHandler handler output: %@"), v11);

}

- (void)stopObserving
{
  NSLog(CFSTR("SAAppSizer - stopObserving"), a2);
}

@end
