@implementation LTSendErrorEvent

id ___LTSendErrorEvent_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCED8];
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v24[0] = v4;
  v23[0] = CFSTR("selector");
  v23[1] = CFSTR("code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v5;
  v23[2] = CFSTR("domain");
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v6;
  v23[3] = CFSTR("domain_code");
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@_%zd"), v8, objc_msgSend(*(id *)(a1 + 40), "code"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDD1398];
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("underlying_domain"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v16, "code"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("underlying_code"));

    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v16, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@_%zd"), v20, objc_msgSend(v16, "code"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("underlying_domain_code"));

  }
  return v11;
}

@end
