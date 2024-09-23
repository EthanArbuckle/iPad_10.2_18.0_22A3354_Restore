@implementation NSPredicate(TRI)

- (void)triSetLogDesc:()TRI
{
  objc_setAssociatedObject(a1, "triLogDesc", a3, (void *)0x301);
}

- (id)triLogDesc
{
  void *v1;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  const __CFString *v18;
  id v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, "triLogDesc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = a1;
      v5 = (void *)objc_opt_new();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v4, "subpredicates");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v23 != v8)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            v11 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v10, "triLogDesc");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (!v12)
            {
              objc_msgSend(v10, "description");
              v1 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v1;
            }
            v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("(%@)"), v13);
            objc_msgSend(v5, "addObject:", v14);

            if (!v12)
          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v7);
      }

      v15 = objc_msgSend(v4, "compoundPredicateType");
      if (v15 == 2)
      {
        v18 = CFSTR(" OR ");
      }
      else
      {
        if (v15 != 1)
        {
          if (v15)
          {
            v3 = 0;
          }
          else
          {
            v16 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v3 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("NOT %@"), v17);

          }
          goto LABEL_23;
        }
        v18 = CFSTR(" AND ");
      }
      objc_msgSend(v5, "componentsJoinedByString:", v18);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    }
    v3 = 0;
  }
LABEL_24:
  v19 = v3;

  return v19;
}

+ (void)_triAnnotatePredicate:()TRI format:usingArgs:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __int16 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  if (!objc_msgSend(v8, "length"))
  {
LABEL_15:
    v20 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v7, "triSetLogDesc:", v20);

    goto LABEL_16;
  }
  v10 = 0;
  while (1)
  {
    v22 = 0;
    v11 = objc_msgSend(v8, "characterAtIndex:", v10);
    v22 = v11;
    if (v11 == 37)
    {
      v12 = v10 + 1;
      if (v10 + 1 < (unint64_t)objc_msgSend(v8, "length"))
        break;
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v22, 1);
    objc_msgSend(v9, "appendString:", v16);

    v12 = v10;
LABEL_14:
    v10 = v12 + 1;
    if (v12 + 1 >= (unint64_t)objc_msgSend(v8, "length"))
      goto LABEL_15;
  }
  v22 = objc_msgSend(v8, "characterAtIndex:", v10 + 1);
  v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v22, 1);
  if (v22 == 75)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    v18 = (_QWORD *)*a5;
    *a5 += 8;
    v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@"), *v18);
    objc_msgSend(v9, "appendString:", v19);

LABEL_13:
    goto LABEL_14;
  }
  if (v22 == 37)
  {
    v14 = v9;
    v15 = v13;
LABEL_12:
    objc_msgSend(v14, "appendString:", v15);
    goto LABEL_13;
  }
  if (objc_msgSend(CFSTR("@"), "containsString:", v13))
  {
    *a5 += 8;
    v14 = v9;
    v15 = CFSTR("?");
    goto LABEL_12;
  }
  TRILogCategory_Server();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "+[NSPredicate(TRI) _triAnnotatePredicate:format:usingArgs:]";
    v25 = 2112;
    v26 = v8;
    _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "%s: unsupported format specifier \"%@\", buf, 0x16u);
  }

LABEL_16:
}

+ (id)triLoggablePredicateWithFormat:()TRI
{
  id v10;
  void *v11;
  void *v12;
  uint64_t *v14;

  v10 = a3;
  v11 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:arguments:", v10, &a9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = &a9;
  objc_msgSend(a1, "_triAnnotatePredicate:format:usingArgs:", v12, v10, &v14);
  objc_autoreleasePoolPop(v11);

  return v12;
}

+ (id)triLoggablePredicateWithValue:()TRI
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  v4 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)a3)
    v7 = CFSTR("TRUEPREDICATE");
  else
    v7 = CFSTR("FALSEPREDICATE");
  objc_msgSend(v5, "triSetLogDesc:", v7);
  objc_autoreleasePoolPop(v4);
  return v6;
}

@end
