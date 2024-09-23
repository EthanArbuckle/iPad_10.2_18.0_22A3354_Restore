@implementation NSDictionary(TRIDAG)

- (id)triReversedDag
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__51;
  v9 = __Block_byref_object_dispose__51;
  v10 = (id)objc_opt_new();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__NSDictionary_TRIDAG__triReversedDag__block_invoke;
  v4[3] = &unk_1E93362A8;
  v4[4] = &v5;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)triItemsInDagWithSink:()TRIDAG
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "triReversedDag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triItemsInDagWithSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)triItemsInDagWithSource:()TRIDAG
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    if (objc_msgSend(v7, "count"))
    {
      v8 = 0;
      do
      {
        v9 = v4;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
        v4 = (id)objc_claimAutoreleasedReturnValue();

        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(a1, "objectForKeyedSubscript:", v4, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
              if ((objc_msgSend(v7, "containsObject:", v15) & 1) == 0)
                objc_msgSend(v7, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v12);
        }
        ++v8;

      }
      while (objc_msgSend(v7, "count") > v8);
    }
  }
  else
  {
    v7 = (void *)objc_opt_new();
  }

  return v7;
}

- (id)triTransformValuesWithBlock:()TRIDAG
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__51;
  v15 = __Block_byref_object_dispose__51;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__NSDictionary_TRIDAG__triTransformValuesWithBlock___block_invoke;
  v8[3] = &unk_1E93362D0;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end
