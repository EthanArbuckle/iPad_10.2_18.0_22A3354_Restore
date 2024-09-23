@implementation SRSensorWriterWrapper

- (BOOL)isReady
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[SRSensorWriterWrapper writerInstance](SRSensorWriterWrapper, "writerInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMonitoring");

  IXADefaultLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("not ready");
    if (v3)
      v6 = CFSTR("ready");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] writer is %@"), "-[SRSensorWriterWrapper isReady]", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v7;
    _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  return v3;
}

- (void)write:(id)a3
{
  id v4;
  NSObject *v5;
  SRSensorWriterWrapper *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IXADefaultLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] sending sessionStats data to SensorKit"), "-[SRSensorWriterWrapper write:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v12;
    _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  v6 = self;
  objc_sync_enter(v6);
  +[SRSensorWriterWrapper writerInstance](SRSensorWriterWrapper, "writerInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "provideSampleData:error:", v4, &v13);

  v8 = v13;
  objc_sync_exit(v6);

  IXADefaultLogFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] Data send to SensorKit failed with error: %@"), "-[SRSensorWriterWrapper write:]", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_error_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_9:

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] Data is sent to SensorKit"), "-[SRSensorWriterWrapper write:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v11;
    _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_9;
  }

}

- (void)write:(id)a3 withTimeStamp:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SRSensorWriterWrapper *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  IXADefaultLogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] sending sessionStats data to SensorKit"), "-[SRSensorWriterWrapper write:withTimeStamp:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v17;
    _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  v9 = self;
  objc_sync_enter(v9);
  +[SRSensorWriterWrapper writerInstance](SRSensorWriterWrapper, "writerInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "srAbsoluteTime");
  v12 = v11;

  v18 = 0;
  objc_msgSend(v10, "provideSampleData:timestamp:error:", v7, &v18, v12);

  v13 = v18;
  objc_sync_exit(v9);

  IXADefaultLogFacility();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] Data send to SensorKit failed with error: %@"), "-[SRSensorWriterWrapper write:withTimeStamp:]", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_error_impl(&dword_1DA6F2000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_9:

    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] Data is sent to SensorKit"), "-[SRSensorWriterWrapper write:withTimeStamp:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v16;
    _os_log_debug_impl(&dword_1DA6F2000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_9;
  }

}

- (void)publishSessionStats:(id)a3 withSessionStartTime:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "generateDataForSR");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v9, "binarySampleRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SRSensorWriterWrapper write:withTimeStamp:](self, "write:withTimeStamp:", v7, v8);
  }
  else
  {

    objc_msgSend(v9, "binarySampleRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRSensorWriterWrapper write:](self, "write:", v7);
  }

}

+ (id)writerInstance
{
  if (+[SRSensorWriterWrapper writerInstance]::onceToken != -1)
    dispatch_once(&+[SRSensorWriterWrapper writerInstance]::onceToken, &__block_literal_global);
  return (id)+[SRSensorWriterWrapper writerInstance]::_instance;
}

uint64_t __39__SRSensorWriterWrapper_writerInstance__block_invoke()
{
  NSObject *v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  void *v4;
  SRSensorWriterKeyboardDelegate *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 buf;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  IXADefaultLogFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] creating SRSensorWriter for %@"), "+[SRSensorWriterWrapper writerInstance]_block_invoke", CFSTR("com.apple.SensorKit.keyboardMetrics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_debug_impl(&dword_1DA6F2000, v0, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v1 = (void *)getSRSensorWriterClass(void)::softClass;
  v12 = getSRSensorWriterClass(void)::softClass;
  if (!getSRSensorWriterClass(void)::softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v14 = ___ZL22getSRSensorWriterClassv_block_invoke;
    v15 = &unk_1EA107058;
    v16 = &v9;
    ___ZL22getSRSensorWriterClassv_block_invoke((uint64_t)&buf);
    v1 = (void *)v10[3];
  }
  v2 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v9, 8);
  v3 = objc_msgSend([v2 alloc], "initWithIdentifier:", CFSTR("com.apple.SensorKit.keyboardMetrics"));
  v4 = (void *)+[SRSensorWriterWrapper writerInstance]::_instance;
  +[SRSensorWriterWrapper writerInstance]::_instance = v3;

  v5 = objc_alloc_init(SRSensorWriterKeyboardDelegate);
  v6 = (void *)+[SRSensorWriterWrapper writerInstance]::_delegate;
  +[SRSensorWriterWrapper writerInstance]::_delegate = (uint64_t)v5;

  return objc_msgSend((id)+[SRSensorWriterWrapper writerInstance]::_instance, "setDelegate:", +[SRSensorWriterWrapper writerInstance]::_delegate);
}

@end
