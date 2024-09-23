@implementation UITextPasteController

- (UITextPasteController)initWithSupportingView:(id)a3
{
  id v4;
  UITextPasteController *v5;
  UITextPasteController *v6;
  uint64_t v7;
  NSMapTable *sessions;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITextPasteController;
  v5 = -[UITextPasteController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_supportingView, v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    sessions = v6->_sessions;
    v6->_sessions = (NSMapTable *)v7;

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_supportingView);
  objc_storeStrong((id *)&self->_sessions, 0);
}

- (id)beginDroppingItems:(id)a3 toSelectedRange:(id)a4 progressSupport:(id)a5 animated:(BOOL)a6
{
  return -[UITextPasteController beginDroppingItems:toSelectedRange:progressSupport:animated:delegate:](self, "beginDroppingItems:toSelectedRange:progressSupport:animated:delegate:", a3, a4, a5, a6, 0);
}

- (id)beginDroppingItems:(id)a3 toSelectedRange:(id)a4 progressSupport:(id)a5 animated:(BOOL)a6 delegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  UITextPasteCoordinator *v20;
  void *v21;
  UITextPasteController *v22;
  id v23;
  id v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  id obja;
  id *location;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v43 = a6;
  v62 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v11 = a4;
  v12 = a5;
  v13 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
  objc_msgSend(WeakRetained, "_inputController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "typingAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "copy");
  v18 = (void *)v17;
  v19 = (void *)MEMORY[0x1E0C9AA70];
  if (v17)
    v19 = (void *)v17;
  v51 = v19;

  v20 = -[UITextPasteCoordinator initWithDelegate:]([UITextPasteCoordinator alloc], "initWithDelegate:", self);
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setController:", self);
  objc_msgSend(v21, "setCoordinator:", v20);
  v47 = v11;
  objc_msgSend(v21, "setRange:", v11);
  v46 = v12;
  objc_msgSend(v21, "setProgressSupport:", v12);
  v45 = v13;
  objc_msgSend(v21, "setDelegate:", v13);
  v22 = self;
  -[NSMapTable setObject:forKey:](self->_sessions, "setObject:forKey:", v21, v20);
  v23 = objc_loadWeakRetained((id *)&self->_supportingView);
  objc_opt_class();
  v44 = v21;
  location = (id *)&self->_supportingView;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = objc_loadWeakRetained((id *)&self->_supportingView);
    v25 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_textPasteItemClass");

  }
  else
  {
    v25 = (objc_class *)objc_opt_class();
  }

  v26 = (void *)objc_opt_new();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obja = obj;
  v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v57 != v29)
          objc_enumerationMutation(obja);
        v31 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v32 = (void *)objc_msgSend([v25 alloc], "initWithTextPasteCoordinator:", v20);
        objc_msgSend(v31, "itemProvider");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setItemProvider:", v33);

        objc_msgSend(v31, "localObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setLocalObject:", v34);

        objc_msgSend(v32, "setDefaultAttributes:", v51);
        objc_msgSend(v32, "setForcesDefaultAttributes:", -[UITextPasteController shouldMatchStyleForItem:](v22, "shouldMatchStyleForItem:", v32));
        v35 = objc_loadWeakRetained(location);
        objc_msgSend(v35, "_implicitPasteConfigurationClasses");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setSupportedPasteConfigurationClasses:", v36);

        -[UITextPasteCoordinator addItem:](v20, "addItem:", v32);
        objc_msgSend(v26, "addObject:", v32);

      }
      v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v28);
  }

  objc_msgSend(v44, "setOriginalItems:", v26);
  if (v43)
    objc_msgSend(v44, "animationStarted");
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v37 = v26;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v53 != v40)
          objc_enumerationMutation(v37);
        -[UITextPasteController _transformTextPasteItem:](v22, "_transformTextPasteItem:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v39);
  }

  return v44;
}

