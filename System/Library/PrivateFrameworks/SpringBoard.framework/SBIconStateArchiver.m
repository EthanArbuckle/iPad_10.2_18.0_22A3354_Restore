@implementation SBIconStateArchiver

+ (id)iTunesRepresentationFromRootArchive:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a5;
  v7 = a4;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = a6;
  v12 = a3;
  objc_msgSend(v10, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0DAABD8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_iTunesIconListForList:preApex:pending:iconSource:", v14, v7, v6, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v15);

  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0DAAC20]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_iTunesIconListsForLists:preApex:pending:iconSource:", v16, v7, v6, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObjectsFromArray:", v17);
  return v13;
}

+ (id)rootArchiveFromITunesRepresentation:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v10[0] = *MEMORY[0x1E0DAABD8];
    objc_msgSend(v3, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v10[1] = *MEMORY[0x1E0DAAC20];
    objc_msgSend(v3, "subarrayWithRange:", 1, v5 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

+ (id)modernizeRootArchive:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = *MEMORY[0x1E0DAAC20];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAAC20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_modernIconListsForLists:allowFolders:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DAABD8];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAABD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_modernIconListForList:allowFolders:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v8, v6, v11, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0DAAC10];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAAC10]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v13);
  v15 = *MEMORY[0x1E0DAAC18];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAAC18]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v15);
  v17 = *MEMORY[0x1E0DAAC68];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAAC68]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v17);
  v19 = *MEMORY[0x1E0DAABE0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAABE0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v19);
  v21 = *MEMORY[0x1E0DAAC50];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAAC50]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, v21);
  v23 = *MEMORY[0x1E0DAAC60];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAAC60]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v12, "setObject:forKey:", v24, v23);
  v25 = *MEMORY[0x1E0DAAC78];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAAC78]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v12, "setObject:forKey:", v26, v25);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)_migrateLeafIdentifierIfNecessary:(id)a3
{
  return +[SBIconModel migratedIdentifierForLeafIdentifier:](SBIconModel, "migratedIdentifierForLeafIdentifier:", a3);
}

+ (id)_modernIconCellForCell:(id)a3 allowFolders:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = *MEMORY[0x1E0DAAC20];
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DAAC20]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DAAC40]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
        v12 = !v4;
      else
        v12 = 1;
      if (v12)
      {
        if ((objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0DAAC38]) & 1) != 0
          || objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0DAAC30]))
        {
          v7 = v6;
        }
        else
        {
          objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DAAC58]);
          v7 = (id)objc_claimAutoreleasedReturnValue();
          if (!v7)
          {
            objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DAAC48]);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16
              && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16),
                  (v17 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v18 = (void *)v17;
              v28 = v16;
              v29 = v11;
              v30 = v9;
              v31 = a1;
              objc_msgSend(MEMORY[0x1E0CEAC08], "webClips");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = 0u;
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
              if (v20)
              {
                v21 = v20;
                v7 = 0;
                v22 = *(_QWORD *)v33;
                do
                {
                  for (i = 0; i != v21; ++i)
                  {
                    if (*(_QWORD *)v33 != v22)
                      objc_enumerationMutation(v19);
                    v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                    objc_msgSend(v24, "pageURL");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = objc_msgSend(v25, "isEqual:", v18);

                    if (v26)
                    {
                      objc_msgSend(v24, "identifier");
                      v27 = objc_claimAutoreleasedReturnValue();

                      v7 = (id)v27;
                    }
                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
                }
                while (v21);
              }
              else
              {
                v7 = 0;
              }

              v9 = v30;
              a1 = v31;
              v16 = v28;
              v11 = v29;
            }
            else
            {
              v7 = 0;
            }

          }
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_modernIconListsForLists:allowFolders:", v9, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v13, v8);

      }
    }
    else
    {
      v7 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_migrateLeafIdentifierIfNecessary:", v7);
    v14 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v14;
  }

  return v7;
}

+ (id)_modernIconListForList:(id)a3 allowFolders:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DAAC28]);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  v9 = 0x1E0C99000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v6;
    obj = v6;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      v24 = *(_QWORD *)v32;
      do
      {
        v13 = 0;
        v25 = v11;
        do
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v15 = v14;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v16)
            {
              v17 = v16;
              v18 = v9;
              v19 = *(_QWORD *)v28;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v28 != v19)
                    objc_enumerationMutation(v15);
                  objc_msgSend(a1, "_modernIconCellForCell:allowFolders:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v4, v23);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v21)
                    objc_msgSend(v7, "addObject:", v21);

                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              }
              while (v17);
              v9 = v18;
              v12 = v24;
              v11 = v25;
            }
          }
          else
          {
            objc_msgSend(a1, "_modernIconCellForCell:allowFolders:", v14, v4);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v7, "addObject:", v15);
          }

          ++v13;
        }
        while (v13 != v11);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

    v6 = v23;
  }

  return v7;
}

