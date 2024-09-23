@implementation VKAssert

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 alertMessage:(id)a7 format:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 isInternalBuild;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;

  v9 = a6;
  v10 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = (objc_class *)MEMORY[0x1E0CB3940];
  v15 = a8;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithFormat:arguments:", v15, &v47);

  v17 = os_log_create("com.apple.VisionKit", "Assert");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v41 = a3;
    v42 = 2080;
    v43 = a4;
    v44 = 2112;
    v45 = v16;
    _os_log_error_impl(&dword_1D2E0D000, v17, OS_LOG_TYPE_ERROR, "Failed assertion (%s) in %s: %@", buf, 0x20u);
  }

  if (v10)
  {
    v18 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:].cold.1((uint64_t)v16, v18, v19, v20, v21, v22, v23, v24);

  }
  if (v9)
  {
    isInternalBuild = vk_isInternalBuild();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "environment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("SuppressAssertionAlerts"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "BOOLValue");

    if (isInternalBuild && (v29 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notes TTR: %@"), v16);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed assertion (%s) in %s:\n%@"), a3, a4, v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I got this alert right after I...\n\n%@"), v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v33 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:].cold.1((uint64_t)v16, v33, v34, v35, v36, v37, v38, v39);

      }
      +[VKRadarUtilities promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:](VKRadarUtilities, "promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:", v13, v30, v32);

    }
  }
  NSLog(CFSTR("💔💔💔 Failed Assert in %s 💔💔💔: %@"), a4, v16);

}

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 format:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  objc_class *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v7 = a6;
  v8 = a5;
  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a7;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &v15);

  objc_msgSend(a1, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:", a3, a4, v8, v7, CFSTR("You encountered a serious bug in Notes. Will you please file a Radar?"), CFSTR("%@"), v14);
}

+ (void)handleFailedAssertWithCondition:(uint64_t)a3 functionName:(uint64_t)a4 simulateCrash:(uint64_t)a5 showAlert:(uint64_t)a6 alertMessage:(uint64_t)a7 format:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D2E0D000, a2, a3, "%@", a5, a6, a7, a8, 2u);
}

@end
