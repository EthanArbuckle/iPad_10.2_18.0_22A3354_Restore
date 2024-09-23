@implementation ACAccountStore

void __94__ACAccountStore_SLGoogle__sl_openGoogleAuthenticationSheetWithAccountDescription_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("token"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("refreshToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("username"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id, void *, void *, id))(v6 + 16))(v6, a2, v11, v9, v10, v7);
}

void __95__ACAccountStore_SLGoogle__sl_openYouTubeAuthenticationSheetWithAccountDescription_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("token"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("refreshToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("username"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("youTubeUsername"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id, void *, void *, void *, id))(v6 + 16))(v6, a2, v12, v9, v10, v11, v7);
}

void __104__ACAccountStore_SLGoogle__sl_openYouTubeAuthenticationSheetWithUsername_accountDescription_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("token"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("refreshToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("username"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("youTubeUsername"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id, void *, void *, void *, id))(v6 + 16))(v6, a2, v12, v9, v10, v11, v7);
}

uint64_t __114__ACAccountStore_SLGoogle__sl_openGoogleAuthenticationSheetForAccount_shouldConfirm_delegateClassName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
