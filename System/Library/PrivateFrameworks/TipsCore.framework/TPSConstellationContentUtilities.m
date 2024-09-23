@implementation TPSConstellationContentUtilities

void __56__TPSConstellationContentUtilities_contentContainsLink___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  __int128 v11;

  v9 = a2;
  if (!objc_msgSend(*(id *)(a1 + 40), "contentTypeForContentDictionary:"))
  {
    objc_msgSend(v9, "TPSSafeArrayForKey:", CFSTR("marks"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__TPSConstellationContentUtilities_contentContainsLink___block_invoke_2;
    v10[3] = &unk_1E395BD48;
    v11 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v9, "TPSSafeArrayForKey:", CFSTR("content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "contentContainsLink:", v8);

  }
}

+ (BOOL)contentContainsLink:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__TPSConstellationContentUtilities_contentContainsLink___block_invoke;
    v8[3] = &unk_1E395BD48;
    v8[4] = &v9;
    v8[5] = a1;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
    v6 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)textRepresentationForContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "TPSSafeArrayForKey:", CFSTR("content"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a1, "contentTypeForContentDictionary:", v8))
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v8, "TPSSafeStringForKey:", CFSTR("text"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

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

+ (int64_t)contentTypeForContentDictionary:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("text")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("p")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("symbol")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("inlineIcon")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("personalizedText")))
  {
    v4 = 4;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

uint64_t __56__TPSConstellationContentUtilities_contentContainsLink___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "markTypeForMarkDictionary:", a2);
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (int64_t)markTypeForMarkDictionary:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("a")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("strong")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("em")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("accentColor")))
  {
    v4 = 3;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

+ (id)contentClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

+ (BOOL)contentContainsInlineIcon:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t i;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  BOOL v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      v9 = CFSTR("content");
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          v11 = v9;
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "TPSSafeArrayForKey:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v22 != v16)
                  objc_enumerationMutation(v13);
                if (objc_msgSend(a1, "contentTypeForContentDictionary:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j)) == 3)
                {

                  v18 = 1;
                  goto LABEL_21;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v15)
                continue;
              break;
            }
          }

          v9 = v11;
          v8 = v20;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        v18 = 0;
      }
      while (v7);
    }
    else
    {
      v18 = 0;
    }
LABEL_21:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)altTextRepresentationForContent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v22 = 0;
    goto LABEL_34;
  }
  v5 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v24 = v4;
  obj = v4;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (!v26)
    goto LABEL_29;
  v25 = *(_QWORD *)v34;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v34 != v25)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v6);
      objc_msgSend(obj, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 != v8 && objc_msgSend(a1, "contentTypeForContentDictionary:", v7) == 1)
        objc_msgSend(v5, "appendString:", CFSTR(" "));
      objc_msgSend(v7, "TPSSafeArrayForKey:", CFSTR("content"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v28 = v6;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        v38 = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v30 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            v19 = objc_msgSend(a1, "contentTypeForContentDictionary:", v18);
            if ((unint64_t)(v19 - 2) >= 2)
            {
              if (v19)
                continue;
              objc_msgSend(a1, "textForContentNode:", v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "appendString:", v20);
            }
            else
            {
              objc_msgSend(v18, "TPSSafeDictionaryForKey:", CFSTR("attrs"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "TPSSafeStringForKey:", CFSTR("alt"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v21, "length"))
                objc_msgSend(v5, "appendString:", v21);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v15);
      }

      v6 = v28 + 1;
    }
    while (v28 + 1 != v26);
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  }
  while (v26);
LABEL_29:

  if (v5)
    v22 = (void *)objc_msgSend(v5, "copy");
  else
    v22 = 0;

  v4 = v24;
LABEL_34:

  return v22;
}

+ (id)textForContentNode:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("text"));
}

+ (id)textContentWithText:(id)a3
{
  const __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("type");
  v10 = CFSTR("text");
  v3 = &stru_1E39608B8;
  if (a3)
    v3 = (const __CFString *)a3;
  v11 = CFSTR("text");
  v12 = v3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", &v11, &v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)hrefForLinkMark:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "TPSSafeDictionaryForKey:", CFSTR("attrs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "TPSSafeStringForKey:", CFSTR("href"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
