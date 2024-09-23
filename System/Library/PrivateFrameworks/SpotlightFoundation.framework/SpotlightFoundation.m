void sub_1AF7DFE40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id logForSPLogCategoryDefault()
{
  if (logForSPLogCategoryDefault_onceDefaultToken != -1)
    dispatch_once(&logForSPLogCategoryDefault_onceDefaultToken, &__block_literal_global);
  return (id)logForSPLogCategoryDefault_sDefaultLog;
}

void __logForSPLogCategoryDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight", "default");
  v1 = (void *)logForSPLogCategoryDefault_sDefaultLog;
  logForSPLogCategoryDefault_sDefaultLog = (uint64_t)v0;

}

id logForSPLogCategoryCaching()
{
  if (logForSPLogCategoryCaching_onceCachingToken != -1)
    dispatch_once(&logForSPLogCategoryCaching_onceCachingToken, &__block_literal_global_3);
  return (id)logForSPLogCategoryCaching_sCachingLog;
}

void __logForSPLogCategoryCaching_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight", "caching");
  v1 = (void *)logForSPLogCategoryCaching_sCachingLog;
  logForSPLogCategoryCaching_sCachingLog = (uint64_t)v0;

}

id logForSPLogCategoryRecents()
{
  if (logForSPLogCategoryRecents_onceRecentToken != -1)
    dispatch_once(&logForSPLogCategoryRecents_onceRecentToken, &__block_literal_global_5);
  return (id)logForSPLogCategoryRecents_sRecentsLog;
}

void __logForSPLogCategoryRecents_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight", "recents");
  v1 = (void *)logForSPLogCategoryRecents_sRecentsLog;
  logForSPLogCategoryRecents_sRecentsLog = (uint64_t)v0;

}

uint64_t resultIsSuggestionType(unsigned int a1)
{
  return (a1 < 0x27) & (0x7FF0038000uLL >> a1);
}

uint64_t resultIsLocalType(unsigned int a1)
{
  return (a1 < 0x27) & (0x7F8001000CuLL >> a1);
}

__CFString *truncatedTitle(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((unint64_t)objc_msgSend(v1, "length") > 0x7F)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x2020000000;
      v11 = 0;
      v4 = objc_msgSend(v2, "length");
      v5 = *MEMORY[0x1E0CB2D28];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __truncatedTitle_block_invoke;
      v7[3] = &unk_1E6004778;
      v7[4] = &v8;
      objc_msgSend(v2, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v4, v5, 6, 0, v7);
      objc_msgSend(v2, "substringWithRange:", 0, v9[3]);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      _Block_object_dispose(&v8, 8);
    }
    else
    {
      v3 = v2;
    }
  }
  else
  {
    v3 = &stru_1E6004970;
  }

  return v3;
}

void sub_1AF7E03D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __truncatedTitle_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if ((unint64_t)(a3 + a4) < 0x80)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3 + a4;
  else
    *a7 = 1;
  return result;
}

__CFString *truncatedSearchString(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((unint64_t)objc_msgSend(v1, "length") > 0x3F)
    {
      objc_msgSend(v2, "substringToIndex:", 64);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = v2;
    }
    v4 = v3;
  }
  else
  {
    v4 = &stru_1E6004970;
  }

  return v4;
}

