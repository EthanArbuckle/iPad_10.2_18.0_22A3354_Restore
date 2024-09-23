@implementation ATXDeserializeTriggers

id __ATXDeserializeTriggers_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  v2 = a2;
  v3 = (void *)MEMORY[0x1D82448B0]();
  v4 = (void *)MEMORY[0x1E0CB3710];
  ATXTriggerAllTypes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v5, v2, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;

  objc_autoreleasePoolPop(v3);
  if (!v6)
  {
    __atxlog_handle_modes();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __ATXDeserializeTriggers_block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  }
  return v6;
}

void __ATXDeserializeTriggers_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D2C00000, a2, a3, "Could not deserialize trigger: %@", a5, a6, a7, a8, 2u);
}

@end
