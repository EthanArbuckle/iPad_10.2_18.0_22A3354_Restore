@implementation NSUserActivity(SYDocumentWorkflows_Internal_NonDirect)

+ (id)_syReturnToSenderActivityWithOriginalUserActivity:()SYDocumentWorkflows_Internal_NonDirect
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".returntosender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", v5);
  objc_msgSend(v6, "set_syOriginalUserActivity:", v3);
  objc_msgSend(v3, "_syRelatedUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "set_syRelatedUniqueIdentifier:", v7);
  return v6;
}

- (void)set_syShouldCreateNewMessage:()SYDocumentWorkflows_Internal_NonDirect
{
  id v3;
  void *v4;
  char v5;

  v5 = a3;
  v3 = a1;
  objc_sync_enter(v3);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setPayload:object:identifier:", v4, 0, CFSTR("com.apple.synapse.shouldCreateNewMessage"));

  objc_sync_exit(v3);
}

- (void)set_syOriginalUserActivity:()SYDocumentWorkflows_Internal_NonDirect
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v15 = 0;
  objc_msgSend(v4, "_createUserActivityDataWithSaving:options:error:", 0, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v7)
  {
    v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NSUserActivity(SYDocumentWorkflows_Internal_NonDirect) set_syOriginalUserActivity:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  }
  if (v6)
    objc_msgSend(v5, "_setPayload:object:identifier:", v6, 0, CFSTR("com.apple.synapse.originalUserActivity"));

  objc_sync_exit(v5);
}

- (void)set_syOriginalUserActivity:()SYDocumentWorkflows_Internal_NonDirect .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Unable to archive user activity, error: %@", a5, a6, a7, a8, 2u);
}

@end
