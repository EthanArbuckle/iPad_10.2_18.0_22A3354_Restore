@implementation PXOpenURL

uint64_t __PXOpenURL_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLUserStatusUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)a2)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v6 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v6;
    v7 = "Did open URL: %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v10;
    v7 = "Failed to open URL: %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1A6789000, v8, v9, v7, (uint8_t *)&v12, 0xCu);
LABEL_7:

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
