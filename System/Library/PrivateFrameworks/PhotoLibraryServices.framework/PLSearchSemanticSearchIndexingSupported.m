@implementation PLSearchSemanticSearchIndexingSupported

void __PLSearchSemanticSearchIndexingSupported_block_invoke(uint64_t a1)
{
  NSObject *v2;
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLSearchBackendQueryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 32))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v4 = v3;
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "PlatformSupported: %@", (uint8_t *)&v10, 0xCu);

  }
  PLSearchBackendQueryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 33))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = v6;
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "EmbeddingDonation: %@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("PLSearchSemanticSearchSupported"));

  if (v9)
  {
    PLSearchSemanticSearchIndexingSupported_semanticSearchOverride = 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLSearchSemanticSearchSupported is overridden to YES via defaults.", (uint8_t *)&v10, 2u);
    }
  }
}

@end
