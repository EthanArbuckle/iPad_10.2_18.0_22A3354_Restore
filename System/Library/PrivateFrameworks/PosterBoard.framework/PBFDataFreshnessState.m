@implementation PBFDataFreshnessState

- (PBFDataFreshnessState)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  PBFDataFreshnessState *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  PBFDataFreshnessState *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not supported"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("PBFDataFreshnessState.m");
    v17 = 1024;
    v18 = 54;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (PBFDataFreshnessState *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not supported"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("PBFDataFreshnessState.m");
    v17 = 1024;
    v18 = 59;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PBFDataFreshnessState)initWithFreshnessProvider:(id)a3
{
  id v4;
  PBFDataFreshnessState *v5;
  uint64_t v6;
  NSSet *freshnessProviders;
  void *v9;
  objc_super v10;

  v4 = a3;
  NSClassFromString(CFSTR("NSSet"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFDataFreshnessState initWithFreshnessProvider:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD5268);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSSetClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFDataFreshnessState initWithFreshnessProvider:].cold.1();
    goto LABEL_11;
  }

  v10.receiver = self;
  v10.super_class = (Class)PBFDataFreshnessState;
  v5 = -[PBFDataFreshnessState init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    freshnessProviders = v5->_freshnessProviders;
    v5->_freshnessProviders = (NSSet *)v6;

  }
  return v5;
}

- (BOOL)isFresh
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PBFDataFreshnessState freshnessProviders](self, "freshnessProviders", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "determineRefreshState");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "needsRefresh");

        if ((v8 & 1) != 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)isDataComponentFresh:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PBFDataFreshnessState_isDataComponentFresh___block_invoke;
  v7[3] = &unk_1E86F7448;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[PBFDataFreshnessState enumerateComponentEntities:](self, "enumerateComponentEntities:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __46__PBFDataFreshnessState_isDataComponentFresh___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  v7 = v9;
  if (v6)
  {
    objc_msgSend(v9, "determineRefreshState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "needsRefresh"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a3 = 1;
    }

    v7 = v9;
  }

}

- (void)enumerateComponentEntities:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PBFDataFreshnessState freshnessProviders](self, "freshnessProviders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);

}

- (NSSet)freshComponents
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PBFDataFreshnessState_freshComponents__block_invoke;
  v6[3] = &unk_1E86F7470;
  v4 = v3;
  v7 = v4;
  -[PBFDataFreshnessState enumerateComponentEntities:](self, "enumerateComponentEntities:", v6);

  return (NSSet *)v4;
}

void __40__PBFDataFreshnessState_freshComponents__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "determineRefreshState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "needsRefresh") & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (NSSet)outOfDateComponents
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PBFDataFreshnessState_outOfDateComponents__block_invoke;
  v6[3] = &unk_1E86F7470;
  v4 = v3;
  v7 = v4;
  -[PBFDataFreshnessState enumerateComponentEntities:](self, "enumerateComponentEntities:", v6);

  return (NSSet *)v4;
}

void __44__PBFDataFreshnessState_outOfDateComponents__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "determineRefreshState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "needsRefresh"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (NSString)freshnessDebugDescription
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t i;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  _QWORD *v44;
  _QWORD v45[3];
  char v46;
  _BYTE v47[128];
  _QWORD v48[3];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v46 = 1;
  v3 = (void *)objc_opt_new();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __50__PBFDataFreshnessState_freshnessDebugDescription__block_invoke;
  v42[3] = &unk_1E86F7498;
  v44 = v45;
  v29 = v3;
  v43 = v29;
  -[PBFDataFreshnessState enumerateComponentEntities:](self, "enumerateComponentEntities:", v42);
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = -[PBFDataFreshnessState isFresh](self, "isFresh");
  v6 = CFSTR("NO.");
  if (v5)
    v6 = CFSTR("YES!");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Is our data up to date? %@\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v48[0] = CFSTR("PBFDataComponentGallery");
  v48[1] = CFSTR("PBFDataComponentDynamicDescriptors");
  v48[2] = CFSTR("PBFDataComponentStaticDescriptors");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v39 != v28)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v29, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_41);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PBFDataComponent"), &stru_1E86FC5B8);
          v10 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("\n%@:"), v10);
          v31 = (void *)v10;
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v11 = v33;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v35 != v13)
                  objc_enumerationMutation(v11);
                v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                objc_msgSend(v15, "determineRefreshState");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "object");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "needsRefresh");
                objc_msgSend(v16, "refreshReason");
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = (void *)v19;
                v21 = CFSTR("NO");
                if (v18)
                  v21 = CFSTR("YES");
                objc_msgSend(v7, "appendFormat:", CFSTR("\n\t'%@':\n\t\tNeeds Update? %@\n\t\tReason: %@"), v17, v21, v19);

                objc_msgSend(v15, "context");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "lastRefreshDate");
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (v23)
                {
                  objc_msgSend(v15, "context");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "lastRefreshDate");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "appendFormat:", CFSTR("\n\t\tLast Update Date: %@"), v25);

                }
              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
            }
            while (v12);
          }

        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v30);
  }

  _Block_object_dispose(v45, 8);
  return (NSString *)v7;
}

