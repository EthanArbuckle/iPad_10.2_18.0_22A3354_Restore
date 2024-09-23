@implementation CNContactStore(TUConversation)

- (id)tu_contactsByConversationMemberForConversationMembers:()TUConversation keyDescriptors:error:
{
  id v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  void *v33;
  void *v34;
  id v36;
  id v38;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
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
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v6;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v44)
  {
    v42 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v59 != v42)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0C97200];
        objc_msgSend(v9, "handle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "tu_contactHandlesForHandle:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v55 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
              objc_msgSend(v7, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v20 = v19;
                objc_msgSend(v19, "addObject:", v9);
              }
              else
              {
                v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v9, 0);
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, v18);
              }

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          }
          while (v15);
        }

      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v44);
  }

  objc_msgSend(v7, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tu_contactsByContactHandleForContactHandles:keyDescriptors:error:", v21, v36, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v22, "allKeys");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v43)
    {
      v41 = *(_QWORD *)v51;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v51 != v41)
            objc_enumerationMutation(v38);
          v45 = v24;
          v25 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v24);
          objc_msgSend(v7, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v47;
              do
              {
                for (k = 0; k != v29; ++k)
                {
                  if (*(_QWORD *)v47 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
                  objc_msgSend(v22, "objectForKeyedSubscript:", v25);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, v32);

                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
              }
              while (v29);
            }
          }

          v24 = v45 + 1;
        }
        while (v45 + 1 != v43);
        v43 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      }
      while (v43);
    }

  }
  else
  {
    v23 = 0;
  }
  v34 = (void *)objc_msgSend(v23, "copy");

  return v34;
}

- (id)tu_contactsByRemoteConversationMemberForConversations:()TUConversation keyDescriptors:error:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "remoteMembers", (_QWORD)v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  objc_msgSend(v10, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tu_contactsByConversationMemberForConversationMembers:keyDescriptors:error:", v18, v9, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
