@implementation INImage

void __73__INImage_Workflow__wf_transformUsingCodableAttribute_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    getWFIntentExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[INImage(Workflow) wf_transformUsingCodableAttribute:completionHandler:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Failed to retrieve INImage data with error: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
