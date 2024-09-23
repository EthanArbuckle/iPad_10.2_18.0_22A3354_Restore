@implementation WFINShortcutRunDescriptor

void __110__WFINShortcutRunDescriptor_Conversion__donateRunInteractionWithDatabase_workflowReference_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFGeneralLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v15 = 136315650;
      v16 = "-[WFINShortcutRunDescriptor(Conversion) donateRunInteractionWithDatabase:workflowReference:completionHandler:]_block_invoke";
      v17 = 2112;
      v18 = v6;
      v19 = 2114;
      v20 = v3;
      v7 = "%s Failed to donate interaction for %@: %{public}@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 32;
LABEL_6:
      _os_log_impl(&dword_1C15B3000, v8, v9, v7, (uint8_t *)&v15, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v15 = 136315394;
    v16 = "-[WFINShortcutRunDescriptor(Conversion) donateRunInteractionWithDatabase:workflowReference:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v11;
    v7 = "%s Successfully donated interaction for %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 22;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v12, v13, v14);
}

@end
