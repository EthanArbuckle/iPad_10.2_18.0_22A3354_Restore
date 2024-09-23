@implementation AVAsset(ATVAudioSubtitleAdditionsPrivate)

+ (id)tvp_groupedAudioAVMediaSelectionOptionsFromOptions:()ATVAudioSubtitleAdditionsPrivate
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  void *v16;
  char v17;
  int v18;
  void *v19;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = v3;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      v10 = *MEMORY[0x24BDB1CB0];
      v11 = *MEMORY[0x24BDB1CC8];
      v12 = *MEMORY[0x24BDB1CC0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "hasMediaCharacteristic:", v10, v21);
          v16 = v5;
          if ((v15 & 1) == 0)
          {
            v17 = objc_msgSend(v14, "hasMediaCharacteristic:", v11);
            v16 = v4;
            if ((v17 & 1) == 0)
            {
              v18 = objc_msgSend(v14, "hasMediaCharacteristic:", v12);
              v16 = v22;
              if (!v18)
                continue;
            }
          }
          objc_msgSend(v16, "addObject:", v14);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v4);
    objc_msgSend(v19, "addObjectsFromArray:", v5);
    objc_msgSend(v19, "addObjectsFromArray:", v22);

    v3 = v21;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)tvp_filteredAndSubsortedMainProgramSubtitleOptionsFromOptions:()ATVAudioSubtitleAdditionsPrivate
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  char v17;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v9 = *MEMORY[0x24BDB1CF8];
    v10 = *MEMORY[0x24BDB1CA8];
    v23 = *MEMORY[0x24BDB1CE0];
    v20 = *MEMORY[0x24BDB1CB8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "mediaType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v9);

        v15 = v5;
        if ((v14 & 1) == 0)
        {
          v16 = objc_msgSend(v12, "hasMediaCharacteristic:", v10);
          v15 = v4;
          if ((v16 & 1) == 0)
          {
            v17 = objc_msgSend(v12, "hasMediaCharacteristic:", v23);
            v15 = v4;
            if ((v17 & 1) == 0)
            {
              if (objc_msgSend(v12, "hasMediaCharacteristic:", v20))
                v15 = v21;
              else
                v15 = v22;
            }
          }
        }
        objc_msgSend(v15, "addObject:", v12);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  objc_msgSend(v19, "addObjectsFromArray:", v22);
  objc_msgSend(v19, "addObjectsFromArray:", v4);
  objc_msgSend(v19, "addObjectsFromArray:", v5);
  objc_msgSend(v19, "addObjectsFromArray:", v21);

  return v19;
}

+ (id)tvp_sortedAuxSubtitleOptionsFromOptions:()ATVAudioSubtitleAdditionsPrivate
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_13);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }

  return v4;
}

@end
