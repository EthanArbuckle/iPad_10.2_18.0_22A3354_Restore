@implementation _UIPencilEvent

- (uint64_t)windowHasRegisteredInteractionsWantingFocus:(uint64_t)a1
{
  void *v3;
  uint64_t v4;

  if (!a1 || !*(_QWORD *)(a1 + 176))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 176), "containsObject:", v3);

  return v4;
}

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  UINotificationFeedbackGenerator *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIPencilEvent;
  v2 = -[UIEvent _init](&v11, sel__init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 512);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[23];
    v2[23] = v3;

    v2[20] = 0x7FF8000000000000;
    v5 = [UINotificationFeedbackGenerator alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E1A99EA0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UINotificationFeedbackGeneratorConfiguration privateConfigurationForTypes:](_UINotificationFeedbackGeneratorConfiguration, "privateConfigurationForTypes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UIFeedbackGenerator initWithConfiguration:](v5, "initWithConfiguration:", v7);
    v9 = (void *)v2[18];
    v2[18] = v8;

  }
  return v2;
}

- (void)unregisterAllInteractionsForWindow:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)objc_msgSend(*(id *)(a1 + 168), "copy", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v8, "view");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_window");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 == a2)
            -[UIPencilInteraction _unregisterFromEvent]((uint64_t)v8);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIPencilEvent;
  -[UIEvent dealloc](&v3, sel_dealloc);
}

- (id)registerInteraction:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  id *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v42;
  id v43;
  void *v44;
  objc_class *v45;
  void *v46;
  __CFString *v47;
  id v48;
  void *v49;
  objc_class *v50;
  void *v51;
  __CFString *v52;
  id *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  NSObject *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id from;
  id location;
  id v68;
  _BYTE buf[24];
  void *v70;
  id v71[4];

  v71[2] = *(id *)MEMORY[0x1E0C80C00];
  if (!a1)
    goto LABEL_4;
  if (objc_msgSend(*(id *)(a1 + 168), "containsObject:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_registerInteraction_, a1, CFSTR("_UIPencilEvent.m"), 445, CFSTR("%s: Interaction is already registered with event: interaction: %@; event: %@"),
      "-[_UIPencilEvent registerInteraction:]",
      a2,
      a1);

LABEL_4:
    v5 = 0;
    return v5;
  }
  objc_msgSend((id)a2, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a2
    || (*(char *)(a2 + 8) < 0
      ? (v8 = *(_QWORD *)(a2 + 32))
      : (v8 = objc_msgSend((id)a2, "_dispatchBehavior"), *(_QWORD *)(a2 + 32) = v8),
        v8 != 2))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 176);
    if (!v10)
    {
      v11 = objc_opt_new();
      v12 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = v11;

      v10 = *(void **)(a1 + 176);
    }
    objc_msgSend(v10, "addObject:", v9);

  }
  objc_initWeak(&location, (id)a1);
  objc_initWeak(&from, (id)a2);
  v13 = ++qword_1ECD78178;
  v14 = (objc_class *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%p-%lu"), class_getName(v14), a2, v13);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = (id *)(id)a1;
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>"), v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringWithFormat:", CFSTR("Registering interaction with: %@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc(MEMORY[0x1E0D01868]);
  v23 = MEMORY[0x1E0C80D38];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __38___UIPencilEvent_registerInteraction___block_invoke;
  v63[3] = &unk_1E16DEF60;
  objc_copyWeak(&v64, &location);
  objc_copyWeak(&v65, &from);
  v63[4] = a2;
  v61 = (void *)objc_msgSend(v22, "initWithIdentifier:forReason:queue:invalidationBlock:", v62, v21, MEMORY[0x1E0C80D38], v63);

  v24 = qword_1ECD78170;
  if (!qword_1ECD78170)
  {
    v24 = __UILogCategoryGetNode("PencilInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v24, (unint64_t *)&qword_1ECD78170);
  }
  if ((*(_BYTE *)v24 & 1) != 0)
  {
    v42 = *(id *)(v24 + 8);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = (id)a2;
      v59 = v42;
      if (a2)
      {
        v44 = (void *)MEMORY[0x1E0CB3940];
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringWithFormat:", CFSTR("<%@: %p>"), v46, v43);
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v47 = CFSTR("(nil)");
      }

      v60 = v47;
      objc_msgSend(v43, "view");
      v48 = (id)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        v49 = (void *)MEMORY[0x1E0CB3940];
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringWithFormat:", CFSTR("<%@: %p>"), v51, v48);
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v52 = CFSTR("(nil)");
      }

      v58 = v52;
      v53 = v16;
      v54 = (void *)MEMORY[0x1E0CB3940];
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "stringWithFormat:", CFSTR("<%@: %p>"), v56, v53);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v60;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v58;
      *(_WORD *)&buf[22] = 2112;
      v70 = v57;
      _os_log_impl(&dword_185066000, v59, OS_LOG_TYPE_ERROR, "Registering interaction: %@; from view: %@; with event: %@",
        buf,
        0x20u);

      v42 = v59;
    }

  }
  v25 = v16[21];
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v16[21];
    v16[21] = (id)v26;

    v25 = v16[21];
  }
  objc_msgSend(v25, "addObject:", a2);
  if (!v16[17] && objc_msgSend(v16[21], "count"))
  {
    objc_msgSend(v16[21], "anyObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_windowHostingScene");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&v68, v16);
    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v31, "_sceneIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("UIKit - PencilEvent - %@"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = MEMORY[0x1E0C80D38];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __50___UIPencilEvent__registerForStateCaptureIfNeeded__block_invoke;
    v70 = &unk_1E16B4DD0;
    objc_copyWeak(v71, &v68);
    BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v16[17];
    v16[17] = (id)v36;

    objc_destroyWeak(v71);
    objc_destroyWeak(&v68);

  }
  if (!a2
    || (*(char *)(a2 + 8) < 0
      ? (v38 = *(_QWORD *)(a2 + 32))
      : (v38 = objc_msgSend((id)a2, "_dispatchBehavior"), *(_QWORD *)(a2 + 32) = v38),
        v38 != 2))
  {
    objc_msgSend((id)a2, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_window");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    _UIPencilEventRequestBarrelFocusIfAbleForWindow(v40, 0);

  }
  v5 = v61;
  objc_destroyWeak(&v65);
  objc_destroyWeak(&v64);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v5;
}

