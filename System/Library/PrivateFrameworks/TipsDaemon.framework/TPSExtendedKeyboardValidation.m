@implementation TPSExtendedKeyboardValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *i;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  +[TPSKeyboardUtilities installedInputModes](TPSKeyboardUtilities, "installedInputModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = ((char *)i + 1))
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (+[TPSKeyboardUtilities isExtendedSuggestionSupportedForInputMode:](TPSKeyboardUtilities, "isExtendedSuggestionSupportedForInputMode:", v10, (_QWORD)v13))
          {
            objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
              -[TPSExtendedKeyboardValidation validateWithCompletion:].cold.2(v10, v7);

            LODWORD(v7) = 1;
            goto LABEL_15;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    LODWORD(v7) = 0;
  }
  v11 = v7 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue", (_QWORD)v13) ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v11, v12);

  v4[2](v4, v11, 0);
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "Found keyboard with extended suggestion support: %@", (uint8_t *)&v2, 0xCu);
}

@end
