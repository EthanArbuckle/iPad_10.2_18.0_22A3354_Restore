@implementation UIFont(PosterUIFoundation)

+ (void)pui_clearCachesForInvalidation
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

+ (uint64_t)pui_UIFontWithPUIFontIdentifier:()PosterUIFoundation
{
  return objc_msgSend(a1, "pui_UIFontWithPUIFontIdentifier:forRole:", a3, 0);
}

+ (uint64_t)pui_UIFontWithPUIFontIdentifier:()PosterUIFoundation forRole:
{
  return objc_msgSend(a1, "pui_UIFontWithPUIFontIdentifier:forRole:includingFallbackFonts:", a3, a4, 1);
}

+ (id)pui_UIFontWithPUIFontIdentifier:()PosterUIFoundation forRole:includingFallbackFonts:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  UIFontNameForPUIFontIdentifier(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_UIFontWithName:forRole:includingFallbackFonts:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (const)pui_UIFontWithName:()PosterUIFoundation forRole:includingFallbackFonts:
{
  id v7;
  uint64_t v8;
  __CFString *v9;
  CTFontOptions v10;
  CTFontRef v11;
  const __CTFont *v12;
  const __CTFont *v13;

  v7 = a4;
  v8 = *MEMORY[0x24BE74D58];
  v9 = a3;
  if (objc_msgSend(v7, "isEqualToString:", v8))
    v10 = 132096;
  else
    v10 = 0x20000;
  v11 = CTFontCreateWithNameAndOptions(v9, 12.0, 0, v10);

  if (a5)
  {
    -[__CTFont pui_UIFontWithDefaultFallbacksForRole:](v11, "pui_UIFontWithDefaultFallbacksForRole:", v7);
    v12 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v11;
  }
  v13 = v12;

  return v13;
}

+ (id)pui_UIFontWithPostScriptName:()PosterUIFoundation inBundle:relativePath:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_UIFontWithPostScriptName:inBundleAtURL:relativePath:", v9, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)pui_UIFontWithPostScriptName:()PosterUIFoundation inBundleWithIdentifier:relativePath:
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
  v10 = (objc_class *)MEMORY[0x24BDC1528];
  v11 = a4;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithBundleIdentifier:error:", v11, 0);

  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(a1, "pui_UIFontWithPostScriptName:inBundleAtURL:relativePath:", v8, v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (CTFontRef)pui_UIFontWithPostScriptName:()PosterUIFoundation inBundleAtURL:relativePath:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFArray *FontsWithURL;
  const __CFArray *v14;
  CGFont *ValueAtIndex;
  CTFontRef v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(a4, "URLByAppendingPathComponent:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v8, 1);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("postscript-name"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQueryItems:", v11);

  objc_msgSend(v9, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FontsWithURL = (const __CFArray *)CGFontCreateFontsWithURL();
  if (FontsWithURL)
  {
    v14 = FontsWithURL;
    if (CFArrayGetCount(FontsWithURL) == 1)
    {
      ValueAtIndex = (CGFont *)CFArrayGetValueAtIndex(v14, 0);
      v16 = CTFontCreateWithGraphicsFont(ValueAtIndex, 12.0, 0, 0);
    }
    else
    {
      v16 = 0;
    }
    CFRelease(v14);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)pui_defaultFont
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pui_defaultFontIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_UIFontWithPUIFontIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pui_defaultFontForRole:()PosterUIFoundation
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "pui_defaultFontIdentifierForRole:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_UIFontWithPUIFontIdentifier:forRole:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)pui_defaultFontIdentifier
{
  return objc_msgSend(a1, "pui_defaultFontIdentifierForRole:", *MEMORY[0x24BE74D68]);
}

+ (__CFString)pui_defaultFontIdentifierForRole:()PosterUIFoundation
{
  int v3;
  __CFString **v4;

  v3 = objc_msgSend(a3, "isEqual:", *MEMORY[0x24BE74D58]);
  v4 = PUIFontIdentifierSoft;
  if (v3)
    v4 = PUIFontIdentifierSFPro;
  return *v4;
}

+ (void)pui_replacementFallbackFontNamesForRole:()PosterUIFoundation
{
  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x24BE74D58]))
    return &unk_25156ACE0;
  else
    return 0;
}

