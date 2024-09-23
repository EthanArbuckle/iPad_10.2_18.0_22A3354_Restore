@implementation CACVocabularyImportExportUtilities

+ (unint64_t)maximumNumberOfAllowedEntries
{
  return 1000;
}

+ (id)defaultExportURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDBCF48];
  v3 = (void *)MEMORY[0x24BDD17C8];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("VocabularyImportExport.defaultExportedFileName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("~/%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByExpandingTildeInPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", kCACVocabularyFileExtensionVCVocabulary);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_localeIdentifiersRepresentedByVocabularyEntries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectForKey:", CFSTR("LocaleIdentifier"), (_QWORD)v15);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (const __CFString *)v10;
        else
          v12 = CFSTR("en_US");
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_vocabularyEntriesFromSimpleTextListString:(id)a3 usingLocaleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = v6;
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\r"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\r\n"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v29 = v7;
    v27 = v9;
    v28 = v8;
    if (v10 >= objc_msgSend(v7, "count"))
    {
      v11 = objc_msgSend(v9, "count", v9, v8, v7);
      v12 = objc_msgSend(v8, "count");
      v13 = v9;
      if (v11 >= v12)
        goto LABEL_6;
    }
    v14 = objc_msgSend(v7, "count", v27);
    v15 = objc_msgSend(v8, "count");
    v13 = v7;
    if (v14 > v15 || (v16 = (id)objc_msgSend(v8, "count"), v13 = v8, v16))
LABEL_6:
      v16 = v13;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v22, "length"))
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKey:", v22, CFSTR("Text"));
            objc_msgSend(v23, "setObject:forKey:", v30, CFSTR("LocaleIdentifier"));
            v24 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
            objc_msgSend(v24, "numberWithDouble:");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKey:", v25, CFSTR("CreationDate"));

            objc_msgSend(v31, "addObject:", v23);
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v19);
    }

  }
  return v31;
}

+ (unint64_t)_importVocabularyEntries:(id)a3 didFindOverflow:(BOOL *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t j;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  char v41;
  _BYTE *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  uint64_t v48;
  void *v49;
  BOOL *v51;
  void *v52;
  id obj;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v51 = a4;
  v90 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v52 = v4;
  +[CACVocabularyImportExportUtilities _localeIdentifiersRepresentedByVocabularyEntries:](CACVocabularyImportExportUtilities, "_localeIdentifiersRepresentedByVocabularyEntries:", v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v60 = v5;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
  if (v57)
  {
    v55 = *(id *)v82;
    do
    {
      v6 = 0;
      do
      {
        if (*(id *)v82 != v55)
          objc_enumerationMutation(obj);
        v61 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array", v51);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setObject:forKey:", v8, v7);
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v9, v7);
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        objc_msgSend(v59, "vocabularyEntriesForLocaleIdentifier:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v78 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
              objc_msgSend(v15, "objectForKey:", CFSTR("Text"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "lowercaseString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v17);

              objc_msgSend(v8, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
          }
          while (v12);
        }

        v5 = v60;
        v6 = v61 + 1;
      }
      while (v61 + 1 != v57);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
    }
    while (v57);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v56 = v52;
  v62 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
  if (v62)
  {
    v58 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v62; ++j)
      {
        if (*(_QWORD *)v74 != v58)
          objc_enumerationMutation(v56);
        v19 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v19);
        objc_msgSend(v19, "objectForKey:", CFSTR("LocaleIdentifier"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v21 = CFSTR("en_US");
          objc_msgSend(v20, "setObject:forKey:", CFSTR("en_US"), CFSTR("LocaleIdentifier"));
        }
        objc_msgSend(v5, "objectForKey:", v21, v51);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", CFSTR("Text"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lowercaseString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          if (!v24 || (objc_msgSend(v22, "containsObject:", v24) & 1) != 0)
            goto LABEL_30;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v22, v21);
        }
        objc_msgSend(v64, "objectForKey:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setObject:forKey:", v25, v21);
        }
        objc_msgSend(v22, "addObject:", v24);
        objc_msgSend(v25, "addObject:", v20);
        v26 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v54, "objectForKey:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "integerValue") + 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKey:", v28, v21);

        v5 = v60;
