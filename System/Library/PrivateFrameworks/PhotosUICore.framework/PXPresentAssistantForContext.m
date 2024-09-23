@implementation PXPresentAssistantForContext

uint64_t __PXPresentAssistantForContext_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "presentViewController:animated:completion:", a2, 1, 0);
  else
    return objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
}

void ___PXPresentAssistantForContext_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 IsUserCanceledError;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v10 = a1[4];
    v19 = 138412290;
    v20 = v10;
    v9 = "Assistant completed for context: %@";
    goto LABEL_7;
  }
  IsUserCanceledError = PXAssistantIsUserCanceledError(v3);
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (IsUserCanceledError)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v8 = a1[4];
    v19 = 138412290;
    v20 = v8;
    v9 = "Assistant cancelled by user for context: %@";
LABEL_7:
    v11 = v7;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 12;
    goto LABEL_10;
  }
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    goto LABEL_11;
  v14 = a1[4];
  v19 = 138412546;
  v20 = v14;
  v21 = 2112;
  v22 = v4;
  v9 = "Assistant did fail for context: %@, error: %@";
  v11 = v7;
  v12 = OS_LOG_TYPE_ERROR;
  v13 = 22;
LABEL_10:
  _os_log_impl(&dword_1A6789000, v11, v12, v9, (uint8_t *)&v19, v13);
LABEL_11:

  v15 = *(_QWORD *)(a1[8] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], a1[5], 0, v17);
  v18 = a1[7];
  if (v18)
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v4);

}

@end
