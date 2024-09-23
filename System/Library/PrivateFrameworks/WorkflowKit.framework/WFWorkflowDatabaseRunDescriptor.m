@implementation WFWorkflowDatabaseRunDescriptor

void __116__WFWorkflowDatabaseRunDescriptor_Conversion__donateRunInteractionWithDatabase_workflowReference_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFGeneralLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "-[WFWorkflowDatabaseRunDescriptor(Conversion) donateRunInteractionWithDatabase:workflowReference:completionH"
            "andler:]_block_invoke";
      v16 = 2112;
      v17 = v6;
      v18 = 2114;
      v19 = v3;
      v7 = "%s Failed to donate interaction for %@: %{public}@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 32;
LABEL_6:
      _os_log_impl(&dword_1C15B3000, v8, v9, v7, (uint8_t *)&v14, v10);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[WFWorkflowDatabaseRunDescriptor(Conversion) donateRunInteractionWithDatabase:workflowReference:completionHan"
          "dler:]_block_invoke";
    v16 = 2112;
    v17 = v6;
    v7 = "%s Successfully donated interaction for %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 22;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11, v12, v13);
}

@end
