@implementation SYFileExtendedAttributes

void __72__SYFileExtendedAttributes_fetchPrivateAttributesForFileURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138478339;
    v11 = v8;
    v12 = 2113;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "Finished fetching private attributes for url path: %{private}@, attrs: %{private}@, error: %@", (uint8_t *)&v10, 0x20u);

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

+ (void)fetchPrivateAttributesForFileURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("fileURL must not be nil"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v7 = v6;
  v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v16 = v9;
    _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_INFO, "Fetching private attributes for url path: %{private}@", buf, 0xCu);

  }
  v13 = v5;
  v14 = v7;
  v10 = v7;
  v11 = v5;
  _MDItemFetchPrivateAttributesForURL();

}

+ (void)setPrivateAttributes:(id)a3 forFileURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    v17 = CFSTR("attributes must not be nil");
    goto LABEL_8;
  }
  if (!v8)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    v17 = CFSTR("fileURL must not be nil");
LABEL_8:
    objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v10 = v9;
  v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v22 = v7;
    v23 = 2113;
    v24 = v12;
    _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_INFO, "Setting private attributes: %{private}@, for url path: %{private}@", buf, 0x16u);

  }
  v19 = v8;
  v20 = v10;
  v13 = v10;
  v14 = v8;
  _MDItemSetPrivateAttributesForURL();

}

void __71__SYFileExtendedAttributes_setPrivateAttributes_forFileURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138478083;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_INFO, "Finished setting private attributes for url path: %{private}@, error: %@", (uint8_t *)&v7, 0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

@end