- (void)_cancelAndRemoveInteractionsInAllDeliveryRecordsFromFilter:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = *(_QWORD *)(a1 + 152);
  v21 = *(_QWORD *)(a1 + 128);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 184);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v23 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v7 = *(_DWORD **)(*((_QWORD *)&v24 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 184), "objectForKey:", v7, v20, v21);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (id *)v8;
        if (v8)
        {
          v10 = *(id *)(v8 + 16);
          v11 = (void *)objc_msgSend(v9[2], "copy");
        }
        else
        {
          v10 = 0;
          v11 = 0;
        }
        (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 && objc_msgSend(v12, "count"))
        {
          if (!v7)
            goto LABEL_14;
          v13 = v7[6];
          v14 = 251;
          if (v13 != 5)
            v14 = 0;
          if (!v13)
LABEL_14:
            v14 = 250;
          *(_QWORD *)(a1 + 128) = v14;
          *(_QWORD *)(a1 + 152) = 4;
          objc_storeStrong((id *)(a1 + 192), v7);
          objc_msgSend(v12, "allObjects");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = *(void **)(a1 + 200);
          *(_QWORD *)(a1 + 200) = v15;

          -[_UIPencilEvent sendToInteractions](a1);
          v17 = *(void **)(a1 + 192);
          *(_QWORD *)(a1 + 192) = 0;

          v18 = *(void **)(a1 + 200);
          *(_QWORD *)(a1 + 200) = 0;

          objc_msgSend(v10, "minusSet:", v12);
        }

        ++v6;
      }
      while (v5 != v6);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v5 = v19;
    }
    while (v19);
  }

  *(_QWORD *)(a1 + 128) = v21;
  *(_QWORD *)(a1 + 152) = v20;
}

