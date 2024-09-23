@implementation PCSCKKSOutOfBandFetchIdentities

void ___PCSCKKSOutOfBandFetchIdentities_block_invoke(uint64_t a1, const void *a2, void *a3)
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

void ___PCSCKKSOutOfBandFetchIdentities_block_invoke_57(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  CFTypeRef Mutable;
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
  BOOL v17;
  BOOL v18;
  CFTypeRef v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CFTypeRef cf;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    Mutable = PCSIdentitySetCreateMutable(0);
    cf = 0;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v12, "publicKey", (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObject:", v14);

          objc_msgSend(v12, "decryptedRecord");
          v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v16 = PCSIdentityCreateWithKeychainAttributes(v15, &cf);

          if (v16)
            v17 = cf == 0;
          else
            v17 = 0;
          if (!v17)
          {
            if (Mutable)
              CFRelease(Mutable);
            if (v16)
              CFRelease(v16);
            Mutable = 0;
            v18 = 1;
            goto LABEL_24;
          }
          PCSIdentitySetAddIdentity((uint64_t)Mutable, (uint64_t)v16);
          CFRelease(v16);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v9)
          continue;
        break;
      }
    }

    v18 = Mutable == 0;
    if (Mutable && !cf)
    {
      +[PCSCKKSOutOfBandFetchCache cache](PCSCKKSOutOfBandFetchCache, "cache");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cachePCSIdentityFetchResult:notFound:serviceID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(unsigned int *)(a1 + 56));
      v18 = 0;
LABEL_24:

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (!v18)
      CFRelease(Mutable);
    v19 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v19);
    }
  }

}

@end
