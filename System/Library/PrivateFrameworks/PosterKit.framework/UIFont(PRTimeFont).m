@implementation UIFont(PRTimeFont)

+ (void)pr_clearCachesForInvalidation
{
  void *v0;
  void *v1;

  os_unfair_lock_lock((os_unfair_lock_t)&cachedFontLock);
  v0 = (void *)cachedFontWithDefaultFallbacks;
  cachedFontWithDefaultFallbacks = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
  v1 = (void *)cachedDefaultFallbacks;
  cachedDefaultFallbacks = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
}

+ (uint64_t)pr_fontWithTimeFontIdentifier:()PRTimeFont
{
  return objc_msgSend(a1, "pr_fontWithTimeFontIdentifier:forRole:", a3, 0);
}

+ (uint64_t)pr_fontWithTimeFontIdentifier:()PRTimeFont forRole:
{
  return objc_msgSend(a1, "pr_fontWithTimeFontIdentifier:forRole:includingFallbackFonts:", a3, a4, 1);
}

+ (id)pr_fontWithTimeFontIdentifier:()PRTimeFont forRole:includingFallbackFonts:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  PRFontNameForTimeFontIdentifier(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pr_fontWithName:forRole:includingFallbackFonts:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)pr_fontWithName:()PRTimeFont forRole:includingFallbackFonts:
{
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CTFontOptions v12;
  CTFontRef v13;
  CTFontRef v14;
  const __CTFont *v15;

  v7 = a3;
  v8 = a4;
  PRTimeFontIdentifierForFontName(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9
    || !PRTimeFontIsDownloadable(v9)
    || (objc_msgSend(MEMORY[0x1E0DC1350], "pr_downloadableFontWithPostScriptName:", v7),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall")))
      v12 = 132096;
    else
      v12 = 0x20000;
    v13 = CTFontCreateWithNameAndOptions(v7, 12.0, 0, v12);
    v14 = v13;
    if (a5)
    {
      -[__CTFont pr_fontWithDefaultFallbacksForRole:](v13, "pr_fontWithDefaultFallbacksForRole:", v8);
      v15 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v13;
    }
    v11 = v15;

  }
  return v11;
}

+ (id)pr_fontWithPostScriptName:()PRTimeFont inBundle:relativePath:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pr_fontWithPostScriptName:inBundleAtURL:relativePath:", v9, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)pr_fontWithPostScriptName:()PRTimeFont inBundleWithIdentifier:relativePath:
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0CA5848];
  v11 = a4;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithBundleIdentifier:error:", v11, 0);

  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(a1, "pr_fontWithPostScriptName:inBundleAtURL:relativePath:", v8, v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (CTFontRef)pr_fontWithPostScriptName:()PRTimeFont inBundleAtURL:relativePath:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFArray *FontsWithURL;
  const __CFArray *v18;
  CGFont *ValueAtIndex;
  CTFontRef v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFont+TimeFontUtilities.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleURL"));

    if (v11)
      goto LABEL_4;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFont+TimeFontUtilities.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("postScriptName"));

  if (!v10)
    goto LABEL_12;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFont+TimeFontUtilities.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleRelativePath"));

