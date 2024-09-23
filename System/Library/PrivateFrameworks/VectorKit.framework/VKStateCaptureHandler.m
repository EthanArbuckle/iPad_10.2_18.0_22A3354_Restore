@implementation VKStateCaptureHandler

- (VKStateCaptureHandler)initWithQueue:(id)a3 withName:(id)a4 withCallback:(function<NSString *)(
{
  id v8;
  id v9;
  VKStateCaptureHandler *v10;
  VKStateCaptureHandler *v11;
  VKStateCaptureHandler *v12;
  NSString **p_name;
  function<NSString *()> *f;
  function<NSString *()> *p_callback;
  function<NSString *()> *v16;
  function<NSString *()> *v17;
  function<NSString *()> *v18;
  uint64_t v19;
  objc_super v21;
  _QWORD v22[3];
  function<NSString *()> *v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VKStateCaptureHandler;
  v10 = -[VKStateCaptureHandler init](&v21, sel_init);
  v11 = v10;
  v12 = v10;
  if (v10)
  {
    p_name = &v10->_name;
    objc_storeStrong((id *)&v10->_name, a4);
    if (!*p_name)
      *p_name = (NSString *)CFSTR("VK State Snapshot");
    f = (function<NSString *()> *)a5->__f_.__f_;
    if (f)
    {
      if (f == a5)
      {
        v23 = (function<NSString *()> *)v22;
        (*(void (**)(function<NSString *()> *, _QWORD *))(*(_QWORD *)a5->__f_.__buf_.__lx + 24))(a5, v22);
LABEL_9:
        p_callback = &v11->_callback;
        if (&v11->_callback != (function<NSString *()> *)v22)
        {
          v16 = v23;
          v17 = (function<NSString *()> *)v12->_callback.__f_.__f_;
          if (v23 == (function<NSString *()> *)v22)
          {
            if (v17 == p_callback)
            {
              (*(void (**)(_QWORD *, _QWORD *))(v22[0] + 24))(v22, v24);
              (*(void (**)(function<NSString *()> *))(*(_QWORD *)v23->__f_.__buf_.__lx + 32))(v23);
              v23 = 0;
              (*(void (**)(void *, _QWORD *))(*(_QWORD *)v12->_callback.__f_.__f_ + 24))(v12->_callback.__f_.__f_, v22);
              (*(void (**)(void *))(*(_QWORD *)v12->_callback.__f_.__f_ + 32))(v12->_callback.__f_.__f_);
              v12->_callback.__f_.__f_ = 0;
              v23 = (function<NSString *()> *)v22;
              (*(void (**)(_QWORD *, function<NSString *()> *))(v24[0] + 24))(v24, p_callback);
              (*(void (**)(_QWORD *))(v24[0] + 32))(v24);
            }
            else
            {
              (*(void (**)(_QWORD *, function<NSString *()> *))(v22[0] + 24))(v22, p_callback);
              (*(void (**)(function<NSString *()> *))(*(_QWORD *)v23->__f_.__buf_.__lx + 32))(v23);
              v23 = (function<NSString *()> *)v12->_callback.__f_.__f_;
            }
            v12->_callback.__f_.__f_ = p_callback;
          }
          else if (v17 == p_callback)
          {
            (*(void (**)(function<NSString *()> *, _QWORD *))(*(_QWORD *)v12->_callback.__f_.__buf_.__lx
                                                                       + 24))(p_callback, v22);
            (*(void (**)(void *))(*(_QWORD *)v12->_callback.__f_.__f_ + 32))(v12->_callback.__f_.__f_);
            v12->_callback.__f_.__f_ = v23;
            v23 = (function<NSString *()> *)v22;
          }
          else
          {
            v23 = (function<NSString *()> *)v12->_callback.__f_.__f_;
            v12->_callback.__f_.__f_ = v16;
          }
        }
        v18 = v23;
        if (v23 == (function<NSString *()> *)v22)
        {
          v19 = 4;
          v18 = (function<NSString *()> *)v22;
        }
        else
        {
          if (!v23)
          {
LABEL_23:
            -[VKStateCaptureHandler _registerHandlerforStateCapture:](v12, "_registerHandlerforStateCapture:", v8);
            goto LABEL_24;
          }
          v19 = 5;
        }
        (*(void (**)(void))(*(_QWORD *)v18->__f_.__buf_.__lx + 8 * v19))();
        goto LABEL_23;
      }
      f = (function<NSString *()> *)(*(uint64_t (**)(function<NSString *()> *))(*(_QWORD *)f->__f_.__buf_.__lx
                                                                                        + 16))(f);
    }
    v23 = f;
    goto LABEL_9;
  }
LABEL_24:

  return v12;
}

- (void)_registerHandlerforStateCapture:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *name;
  id v7;
  uint8_t buf[4];
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1)
    dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_3315);
  v5 = GEOGetVectorKitStateCaptureLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138412290;
    v9 = name;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_DEBUG, "Register Handler for %@ State Capture", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v7, (id *)buf);
  self->_handle = os_state_add_handler();
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  return self;
}

