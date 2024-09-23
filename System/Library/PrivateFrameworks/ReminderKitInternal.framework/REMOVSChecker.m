@implementation REMOVSChecker

+ (BOOL)profanityInTokens:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6;
  id v7;
  __CFDictionary *Mutable;
  const void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __CFString *v15;
  const void *v16;
  int MetaFlags;
  int v18;
  char v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CFErrorRef err;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D437B8], v7);
  err = 0;
  v9 = (const void *)LXLexiconCreate();
  CFRelease(Mutable);
  if (v9)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(__CFString **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (!CFStringGetCStringPtr(v15, 4u)
            && !-[__CFString lengthOfBytesUsingEncoding:](v15, "lengthOfBytesUsingEncoding:", 4, (_QWORD)v22))
          {
            goto LABEL_19;
          }
          if (objc_msgSend(a1, "_lexiconTokenForToken:inLexicon:", v15, v9, (_QWORD)v22))
          {
            v16 = (const void *)LXLexiconCopyEntryForTokenID();
            MetaFlags = LXEntryGetMetaFlags();
            if ((MetaFlags & 0x1800000) != 0)
            {
              CFRelease(v16);
LABEL_19:
              v19 = 1;
              goto LABEL_20;
            }
            v18 = MetaFlags;
            CFRelease(v16);
            if ((v18 & 0x2000000) != 0)
              goto LABEL_19;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        v19 = 0;
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v19 = 0;
    }
LABEL_20:

  }
  else
  {
    v9 = CFErrorCopyDescription(err);
    v19 = 0;
    v20 = 0;
    if (!v9)
      goto LABEL_22;
  }
  CFRelease(v9);
  v20 = v19;
LABEL_22:

  return v20;
}

+ (unsigned)_lexiconTokenForToken:(id)a3 inLexicon:(_LXLexicon *)a4
{
  id v4;
  unsigned int v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  LXLexiconEnumerateEntriesForString();
  v5 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);

  return v5;
}

void __49__REMOVSChecker__lexiconTokenForToken_inLexicon___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  const __CFString *v5;

  v5 = (const __CFString *)LXEntryCopyString();
  if (CFStringCompare(v5, *(CFStringRef *)(a1 + 40), 0) == kCFCompareEqualTo)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = LXEntryGetTokenID();
    *a3 = 1;
  }
  CFRelease(v5);
}

@end
