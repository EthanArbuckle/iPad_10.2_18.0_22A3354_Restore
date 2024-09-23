@implementation RELoadControlCharacterMap

void __RELoadControlCharacterMap_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(&unk_24CFC1C88, "count"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v1 = objc_msgSend(&unk_24CFC1C88, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v22 != v3)
          objc_enumerationMutation(&unk_24CFC1C88);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        REDescriptionForTokenType(objc_msgSend(v5, "unsignedIntegerValue"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "setObject:forKeyedSubscript:", v5, v6);

      }
      v2 = objc_msgSend(&unk_24CFC1C88, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v2);
  }
  v7 = objc_msgSend(v0, "copy");
  v8 = (void *)REControlTokenMap;
  REControlTokenMap = v7;

  v9 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (id)REControlTokenMap;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "addCharactersInString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  v15 = objc_msgSend(v9, "copy");
  v16 = (void *)REControlCharacterSet;
  REControlCharacterSet = v15;

}

@end
