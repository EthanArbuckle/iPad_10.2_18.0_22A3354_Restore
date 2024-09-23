@implementation TPSContactsMeCardValidation

- (void)validateWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD, id);
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DBF348];
  v5 = (void (**)(id, _QWORD, id))a3;
  if ((objc_msgSend(v4, "isGreenTeaDevice") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[TPSContactsMeCardValidation validateWithCompletion:].cold.2(self, v6);
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v13[0] = *MEMORY[0x1E0C966E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    -[NSObject _crossPlatformUnifiedMeContactWithKeysToFetch:error:](v6, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v9, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;

    v8 = (v10 == 0) ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue");
  }

  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v8, v11);

  v5[2](v5, v8, v7);
}

- (void)validateWithCompletion:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "Skipping %@ validation", (uint8_t *)&v4, 0xCu);

}

@end
