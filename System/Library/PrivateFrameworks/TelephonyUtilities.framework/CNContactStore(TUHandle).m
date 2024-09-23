@implementation CNContactStore(TUHandle)

- (id)tu_contactsByHandleForHandles:()TUHandle keyDescriptors:error:
{
  id v6;
  id v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  void *v30;
  void *v31;
  id v33;
  id v35;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v6;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v56 != v39)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C97200], "tu_contactHandlesForHandle:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v52 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_msgSend(v7, "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                v17 = v16;
                objc_msgSend(v16, "addObject:", v9);
              }
              else
              {
                v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v9, 0);
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v15);
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          }
          while (v12);
        }

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v41);
  }

  objc_msgSend(v7, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tu_contactsByContactHandleForContactHandles:keyDescriptors:error:", v18, v33, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v19, "allKeys");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v40)
    {
      v38 = *(_QWORD *)v48;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(v35);
          v42 = v21;
          v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v21);
          objc_msgSend(v7, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v44;
              do
              {
                for (k = 0; k != v26; ++k)
                {
                  if (*(_QWORD *)v44 != v27)
                    objc_enumerationMutation(v24);
                  v29 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k);
                  objc_msgSend(v19, "objectForKeyedSubscript:", v22);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, v29);

                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
              }
              while (v26);
            }
          }

          v21 = v42 + 1;
        }
        while (v42 + 1 != v40);
        v40 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      }
      while (v40);
    }

  }
  else
  {
    v20 = 0;
  }
  v31 = (void *)objc_msgSend(v20, "copy");

  return v31;
}

@end