- (BOOL)shouldMatchStyleForItem:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  objc_msgSend(a3, "itemProvider", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registeredTypeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isEqualToString:", CFSTR("com.apple.sticker")) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)beginPastingItems:(id)a3 toRange:(id)a4
{
  return -[UITextPasteController beginPastingItems:toRange:delegate:matchesTextStyles:](self, "beginPastingItems:toRange:delegate:matchesTextStyles:", a3, a4, 0, 0);
}

- (id)beginPastingItems:(id)a3 toRange:(id)a4 delegate:(id)a5 matchesTextStyles:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _BOOL4 v19;
  UITextPasteCoordinator *v20;
  void *v21;
  void *v22;
  id v23;
  UITextPasteConfigurationSupporting_Internal **p_supportingView;
  id v25;
  id v26;
  objc_class *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v42;
  UITextPasteController *v43;
  void *v44;
  void *v45;
  id obj;
  _BOOL4 v47;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;
  _QWORD v61[3];

  v47 = a6;
  v61[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
  objc_msgSend(WeakRetained, "_inputController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "typingAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = (void *)v15;
  v17 = (void *)MEMORY[0x1E0C9AA70];
  v49 = (void *)MEMORY[0x1E0C9AA70];
  if (v15)
    v17 = (void *)v15;
  v48 = v17;

  v18 = objc_loadWeakRetained((id *)&self->_supportingView);
  v19 = +[UITextInputController _shouldUseStandardTextScaling:](UITextInputController, "_shouldUseStandardTextScaling:", v18);

  if (v19)
  {
    v60 = *(_QWORD *)off_1E16790C0;
    v61[0] = &unk_1E1A9A7D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = -[UITextPasteCoordinator initWithDelegate:]([UITextPasteCoordinator alloc], "initWithDelegate:", self);
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setController:", self);
  objc_msgSend(v21, "setCoordinator:", v20);
  objc_msgSend(v21, "setRange:", v10);
  objc_msgSend(v21, "setProgressSupport:", 0);
  objc_msgSend(v21, "setDelegate:", v11);
  v42 = v21;
  -[NSMapTable setObject:forKey:](self->_sessions, "setObject:forKey:", v21, v20);
  v22 = (void *)objc_opt_new();
  v23 = objc_loadWeakRetained((id *)&self->_supportingView);
  objc_opt_class();
  v44 = v11;
  v45 = v10;
  v43 = self;
  p_supportingView = &self->_supportingView;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v25 = v9;
    v26 = objc_loadWeakRetained((id *)&self->_supportingView);
    v27 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_textPasteItemClass");

    v9 = v25;
  }
  else
  {
    v27 = (objc_class *)objc_opt_class();
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v9;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v55 != v30)
          objc_enumerationMutation(obj);
        v32 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        v33 = (void *)objc_msgSend([v27 alloc], "initWithTextPasteCoordinator:", v20);
        objc_msgSend(v33, "setItemProvider:", v32);
        objc_msgSend(v33, "setDefaultAttributes:", v48);
        v34 = objc_loadWeakRetained((id *)p_supportingView);
        objc_msgSend(v34, "_implicitPasteConfigurationClasses");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setSupportedPasteConfigurationClasses:", v35);

        objc_msgSend(v33, "setForcesDefaultAttributes:", v47);
        if (objc_msgSend(v49, "count"))
          objc_msgSend(v33, "setDocumentOptions:", v49);
        -[UITextPasteCoordinator addItem:](v20, "addItem:", v33);
        objc_msgSend(v22, "addObject:", v33);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v29);
  }

  objc_msgSend(v42, "setOriginalItems:", v22);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v36 = v22;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(v36);
        -[UITextPasteController _transformTextPasteItem:](v43, "_transformTextPasteItem:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v38);
  }

  return v42;
}

+ (id)combineAttributedStrings:(id)a3 addingSeparation:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = objc_opt_new();
    }
    v16 = (void *)v17;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
          if (v4 && objc_msgSend(v6, "length"))
          {
            v13 = objc_alloc(MEMORY[0x1E0CB3498]);
            objc_msgSend(v6, "attributesAtIndex:effectiveRange:", objc_msgSend(v6, "length") - 1, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", CFSTR(" "), v14);

            objc_msgSend(v6, "appendAttributedString:", v15);
          }
          objc_msgSend(v6, "appendAttributedString:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    v16 = (void *)objc_msgSend(v6, "copy");
    v5 = v19;
  }

  return v16;
}