LABEL_30:

      }
      v62 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    }
    while (v62);
  }

  v63 = +[CACVocabularyImportExportUtilities maximumNumberOfAllowedEntries](CACVocabularyImportExportUtilities, "maximumNumberOfAllowedEntries");
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(v54, "allKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
  if (v30)
  {
    v31 = v30;
    v32 = 0;
    v33 = *(_QWORD *)v70;
    while (2)
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v70 != v33)
          objc_enumerationMutation(v29);
        v35 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * k);
        objc_msgSend(v64, "objectForKey:", v35, v51);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count");

        objc_msgSend(v54, "objectForKey:", v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "integerValue") + v37;

        if (v39 > v63)
        {
          if (v63 >= v37)
            v32 = v63 - v37;
          else
            v32 = 0;
          v41 = 1;
          v42 = v51;
          v43 = v54;
          goto LABEL_55;
        }
        objc_msgSend(v54, "objectForKey:", v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v32 += objc_msgSend(v40, "integerValue");

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
      if (v31)
        continue;
      break;
    }
  }
  else
  {
    v32 = 0;
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v64, "allKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v66;
    v42 = v51;
    v43 = v54;
    do
    {
      for (m = 0; m != v45; ++m)
      {
        if (*(_QWORD *)v66 != v46)
          objc_enumerationMutation(v29);
        v48 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * m);
        objc_msgSend(v64, "objectForKey:", v48, v51);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setVocabularyEntries:forLocaleIdentifier:", v49, v48);

      }
      v45 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
    }
    while (v45);
    v41 = 0;
  }
  else
  {
    v41 = 0;
    v42 = v51;
    v43 = v54;
  }
LABEL_55:

  if (v42)
    *v42 = v41;

  return v32;
}

