@implementation PSITokenizer

- (PSITokenizer)initWithLocale:(id)a3 useCache:(BOOL)a4
{
  id v7;
  PSITokenizer *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *cache;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSITokenizer;
  v8 = -[PSITokenizer init](&v13, sel_init);
  if (v8)
  {
    v16[0] = *MEMORY[0x1E0D174F0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D17520];
    v15 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v8->_tagger = (void *)NLTaggerCreate();
    objc_storeStrong((id *)&v8->_locale, a3);
    v8->_useCache = a4;
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = objc_claimAutoreleasedReturnValue();
      cache = v8->_cache;
      v8->_cache = (NSMutableDictionary *)v10;
    }
    else
    {
      cache = v8->_cache;
      v8->_cache = 0;
    }

  }
  return v8;
}

- (int)registerFTS5TokenizerForDatabase:(sqlite3 *)a3
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, PSITokenizer *, __int128 *, _QWORD);
  id v6;
  __int128 v8;
  uint64_t (*v9)(id *, uint64_t, uint64_t, _BYTE *, int, unsigned int (*)(uint64_t, _QWORD, const char *, uint64_t, int64_t));

  v4 = fts5_api_from_db(a3);
  v8 = xmmword_1E36674A8;
  v9 = PSITokenizerTokenize;
  v5 = *(uint64_t (**)(uint64_t, uint64_t, PSITokenizer *, __int128 *, _QWORD))(v4 + 8);
  objc_msgSend((id)objc_opt_class(), "ftsTokenizerName", 0x1997AD79CLL, 0x1997AD7E0, PSITokenizerTokenize);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LODWORD(self) = v5(v4, objc_msgSend(v6, "UTF8String"), self, &v8, 0);

  return (int)self;
}

+ (id)ftsTokenizerName
{
  return CFSTR("PSITokenizer");
}

