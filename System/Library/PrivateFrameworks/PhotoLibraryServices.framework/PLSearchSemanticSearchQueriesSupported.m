@implementation PLSearchSemanticSearchQueriesSupported

void __PLSearchSemanticSearchQueriesSupported_block_invoke(uint64_t a1)
{
  NSObject *v2;
  __CFString *v3;
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  int v8;
  int v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLSearchBackendQueryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(__CFString **)(a1 + 32);
    v9 = 134217984;
    v10 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "GMAvailabilityStatus: %tu", (uint8_t *)&v9, 0xCu);
  }

  PLSearchBackendQueryGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    v6 = v5;
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "EmbeddingDonation: %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("PLSearchSemanticSearchSupported"));

  if (v8)
  {
    PLSearchSemanticSearchQueriesSupported_semanticSearchOverride = 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLSearchSemanticSearchSupported is overridden to YES via defaults.", (uint8_t *)&v9, 2u);
    }
  }
}

@end