LABEL_4:
  objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v12, 1);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("postscript-name"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQueryItems:", v15);

  objc_msgSend(v13, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FontsWithURL = (const __CFArray *)CGFontCreateFontsWithURL();
  if (FontsWithURL)
  {
    v18 = FontsWithURL;
    if (CFArrayGetCount(FontsWithURL) == 1)
    {
      ValueAtIndex = (CGFont *)CFArrayGetValueAtIndex(v18, 0);
      v20 = CTFontCreateWithGraphicsFont(ValueAtIndex, 12.0, 0, 0);
    }
    else
    {
      v20 = 0;
    }
    CFRelease(v18);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)pr_downloadableFontWithPostScriptName:()PRTimeFont
{
  id v3;
  const __CFDictionary *v4;
  CTFontDescriptorRef v5;
  dispatch_semaphore_t v6;
  const __CFArray *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  _QWORD progressBlock[4];
  NSObject *v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD v16[3];
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  CTFontDescriptorRef v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = *MEMORY[0x1E0CA8380];
  v24[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = CTFontDescriptorCreateWithAttributes(v4);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 1;
  v6 = dispatch_semaphore_create(0);
  v22 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  progressBlock[0] = MEMORY[0x1E0C809B0];
  progressBlock[1] = 3221225472;
  progressBlock[2] = __60__UIFont_PRTimeFont__pr_downloadableFontWithPostScriptName___block_invoke;
  progressBlock[3] = &unk_1E21851E8;
  v14 = &v18;
  v15 = v16;
  v8 = v6;
  v13 = v8;
  CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v7, 0, progressBlock);

  v9 = dispatch_time(0, 750000000);
  dispatch_semaphore_wait(v8, v9);
  if (*((_BYTE *)v19 + 24))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 48.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

+ (id)pr_defaultTimeFont
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pr_defaultTimeFontIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pr_fontWithTimeFontIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pr_defaultTimeFontForRole:()PRTimeFont
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "pr_defaultTimeFontIdentifierForRole:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pr_fontWithTimeFontIdentifier:forRole:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)pr_defaultTimeFontIdentifier
{
  return objc_msgSend(a1, "pr_defaultTimeFontIdentifierForRole:", CFSTR("PRPosterRoleLockScreen"));
}

+ (__CFString)pr_defaultTimeFontIdentifierForRole:()PRTimeFont
{
  int v3;
  __CFString **v4;

  v3 = objc_msgSend(a3, "isEqual:", CFSTR("PRPosterRoleIncomingCall"));
  v4 = PRTimeFontIdentifierSoft;
  if (v3)
    v4 = PRTimeFontIdentifierSFPro;
  return *v4;
}

+ (void)pr_replacementFallbackFontNamesForRole:()PRTimeFont
{
  if (objc_msgSend(a3, "isEqual:", CFSTR("PRPosterRoleIncomingCall")))
    return &unk_1E21DD368;
  else
    return 0;
}

- (CTFontRef)pr_minimumAllowedFontWeightFont
{
  void *v1;
  __CFString *v2;
  CTFontRef v3;

  objc_msgSend(a1, "pr_timeFontIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PRMinimumVariableFontNameForTimeFontIdentifier(v1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = CTFontCreateWithNameAndOptions(v2, 12.0, 0, 0x20000uLL);
  else
    v3 = 0;

  return v3;
}

- (CTFontRef)pr_maximumAllowedFontWeightFont
{
  void *v1;
  __CFString *v2;
  CTFontRef v3;

  objc_msgSend(a1, "pr_timeFontIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PRMaximumVariableFontNameForTimeFontIdentifier(v1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = CTFontCreateWithNameAndOptions(v2, 12.0, 0, 0x20000uLL);
  else
    v3 = 0;

  return v3;
}

- (id)pr_fontWithDefaultFallbacksForRole:()PRTimeFont
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v26[0] = a1;
    v26[1] = v4;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = v26;
    v8 = 2;
  }
  else
  {
    v27[0] = a1;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = v27;
    v8 = 1;
  }
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&cachedFontLock);
  v10 = (void *)cachedFontWithDefaultFallbacks;
  if (!cachedFontWithDefaultFallbacks)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)cachedFontWithDefaultFallbacks;
    cachedFontWithDefaultFallbacks = v11;

    v10 = (void *)cachedFontWithDefaultFallbacks;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend((id)cachedFontWithDefaultFallbacks, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);
    objc_msgSend(a1, "pr_defaultFontFallbacks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "pr_fontWithFallbacks:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "pr_timeFontIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYorkAlpha")) & 1) != 0
      || objc_msgSend(v16, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFCondensed")))
    {
      PRFontNameForTimeFontIdentifier(CFSTR("PRTimeFontIdentifierSFArabic"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v17;
      PRFontNameForTimeFontIdentifier(CFSTR("PRTimeFontIdentifierSFHebrew"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "pr_fontWithFallbacks:beforeFontContainingName:", v19, CFSTR("TimesNewRomanPS-BoldMT"), v25[0]);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "pr_replacementFallbackFontNamesForRole:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21 && objc_msgSend(v21, "count"))
    {
      objc_msgSend(v14, "pr_replaceFallbackFontNames:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v23;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&cachedFontLock);
    objc_msgSend((id)cachedFontWithDefaultFallbacks, "setObject:forKeyedSubscript:", v14, v9);
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);

  }
  return v14;
}

- (id)pr_defaultFontFallbacks
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  CFArrayRef v7;

  os_unfair_lock_lock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
  v2 = (void *)cachedDefaultFallbacks;
  if (!cachedDefaultFallbacks)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)cachedDefaultFallbacks;
    cachedDefaultFallbacks = v3;

    v2 = (void *)cachedDefaultFallbacks;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend((id)cachedDefaultFallbacks, "objectForKeyedSubscript:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
    v7 = CTFontCopyDefaultCascadeListForLanguages(a1, 0);
    v6 = (void *)-[__CFArray copy](v7, "copy");
    CFRelease(v7);
    os_unfair_lock_lock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
    objc_msgSend((id)cachedDefaultFallbacks, "setObject:forKeyedSubscript:", v6, a1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedDefaultFallbacksLock);
  return v6;
}

- (id)pr_fontFallbacks
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CA81D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "pr_defaultFontFallbacks");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (CTFontRef)pr_fontWithFallbacks:()PRTimeFont
{
  const __CFDictionary *v4;
  const __CTFontDescriptor *v5;
  CTFontRef CopyWithAttributes;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, *MEMORY[0x1E0CA81D8]);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = CTFontDescriptorCreateWithAttributes(v4);
  CopyWithAttributes = CTFontCreateCopyWithAttributes(a1, 0.0, 0, v5);

  return CopyWithAttributes;
}

- (id)pr_fontWithFallbacks:()PRTimeFont beforeFontContainingName:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *MatchingFontDescriptorsWithOptions;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a1;
  v24 = a4;
  objc_msgSend(a1, "pr_fontFallbacks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v7, "mutableCopy");

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  if (v24)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __68__UIFont_PRTimeFont__pr_fontWithFallbacks_beforeFontContainingName___block_invoke;
    v31[3] = &unk_1E2185210;
    v32 = v24;
    v33 = &v34;
    objc_msgSend(v26, "enumerateObjectsUsingBlock:", v31);

  }
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = *MEMORY[0x1E0DC1388];
  v41[0] = *MEMORY[0x1E0DC1388];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1E0DC1358];
        v38 = v9;
        v39 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fontDescriptorWithFontAttributes:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        MatchingFontDescriptorsWithOptions = (void *)CTFontDescriptorCreateMatchingFontDescriptorsWithOptions();
        objc_msgSend(MatchingFontDescriptorsWithOptions, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          objc_msgSend(v26, "insertObject:atIndex:", v20, v35[3]++);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    }
    while (v12);
  }

  objc_msgSend(v23, "pr_fontWithFallbacks:", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v34, 8);
  return v21;
}