id topicIdentifierWithIdentifierAndDetail(void *a1, void *a2, void *a3, void *a4, uint64_t a5, unsigned int a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v10 = a1;
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0CB2AB0]) & 1) != 0)
  {
    v15 = CFSTR("1");
  }
  else if ((objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0CB2AB8]) & 1) != 0)
  {
    v15 = CFSTR("2");
  }
  else if ((objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0CB2AC0]) & 1) != 0)
  {
    v15 = CFSTR("3");
  }
  else if ((objc_msgSend(v12, "isEqual:", CFSTR("Priority")) & 1) != 0)
  {
    v15 = CFSTR("4");
  }
  else if (objc_msgSend(v12, "isEqual:", CFSTR("Default")))
  {
    v15 = CFSTR("5");
  }
  else
  {
    v15 = CFSTR("0");
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("id%@%@"), CFSTR(":=:"), v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);

  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bId%@%@"), CFSTR(":=:"), v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v17);

  }
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pC%@%@"), CFSTR(":=:"), v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dt%@%@"), CFSTR(":=:"), v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v19);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tp%@%d"), CFSTR(":=:"), a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v20);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isR%@%d"), CFSTR(":=:"), a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v21);

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(";=;"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id topicIdentifierWithPersonQueryIdentifierAndDetail(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0x1E0CB3000;
  if (v7)
  {
    v29 = a4;
    v30 = a3;
    v31 = v8;
    v28 = v7;
    attributesWithEntityIdentifier(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%@%@"), v16, CFSTR("="), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v19);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v13);
    }
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\t"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeAllObjects");
    v10 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pQId%@%@"), CFSTR(":=:"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v22);

    a3 = v30;
    v8 = v31;
    a4 = v29;
  }
  if (v8)
  {
    objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("dt%@%@"), CFSTR(":=:"), v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v23);

  }
  objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("isR%@%d"), CFSTR(":=:"), a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v24);

  objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("tp%@%d"), CFSTR(":=:"), a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v25);

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(";=;"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

id attributesWithEntityIdentifier(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("\t"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "length"))
        {
          objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("="));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", v11, v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

id topicIdentifierWithContactIdentifierAndDetail(void *a1, void *a2, void *a3, uint64_t a4, unsigned int a5)
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a1;
  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a3;
  v12 = a2;
  v13 = objc_alloc_init(v10);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("contactIdentifier%@%@"), CFSTR("="), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", v14);
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayName%@%@"), CFSTR("="), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name%@%@"), CFSTR("="), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);

  }
  objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\t"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  topicIdentifierWithPersonQueryIdentifierAndDetail(v18, v11, a4, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id topicIdentifierWithContactInfoAndDetail(void *a1, void *a2, void *a3, void *a4, unsigned int a5, unsigned int a6)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v37 = a4;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("personIdentifier%@%@"), CFSTR("="), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v16);

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayName%@%@"), CFSTR("="), v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v17);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name%@%@"), CFSTR("="), v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);

  }
  v40 = v11;
  v41 = v10;
  if (objc_msgSend(v10, "count"))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v47 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          if (objc_msgSend(v24, "length"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("email%@%@"), CFSTR("="), v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v25);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v21);
    }

    v11 = v40;
    v10 = v41;
  }
  if (objc_msgSend(v11, "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v26 = v11;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v43 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          if (objc_msgSend(v31, "length"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("phone%@%@"), CFSTR("="), v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v32);

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v28);
    }

    v11 = v40;
    v10 = v41;
  }
  objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compare_);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\t"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  topicIdentifierWithPersonQueryIdentifierAndDetail(v34, v37, a5, a6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

id topicIdentifierWithTitleAndType(void *a1, uint64_t a2, unsigned int a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a1;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ti%@%@"), CFSTR(":=:"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tp%@%d"), CFSTR(":=:"), a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isR%@%d"), CFSTR(":=:"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(";=;"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id attributesForTopicIdentifier(void *a1, _BYTE *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  attributesWithTopicIdentifier(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isR"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isR"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

    }
    else
    {
      v9 = 0;
    }

    *a2 = v9;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pQId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  attributesWithEntityIdentifier(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }
  objc_msgSend(v4, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id attributesWithTopicIdentifier(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(";=;"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "length"))
        {
          objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(":=:"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", v11, v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t topicIsCoreSuggestion(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  attributesWithTopicIdentifier(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.CoreSuggestions"));
  else
    v5 = 0;

  return v5;
}

id searchResultWithTopicIdentifier(void *a1, double a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  objc_class *v37;
  id v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  attributesWithTopicIdentifier(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = v4;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tp"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tp"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "intValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dt"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if ((int)v9 <= 31)
      {
        if ((v9 - 2) < 3 || (_DWORD)v9 == 20)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bId"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pC"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqualToString:", CFSTR("1")) & 1) != 0)
          {
            v14 = (id *)MEMORY[0x1E0CB2AB0];
          }
          else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("2")) & 1) != 0)
          {
            v14 = (id *)MEMORY[0x1E0CB2AB8];
          }
          else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("3")) & 1) != 0)
          {
            v14 = (id *)MEMORY[0x1E0CB2AC0];
          }
          else
          {
            if ((objc_msgSend(v13, "isEqualToString:", CFSTR("4")) & 1) != 0)
            {
              v36 = CFSTR("Priority");
              goto LABEL_41;
            }
            if ((objc_msgSend(v13, "isEqualToString:", CFSTR("5")) & 1) != 0)
            {
              v36 = CFSTR("Default");
              goto LABEL_41;
            }
            v14 = (id *)MEMORY[0x1E0CB2AE0];
          }
          v36 = (__CFString *)*v14;
