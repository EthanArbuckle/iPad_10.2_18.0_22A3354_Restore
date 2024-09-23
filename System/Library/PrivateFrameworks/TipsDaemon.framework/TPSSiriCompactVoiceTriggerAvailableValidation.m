@implementation TPSSiriCompactVoiceTriggerAvailableValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v5 = (void *)getAFPreferencesClass_softClass;
  v23 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __getAFPreferencesClass_block_invoke;
    v18 = &unk_1EA1DF510;
    v19 = &v20;
    __getAFPreferencesClass_block_invoke((uint64_t)&v15);
    v5 = (void *)v21[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v6, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v9 = (void *)getVTPreferencesClass_softClass;
  v23 = getVTPreferencesClass_softClass;
  if (!getVTPreferencesClass_softClass)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __getVTPreferencesClass_block_invoke;
    v18 = &unk_1EA1DF510;
    v19 = &v20;
    __getVTPreferencesClass_block_invoke((uint64_t)&v15);
    v9 = (void *)v21[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v10, "sharedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isCompactVoiceTriggerAvailableForLanguageCode:", v8);
  v13 = v12 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[TPSSiriCompactVoiceTriggerAvailableValidation validateWithCompletion:].cold.1(self, v13, v14);

  v4[2](v4, v13, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "targetContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 1024;
  v13 = a2 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);

}

@end