- (CTFontRef)pui_minimumAllowedFontWeightFont
{
  void *v1;
  __CFString *v2;
  CTFontRef v3;

  objc_msgSend(a1, "pui_timeFontIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PUIMinimumVariableFontNameForTimeFontIdentifier(v1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = CTFontCreateWithNameAndOptions(v2, 12.0, 0, 0x20000uLL);
  else
    v3 = 0;

  return v3;
}

- (CTFontRef)pui_maximumAllowedFontWeightFont
{
  void *v1;
  __CFString *v2;
  CTFontRef v3;

  objc_msgSend(a1, "pui_timeFontIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PUIMaximumVariableFontNameForTimeFontIdentifier(v1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = CTFontCreateWithNameAndOptions(v2, 12.0, 0, 0x20000uLL);
  else
    v3 = 0;

  return v3;
}

- (id)pui_UIFontWithDefaultFallbacksForRole:()PosterUIFoundation
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

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v26[0] = a1;
    v26[1] = v4;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = v26;
    v8 = 2;
  }
  else
  {
    v27[0] = a1;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = v27;
    v8 = 1;
  }
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&cachedFontLock);
  v10 = (void *)cachedFontWithDefaultFallbacks;
  if (!cachedFontWithDefaultFallbacks)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
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
    objc_msgSend(a1, "pui_defaultFontFallbacks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "pui_fontWithFallbacks:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "pui_timeFontIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYorkAlpha")) & 1) != 0
      || objc_msgSend(v16, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFCondensed")))
    {
      UIFontNameForPUIFontIdentifier(CFSTR("PRTimeFontIdentifierSFArabic"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v17;
      UIFontNameForPUIFontIdentifier(CFSTR("PRTimeFontIdentifierSFHebrew"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "pui_fontWithFallbacks:beforeFontContainingName:", v19, CFSTR("TimesNewRomanPS-BoldMT"), v25[0]);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
    }
    objc_msgSend(MEMORY[0x24BDF6A70], "pui_replacementFallbackFontNamesForRole:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21 && objc_msgSend(v21, "count"))
    {
      objc_msgSend(v14, "pui_replaceFallbackFontNames:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v23;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&cachedFontLock);
    objc_msgSend((id)cachedFontWithDefaultFallbacks, "setObject:forKeyedSubscript:", v14, v9);
    os_unfair_lock_unlock((os_unfair_lock_t)&cachedFontLock);

  }
  return v14;
}

- (id)pui_defaultFontFallbacks
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
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
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

- (id)pui_fontFallbacks
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDC4C30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "pui_defaultFontFallbacks");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (CTFontRef)pui_fontWithFallbacks:()PosterUIFoundation
{
  const __CFDictionary *v4;
  const __CTFontDescriptor *v5;
  CTFontRef CopyWithAttributes;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a3, *MEMORY[0x24BDC4C30]);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = CTFontDescriptorCreateWithAttributes(v4);
  CopyWithAttributes = CTFontCreateCopyWithAttributes(a1, 0.0, 0, v5);

  return CopyWithAttributes;
}

- (id)pui_fontWithFallbacks:()PosterUIFoundation beforeFontContainingName:
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

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23 = a1;
  v24 = a4;
  objc_msgSend(a1, "pui_fontFallbacks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v7, "mutableCopy");

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  if (v24)
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __77__UIFont_PosterUIFoundation__pui_fontWithFallbacks_beforeFontContainingName___block_invoke;
    v31[3] = &unk_25154B998;
    v32 = v24;
    v33 = &v34;
    objc_msgSend(v26, "enumerateObjectsUsingBlock:", v31);

  }
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = *MEMORY[0x24BDF7750];
  v41[0] = *MEMORY[0x24BDF7750];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
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
        v16 = (void *)MEMORY[0x24BDF6A78];
        v38 = v9;
        v39 = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
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

  objc_msgSend(v23, "pui_fontWithFallbacks:", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v34, 8);
  return v21;
}

- (id)pui_replaceFallbackFontNames:()PosterUIFoundation
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

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "pui_fontFallbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)MEMORY[0x24BDBCF20];
  v19[0] = *MEMORY[0x24BDF7750];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__UIFont_PosterUIFoundation__pui_replaceFallbackFontNames___block_invoke;
  v15[3] = &unk_25154B9C0;
  v16 = v4;
  v17 = v9;
  v18 = v6;
  v10 = v6;
  v11 = v9;
  v12 = v4;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend(a1, "pui_fontWithFallbacks:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)pui_timeFontIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fontName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PUIFontIdentifierForFontName(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pui_localizedTimeFontName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "pui_timeFontIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    PUILocalizedDisplayNameForTimeFontIdentifier(v2);
  else
    objc_msgSend(a1, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CFStringRef)pui_postScriptName
{
  return (id)CTFontCopyPostScriptName(a1);
}

- (id)pui_referenceURL
{
  const __CTFontDescriptor *v1;
  void *v2;

  objc_msgSend(a1, "fontDescriptor");
  v1 = (const __CTFontDescriptor *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)CTFontDescriptorCopyAttribute(v1, (CFStringRef)*MEMORY[0x24BDC4DA0]);

  return v2;
}

- (id)pui_referencePathRelativeToBundle:()PosterUIFoundation
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_referencePathRelativeToDirectoryAtURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pui_referencePathRelativeToDirectoryAtURL:()PosterUIFoundation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(a1, "pui_isReferenceFileContainedInDirectoryAtURL:", v4))
  {
    objc_msgSend(a1, "pui_referenceURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasPrefix:", v7))
    {
      objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v7, "length"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)pui_isReferenceFileContainedInBundle:()PosterUIFoundation
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "pui_isReferenceFileContainedInDirectoryAtURL:", v4);

  return v5;
}