void __50__PBFDataFreshnessState_freshnessDebugDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "determineRefreshState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "needsRefresh"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v9, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "component");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

  }
  objc_msgSend(v6, "addObject:", v9);

}

uint64_t __50__PBFDataFreshnessState_freshnessDebugDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "determineRefreshState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "determineRefreshState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "needsRefresh"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "needsRefresh"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

- (void)dumpFreshnessStateToLogCategory:(id)a3 type:(unsigned __int8)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  __int128 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t i;
  void *v33;
  id v34;
  NSObject *log;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  _QWORD *v47;
  _QWORD v48[3];
  char v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  int v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _QWORD v59[3];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 1;
  v7 = (void *)objc_opt_new();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __62__PBFDataFreshnessState_dumpFreshnessStateToLogCategory_type___block_invoke;
  v45[3] = &unk_1E86F7498;
  v47 = v48;
  v29 = v7;
  v46 = v29;
  -[PBFDataFreshnessState enumerateComponentEntities:](self, "enumerateComponentEntities:", v45);
  v8 = v6;
  if (os_log_type_enabled(v8, (os_log_type_t)a4))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = v9;
    _os_log_impl(&dword_1CB9FA000, v8, (os_log_type_t)a4, "FRESHNESS REPORT FOR %{public}@", buf, 0xCu);

  }
  v10 = v8;
  log = v10;
  if (os_log_type_enabled(v10, (os_log_type_t)a4))
  {
    v11 = -[PBFDataFreshnessState isFresh](self, "isFresh");
    *(_DWORD *)buf = 67109120;
    LODWORD(v51) = v11;
    _os_log_impl(&dword_1CB9FA000, v10, (os_log_type_t)a4, "Is our data up to date? %{BOOL}u", buf, 8u);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v59[0] = CFSTR("PBFDataComponentGallery");
  v59[1] = CFSTR("PBFDataComponentDynamicDescriptors");
  v59[2] = CFSTR("PBFDataComponentStaticDescriptors");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v60, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v42;
    *(_QWORD *)&v12 = 138543362;
    v26 = v12;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v29, "objectForKeyedSubscript:", v13, v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_49);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PBFDataComponent"), &stru_1E86FC5B8);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, (os_log_type_t)a4))
          {
            *(_DWORD *)buf = v26;
            v51 = v31;
            _os_log_impl(&dword_1CB9FA000, log, (os_log_type_t)a4, "\n%{public}@:", buf, 0xCu);
          }
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v34 = v33;
          v15 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v37, v58, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v38;
            do
            {
              v36 = v15;
              for (j = 0; j != v36; ++j)
              {
                if (*(_QWORD *)v38 != v16)
                  objc_enumerationMutation(v34);
                v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                objc_msgSend(v18, "determineRefreshState");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = log;
                if (os_log_type_enabled(v20, (os_log_type_t)a4))
                {
                  objc_msgSend(v18, "object");
                  v21 = (id)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v19, "needsRefresh");
                  objc_msgSend(v19, "refreshReason");
                  v23 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "context");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "lastRefreshDate");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v51 = v21;
                  v52 = 1024;
                  v53 = v22;
                  v54 = 2114;
                  v55 = v23;
                  v56 = 2114;
                  v57 = v25;
                  _os_log_impl(&dword_1CB9FA000, v20, (os_log_type_t)a4, "\t'%@':\n\t\tNeeds Update? %{BOOL}u\n\t\tReason: %{public}@\n\t\tLast Update Date: %{public}@", buf, 0x26u);

                }
              }
              v15 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v37, v58, 16);
            }
            while (v15);
          }

        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v60, 16);
    }
    while (v30);
  }

  _Block_object_dispose(v48, 8);
}

void __62__PBFDataFreshnessState_dumpFreshnessStateToLogCategory_type___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "determineRefreshState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "needsRefresh"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v9, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "component");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

  }
  objc_msgSend(v6, "addObject:", v9);

}

uint64_t __62__PBFDataFreshnessState_dumpFreshnessStateToLogCategory_type___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "determineRefreshState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "determineRefreshState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "needsRefresh"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "needsRefresh"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PBFDataFreshnessState initWithFreshnessProvider:](+[PBFDataFreshnessState allocWithZone:](PBFDataFreshnessState, "allocWithZone:", a3), "initWithFreshnessProvider:", self->_freshnessProviders);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PBFDataFreshnessState initWithFreshnessProvider:](+[PBFMutableDataFreshnessState allocWithZone:](PBFMutableDataFreshnessState, "allocWithZone:", a3), "initWithFreshnessProvider:", self->_freshnessProviders);
}

- (NSSet)dataComponents
{
  return self->_dataComponents;
}

- (NSSet)freshnessProviders
{
  return self->_freshnessProviders;
}

- (void)setFreshnessProviders:(id)a3
{
  objc_storeStrong((id *)&self->_freshnessProviders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataComponents, 0);
  objc_storeStrong((id *)&self->_freshnessProviders, 0);
}

- (void)initWithFreshnessProvider:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
