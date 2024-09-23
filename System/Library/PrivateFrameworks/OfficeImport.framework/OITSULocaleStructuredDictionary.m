@implementation OITSULocaleStructuredDictionary

+ (OITSULocaleStructuredDictionary)dictionaryWithContentsOfFileForLocale:(id)a3 inDirectory:(id)a4 inBundle:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = *MEMORY[0x24BDBCB20];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v8, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForResource:ofType:inDirectory:", v13, CFSTR("plist"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc((Class)a1);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithDictionary:locale:", v16, v8);

  }
  else
  {
    v17 = 0;
  }

  return (OITSULocaleStructuredDictionary *)v17;
}

- (OITSULocaleStructuredDictionary)initWithDictionary:(id)a3 locale:(id)a4
{
  id v7;
  id v8;
  OITSULocaleStructuredDictionary *v9;
  OITSULocaleStructuredDictionary *v10;
  uint64_t v11;
  NSMutableDictionary *cldrLanguageScriptRegionForKey;
  uint64_t v13;
  NSMutableDictionary *cldrLanguageScriptForKey;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)OITSULocaleStructuredDictionary;
  v9 = -[OITSULocaleStructuredDictionary init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dictionary, a3);
    v11 = objc_opt_new();
    cldrLanguageScriptRegionForKey = v10->_cldrLanguageScriptRegionForKey;
    v10->_cldrLanguageScriptRegionForKey = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    cldrLanguageScriptForKey = v10->_cldrLanguageScriptForKey;
    v10->_cldrLanguageScriptForKey = (NSMutableDictionary *)v13;

    -[OITSULocaleStructuredDictionary p_remakeWorkingDictionaryWithLocale:](v10, "p_remakeWorkingDictionaryWithLocale:", v8);
  }

  return v10;
}

- (id)objectForKey:(id)a3 locale:(id)a4
{
  id v6;
  NSLocale *v7;
  OITSULocaleStructuredDictionary *v8;
  void *v9;
  unint64_t autoUpdatingCount;

  v6 = a3;
  v7 = (NSLocale *)a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_workingLocale != v7
    || v8->_workingLocaleIsAutoUpdating
    && (autoUpdatingCount = v8->_autoUpdatingCount,
        autoUpdatingCount != +[OITSULocale autoupdatingCurrentLocaleChangeCount](OITSULocale, "autoupdatingCurrentLocaleChangeCount")))
  {
    -[OITSULocaleStructuredDictionary p_remakeWorkingDictionaryWithLocale:](v8, "p_remakeWorkingDictionaryWithLocale:", v7);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_workingDictionary, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  return v9;
}