- (uint64_t)pui_isReferenceFileContainedInDirectoryAtURL:()PosterUIFoundation
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  unsigned int v9;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a1, "pui_referenceURL");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD1580]);
    v11 = 0;
    v9 = objc_msgSend(v8, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v11, v4, v6, 0);
    if (v11)
      v7 = 0;
    else
      v7 = v9;

  }
  return v7;
}

- (uint64_t)pui_variantWeight
{
  void *v2;
  void *v3;
  uint64_t v4;
  CFDictionaryRef v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFDictionary *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "pui_cachedVariantWeight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "pui_cachedVariantWeight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

    return v4;
  }
  else
  {
    v6 = CTFontCopyVariation((CTFontRef)a1);
    if (v6
      && (objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 2003265650.0),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v8))
    {
      objc_msgSend(a1, "pui_setCachedVariantWeight:", v8);
      v9 = objc_msgSend(v8, "unsignedIntegerValue");

    }
    else
    {
      v22 = v6;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = (id)CTFontCopyVariationAxesInternal();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v24;
        v14 = *MEMORY[0x24BDC4E50];
        v15 = *MEMORY[0x24BDC4E48];
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v17, "objectForKeyedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
            {
              if (objc_msgSend(v18, "unsignedIntegerValue") == 2003265652)
              {
                objc_msgSend(v17, "objectForKeyedSubscript:", v15);
                v20 = objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  v21 = (void *)v20;
                  objc_msgSend(a1, "pui_setCachedVariantWeight:", v20);
                  v9 = objc_msgSend(v21, "unsignedIntegerValue");

                  goto LABEL_18;
                }
              }
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v12)
            continue;
          break;
        }
      }

      objc_msgSend(a1, "pui_setCachedVariantWeight:", &unk_25156AD08);
      v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

      v6 = v22;
    }

    return v9;
  }
}

- (uint64_t)pui_variantWeightRange
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "pui_minimumAllowedFontWeightFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_maximumAllowedFontWeightFont");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2 && v3)
  {
    v5 = objc_msgSend(v2, "pui_variantWeight") + 1;
    objc_msgSend(v4, "pui_variantWeight");
  }
  else
  {
    v21 = (void *)v3;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = (id)CTFontCopyVariationAxesInternal();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      v10 = *MEMORY[0x24BDC4E50];
      v22 = *MEMORY[0x24BDC4E60];
      v11 = *MEMORY[0x24BDC4E58];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14 && objc_msgSend(v14, "unsignedIntegerValue") == 2003265652)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", v22);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v16)
              v19 = v17 == 0;
            else
              v19 = 1;
            if (!v19)
            {
              v5 = objc_msgSend(v16, "unsignedIntValue") + 1;
              objc_msgSend(v18, "unsignedIntValue");

              goto LABEL_20;
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    v5 = 0;
LABEL_20:
    v4 = v21;
  }

  return v5;
}

- (id)pui_UIFontWithVariantWeight:()PosterUIFoundation forRole:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFDictionary *v11;
  const __CTFontDescriptor *v12;
  CGFloat v13;
  CTFontRef CopyWithAttributes;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19 = *MEMORY[0x24BDC4E40];
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", 2003265650.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = CTFontDescriptorCreateWithAttributes(v11);
  objc_msgSend(a1, "pointSize");
  CopyWithAttributes = CTFontCreateCopyWithAttributes((CTFontRef)a1, v13, 0, v12);
  CFRelease(v12);
  -[__CTFont pui_UIFontWithDefaultFallbacksForRole:](CopyWithAttributes, "pui_UIFontWithDefaultFallbacksForRole:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