- (void)sendToInteractions
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  objc_class *v11;
  objc_class *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  id v21;
  id v22;
  NSObject *log;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  __CFString *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v2 = *(id *)(a1 + 200);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v25;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v25 != v6)
            objc_enumerationMutation(v2);
          v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v7);
          v9 = sendToInteractions___s_category;
          if (!sendToInteractions___s_category)
          {
            v9 = __UILogCategoryGetNode("PencilInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v9, (unint64_t *)&sendToInteractions___s_category);
          }
          if ((*(_BYTE *)v9 & 1) != 0)
          {
            log = *(id *)(v9 + 8);
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v17 = (void *)MEMORY[0x1E0CB3940];
              v21 = (id)a1;
              v11 = (objc_class *)objc_opt_class();
              NSStringFromClass(v11);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v21);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v22 = v18;
              if (v8)
              {
                v19 = (void *)MEMORY[0x1E0CB3940];
                v16 = (id)v8;
                v12 = (objc_class *)objc_opt_class();
                NSStringFromClass(v12);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v16);
                v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v20 = CFSTR("(nil)");
              }
              *(_DWORD *)buf = 138412546;
              v29 = v22;
              v30 = 2112;
              v31 = v20;
              _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "Sending %@ to %@", buf, 0x16u);

            }
          }
          -[UIPencilInteraction _performCallbacksWithEvent:]((_BYTE *)v8, (_QWORD *)a1);
          if (v8)
          {
            if (*(char *)(v8 + 8) < 0)
            {
              v10 = *(_QWORD *)(v8 + 32);
            }
            else
            {
              v10 = objc_msgSend((id)v8, "_dispatchBehavior");
              *(_QWORD *)(v8 + 32) = v10;
            }
          }
          else
          {
            v10 = 0;
          }
          v5 |= v10 != 2;
          ++v7;
        }
        while (v4 != v7);
        v13 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        v4 = v13;
      }
      while (v13);

      if ((v5 & 1) != 0 && *(_QWORD *)(a1 + 128) == 250)
      {
        if (*(_QWORD *)(a1 + 120))
          objc_msgSend(*(id *)(a1 + 144), "_privateNotificationOccurred:atLocation:senderID:", 1023, 1.79769313e308, 1.79769313e308);
      }
    }
    else
    {

    }
  }
}

- (uint64_t)_cancelAndRemoveAllDescriptorsAndInteractions
{
  id *v1;
  unint64_t v2;
  NSObject *v3;
  void *v4;
  id *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (id *)result;
    v2 = _cancelAndRemoveAllDescriptorsAndInteractions___s_category;
    if (!_cancelAndRemoveAllDescriptorsAndInteractions___s_category)
    {
      v2 = __UILogCategoryGetNode("PencilInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&_cancelAndRemoveAllDescriptorsAndInteractions___s_category);
    }
    if ((*(_BYTE *)v2 & 1) != 0)
    {
      v3 = *(NSObject **)(v2 + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = v1;
        v6 = v3;
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412290;
        v11 = v9;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Cancelling and removing all interactions from event: %@", buf, 0xCu);

      }
    }
    -[_UIPencilEvent _cancelAndRemoveInteractionsInAllDeliveryRecordsFromFilter:]((uint64_t)v1, (uint64_t)&__block_literal_global_46_0);
    return objc_msgSend(v1[23], "removeAllObjects");
  }
  return result;
}

