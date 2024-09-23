@implementation SCPreferences

- (SCPreferences)initWithQueue:(id)a3
{
  id v5;
  SCPreferences *v6;
  SCPreferences *v7;
  uint64_t v8;
  NSUserDefaults *scandiumDefaults;
  SCPreferences *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCPreferences;
  v6 = -[SCPreferences init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.scandium"));
    scandiumDefaults = v7->_scandiumDefaults;
    v7->_scandiumDefaults = (NSUserDefaults *)v8;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v7->_scandiumDefaults, "addObserver:forKeyPath:options:context:", v7, CFSTR("SignalQualityMetricsDisabled"), 5, &v7->_signalQualityMetricsDisabled);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v7->_scandiumDefaults, "addObserver:forKeyPath:options:context:", v7, CFSTR("BypassAlgorithms"), 5, &v7->_bypassAlgorithms);
    v10 = v7;
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  objc_msgSend(a4, "valueForKeyPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sc_get_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_2457F9000, v11, OS_LOG_TYPE_DEFAULT, "SCPreferences: %{public}@=%{public}@", buf, 0x16u);
  }

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    sc_get_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SCPreferences observeValueForKeyPath:ofObject:change:context:].cold.1((uint64_t)v10, v13);

  }
  else
  {
    -[SCPreferences queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__SCPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_25169D288;
    v16 = a6;
    block[4] = self;
    v15 = v10;
    dispatch_async(v12, block);

  }
}

uint64_t __64__SCPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 48);
  v3 = *(_QWORD *)(result + 32);
  if (v2 == v3 + 8)
  {
    result = objc_msgSend(*(id *)(result + 32), "setSignalQualityMetricsDisabled:", objc_msgSend(*(id *)(result + 40), "BOOLValue"));
    v2 = *(_QWORD *)(v1 + 48);
    v3 = *(_QWORD *)(v1 + 32);
  }
  if (v2 == v3 + 9)
    return objc_msgSend(*(id *)(v1 + 32), "setBypassAlgorithms:", objc_msgSend(*(id *)(v1 + 40), "BOOLValue"));
  return result;
}

- (BOOL)signalQualityMetricsDisabled
{
  return self->_signalQualityMetricsDisabled;
}

- (void)setSignalQualityMetricsDisabled:(BOOL)a3
{
  self->_signalQualityMetricsDisabled = a3;
}

- (BOOL)bypassAlgorithms
{
  return self->_bypassAlgorithms;
}

- (void)setBypassAlgorithms:(BOOL)a3
{
  self->_bypassAlgorithms = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUserDefaults)scandiumDefaults
{
  return self->_scandiumDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scandiumDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:(NSObject *)a2 change:context:.cold.1(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = objc_opt_class();
  _os_log_error_impl(&dword_2457F9000, a2, OS_LOG_TYPE_ERROR, "SCPreferences: ignoring value of class %@ (only NSNumber is currently supported)", (uint8_t *)&v3, 0xCu);
}

@end
