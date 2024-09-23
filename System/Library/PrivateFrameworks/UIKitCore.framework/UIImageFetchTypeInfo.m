@implementation UIImageFetchTypeInfo

void ___UIImageFetchTypeInfo_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CFArrayRef v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  const __CFString *v35;
  _BYTE v36[128];
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v0;
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v1;
  objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v3;
  objc_msgSend((id)*MEMORY[0x1E0CEC4F8], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = CGImageSourceCopyTypeIdentifiers();
  v8 = (void *)-[__CFArray mutableCopy](v7, "mutableCopy");

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "removeObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v11);
  }

  objc_msgSend(v9, "addObjectsFromArray:", v8);
  v35 = CFSTR("com.apple.uikit.image");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v9);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)qword_1ECD7F508;
  qword_1ECD7F508 = v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22), 1, (_QWORD)v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  v24 = objc_msgSend(v17, "copy");
  v25 = (void *)_MergedGlobals_1169;
  _MergedGlobals_1169 = v24;

}

@end
