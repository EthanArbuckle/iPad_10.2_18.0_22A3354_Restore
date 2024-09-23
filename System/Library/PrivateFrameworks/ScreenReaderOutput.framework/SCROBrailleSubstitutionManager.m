@implementation SCROBrailleSubstitutionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  return (id)sharedInstance_Manager;
}

void __48__SCROBrailleSubstitutionManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_Manager;
  sharedInstance_Manager = v0;

}

- (SCROBrailleSubstitutionManager)init
{
  SCROBrailleSubstitutionManager *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSLinguisticTagger *linguisticTagger;
  uint64_t v7;
  NSMutableDictionary *lookup;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFURL *v14;
  CFBundleRef v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)SCROBrailleSubstitutionManager;
  v2 = -[SCROBrailleSubstitutionManager init](&v18, sel_init);
  v3 = objc_alloc(MEMORY[0x24BDD1638]);
  v19[0] = *MEMORY[0x24BDD0F88];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithTagSchemes:options:", v4, 0);
  linguisticTagger = v2->_linguisticTagger;
  v2->_linguisticTagger = (NSLinguisticTagger *)v5;

  v2->_taggerLock._os_unfair_lock_opaque = 0;
  v7 = objc_opt_new();
  lookup = v2->_lookup;
  v2->_lookup = (NSMutableDictionary *)v7;

  v9 = (void *)objc_opt_new();
  v10 = v2->_lookup;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "languageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v12);

  objc_msgSend((id)objc_opt_class(), "_bundleForStrings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleURL");
  v14 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v15 = CFBundleCreate(0, v14);

  v16 = (void *)CFBundleCopyLocalizedStringTableForLocalization();
  CFRelease(v15);
  -[SCROBrailleSubstitutionManager _loadLanguageSubstitutions:intoDictionary:](v2, "_loadLanguageSubstitutions:intoDictionary:", v16, v9);

  return v2;
}

- (void)_loadLanguageSubstitutions:(id)a3 intoDictionary:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasSuffix:", CFSTR("_FULL")))
        {
          objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_FULL"), CFSTR("_SHORT"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "lowercaseString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, v15);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

+ (id)_bundleForStrings
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SCROBrailleSubstitutionManager__bundleForStrings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundleForStrings_onceToken != -1)
    dispatch_once(&_bundleForStrings_onceToken, block);
  return (id)_bundleForStrings_Bundle;
}

void __51__SCROBrailleSubstitutionManager__bundleForStrings__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (+[SCROConnection inUnitTests](SCROConnection, "inUnitTests"))
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/ScreenReaderOutput.framework"));
  else
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_bundleForStrings_Bundle;
  _bundleForStrings_Bundle = v0;

}

- (id)brailleSubstitutionForType:(int64_t)a3 withLanguage:(id)a4
{
  void *v5;
  const __CFAllocator *v6;
  void *v7;
  const __CFURL *v8;
  CFBundleRef v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1 || a3 == 2)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    objc_msgSend((id)objc_opt_class(), "_bundleForStrings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleURL");
    v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v9 = CFBundleCreate(v6, v8);

    objc_msgSend(v5, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)CFBundleCopyLocalizedStringForLocalization();

    if (v9)
      CFRelease(v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_ensureLanguageDataPresent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFURL *v7;
  CFBundleRef v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lookup, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_bundleForStrings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleURL");
    v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v8 = CFBundleCreate(0, v7);

    objc_msgSend(v5, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)CFBundleCopyLocalizedStringTableForLocalization();

    CFRelease(v8);
    v11 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lookup, "setObject:forKeyedSubscript:", v11, v12);
    -[SCROBrailleSubstitutionManager _loadLanguageSubstitutions:intoDictionary:](self, "_loadLanguageSubstitutions:intoDictionary:", v10, v11);

  }
}

- (id)stringWithBrailleSubstitutions:(id)a3 withLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSLinguisticTagger *linguisticTagger;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  os_unfair_lock_t lock;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v42 = v6;
  if (objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    if (v7)
    {
      -[SCROBrailleSubstitutionManager _ensureLanguageDataPresent:](self, "_ensureLanguageDataPresent:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "languageCode");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v39 = v7;
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1728];
    objc_msgSend(v41, "languageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "defaultOrthographyForLanguage:", v12);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    lock = &self->_taggerLock;
    os_unfair_lock_lock(&self->_taggerLock);
    -[NSLinguisticTagger setString:](self->_linguisticTagger, "setString:", v8);
    -[NSLinguisticTagger setOrthography:range:](self->_linguisticTagger, "setOrthography:range:", v40, 0, objc_msgSend(v8, "length"));
    -[NSMutableDictionary objectForKeyedSubscript:](self->_lookup, "objectForKeyedSubscript:", v39);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    linguisticTagger = self->_linguisticTagger;
    v16 = objc_msgSend(v8, "length");
    v17 = *MEMORY[0x24BDD0F88];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __78__SCROBrailleSubstitutionManager_stringWithBrailleSubstitutions_withLanguage___block_invoke;
    v45[3] = &unk_24CC1DA10;
    v18 = v8;
    v46 = v18;
    v19 = v14;
    v47 = v19;
    -[NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:](linguisticTagger, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v16, v17, 0, v45);
    if (objc_msgSend(v19, "count"))
    {
      v20 = 0;
      v43 = 0;
      v44 = 0;
      v21 = 0;
      do
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", v20, lock);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "rangeValue");

        v24 = 3;
        while (1)
        {
          if (objc_msgSend(v19, "count") > (unint64_t)(v21 + v24))
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "rangeValue");
            v28 = v27;

            v29 = v28 - v23 + v26;
            objc_msgSend(v18, "substringWithRange:", v23, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "lowercaseString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
              break;
          }
          if (--v24 == -1)
            goto LABEL_16;
        }
        v33 = v43;
        if (!v43)
          v33 = (void *)objc_msgSend(v18, "mutableCopy");
        v43 = v33;
        objc_msgSend(v33, "replaceCharactersInRange:withString:", v23 + v44, v29, v32);
        v34 = objc_msgSend(v32, "length");

        v21 += v24;
        v44 = v44 - v29 + v34;
LABEL_16:
        v35 = objc_msgSend(v19, "count");
        v20 = ++v21;
      }
      while (v35 > v21);
      os_unfair_lock_unlock(lock);
      if (v43)
      {
        v36 = v43;
        v9 = v36;
LABEL_21:

        v7 = v39;
        goto LABEL_22;
      }
    }
    else
    {
      os_unfair_lock_unlock(lock);
    }
    v9 = v18;
    v36 = 0;
    goto LABEL_21;
  }
  v9 = v6;
LABEL_22:

  return v9;
}

void __78__SCROBrailleSubstitutionManager_stringWithBrailleSubstitutions_withLanguage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;

  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x24BDD0FA8]))
  {
    if (a3 + a4 <= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", a3, a4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linguisticTagger, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
}

@end
