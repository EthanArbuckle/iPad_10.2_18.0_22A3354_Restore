@implementation WBSDiagnosticStateCollector

+ (id)registeredStateCollectorWithLogLabel:(id)a3 payloadProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLogLabel:payloadProvider:", v7, v6);

  objc_msgSend(v8, "registerWithSysdiagnose");
  return v8;
}

- (void)registerWithSysdiagnose
{
  self->_stateHandler = os_state_add_handler();
}

- (WBSDiagnosticStateCollector)initWithLogLabel:(id)a3 queue:(id)a4 payloadProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSDiagnosticStateCollector *v11;
  uint64_t v12;
  NSString *logLabel;
  uint64_t v14;
  id payloadProvider;
  WBSDiagnosticStateCollector *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WBSDiagnosticStateCollector;
  v11 = -[WBSDiagnosticStateCollector init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    logLabel = v11->_logLabel;
    v11->_logLabel = (NSString *)v12;

    objc_storeStrong((id *)&v11->_queue, a4);
    v14 = objc_msgSend(v10, "copy");
    payloadProvider = v11->_payloadProvider;
    v11->_payloadProvider = (id)v14;

    v16 = v11;
  }

  return v11;
}

- (WBSDiagnosticStateCollector)initWithLogLabel:(id)a3 payloadProvider:(id)a4
{
  return -[WBSDiagnosticStateCollector initWithLogLabel:queue:payloadProvider:](self, "initWithLogLabel:queue:payloadProvider:", a3, MEMORY[0x1E0C80D38], a4);
}

- (void)dealloc
{
  objc_super v3;

  -[WBSDiagnosticStateCollector unregister](self, "unregister");
  v3.receiver = self;
  v3.super_class = (Class)WBSDiagnosticStateCollector;
  -[WBSDiagnosticStateCollector dealloc](&v3, sel_dealloc);
}

uint64_t __54__WBSDiagnosticStateCollector_registerWithSysdiagnose__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createOSStateDataWithHints:", a2);
}

- (void)unregister
{
  if (self->_stateHandler)
  {
    os_state_remove_handler();
    self->_stateHandler = 0;
  }
}

- (BOOL)isRegisteredWithSysdiagnose
{
  return self->_stateHandler != 0;
}

- (os_state_data_s)_createOSStateDataWithHints:(os_state_hints_s *)a3
{
  os_state_data_s *v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  size_t v11;
  os_state_data_s *v12;
  id v14;

  if (a3->var2 - 1 < 2)
    return 0;
  (*((void (**)(void))self->_payloadProvider + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 0;
    if (v9)
    {
      v11 = objc_msgSend(v6, "length");
      v12 = (os_state_data_s *)malloc_type_malloc(v11 + 200, 0x9DAC7E8DuLL);
      v3 = v12;
      if (v12)
      {
        bzero(v12, v11 + 200);
        v3->var0 = 1;
        -[NSString UTF8String](self->_logLabel, "UTF8String");
        __strlcpy_chk();
        v3->var1.var1 = v11;
        memmove(v3->var4, (const void *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), v11);
      }
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXOther();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WBSDiagnosticStateCollector _createOSStateDataWithHints:].cold.1((uint64_t)self, v10, v8);
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSString)logLabel
{
  return self->_logLabel;
}

- (void)setLogLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logLabel, 0);
  objc_storeStrong(&self->_payloadProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_createOSStateDataWithHints:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1B2621000, v5, OS_LOG_TYPE_ERROR, "Failed to serialize diagnostic state for '%{public}@': %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
