@implementation PPUtils

+ (void)enumerateChunksOfSize:(unint64_t)a3 fromArray:(id)a4 usingBlock:(id)a5
{
  id v9;
  void (**v10)(id, id, _BYTE *);
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  unsigned __int8 v18;
  char v19;

  v9 = a4;
  v10 = (void (**)(id, id, _BYTE *))a5;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPUtils.m"), 27, CFSTR("Chunk size must be nonzero"));

  }
  if (objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v9, "count") <= a3)
    {
      v19 = 0;
      v10[2](v10, v9, &v19);
    }
    else
    {
      v11 = 0;
      do
      {
        if (v11 >= objc_msgSend(v9, "count"))
          break;
        v12 = (void *)MEMORY[0x18D7805AC]();
        v18 = 0;
        v13 = objc_msgSend(v9, "count");
        v14 = v13 - v11 >= a3 ? a3 : v13 - v11;
        objc_msgSend(v9, "subarrayWithRange:", v11, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v15, &v18);

        v11 += v14;
        v16 = v18;
        objc_autoreleasePoolPop(v12);
      }
      while (!v16);
    }
  }

}

+ (BOOL)isInternalDevice
{
  return os_variant_has_internal_diagnostics();
}

+ (id)osBuild
{
  if (osBuild__pasOnceToken3 != -1)
    dispatch_once(&osBuild__pasOnceToken3, &__block_literal_global_2576);
  return (id)osBuild__pasExprOnceResult;
}

+ (id)Sha256ForData:(id)a3 withSalt:(id)a4
{
  id v5;
  id v6;
  id v7;
  const void *v8;
  CC_LONG v9;
  id v10;
  void *v11;
  CC_SHA256_CTX v13;
  unsigned __int8 md[16];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  memset(&v13, 0, sizeof(v13));
  v6 = a3;
  CC_SHA256_Init(&v13);
  v7 = objc_retainAutorelease(v6);
  v8 = (const void *)objc_msgSend(v7, "bytes", *(_OWORD *)v13.count, *(_OWORD *)&v13.hash[2], *(_OWORD *)&v13.hash[6], *(_OWORD *)&v13.wbuf[2], *(_OWORD *)&v13.wbuf[6], *(_OWORD *)&v13.wbuf[10], *(_QWORD *)&v13.wbuf[14]);
  v9 = objc_msgSend(v7, "length");

  CC_SHA256_Update(&v13, v8, v9);
  if (v5)
  {
    v10 = objc_retainAutorelease(v5);
    CC_SHA256_Update(&v13, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  }
  *(_OWORD *)md = 0u;
  v15 = 0u;
  CC_SHA256_Final(md, &v13);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);

  return v11;
}

+ (id)hexOfBytes:(const void *)a3 size:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v6;
  char *v7;
  _BYTE *v8;
  char v9;
  id v11;

  v4 = a4;
  v6 = 2 * a4;
  v7 = (char *)malloc_type_malloc(2 * a4, 0x33078D37uLL);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  if (v4)
  {
    v8 = v7 + 1;
    do
    {
      *(v8 - 1) = charOfNibble[(unint64_t)*(unsigned __int8 *)a3 >> 4];
      v9 = *(_BYTE *)a3;
      a3 = (char *)a3 + 1;
      *v8 = charOfNibble[v9 & 0xF];
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v6, 4, 1);
}

+ (id)hexUUID
{
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  v4[1] = 0;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "getUUIDBytes:", v4);

  +[PPUtils hexOfBytes:size:](PPUtils, "hexOfBytes:size:", v4, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)compareDouble:(double)a3 withDouble:(double)a4
{
  int64_t v4;

  if (a3 >= a4)
    v4 = 0;
  else
    v4 = -1;
  if (a3 > a4)
    return 1;
  else
    return v4;
}

+ (int64_t)reverseCompareDouble:(double)a3 withDouble:(double)a4
{
  return objc_msgSend(a1, "compareDouble:withDouble:", a4, a3);
}

