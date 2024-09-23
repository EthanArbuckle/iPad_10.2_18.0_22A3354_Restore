@implementation VMUGroupType

- (void)enumerateGroups:(void *)a3 withBlock:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  id v8;
  _QWORD *v9;
  unsigned int v10;
  uint64_t v11;
  char *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  void (*v29)(uint64_t, uint64_t);
  void *v30;
  VMUGroupType *v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v29 = __42__VMUGroupType_enumerateGroups_withBlock___block_invoke;
  v30 = &unk_1E4E023F0;
  v31 = self;
  v8 = v7;
  v32 = v8;
  v9 = v28;
  v10 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    v11 = 0;
    do
    {
      v12 = (char *)a3 + (v11 >> 3);
      v13 = v12[4];
      v14 = v11;
      if (v12[4])
      {
        do
        {
          if ((v13 & 1) != 0)
            v29((uint64_t)v9, v14);
          if (v13 < 2)
            break;
          v14 = (v14 + 1);
          v13 >>= 1;
        }
        while (v14 < v10);
      }
      v11 = (v11 + 8);
    }
    while (v11 < v10);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v8, "allKeys", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20);
        v22 = (void *)MEMORY[0x1A85A9758]();
        objc_msgSend(v8, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v23);

        objc_autoreleasePoolPop(v22);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v18);
  }

}

void __42__VMUGroupType_enumerateGroups_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  VMUNodeGroup *v6;
  VMUNodeGroup *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1A85A9758]();
  objc_msgSend(*(id *)(a1 + 32), "typeNameForNode:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v6 = (VMUNodeGroup *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = [VMUNodeGroup alloc];
    objc_msgSend(*(id *)(a1 + 32), "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VMUNodeGroup initWithName:graph:](v7, "initWithName:graph:", v5, v8);

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v5);
  }
  -[VMUNodeGroup addNode:](v6, "addNode:", a2);

  objc_autoreleasePoolPop(v4);
}

@end