- (void)dealloc
{
  void *tagger;
  objc_super v4;

  tagger = self->_tagger;
  if (tagger)
  {
    CFRelease(tagger);
    self->_tagger = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PSITokenizer;
  -[PSITokenizer dealloc](&v4, sel_dealloc);
}

- (id)normalizeString:(id)a3
{
  __CFString *v3;
  CFIndex v4;
  _BYTE *v5;
  __CFString *v6;
  CFIndex v7;
  CFIndex numChars;
  _BYTE v10[512];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length"))
  {
    v4 = 3 * -[__CFString length](v3, "length") + 1;
    if (v4 >= 257)
      v5 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    else
      v5 = v10;
    numChars = 0;
    if (!_normalizeString(v3, (UniChar *)v5, v4, &numChars))
    {
      if (v5 != v10)
        free(v5);
      v7 = numChars + 1;
      v5 = malloc_type_malloc(2 * (numChars + 1), 0x1000040BDFB0063uLL);
      _normalizeString(v3, (UniChar *)v5, v7, 0);
    }
    v6 = (__CFString *)CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UniChar *)v5, numChars);
    if (v5 != v10)
      free(v5);
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (void)tokenizeString:(id)a3 withOptions:(int64_t)a4 tokenOutput:(tokenOutput_t *)a5
{
  const __CFString *v8;
  __CFString *v9;
  CFIndex Length;
  uint64_t v11;
  uint8_t *v12;
  _QWORD v13[3];
  void *v14;
  uint8_t *v15;
  uint64_t v16;
  uint8_t buf[520];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = (const __CFString *)a3;
  v9 = (__CFString *)v8;
  if (v8)
  {
    Length = CFStringGetLength(v8);
    v11 = 3 * Length + 2;
    if (Length >= 85)
      v12 = (uint8_t *)malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
    else
      v12 = buf;
    v13[0] = v9;
    v13[1] = a4;
    v13[2] = a5;
    v14 = v12;
    v15 = v12;
    v16 = v11;
    -[PSITokenizer _tokenizeString:withContext:](self, "_tokenizeString:withContext:", v9, v13);
    if (v14 && v14 != v12)
      free(v14);
    if (v12 && v12 != buf)
      free(v12);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Attempted to tokenize nil string", buf, 2u);
  }

}

- (void)_tokenizeString:(id)a3 withContext:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  _BOOL4 useCache;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CFIndex v33;
  CFIndex v34;
  CFStringRef v35;
  PSIToken *v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  PSIToken *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  PSITokenizer *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void *v63;
  __CFString *v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  PSIToken *v76;
  _BYTE v77[128];
  PSIToken *v78;
  _BYTE v79[128];
  uint64_t v80;
  CFRange v81;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_useCache)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v73 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            v14 = (const __CFString *)objc_msgSend(v13, "string");
            v15 = objc_msgSend(v13, "range");
            enumerateToken(v14, v15, v16, (uint64_t)a4);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
        }
        while (v10);
      }
      v17 = v8;
      goto LABEL_31;
    }
    -[NSMutableDictionary removeAllObjects](self->_cache, "removeAllObjects");

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __44__PSITokenizer__tokenizeString_withContext___block_invoke;
  v70[3] = &unk_1E3668C30;
  v20 = v18;
  v71 = v20;
  v21 = (void *)MEMORY[0x19AEC174C](v70);
  v67[0] = v19;
  v67[1] = 3221225472;
  v67[2] = __44__PSITokenizer__tokenizeString_withContext___block_invoke_2;
  v67[3] = &unk_1E3668C58;
  v54 = v6;
  v22 = v6;
  v68 = v22;
  v53 = v21;
  v69 = v53;
  v23 = (void *)MEMORY[0x19AEC174C](v67);
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".-_"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NLTaggerSetString();
  objc_msgSend(v22, "length");
  NLTaggerSetLocaleForRange();
  v60 = v19;
  v61 = 3221225472;
  v62 = __44__PSITokenizer__tokenizeString_withContext___block_invoke_3;
  v63 = &unk_1E3668C80;
  v25 = (const __CFString *)v22;
  v64 = (__CFString *)v25;
  v52 = v24;
  v65 = v52;
  v51 = v23;
  v66 = v51;
  NLTaggerEnumerateTokens();
  useCache = self->_useCache;
  v55 = self;
  if ((a4->var1 & 4) != 0 && (unint64_t)objc_msgSend(v20, "count") >= 9)
  {
    if ((a4->var1 & 8) != 0)
      v27 = 2;
    else
      v27 = 1;
    objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v20, "count") - v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "range");
    v31 = v30;

    objc_msgSend(v20, "objectAtIndexedSubscript:", 8 - v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "range");

    v34 = v29 + v31 - v33;
    v81.location = v33;
    v81.length = v34;
    v35 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v25, v81);
    v36 = -[PSIToken initWithString:range:]([PSIToken alloc], "initWithString:range:", v35, v33, v34);
    CFRelease(v35);
    v37 = objc_msgSend(v20, "count") - 7;
    v78 = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "replaceObjectsInRange:withObjectsFromArray:", 8 - v27, v37, v38);

    goto LABEL_20;
  }
  if (!useCache)
  {
LABEL_20:
    v39 = 0;
    goto LABEL_21;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v20, v25);
  v39 = 1;
LABEL_21:
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v17 = v20;
  v40 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v77, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v57 != v42)
          objc_enumerationMutation(v17);
        v44 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        v45 = (const __CFString *)objc_msgSend(v44, "string");
        v46 = objc_msgSend(v44, "range");
        enumerateToken(v45, v46, v47, (uint64_t)a4);
        if (v39)
        {
          v48 = (const __CFString *)objc_msgSend(v44, "string");
          v49 = -[PSIToken initWithString:range:]([PSIToken alloc], "initWithString:range:", v48, 0, CFStringGetLength(v48));
          v76 = v49;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v55->_cache, "setObject:forKeyedSubscript:", v50, v48);

        }
      }
      v41 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v77, 16);
    }
    while (v41);
  }

  v8 = v71;
  v6 = v54;