- (void)dealloc
{
  function<NSString *()> *p_callback;
  function<NSString *()> *f;
  uint64_t v5;
  objc_super v6;

  p_callback = &self->_callback;
  f = (function<NSString *()> *)self->_callback.__f_.__f_;
  self->_callback.__f_.__f_ = 0;
  if (f == p_callback)
  {
    v5 = 4;
    f = p_callback;
    goto LABEL_5;
  }
  if (f)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v5))();
  }
  -[VKStateCaptureHandler _unregisterHandlerforStateCapture](self, "_unregisterHandlerforStateCapture");
  v6.receiver = self;
  v6.super_class = (Class)VKStateCaptureHandler;
  -[VKStateCaptureHandler dealloc](&v6, sel_dealloc);
}

- (void)_unregisterHandlerforStateCapture
{
  NSObject *v3;
  NSString *name;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1)
    dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_3315);
  v3 = GEOGetVectorKitStateCaptureLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    v5 = 138412290;
    v6 = name;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_DEBUG, "Unregister Handler for %@ State Capture", (uint8_t *)&v5, 0xCu);
  }
  if (self->_handle)
    os_state_remove_handler();
}

- (os_state_data_s)_stateCapture
{
  NSObject *v3;
  NSString *name;
  void *v5;
  void *f;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  os_state_data_s *v13;
  void *v15;
  const __CFString *v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1)
    dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_3315);
  v3 = GEOGetVectorKitStateCaptureLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138412290;
    v18 = name;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_DEBUG, "%@ State Capture Begin", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ State Capture: Starting...."), self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  f = self->_callback.__f_.__f_;
  if (f)
  {
    (*(void (**)(void *))(*(_QWORD *)f + 48))(f);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "stringByAppendingString:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }

  }
  _GEOStateCaptureLog();
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ State Capture"), self->_name);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  v16 = CFSTR("Completed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ State Capture"), self->_name);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (os_state_data_s *)objc_msgSend(v9, "stateDataForDictionary:title:", v11, v12);

  return v13;
}

- (void).cxx_destruct
{
  function<NSString *()> *p_callback;
  function<NSString *()> *f;
  uint64_t v5;

  p_callback = &self->_callback;
  f = (function<NSString *()> *)self->_callback.__f_.__f_;
  if (f == p_callback)
  {
    v5 = 4;
    f = p_callback;
    goto LABEL_5;
  }
  if (f)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v5))();
  }
  objc_storeStrong((id *)&self->_name, 0);
}

uint64_t __57__VKStateCaptureHandler__registerHandlerforStateCapture___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint8_t v9[16];

  if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1)
    dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_3315);
  v4 = GEOGetVectorKitStateCaptureLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_DEBUG, "got called os_state_add_handler", v9, 2u);
  }
  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    return 0;
  v6 = WeakRetained;
  v7 = objc_msgSend(WeakRetained, "_stateCapture");

  return v7;
}

+ (os_state_data_s)stateDataForDictionary:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  os_state_data_s *v13;
  size_t v14;
  os_state_data_s *v15;
  void *v16;
  void *v17;
  id v18;
  const void *v19;
  size_t v20;
  uint64_t v21;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v23;
    if (v8)
    {
      if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1)
        dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_3315);
      v9 = GEOGetVectorKitStateCaptureLog(void)::log;
      if (!os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      v10 = "Error serializing dictionary for State Capture: %@";
      v11 = v9;
      v12 = 12;
    }
    else
    {
      v14 = objc_msgSend(v7, "length");
      v15 = (os_state_data_s *)malloc_type_calloc(1uLL, v14 + 200, 0x76450EECuLL);
      v13 = v15;
      if (v15)
      {
        v15->var0 = 1;
        v15->var1.var1 = v14;
        objc_msgSend(v6, "dataUsingEncoding:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = objc_retainAutorelease(v16);
          v19 = (const void *)objc_msgSend(v18, "bytes");
          if ((unint64_t)objc_msgSend(v18, "length") > 0x3E)
            v20 = 63;
          else
            v20 = objc_msgSend(v18, "length");
          memcpy(v13->var3, v19, v20);
        }
        memcpy(v13->var4, (const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), v14);

        goto LABEL_21;
      }
      if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1)
        dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_3315);
      v21 = GEOGetVectorKitStateCaptureLog(void)::log;
      if (!os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        v13 = 0;
LABEL_21:

        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      v10 = "Error os_state_data nil";
      v11 = v21;
      v12 = 2;
    }
    _os_log_impl(&dword_19F029000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
    goto LABEL_8;
  }
  v13 = 0;
LABEL_22:

  return v13;
}

@end
