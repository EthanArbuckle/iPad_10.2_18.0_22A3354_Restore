@implementation RTAIDCallObserver

- (RTAIDCallObserver)initWithCallReporterBlock:(id)a3
{
  id v4;
  RTAIDCallObserver *v5;
  RTAIDCallObserver *v6;
  id v7;
  unsigned __int8 v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTAIDCallObserver;
  v5 = -[RTAIDCallObserver init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[RTAIDCallObserver setCallReporterBlock:](v5, "setCallReporterBlock:", v4);
    v7 = objc_alloc_init(MEMORY[0x24BDB7898]);
    objc_msgSend(v7, "setDelegate:queue:", v6, 0);
    -[RTAIDCallObserver setCallObserver:](v6, "setCallObserver:", v7);
    {
      rtaid::get_log(void)::rtaid_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "aid");
    }
    v9 = rtaid::get_log(void)::rtaid_os_log;
    if (os_log_type_enabled((os_log_t)rtaid::get_log(void)::rtaid_os_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "AudioIssueDetectorManagerCallState.mm";
      v14 = 1024;
      v15 = 30;
      _os_log_impl(&dword_216CFB000, v9, OS_LOG_TYPE_DEFAULT, "%s:%-5d initWithCallReporterBlock setup", buf, 0x12u);
    }

  }
  return v6;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  void (**v14)(_QWORD, _QWORD);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "calls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "calls", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v11, "hasConnected") && (objc_msgSend(v11, "isOnHold") & 1) == 0)
          {
            v7 = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  -[RTAIDCallObserver callReporterBlock](self, "callReporterBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (!v13)
  {
    -[RTAIDCallObserver callReporterBlock](self, "callReporterBlock");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14[2](v14, v7);

  }
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (id)callReporterBlock
{
  return self->_callReporterBlock;
}

- (void)setCallReporterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callReporterBlock, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end
