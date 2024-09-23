@implementation TPSSiriEnabledValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = -[TPSSiriEnabledValidation getCurrentState](self, "getCurrentState");
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
  id v6;
  void *v7;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v10 = 0;
  v11 = (uint64_t)&v10;
  v12 = 0x2020000000;
  v2 = getAFAssistantRestrictedSymbolLoc_ptr_2;
  v13 = getAFAssistantRestrictedSymbolLoc_ptr_2;
  if (!getAFAssistantRestrictedSymbolLoc_ptr_2)
  {
    v3 = (void *)AssistantServicesLibrary_1();
    v2 = dlsym(v3, "AFAssistantRestricted");
    *(_QWORD *)(v11 + 24) = v2;
    getAFAssistantRestrictedSymbolLoc_ptr_2 = v2;
  }
  _Block_object_dispose(&v10, 8);
  if (!v2)
  {
    v9 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState].cold.1();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v9);
  }
  if ((((uint64_t (*)(void))v2)() & 1) != 0)
    return 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getAFPreferencesClass_softClass_2;
  v18 = getAFPreferencesClass_softClass_2;
  if (!getAFPreferencesClass_softClass_2)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = (uint64_t)__getAFPreferencesClass_block_invoke_2;
    v13 = &unk_1EA1DF510;
    v14 = &v15;
    __getAFPreferencesClass_block_invoke_2((uint64_t)&v10);
    v5 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v6, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "assistantIsEnabled");

  return v4;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSSiriEnabledValidation getCurrentState](self, "getCurrentState"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v6, v7, 0);

}

@end