+ (id)_modernIconListsForLists:(id)a3 allowFolders:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(a1, "_modernIconListForList:allowFolders:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count") || !objc_msgSend(v7, "count"))
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  return v7;
}

+ (id)_iTunesIconListsForLists:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v7 = a5;
  v8 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(a1, "_iTunesIconListForList:preApex:pending:iconSource:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17), v8, v7, v11, (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v12;
}

+ (id)_iTunesIconListForList:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void *context;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v7 = a5;
  v8 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v10;
  if (v8)
  {
    v13 = objc_msgSend(v11, "maxRowCountForListInRootFolderWithInterfaceOrientation:", 1);
    v14 = objc_msgSend(v11, "maxColumnCountForListInRootFolderWithInterfaceOrientation:", 1);
    v15 = objc_msgSend(v10, "count");
    v32 = v13;
    if (v13)
    {
      v16 = v15;
      v17 = 0;
      v18 = 0;
      v31 = v14;
      do
      {
        if (v18 * v14 >= v16)
          break;
        v34 = v18;
        context = (void *)MEMORY[0x1D17E5334]();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v19);
        v20 = v14;
        v35 = v17;
        if (v14)
        {
          do
          {
            if (v17 >= v16)
            {
              v21 = 0;
            }
            else
            {
              objc_msgSend(v36, "objectAtIndex:", v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(a1, "_iTunesIconCellForCell:preApex:pending:iconSource:", v21, 1, v7, v11);
                v22 = objc_claimAutoreleasedReturnValue();
                if (v22)
                  goto LABEL_12;
              }
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0, v31);
            v22 = objc_claimAutoreleasedReturnValue();
LABEL_12:
            v23 = (void *)v22;
            objc_msgSend(v19, "addObject:", v22, v31);

            ++v17;
          }
          while (--v20);
        }

        objc_autoreleasePoolPop(context);
        v18 = v34 + 1;
        v14 = v31;
        v17 = v35 + v31;
      }
      while (v34 + 1 != v32);
    }
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = v10;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v38;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(a1, "_iTunesIconCellForCell:preApex:pending:iconSource:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v28), 0, v7, v11);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            objc_msgSend(v12, "addObject:", v29);

          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v26);
    }

  }
  return v12;
}

+ (id)_iTunesIconCellForCell:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v10;
    objc_msgSend(v11, "leafIconForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(a1, "_iTunesDictionaryForLeafIcon:withIdentifier:", v13, v12);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v7)
      {
        v15 = 0;
        goto LABEL_11;
      }
      objc_msgSend(a1, "_iTunesDictionaryForLeafIdentifier:", v12);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  v15 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0DAAC20];
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0DAAC20]);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_iTunesIconListsForLists:preApex:pending:iconSource:", v12, 0, v7, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, v16);

    objc_msgSend(v15, "removeObjectForKey:", *MEMORY[0x1E0DAABF8]);
    objc_msgSend(v15, "removeObjectForKey:", *MEMORY[0x1E0DAAC18]);
    objc_msgSend(v15, "removeObjectForKey:", *MEMORY[0x1E0DAAC70]);
LABEL_12:

  }
  return v15;
}

+ (id)_iTunesDictionaryForLeafIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setObject:forKey:", v3, *MEMORY[0x1E0DAAC58]);
    objc_msgSend(v5, "setObject:forKey:", v3, *MEMORY[0x1E0DAABE8]);
  }

  return v5;
}

+ (id)_iTunesDictionaryForLeafIcon:(id)a3 withIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayNameForLocation:", *MEMORY[0x1E0DAA9E0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x1E0DAAC00]);
  if (v6)
    objc_msgSend(v7, "setObject:forKey:", v6, *MEMORY[0x1E0DAAC58]);
  if (!objc_msgSend(v5, "isBookmarkIcon"))
  {
    if (!objc_msgSend(v5, "isApplicationIcon") || !objc_msgSend(v5, "hasApplication"))
      goto LABEL_21;
    objc_msgSend(v5, "application");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v7, "setObject:forKey:", v10, *MEMORY[0x1E0DAABF0]);
    objc_msgSend(v9, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v7, "setObject:forKey:", v11, *MEMORY[0x1E0DAABE8]);
    objc_msgSend(v9, "info");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastModifiedDate");
    goto LABEL_17;
  }
  objc_msgSend(v5, "webClip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relativePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v7, "setObject:forKey:", v11, *MEMORY[0x1E0DAAC48]);
  objc_msgSend(v9, "iconImagePath");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    SBModificationDateForPath(v12);
LABEL_17:
    v16 = v14;
    goto LABEL_19;
  }
  v16 = 0.0;
LABEL_19:

  if (v16 != 0.0)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v16);
    objc_msgSend(v7, "setObject:forKey:", v17, *MEMORY[0x1E0DAAC08]);

  }
LABEL_21:

  return v7;
}

@end
