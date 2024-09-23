@implementation PLPropertyListFilter

+ (id)_filterDictionary:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__PLPropertyListFilter__filterDictionary_block___block_invoke;
  v15[3] = &unk_1E3668258;
  v17 = v6;
  v18 = a1;
  v10 = v9;
  v16 = v10;
  v11 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = objc_msgSend(v8, "count");

  if (v12 && !objc_msgSend(v10, "count"))
    v13 = 0;
  else
    v13 = v10;

  return v13;
}

+ (id)_filterArray:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "_filterDictionary:block:", v15, v7);
            v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
            v17 = (void *)v16;

            v15 = v17;
            if (!v17)
              goto LABEL_13;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(a1, "_filterArray:block:", v15, v7, (_QWORD)v20);
              v16 = objc_claimAutoreleasedReturnValue();
              goto LABEL_11;
            }
          }
          objc_msgSend(v8, "addObject:", v15, (_QWORD)v20);

        }
LABEL_13:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v9, "count") && !objc_msgSend(v8, "count"))
    v18 = 0;
  else
    v18 = v8;

  return v18;
}

+ (id)filterPropertyList:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_filterDictionary:block:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "_filterArray:block:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_7:

  return v9;
}

+ (id)filterPropertyList:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PLPropertyListFilter_filterPropertyList___block_invoke;
  v4[3] = &__block_descriptor_40_e11__24__0_8_16l;
  v4[4] = a1;
  objc_msgSend(a1, "filterPropertyList:block:", a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)filterPropertyListNoData:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PLPropertyListFilter_filterPropertyListNoData___block_invoke;
  v4[3] = &__block_descriptor_40_e11__24__0_8_16l;
  v4[4] = a1;
  objc_msgSend(a1, "filterPropertyList:block:", a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)canEncodeInPropertyList:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

id __49__PLPropertyListFilter_filterPropertyListNoData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "canEncodeInPropertyList:", v4))
      v6 = v4;
    else
      v6 = 0;
    v5 = v6;
  }

  return v5;
}

id __43__PLPropertyListFilter_filterPropertyList___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  if (objc_msgSend(v3, "canEncodeInPropertyList:", v4))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

void __48__PLPropertyListFilter__filterDictionary_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = (void *)v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "_filterDictionary:block:", v5, *(_QWORD *)(a1 + 40));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v4 = v8;
LABEL_9:
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v4);

        v4 = v8;
        goto LABEL_10;
      }
      objc_msgSend(*(id *)(a1 + 48), "_filterArray:block:", v5, *(_QWORD *)(a1 + 40));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;

    v5 = v7;
    v4 = v8;
    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_10:

}

@end
