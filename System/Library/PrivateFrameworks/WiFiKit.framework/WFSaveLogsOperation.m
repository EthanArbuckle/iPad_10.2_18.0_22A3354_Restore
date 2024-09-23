@implementation WFSaveLogsOperation

- (WFSaveLogsOperation)initWithComments:(id)a3
{
  id v5;
  WFSaveLogsOperation *v6;
  void **p_comments;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSaveLogsOperation;
  v6 = -[WFSaveLogsOperation init](&v10, sel_init);
  p_comments = (void **)&v6->_comments;
  objc_storeStrong((id *)&v6->_comments, a3);
  if (!-[NSString length](v6->_comments, "length"))
  {
    v8 = *p_comments;
    *p_comments = CFSTR("WiFi Settings");

  }
  return v6;
}

- (void)start
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  WFSaveLogsOperation *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  __int128 buf;
  void *v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[WFSaveLogsOperation comments](self, "comments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v4 = (void *)getW5ClientClass_softClass;
  v25 = getW5ClientClass_softClass;
  if (!getW5ClientClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v30 = __getW5ClientClass_block_invoke;
    v31 = &unk_24DC34710;
    v32 = &v22;
    __getW5ClientClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v23[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v22, 8);
  v6 = objc_alloc_init(v5);
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v9 = v7 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (v6)
  {
    if (v10 && os_log_type_enabled(v7, v8))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_219FC8000, v7, v8, "WiFi Diagnostics log collection started (comment='%@')", (uint8_t *)&buf, 0xCu);
    }

    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v11 = (void *)getW5LogItemRequestClass_softClass;
    v25 = getW5LogItemRequestClass_softClass;
    v12 = MEMORY[0x24BDAC760];
    if (!getW5LogItemRequestClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v30 = __getW5LogItemRequestClass_block_invoke;
      v31 = &unk_24DC34710;
      v32 = &v22;
      __getW5LogItemRequestClass_block_invoke((uint64_t)&buf);
      v11 = (void *)v23[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v13, "requestWithItemID:configuration:", 55, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = CFSTR("Reason");
    v27[1] = CFSTR("Compress");
    v28[0] = v3;
    v28[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __28__WFSaveLogsOperation_start__block_invoke;
    v19[3] = &unk_24DC346E8;
    v20 = v3;
    v21 = self;
    v17 = (id)objc_msgSend(v6, "collectLogs:configuration:update:reply:", v16, v15, 0, v19);

  }
  else
  {
    if (v10 && os_log_type_enabled(v7, v8))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_219FC8000, v7, v8, "WiFiVelocity not available", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wififkit"), -1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOperation setError:](self, "setError:", v18);

    -[WFOperation finish](self, "finish");
  }

}

void __28__WFSaveLogsOperation_start__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  WFLogForCategory(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8)
  {
    v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = objc_msgSend(v6, "code");
      objc_msgSend(v7, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v11;
      v16 = 2048;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_219FC8000, v10, v9, "WiFi Diagnostics log collection completed (comment='%@', error=%ld, url=%@)", (uint8_t *)&v14, 0x20u);

    }
  }

  objc_msgSend(*(id *)(a1 + 40), "setError:", v6);
  objc_msgSend(*(id *)(a1 + 40), "finish");

}

- (NSString)comments
{
  return self->_comments;
}

- (void)setComments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comments, 0);
}

@end