+ (id)formatStringArray:(id)a3 truncatingAtLength:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x18D7805AC]();
  if (objc_msgSend(v5, "count") > a4)
  {
    objc_msgSend(v5, "subarrayWithRange:", 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", CFSTR("..."));
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v5, "_pas_componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("[ %@ ]"), v10);

  objc_autoreleasePoolPop(v6);
  return v11;
}

+ (id)coordinatesToGeoHashWithLength:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  _BYTE *v19;
  void *v23;
  _QWORD v24[3];

  v7 = a3;
  v24[2] = *MEMORY[0x1E0C80C00];
  if (a3 >= 0xD)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPUtils.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hashLength <= GEOHASH_MAX_LENGTH"));

  }
  v8 = 0;
  v9 = 1 << (5 * v7 - 1);
  v10 = -90.0;
  v11 = 90.0;
  v12 = -180.0;
  v13 = 180.0;
  do
  {
    v14 = v12 + (v13 - v12) * 0.5;
    if (v14 <= a5)
      v15 = v9;
    else
      v15 = 0;
    v8 |= v15;
    if (v9 == 1)
      break;
    if (v14 <= a5)
      v12 = v12 + (v13 - v12) * 0.5;
    else
      v13 = v12 + (v13 - v12) * 0.5;
    v16 = v9 >> 1;
    if (v10 + (v11 - v10) * 0.5 > a4)
    {
      v11 = v10 + (v11 - v10) * 0.5;
      v16 = 0;
    }
    else
    {
      v10 = v10 + (v11 - v10) * 0.5;
    }
    v8 |= v16;
    v17 = v9 > 3;
    v9 >>= 2;
  }
  while (v17);
  memset(v24, 0, 13);
  if (v7)
  {
    v18 = 5 * v7 - 5;
    v19 = v24;
    do
    {
      *v19++ = geoHashBase32Map[(v8 >> v18) & 0x1F];
      v18 -= 5;
      --v7;
    }
    while (v7);
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v24, 4);
}

+ (BOOL)yesWithProbability:(double)a3
{
  return (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 < a3;
}

+ (id)currentLocaleLanguageCode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsFromLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)reduceSpotlightDomainIdentifiers:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPUtils.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domainIdentifiers"));

  }
  v6 = (void *)MEMORY[0x18D7805AC]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815A0]), "initWithDomainsFromArray:", v5);
  objc_msgSend(v7, "allDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self"), 1);
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  return v11;
}

+ (double)jaroSimilarityForString:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  double v7;
  void *v8;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v5 = a3;
  v6 = a4;
  v7 = 1.0;
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    objc_msgSend(v5, "length");
    objc_msgSend(v6, "length");
    v8 = (void *)objc_opt_new();
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __41__PPUtils_jaroSimilarityForString_other___block_invoke;
    v26 = &unk_1E226A4A8;
    v27 = v8;
    v28 = &v29;
    _PASIterateLongChars();
    v19 = 0;
    v20 = (double *)&v19;
    v21 = 0x2020000000;
    v22 = 0;
    v15 = 0;
    v16 = (double *)&v15;
    v17 = 0x2020000000;
    v18 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v10 = v27;
    _PASIterateLongChars();
    v7 = (v20[3] / (double)(unint64_t)v12[3]
        + v20[3] / (double)(unint64_t)v30[3]
        + (v20[3] - v16[3]) / v20[3])
       / 3.0;

    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v29, 8);
  }

  return v7;
}

+ (id)sqliteGlobEscape:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v11;
  id v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFIndex v18;
  UniChar v19;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  CFIndex v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  id v36;
  __CFString *theString;
  UniChar buffer[8];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CFStringRef v46;
  const UniChar *v47;
  const char *v48;
  uint64_t v49;
  CFIndex v50;
  int64_t v51;
  int64_t v52;
  CFRange v53;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPUtils.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unescaped"));

    v6 = (void *)MEMORY[0x18D7805AC]();
    goto LABEL_39;
  }
  v6 = (void *)MEMORY[0x18D7805AC]();
  v7 = (__CFString *)v5;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  *(_OWORD *)buffer = 0u;
  v39 = 0u;
  Length = CFStringGetLength(v7);
  v46 = v7;
  v49 = 0;
  v50 = Length;
  theString = v7;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  CStringPtr = 0;
  v47 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  v51 = 0;
  v52 = 0;
  v48 = CStringPtr;
  if (Length <= 0)
  {

LABEL_39:
    v12 = v5;
    goto LABEL_40;
  }
  v35 = v6;
  v36 = v5;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 64;
  do
  {
    if ((unint64_t)v13 >= 4)
      v17 = 4;
    else
      v17 = v13;
    v18 = v50;
    if (v50 <= v13)
      goto LABEL_31;
    if (v47)
    {
      v19 = v47[v13 + v49];
    }
    else if (v48)
    {
      v19 = v48[v49 + v13];
    }
    else
    {
      v20 = v51;
      if (v52 <= v13 || v51 > v13)
      {
        v22 = v17 + v11;
        v23 = v16 - v17;
        v24 = v13 - v17;
        v25 = v24 + 64;
        if (v24 + 64 >= v50)
          v25 = v50;
        v51 = v24;
        v52 = v25;
        if (v50 >= v23)
          v18 = v23;
        v53.length = v18 + v22;
        v53.location = v24 + v49;
        CFStringGetCharacters(v46, v53, buffer);
        v20 = v51;
      }
      v19 = buffer[v13 - v20];
    }
    v26 = v19;
    v27 = (1 << (v19 - 42)) & 0x2000000200001;
    if ((v26 - 42) > 0x31 || v27 == 0)
    {
LABEL_31:
      ++v15;
    }
    else
    {
      v29 = (void *)MEMORY[0x18D7805AC]();
      if (!v12)
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", -[__CFString length](theString, "length"));
      -[__CFString substringWithRange:](theString, "substringWithRange:", v14, v15);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendFormat:", CFSTR("%@[%c]"), v30, v26);

      v14 += v15 + 1;
      objc_autoreleasePoolPop(v29);
      v15 = 0;
    }
    ++v13;
    --v11;
    ++v16;
  }
  while (Length != v13);

  if (!v12)
  {
    v6 = v35;
    v5 = v36;
    goto LABEL_39;
  }
  if (v15)
  {
    v31 = (void *)MEMORY[0x18D7805AC]();
    -[__CFString substringWithRange:](theString, "substringWithRange:", v14, v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v32);

    objc_autoreleasePoolPop(v31);
  }
  v6 = v35;
  v5 = v36;