- (uint64_t)_shouldCollectInteraction:(int)a3 consultingInteraction:(void *)a4 constrainedToWindow:
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if (!a1 || !objc_msgSend(a2, "isEnabled"))
    return 0;
  if (a4)
  {
    objc_msgSend(a2, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_window");
    v9 = objc_claimAutoreleasedReturnValue();
    if ((void *)v9 != a4)
    {
      v10 = 0;
      a4 = (void *)v9;
LABEL_11:

      return v10;
    }
  }
  objc_msgSend(a2, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UIView _isInVisibleHierarchy]((uint64_t)v11);
  if ((_DWORD)v10 && a3)
    v10 = -[UIPencilInteraction _internalShouldReceiveEvent:](a2, a1);

  if (a4)
    goto LABEL_11;
  return v10;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  int IntegerValue;
  unint64_t SenderID;
  int64_t v8;
  unsigned int Phase;
  unint64_t v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  _UIGenericGestureHIDEventDescriptor *v15;
  int Type;
  uint64_t v17;
  int v18;
  NSMapTable *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  _QWORD *v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  NSHashTable *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _UIGenericGestureHIDEventDescriptor *continuousEventDescriptorForDispatch;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  NSArray *v56;
  NSArray *interactionsForDispatch;
  int64_t subtype;
  void *v59;
  void *v60;
  NSArray *v61;
  NSArray *v62;
  void *v63;
  char v64;
  _UIGenericGestureHIDEventDescriptor *v65;
  id v66;
  __IOHIDEvent *v67;
  id v68;
  objc_super v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _QWORD v84[6];
  char v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v69.receiver = self;
    v69.super_class = (Class)_UIPencilEvent;
    -[UIEvent _setHIDEvent:](&v69, sel__setHIDEvent_);
    return;
  }
  if ((_UIEventHIDIsPencilBarrelEvent() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPencilEvent.m"), 749, CFSTR("Invalid hidEvent type for %@: %@"), objc_opt_class(), a3);

    return;
  }
  v69.receiver = self;
  v69.super_class = (Class)_UIPencilEvent;
  -[UIEvent _setHIDEvent:](&v69, sel__setHIDEvent_, a3);
  IntegerValue = IOHIDEventGetIntegerValue();
  SenderID = IOHIDEventGetSenderID();
  v8 = 251;
  if (IntegerValue != 5)
    v8 = 0;
  if (!IntegerValue)
    v8 = 250;
  self->_senderID = SenderID;
  self->_subtype = v8;
  if (IntegerValue != 5)
    goto LABEL_14;
  Phase = IOHIDEventGetPhase();
  if ((Phase & 1) != 0)
  {
    v10 = 1;
    goto LABEL_17;
  }
  if ((Phase & 2) != 0)
  {
    v10 = 2;
    goto LABEL_17;
  }
  if ((Phase & 4) != 0)
LABEL_14:
    v10 = 3;
  else
    v10 = (Phase >> 1) & 4;
LABEL_17:
  self->_phase = v10;
  if (_UIEventHIDGetChildVendorDefinedForceStageEvent((uint64_t)a3))
    v11 = *(double *)(IOHIDEventGetDataValue() + 40);
  else
    v11 = NAN;
  self->_normalizedForceVelocity = v11;
  _UIEventHIDUIWindowForHIDEvent();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "_isSystemGestureWindow"))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;
  v15 = 0;
  if (self->_registeredInteractions && self->_subtype == 251)
  {
    v63 = v12;
    Type = IOHIDEventGetType();
    v17 = IOHIDEventGetSenderID();
    v67 = a3;
    v18 = IOHIDEventGetIntegerValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v19 = self->_deliveryRecordsByDescriptor;
    v20 = -[NSMapTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v79;
      if (Type)
        v23 = 0;
      else
        v23 = v17 == 0;
      v24 = v23;
      v64 = v24;
LABEL_33:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v79 != v22)
          objc_enumerationMutation(v19);
        v26 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v25);
        if (v26)
        {
          if (*(_DWORD *)(v26 + 8) == Type && *(_QWORD *)(v26 + 16) == v17)
          {
            v27 = *(_DWORD *)(v26 + 24);
            goto LABEL_40;
          }
        }
        else if ((v64 & 1) != 0)
        {
          v27 = 0;
LABEL_40:
          if (v27 == v18)
          {
            v30 = &OBJC_IVAR___UICellAccessoryLabel__adjustsFontForContentSizeCategory;
            v65 = (_UIGenericGestureHIDEventDescriptor *)(id)v26;
            -[NSMapTable objectForKey:](self->_deliveryRecordsByDescriptor, "objectForKey:");
            v29 = (_QWORD *)objc_claimAutoreleasedReturnValue();

            if (v26)
              goto LABEL_49;
            goto LABEL_48;
          }
        }
        if (v21 == ++v25)
        {
          v28 = -[NSMapTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
          v21 = v28;
          if (v28)
            goto LABEL_33;
          break;
        }
      }
    }

    v29 = 0;
    v30 = &OBJC_IVAR___UICellAccessoryLabel__adjustsFontForContentSizeCategory;
