@implementation PCSCacheCurrentIdentitiesForServices

void __PCSCacheCurrentIdentitiesForServices_block_invoke(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFRetain(a2);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v8);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __PCSCacheCurrentIdentitiesForServices_block_invoke_50(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  const __CFDictionary *v15;
  _QWORD *v16;
  uint64_t v17;
  const void *v18;
  BOOL v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  const void *v23;
  CFTypeRef v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CFTypeRef cf;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    cf = 0;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v13 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
          objc_msgSend(v12, "identifier", (_QWORD)v25);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObject:", v14);

          objc_msgSend(v12, "decryptedRecord");
          v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v16 = PCSIdentityCreateWithKeychainAttributes(v15, &cf);

          v17 = *(_QWORD *)(a1[6] + 8);
          v18 = *(const void **)(v17 + 24);
          if (v16)
            v19 = cf == 0;
          else
            v19 = 0;
          if (!v19)
          {
            if (v18)
            {
              *(_QWORD *)(v17 + 24) = 0;
              CFRelease(v18);
            }
            if (v16)
              CFRelease(v16);
            goto LABEL_21;
          }
          PCSIdentitySetAddIdentity((uint64_t)v18, (uint64_t)v16);
          PCSIdentitySetSetCurrentIdentity(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), (uint64_t)v16);
          CFRelease(v16);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_21:

    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
      v20 = cf == 0;
    else
      v20 = 0;
    if (v20)
    {
      +[PCSCKKSOutOfBandFetchCache cache](PCSCKKSOutOfBandFetchCache, "cache");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "cacheCurrentIdentityFetchResult:notFound:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

    }
    (*(void (**)(void))(a1[4] + 16))();
    v22 = *(_QWORD *)(a1[6] + 8);
    v23 = *(const void **)(v22 + 24);
    if (v23)
    {
      *(_QWORD *)(v22 + 24) = 0;
      CFRelease(v23);
    }
    v24 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v24);
    }
  }

}

@end
