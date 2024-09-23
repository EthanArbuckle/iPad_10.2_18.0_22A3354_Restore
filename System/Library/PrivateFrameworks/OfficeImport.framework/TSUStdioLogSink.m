@implementation TSUStdioLogSink

- (TSUStdioLogSink)init
{
  TSUStdioLogSink *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *logQueue;
  NSDateFormatter *v5;
  NSDateFormatter *dateFormatter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSUStdioLogSink;
  v2 = -[TSUStdioLogSink init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("TSUStdioLogSinkQueue", 0);
    logQueue = v2->_logQueue;
    v2->_logQueue = (OS_dispatch_queue *)v3;

    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v5;

    -[NSDateFormatter setFormatterBehavior:](v2->_dateFormatter, "setFormatterBehavior:", 1040);
    -[NSDateFormatter setDateFormat:](v2->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_37);
  return (id)sharedInstance_sInstance;
}

void __33__TSUStdioLogSink_sharedInstance__block_invoke()
{
  TSUStdioLogSink *v0;
  void *v1;

  v0 = objc_alloc_init(TSUStdioLogSink);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;

}

- (id)logSinkBlockWithFilePointer:(__sFILE *)a3
{
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__TSUStdioLogSink_logSinkBlockWithFilePointer___block_invoke;
  v6[3] = &unk_24F39CAA0;
  v6[4] = self;
  v6[5] = a3;
  v3 = _Block_copy(v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

void __47__TSUStdioLogSink_logSinkBlockWithFilePointer___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4, int a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  v11 = a3;
  v12 = a6;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(NSObject **)(v14 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__TSUStdioLogSink_logSinkBlockWithFilePointer___block_invoke_2;
    block[3] = &unk_24F39CA78;
    block[4] = v14;
    v20 = v13;
    v21 = v11;
    v23 = a4;
    v25 = a2;
    v26 = a5;
    v16 = v12;
    v17 = *(_QWORD *)(a1 + 40);
    v22 = v16;
    v24 = v17;
    v18 = v13;
    dispatch_async(v15, block);

  }
}

void __47__TSUStdioLogSink_logSinkBlockWithFilePointer___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  FILE *v10;
  id v11;
  void *v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stringFromDate:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "processIdentifier");

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%@"), *(_QWORD *)(a1 + 48));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_24F3BFFF8;
  }
  v7 = *(_DWORD *)(a1 + 80) - 1;
  if (v7 > 4)
    v8 = &stru_24F3BFFF8;
  else
    v8 = off_24F39CAC0[v7];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@[%d] %@ %@ %s:%d %@"), v12, v3, v5, v8, v6, *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 84), *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(FILE **)(a1 + 72);
  v11 = objc_retainAutorelease(v9);
  fprintf(v10, "%s\n", (const char *)objc_msgSend(v11, "UTF8String"));
  if (*(int *)(a1 + 80) <= 2)
    fflush(*(FILE **)(a1 + 72));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
}

@end
