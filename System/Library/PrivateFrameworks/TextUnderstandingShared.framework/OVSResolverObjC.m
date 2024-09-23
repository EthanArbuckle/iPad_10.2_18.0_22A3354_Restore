@implementation OVSResolverObjC

+ (BOOL)containsOVSInTokens:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFDictionary *Mutable;
  const void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __CFString *v18;
  void *v19;
  const void *v20;
  int v21;
  BOOL v22;
  CFStringRef v23;
  __CFString *v25;
  __CFString *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CFErrorRef err;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (__CFString *)a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = -[__CFString length](v7, "length");
    v9 = CFSTR("en_US");
    if (v8)
      v9 = v7;
    v10 = v9;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE5F198], v10);
    err = 0;
    v12 = (const void *)LXLexiconCreate();
    CFRelease(Mutable);
    if (v12)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = v6;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v14)
      {
        v15 = v14;
        v25 = v10;
        v26 = v7;
        v16 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            v18 = *(__CFString **)(*((_QWORD *)&v27 + 1) + 8 * i);
            -[__CFString localizedLowercaseString](v18, "localizedLowercaseString", v25, v26, (_QWORD)v27);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "lengthOfBytesUsingEncoding:", 4) || CFStringGetCStringPtr(v18, 4u))
            {
              if (objc_msgSend(a1, "_lexiconTokenForToken:lexicon:", v19, v12))
              {
                v20 = (const void *)LXLexiconCopyEntryForTokenID();
                v21 = LXEntryGetMetaFlags() & 0x3800000;
                CFRelease(v20);
                if (v21)
                {

                  v22 = 1;
                  goto LABEL_23;
                }
              }
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          if (v15)
            continue;
          break;
        }
        v22 = 0;
LABEL_23:
        v10 = v25;
        v7 = v26;
      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v23 = CFErrorCopyDescription(err);
      if (!v23)
      {
        v22 = 0;
        goto LABEL_27;
      }
      v12 = v23;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[OVSResolverObjC containsOVSInTokens:forLocaleIdentifier:].cold.1((uint64_t)v12);
      v22 = 0;
    }
    CFRelease(v12);
LABEL_27:

    goto LABEL_28;
  }
  v22 = 0;
LABEL_28:

  return v22;
}

+ (unsigned)_lexiconTokenForToken:(id)a3 lexicon:(_LXLexicon *)a4
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

void __49__OVSResolverObjC__lexiconTokenForToken_lexicon___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
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

+ (void)containsOVSInTokens:(uint64_t)a1 forLocaleIdentifier:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_2488EF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "OVSResolverObjC: Error finding an appropriate lexicon: %@", (uint8_t *)&v1, 0xCu);
}

@end