LABEL_48:
    +[_UIGenericGestureHIDEventDescriptor descriptorWithEvent:](_UIGenericGestureHIDEventDescriptor, "descriptorWithEvent:", v67);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = objc_opt_new();

    v65 = (_UIGenericGestureHIDEventDescriptor *)v31;
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v30[1015]), "setObject:forKey:", v32, v31);
    v29 = (_QWORD *)v32;
LABEL_49:
    if (self->_phase == 1)
    {
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v33 = self->_registeredInteractions;
      v34 = -[NSHashTable countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      if (v34)
      {
        v35 = v34;
        v36 = 0;
        v68 = 0;
        v37 = *(_QWORD *)v75;
        do
        {
          v38 = 0;
          do
          {
            if (*(_QWORD *)v75 != v37)
              objc_enumerationMutation(v33);
            v39 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v38);
            if (v39)
            {
              if (*(char *)(v39 + 8) < 0)
              {
                v40 = *(_QWORD *)(v39 + 32);
              }
              else
              {
                v40 = objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v38), "_dispatchBehavior");
                *(_QWORD *)(v39 + 32) = v40;
              }
            }
            else
            {
              v40 = 0;
            }
            if (-[_UIPencilEvent _shouldCollectInteraction:consultingInteraction:constrainedToWindow:](self, (_BYTE *)v39, 1, v14))
            {
              if (v29)
                v41 = (void *)v29[2];
              else
                v41 = 0;
              objc_msgSend(v41, "addObject:", v39);
              if ((v40 != 0) | v36 & 1)
              {
                if (v40 == 1)
                {
                  v42 = v68;
                  if (!v68)
                    v42 = (void *)objc_opt_new();
                  v68 = v42;
                  objc_msgSend(v42, "addObject:", v39);
                }
              }
              else
              {
                v36 = 1;
              }
            }
            ++v38;
          }
          while (v35 != v38);
          v43 = -[NSHashTable countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
          v35 = v43;
        }
        while (v43);
      }
      else
      {
        v36 = 0;
        v68 = 0;
      }

      if (+[UIPencilInteraction preferredSqueezeAction](UIPencilInteraction, "preferredSqueezeAction") == 5
        && (v36 & 1) != 0
        && objc_msgSend(v68, "count"))
      {
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v44 = v68;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v71;
          do
          {
            v48 = 0;
            do
            {
              if (*(_QWORD *)v71 != v47)
                objc_enumerationMutation(v44);
              if (v29)
                v49 = (void *)v29[2];
              else
                v49 = 0;
              objc_msgSend(v49, "removeObject:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v48++));
            }
            while (v46 != v48);
            v50 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
            v46 = v50;
          }
          while (v50);
        }

      }
    }

    v12 = v63;
    v15 = v65;
  }
  continuousEventDescriptorForDispatch = self->_continuousEventDescriptorForDispatch;
  self->_continuousEventDescriptorForDispatch = v15;

  -[NSMapTable objectForKey:](self->_deliveryRecordsByDescriptor, "objectForKey:", self->_continuousEventDescriptorForDispatch);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v52;
  if (v52)
  {
    *(_QWORD *)(v52 + 8) = self->_phase;
    v54 = *(void **)(v52 + 16);
  }
  else
  {
    v54 = 0;
  }
  v55 = v54;
  objc_msgSend(v55, "allObjects");
  v56 = (NSArray *)objc_claimAutoreleasedReturnValue();
  interactionsForDispatch = self->_interactionsForDispatch;
  self->_interactionsForDispatch = v56;

  if (!v53)
  {
    subtype = self->_subtype;
    if (-[NSHashTable count](self->_registeredInteractions, "count"))
    {
      if (subtype != 251)
      {
        -[NSHashTable allObjects](self->_registeredInteractions, "allObjects");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __89___UIPencilEvent__collectAllActiveInteractionsConstrainedToWindow_consultingInteraction___block_invoke;
        v84[3] = &unk_1E16DEFD0;
        v85 = 1;
        v84[4] = self;
        v84[5] = v14;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v84);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "filteredArrayUsingPredicate:", v60);
        v61 = (NSArray *)objc_claimAutoreleasedReturnValue();

        v62 = self->_interactionsForDispatch;
        self->_interactionsForDispatch = v61;

      }
    }
  }

}

