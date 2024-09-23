@implementation TSWPFontCache

- (__CTFont)createFontWithName:(id)a3 size:(double)a4 weight:(double)a5 attributes:(id)a6
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CTFontDescriptor *v13;
  const __CTFontDescriptor *v14;
  __CTFont *v15;

  if (!a6)
    return -[TSWPFontCache _createFontWithName:size:weight:](self, "_createFontWithName:size:weight:", a3, a4, a5);
  v9 = (void *)objc_msgSend(a6, "mutableCopy", a3);
  v10 = *MEMORY[0x24BDC4DE0];
  v11 = (void *)objc_msgSend((id)objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x24BDC4DE0]), "mutableCopy");
  if (!v11)
    v11 = (void *)objc_opt_new();
  v12 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDC4E80]);
  if (v11)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);
  v13 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)v9);
  if (v13)
  {
    v14 = v13;
    v15 = CTFontCreateWithFontDescriptor(v13, a4, 0);
    CFRelease(v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)sharedCache
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = (id)+[TSWPFontCache sharedCache]::sSingletonInstance;
  if (!+[TSWPFontCache sharedCache]::sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!+[TSWPFontCache sharedCache]::sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      +[TSWPFontCache sharedCache]::sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPFontCache sharedCache]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 65, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSWPFontCache sharedCache]::sSingletonInstance;
  }
  return result;
}

- (TSWPFontCache)init
{
  TSWPFontCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPFontCache;
  v2 = -[TSWPFontCache init](&v4, sel_init);
  if (v2)
  {
    v2->_fontCache = (TSULRUCache *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3CA0]), "initWithMaxSize:", 32);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel_p_FontWasDownloaded_, CFSTR("CTFontWasDownloaded"), 0);
  }
  return v2;
}

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSWPFontCache;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPFontCache allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 65, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (void)dealloc
{
  objc_super v3;

  self->_fontCache = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("CTFontWasDownloaded"), 0);
  v3.receiver = self;
  v3.super_class = (Class)TSWPFontCache;
  -[TSWPFontCache dealloc](&v3, sel_dealloc);
}

- (__CTFont)_createFontWithName:(id)a3 size:(double)a4 weight:(double)a5
{
  TSWPFontCacheKey *v9;
  TSWPFontCacheValue *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CTFontDescriptor *v14;
  CTFontRef v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v9 = +[TSWPFontCacheKey cacheKeyWithFontName:size:weight:](TSWPFontCacheKey, "cacheKeyWithFontName:size:weight:");
  objc_sync_enter(self);
  objc_opt_class();
  -[TSULRUCache objectForKey:](self->_fontCache, "objectForKey:", v9);
  v10 = (TSWPFontCacheValue *)TSUDynamicCast();
  if (v10)
  {
    objc_sync_exit(self);
  }
  else
  {
    if (objc_msgSend(a3, "hasPrefix:", CFSTR(".System-")))
    {
      v11 = *MEMORY[0x24BDC4E00];
      v12 = *MEMORY[0x24BDC4E80];
      v21[0] = *MEMORY[0x24BDC4E28];
      v21[1] = v12;
      v22[0] = v11;
      v22[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
      v13 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v19 = *MEMORY[0x24BDC4DE0];
      v20 = v13;
      v14 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v15 = CTFontCreateWithFontDescriptor(v14, a4, 0);
      CFRelease(v14);
    }
    else
    {
      v15 = CTFontCreateWithName((CFStringRef)a3, a4, 0);
    }
    v10 = +[TSWPFontCacheValue cacheValueWithCTFont:](TSWPFontCacheValue, "cacheValueWithCTFont:", v15);
    if (v15)
      CFRelease(v15);
    -[TSULRUCache setObject:forKey:](self->_fontCache, "setObject:forKey:", v10, v9);
    objc_sync_exit(self);
    if (!v10)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFontCache _createFontWithName:size:weight:]");
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 165, CFSTR("invalid nil value for '%s'"), "cacheValue");
      v10 = 0;
    }
  }
  if (-[TSWPFontCacheValue ctFont](v10, "ctFont"))
    CFRetain(-[TSWPFontCacheValue ctFont](v10, "ctFont"));
  return -[TSWPFontCacheValue ctFont](v10, "ctFont");
}