+ (id)importFromURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  CACImportExportResult *v11;
  void *v12;
  CACImportExportResult *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int v19;
  CACImportExportResult *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  CACImportExportResult *v29;
  void *v30;
  CACImportExportResult *v31;
  void *v32;
  id v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithFilenameExtension:", kCACVocabularyFileExtensionVCVocabulary);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v5 = *MEMORY[0x24BDBCBE8];
    v38 = 0;
    v6 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v39, v5, &v38);
    v7 = v39;
    v8 = v38;
    if (v6)
    {
      if (objc_msgSend(v7, "conformsToType:", *MEMORY[0x24BDF8510]))
      {
        v37 = v8;
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithContentsOfURL:encoding:error:", v3, 4, &v37);
        v10 = v37;

        if (v10)
        {
          v11 = -[CACImportExportResult initWithError:title:message:]([CACImportExportResult alloc], "initWithError:title:message:", v10, 0, 0);
          v12 = 0;
          goto LABEL_10;
        }
        if (v9)
        {
          v33 = v7;
          v34 = v4;
          +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bestLocaleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[CACVocabularyImportExportUtilities _vocabularyEntriesFromSimpleTextListString:usingLocaleIdentifier:](CACVocabularyImportExportUtilities, "_vocabularyEntriesFromSimpleTextListString:usingLocaleIdentifier:", v9, v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = 0;
LABEL_20:
          v8 = 0;
LABEL_21:
          v35 = 0;
          v18 = +[CACVocabularyImportExportUtilities _importVocabularyEntries:didFindOverflow:](CACVocabularyImportExportUtilities, "_importVocabularyEntries:didFindOverflow:", v15, &v35);
          v19 = v35;
          v20 = [CACImportExportResult alloc];
          if (v19)
          {
            +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("VocabularyImportExport.importOverflowFailAlertTitle"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[CACImportExportResult initWithError:title:message:](v20, "initWithError:title:message:", 0, v21, 0);

            if (v18)
            {
              v22 = (void *)MEMORY[0x24BDD17C8];
              v23 = CFSTR("VocabularyImportExport.importOverflowFailAlertDescription");
LABEL_26:
              +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%ld"), 0, v18);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[CACImportExportResult setMessage:](v11, "setMessage:", v26);

LABEL_30:
              v7 = v33;
              v4 = v34;

              goto LABEL_31;
            }
            v27 = CFSTR("VocabularyImportExport.importOverflowFailNoNewAlertDescription");
          }
          else
          {
            +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("VocabularyImportExport.importCompleteAlertTitle"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[CACImportExportResult initWithError:title:message:](v20, "initWithError:title:message:", 0, v24, 0);

            if (v18)
            {
              v22 = (void *)MEMORY[0x24BDD17C8];
              v23 = CFSTR("VocabularyImportExport.importCompleteAlertDescription");
              goto LABEL_26;
            }
            v27 = CFSTR("VocabularyImportExport.importCompleteAlertDescriptionNoEntries");
          }
          +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", v27);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CACImportExportResult setMessage:](v11, "setMessage:", v25);
          goto LABEL_30;
        }
        v29 = [CACImportExportResult alloc];
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("VocabularyImportExport.cannotReadFile"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[CACImportExportResult initWithError:title:message:](v29, "initWithError:title:message:", 0, v30, 0);

        v8 = 0;
        goto LABEL_13;
      }
      if (objc_msgSend(v7, "conformsToType:", v4))
      {
        v36 = v8;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:error:", v3, &v36);
        v10 = v36;

        if (v10)
        {
          v11 = -[CACImportExportResult initWithError:title:message:]([CACImportExportResult alloc], "initWithError:title:message:", v10, 0, 0);
          v9 = 0;
LABEL_10:
          v8 = v10;
          if (!v11)
            goto LABEL_15;
          goto LABEL_31;
        }
        if (v12)
        {
          v33 = v7;
          v34 = v4;
          objc_msgSend(v12, "objectForKey:", CFSTR("CACVocabularyEntries"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 0;
          goto LABEL_20;
        }
        v31 = [CACImportExportResult alloc];
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("VocabularyImportExport.cannotReadFile"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[CACImportExportResult initWithError:title:message:](v31, "initWithError:title:message:", 0, v32, 0);

        v8 = 0;
LABEL_14:
        v9 = 0;
        if (!v11)
        {
LABEL_15:
          v33 = v7;
          v34 = v4;
          v15 = 0;
          goto LABEL_21;
        }
LABEL_31:

        goto LABEL_32;
      }
    }
    v13 = [CACImportExportResult alloc];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("VocabularyImportExport.cannotReadFile"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CACImportExportResult initWithError:title:message:](v13, "initWithError:title:message:", 0, v14, 0);

LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  v11 = 0;
LABEL_32:

  return v11;
}

+ (id)exportToURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  CACImportExportResult *v15;
  CACImportExportResult *v16;
  void *v17;
  CACImportExportResult *v18;
  void *v19;
  id v21;

  v3 = a3;
  if (v3)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestLocaleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vocabularyEntriesForLocaleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      objc_msgSend(v9, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("ExportDate"));

      v11 = objc_alloc(MEMORY[0x24BDBCE70]);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithContentsOfURL:error:", v12, 0);

      if (v13)
        objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("SystemVersion"));
      objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("CACVocabularyEntries"));
      v21 = 0;
      objc_msgSend(v8, "writeToURL:error:", v3, &v21);
      v14 = v21;
      if (v14)
        v15 = -[CACImportExportResult initWithError:title:message:]([CACImportExportResult alloc], "initWithError:title:message:", v14, 0, 0);
      else
        v15 = 0;

    }
    else
    {
      v18 = [CACImportExportResult alloc];
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("VocabularyImportExport.exportNoEntriesAlertTitle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CACImportExportResult initWithError:title:message:](v18, "initWithError:title:message:", 0, v19, 0);

    }
  }
  else
  {
    v16 = [CACImportExportResult alloc];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("VocabularyImportExport.failedToCreateURL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CACImportExportResult initWithError:title:message:](v16, "initWithError:title:message:", 0, v17, 0);

  }
  return v15;
}

@end