- (void)_cleanupAfterDispatch
{
  uint64_t v3;
  void *v4;
  _UIGenericGestureHIDEventDescriptor *continuousEventDescriptorForDispatch;
  NSArray *interactionsForDispatch;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPencilEvent;
  -[UIEvent _cleanupAfterDispatch](&v7, sel__cleanupAfterDispatch);
  if (self->_continuousEventDescriptorForDispatch)
  {
    -[NSMapTable objectForKey:](self->_deliveryRecordsByDescriptor, "objectForKey:");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3 && (unint64_t)(*(_QWORD *)(v3 + 8) - 3) <= 1)
      -[NSMapTable removeObjectForKey:](self->_deliveryRecordsByDescriptor, "removeObjectForKey:", self->_continuousEventDescriptorForDispatch);

  }
  self->_senderID = 0;
  self->_subtype = 0;
  self->_phase = 0;
  self->_normalizedForceVelocity = NAN;
  continuousEventDescriptorForDispatch = self->_continuousEventDescriptorForDispatch;
  self->_continuousEventDescriptorForDispatch = 0;

  interactionsForDispatch = self->_interactionsForDispatch;
  self->_interactionsForDispatch = 0;

}

- (int64_t)type
{
  return 13;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (id)_cloneEvent
{
  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIPencilEvent debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIPencilEvent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  int64_t subtype;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  unint64_t phase;
  const __CFString *v10;
  id v11;
  id v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  subtype = self->_subtype;
  v6 = CFSTR("squeeze");
  v7 = CFSTR("(unknown)");
  if (subtype == 250)
    v7 = CFSTR("tap");
  if (subtype != 251)
    v6 = v7;
  if (subtype)
    v8 = v6;
  else
    v8 = CFSTR("none");
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("subtype"));
  phase = self->_phase;
  if (phase > 4)
    v10 = CFSTR("(unknown)");
  else
    v10 = off_1E16DEFF8[phase];
  objc_msgSend(v4, "appendString:withName:", v10, CFSTR("phase"));
  if (os_variant_has_internal_diagnostics())
    v13 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("normalizedForceVelocity"), 1, self->_normalizedForceVelocity);
  v11 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSHashTable count](self->_registeredInteractions, "count"), CFSTR("registeredInteractions.count"));
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPencilEvent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPencilEvent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  int64_t subtype;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _UIPencilEvent *v16;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  subtype = self->_subtype;
  v7 = CFSTR("squeeze");
  v8 = CFSTR("(unknown)");
  if (subtype == 250)
    v8 = CFSTR("tap");
  if (subtype != 251)
    v7 = v8;
  if (subtype)
    v9 = v7;
  else
    v9 = CFSTR("none");
  objc_msgSend(v5, "appendString:withName:", v9, CFSTR("subtype"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke;
  v14[3] = &unk_1E16B1B50;
  v10 = v5;
  v15 = v10;
  v16 = self;
  v11 = (id)objc_msgSend(v10, "modifyBody:", v14);
  v12 = v10;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionsForDispatch, 0);
  objc_storeStrong((id *)&self->_continuousEventDescriptorForDispatch, 0);
  objc_storeStrong((id *)&self->_deliveryRecordsByDescriptor, 0);
  objc_storeStrong((id *)&self->_countedWindowPointerWithInteractionsWantingFocus, 0);
  objc_storeStrong((id *)&self->_registeredInteractions, 0);
  objc_storeStrong((id *)&self->_doubleTapNotificationGenerator, 0);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
}

@end
