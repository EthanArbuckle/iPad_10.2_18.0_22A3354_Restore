@implementation SILocalizationRefresh

void __SILocalizationRefresh_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(unsigned int *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + v2) = 1;
  if (a2)
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + v2) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __SILocalizationRefresh_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  char v3;
  const __CFAllocator *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  CFErrorRef v8;
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
      atomic_store(0, &sLocalizationLoaded[v2]);
      sLocalizationFilters[v2] = 0;
    }
    ++v2;
  }
  while (v2 != 59);
  if ((v3 & 1) != 0
    && (v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00],
        (v5 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("SILocalization: error loading locales"))) != 0))
  {
    v6 = v5;
    v7 = (void *)*MEMORY[0x1E0C9AFB0];
    userInfoValues = v5;
    userInfoKeys[0] = v7;
    v8 = CFErrorCreateWithUserInfoKeysAndValues(v4, CFSTR("SpotlightLinguisticsErrorDomain"), 1, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v8)
    CFRelease(v8);
  free(*(void **)(a1 + 40));
  free(*(void **)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

@end
