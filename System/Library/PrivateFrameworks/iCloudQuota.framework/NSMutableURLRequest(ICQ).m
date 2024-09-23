@implementation NSMutableURLRequest(ICQ)

- (id)icq_sanitizedHeadersForDynamicUI
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "allHTTPHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__NSMutableURLRequest_ICQ__icq_sanitizedHeadersForDynamicUI__block_invoke;
  v6[3] = &unk_1E8B3A350;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  return v4;
}

- (void)icq_addHeadersForUpgradeWithCompletion:()ICQ
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)getINDaemonConnectionClass_softClass_3;
  v16 = getINDaemonConnectionClass_softClass_3;
  v6 = MEMORY[0x1E0C809B0];
  if (!getINDaemonConnectionClass_softClass_3)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getINDaemonConnectionClass_block_invoke_3;
    v12[3] = &unk_1E8B384E8;
    v12[4] = &v13;
    __getINDaemonConnectionClass_block_invoke_3((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  v8 = objc_alloc_init(v7);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __67__NSMutableURLRequest_ICQ__icq_addHeadersForUpgradeWithCompletion___block_invoke;
  v10[3] = &unk_1E8B3A378;
  v10[4] = a1;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "commonHeadersForRequest:withCompletion:", a1, v10);

}

- (void)icq_renewAuthorizationHeadersForAccount:()ICQ store:completion:
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  void (**v23)(id, _QWORD);
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "aa_primaryAppleAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    objc_msgSend(v11, "aa_altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "aa_altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v14)
    {
      _ICQGetLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[NSMutableURLRequest(ICQ) icq_renewAuthorizationHeadersForAccount:store:completion:].cold.1((uint64_t)a1, v15);
LABEL_5:

      v10[2](v10, 0);
      goto LABEL_13;
    }
  }
  else
  {
    _ICQGetLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "Account not provided, skipping check", buf, 2u);
    }

  }
  if (objc_msgSend(a1, "icq_hasAuthHeaders"))
  {
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = a1;
      _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "request already has auth headers. request: %@", buf, 0xCu);
    }

    v10[2](v10, 1);
  }
  else
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (!v12)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "Missing auth headers and no account provided or found, unable to renew credentials.", buf, 2u);
      }
      goto LABEL_5;
    }
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      v27 = a1;
      _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "Missing auth header or client info header, attempting to renew credentials. request: %@", buf, 0xCu);
    }

    v19 = *MEMORY[0x1E0C8F320];
    v24[0] = *MEMORY[0x1E0C8F330];
    v24[1] = v19;
    v25[0] = MEMORY[0x1E0C9AAA0];
    v25[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85__NSMutableURLRequest_ICQ__icq_renewAuthorizationHeadersForAccount_store_completion___block_invoke;
    v21[3] = &unk_1E8B3A3A0;
    v21[4] = a1;
    v22 = v12;
    v23 = v10;
    objc_msgSend(v9, "renewCredentialsForAccount:options:completion:", v22, v20, v21);

  }
LABEL_13:

}

- (BOOL)icq_hasAuthHeaders
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "valueForHTTPHeaderField:", CFSTR("Authorization"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "valueForHTTPHeaderField:", CFSTR("X-MMe-Client-Info"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)icq_renewAuthorizationHeadersForAccount:()ICQ store:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[NSMutableURLRequest(ICQ) icq_renewAuthorizationHeadersForAccount:store:completion:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_ERROR, "%s account change detected while validating auth headers. request %@", (uint8_t *)&v2, 0x16u);
}

@end
