@implementation SSCompactValueArray

- (id)objectAtIndex:(id *)a1
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  if (a1)
  {
    v2 = a1;
    if (a2 <= 1)
      v3 = 1;
    else
      v3 = a2;
    v4 = objc_msgSend(a1[2], "indexLessThanOrEqualToIndex:", v3);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      return (id *)0;
    v6 = objc_msgSend(v2[2], "countOfIndexesInRange:", 0, v4);
    a1 = 0;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v2[1], "objectAtIndex:");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (id)defaultValue
{
  if (a1)
  {
    objc_msgSend(a1[1], "lastObject");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)initWithObjects:(void *)a3 indexSet:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SSCompactValueArray;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (SSCompactValueArray)init
{
  void *v3;
  void *v4;
  SSCompactValueArray *v5;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (SSCompactValueArray *)-[SSCompactValueArray initWithObjects:indexSet:]((id *)&self->super.isa, v3, v4);

  return v5;
}

+ (id)decodeFromDictionary:(id)a3 nesting:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  char isKindOfClass;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id *v40;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v44 = (void *)objc_opt_new();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v54 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v13 = translateKey(v12);
        if (v13 <= 0x7FFFFFFFFFFFFFFDLL)
        {
          v14 = v13;
          if (!a4
            || (objc_msgSend(v7, "objectForKey:", v12),
                v15 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                isKindOfClass = objc_opt_isKindOfClass(),
                v15,
                (isKindOfClass & 1) != 0))
          {
            objc_msgSend(v44, "addIndex:", v14);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v9);
  }

  v17 = objc_msgSend(v44, "count");
  if (v17 >= 1)
  {
    v18 = v17;
    v19 = *MEMORY[0x1E0C9B0D0];
    do
    {
      objc_msgSend(v6, "addObject:", v19);
      --v18;
    }
    while (v18);
  }
  v43 = v6;
  if (a4)
  {
    v47 = 0uLL;
    v48 = 0uLL;
    v45 = 0uLL;
    v46 = 0uLL;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v46;
      v24 = a4 - 1;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          v27 = translateKey(v26);
          if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v28 = indexForItem(v27, v44);
            objc_msgSend(v20, "objectForKey:", v26);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "decodeFromDictionary:nesting:", v29, v24);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:atIndexedSubscript:", v30, v28);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v22);
    }
  }
  else
  {
    v51 = 0uLL;
    v52 = 0uLL;
    v49 = 0uLL;
    v50 = 0uLL;
    v31 = v7;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v50 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
          v37 = translateKey(v36);
          if (v37 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v38 = indexForItem(v37, v44);
            objc_msgSend(v31, "objectForKey:", v36);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:atIndexedSubscript:", v39, v38);

          }
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v33);
    }
  }

  v40 = -[SSCompactValueArray initWithObjects:indexSet:]((id *)objc_alloc((Class)a1), v43, v44);
  return v40;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexes, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
