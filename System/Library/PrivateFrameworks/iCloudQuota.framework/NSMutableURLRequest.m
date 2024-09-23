@implementation NSMutableURLRequest

void __60__NSMutableURLRequest_ICQ__icq_sanitizedHeadersForDynamicUI__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const __CFString *v6;
  id v7;
  __CFString *v8;

  v8 = a2;
  v5 = a3;
  if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Authorization")))
  {
    v6 = CFSTR("Authorization-iCloud");
    v7 = v5;
  }
  else
  {
    v7 = v5;
    v6 = v8;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "allHTTPHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addEntriesFromDictionary:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setAllHTTPHeaderFields:", v6);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_activeiTunesAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "ams_DSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v9, "ams_DSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forHTTPHeaderField:", v13, CFSTR("X-Apple-Itunes-DSID"));

    }
  }
  if (+[_ICQHelperFunctions defaultKeyExists:](_ICQHelperFunctions, "defaultKeyExists:", CFSTR("_ICQPlaceholderResponse")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("x-apple-placeholderReplacement-simulate"));
  }
  if (+[_ICQHelperFunctions defaultKeyExists:](_ICQHelperFunctions, "defaultKeyExists:", CFSTR("EnableBundles")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", CFSTR("default"), CFSTR("x-apple-bundleoffer-simulate"));
  }
  _ICQGetLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "allHTTPHeaderFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "HTTPBody");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithData:encoding:", v17, 4);
    *(_DWORD *)buf = 138412546;
    v25 = v15;
    v26 = 2112;
    v27 = v18;
    _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "Request headers: %@, body (decoded from data): %@", buf, 0x16u);

  }
  _ICQGetLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_cold_1(v19);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_23;
  v21[3] = &unk_1E8B39F90;
  v20 = *(void **)(a1 + 40);
  v22 = *(id *)(a1 + 32);
  v23 = v20;
  objc_msgSend(v22, "icq_renewAuthorizationHeadersForAccount:store:completion:", 0, 0, v21);

}

uint64_t __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_23(uint64_t a1, char a2)
{
  NSObject *v4;

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_23_cold_1(a2, a1, v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __85__NSMutableURLRequest_ICQ__icq_renewAuthorizationHeadersForAccount_store_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[NSMutableURLRequest(ICQ) icq_renewAuthorizationHeadersForAccount:store:completion:]_block_invoke";
    v11 = 2048;
    v12 = a2;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "%s renew credentials returned with result %lu, error %@", (uint8_t *)&v9, 0x20u);
  }

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 32), "ak_addClientInfoHeader");
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "icq_hasAuthHeaders");
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 67109120;
    LODWORD(v10) = v7;
    _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "validateAuthorizationHeaders completed renew credentials with success: %d", (uint8_t *)&v9, 8u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_DEBUG, "Validating auth headers", v1, 2u);
}

void __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke_23_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 32);
  v4[0] = 67109378;
  v4[1] = a1 & 1;
  v5 = 2112;
  v6 = v3;
  _os_log_debug_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_DEBUG, "Auth headers validated with success: %d request: %@", (uint8_t *)v4, 0x12u);
}

@end
