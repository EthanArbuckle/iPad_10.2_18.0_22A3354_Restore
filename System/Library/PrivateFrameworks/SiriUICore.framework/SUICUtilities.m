@implementation SUICUtilities

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
    v9 = __Block_byref_object_copy__1;
    v10 = __Block_byref_object_dispose__1;
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

void __56__SUICUtilities_substringRangesContainingEmojiInString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
    dispatch_once(&_emojisToNotInclude_onceToken, &__block_literal_global_5);
  return (id)_emojisToNotInclude_emojis;
}

void __36__SUICUtilities__emojisToNotInclude__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4A63278);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_emojisToNotInclude_emojis;
  _emojisToNotInclude_emojis = v0;

}

@end