- (id)p_excludedFamilyNames
{
  uint64_t v2;

  if ((-[TSWPFontCache p_excludedFamilyNames]::sInitialized & 1) == 0)
  {
    -[TSWPFontCache p_excludedFamilyNames]::sInitialized = 1;
    v2 = objc_msgSend((id)TSWPBundle(), "pathForResource:ofType:", CFSTR("FontExclusionList"), CFSTR("plist"));
    if (v2)
      -[TSWPFontCache p_excludedFamilyNames]::sExcludedFontFamilies = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithContentsOfFile:", v2);
  }
  return (id)-[TSWPFontCache p_excludedFamilyNames]::sExcludedFontFamilies;
}

- (id)sortedFontFamilies
{
  const __CTFontCollection *v3;
  const __CTFontCollection *v4;
  const __CFArray *MatchingFontDescriptors;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t i;
  const __CFString *v12;
  const __CFString *v13;
  const __CTFontCollection *cf;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  _QWORD v22[3];

  v22[1] = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  if (!self->_familyNames)
  {
    v21 = *MEMORY[0x24BDC4C40];
    v22[0] = MEMORY[0x24BDBD1C8];
    v3 = CTFontCollectionCreateFromAvailableFonts((CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
    v4 = v3;
    if (v3)
    {
      MatchingFontDescriptors = CTFontCollectionCreateMatchingFontDescriptors(v3);
      if (MatchingFontDescriptors)
      {
        v6 = -[TSWPFontCache p_excludedFamilyNames](self, "p_excludedFamilyNames");
        v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", CFArrayGetCount(MatchingFontDescriptors));
        cf = v4;
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = -[__CFArray countByEnumeratingWithState:objects:count:](MatchingFontDescriptors, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v17;
          v10 = (const __CFString *)*MEMORY[0x24BDC4D08];
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v17 != v9)
                objc_enumerationMutation(MatchingFontDescriptors);
              v12 = (const __CFString *)CTFontDescriptorCopyAttribute(*(CTFontDescriptorRef *)(*((_QWORD *)&v16 + 1) + 8 * i), v10);
              v13 = v12;
              if (v12)
              {
                if (!CFStringHasPrefix(v12, CFSTR(".")) && (objc_msgSend(v6, "containsObject:", v13) & 1) == 0)
                  objc_msgSend(v7, "addObject:", v13);
                CFRelease(v13);
              }
            }
            v8 = -[__CFArray countByEnumeratingWithState:objects:count:](MatchingFontDescriptors, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          }
          while (v8);
        }
        CFRelease(MatchingFontDescriptors);
        v4 = cf;
      }
      else
      {
        v7 = 0;
      }
      CFRelease(v4);
    }
    else
    {
      v7 = 0;
    }
    self->_familyNames = (NSArray *)(id)objc_msgSend((id)objc_msgSend(v7, "allObjects"), "sortedArrayUsingSelector:", sel_compare_);
  }
  objc_sync_exit(self);
  return self->_familyNames;
}

- (id)sortedFontFamilyEntriesForStylesheet:(id)a3
{
  TSWPFontCache *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  const __CTFontDescriptor *v11;
  const __CTFontDescriptor *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;
  TSWPFontCache *v21;
  NSArray *v22;
  id obj;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = self;
  v32 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  if (!v4->_familyFonts)
  {
    v21 = v4;
    obj = -[TSWPFontCache sortedFontFamilies](v4, "sortedFontFamilies");
    v22 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(obj, "count"));
    v20 = a3;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v26;
      v7 = *MEMORY[0x24BDC4D08];
      v8 = (const __CFString *)*MEMORY[0x24BDC4D70];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v9);
          v29 = v7;
          v30 = v10;
          v11 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
          v12 = v11;
          if (v11)
          {
            v13 = (void *)CTFontDescriptorCopyAttribute(v11, v8);
            if (v13)
            {
              -[NSArray addObject:](v22, "addObject:", +[TSWPFont fontWithName:](TSWPFont, "fontWithName:", v13));

              CFRelease(v12);
            }
            else
            {
              v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFontCache sortedFontFamilyEntriesForStylesheet:]");
              objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 314, CFSTR("Could not determine font name for descriptor: %@"), v12);
            }
          }
          else
          {
            v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFontCache sortedFontFamilyEntriesForStylesheet:]");
            objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 310, CFSTR("invalid nil value for '%s'"), "desc");
          }
          ++v9;
        }
        while (v5 != v9);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v5);
    }
    v4 = v21;
    v21->_familyFonts = v22;
    a3 = v20;
  }
  objc_sync_exit(v4);
  v18 = (void *)-[NSArray mutableCopy](v4->_familyFonts, "mutableCopy");
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __54__TSWPFontCache_sortedFontFamilyEntriesForStylesheet___block_invoke;
  v24[3] = &unk_24D82B168;
  v24[4] = v18;
  objc_msgSend(a3, "enumerateCascadedStylesUsingBlock:", v24);
  objc_msgSend(v18, "sortUsingComparator:", &__block_literal_global_63);
  return v18;
}

