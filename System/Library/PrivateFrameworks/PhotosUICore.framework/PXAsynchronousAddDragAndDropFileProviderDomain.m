@implementation PXAsynchronousAddDragAndDropFileProviderDomain

void __PXAsynchronousAddDragAndDropFileProviderDomain_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLDragAndDropGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v2;
      v5 = "Failed to add drag and drop domain with error: %@";
      v6 = v4;
      v7 = OS_LOG_TYPE_ERROR;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    v5 = "Successfully added drag and drop domain.";
    v6 = v4;
    v7 = OS_LOG_TYPE_DEFAULT;
    v8 = 2;
    goto LABEL_6;
  }

}

@end
