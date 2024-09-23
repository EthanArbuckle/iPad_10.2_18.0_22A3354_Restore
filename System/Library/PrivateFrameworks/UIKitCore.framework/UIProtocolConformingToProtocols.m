@implementation UIProtocolConformingToProtocols

void ___UIProtocolConformingToProtocols_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  Protocol *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = ___UIProtocolConformingToProtocols_block_invoke_2;
  v28[3] = &unk_1E16E9370;
  v29 = v2;
  objc_msgSend(v29, "sortedArrayUsingComparator:", v28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "appendFormat:", CFSTR("_%s"), protocol_getName(*(Protocol **)(*((_QWORD *)&v24 + 1) + 8 * v9++)));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v7);
  }

  v10 = objc_retainAutorelease(v4);
  objc_getProtocol((const char *)objc_msgSend(v10, "UTF8String"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v14 = (Protocol *)objc_allocateProtocol((const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = *(id *)(a1 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          protocol_addProtocol(v14, *(Protocol **)(*((_QWORD *)&v20 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      }
      while (v17);
    }

    objc_registerProtocol(v14);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v14);
  }

}

uint64_t ___UIProtocolConformingToProtocols_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  Protocol *v5;
  Protocol *v6;
  const char *Name;
  const char *v8;
  int v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  Name = protocol_getName(v5);
  v8 = protocol_getName(v6);

  v9 = strcmp(Name, v8);
  if (v9 < 0)
  {
    v10 = -1;
  }
  else if (v9)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("List of protocols %@ includes %@ twice"), *(_QWORD *)(a1 + 32), v5);
    v10 = 0;
  }

  return v10;
}

@end
