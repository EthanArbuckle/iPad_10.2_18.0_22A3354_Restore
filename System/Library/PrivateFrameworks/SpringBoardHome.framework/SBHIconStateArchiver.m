@implementation SBHIconStateArchiver

+ (id)archiveRootFolderInModel:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "rootFolder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRootNode:", v8);
  objc_msgSend(v9, "setIconModel:", v7);

  objc_msgSend(v9, "setMetadata:", v6);
  objc_msgSend(v9, "archiveWithError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)unarchiveRootFolderFromArchive:(id)a3 withIconSource:(id)a4
{
  id v5;
  id v6;
  SBHIconStateUnarchiver *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[SBHIconStateUnarchiver initWithArchive:iconModel:]([SBHIconStateUnarchiver alloc], "initWithArchive:iconModel:", v6, v5);

  -[SBHIconStateUnarchiver unarchive](v7, "unarchive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)leafIdentifiersFromArchive:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v6 = (void *)MEMORY[0x1D17DF4E4]();
  objc_msgSend(a1, "_addLeafNodesForNode:toSet:", v4, v5);
  objc_autoreleasePoolPop(v6);

  return v5;
}

+ (id)indexPathForLeafIdentifier:(id)a3 inArchive:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17DF4E4]();
  objc_msgSend(a1, "_pathForNode:toIdentifier:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);

  return v9;
}

+ (id)folderPathForLeafIdentifier:(id)a3 inArchive:(id)a4 iconSource:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  SBIconStateFolderPath *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v30 = a5;
  objc_msgSend(a1, "indexPathForLeafIdentifier:inArchive:", a3, v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sb_indexPathByRemovingLastIconPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_alloc_init(SBIconStateFolderPath);
  v26 = v9;
  objc_msgSend(v9, "sb_iconRelativePathComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
  v12 = v8;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  v25 = v12;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    v16 = v12;
    do
    {
      v17 = 0;
      v18 = v16;
      v19 = v11;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v17);
        objc_msgSend(v20, "bs_indexPathByAddingPrefix:", v19);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_nodeAtPath:inNode:", v20, v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        v33 = 0;
        v31 = 0;
        +[SBHIconStateUnarchiver _getFolderDisplayName:defaultDisplayName:uniqueIdentifier:forRepresentation:iconSource:](SBHIconStateUnarchiver, "_getFolderDisplayName:defaultDisplayName:uniqueIdentifier:forRepresentation:iconSource:", &v33, &v32, &v31, v16, v30);
        v21 = v33;
        v22 = v32;
        v23 = v31;
        -[SBIconStateFolderPath addFolderWithName:defaultName:uniqueIdentifier:indexPath:](v29, "addFolderWithName:defaultName:uniqueIdentifier:indexPath:", v21, v22, v23, v11);

        ++v17;
        v18 = v16;
        v19 = v11;
      }
      while (v14 != v17);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }
  else
  {
    v16 = v12;
  }

  return v29;
}

+ (id)leafIdentifiersInListAtIndexPath:(id)a3 inArchive:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  id v27;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  v8 = (uint64_t)v6;
  if (!v7)
  {
LABEL_20:
    v23 = (void *)MEMORY[0x1E0C9AA60];
    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = (void *)v8;
    else
      v24 = v23;
    v25 = v24;
    v11 = (void *)v8;
    goto LABEL_24;
  }
  v9 = v7;
  v10 = 0;
  v11 = v6;
  while (1)
  {
    v12 = objc_msgSend(v5, "indexAtPosition:", v10);
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      break;
    objc_msgSend(v11, "objectAtIndex:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v8 = v15;
LABEL_16:

    ++v10;
    v11 = (void *)v8;
    if (v9 == v10)
      goto LABEL_20;
  }
  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_isKindOfClass();

  if ((v17 & 1) == 0)
  {
    v25 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_26;
  }
  switch(v12)
  {
    case 10000:
      v18 = v11;
      v19 = CFSTR("buttonBar");
LABEL_14:
      objc_msgSend(v18, "objectForKey:", v19);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 20000:
      v18 = v11;
      v19 = CFSTR("today");
      goto LABEL_14;
    case 40000:
      v18 = v11;
      v19 = CFSTR("favoriteToday");
      goto LABEL_14;
    case 30000:
      v18 = v11;
      v19 = CFSTR("ignored");
      goto LABEL_14;
  }
  v27 = v6;
  objc_msgSend(v11, "objectForKey:", CFSTR("iconLists"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) != 0)
  {
    objc_msgSend(v20, "objectAtIndex:", v12);
    v8 = objc_claimAutoreleasedReturnValue();

    v11 = v20;
    v6 = v27;
    goto LABEL_16;
  }
  v6 = v27;
  v25 = (id)MEMORY[0x1E0C9AA60];
LABEL_24:

LABEL_26:
  return v25;
}

