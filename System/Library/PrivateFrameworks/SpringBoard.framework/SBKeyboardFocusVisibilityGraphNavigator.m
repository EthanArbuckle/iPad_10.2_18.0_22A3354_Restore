@implementation SBKeyboardFocusVisibilityGraphNavigator

- (void)reverseEnumerateChainContainingSceneIdentityToken:(id)a3 block:(id)a4
{
  -[SBKeyboardFocusVisibilityGraphNavigator _reverseEnumerateChainContainingSceneIdentityToken:orSceneFromProcessID:block:](self, a3, 0, a4);
}

- (void)_reverseEnumerateChainContainingSceneIdentityToken:(uint64_t)a3 orSceneFromProcessID:(void *)a4 block:
{
  id v7;
  void (**v8)(id, void *, uint64_t, _BYTE *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  unsigned int v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id obj;
  unsigned __int8 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    if (v7)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "stringRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), CFSTR("UIScene:"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D87CF0], "endowmentTreeForNamespace:", *MEMORY[0x1E0D22E58]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootLinks");
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v31)
    {
      v33 = *(_QWORD *)v41;
      v28 = v7;
      v29 = v12;
      v27 = a3;
      v26 = a1;
      v30 = v11;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v41 != v33)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBKeyboardFocusVisibilityGraphNavigator _ancestorPathForTargetEnvironment:orTargetPid:withinEndowmentTree:root:visitedLinks:](a1, v11, a3, v12, v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v32 = v16;
            objc_msgSend(v16, "reverseObjectEnumerator");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v37;
              while (2)
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v37 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                  objc_msgSend(v22, "targetEnvironment");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v23, "hasPrefix:", CFSTR("UIScene:")))
                  {
                    objc_msgSend(v23, "substringFromIndex:", objc_msgSend(CFSTR("UIScene:"), "length"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = 0;
                    v8[2](v8, v24, objc_msgSend(v22, "targetPid"), &v35);
                    v25 = v35;

                    if (v25)
                    {

                      v7 = v28;
                      v12 = v29;
                      v11 = v30;
                      goto LABEL_25;
                    }
                  }

                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
                if (v19)
                  continue;
                break;
              }
            }

            a3 = v27;
            a1 = v26;
            v12 = v29;
            v11 = v30;
            v16 = v32;
          }

        }
        v7 = v28;
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v31);
    }
LABEL_25:

  }
}

- (void)reverseEnumerateChainContainingSceneFromProcessID:(int)a3 block:(id)a4
{
  -[SBKeyboardFocusVisibilityGraphNavigator _reverseEnumerateChainContainingSceneIdentityToken:orSceneFromProcessID:block:](self, 0, *(uint64_t *)&a3, a4);
}

- (id)_ancestorPathForTargetEnvironment:(uint64_t)a3 orTargetPid:(void *)a4 withinEndowmentTree:(void *)a5 root:(void *)a6 visitedLinks:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!a1)
    goto LABEL_6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("visitedLinks != ((void *)0)"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusVisibilityGraphNavigator _ancestorPathForTargetEnvironment:orTargetPid:withinEndowmentTree:root:visitedLinks:].cold.1(sel__ancestorPathForTargetEnvironment_orTargetPid_withinEndowmentTree_root_visitedLinks_, (uint64_t)a1, (uint64_t)v31);
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0925FC0);
  }
  if (v11)
  {
    objc_msgSend(v13, "targetEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v11);

    if ((v17 & 1) != 0)
    {
LABEL_5:
      a1 = (void *)MEMORY[0x1E0C9AA60];
LABEL_6:
      v18 = v15;
      goto LABEL_25;
    }
  }
  else if ((_DWORD)a3)
  {
    objc_msgSend(v13, "targetEnvironment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("UIScene:")) & 1) != 0)
    {
      v20 = objc_msgSend(v13, "targetPid");

      if (v20 == (_DWORD)a3)
        goto LABEL_5;
    }
    else
    {

    }
  }
  objc_msgSend(v15, "setByAddingObject:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v12, "childrenLinks:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v22)
  {
    v23 = v22;
    v32 = v13;
    v24 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((objc_msgSend(v18, "containsObject:", v26) & 1) == 0)
        {
          -[SBKeyboardFocusVisibilityGraphNavigator _ancestorPathForTargetEnvironment:orTargetPid:withinEndowmentTree:root:visitedLinks:](a1, v11, a3, v12, v26, v18);
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = (void *)v27;
            v13 = v32;
            v37 = v32;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "arrayByAddingObjectsFromArray:", v28);
            a1 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_24;
          }
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v23)
        continue;
      break;
    }
    a1 = 0;
    v13 = v32;
  }
  else
  {
    a1 = 0;
  }
LABEL_24:

LABEL_25:
  return a1;
}

- (void)_ancestorPathForTargetEnvironment:(uint64_t)a3 orTargetPid:withinEndowmentTree:root:visitedLinks:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBKeyboardFocusVisibilityGraphNavigator.m");
  v16 = 1024;
  v17 = 55;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