uint64_t __54__TSWPFontCache_sortedFontFamilyEntriesForStylesheet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  TSWPFont *v6;
  void *v7;
  _QWORD v8[5];

  if ((objc_msgSend(a2, "overridesProperty:", 46) & 1) != 0
    || (result = objc_msgSend(a2, "overridesProperty:", 16), (_DWORD)result))
  {
    objc_opt_class();
    objc_msgSend(a2, "valueForProperty:", 46);
    v5 = TSUDynamicCast();
    objc_opt_class();
    objc_msgSend(a2, "valueForProperty:", 16);
    result = TSUDynamicCast();
    if (result)
    {
      v6 = +[TSWPFont fontWithName:compatibilityName:](TSWPFont, "fontWithName:compatibilityName:", result, v5);
      v7 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __54__TSWPFontCache_sortedFontFamilyEntriesForStylesheet___block_invoke_2;
      v8[3] = &unk_24D82B6A8;
      v8[4] = v6;
      result = objc_msgSend(v7, "indexOfObjectPassingTest:", v8);
      if (result == 0x7FFFFFFFFFFFFFFFLL)
        return objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    }
  }
  return result;
}

uint64_t __54__TSWPFontCache_sortedFontFamilyEntriesForStylesheet___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t result;
  void *v9;
  uint64_t v10;

  objc_opt_class();
  v6 = (void *)TSUDynamicCast();
  if (v6)
  {
    v7 = v6;
    result = objc_msgSend((id)objc_msgSend(v6, "familyName"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "familyName"));
    if ((_DWORD)result)
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "compatibilityName")
        || (result = objc_msgSend((id)objc_msgSend(v7, "compatibilityName"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "compatibilityName")), (_DWORD)result))
      {
        result = 1;
        if (a4)
          *a4 = 1;
      }
    }
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFontCache sortedFontFamilyEntriesForStylesheet:]_block_invoke_2");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 347, CFSTR("invalid nil value for '%s'"), "existingFont");
    return 0;
  }
  return result;
}

uint64_t __54__TSWPFontCache_sortedFontFamilyEntriesForStylesheet___block_invoke_3()
{
  void *v0;

  objc_opt_class();
  v0 = (void *)TSUDynamicCast();
  objc_opt_class();
  return objc_msgSend((id)objc_msgSend(v0, "displayName"), "compare:", objc_msgSend((id)TSUDynamicCast(), "displayName"));
}

- (id)displayNameForFontFamily:(id)a3
{
  NSMutableDictionary *familyDisplayNames;
  void *v6;
  const __CFString *v7;
  const __CTFontDescriptor *v8;
  const __CTFontDescriptor *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  familyDisplayNames = self->_familyDisplayNames;
  if (familyDisplayNames)
  {
    if (a3)
      goto LABEL_3;
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  familyDisplayNames = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSArray count](self->_familyNames, "count"));
  self->_familyDisplayNames = familyDisplayNames;
  if (!a3)
    goto LABEL_8;