- (void)coordinator:(id)a3 endPastingItems:(id)a4
{
  id v6;
  id v7;
  NSMapTable *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__204;
  v20 = __Block_byref_object_dispose__204;
  v21 = 0;
  v8 = self->_sessions;
  objc_sync_enter(v8);
  -[NSMapTable objectForKey:](self->_sessions, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "range");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v17[5];
  v17[5] = v10;

  objc_sync_exit(v8);
  if (v17[5])
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__UITextPasteController_coordinator_endPastingItems___block_invoke;
    v12[3] = &unk_1E16C1A30;
    v15 = &v16;
    v12[4] = self;
    v13 = v7;
    v14 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
  _Block_object_dispose(&v16, 8);

}

void __53__UITextPasteController_coordinator_endPastingItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clampRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_combineItemAttributedStrings:forRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 48), "setPasteResult:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_executePasteForSession:", *(_QWORD *)(a1 + 48));
    v5 = v6;
  }

}

- (void)_executePasteForSession:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD block[4];
  id v14;
  UITextPasteController *v15;
  id v16;
  uint8_t *v17;
  os_signpost_id_t v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = _MergedGlobals_1261;
  if (!_MergedGlobals_1261)
  {
    v5 = __UILogCategoryGetNode("TextPasteCoordinator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_MergedGlobals_1261);
  }
  v6 = *(id *)(v5 + 8);
  v7 = os_signpost_id_generate(*(os_log_t *)(v5 + 8));
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ExecutePasteForSession", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__204;
  v23 = __Block_byref_object_dispose__204;
  objc_msgSend(v4, "range");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (*((_QWORD *)v20 + 5)
    && (objc_msgSend(v4, "pasteResult"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__UITextPasteController__executePasteForSession___block_invoke;
    block[3] = &unk_1E16E6040;
    v14 = v4;
    v15 = self;
    v16 = v8;
    v17 = buf;
    v18 = v7;
    v9 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v10 = qword_1ECD81C08;
    if (!qword_1ECD81C08)
    {
      v10 = __UILogCategoryGetNode("TextPasteCoordinator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1ECD81C08);
    }
    v11 = *(id *)(v10 + 8);
    v9 = v11;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v9, OS_SIGNPOST_INTERVAL_END, v7, "ExecutePasteForSession", ", v12, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

void __49__UITextPasteController__executePasteForSession___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "textPasteSessionWillBeginPasting:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_clampRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__UITextPasteController__executePasteForSession___block_invoke_2;
  v13[3] = &unk_1E16E6018;
  v14 = v2;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  v17 = *(_QWORD *)(a1 + 64);
  v12 = v2;
  objc_msgSend(v9, "_performPasteOfAttributedString:toRange:forSession:completion:", v6, v7, v10, v13);

}

void __49__UITextPasteController__executePasteForSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "textPasteSessionDidEndPasting:", *(_QWORD *)(a1 + 40));
  if (v3 && objc_msgSend(*(id *)(a1 + 40), "isAnimating"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 16));
      objc_msgSend(WeakRetained, "layoutIfNeeded");

      objc_msgSend(*(id *)(a1 + 32), "textPasteSessionWillHidePasteResult:", *(_QWORD *)(a1 + 40));
    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 16));
    objc_msgSend(v5, "addInvisibleRange:", v3);

    objc_msgSend(*(id *)(a1 + 40), "setHiddenRange:", v3);
  }
  else
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
    objc_msgSend(*(id *)(a1 + 40), "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
  v8 = _block_invoke___s_category_8;
  if (!_block_invoke___s_category_8)
  {
    v8 = __UILogCategoryGetNode("TextPasteCoordinator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&_block_invoke___s_category_8);
  }
  v9 = *(id *)(v8 + 8);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v10, OS_SIGNPOST_INTERVAL_END, v11, "ExecutePasteForSession", ", v12, 2u);
  }

}

- (void)_restorePasteResultForSession:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  NSMapTable *sessions;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    objc_msgSend(v11, "hiddenRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
      objc_msgSend(v11, "hiddenRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "removeInvisibleRange:", v6);

      objc_msgSend(v11, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)&self->_supportingView);
        objc_msgSend(v8, "layoutIfNeeded");

        objc_msgSend(v7, "textPasteSessionDidRevealPasteResult:", v11);
      }
      sessions = self->_sessions;
      objc_msgSend(v11, "coordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](sessions, "removeObjectForKey:", v10);

    }
  }

}

