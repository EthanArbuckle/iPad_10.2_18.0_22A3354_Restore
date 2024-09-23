@implementation PXDragAndDropUtilities

+ (unint64_t)adjustedTargetIndexForCollection:(id)a3 movedObjects:(id)a4 targetIndex:(unint64_t)a5
{
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    if (a5 + 1 < v9)
      v9 = a5 + 1;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(v7, "indexOfObject:inRange:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), 0, v9, (_QWORD)v19);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v10, "addIndex:", v16);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = objc_msgSend(v10, "countOfIndexesInRange:", 0, a5);
  return a5 - v17;
}

+ (id)fileTypeForPhotosContainer:(id)a3
{
  id v3;
  id *v4;
  char isKindOfClass;
  id v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0CEC4F0];
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = (id *)MEMORY[0x1E0CEC4F0];
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v4 = (id *)MEMORY[0x1E0CEC528];
    }
  }
  v6 = *v4;

  return v6;
}

+ (id)sanitizedFileNameForString:(id)a3
{
  uint64_t v3;
  id v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = sanitizedFileNameForString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&sanitizedFileNameForString__onceToken, &__block_literal_global_101325);
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &stru_1E5149688;
  v7 = v6;

  -[__CFString stringByReplacingOccurrencesOfString:withString:](v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5149688);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)sanitizedFileNameForString__regex, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 4, 0, objc_msgSend(v8, "length"), &stru_1E5149688);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __53__PXDragAndDropUtilities_sanitizedFileNameForString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(^\\.+)"), 16, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sanitizedFileNameForString__regex;
  sanitizedFileNameForString__regex = v0;

}

@end
