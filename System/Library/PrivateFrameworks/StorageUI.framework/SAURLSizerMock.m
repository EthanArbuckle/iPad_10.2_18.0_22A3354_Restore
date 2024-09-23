@implementation SAURLSizerMock

- (void)startObservingURLs:(id)a3 withUpdateHandler:(id)a4
{
  id v5;
  id v6;
  dispatch_time_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  NSLog(CFSTR("SAURLSizer - startObservingURLs: %@"), v5);
  v7 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SAURLSizerMock_startObservingURLs_withUpdateHandler___block_invoke;
  block[3] = &unk_251924E78;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  dispatch_after(v7, MEMORY[0x24BDAC9B8], block);

}

void __55__SAURLSizerMock_startObservingURLs_withUpdateHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Users/Shared/txt"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BEAFBA0]);
  objc_msgSend(v3, "setSize:", 1000000);
  v4 = objc_alloc_init(MEMORY[0x24BEAFBA8]);
  v9 = v2;
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUrlInfo:", v5);

  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("SAURLSizer - startObservingURLs %@ handler output: %@"), v7, v8);

}

- (void)stopObserving
{
  NSLog(CFSTR("SAURLSizer - stopObserving not implemented"), a2);
}

@end
