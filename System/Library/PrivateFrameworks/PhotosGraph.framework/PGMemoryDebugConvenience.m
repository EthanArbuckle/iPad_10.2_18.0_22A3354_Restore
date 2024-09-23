@implementation PGMemoryDebugConvenience

+ (id)memoryDebugInformationWithMomentNodes:(id)a3 meaningLabels:(id)a4 serviceManager:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v28 = a4;
  v8 = a5;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v15, "debugDictionaryWithServiceManager:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v16);
        v37[0] = v13;
        v37[1] = 3221225472;
        v37[2] = __95__PGMemoryDebugConvenience_memoryDebugInformationWithMomentNodes_meaningLabels_serviceManager___block_invoke;
        v37[3] = &unk_1E8431308;
        v38 = v9;
        objc_msgSend(v15, "enumerateMeaningfulEventsUsingBlock:", v37);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v11);
  }

  v17 = v29;
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("backingMoments"));
  if (objc_msgSend(v28, "count"))
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v30 = v9;
    v19 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(v30);
          v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          if (v28)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "meaningLabels");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "intersectsSet:", v28);

            if (!v25)
              continue;
          }
          objc_msgSend(v23, "debugDictionaryWithServiceManager:", v8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v26);

        }
        v20 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v20);
    }

    v17 = v29;
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v18, CFSTR("collectionsInfo"));

  }
  return v17;
}

uint64_t __95__PGMemoryDebugConvenience_memoryDebugInformationWithMomentNodes_meaningLabels_serviceManager___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
