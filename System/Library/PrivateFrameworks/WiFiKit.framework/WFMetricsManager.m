@implementation WFMetricsManager

- (WFMetricsManager)init
{
  WFMetricsManager *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  NSObject *processName;
  uint64_t v7;
  NSMutableDictionary *ssidHashes;
  NSString *v10;
  os_log_type_t v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFMetricsManager;
  v2 = -[WFMetricsManager init](&v13, sel_init);
  if (v2)
  {
    v3 = (__CFString *)WFCopyProcessIdentifier();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
      processName = v2->_processName;
      v2->_processName = &v5->isa;
    }
    else
    {
      v10 = v2->_processName;
      v2->_processName = (NSString *)CFSTR("unknown");

      WFLogForCategory(0);
      processName = objc_claimAutoreleasedReturnValue();
      v11 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && processName && os_log_type_enabled(processName, v11))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_219FC8000, processName, v11, "Unable to get process name", v12, 2u);
      }
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    ssidHashes = v2->_ssidHashes;
    v2->_ssidHashes = (NSMutableDictionary *)v7;

    if (v4)
      CFRelease(v4);
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  return (id)_sharedManager;
}

void __33__WFMetricsManager_sharedManager__block_invoke()
{
  WFMetricsManager *v0;
  void *v1;

  v0 = objc_alloc_init(WFMetricsManager);
  v1 = (void *)_sharedManager;
  _sharedManager = (uint64_t)v0;

}

- (void)processEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_2550DA2F0))
    {
      -[WFMetricsManager _submitCAEvent:](self, "_submitCAEvent:", v5);
    }
    else
    {
      WFLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
      {
        v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_219FC8000, v6, v7, "%@ does not conform to event protocol", (uint8_t *)&v8, 0xCu);
      }

    }
  }

}

- (void)_submitCAEvent:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  objc_msgSend(v3, "eventDictionary");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v8 || !os_log_type_enabled(v8, v9))
      goto LABEL_18;
    *(_DWORD *)buf = 136315138;
    v22 = "-[WFMetricsManager _submitCAEvent:]";
    v10 = "%s: event name is nil";
    v11 = v8;
    v12 = v9;
    v13 = 12;
    goto LABEL_17;
  }
  if (!v16[5])
  {
    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v8 || !os_log_type_enabled(v8, v14))
      goto LABEL_18;
    *(_DWORD *)buf = 136315394;
    v22 = "-[WFMetricsManager _submitCAEvent:]";
    v23 = 2112;
    v24 = v4;
    v10 = "%s: event is nil for event %@";
    v11 = v8;
    v12 = v14;
    v13 = 22;
LABEL_17:
    _os_log_impl(&dword_219FC8000, v11, v12, v10, buf, v13);
LABEL_18:

    goto LABEL_8;
  }
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v5 && os_log_type_enabled(v5, v6))
  {
    v7 = v16[5];
    *(_DWORD *)buf = 136315650;
    v22 = "-[WFMetricsManager _submitCAEvent:]";
    v23 = 2112;
    v24 = v4;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: submitting %@ with dictionary %@", buf, 0x20u);
  }

  AnalyticsSendEventLazy();
LABEL_8:
  _Block_object_dispose(&v15, 8);

}

id __35__WFMetricsManager__submitCAEvent___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)ssidHashes
{
  return self->_ssidHashes;
}

- (void)setSsidHashes:(id)a3
{
  objc_storeStrong((id *)&self->_ssidHashes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssidHashes, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end
