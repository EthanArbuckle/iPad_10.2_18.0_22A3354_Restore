@implementation SILexiconCacheRefresh

void __SILexiconCacheRefresh_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(unsigned int *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + v2) = 1;
  if (a2)
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + v2) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __SILexiconCacheRefresh_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  char v3;
  const void *v4;
  const void *v5;
  const __CFAllocator *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  CFErrorRef v10;
  void *userInfoValues;
  void *userInfoKeys[2];

  v2 = 0;
  v3 = 0;
  userInfoKeys[1] = *(void **)MEMORY[0x1E0C80C00];
  do
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + v2))
    {
      v3 |= *(_BYTE *)(*(_QWORD *)(a1 + 48) + v2) != 0;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)&sLexiconLock);
      v4 = (const void *)sDynamicLexicons[v2];
      if (v4)
      {
        CFRelease(v4);
        sDynamicLexicons[v2] = 0;
      }
      v5 = (const void *)sLexicons[v2];
      if (v5)
      {
        CFRelease(v5);
        sLexicons[v2] = 0;
      }
      atomic_store(0, &sLexiconsLoaded[v2]);
      os_unfair_lock_unlock((os_unfair_lock_t)&sLexiconLock);
    }
    ++v2;
  }
  while (v2 != 59);
  if ((v3 & 1) != 0
    && (v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00],
        (v7 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("SILexiconCache: error loading locales"))) != 0))
  {
    v8 = v7;
    v9 = (void *)*MEMORY[0x1E0C9AFB0];
    userInfoValues = v7;
    userInfoKeys[0] = v9;
    v10 = CFErrorCreateWithUserInfoKeysAndValues(v6, CFSTR("SpotlightLinguisticsErrorDomain"), 1, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(v8);
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v10)
    CFRelease(v10);
  free(*(void **)(a1 + 40));
  free(*(void **)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

@end
