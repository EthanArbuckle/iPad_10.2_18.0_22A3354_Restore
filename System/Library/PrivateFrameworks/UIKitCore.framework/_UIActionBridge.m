@implementation _UIActionBridge

+ (id)actionMenuForMenu:(id)a3 firstTarget:(id)a4 includeHidden:(BOOL)a5 validation:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v23;
  id obj;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  BOOL v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  BOOL v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v27 = a4;
  v26 = a6;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v23 = v9;
  objc_msgSend(v9, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v15);
        v35[0] = v14;
        v35[1] = 3221225472;
        v35[2] = __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke;
        v35[3] = &unk_1E16C2680;
        v39 = a1;
        v17 = v27;
        v36 = v17;
        v40 = a5;
        v18 = v26;
        v37 = v18;
        v19 = v10;
        v38 = v19;
        v30[0] = v14;
        v30[1] = 3221225472;
        v30[2] = __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_2;
        v30[3] = &unk_1E16C26D0;
        v31 = v17;
        v32 = v18;
        v34 = a5;
        v33 = v19;
        v28[0] = v14;
        v28[1] = 3221225472;
        v28[2] = __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_5;
        v28[3] = &unk_1E16B2C10;
        v29 = v33;
        objc_msgSend(v16, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", v35, v30, v28, 0);

        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v10, "count"))
  {
    v20 = v23;
    objc_msgSend(v23, "menuByReplacingChildren:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
    v20 = v23;
  }

  return v21;
}

+ (id)actionMenuForMenu:(id)a3 firstTarget:(id)a4 includeHidden:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _UIMenuLeafValidation *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_UIMenuLeafValidation);
  objc_msgSend(a1, "actionMenuForMenu:firstTarget:includeHidden:validation:", v9, v8, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validatedCommandMenuForMenu:(id)a3 context:(id)a4 validation:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v21;
  id obj;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
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
  v7 = a3;
  v8 = a4;
  v24 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = v7;
  objc_msgSend(v7, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
        v29[0] = v13;
        v29[1] = 3221225472;
        v29[2] = __66___UIActionBridge_validatedCommandMenuForMenu_context_validation___block_invoke;
        v29[3] = &unk_1E16C26F8;
        v33 = a1;
        v16 = v8;
        v30 = v16;
        v17 = v24;
        v31 = v17;
        v18 = v9;
        v32 = v18;
        v25[0] = v13;
        v25[1] = 3221225472;
        v25[2] = __66___UIActionBridge_validatedCommandMenuForMenu_context_validation___block_invoke_2;
        v25[3] = &unk_1E16C2720;
        v26 = v16;
        v27 = v17;
        v28 = v18;
        objc_msgSend(v15, "_acceptMenuVisit:leafVisit:", v29, v25);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v11);
  }

  objc_msgSend(v21, "_resolveElementSizeWithContext:", v8);
  objc_msgSend(v21, "menuByReplacingChildren:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)validatedCommandMenuForMenu:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _UIMenuLeafValidation *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_UIMenuLeafValidation);
  objc_msgSend(a1, "validatedCommandMenuForMenu:context:validation:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
