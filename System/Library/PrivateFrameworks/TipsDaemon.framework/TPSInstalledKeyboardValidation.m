@implementation TPSInstalledKeyboardValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[TPSTargetingValidation arrayValue](self, "arrayValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTargetingValidation value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "TPSSafeArrayForKey:", CFSTR("values"));
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "TPSSafeStringForKey:", CFSTR("joinType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AND")) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("OR")))
      {
LABEL_7:

        v5 = (void *)v7;
        goto LABEL_8;
      }
      v9 = 1;
    }
    -[TPSTargetingValidation setJoinType:](self, "setJoinType:", v9);
    goto LABEL_7;
  }
LABEL_8:
  v10 = -[TPSTargetingValidation joinType](self, "joinType");
  if (v10 == 1)
  {
    v11 = objc_msgSend(v5, "na_any:", &__block_literal_global_9_0);
    goto LABEL_12;
  }
  if (!v10)
  {
    v11 = objc_msgSend(v5, "na_all:", &__block_literal_global_10);
LABEL_12:
    v12 = v11;
    goto LABEL_14;
  }
  v12 = 0;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v12, v13);

  v4[2](v4, v12, 0);
}

BOOL __57__TPSInstalledKeyboardValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TPSKeyboardUtilities isInputModeInstalledForLanguage:](TPSKeyboardUtilities, "isInputModeInstalledForLanguage:", a2);
}

BOOL __57__TPSInstalledKeyboardValidation_validateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[TPSKeyboardUtilities isInputModeInstalledForLanguage:](TPSKeyboardUtilities, "isInputModeInstalledForLanguage:", a2);
}

@end
