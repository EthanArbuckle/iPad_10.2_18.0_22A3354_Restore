@implementation UIResponder(SKUIExtensions)

- (uint64_t)_SKUIView
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[UIResponder(SKUIExtensions) _SKUIView].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldLog");
  if (objc_msgSend(v12, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  objc_msgSend(v12, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    v14 &= 2u;
  if (!v14)
    goto LABEL_13;
  NSStringFromSelector(a2);
  v19 = 138412546;
  v20 = a1;
  v21 = 2112;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 22;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v19, v18);
    v15 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog();
LABEL_13:

  }
  return 0;
}

- (void)_SKUIView
{
  OUTLINED_FUNCTION_1();
}

@end
