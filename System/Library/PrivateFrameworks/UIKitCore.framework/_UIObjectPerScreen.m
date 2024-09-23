@implementation _UIObjectPerScreen

+ (id)objectOfClass:(Class)a3 forScreen:(id)a4 withOptions:(id)a5 createIfNecessary:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _BOOL4 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[5];
  _QWORD v32[2];
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v26 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = a1;
  objc_sync_enter(v11);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76___UIObjectPerScreen_objectOfClass_forScreen_withOptions_createIfNecessary___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v11;
  if (qword_1ECD81F98 != -1)
    dispatch_once(&qword_1ECD81F98, block);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = (id)_MergedGlobals_1288;
  v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v16, "isMemberOfClass:", a3))
        {
          objc_msgSend(v16, "_intendedScreen");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          if (v17 == v9)
          {
            v18 = objc_msgSend(v16, "_matchingOptions:", v10);

            if (v18)
            {
              v13 = v16;
              goto LABEL_18;
            }
          }
          else
          {

          }
        }
      }
      v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_18:

  if (!v13 && v26)
  {
    +[UIScreen _screens]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsObject:", v9);

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v32[0] = CFSTR("Screen");
      v32[1] = CFSTR("Options");
      v22 = (id)MEMORY[0x1E0C9AA70];
      if (v10)
        v22 = v10;
      v33[0] = v9;
      v33[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v23, "hash"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend((id)qword_1ECD81FA0, "containsObject:", v24) & 1) != 0)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend((id)qword_1ECD81FA0, "addObject:", v24);
        v13 = (id)objc_msgSend([a3 alloc], "_initWithScreen:options:", v9, v10);
        objc_msgSend((id)_MergedGlobals_1288, "addObject:", v13);
        objc_msgSend((id)qword_1ECD81FA0, "removeObject:", v24);
      }

    }
    else
    {
      v13 = 0;
    }
  }
  objc_sync_exit(v11);

  return v13;
}

+ (void)removeObject:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend((id)_MergedGlobals_1288, "removeObject:", v5);
  objc_sync_exit(v4);

}

+ (void)screenDisconnected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _BOOL4 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1;
  objc_sync_enter(v7);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)_MergedGlobals_1288;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "_intendedScreen", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == v5;

        if (v14)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend((id)_MergedGlobals_1288, "removeObjectsInArray:", v6);
  objc_sync_exit(v7);

}

+ (void)removeObjectsOfClass:(Class)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)_MergedGlobals_1288;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend((id)_MergedGlobals_1288, "removeObjectsInArray:", v4);
  objc_sync_exit(v5);

}

@end
