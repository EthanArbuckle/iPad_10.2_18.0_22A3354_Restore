@implementation REMRegulatoryLogger

- (REMRegulatoryLogger)init
{
  REMRegulatoryLogger *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v8.receiver = self;
  v8.super_class = (Class)REMRegulatoryLogger;
  v2 = -[REMRegulatoryLogger init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend((id)*MEMORY[0x1E0D84760], "cStringUsingEncoding:", 1);
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v4 = getct_green_tea_logger_createSymbolLoc_ptr;
    v12 = getct_green_tea_logger_createSymbolLoc_ptr;
    if (!getct_green_tea_logger_createSymbolLoc_ptr)
    {
      v5 = (void *)libCTGreenTeaLoggerLibrary();
      v4 = dlsym(v5, "ct_green_tea_logger_create");
      v10[3] = (uint64_t)v4;
      getct_green_tea_logger_createSymbolLoc_ptr = v4;
    }
    _Block_object_dispose(&v9, 8);
    if (!v4)
    {
      v7 = (_Unwind_Exception *)-[REMRegulatoryLogger init].cold.1();
      _Block_object_dispose(&v9, 8);
      _Unwind_Resume(v7);
    }
    v2->_greenTeaLogger = (ct_green_tea_logger_s *)((uint64_t (*)(uint64_t))v4)(v3);
  }
  return v2;
}

+ (id)sharedLogger
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__REMRegulatoryLogger_sharedLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLogger_onceToken != -1)
    dispatch_once(&sharedLogger_onceToken, block);
  return (id)sharedLogger_logger;
}

void __35__REMRegulatoryLogger_sharedLogger__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedLogger_logger;
  sharedLogger_logger = (uint64_t)v0;

}

+ (int64_t)attachmentTypeFromUTType:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC450]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC640]))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)attachmentAddedForUTType:(id)a3
{
  objc_msgSend(a1, "attachmentAddedForType:", objc_msgSend(a1, "attachmentTypeFromUTType:", a3));
}

+ (void)attachmentAddedForType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;

  objc_msgSend(a1, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "greenTeaLogger");

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0D84590], "utility");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        +[REMRegulatoryLogger attachmentAddedForType:].cold.4();
      goto LABEL_20;
    case 1:
      objc_msgSend(MEMORY[0x1E0D84590], "utility");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[REMRegulatoryLogger attachmentAddedForType:].cold.1();

      soft_getCTGreenTeaOsLogHandle(v5);
      v8 = objc_claimAutoreleasedReturnValue();
      v6 = v8;
      if (!v8 || !os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      v17 = 0;
      v9 = "Reading audio data";
      v10 = (uint8_t *)&v17;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0D84590], "utility");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[REMRegulatoryLogger attachmentAddedForType:].cold.2();

      soft_getCTGreenTeaOsLogHandle(v5);
      v12 = objc_claimAutoreleasedReturnValue();
      v6 = v12;
      if (!v12 || !os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      v16 = 0;
      v9 = "Reading video data";
      v10 = (uint8_t *)&v16;
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0D84590], "utility");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[REMRegulatoryLogger attachmentAddedForType:].cold.3();

      soft_getCTGreenTeaOsLogHandle(v5);
      v14 = objc_claimAutoreleasedReturnValue();
      v6 = v14;
      if (!v14 || !os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      v15 = 0;
      v9 = "Reading image/photo data";
      v10 = (uint8_t *)&v15;
      break;
    default:
      return;
  }
  _os_log_impl(&dword_1A442D000, v6, OS_LOG_TYPE_INFO, v9, v10, 2u);
LABEL_20:

}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (uint64_t)init
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[REMRegulatoryLogger attachmentAddedForType:].cold.1(v0);
}

+ (void)attachmentAddedForType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A442D000, v0, v1, "%{public}@: Reading audio data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)attachmentAddedForType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A442D000, v0, v1, "%{public}@: Reading video data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)attachmentAddedForType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A442D000, v0, v1, "%{public}@: Reading image/photo data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)attachmentAddedForType:.cold.4()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v2 = 2048;
  v3 = 0;
  _os_log_debug_impl(&dword_1A442D000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: Reading other data {type: %ld}", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
