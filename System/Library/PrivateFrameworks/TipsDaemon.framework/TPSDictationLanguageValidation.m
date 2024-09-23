@implementation TPSDictationLanguageValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (!+[TPSKeyboardUtilities isDictationEnabled](TPSKeyboardUtilities, "isDictationEnabled"))
  {
    v9 = 0;
    goto LABEL_13;
  }
  -[TPSTargetingValidation value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "TPSSafeArrayForKey:", CFSTR("values"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "TPSSafeStringForKey:", CFSTR("joinType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("AND")))
    {
      v8 = objc_msgSend(v6, "na_all:", &__block_literal_global);
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("OR")))
      {
        v9 = 0;
        goto LABEL_11;
      }
      v8 = objc_msgSend(v6, "na_any:", &__block_literal_global_9);
    }
    v9 = v8;
LABEL_11:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

LABEL_13:
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v9, v10);

  v4[2](v4, v9, 0);
}

BOOL __57__TPSDictationLanguageValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TPSKeyboardUtilities isDictationSelectedForLanguage:](TPSKeyboardUtilities, "isDictationSelectedForLanguage:", a2);
}

BOOL __57__TPSDictationLanguageValidation_validateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[TPSKeyboardUtilities isDictationSelectedForLanguage:](TPSKeyboardUtilities, "isDictationSelectedForLanguage:", a2);
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