+ (id)modernizeRootArchive:(id)a3
{
  return a3;
}

- (SBHIconStateArchiver)initWithRootNode:(id)a3
{
  id v5;
  SBHIconStateArchiver *v6;
  SBHIconStateArchiver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconStateArchiver;
  v6 = -[SBHIconStateArchiver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_rootNode, a3);

  return v7;
}

- (id)archiveWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[SBHIconStateArchiver rootNode](self, "rootNode", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1D17DF4E4]();
  -[SBHIconStateArchiver _representationForNode:](self, "_representationForNode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconStateArchiver metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("metadata"));
    -[SBHIconStateArchiver effectiveDelegate](self, "effectiveDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "versionForIconStateArchiver:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("widgetVersion"));

    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E8E16978, CFSTR("widgetVersion"));
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  objc_autoreleasePoolPop(v5);

  return v6;
}

+ (void)_addLeafNodesForNode:(id)a3 toSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(a1, "_addLeafNodesForNode:toSet:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v7, (_QWORD)v23);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v14);
      }
    }
    else
    {
      objc_opt_self();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_isKindOfClass();

      if ((v18 & 1) == 0)
        goto LABEL_25;
      objc_msgSend(v6, "objectForKey:", CFSTR("buttonBar"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(a1, "_addLeafNodesForNode:toSet:", v12, v7);
      objc_msgSend(v6, "objectForKey:", CFSTR("today"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(a1, "_addLeafNodesForNode:toSet:", v19, v7);
      objc_msgSend(v6, "objectForKey:", CFSTR("favoriteToday"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(a1, "_addLeafNodesForNode:toSet:", v20, v7);
      objc_msgSend(v6, "objectForKey:", CFSTR("ignored"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        objc_msgSend(a1, "_addLeafNodesForNode:toSet:", v21, v7);
      objc_msgSend(v6, "objectForKey:", CFSTR("iconLists"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(a1, "_addLeafNodesForNode:toSet:", v22, v7);

    }
    goto LABEL_25;
  }
  objc_msgSend(v7, "addObject:", v6);
LABEL_25:

}

+ (id)_pathForNode:(id)a3 toIdentifier:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "bs_emptyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v38;
      while (2)
      {
        v18 = 0;
        v19 = v16 + v15;
        do
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v13);
          objc_msgSend(a1, "_pathForNode:toIdentifier:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v18), v8, (_QWORD)v37);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v24 = (void *)v20;
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v16 + v18);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "bs_indexPathByAddingPrefix:", v25);
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_19;
          }
          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        v16 = v19;
        if (v15)
          continue;
        break;
      }
    }

    goto LABEL_38;
  }
  objc_opt_self();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) == 0)
  {
LABEL_38:
    v4 = 0;
    goto LABEL_39;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("iconLists"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13
    || (objc_msgSend(a1, "_pathForNode:toIdentifier:", v13, v8), (v23 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("buttonBar"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(a1, "_pathForNode:toIdentifier:", v26, v8);
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)v27;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 10000);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bs_indexPathByAddingPrefix:", v29);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 1;
        goto LABEL_37;
      }
    }
    objc_msgSend(v7, "objectForKey:", CFSTR("today"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(a1, "_pathForNode:toIdentifier:", v29, v8);
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v28 = (void *)v31;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 20000);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bs_indexPathByAddingPrefix:", v32);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 1;
LABEL_36:

LABEL_37:
        if (v30)
          goto LABEL_39;
        goto LABEL_38;
      }
    }
    objc_msgSend(v7, "objectForKey:", CFSTR("favoriteToday"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(a1, "_pathForNode:toIdentifier:", v32, v8);
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v28 = (void *)v33;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 40000);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bs_indexPathByAddingPrefix:", v34);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
        v30 = 1;
LABEL_35:

        goto LABEL_36;
      }
    }
    objc_msgSend(v7, "objectForKey:", CFSTR("ignored"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(a1, "_pathForNode:toIdentifier:", v34, v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 30000);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bs_indexPathByAddingPrefix:", v35);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_32;
      }
    }
    else
    {
      v28 = 0;
    }
    v30 = 0;
    goto LABEL_35;
  }
  v4 = (void *)v23;
