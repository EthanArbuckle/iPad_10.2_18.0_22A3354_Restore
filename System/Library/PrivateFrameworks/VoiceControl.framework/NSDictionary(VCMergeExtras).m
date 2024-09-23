@implementation NSDictionary(VCMergeExtras)

- (id)dictionaryByMergingEntriesFromDictionary:()VCMergeExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v5 = a1;
    goto LABEL_35;
  }
  v5 = (id)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v4, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (!v10)
    goto LABEL_33;
  v11 = v10;
  v12 = *(_QWORD *)v43;
  v35 = v4;
  v36 = *(_QWORD *)v43;
  v33 = a1;
  v34 = v5;
  v32 = v9;
  do
  {
    v13 = 0;
    v37 = v11;
    do
    {
      if (*(_QWORD *)v43 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v13);
      objc_msgSend(a1, "objectForKeyedSubscript:", v14, v32, v33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_29;
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "setByAddingObjectsFromSet:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_11:
          v18 = (void *)v17;
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v14);

LABEL_12:
          v11 = v37;
          goto LABEL_31;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v16;
          v22 = (void *)objc_msgSend(v15, "mutableCopy");
          objc_msgSend(v22, "unionOrderedSet:", v21);

          v11 = v37;
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, v14);

          v12 = v36;
          goto LABEL_31;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = v16;
          v24 = (void *)objc_msgSend(v15, "mutableCopy");
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v25 = v23;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v39;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v39 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
                if ((objc_msgSend(v24, "containsObject:", v30) & 1) == 0)
                  objc_msgSend(v24, "addObject:", v30);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v27);
          }

          v5 = v34;
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v24, v14);

          v4 = v35;
          v12 = v36;
          v9 = v32;
          a1 = v33;
          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "dictionaryByMergingEntriesFromDictionary:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
LABEL_29:
        v19 = v5;
        v20 = v15;
        goto LABEL_30;
      }
      v19 = v5;
      v20 = v16;
LABEL_30:
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, v14);
LABEL_31:

      ++v13;
    }
    while (v13 != v11);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  }
  while (v11);
LABEL_33:

LABEL_35:
  return v5;
}

@end
