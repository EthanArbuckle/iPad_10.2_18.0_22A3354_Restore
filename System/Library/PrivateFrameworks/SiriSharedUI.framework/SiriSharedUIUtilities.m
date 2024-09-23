@implementation SiriSharedUIUtilities

+ (id)substringRangesContainingEmojiInString:(id)a3
{
  id v3;
  id v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v3 = a3;
  if (CEMStringContainsEmoji())
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__0;
    v10 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "length");
    CEMEnumerateEmojiTokensInStringWithBlock();
    v4 = (id)v7[5];
    _Block_object_dispose(&v6, 8);

  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

void __64__SiriSharedUIUtilities_substringRangesContainingEmojiInString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  id v9;

  if (a4 != 0x7FFFFFFFFFFFFFFFLL && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "emojiIsValid:", a2))
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }
}

+ (BOOL)emojiIsValid:(__EmojiTokenWrapper *)a3
{
  void *v4;
  void *v5;
  char v6;

  CEMEmojiTokenGetString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_emojisToNotInclude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4) ^ 1;

  return v6;
}

+ (id)_emojisToNotInclude
{
  if (_emojisToNotInclude_onceToken != -1)
    dispatch_once(&_emojisToNotInclude_onceToken, &__block_literal_global_12);
  return (id)_emojisToNotInclude_emojis;
}

void __44__SiriSharedUIUtilities__emojisToNotInclude__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA8AD998);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_emojisToNotInclude_emojis;
  _emojisToNotInclude_emojis = v0;

}

+ (int64_t)orbViewModeForSiriSessionState:(int64_t)a3
{
  void *v5;

  if ((unint64_t)a3 < 4)
    return qword_1DE1358D0[a3];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    +[SiriSharedUIUtilities orbViewModeForSiriSessionState:].cold.1(v5, a3);
  return 0;
}

+ (int64_t)orbViewModeForSiriSessionState:(int64_t)a3 isAttending:(BOOL)a4
{
  int64_t v4;
  void *v5;

  v4 = a3;
  switch(a3)
  {
    case 0:
    case 3:
      if (a4)
        v4 = 1;
      else
        v4 = 3;
      break;
    case 1:
      return v4;
    case 2:
      v4 = 2;
      break;
    default:
      v5 = (void *)*MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
        +[SiriSharedUIUtilities orbViewModeForSiriSessionState:isAttending:].cold.1(v5, v4);
      v4 = 0;
      break;
  }
  return v4;
}

+ (BOOL)applicationBundleIdentifierIsThirdParty:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  v5 = v3
    && (!objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple."))
     || objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.siri.Caviar")));

  return v5;
}

+ (id)filterTranscriptItemsForRFPluginContent:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = *MEMORY[0x1E0D88658];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "aceObject", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "aceObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "copy");

          objc_msgSend(v13, "itemType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v7);

          if ((v15 & 1) != 0)
            goto LABEL_12;

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  v13 = 0;
LABEL_12:

  return v13;
}

+ (void)orbViewModeForSiriSessionState:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DE0BF000, v6, v7, "%s unhandled siri session state: %@. Falling back to SUICOrbViewModeOff", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)orbViewModeForSiriSessionState:(void *)a1 isAttending:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DE0BF000, v6, v7, "%s unhandled siri session state: %@. Falling back to SUICOrbViewModeOff", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1();
}

@end