- (void)p_remakeWorkingDictionaryWithLocale:(id)a3
{
  OITSULocaleStructuredDictionary *v5;
  _BOOL4 v6;
  unint64_t v7;
  void *v8;
  id v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  BOOL v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSMutableDictionary *workingDictionary;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  void *v36;
  NSMutableDictionary *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  NSDictionary *obj;
  void *v48;
  OITSULocaleStructuredDictionary *v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v49 = v5;
  objc_storeStrong((id *)&v5->_workingLocale, a3);
  v6 = +[OITSULocale localeIsAutoUpdating:](OITSULocale, "localeIsAutoUpdating:", v42);
  v5->_workingLocaleIsAutoUpdating = v6;
  if (v6)
    v7 = +[OITSULocale autoupdatingCurrentLocaleChangeCount](OITSULocale, "autoupdatingCurrentLocaleChangeCount");
  else
    v7 = 0;
  v5->_autoUpdatingCount = v7;
  objc_msgSend(v42, "localeIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_cldrLanguageScriptRegionForKey, "objectForKeyedSubscript:", v41);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_cldrLanguageScriptForKey, "objectForKeyedSubscript:", v41);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v48 || !v46)
  {
    +[OITSULocale canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:](OITSULocale, "canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:", v41);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
      v39 = v8;
      v9 = v8;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v10 = v5->_dictionary;
      v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v58;
        v48 = v9;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v58 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            if (objc_msgSend(v14, "rangeOfString:options:", CFSTR("POSIX"), 1) == 0x7FFFFFFFFFFFFFFFLL)
            {
              +[OITSULocale canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:](OITSULocale, "canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "isEqualToString:", v9))
              {
                v16 = v14;

                v48 = v16;
              }

            }
          }
          v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
        }
        while (v11);
      }
      else
      {
        v48 = v9;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](v49->_cldrLanguageScriptRegionForKey, "setObject:forKeyedSubscript:", v48, v41);
      v8 = v39;
    }
    if (!v46)
    {
      v40 = v8;
      v43 = v8;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      obj = v49->_dictionary;
      v17 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v54;
        v46 = v43;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v54 != v18)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            if (objc_msgSend(v20, "rangeOfString:options:", CFSTR("POSIX"), 1) == 0x7FFFFFFFFFFFFFFFLL)
            {
              v51 = 0;
              v52 = 0;
              v50 = 0;
              v21 = -[OITSULocaleStructuredDictionary p_extractLanguage:script:region:fromString:](v49, "p_extractLanguage:script:region:fromString:", &v52, &v51, &v50, v20);
              v22 = v52;
              v23 = v51;
              v24 = v50;
              v25 = v24;
              if (v21 && v22 && v23 && !v24)
              {
                -[OITSULocaleStructuredDictionary p_makeLocaleIdentifierWithLanguage:script:region:](v49, "p_makeLocaleIdentifierWithLanguage:script:region:", v45, v23, v44);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v26, "isEqualToString:", v43))
                {
                  v27 = v20;

                  v46 = v27;
                }

              }
            }
          }
          v17 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        }
        while (v17);
      }
      else
      {
        v46 = v43;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](v49->_cldrLanguageScriptForKey, "setObject:forKeyedSubscript:", v46, v41);
      v8 = v40;
    }

  }
  v28 = objc_opt_new();
  workingDictionary = v49->_workingDictionary;
  v49->_workingDictionary = (NSMutableDictionary *)v28;

  -[NSDictionary objectForKeyedSubscript:](v49->_dictionary, "objectForKeyedSubscript:", v45);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = v49->_workingDictionary;
    -[NSDictionary objectForKeyedSubscript:](v49->_dictionary, "objectForKeyedSubscript:", v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](v31, "addEntriesFromDictionary:", v32);

  }
  -[NSDictionary objectForKeyedSubscript:](v49->_dictionary, "objectForKeyedSubscript:", v46);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = v49->_workingDictionary;
    -[NSDictionary objectForKeyedSubscript:](v49->_dictionary, "objectForKeyedSubscript:", v46);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](v34, "addEntriesFromDictionary:", v35);

  }
  -[NSDictionary objectForKeyedSubscript:](v49->_dictionary, "objectForKeyedSubscript:", v48);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = v49->_workingDictionary;
    -[NSDictionary objectForKeyedSubscript:](v49->_dictionary, "objectForKeyedSubscript:", v48);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](v37, "addEntriesFromDictionary:", v38);

  }
  objc_sync_exit(v49);

}

- (BOOL)p_extractLanguage:(id *)a3 script:(id *)a4 region:(id *)a5 fromString:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id *v27;
  id *v28;
  id *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v37;

  v9 = a6;
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("-"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length") == 2)
  {

    goto LABEL_4;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13 == 3)
  {
LABEL_4:
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = 0;
    if ((unint64_t)objc_msgSend(v10, "count") <= 1)
      goto LABEL_12;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (v18 == 4)
      goto LABEL_6;
    if (objc_msgSend(v19, "length") == 2)
    {

    }
    else
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      if (v24 != 3)
      {
        v15 = 0;
LABEL_6:
        v16 = 0;
        goto LABEL_12;
      }
    }
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
LABEL_12:
    if ((unint64_t)objc_msgSend(v10, "count") >= 3)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "length") == 2)
      {

LABEL_16:
        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v32 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v32;
        goto LABEL_17;
      }
      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v37 = v9;
      v26 = v14;
      v27 = a3;
      v28 = a4;
      v29 = a5;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "length");

      a5 = v29;
      a4 = v28;
      a3 = v27;
      v14 = v26;
      v9 = v37;

      if (v31 == 3)
        goto LABEL_16;
    }
LABEL_17:
    v33 = objc_retainAutorelease(v14);
    *a3 = v33;
    v34 = objc_retainAutorelease(v15);
    *a4 = v34;
    v35 = objc_retainAutorelease(v16);
    *a5 = v35;

    v22 = 1;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSULocaleStructuredDictionary p_extractLanguage:script:region:fromString:]");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSULocaleStructuredDictionary.m");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 244, 0, "Got an identifier (%@) whose first component isn't 2 or 3 char long, which violates BCP47. How did that go into our CLDR?", v9);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v22 = 0;
LABEL_18:

  return v22;
}

- (id)p_makeLocaleIdentifierWithLanguage:(id)a3 script:(id)a4 region:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDBCB20]);
  if (v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDBCB40]);
  if (v9)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDBCAE8]);
  v12 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "canonicalLocaleIdentifierFromString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)dateFormatterSymbolsFallbackDictionary
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDictionary:locale:", &unk_24F46AA50, v3);

  return v4;
}

+ (id)numberFormatterSymbolsFallbackDictionary
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDictionary:locale:", &unk_24F46AAA0, v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingLocale, 0);
  objc_storeStrong((id *)&self->_workingDictionary, 0);
  objc_storeStrong((id *)&self->_cldrLanguageScriptForKey, 0);
  objc_storeStrong((id *)&self->_cldrLanguageScriptRegionForKey, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