LABEL_3:
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](familyDisplayNames, "objectForKeyedSubscript:", a3);
  if (!v6)
  {
    v7 = (const __CFString *)*MEMORY[0x24BDC4D08];
    v15 = *MEMORY[0x24BDC4D08];
    v16[0] = a3;
    v8 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1));
    v9 = v8;
    if (v8)
    {
      v6 = (void *)CTFontDescriptorCopyLocalizedAttribute(v8, v7, 0);
      CFRelease(v9);
      if (v6)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_familyDisplayNames, "setObject:forKeyedSubscript:", v6, a3);

        goto LABEL_9;
      }
    }
    else
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFontCache displayNameForFontFamily:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 403, CFSTR("invalid nil value for '%s'"), "desc");
    }
    objc_sync_exit(self);
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFontCache displayNameForFontFamily:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 422, CFSTR("Couldn't generate a display name for font family: %@"), a3);
    return 0;
  }
LABEL_9:
  objc_sync_exit(self);
  return v6;
}

- (id)availableMembersOfFontFamily:(id)a3
{
  id v5;
  const __CFDictionary *v6;
  const __CTFontDescriptor *v7;
  const __CTFontDescriptor *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t i;
  const __CTFontDescriptor *v14;
  void *v15;
  void *v16;
  NSMutableArray *cachedAvailableMembers;
  id v18;
  const __CTFontDescriptor *v20;
  id v21;
  CFArrayRef obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v21 = (id)objc_opt_class();
  objc_sync_enter(v21);
  if (!-[NSString isEqualToString:](self->_cachedMembersFamilyName, "isEqualToString:", a3))
  {

    self->_cachedMembersFamilyName = 0;
    self->_cachedAvailableMembers = 0;
    v5 = objc_alloc(MEMORY[0x24BDBCE70]);
    v6 = (const __CFDictionary *)objc_msgSend(v5, "initWithObjectsAndKeys:", a3, *MEMORY[0x24BDC4D08], 0);
    v7 = CTFontDescriptorCreateWithAttributes(v6);
    v8 = v7;
    if (v7)
    {
      obj = CTFontDescriptorCreateMatchingFontDescriptors(v7, 0);
      if (obj)
      {
        self->_cachedMembersFamilyName = (NSString *)a3;
        v20 = v8;
        self->_cachedAvailableMembers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[__CFArray count](obj, "count"));
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v9 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v24;
          v11 = (const __CFString *)*MEMORY[0x24BDC4DC0];
          v12 = (const __CFString *)*MEMORY[0x24BDC4D70];
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(obj);
              v14 = *(const __CTFontDescriptor **)(*((_QWORD *)&v23 + 1) + 8 * i);
              v15 = (void *)CTFontDescriptorCopyLocalizedAttribute(v14, v11, 0);
              v16 = (void *)CTFontDescriptorCopyAttribute(v14, v12);
              cachedAvailableMembers = self->_cachedAvailableMembers;
              v27[0] = v16;
              v27[1] = v15;
              -[NSMutableArray addObject:](cachedAvailableMembers, "addObject:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2));

            }
            v9 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          }
          while (v9);
        }

        v8 = v20;
      }
      CFRelease(v8);
    }

  }
  v18 = (id)-[NSMutableArray copy](self->_cachedAvailableMembers, "copy");
  objc_sync_exit(v21);
  return v18;
}

- (void)p_FontWasDownloaded:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  id obj;
  const __CFString *attribute;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v5 = (void *)objc_msgSend(a3, "object");
  v6 = (void *)objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BDC4CB0]);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v21 = *(_QWORD *)v31;
    obj = v6;
    attribute = (const __CFString *)*MEMORY[0x24BDC4D70];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(obj);
        v9 = (void *)CTFontDescriptorCopyAttribute(*(CTFontDescriptorRef *)(*((_QWORD *)&v30 + 1) + 8 * i), attribute);
        v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v11 = (void *)-[TSULRUCache allKeys](self->_fontCache, "allKeys");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v27 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v15, "fontName"), "isEqualToString:", v9))
                objc_msgSend(v10, "addObject:", v15);
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
          }
          while (v12);
        }
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v23;
          do
          {
            for (k = 0; k != v16; ++k)
            {
              if (*(_QWORD *)v23 != v17)
                objc_enumerationMutation(v10);
              -[TSULRUCache removeObjectForKey:](self->_fontCache, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k));
            }
            v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
          }
          while (v16);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  self->_familyNames = 0;
  objc_sync_exit(self);
}

@end
