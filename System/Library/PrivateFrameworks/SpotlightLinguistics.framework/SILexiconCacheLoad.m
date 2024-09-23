@implementation SILexiconCacheLoad

void __SILexiconCacheLoad_block_invoke()
{
  const __CFDictionary *OptionsDictionary;
  const __CFDictionary *v1;
  uint64_t i;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OptionsDictionary = SIGeneralTrieCreateOptionsDictionary(1, 64, 0, 0, 0);
  sCache = (uint64_t)SIGeneralTrieCreateMutableWithDictionary(OptionsDictionary);
  if (OptionsDictionary)
    CFRelease(OptionsDictionary);
  v1 = SIGeneralTrieCreateOptionsDictionary(2, 64, 0, 0, 0);
  sTypes = (uint64_t)SIGeneralTrieCreateMutableWithDictionary(v1);
  if (v1)
    CFRelease(v1);
  sOVSLexicon = LXCreateWordModerationLexicon();
  for (i = 0; i != 59; ++i)
  {
    sDynamicLexicons[i] = 0;
    atomic_store(0, &sLexiconsLoaded[i]);
    sLexicons[i] = 0;
  }
}

void __SILexiconCacheLoad_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *userInfoValues;
  void *userInfoKeys[2];

  userInfoKeys[1] = *(void **)MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("SILexiconCache: could not load localization for locale (%@)"), *(_QWORD *)(a1 + 40));
    if (v4)
    {
      v5 = v4;
      v6 = (void *)*MEMORY[0x1E0C9AFB0];
      userInfoValues = v4;
      userInfoKeys[0] = v6;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFErrorCreateWithUserInfoKeysAndValues(v3, CFSTR("SpotlightLinguisticsErrorDomain"), 1, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
      CFRelease(v5);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __SILexiconCacheLoad_block_invoke_3(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  _QWORD block[4];
  __int128 v8;
  int v9;
  void *userInfoValues;
  void *userInfoKeys[2];

  userInfoKeys[1] = *(void **)MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("SILexiconCache: could not load localization for locale (%@)"), *(_QWORD *)(a1 + 40));
    if (v4)
    {
      v5 = v4;
      v6 = (void *)*MEMORY[0x1E0C9AFB0];
      userInfoValues = v4;
      userInfoKeys[0] = v6;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFErrorCreateWithUserInfoKeysAndValues(v3, CFSTR("SpotlightLinguisticsErrorDomain"), 1, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
      CFRelease(v5);
    }
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    if (getLexiconQueue(void)::onceLexQueueToken != -1)
      dispatch_once(&getLexiconQueue(void)::onceLexQueueToken, &__block_literal_global_39);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __SILexiconCacheLoad_block_invoke_4;
    block[3] = &__block_descriptor_tmp_16;
    v9 = *(_DWORD *)(a1 + 56);
    v8 = *(_OWORD *)(a1 + 40);
    dispatch_async((dispatch_queue_t)getLexiconQueue(void)::gLexQueue, block);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __SILexiconCacheLoad_block_invoke_4(uint64_t a1)
{
  uint64_t Lexicon;
  uint64_t StaticLexicon;
  uint64_t v4;

  Lexicon = createLexicon(*(const __CFLocale **)(a1 + 32));
  StaticLexicon = createStaticLexicon(*(const __CFLocale **)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)&sLexiconLock);
  v4 = *(unsigned int *)(a1 + 48);
  sDynamicLexicons[v4] = Lexicon;
  sLexicons[v4] = StaticLexicon;
  os_unfair_lock_unlock((os_unfair_lock_t)&sLexiconLock);
  CFRelease(*(CFTypeRef *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __SILexiconCacheLoad_block_invoke_5(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
    CFRelease(v2);
}

@end
