@implementation WBSMemoryPressureMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
}

- (BOOL)pressured
{
  return self->_pressured;
}

- (WBSMemoryPressureMonitor)init
{
  id v2;
  id v3;
  NSObject *v4;
  dispatch_source_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD handler[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSMemoryPressureMonitor;
  v2 = -[WBSMemoryPressureMonitor init](&v13, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.%@.%p.queue"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);

    v5 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 0x37uLL, v4);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    v7 = *((_QWORD *)v2 + 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __32__WBSMemoryPressureMonitor_init__block_invoke;
    handler[3] = &unk_1E4B2BC78;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 1));
    v8 = v2;
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }

  return (WBSMemoryPressureMonitor *)v2;
}

- (void)dealloc
{
  NSObject *memoryPressureSource;
  objc_super v4;

  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
    dispatch_source_cancel(memoryPressureSource);
  v4.receiver = self;
  v4.super_class = (Class)WBSMemoryPressureMonitor;
  -[WBSMemoryPressureMonitor dealloc](&v4, sel_dealloc);
}

void __32__WBSMemoryPressureMonitor_init__block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t *v2;
  int64_t data;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  dispatch_source_t *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  __int16 v34[8];
  uint8_t buf[16];

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    data = dispatch_source_get_data(WeakRetained[1]);
    v4 = data;
    if (data <= 3)
    {
      if (data == 1)
      {
        v32 = WBS_LOG_CHANNEL_PREFIXMemory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A3D90000, v32, OS_LOG_TYPE_INFO, "The system memory pressure condition has returned to normal", buf, 2u);
        }
        v30 = v2;
        v31 = 0;
        goto LABEL_20;
      }
      if (data == 2)
      {
        v13 = WBS_LOG_CHANNEL_PREFIXMemory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v34[0] = 0;
          _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_DEFAULT, "The system memory pressure condition has changed to warning", (uint8_t *)v34, 2u);
        }
        goto LABEL_16;
      }
    }
    else
    {
      switch(data)
      {
        case 4:
          v14 = WBS_LOG_CHANNEL_PREFIXMemory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            __32__WBSMemoryPressureMonitor_init__block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
          goto LABEL_16;
        case 16:
          v22 = WBS_LOG_CHANNEL_PREFIXMemory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            __32__WBSMemoryPressureMonitor_init__block_invoke_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
          goto LABEL_16;
        case 32:
          v5 = WBS_LOG_CHANNEL_PREFIXMemory();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            __32__WBSMemoryPressureMonitor_init__block_invoke_cold_4(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_16:
          v30 = v2;
          v31 = 1;
LABEL_20:
          -[dispatch_source_t setPressured:](v30, "setPressured:", v31);
          goto LABEL_21;
      }
    }
    v33 = WBS_LOG_CHANNEL_PREFIXMemory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      __32__WBSMemoryPressureMonitor_init__block_invoke_cold_1(v4, v33);
  }
LABEL_21:

}

- (void)setPressured:(BOOL)a3
{
  self->_pressured = a3;
}

void __32__WBSMemoryPressureMonitor_init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "The system memory pressure condition is undefined (%lu)", (uint8_t *)&v2, 0xCu);
}

void __32__WBSMemoryPressureMonitor_init__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "The system memory pressure condition has changed to critical", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __32__WBSMemoryPressureMonitor_init__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "This process memory pressure condition has changed to warning", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __32__WBSMemoryPressureMonitor_init__block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "This process memory pressure condition has changed to critical", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
