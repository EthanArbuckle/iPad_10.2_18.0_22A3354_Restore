@implementation NSPredicate(VideosUICore)

+ (id)vui_predicateWithSubpredicates:()VideosUICore type:
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The compound predicate type must be NSAndPredicateType or NSOrPredicateType"));
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", a4, v5);
  }
  v7 = (void *)v6;
LABEL_9:

  return v7;
}

+ (uint64_t)vui_equalPredicateWithKeyPath:()VideosUICore value:
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), a3, a4);
}

+ (id)vui_keyPathBitTestPredicateWithKeyPath:()VideosUICore value:
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB35D0], "vui_keyPathBitTestExpressionWithKeyPath:value:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E9F3E068);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v0, v1, 0, 5, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)vui_notEqualPredicateWithKeyPath:()VideosUICore value:
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), a3, a4);
}

+ (uint64_t)vui_inPredicateWithKeyPath:()VideosUICore value:
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), a3, a4);
}

- (uint64_t)vui_keyPathsInPredicate
{
  return objc_msgSend((id)objc_opt_class(), "_vui_keyPathsInPredicate:", a1);
}

+ (id)_vui_keyPathsInPredicate:()VideosUICore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_vui_keyPathsInCompoundPredicate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_vui_keyPathsInComparisonPredicate:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "isEqual:", v7);

      if ((v8 & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported predicate: %@"), v4);
      v5 = 0;
    }
  }

  return v5;
}

+ (id)_vui_keyPathsInCompoundPredicate:()VideosUICore
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "subpredicates", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_vui_keyPathsInPredicate:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "unionSet:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_vui_keyPathsInComparisonPredicate:()VideosUICore
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a3, "leftExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "expressionType") == 3)
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
