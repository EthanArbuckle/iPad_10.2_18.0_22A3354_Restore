@implementation TIUserDictionaryWord

+ (id)managedObjectModelURL
{
  return 0;
}

+ (int64_t)validateTransaction:(id)a3 existingEntries:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  void *v19;
  uint64_t v20;
  int64_t v21;
  int v22;
  unint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  id v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "valueToInsert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phrase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueToInsert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortcut");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "length");
  v12 = objc_msgSend(v8, "_containsIdeographicCharacters");
  if (!v11)
  {
    v21 = 1;
    goto LABEL_51;
  }
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (!v16)
  {
    v21 = 2;
    goto LABEL_51;
  }
  if (objc_msgSend(v10, "length"))
    v17 = 0;
  else
    v17 = v16 == 1;
  if (v17)
    v18 = v13;
  else
    v18 = 1;
  if (v18 != 1)
  {
    v21 = 3;
    goto LABEL_51;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v19);

    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = 5;
      goto LABEL_51;
    }
  }
  if ((objc_msgSend(v10, "_containsEmoji") & 1) != 0)
  {
    v21 = 9;
    goto LABEL_51;
  }
  v22 = objc_msgSend(v10, "_containsCJKSymbolsAndPunctuation");
  if ((v13 & ~v22) == 1)
  {
    if (!objc_msgSend(v10, "length"))
    {
      v21 = 11;
      goto LABEL_51;
    }
  }
  else
  {
    if (v22)
      v21 = 10;
    else
      v21 = 0;
    if ((v22 & 1) != 0)
      goto LABEL_51;
  }
  if ((objc_msgSend(v10, "_containsIdeographicCharacters") & 1) != 0)
  {
    v21 = 8;
  }
  else
  {
    if ((objc_msgSend(v10, "_containsHiraganaKatakanaOrBopomofo") & 1) != 0)
    {
      v23 = 1;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("☻")))
    {
      v23 = 1;
    }
    else
    {
      v23 = 2;
    }
    if (objc_msgSend(v10, "length") && objc_msgSend(v10, "length") < v23)
    {
      v21 = 6;
    }
    else
    {
      v24 = v10;
      if (objc_msgSend(v24, "length"))
      {
        v21 = 7;
      }
      else
      {
        v25 = v8;

        v21 = 4;
        v24 = v25;
      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      obj = v6;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v26)
      {
        v27 = v26;
        v34 = v6;
        v35 = v24;
        v28 = *(_QWORD *)v38;
LABEL_40:
        v29 = 0;
        while (1)
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v29);
          objc_msgSend(v5, "valueToDelete");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "matchesEntry:", v30);

          if ((v32 & 1) == 0
            && +[TIUserDictionaryWord userWord:duplicatesTarget:andShortcut:](TIUserDictionaryWord, "userWord:duplicatesTarget:andShortcut:", v30, v8, v35))
          {
            break;
          }
          if (v27 == ++v29)
          {
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            if (v27)
              goto LABEL_40;
            v21 = 0;
            break;
          }
        }
        v6 = v34;
        v24 = v35;
      }
      else
      {
        v21 = 0;
      }

    }
  }
LABEL_51:

  return v21;
}

+ (BOOL)userWord:(id)a3 duplicatesTarget:(id)a4 andShortcut:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  char v16;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "phrase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  objc_msgSend(v9, "shortcut");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v9, "shortcut");
  else
    objc_msgSend(v9, "phrase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v7, "compare:options:", v13, 1);
  if (v14)
    v15 = 1;
  else
    v15 = v11;
  v16 = (v14 != 0) ^ v15;

  return v16;
}

@end
