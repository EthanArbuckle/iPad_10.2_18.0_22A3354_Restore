@implementation NSString(PGNSStringExtensions)

- (uint64_t)pg_stringByRemovingParenthesesAndBrackets
{
  return objc_msgSend(a1, "_pg_stringByRemovingRegExPattern:", CFSTR("(\\[.*?\\])|(\\(.*?\\))"));
}

- (id)pg_stringByRemovingParentheses
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_pg_stringByRemovingRegExPattern:", CFSTR(" \\([^()]*\\)"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_pg_stringByRemovingRegExPattern:", CFSTR(" \\(.*?\\)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_pg_stringByRemovingRegExPattern:()PGNSStringExtensions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", a3, 0, &v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v26;
  if (v6)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Error when creating regex pattern: %@", buf, 0xCu);
    }

    v9 = v4;
  }
  else
  {
    objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)objc_msgSend(v4, "mutableCopy");
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v10, "reverseObjectEnumerator", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            v17 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "range");
            objc_msgSend(v11, "replaceCharactersInRange:withString:", v17, v18, &stru_1E8436F28);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v14);
      }

      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pg_stringByTrailingCharactersInSet:options:", v19, 3);
      v20 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v20;
    }
    v9 = v4;

  }
  return v9;
}

- (id)pg_stringByRemovingDates
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 8, 0);
  objc_msgSend(v2, "matchesInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(v1, "mutableCopy");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "reverseObjectEnumerator", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "range");
          objc_msgSend(v4, "replaceCharactersInRange:withString:", v10, v11, &stru_1E8436F28);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pg_stringByTrailingCharactersInSet:options:", v12, 3);
    v13 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v13;
  }

  return v1;
}

- (id)pg_stringByTrailingCharactersInSet:()PGNSStringExtensions options:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;

  v6 = a3;
  if (!a4 || (a4 & 4) != 0)
  {
    objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a1;
    if ((a4 & 1) != 0)
    {
      objc_msgSend(v6, "invertedSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v8);

      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = &stru_1E8436F28;
      }
      else
      {
        objc_msgSend(v7, "substringFromIndex:", v9);
        v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }

      v7 = (id)v10;
    }
    if ((a4 & 2) != 0)
    {
      objc_msgSend(v6, "invertedSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v7, "rangeOfCharacterFromSet:options:", v11, 4);

      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = &stru_1E8436F28;
      }
      else
      {
        objc_msgSend(v7, "substringToIndex:", v12 + 1);
        v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }

      v7 = (id)v13;
    }
  }

  return v7;
}

- (unint64_t)pg_levenshteinDistanceToString:()PGNSStringExtensions
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  int v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v28;
  unint64_t v29;

  v4 = a3;
  if ((objc_msgSend(a1, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(a1, "length");
    v7 = objc_msgSend(v4, "length");
    v5 = v7;
    if (v6)
    {
      if (v7)
      {
        v8 = v7 + 1;
        v9 = v7 == -1;
        v10 = malloc_type_calloc(v7 + 1, 8uLL, 0x100004000313F17uLL);
        v11 = malloc_type_calloc(v5 + 1, 8uLL, 0x100004000313F17uLL);
        if (!v9)
        {
          v12 = 0;
          do
          {
            v10[v12] = v12;
            ++v12;
          }
          while (v8 != v12);
        }
        v13 = 0;
        if (v5 <= 1)
          v14 = 1;
        else
          v14 = v5;
        v28 = v5;
        v29 = v6 - 1;
        if (v6 <= 1)
          v15 = 1;
        else
          v15 = v6;
        do
        {
          v16 = v13 + 1;
          *v11 = v13 + 1;
          v17 = a1;
          v18 = objc_msgSend(a1, "characterAtIndex:", v13, v28);
          v19 = 0;
          do
          {
            v20 = objc_msgSend(v4, "characterAtIndex:", v19);
            v21 = &v11[v19];
            v22 = *v21 + 1;
            v23 = v19 + 1;
            v24 = v10[v19];
            v25 = v10[v19 + 1];
            if (v18 != v20)
              ++v24;
            if (v22 >= v25 + 1)
              v22 = v25 + 1;
            if (v22 >= v24)
              v22 = v24;
            v21[1] = v22;
            ++v19;
          }
          while (v14 != v23);
          if (v13 >= v29)
            v26 = v10;
          else
            v26 = v11;
          if (v13 < v29)
            v11 = v10;
          ++v13;
          v10 = v26;
          a1 = v17;
        }
        while (v16 != v15);
        v5 = v11[v28];
        free(v26);
        free(v11);
      }
      else
      {
        v5 = v6;
      }
    }
  }

  return v5;
}

@end
