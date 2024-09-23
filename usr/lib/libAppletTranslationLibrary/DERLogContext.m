@implementation DERLogContext

- (DERLogContext)init
{
  DERLogContext *v2;
  DERLogContext *v3;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DERLogContext;
  v2 = -[DERLogContext init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->circBuff = (_CircularBuffer *)CircularBufferInit(v2->circBuffStorage, 0x1800uLL);
    objc_initWeak(&location, v3);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __21__DERLogContext_init__block_invoke;
    v5[3] = &unk_1E7D8AFB8;
    objc_copyWeak(&v6, &location);
    DERLogSetBlock(v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __21__DERLogContext_init__block_invoke(uint64_t a1, const char *a2)
{
  _QWORD *WeakRetained;
  const void **v4;
  __int16 v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (const void **)WeakRetained[1];
    v6 = WeakRetained;
    v5 = strlen(a2);
    CircularBufferAdd(v4, (uint64_t)a2, (unsigned __int16)(v5 + 1));
    WeakRetained = v6;
  }

}

- (void)dealloc
{
  objc_super v3;

  DERLogSetBlock(0);
  v3.receiver = self;
  v3.super_class = (Class)DERLogContext;
  -[DERLogContext dealloc](&v3, sel_dealloc);
}

- (void)dumpLogs
{
  CircularBufferDump((const void **)&self->circBuff->var0, (uint64_t)&__block_literal_global_11);
}

void __25__DERLogContext_dumpLogs__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = a3;
    _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
  }

}

@end
