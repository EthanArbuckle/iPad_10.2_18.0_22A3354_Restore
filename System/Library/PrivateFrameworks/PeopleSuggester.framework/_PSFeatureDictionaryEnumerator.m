@implementation _PSFeatureDictionaryEnumerator

- (uint64_t)initWithCollection:(uint64_t)a1
{
  id *v3;
  id *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = a2;
  if (a1)
  {
    v8.receiver = (id)a1;
    v8.super_class = (Class)_PSFeatureDictionaryEnumerator;
    v4 = (id *)objc_msgSendSuper2(&v8, sel_init);
    a1 = (uint64_t)v4;
    if (v4)
    {
      objc_storeStrong(v4 + 2, v3[1]);
      objc_storeStrong((id *)(a1 + 24), v3[2]);
      objc_msgSend(*(id *)(a1 + 16), "allKeys");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      *(_QWORD *)(a1 + 32) = objc_msgSend(*(id *)(a1 + 16), "count");
      -[_PSFeatureDictionaryEnumerator _loadNextKeyEnumerator](a1);
    }
  }

  return a1;
}

- (uint64_t)_loadNextKeyEnumerator
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 32);
    if (v2)
    {
      v3 = *(void **)(result + 16);
      objc_msgSend(*(id *)(result + 8), "objectAtIndexedSubscript:", v2 - 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyEnumerator");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(v1 + 40);
      *(_QWORD *)(v1 + 40) = v6;

      --*(_QWORD *)(v1 + 32);
      return 1;
    }
    else
    {
      result = *(_QWORD *)(result + 24);
      if (result)
      {
        if (*(_BYTE *)(v1 + 48))
        {
          return 0;
        }
        else
        {
          objc_msgSend((id)result, "keyEnumerator");
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = *(void **)(v1 + 40);
          *(_QWORD *)(v1 + 40) = v8;

          result = 1;
          *(_BYTE *)(v1 + 48) = 1;
        }
      }
    }
  }
  return result;
}

- (id)_nextKey
{
  void *v2;

  if (a1)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 40), "nextObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (!v2 && (-[_PSFeatureDictionaryEnumerator _loadNextKeyEnumerator](a1) & 1) != 0);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_allKeys
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 40), "nextObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      objc_msgSend(v2, "addObject:", v4);
      objc_msgSend(*(id *)(a1 + 40), "nextObject");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    while (v5);
  }
  for (i = *(_QWORD *)(a1 + 32); i; i = *(_QWORD *)(a1 + 32))
  {
    v7 = *(void **)(a1 + 16);
    objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", i - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v31;
      do
      {
        v15 = 0;
        v16 = v13;
        do
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v10);
          v13 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * v15);

          objc_msgSend(v2, "addObject:", v13);
          ++v15;
          v16 = v13;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v12);

    }
    --*(_QWORD *)(a1 + 32);

  }
  v17 = *(void **)(a1 + 24);
  if (v17 && !*(_BYTE *)(a1 + 48))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        v24 = v21;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v18);
          v21 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * v23);

          objc_msgSend(v2, "addObject:", v21, (_QWORD)v26);
          ++v23;
          v24 = v21;
        }
        while (v20 != v23);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v20);

    }
    *(_BYTE *)(a1 + 48) = 1;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyEnumerator, 0);
  objc_storeStrong((id *)&self->_otherValues, 0);
  objc_storeStrong((id *)&self->_timeBuckets, 0);
  objc_storeStrong((id *)&self->_timeBucketsArray, 0);
}

@end
