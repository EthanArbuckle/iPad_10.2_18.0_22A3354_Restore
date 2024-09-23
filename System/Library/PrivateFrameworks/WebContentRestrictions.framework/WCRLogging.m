@implementation WCRLogging

+ (void)log:(id)a3 withType:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (log_withType__onceToken != -1)
    dispatch_once(&log_withType__onceToken, &__block_literal_global_1);
  switch(a4)
  {
    case 1uLL:
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_ERROR))
        +[WCRLogging log:withType:].cold.1();
      break;
    case 2uLL:
      v9 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_INFO))
      {
        v10 = 138543362;
        v11 = v5;
        v7 = v9;
        v8 = OS_LOG_TYPE_INFO;
        goto LABEL_10;
      }
      break;
    case 3uLL:
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_DEBUG))
        +[WCRLogging log:withType:].cold.2();
      break;
    case 4uLL:
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_FAULT))
        +[WCRLogging log:withType:].cold.4();
      break;
    case 5uLL:
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_DEBUG))
        +[WCRLogging log:withType:].cold.3();
      break;
    default:
      v6 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = v5;
        v7 = v6;
        v8 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl(&dword_24A43B000, v7, v8, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
      break;
  }

}

void __27__WCRLogging_log_withType___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.webcontentrestrictions", "WebContentRestrictions");
  v1 = (void *)osLogHandle;
  osLogHandle = (uint64_t)v0;

}

+ (void)log:withType:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_24A43B000, v0, OS_LOG_TYPE_ERROR, "%{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)log:withType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24A43B000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)log:withType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24A43B000, v0, v1, "%{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)log:withType:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_24A43B000, v0, OS_LOG_TYPE_FAULT, "%{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