LABEL_40:
  objc_autoreleasePoolPop(v6);

  return v12;
}

+ (BOOL)isFirstPartyApp:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple."));
}

+ (BOOL)localizedTimeStructForDate:(id)a3 tm:(tm *)a4
{
  objc_msgSend(a3, "timeIntervalSince1970");
  return +[PPUtils localizedTimeStructForSecondsFrom1970:tm:](PPUtils, "localizedTimeStructForSecondsFrom1970:tm:", a4);
}

+ (BOOL)localizedTimeStructForSecondsFrom1970:(double)a3 tm:(tm *)a4
{
  BOOL v5;
  tm *v7;
  NSObject *v8;
  int *v10;
  char *v11;
  int v12;
  time_t v13;
  uint8_t buf[4];
  double v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v5 = 0;
  v20 = *MEMORY[0x1E0C80C00];
  if (a3 >= -2147483650.0 && a3 <= 2147483650.0)
  {
    v13 = (uint64_t)a3;
    *__error() = 0;
    v7 = localtime_r(&v13, a4);
    v5 = v7 != 0;
    if (!v7)
    {
      pp_default_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v10 = __error();
        v11 = strerror(*v10);
        v12 = *__error();
        *(_DWORD *)buf = 134218498;
        v15 = a3;
        v16 = 2080;
        v17 = v11;
        v18 = 1024;
        v19 = v12;
        _os_log_fault_impl(&dword_18BE3A000, v8, OS_LOG_TYPE_FAULT, "localtime_r() failure when converting %.1f : %s (%d)", buf, 0x1Cu);
      }

    }
  }
  return v5;
}

+ (id)preferredLanguages
{
  if (preferredLanguages__pasOnceToken9 != -1)
    dispatch_once(&preferredLanguages__pasOnceToken9, &__block_literal_global_44);
  return (id)preferredLanguages__pasExprOnceResult;
}

void __29__PPUtils_preferredLanguages__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_47);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "initWithArray:", v3);
  v5 = (void *)preferredLanguages__pasExprOnceResult;
  preferredLanguages__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

uint64_t __29__PPUtils_preferredLanguages__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", a2);
}

void __41__PPUtils_jaroSimilarityForString_other___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x18D7805AC]();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_autoreleasePoolPop(v4);
}

void __41__PPUtils_jaroSimilarityForString_other___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x18D7805AC]();
  v5 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_17;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v11)
  {

    goto LABEL_17;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v18 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if ((unint64_t)(objc_msgSend(v16, "unsignedIntegerValue") - *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24)) <= a1[8])
      {
        if (objc_msgSend(v16, "unsignedIntegerValue") != *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
        {
          *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24) + 1.0;

LABEL_15:
          *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = *(double *)(*(_QWORD *)(a1[7] + 8) + 24) + 1.0;
          goto LABEL_17;
        }
        v13 = 1;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
      continue;
    break;
  }

  if ((v13 & 1) != 0)
    goto LABEL_15;
LABEL_17:
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_autoreleasePoolPop(v4);
}

void __18__PPUtils_osBuild__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(MEMORY[0x1E0D81590], "currentOsBuild");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(CFSTR("iOS-"), "stringByAppendingString:", v1);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  v3 = (void *)osBuild__pasExprOnceResult;
  osBuild__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

@end
