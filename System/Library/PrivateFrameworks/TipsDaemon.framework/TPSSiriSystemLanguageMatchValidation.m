@implementation TPSSiriSystemLanguageMatchValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = -[TPSSiriSystemLanguageMatchValidation getCurrentState](self, "getCurrentState");
  v6 = v5 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v6, v7);

  v4[2](v4, v6, 0);
}

- (BOOL)getCurrentState
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = (uint64_t)&v19;
  v21 = 0x2020000000;
  v2 = getAFAssistantRestrictedSymbolLoc_ptr_0;
  v22 = getAFAssistantRestrictedSymbolLoc_ptr_0;
  if (!getAFAssistantRestrictedSymbolLoc_ptr_0)
  {
    v3 = (void *)AssistantServicesLibrary();
    v2 = dlsym(v3, "AFAssistantRestricted");
    *(_QWORD *)(v20 + 24) = v2;
    getAFAssistantRestrictedSymbolLoc_ptr_0 = v2;
  }
  _Block_object_dispose(&v19, 8);
  if (!v2)
  {
    -[TPSHeySiriEnabledValidation getCurrentState].cold.1();
    __break(1u);
  }
  if ((((uint64_t (*)(void))v2)() & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v6 = (void *)getAFPreferencesClass_softClass_0;
    v27 = getAFPreferencesClass_softClass_0;
    if (!getAFPreferencesClass_softClass_0)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = (uint64_t)__getAFPreferencesClass_block_invoke_0;
      v22 = &unk_1EA1DF510;
      v23 = &v24;
      __getAFPreferencesClass_block_invoke_0((uint64_t)&v19);
      v6 = (void *)v25[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v7, "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      v10 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredLocalizationsFromArray:forPreferences:", v5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0CB34D0];
      v28[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferredLocalizationsFromArray:forPreferences:", v5, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = objc_msgSend(v13, "isEqualToString:", v17);
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSSiriSystemLanguageMatchValidation getCurrentState](self, "getCurrentState"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v6, v7, 0);

}

@end