LABEL_19:

LABEL_39:
  return v4;
}

+ (id)_nodeAtPath:(id)a3 inNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = objc_msgSend(v6, "length");

    if (!v9)
      goto LABEL_6;
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "indexAtPosition:", 0));
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_self();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_isKindOfClass();

      if ((v15 & 1) == 0)
      {
        v13 = 0;
        goto LABEL_20;
      }
      v16 = objc_msgSend(v6, "indexAtPosition:", 0);
      switch(v16)
      {
        case 10000:
          v17 = CFSTR("buttonBar");
          break;
        case 20000:
          v17 = CFSTR("today");
          break;
        case 40000:
          v17 = CFSTR("favoriteToday");
          break;
        case 30000:
          v17 = CFSTR("ignored");
          break;
        default:
          objc_msgSend(v7, "objectForKey:", CFSTR("iconLists"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_nodeAtPath:inNode:", v6, v18);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
      }
      objc_msgSend(v7, "objectForKey:", v17);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v12;
    objc_msgSend(v6, "bs_indexPathByRemovingFirstIndex");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_nodeAtPath:inNode:", v19, v18);
    v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
    goto LABEL_20;
  }

LABEL_6:
  v13 = v7;
LABEL_20:

  return v13;
}

- (id)effectiveDelegate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SBHIconStateArchiver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBHIconStateArchiver iconModel](self, "iconModel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)customGridSizeClassDomain
{
  void *v3;
  void *v4;

  -[SBHIconStateArchiver effectiveDelegate](self, "effectiveDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "iconGridSizeClassDomainForIconStateArchiver:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)effectiveGridSizeClassDomain
{
  void *v3;
  void *v4;

  -[SBHIconStateArchiver customGridSizeClassDomain](self, "customGridSizeClassDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBHIconStateArchiver rootNode](self, "rootNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

LABEL_6:
      +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    objc_msgSend(v4, "gridSizeClassDomain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      goto LABEL_6;
  }
  return v3;
}

- (id)_representationForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isFolderIcon"))
    {
      objc_msgSend(v5, "folder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconStateArchiver _representationForFolder:](self, "_representationForFolder:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      goto LABEL_9;
    }
    if (objc_msgSend(v5, "isPlaceholder"))
    {
      objc_msgSend(v5, "referencedIcon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "referencedIcon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconStateArchiver _representationForIcon:](self, "_representationForIcon:", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = v9;

      goto LABEL_8;
    }
    if (objc_msgSend(v5, "isWidgetIcon"))
    {
      -[SBHIconStateArchiver _representationForCustomIcon:](self, "_representationForCustomIcon:", v5);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "isApplicationIcon"))
      {
        -[SBHIconStateArchiver effectiveDelegate](self, "effectiveDelegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "archiver:representationForIcon:", self, v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
            goto LABEL_8;
        }
        objc_msgSend(v5, "leafIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v12;
        v13 = &stru_1E8D8E958;
        if (v12)
          v13 = (__CFString *)v12;
        v9 = v13;
        goto LABEL_7;
      }
      -[SBHIconStateArchiver _representationForApplicationIcon:](self, "_representationForApplicationIcon:", v5);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v11;
    goto LABEL_9;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

+ (BOOL)_iconContainsMultipleRepresentations:(id)a3
{
  return objc_msgSend(a3, "isPlaceholder");
}

- (id)_representationsForIcon:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v4, "isPlaceholder"))
    {
      v16 = 0u;
      v17 = 0u;
      v15 = 0u;
      objc_msgSend(v4, "referencedIcons", 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        while (1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "referencedIcon");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHIconStateArchiver _representationForIcon:](self, "_representationForIcon:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          if (!--v8)
          {
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
            if (!v8)
              break;
          }
        }
      }

    }
    else
    {
      -[SBHIconStateArchiver _representationForIcon:](self, "_representationForIcon:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v5, "addObject:", v12);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_representationForList:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "icons", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend((id)objc_opt_class(), "_iconContainsMultipleRepresentations:", v11))
          {
            -[SBHIconStateArchiver _representationsForIcon:](self, "_representationsForIcon:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v5, "addObjectsFromArray:", v12);
          }
          else
          {
            -[SBHIconStateArchiver _representationForIcon:](self, "_representationForIcon:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v5, "addObject:", v12);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_metadataForList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  unsigned int v24;
  unsigned __int16 v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "hiddenDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_rotatedIconsIfApplicable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "focusModeIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "fixedIconLocations");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rotatedFixedIconLocations");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "overflowSlotCount");
    v12 = v11;
    if (v5 || v6 || v8 || v9 || v10 || v11)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = v14;
      if (v5)
        objc_msgSend(v14, "setObject:forKey:", v5, CFSTR("hiddenDate"));
      if (v8)
        objc_msgSend(v13, "setObject:forKey:", v8, CFSTR("focusModeIdentifiers"));
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("overflowSlotCount"));

      }
      if (v6)
      {
        v29 = v8;
        v31 = v5;
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v30 = v6;
        v17 = v6;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v33 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "uniqueIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v22);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v19);
        }

        objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("rotatedOrder"));
        v6 = v30;
        v5 = v31;
        v8 = v29;
      }
      if (v9 | v10)
      {
        if (v9)
          v23 = v9;
        else
          v23 = MEMORY[0x1E0C9AA70];
        objc_msgSend(v13, "setObject:forKey:", v23, CFSTR("fixedLocations"));
        v24 = objc_msgSend(v4, "gridSize");
        v25 = v24;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", HIWORD(v24));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v26, CFSTR("fixedLocationsGridRows"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v27, CFSTR("fixedLocationsGridColumns"));

        if (v10)
          objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("rotatedFixedLocations"));
      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_folderTypeForFolder:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isRootFolder"))
      v5 = 0;
    else
      v5 = CFSTR("folder");
  }
  else
  {
    v5 = 0;
  }

  return (id)v5;
}