LABEL_31:

}

- (id)newTokensFromString:(id)a3 withOptions:(int64_t)a4 outCopyRanges:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  char v25;
  _QWORD v26[64];

  v26[63] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a5)
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v12 = 0;
  v20[0] = 0;
  v20[1] = v11;
  v20[2] = 0;
  v20[3] = &v25;
  v20[4] = 32;
  v21 = 0u;
  v22 = 0u;
  -[PSITokenizer tokenizeString:withOptions:tokenOutput:](self, "tokenizeString:withOptions:tokenOutput:", v10, a4, v20);
  if (!a5)
  {
LABEL_12:
    a6 = (id *)v11;
    goto LABEL_15;
  }
  v13 = v21;
  if (v13 == objc_msgSend(v11, "count"))
  {
    if (v13 >= 1)
    {
      v14 = v26;
      do
      {
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *(v14 - 1), *v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v15);

        }
        v14 += 2;
        --v13;
      }
      while (v13);
    }
    *a5 = objc_retainAutorelease(v12);
    goto LABEL_12;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: Reached token ranges limit (%ld) for string: %@"), 32, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.search"), -1, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }
LABEL_15:

  return a6;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

void __44__PSITokenizer__tokenizeString_withContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  PSIToken *v5;

  v4 = *(void **)(a1 + 32);
  v5 = -[PSIToken initWithString:range:]([PSIToken alloc], "initWithString:range:", a2, a3, a4);
  objc_msgSend(v4, "addObject:", v5);

}

void __44__PSITokenizer__tokenizeString_withContext___block_invoke_2(uint64_t a1, CFRange range)
{
  CFIndex length;
  CFStringRef v4;
  CFRange v5;

  length = range.length;
  v5.location = range.location;
  v5.length = length;
  v4 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFStringRef *)(a1 + 32), v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  CFRelease(v4);
}

uint64_t __44__PSITokenizer__tokenizeString_withContext___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  CFIndex location;
  CFIndex v4;
  CFRange v6;
  CFRange v7;

  v2 = result;
  location = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if ((*(_BYTE *)(a2 + 16) & 0x10) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 48) + 16))();
  v6.location = 0;
  v6.length = 0;
  if (v4 >= 1)
  {
    while (1)
    {
      v7.location = location;
      v7.length = v4;
      result = CFStringFindCharacterFromSet(*(CFStringRef *)(v2 + 32), *(CFCharacterSetRef *)(v2 + 40), v7, 0, &v6);
      if (!(_DWORD)result)
        break;
      if (v6.location != location)
      {
        result = (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 48) + 16))();
        location = v6.location;
      }
      location += v6.length;
      v4 = *(_QWORD *)a2 - location + *(_QWORD *)(a2 + 8);
      if (v4 <= 0)
        return result;
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 48) + 16))();
  }
  return result;
}

+ (id)fts5StringFromString:(id)a3 forMatchType:(unint64_t)a4
{
  id v6;
  _BOOL8 v7;
  void *v8;
  uint8_t v10[16];

  v6 = a3;
  if (a4 == 3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Should not be calling normalize on matchType DateFilter", v10, 2u);
    }
    v7 = 0;
  }
  else
  {
    v7 = a4 == 0;
  }
  objc_msgSend(a1, "fts5StringFromString:useWildcard:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fts5StringFromString:(id)a3 useWildcard:(BOOL)a4
{
  return (id)objc_msgSend(a1, "fts5StringFromString:useWildcard:leadingAnchored:", a3, a4, 0);
}

+ (id)fts5StringFromString:(id)a3 useWildcard:(BOOL)a4 leadingAnchored:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v5 = a5;
  v6 = a4;
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\"\"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &stru_1E36789C0;
  if (v6)
    v8 = CFSTR("*");
  if (v5)
    v9 = CFSTR("^\"%@\"%@");
  else
    v9 = CFSTR("\"%@\"%@");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