- (BOOL)_pasteDelegateHandlesPasting
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
  objc_msgSend(WeakRetained, "pasteDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (id)_clampRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UITextPasteConfigurationSupporting_Internal **p_supportingView;
  id v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  id WeakRetained;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  id v28;
  uint64_t v29;

  v4 = a3;
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_supportingView = &self->_supportingView;
  v8 = objc_loadWeakRetained((id *)p_supportingView);
  objc_msgSend(v8, "endOfDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "comparePosition:toPosition:", v5, v9);

  v11 = v10 == 1;
  if (v10 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_supportingView);
    objc_msgSend(WeakRetained, "endOfDocument");
    v13 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v13;
  }
  v14 = objc_loadWeakRetained((id *)p_supportingView);
  objc_msgSend(v14, "beginningOfDocument");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "comparePosition:toPosition:", v5, v15);

  if (v16 == -1)
  {
    v17 = objc_loadWeakRetained((id *)p_supportingView);
    objc_msgSend(v17, "beginningOfDocument");
    v18 = objc_claimAutoreleasedReturnValue();

    v11 = 1;
    v5 = (void *)v18;
  }
  v19 = objc_loadWeakRetained((id *)p_supportingView);
  objc_msgSend(v19, "endOfDocument");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "comparePosition:toPosition:", v6, v20);

  if (v21 == 1)
  {
    v22 = objc_loadWeakRetained((id *)p_supportingView);
    objc_msgSend(v22, "endOfDocument");
    v23 = objc_claimAutoreleasedReturnValue();

    v11 = 1;
    v6 = (void *)v23;
  }
  v24 = objc_loadWeakRetained((id *)p_supportingView);
  v25 = objc_msgSend(v24, "comparePosition:toPosition:", v6, v5);

  if (v25 == -1 || v11)
  {
    v26 = v25 == -1;
    if (v25 == -1)
      v27 = v6;
    else
      v27 = v5;
    if (v26)
      v6 = v5;
    v28 = objc_loadWeakRetained((id *)p_supportingView);
    objc_msgSend(v28, "textRangeFromPosition:toPosition:", v27, v6);
    v29 = objc_claimAutoreleasedReturnValue();

    v5 = v27;
    v4 = (id)v29;
  }

  return v4;
}

