@implementation TPSHeySiriEverUsedValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = -[TPSHeySiriEverUsedValidation getCurrentState](self, "getCurrentState");
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
  id v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getVTPreferencesClass_softClass_0;
  v11 = getVTPreferencesClass_softClass_0;
  if (!getVTPreferencesClass_softClass_0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getVTPreferencesClass_block_invoke_0;
    v7[3] = &unk_1EA1DF510;
    v7[4] = &v8;
    __getVTPreferencesClass_block_invoke_0((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "voiceTriggerWasEverUsed");

  return v5;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSHeySiriEverUsedValidation getCurrentState](self, "getCurrentState"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v6, v7, 0);

}

@end