- (id)pr_replaceFallbackFontNames:()PRTimeFont
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "pr_fontFallbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = *MEMORY[0x1E0DC1388];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__UIFont_PRTimeFont__pr_replaceFallbackFontNames___block_invoke;
  v15[3] = &unk_1E2185238;
  v16 = v4;
  v17 = v9;
  v18 = v6;
  v10 = v6;
  v11 = v9;
  v12 = v4;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend(a1, "pr_fontWithFallbacks:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)pr_timeFontIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fontName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PRTimeFontIdentifierForFontName(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pr_localizedTimeFontName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "pr_timeFontIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    PRLocalizedDisplayNameForTimeFontIdentifier(v2);
  else
    objc_msgSend(a1, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CFStringRef)pr_postScriptName
{
  return (id)CTFontCopyPostScriptName(a1);
}

- (id)pr_referenceURL
{
  const __CTFontDescriptor *v1;
  void *v2;

  objc_msgSend(a1, "fontDescriptor");
  v1 = (const __CTFontDescriptor *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)CTFontDescriptorCopyAttribute(v1, (CFStringRef)*MEMORY[0x1E0CA83C8]);

  return v2;
}

- (id)pr_referencePathRelativeToBundle:()PRTimeFont
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFont+TimeFontUtilities.m"), 366, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle != nil"));

  }
  objc_msgSend(v5, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pr_referencePathRelativeToDirectoryAtURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pr_referencePathRelativeToDirectoryAtURL:()PRTimeFont
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFont+TimeFontUtilities.m"), 372, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryURL != nil"));

  }
  if (objc_msgSend(a1, "pr_isReferenceFileContainedInDirectoryAtURL:", v5))
  {
    objc_msgSend(a1, "pr_referenceURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hasPrefix:", v8))
    {
      objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v8, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)pr_isReferenceFileContainedInBundle:()PRTimeFont
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "pr_isReferenceFileContainedInDirectoryAtURL:", v4);

  return v5;
}

- (uint64_t)pr_isReferenceFileContainedInDirectoryAtURL:()PRTimeFont
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  unsigned int v9;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a1, "pr_referenceURL");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v11 = 0;
    v9 = objc_msgSend(v8, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v11, v4, v6, 0);
    if (v11)
      v7 = 0;
    else
      v7 = v9;

  }
  return v7;
}

@end
