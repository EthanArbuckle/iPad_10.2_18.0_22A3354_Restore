@implementation SiriCoreGetConnectionReadyReport

uint64_t __SiriCoreGetConnectionReadyReport_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (objc_class *)MEMORY[0x24BDBCED8];
  v8 = a2;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v8, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("protocol"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("handShakeDuration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("handShakeRTT"));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  return 1;
}

uint64_t __SiriCoreGetConnectionReadyReport_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v11 = a6;
  v12 = (objc_class *)MEMORY[0x24BDBCED8];
  v13 = a5;
  v14 = objc_alloc_init(v12);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("resolutionSource"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("endpointCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("duration"));

  _getEndpointInfo(v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("successfulEndpoint"));
  _getEndpointInfo(v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("preferredEndpoint"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

  return 1;
}

@end