- (void)_transformTextPasteItem:(id)a3
{
  UITextPasteConfigurationSupporting_Internal **p_supportingView;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  p_supportingView = &self->_supportingView;
  WeakRetained = objc_loadWeakRetained((id *)p_supportingView);
  objc_msgSend(WeakRetained, "pasteDelegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    goto LABEL_5;
  }
  v7 = (void *)v6;
  v8 = objc_loadWeakRetained((id *)p_supportingView);
  objc_msgSend(v8, "pasteDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(v14, "setDefaultResult");
    goto LABEL_6;
  }
  v11 = objc_loadWeakRetained((id *)p_supportingView);
  objc_msgSend(v11, "pasteDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_loadWeakRetained((id *)p_supportingView);
  objc_msgSend(v12, "textPasteConfigurationSupporting:transformPasteItem:", v13, v14);

LABEL_6:
}

- (id)_combineItemAttributedStrings:(id)a3 forRange:(id)a4
{
  id v6;
  id v7;
  UITextPasteConfigurationSupporting_Internal **p_supportingView;
  id WeakRetained;
  void *v10;
  char v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  p_supportingView = &self->_supportingView;
  WeakRetained = objc_loadWeakRetained((id *)p_supportingView);
  objc_msgSend(WeakRetained, "pasteDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_supportingView);
    objc_msgSend(v12, "pasteDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)p_supportingView);
    objc_msgSend(v13, "textPasteConfigurationSupporting:combineItemAttributedStrings:forRange:", v14, v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v15, "length"))
    {
      v19 = 0;
      goto LABEL_8;
    }
    v16 = objc_loadWeakRetained((id *)p_supportingView);
    objc_msgSend(v16, "_attributedStringForInsertionOfAttributedString:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17;
    v15 = v18;
  }
  else
  {
    if (!objc_msgSend(v6, "count"))
    {
      v19 = 0;
      goto LABEL_10;
    }
    v15 = objc_loadWeakRetained((id *)p_supportingView);
    +[UITextPasteController combineAttributedStrings:addingSeparation:](UITextPasteController, "combineAttributedStrings:addingSeparation:", v6, objc_msgSend(v15, "smartInsertDeleteType") != 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
LABEL_8:

LABEL_10:
  return v19;
}

- (void)_performPasteOfAttributedString:(id)a3 toRange:(id)a4 forSession:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void (**v21)(void *, uint64_t, id);
  UITextPasteConfigurationSupporting_Internal **p_supportingView;
  id WeakRetained;
  id v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  void (**v36)(void *, uint64_t, id);
  _QWORD aBlock[5];
  id v38;
  id v39;
  char v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "progressSupport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "_textPasteRangeBehavior");
    v17 = (v16 >> 1) & 1;
    v18 = (v16 >> 2) & 1;
  }
  else
  {
    LOBYTE(v18) = 0;
    LODWORD(v17) = 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__UITextPasteController__performPasteOfAttributedString_toRange_forSession_completion___block_invoke;
  aBlock[3] = &unk_1E16E6068;
  aBlock[4] = self;
  v40 = v18;
  v19 = v12;
  v38 = v19;
  v20 = v13;
  v39 = v20;
  v21 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
  p_supportingView = &self->_supportingView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
  v24 = WeakRetained;
  if ((_DWORD)v17)
  {
    objc_msgSend(WeakRetained, "setSelectedTextRange:", v11);
  }
  else
  {
    objc_msgSend(WeakRetained, "selectedTextRange");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_9;
    v24 = objc_loadWeakRetained((id *)&self->_supportingView);
    objc_msgSend(v24, "selectedTextRange");
    v26 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v26;
  }

LABEL_9:
  v27 = -[UITextPasteController _pasteDelegateHandlesPasting](self, "_pasteDelegateHandlesPasting");
  v28 = objc_loadWeakRetained((id *)&self->_supportingView);
  v29 = v28;
  if (v27)
  {
    objc_msgSend(v28, "pasteDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_loadWeakRetained((id *)p_supportingView);
    objc_msgSend(v30, "textPasteConfigurationSupporting:performPasteOfAttributedString:toRange:", v31, v10, v11);
    v32 = objc_claimAutoreleasedReturnValue();

    v21[2](v21, v32, v10);
    v11 = (id)v32;
  }
  else
  {
    objc_msgSend(v28, "_inputController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __87__UITextPasteController__performPasteOfAttributedString_toRange_forSession_completion___block_invoke_2;
    v34[3] = &unk_1E16E6090;
    v35 = v19;
    v36 = v21;
    objc_msgSend(v33, "_pasteAttributedString:toRange:completion:", v10, v11, v34);

  }
}

void __87__UITextPasteController__performPasteOfAttributedString_toRange_forSession_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *WeakRetained;
  id v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_clampRange:", v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 56))
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(WeakRetained, "setSelectedTextRange:", v14);
    }
    else
    {
      objc_msgSend(v14, "end");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(v8, "textRangeFromPosition:toPosition:", WeakRetained, WeakRetained);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(v10, "setSelectedTextRange:", v9);

    }
  }
  else
  {
    v14 = 0;
  }
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v13, "_pasteSessionDidFinish:", *(_QWORD *)(a1 + 40));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __87__UITextPasteController__performPasteOfAttributedString_toRange_forSession_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "progressSupport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "progressSupport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_textPasteSelectableRangeForResult:fromRange:", v5, v10);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v8;
  }
  else
  {
    v9 = v10;
  }
  v11 = v9;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (UITextPasteConfigurationSupporting_Internal)supportingView
{
  return (UITextPasteConfigurationSupporting_Internal *)objc_loadWeakRetained((id *)&self->_supportingView);
}

- (void)setSupportingView:(id)a3
{
  objc_storeWeak((id *)&self->_supportingView, a3);
}

@end
