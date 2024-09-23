@implementation TailSpinHelper

+ (id)getLogger
{
  if (getLogger_onceToken != -1)
    dispatch_once(&getLogger_onceToken, &__block_literal_global);
  return (id)getLogger__logger;
}

void __27__TailSpinHelper_getLogger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.siri.sirikit", "TailSpinHelper");
  v1 = (void *)getLogger__logger;
  getLogger__logger = (uint64_t)v0;

}

+ (id)getLastSuccessfulTailSpinDate:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSuiteName:", v4);

  objc_msgSend(v5, "objectForKey:", CFSTR("siri_tailspin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)setSuccessfulTailSpinDate:(id)a3 date:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0C99EA0];
  v6 = a4;
  v7 = a3;
  v8 = (id)objc_msgSend([v5 alloc], "initWithSuiteName:", v7);

  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("siri_tailspin"));
}

+ (BOOL)isValidToCreateTailSpin:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;

  +[TailSpinHelper getLastSuccessfulTailSpinDate:](TailSpinHelper, "getLastSuccessfulTailSpinDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

    v7 = v6 >= 120.0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (BOOL)isValidToDeleteTailSpinDir:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;

  +[TailSpinHelper getLastSuccessfulTailSpinDate:](TailSpinHelper, "getLastSuccessfulTailSpinDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

    v7 = v6 >= 172800.0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)getTailSpinDir:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tailspins/siri/%@/"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dumpTailSpinOutputToFile:(id)a3 suiteName:(id)a4 options:(id)a5 queue:(id)a6 handler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  NSObject *queue;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  queue = a6;
  v14 = a7;
  +[TailSpinHelper getTailSpinDir:](TailSpinHelper, "getTailSpinDir:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v17, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x1E0CB2AA8];
  v45[0] = &unk_1E7CDD898;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, v19, &v43);
  v20 = v43;

  if (v20)
  {
    v21 = queue;
    +[TailSpinHelper getLogger](TailSpinHelper, "getLogger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[TailSpinHelper dumpTailSpinOutputToFile:suiteName:options:queue:handler:].cold.1((uint64_t)v15, v22, v23, v24, v25, v26, v27, v28);

    if (v14)
      (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
  }
  else
  {
    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("-"));
    v36 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v17, "stringFromDate:", v16);
    v30 = v14;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("SiriUtils_%@_%@.tailspin"), v36, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "stringByAppendingPathComponent:", v35);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__TailSpinHelper_dumpTailSpinOutputToFile_suiteName_options_queue_handler___block_invoke;
    block[3] = &unk_1E7CD5DF0;
    v39 = v12;
    v40 = v32;
    v33 = v30;
    v42 = v30;
    v41 = v13;
    v34 = v32;
    dispatch_async(queue, block);

    v11 = (id)v36;
    v21 = queue;
    v14 = v33;
  }

}

uint64_t __75__TailSpinHelper_dumpTailSpinOutputToFile_suiteName_options_queue_handler___block_invoke(uint64_t a1)
{
  BOOL v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  uint64_t (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = +[TailSpinHelper isValidToCreateTailSpin:](TailSpinHelper, "isValidToCreateTailSpin:", *(_QWORD *)(a1 + 32));
  +[TailSpinHelper getLogger](TailSpinHelper, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1C2F2D000, v4, OS_LOG_TYPE_INFO, "TailSpinHelper#dumpTailSpinOutputToFile dir: %@", buf, 0xCu);
    }

    v6 = open((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "cStringUsingEncoding:", 1), 514, 484);
    if (tailspin_dump_output_with_options_sync())
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[TailSpinHelper setSuccessfulTailSpinDate:date:](TailSpinHelper, "setSuccessfulTailSpinDate:date:", v7, v8);

    }
    close(v6);
    result = *(_QWORD *)(a1 + 56);
    if (result)
    {
      v10 = *(uint64_t (**)(void))(result + 16);
      return v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __75__TailSpinHelper_dumpTailSpinOutputToFile_suiteName_options_queue_handler___block_invoke_cold_1(a1, v4, v11, v12, v13, v14, v15, v16);

    result = *(_QWORD *)(a1 + 56);
    if (result)
    {
      v10 = *(uint64_t (**)(void))(result + 16);
      return v10();
    }
  }
  return result;
}

- (void)clearDirectory:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__TailSpinHelper_clearDirectory_queue___block_invoke;
  block[3] = &unk_1E7CD5E18;
  v8 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)a4, block);

}

void __39__TailSpinHelper_clearDirectory_queue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[TailSpinHelper getTailSpinDir:](TailSpinHelper, "getTailSpinDir:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[TailSpinHelper isValidToDeleteTailSpinDir:](TailSpinHelper, "isValidToDeleteTailSpinDir:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "removeItemAtPath:error:", v2, 0);

    +[TailSpinHelper getLogger](TailSpinHelper, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v2;
        _os_log_impl(&dword_1C2F2D000, v6, OS_LOG_TYPE_INFO, "TailSpinHelper#clearDirectory cleaned up directory: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __39__TailSpinHelper_clearDirectory_queue___block_invoke_cold_1((uint64_t)v2, v6, v13, v14, v15, v16, v17, v18);
    }
  }
  else
  {
    +[TailSpinHelper getLogger](TailSpinHelper, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __39__TailSpinHelper_clearDirectory_queue___block_invoke_cold_2((uint64_t)v2, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (void)dumpTailSpinOutputToFile:(uint64_t)a3 suiteName:(uint64_t)a4 options:(uint64_t)a5 queue:(uint64_t)a6 handler:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C2F2D000, a2, a3, "TailSpinHelper#dumpTailSpinOutputToFile unable to create directory %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __75__TailSpinHelper_dumpTailSpinOutputToFile_suiteName_options_queue_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1C2F2D000, a2, a3, "TailSpinHelper#dumpTailSpinOutputToFile enforcing minimum time interval (%d s) between tailspins, not creating new file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __39__TailSpinHelper_clearDirectory_queue___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C2F2D000, a2, a3, "TailSpinHelper#clearDirectory failed to clean up directory: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __39__TailSpinHelper_clearDirectory_queue___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1C2F2D000, a2, a3, "TailSpinHelper#clearDirectory enforcing minimum time interval (%d s) for deleting directory %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