LABEL_41:

          v18 = 0;
          if (v11 && v12 && v36)
          {
            v37 = (objc_class *)MEMORY[0x1E0D8C6A8];
            v44 = v11;
            v38 = v12;
            v39 = v11;
            v40 = v36;
            v46 = v10;
            v18 = objc_alloc_init(v37);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v40, v38);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = v39;
            objc_msgSend(v18, "setResultBundleId:", v41);

            objc_msgSend(v18, "setSectionBundleIdentifier:", CFSTR("com.apple.searchd.recent.results"));
            objc_msgSend(v18, "setIdentifier:", v44);

            objc_msgSend(v18, "setType:", v9);
            objc_msgSend(v18, "setRankingScore:", a2);
            objc_msgSend(v18, "setSecondaryTitle:", v46);

          }
          goto LABEL_46;
        }
        goto LABEL_11;
      }
      if ((v9 - 37) < 2)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pQId"));
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v18 = objc_alloc_init(MEMORY[0x1E0D8C6A8]);
          valueForKeyWithEntityQueryIdentifier(CFSTR("displayName"), v20);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v32)
          {
            valueForKeyWithEntityQueryIdentifier(CFSTR("name"), v20);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
          }
          valueForKeyWithEntityQueryIdentifier(CFSTR("personIdentifier"), v20);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D8C7A8], "textWithString:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setTitle:", v34);
          objc_msgSend(v18, "setCompletion:", v32);
          objc_msgSend(v18, "setIdentifier:", v33);
          objc_msgSend(v18, "setContactIdentifier:", v20);
          objc_msgSend(v18, "setResultBundleId:", CFSTR("com.apple.searchd.suggestion"));
          objc_msgSend(v18, "setSectionBundleIdentifier:", CFSTR("com.apple.searchd.recent.suggestions"));
          objc_msgSend(v18, "setRankingScore:", a2);
          objc_msgSend(v18, "setType:", 38);

          goto LABEL_27;
        }
LABEL_30:
        v18 = 0;
        goto LABEL_31;
      }
      if ((_DWORD)v9 == 32)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pQId"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v35;
        if (v35)
        {
          suggestionResultWithContactEntityIdentifier(v35, a2);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      if ((_DWORD)v9 == 36)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bId"));
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.CoreSuggestions")) & 1) == 0)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pQId"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31)
          {
            suggestionResultWithContactEntityIdentifier(v31, a2);
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = 0;
          }
LABEL_27:

LABEL_31:
LABEL_46:
          v15 = v18;

          goto LABEL_47;
        }
        goto LABEL_30;
      }
    }
    else
    {

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dt"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v9 = 0;
    }
LABEL_11:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ti"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    v18 = objc_alloc_init(MEMORY[0x1E0D8C6A8]);
    objc_msgSend(MEMORY[0x1E0D8C7A8], "textWithString:", v16);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:");
    objc_msgSend(v18, "setCompletion:", v16);
    objc_msgSend(v18, "setResultBundleId:", CFSTR("com.apple.searchd.suggestion"));
    objc_msgSend(v18, "setSectionBundleIdentifier:", CFSTR("com.apple.searchd.recent.suggestions"));
    objc_msgSend(v18, "setRankingScore:", a2);
    objc_msgSend(v18, "setType:", v9);
    objc_msgSend(v18, "resultBundleId");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v16;
    v10 = v17;
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setSymbolName:", CFSTR("magnifyingglass"));
    objc_msgSend(v21, "setIsTemplate:", 1);
    v22 = (void *)objc_opt_new();
    v43 = (void *)v19;
    objc_msgSend(v22, "setBundleIdentifier:", v19);
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setThumbnail:", v21);
    objc_msgSend(v23, "setShouldUseCompactDisplay:", 1);
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitle:", v24);

    objc_msgSend(v23, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMaxLines:", 1);

    if (v10 && objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDescriptions:", v27);

    }
    v28 = (void *)objc_opt_new();
    objc_msgSend(v28, "setSearchString:", v20);
    objc_msgSend(v28, "setQuerySource:", 1);
    objc_msgSend(v23, "setCommand:", v28);
    v29 = (void *)objc_opt_new();
    v47 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCardSections:", v30);

    objc_msgSend(v18, "setInlineCard:", v29);
    goto LABEL_31;
  }
  v15 = 0;
LABEL_47:

  return v15;
}

id suggestionResultWithContactEntityIdentifier(void *a1, double a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0D8C6A8];
  v4 = a1;
  v5 = objc_alloc_init(v3);
  valueForKeyWithEntityQueryIdentifier(CFSTR("displayName"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  valueForKeyWithEntityQueryIdentifier(CFSTR("contactIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8C7A8], "textWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v8);
  objc_msgSend(v5, "setCompletion:", v6);
  objc_msgSend(v5, "setIdentifier:", v7);
  objc_msgSend(v5, "setContactIdentifier:", v7);
  objc_msgSend(v5, "setResultBundleId:", CFSTR("com.apple.searchd.suggestion"));
  objc_msgSend(v5, "setSectionBundleIdentifier:", CFSTR("com.apple.searchd.recent.suggestions"));
  objc_msgSend(v5, "setRankingScore:", a2);
  objc_msgSend(v5, "setType:", 32);

  return v5;
}

id valueForKeyWithEntityQueryIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  attributesWithEntityIdentifier(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1AF7E4794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a70;

  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

uint64_t OUTLINED_FUNCTION_8(void *a1, const char *a2)
{
  return objc_msgSend(a1, "type");
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

