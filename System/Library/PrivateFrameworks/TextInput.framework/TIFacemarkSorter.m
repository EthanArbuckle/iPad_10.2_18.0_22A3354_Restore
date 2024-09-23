@implementation TIFacemarkSorter

+ (id)candidatesSortedByFacemarkCategoryFromCandidates:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v27;
  void *context;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x18D7835DC]();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = (void *)v4;
  context = (void *)v5;
  if (candidatesSortedByFacemarkCategoryFromCandidates__onceToken != -1)
    dispatch_once(&candidatesSortedByFacemarkCategoryFromCandidates__onceToken, &__block_literal_global_10298);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = (id)candidatesSortedByFacemarkCategoryFromCandidates__orderedKeys;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v13 = objc_alloc_init(MEMORY[0x1E0C99E10]);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12, v27, context);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v9);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v19;
          objc_msgSend(v20, "category");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            objc_msgSend(v6, "objectForKey:", CFSTR("O"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v22, "addObject:", v20, v27);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v16);
  }

  v23 = (void *)candidatesSortedByFacemarkCategoryFromCandidates__orderedKeys;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __69__TIFacemarkSorter_candidatesSortedByFacemarkCategoryFromCandidates___block_invoke_2;
  v29[3] = &unk_1E243B2A8;
  v30 = v6;
  v24 = v27;
  v31 = v24;
  v25 = v6;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v29);

  objc_autoreleasePoolPop(context);
  return v24;
}

void __69__TIFacemarkSorter_candidatesSortedByFacemarkCategoryFromCandidates___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  TIKeyboardCandidateGroup *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend((id)candidatesSortedByFacemarkCategoryFromCandidates__orderedNames, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v7 = -[TIKeyboardCandidateGroup initWithTitle:candidates:]([TIKeyboardCandidateGroup alloc], "initWithTitle:candidates:", v5, v8);
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __69__TIFacemarkSorter_candidatesSortedByFacemarkCategoryFromCandidates___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.TextInput"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathForResource:ofType:", CFSTR("FacemarkCategories"), CFSTR("plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1)
    {
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Keys"));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)candidatesSortedByFacemarkCategoryFromCandidates__orderedKeys;
      candidatesSortedByFacemarkCategoryFromCandidates__orderedKeys = v3;

      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Names"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)candidatesSortedByFacemarkCategoryFromCandidates__orderedNames;
      candidatesSortedByFacemarkCategoryFromCandidates__orderedNames = v5;

    }
  }

}

@end
