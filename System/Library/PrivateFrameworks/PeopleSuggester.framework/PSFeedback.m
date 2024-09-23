@implementation PSFeedback

uint64_t __28___PSFeedback_donateToBiome__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

id __28___PSFeedback_donateToBiome__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v12;
  if (v3)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __28___PSFeedback_donateToBiome__block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return v2;
}

void __28___PSFeedback_donateToBiome__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Error converting NSDictionary to NSData: %@", a5, a6, a7, a8, 2u);
}

@end
