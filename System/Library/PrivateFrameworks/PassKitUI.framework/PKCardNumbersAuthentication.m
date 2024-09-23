@implementation PKCardNumbersAuthentication

+ (void)locationBasedAuthenticationContextWithCompletion:(id)a3
{
  objc_msgSend(a1, "authenticationContextLocationBased:completion:", 1, a3);
}

+ (void)authenticationContextWithCompletion:(id)a3
{
  objc_msgSend(a1, "authenticationContextLocationBased:completion:", 0, a3);
}

+ (void)authenticationContextLocationBased:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v4 = a3;
  v18[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v17[0] = &unk_1E3FACBB0;
    PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_AUTHENTICATION_REASON"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v17[1] = &unk_1E3FACBC8;
    PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_PASSCODE_AUTHENTICATION_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    v17[2] = &unk_1E3FACBE0;
    PKDeviceName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_PASSCODE_AUTHENTICATION_REASON"), CFSTR("%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = &unk_1E3FACBF8;
    v18[2] = v10;
    v18[3] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v12 = 1025;
    else
      v12 = 2;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__PKCardNumbersAuthentication_authenticationContextLocationBased_completion___block_invoke;
    v14[3] = &unk_1E3E618C8;
    v15 = v6;
    v16 = v5;
    v13 = v6;
    objc_msgSend(v13, "evaluatePolicy:options:reply:", v12, v11, v14);

  }
}

void __77__PKCardNumbersAuthentication_authenticationContextLocationBased_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v8 && !v5)
  {
    v7 = *(void (**)(void))(v6 + 16);
LABEL_6:
    v7();
    goto LABEL_7;
  }
  if (v6)
  {
    v7 = *(void (**)(void))(v6 + 16);
    goto LABEL_6;
  }
LABEL_7:

}

+ (id)genericDisplayableVirtualCardError
{
  void *v2;
  void *v3;
  void *v4;

  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_ERROR_GENERIC_ERROR_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_ERROR_GENERIC_ERROR_MESSAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustom();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)rateLimitDisplayableVirtualCardError
{
  void *v2;
  void *v3;

  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_ERROR_RATE_LIMIT_ERROR_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustom();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
