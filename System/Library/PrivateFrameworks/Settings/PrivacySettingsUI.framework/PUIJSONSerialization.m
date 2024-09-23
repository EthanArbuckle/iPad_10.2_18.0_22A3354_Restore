@implementation PUIJSONSerialization

+ (id)recursivelyReplaceNSDateWithNSString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "recursivelyReplaceNSDateWithNSString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }
LABEL_18:

    v19 = (void *)objc_msgSend(v5, "copy");
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = v4;
    v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "recursivelyReplaceNSDateWithNSString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), (_QWORD)v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v18);

        }
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "dateToString:", v4);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = v4;
  }
  v19 = v20;
LABEL_23:

  return v19;
}

+ (id)dateToString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = dateToString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&dateToString__onceToken, &__block_literal_global_13);
  objc_msgSend((id)dateToString__formatter, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __37__PUIJSONSerialization_dateToString___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)dateToString__formatter;
  dateToString__formatter = v0;

  objc_msgSend((id)dateToString__formatter, "setFormatOptions:", 3955);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)dateToString__formatter, "setTimeZone:", v2);

}

+ (id)dataWithJSONObject:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  objc_super v11;

  objc_msgSend(a1, "recursivelyReplaceNSDateWithNSString:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PUIJSONSerialization;
  objc_msgSendSuper2(&v11, sel_dataWithJSONObject_options_error_, v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
