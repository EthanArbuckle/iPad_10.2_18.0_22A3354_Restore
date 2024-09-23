@implementation SWCSubstitutionVariableList

void __68___SWCSubstitutionVariableList_cheapBuiltInSubstitutionVariableList__block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v2;
  id v3;
  void *v4;
  char *v5;
  int v6;
  char v7;
  size_t v8;
  _BYTE *v9;
  _BYTE *v10;
  id v11;
  id Instance;
  void *v13;
  uint64_t v14;
  id v15;
  void *context;
  id v18;

  context = (void *)MEMORY[0x1A85D4B3C]();
  v18 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  for (i = 0; i != 24; i += 4)
  {
    v2 = (void *)MEMORY[0x1A85D4B3C]();
    v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v4 = v3;
    v5 = (&off_1E547CDC0)[i + 2];
    v6 = *v5;
    if (*v5)
      v7 = 4;
    else
      v7 = 2;
    objc_msgSend(v3, "appendBytes:length:", (&off_1E547CDC0)[i], (&off_1E547CDC0)[i + 1]);
    objc_msgSend(v4, "appendBytes:length:", ", 1);
    if (v6)
    {
      objc_msgSend(v4, "appendBytes:length:", v5, (&off_1E547CDC0)[i + 3]);
      objc_msgSend(v4, "appendBytes:length:", ", 1);
    }
    objc_msgSend(v4, "appendBytes:length:", ", 1);
    v8 = objc_msgSend(v4, "length");
    v9 = malloc_type_malloc(v8 + 1, 0x7326AFD7uLL);
    v10 = v9;
    if (v9)
    {
      *v9 = v7;
      v11 = objc_retainAutorelease(v4);
      memcpy(v10 + 1, (const void *)objc_msgSend(v11, "bytes"), v8);

      objc_autoreleasePoolPop(v2);
      objc_msgSend(v18, "appendBytes:length:", v10, v8 + 1);
      free(v10);
    }
    else
    {

      objc_autoreleasePoolPop(v2);
    }
  }
  if (qword_1ED1B6158 != -1)
    dispatch_once(&qword_1ED1B6158, &__block_literal_global_202);
  objc_msgSend(v18, "appendBytes:length:", &byte_1ED1B6129, SWCSubstitutionVariable::getSize((SWCSubstitutionVariable *)&byte_1ED1B6129));
  Instance = class_createInstance(*(Class *)(a1 + 32), objc_msgSend(v18, "length"));
  v13 = (void *)qword_1ED1B6130;
  qword_1ED1B6130 = (uint64_t)Instance;

  v14 = qword_1ED1B6130;
  v15 = objc_retainAutorelease(v18);
  memcpy((void *)(v14 + 8), (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));

  objc_autoreleasePoolPop(context);
}

void __72___SWCSubstitutionVariableList_expensiveBuiltInSubstitutionVariableList__block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *context;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  const __CFString *v34;
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A85D4B3C]();
  v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v7, "uppercaseString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        objc_msgSend(v7, "lowercaseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v10, CFSTR("region"));

  v11 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "ISOLanguageCodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v16, "uppercaseString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        objc_msgSend(v16, "lowercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v18);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v13);
  }

  objc_msgSend(v11, "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v19, CFSTR("lang"));

  objc_autoreleasePoolPop(context);
  v20 = *(void **)(a1 + 32);
  v34 = CFSTR("substitutionVariables");
  v35 = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "substitutionVariableListWithDictionary:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)qword_1ED1B6140;
  qword_1ED1B6140 = v22;

}

void __71___SWCSubstitutionVariableList_substitutionVariableListWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  size_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  void *v22;
  size_t v23;
  _BYTE *v24;
  char v25;
  void *v26;
  void *context;
  id v30;
  char *v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _QWORD v50[2];
  char v51;
  _BYTE v52[128];
  char v53[1024];
  _QWORD v54[4];

  v54[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1A85D4B3C]();
  if (_NSIsNSString())
  {
    v54[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  if (_NSIsNSString() && _NSIsNSArray())
  {
    v26 = v3;
    v30 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    if (objc_msgSend(v3, "containsObject:", &stru_1E547D930))
      v5 = 2;
    else
      v5 = 0;
    if (objc_msgSend(v26, "count"))
    {
      v41 = 0u;
      v39 = 0u;
      v40 = 0u;
      v38 = 0u;
      v6 = v26;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      v25 = v5 | 4;
      if (v7)
      {
        v8 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v39 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            if (!_NSIsNSString()
              || objc_msgSend(v10, "length") != 1
              || objc_msgSend(v10, "characterAtIndex:", 0) > 0x7F)
            {
              v25 = v5;
              goto LABEL_22;
            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_22:

    }
    else
    {
      v25 = v5;
    }
    SWCGetFastUTF8String<1024ul>((uint64_t)v50, a2, v53);
    if (v51)
    {
      objc_msgSend(v30, "appendBytes:length:", v50[0], v50[1]);
      objc_msgSend(v30, "appendBytes:length:", ", 1);
    }
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = v26;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v35;
      v16 = v25 & 4;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v17);
          if (_NSIsNSString())
          {
            if (objc_msgSend(v18, "length"))
            {
              SWCGetFastUTF8String<1024ul>((uint64_t)&v31, v18, v53);
              if (v33)
              {
                v20 = v31;
                v19 = v32;
                if (std::string_view::find[abi:nn180100](v31, v32) == -1)
                {
                  objc_msgSend(v30, "appendBytes:length:", v20, v19);
                  if ((v25 & 4) == 0)
                    objc_msgSend(v30, "appendBytes:length:", ", 1);
                }
                else
                {
                  if (qword_1ED1B6168 != -1)
                    dispatch_once(&qword_1ED1B6168, &__block_literal_global_218);
                  v21 = (id)qword_1ED1B6160;
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    SWCGetNSStringFromStringViewNoCopy(&v31);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136446978;
                    v43 = "$(";
                    v44 = 2112;
                    v45 = a2;
                    v46 = 2082;
                    v47 = &SWCSubstitutionVariable::Suffix;
                    v48 = 2112;
                    v49 = v22;
                    _os_log_impl(&dword_1A855A000, v21, OS_LOG_TYPE_INFO, "Substitution variable %{public}s%@%{public}s referenced another substitution variable: \"%@\". Ignoring.", buf, 0x2Au);

                  }
                }
              }
            }
          }
          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
      }
      while (v14);
    }
    else
    {
      v16 = v25 & 4;
    }

    if (v16)
      objc_msgSend(v30, "appendBytes:length:", ", 1);
    objc_msgSend(v30, "appendBytes:length:", ", 1);
    v23 = objc_msgSend(v30, "length");
    v11 = v23 + 1;
    v24 = malloc_type_malloc(v23 + 1, 0x31DE64E3uLL);
    v12 = v24;
    if (v24)
    {
      *v24 = v25;
      memcpy(v24 + 1, (const void *)objc_msgSend(objc_retainAutorelease(v30), "bytes"), v23);
    }
    else
    {
      v11 = 0;
    }

    v3 = v26;
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  objc_autoreleasePoolPop(context);

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", v12, v11);
    free(v12);
  }
}

@end
