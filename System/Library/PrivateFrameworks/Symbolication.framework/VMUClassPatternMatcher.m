@implementation VMUClassPatternMatcher

- (BOOL)isMatchingKindOfClass
{
  return self->_matchingKindOfClass;
}

- (void)setMatchingKindOfClass:(BOOL)a3
{
  __CFDictionary *memoizedRegexResult;

  if (self->_matchingKindOfClass != a3)
  {
    self->_matchingKindOfClass = a3;
    memoizedRegexResult = self->_memoizedRegexResult;
    if (memoizedRegexResult)
      CFDictionaryRemoveAllValues(memoizedRegexResult);
  }
}

- (VMUClassPatternMatcher)initWithPattern:(id)a3 forArgument:(id)a4 error:(id *)a5
{
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  VMUClassPatternMatcher *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  $019B15D08CAF2F6032DDFBB53180E398 *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  $019B15D08CAF2F6032DDFBB53180E398 *vmRegionsRegex;
  id v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;
  char v50[2048];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  if (v8)
  {
    v49.receiver = self;
    v49.super_class = (Class)VMUClassPatternMatcher;
    self = -[VMUClassPatternMatcher init](&v49, sel_init);
    if (self)
    {
      if (!v9)
        v9 = &stru_1E4E04720;
      objc_msgSend(MEMORY[0x1E0CB3780], "letterCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addCharactersInString:", CFSTR("_.([@"));
      if (-[__CFString rangeOfCharacterFromSet:](v8, "rangeOfCharacterFromSet:", v10))
      {
        if (!a5)
        {
LABEL_9:

          v17 = 0;
LABEL_23:

          goto LABEL_24;
        }
        VMUOptionParserError(-1, CFSTR("error in %@ <classes> pattern '%@' - cannot match the start of a class name"), v11, v12, v13, v14, v15, v16, (uint64_t)v9);
LABEL_8:
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if (-[__CFString hasSuffix:](v8, "hasSuffix:", CFSTR("]")))
      {
        v18 = -[__CFString rangeOfString:options:](v8, "rangeOfString:options:", CFSTR("["), 4);
        if (!v25)
        {
          if (!a5)
            goto LABEL_9;
          VMUOptionParserError(-1, CFSTR("error in %@ <classes> pattern '%@' - no starting bracket [: %s"), v19, v20, v21, v22, v23, v24, (uint64_t)v9);
          goto LABEL_8;
        }
        v26 = v18;
        -[__CFString substringFromIndex:](v8, "substringFromIndex:", v18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString substringToIndex:](v8, "substringToIndex:", v26);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!-[VMUClassPatternMatcher _parseMallocSizePattern:error:](self, "_parseMallocSizePattern:error:", v27, a5))
        {

          v8 = v28;
          goto LABEL_9;
        }
        if (!v26)
        {

          v28 = CFSTR(".*");
        }

      }
      else
      {
        v28 = v8;
      }
      if ((-[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("malloc")) & 1) != 0
        || -[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("non-object")))
      {
        self->_patternMatchesNonObjects = 1;
      }
      else
      {
        v30 = ($019B15D08CAF2F6032DDFBB53180E398 *)malloc_type_malloc(0x20uLL, 0x10700404B019E81uLL);
        self->_classesRegex = v30;
        v8 = objc_retainAutorelease(v28);
        v31 = regcomp((regex_t *)v30, (const char *)-[__CFString UTF8String](v8, "UTF8String"), 1);
        if (v31)
        {
          if (!a5)
            goto LABEL_9;
          regerror(v31, (const regex_t *)self->_classesRegex, v50, 0x800uLL);
          VMUOptionParserError(-1, CFSTR("error in %@ <classes> pattern '%@': %s"), v32, v33, v34, v35, v36, v37, (uint64_t)v9);
          goto LABEL_8;
        }
        self->_vmRegionsRegex = ($019B15D08CAF2F6032DDFBB53180E398 *)malloc_type_malloc(0x20uLL, 0x10700404B019E81uLL);
        v8 = v8;
        v38 = v8;
        if ((-[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("VM:")) & 1) == 0)
        {
          v38 = v8;
          if ((-[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("Region")) & 1) == 0)
          {
            v38 = v8;
            if ((-[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("Thread")) & 1) == 0)
            {
              v38 = v8;
              if ((-[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR(".*")) & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".*%@"), v8);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

              }
            }
          }
        }
        if ((objc_msgSend(v38, "hasSuffix:", CFSTR(".*")) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.*"), v38);
          v39 = objc_claimAutoreleasedReturnValue();

          v38 = (void *)v39;
        }
        vmRegionsRegex = self->_vmRegionsRegex;
        v41 = objc_retainAutorelease(v38);
        v42 = regcomp((regex_t *)vmRegionsRegex, (const char *)objc_msgSend(v41, "UTF8String"), 1);
        if (v42)
        {
          if (a5)
          {
            regerror(v42, (const regex_t *)self->_vmRegionsRegex, v50, 0x800uLL);
            VMUOptionParserError(-1, CFSTR("error in % <region-description> pattern '%@': %s"), v43, v44, v45, v46, v47, v48, (uint64_t)v9);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_9;
        }
        self->_memoizedRegexResult = CFDictionaryCreateMutable(0, 0, 0, 0);

      }
      v8 = v28;
    }
    v17 = self;
    goto LABEL_23;
  }
  v17 = 0;
LABEL_24:

  return v17;
}

- (void)dealloc
{
  $019B15D08CAF2F6032DDFBB53180E398 *classesRegex;
  $019B15D08CAF2F6032DDFBB53180E398 *vmRegionsRegex;
  __CFDictionary *memoizedRegexResult;
  objc_super v6;

  classesRegex = self->_classesRegex;
  if (classesRegex)
    MEMORY[0x1A85A9C44](classesRegex, a2);
  vmRegionsRegex = self->_vmRegionsRegex;
  if (vmRegionsRegex)
    MEMORY[0x1A85A9C44](vmRegionsRegex, a2);
  memoizedRegexResult = self->_memoizedRegexResult;
  if (memoizedRegexResult)
    CFRelease(memoizedRegexResult);
  v6.receiver = self;
  v6.super_class = (Class)VMUClassPatternMatcher;
  -[VMUClassPatternMatcher dealloc](&v6, sel_dealloc);
}

- (void)resetCachedMatches
{
  CFDictionaryRemoveAllValues(self->_memoizedRegexResult);
}

- (BOOL)_parseMallocSizePattern:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  char *v15;
  char *v16;
  int v17;
  int v18;
  _BOOL4 v19;
  id v20;
  char v21;
  int v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  unint64_t allocationSizeLowerBound;
  id v39;
  id v40;
  char *__s1;

  v6 = a3;
  VMUOptionParserError(-1, CFSTR("malloc size pattern '%@' was not of expected format '[size]' or '[lowerSizeBound-upperSizeBound]'"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_retainAutorelease(v6);
  v15 = (char *)objc_msgSend(v14, "UTF8String");
  __s1 = v15;
  if (*v15 != 91)
  {
    v20 = v13;
    v19 = 0;
    v21 = 0;
    v22 = 0;
    goto LABEL_20;
  }
  v18 = v15[1];
  v16 = v15 + 1;
  LOBYTE(v17) = v18;
  __s1 = v16;
  v19 = (v18 - 48) < 0xA;
  if ((v18 - 48) > 9)
  {
    v17 = v17;
  }
  else
  {
    self->_allocationSizeLowerBound = _parseAllocationSizeBound((const char **)&__s1);
    v16 = __s1;
    v17 = *__s1;
  }
  if (v17 != 45)
  {
    if (v17 != 43)
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      self->_allocationSizeUpperBound = self->_allocationSizeLowerBound;
      goto LABEL_20;
    }
    v20 = 0;
    v22 = 0;
    self->_allocationSizeUpperBound = -1;
    __s1 = v16 + 1;
    goto LABEL_14;
  }
  v23 = v16[1];
  __s1 = v16 + 1;
  if ((v23 - 48) > 9)
  {
    v20 = 0;
    v22 = 0;
    self->_allocationSizeUpperBound = -1;
LABEL_14:
    v21 = 1;
    goto LABEL_20;
  }
  v24 = _parseAllocationSizeBound((const char **)&__s1);
  self->_allocationSizeUpperBound = v24;
  if (v24 > 0xF)
  {
    if (v24 >= self->_allocationSizeLowerBound)
    {
      v20 = 0;
      goto LABEL_19;
    }
    VMUOptionParserError(-1, CFSTR("error in malloc size pattern '%@': lower bound of size (%llu) should be <= upper bound of size (%llu)"), v25, v26, v27, v28, v29, v30, (uint64_t)v14);
  }
  else
  {
    VMUOptionParserError(-1, CFSTR("error in malloc size pattern '%@':  if upper bound of size is given, it must be %llu or more"), v25, v26, v27, v28, v29, v30, (uint64_t)v14);
  }
  v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
  v21 = 1;
  v22 = 1;
LABEL_20:
  if (strcmp(__s1, "]"))
  {
    v37 = v13;

    v20 = v37;
  }
  if (((v19 | v22) & 1) == 0)
  {
    v39 = v13;
LABEL_30:
    v40 = v39;

    v20 = v40;
    goto LABEL_31;
  }
  if ((v21 & 1) == 0)
  {
    allocationSizeLowerBound = self->_allocationSizeLowerBound;
    if (allocationSizeLowerBound <= 0xF)
    {
      VMUOptionParserError(-1, CFSTR("error in malloc size pattern '%@':  size must be %llu or more"), v31, v32, v33, v34, v35, v36, (uint64_t)v14);
LABEL_29:
      v39 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if ((allocationSizeLowerBound & 0xF) != 0)
    {
      VMUOptionParserError(-1, CFSTR("error in malloc size pattern '%@':  size must be a multiple of %llu, or a range like '[lowerSizeBound-upperSizeBound]'"), v31, v32, v33, v34, v35, v36, (uint64_t)v14);
      goto LABEL_29;
    }
  }
LABEL_31:
  if (a4 && v20)
    *a4 = objc_retainAutorelease(v20);

  return v20 == 0;
}

- (BOOL)_regex:(id *)a3 matchesName:(id)a4
{
  const char *v5;
  unsigned int v6;
  unsigned int v7;
  BOOL result;
  regmatch_t v9;

  if (!a3)
    return 0;
  v9.rm_so = 0;
  v9.rm_eo = 0;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  v6 = regexec((const regex_t *)a3, v5, 1uLL, &v9, 0);
  v7 = v6;
  if (v6 >= 2)
  {
    -[VMUClassPatternMatcher _regex:matchesName:].cold.1(v6, (const regex_t *)a3);
    return 0;
  }
  else
  {
    result = 0;
    if (!v7 && !v9.rm_so)
      return v9.rm_eo == strlen(v5);
  }
  return result;
}

- (BOOL)_matchesClassInfo:(id)a3
{
  id v4;
  __CFDictionary *memoizedRegexResult;
  $019B15D08CAF2F6032DDFBB53180E398 *classesRegex;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  $019B15D08CAF2F6032DDFBB53180E398 *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  BOOL v16;
  void *value;

  v4 = a3;
  if (v4 && (memoizedRegexResult = self->_memoizedRegexResult) != 0)
  {
    value = 0;
    if (!CFDictionaryGetValueIfPresent(memoizedRegexResult, v4, (const void **)&value))
    {
      classesRegex = self->_classesRegex;
      objc_msgSend(v4, "className");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(classesRegex) = -[VMUClassPatternMatcher _regex:matchesName:](self, "_regex:matchesName:", classesRegex, v7);

      if ((classesRegex & 1) != 0)
        goto LABEL_9;
      objc_msgSend(v4, "className");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v10 & 1) == 0)
      {
        v11 = self->_classesRegex;
        objc_msgSend(v4, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = -[VMUClassPatternMatcher _regex:matchesName:](self, "_regex:matchesName:", v11, v12);

        if ((v11 & 1) != 0)
          goto LABEL_9;
      }
      if (self->_matchingKindOfClass
        && (objc_msgSend(v4, "superclassInfo"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = -[VMUClassPatternMatcher _matchesClassInfo:](self, "_matchesClassInfo:", v13),
            v13,
            v14))
      {
LABEL_9:
        v15 = 1;
      }
      else
      {
        v15 = 0;
      }
      value = (void *)v15;
      CFDictionarySetValue(self->_memoizedRegexResult, v4, (const void *)v15);
    }
    v16 = value != 0;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)matchesNodeDetails:(id)a3 orNodeDescription:(id)a4
{
  id v6;
  unint64_t allocationSizeLowerBound;
  unint64_t v8;
  BOOL v9;

  v6 = a4;
  if (matchesNodeDetails_orNodeDescription__onceToken != -1)
    dispatch_once(&matchesNodeDetails_orNodeDescription__onceToken, &__block_literal_global_3);
  if (*(_QWORD *)(a3.var0 + 8) >> 60 == 1)
  {
    if ((*(_QWORD *)(a3.var0 + 16) || !self->_patternMatchesNonObjects)
      && !-[VMUClassPatternMatcher _matchesClassInfo:](self, "_matchesClassInfo:"))
    {
      goto LABEL_15;
    }
  }
  else if (!v6
         || !-[VMUClassPatternMatcher _regex:matchesName:](self, "_regex:matchesName:", self->_vmRegionsRegex, v6))
  {
    goto LABEL_15;
  }
  allocationSizeLowerBound = self->_allocationSizeLowerBound;
  if (!allocationSizeLowerBound && !self->_allocationSizeUpperBound
    || (v8 = *(_QWORD *)(a3.var0 + 8) & 0xFFFFFFFFFFFFFFFLL, allocationSizeLowerBound <= v8)
    && v8 <= self->_allocationSizeUpperBound)
  {
    v9 = 1;
    goto LABEL_16;
  }
LABEL_15:
  v9 = 0;
LABEL_16:

  return v9;
}

void __63__VMUClassPatternMatcher_matchesNodeDetails_orNodeDescription___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", CFSTR("malloc"), &stru_1E4E04720, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)matchesNodeDetails_orNodeDescription__mallocClassInfo;
  matchesNodeDetails_orNodeDescription__mallocClassInfo = v0;

}

- (void)_regex:(int)a1 matchesName:(const regex_t *)a2 .cold.1(int a1, const regex_t *a2)
{
  char v2[2048];
  uint8_t buf[4];
  char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  regerror(a1, a2, v2, 0x800uLL);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v4 = v2;
    _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s\n", buf, 0xCu);
  }
}

@end