- (id)_representationForFolder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)objc_opt_class(), "_folderTypeForFolder:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("listType"));
    objc_msgSend(v4, "defaultDisplayName");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("defaultDisplayName"));
    objc_msgSend(v4, "displayName");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("displayName"));
    v34 = (void *)v8;
    v35 = (void *)v7;
    v36 = (void *)v6;
    objc_msgSend(v4, "uniqueIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("uniqueIdentifier"));
    v32 = v9;
    v37 = v5;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v38 = v4;
    objc_msgSend(v4, "lists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          -[SBHIconStateArchiver _representationForList:](self, "_representationForList:", v18, v32);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v19);

          objc_msgSend(v18, "uniqueIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);
          -[SBHIconStateArchiver _metadataForList:](self, "_metadataForList:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            if (!v15)
              v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v15, "setObject:forKey:", v21, v20);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }

    v22 = v37;
    objc_msgSend(v37, "setObject:forKey:", v10, CFSTR("iconLists"));
    objc_msgSend(v37, "setObject:forKey:", v11, CFSTR("listUniqueIdentifiers"));
    if (v15)
      objc_msgSend(v37, "setObject:forKey:", v15, CFSTR("listMetadata"));
    v4 = v38;
    if (objc_msgSend(v38, "isRootFolder", v32))
    {
      objc_msgSend(v38, "dock");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconStateArchiver _representationForList:](self, "_representationForList:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        objc_msgSend(v37, "setObject:forKey:", v24, CFSTR("buttonBar"));
      objc_msgSend(v38, "todayList");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconStateArchiver _representationForList:](self, "_representationForList:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v26, "count"))
        objc_msgSend(v37, "setObject:forKey:", v26, CFSTR("today"));
      objc_msgSend(v38, "favoriteTodayList");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconStateArchiver _representationForList:](self, "_representationForList:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v28, "count"))
        objc_msgSend(v37, "setObject:forKey:", v28, CFSTR("favoriteToday"));
      objc_msgSend(v38, "ignoredList");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconStateArchiver _representationForList:](self, "_representationForList:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v30, "count"))
        objc_msgSend(v37, "setObject:forKey:", v30, CFSTR("ignored"));

    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)iconStateRepresentationForFolder:(id)a3 inModel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRootNode:", v7);

  objc_msgSend(v8, "setIconModel:", v6);
  objc_msgSend(v8, "archiveWithError:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_representationForApplicationIcon:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "leafIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", CFSTR("app"), CFSTR("iconType"));
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("displayIdentifier"));
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("bundleIdentifier"));
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)_representationForCustomIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", CFSTR("custom"), CFSTR("iconType"));
  objc_msgSend(v4, "leafIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("displayIdentifier"));
  objc_msgSend(v4, "iconDataSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  if (!v9)
    goto LABEL_7;
  v10 = v9;
  if (v9 == 1 && objc_msgSend((id)objc_opt_class(), "_isCustomIconElementBuiltIn:", v8))
  {
    if ((objc_msgSend((id)objc_opt_class(), "_widgetDataSourceIsSuggestion:", v8) & 1) != 0)
    {
LABEL_7:
      v11 = 0;
      goto LABEL_27;
    }
    -[SBHIconStateArchiver _addValuesForCustomIconElement:toRepresentation:](self, "_addValuesForCustomIconElement:toRepresentation:", v8, v5);
  }
  else
  {
    v27 = v8;
    v28 = v6;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((objc_msgSend((id)objc_opt_class(), "_widgetDataSourceIsSuggestion:", v18) & 1) == 0)
          {
            -[SBHIconStateArchiver _representationForCustomIconElement:](self, "_representationForCustomIconElement:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v15);
    }

    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("elements"));
    v8 = v27;
    v6 = v28;
  }
  objc_msgSend(v4, "lastUserSelectedDataSource", v27, v28, (_QWORD)v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v20, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("userSelectedElementIdentifier"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "allowsSuggestions"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("allowsSuggestions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "allowsExternalSuggestions"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("allowsExternalSuggestions"));

  objc_msgSend(v4, "gridSizeClass");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconStateArchiver archiveStringForGridSizeClass:](self, "archiveStringForGridSizeClass:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("gridSize"));
  v11 = v5;

LABEL_27:
  return v11;
}

- (id)archiveStringForGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBHIconStateArchiver effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "archiveValueForGridSizeClass:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)_widgetDataSourceIsSuggestion:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && objc_msgSend(v3, "suggestionSource") == 1;

  return v4;
}

- (id)_representationForCustomIconElement:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_isCustomIconElementBuiltIn:", v4))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SBHIconStateArchiver _addValuesForCustomIconElement:toRepresentation:](self, "_addValuesForCustomIconElement:toRepresentation:", v4, v5);
  }
  else
  {
    -[SBHIconStateArchiver effectiveDelegate](self, "effectiveDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "archiver:representationForIconDataSource:", self, v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)_addValuesForCustomIconElement:(id)a3 toRepresentation:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "uniqueIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("uniqueIdentifier"));

    }
  }
  objc_msgSend((id)objc_opt_class(), "_builtInCustomIconElementTypeForCustomIconElement:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("elementType"));
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v12 = v5;
    -[NSObject kind](v12, "kind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("widgetIdentifier"));
    -[NSObject extensionBundleIdentifier](v12, "extensionBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("bundleIdentifier"));
    -[NSObject containerBundleIdentifier](v12, "containerBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("containerBundleIdentifier"));

  }
  else
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBHIconStateArchiver _addValuesForCustomIconElement:toRepresentation:].cold.1();
  }

}

+ (id)_builtInCustomIconElementTypeForCustomIconElement:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  const __CFString *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = CFSTR("widget");
  }
  else
  {
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) != 0)
    {
      v6 = CFSTR("siriSuggestions");
    }
    else
    {
      objc_opt_self();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_isKindOfClass();

      if ((v10 & 1) != 0)
      {
        v6 = CFSTR("appPredictions");
      }
      else
      {
        objc_opt_self();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_isKindOfClass();

        if ((v12 & 1) != 0)
        {
          v6 = CFSTR("shortcuts");
        }
        else
        {
          objc_opt_self();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_isKindOfClass();

          if ((v14 & 1) != 0)
          {
            v6 = CFSTR("shortcutsSingle");
          }
          else
          {
            objc_opt_self();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_opt_isKindOfClass();

            if ((v16 & 1) != 0)
              v6 = CFSTR("files");
            else
              v6 = 0;
          }
        }
      }
    }
  }

  return (id)v6;
}

+ (BOOL)_isCustomIconElementBuiltIn:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_builtInCustomIconElementTypeForCustomIconElement:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

- (id)_representationForNode:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBHIconStateArchiver _representationForFolder:](self, "_representationForFolder:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SBHIconStateArchiver _representationForList:](self, "_representationForList:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = 0;
        goto LABEL_8;
      }
      -[SBHIconStateArchiver _representationForIcon:](self, "_representationForIcon:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
  }
  v6 = (void *)v5;
LABEL_8:

  return v6;
}

- (id)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)a3
{
  objc_storeStrong(&self->_rootNode, a3);
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
  objc_storeStrong((id *)&self->_iconModel, a3);
}

- (SBHIconStateArchiverDelegate)delegate
{
  return (SBHIconStateArchiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong(&self->_rootNode, 0);
}

- (void)_addValuesForCustomIconElement:toRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Unknown custom icon element: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
