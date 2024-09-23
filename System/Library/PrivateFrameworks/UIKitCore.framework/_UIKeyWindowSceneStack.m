@implementation _UIKeyWindowSceneStack

- (id)keyWindowSceneInStack
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (void)migrateFromEvaluationStrategy:(uint64_t)a3 toEvaluationStrategy:(uint64_t)a4 windowScenesPassingTest:
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "UTF8String");
    _NSStringFromUIKeyWindowEvaluationStrategy(a2);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "UTF8String");

    _NSStringFromUIKeyWindowEvaluationStrategy(a3);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "UTF8String");

    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      v13 = qword_1ECD7C9D8;
      if (!qword_1ECD7C9D8)
      {
        v13 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&qword_1ECD7C9D8);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v31 = v8;
        v32 = 2050;
        v33 = a1;
        v34 = 2082;
        v35 = v10;
        v36 = 2082;
        v37 = v12;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "Stack[%{public}s] %{public}p: Migrate scenes from %{public}s -> %{public}s", buf, 0x2Au);
      }
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      NSAllMapTableValues(*(NSMapTable **)(a1 + 8));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19);
            if (!a4
              || (!v20 ? (v21 = 0) : (v21 = *(_QWORD *)(v20 + 8)),
                  (*(unsigned int (**)(uint64_t, uint64_t))(a4 + 16))(a4, v21)))
            {
              if (v20)
                *(_QWORD *)(v20 + 16) = a3;
            }
            ++v19;
          }
          while (v17 != v19);
          v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          v17 = v22;
        }
        while (v22);
      }

    }
    else
    {
      v23 = qword_1ECD7C9D0;
      if (!qword_1ECD7C9D0)
      {
        v23 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&qword_1ECD7C9D0);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v31 = v8;
        v32 = 2050;
        v33 = a1;
        v34 = 2082;
        v35 = v10;
        v36 = 2082;
        v37 = v12;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_DEFAULT, "Stack[%{public}s] %{public}p: Taking no further action for migration from %{public}s -> %{public}s as there are no scenes", buf, 0x2Au);
      }
    }
  }
}

- (void)pushWindowScene:(uint64_t)a3 withEvaluationStrategy:(void *)a4 forReason:
{
  _BYTE *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  _UIWindowSceneStackRecord *v15;
  id v16;
  uint64_t v17;
  objc_class *v18;
  const char *Name;
  const char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t Node;
  NSObject *v27;
  uint64_t v28;
  int v29;
  _BYTE v30[22];
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a1 && (objc_msgSend(a2, "_hasInvalidated") & 1) == 0)
  {
    v8 = (_BYTE *)qword_1ECD7C9B0;
    if (!qword_1ECD7C9B0)
    {
      v8 = (_BYTE *)(__UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
      atomic_store((unint64_t)v8, (unint64_t *)&qword_1ECD7C9B0);
    }
    if ((*v8 & 1) != 0)
    {
      v17 = objc_msgSend(*(id *)(a1 + 40), "UTF8String");
      v18 = (objc_class *)objc_opt_class();
      Name = class_getName(v18);
      v20 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(a2);
      _NSStringFromUIKeyWindowEvaluationStrategy(a3);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = objc_msgSend(v21, "UTF8String");

      v23 = objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
      v24 = qword_1ECD7C9B8;
      if (!qword_1ECD7C9B8)
      {
        v25 = v23;
        Node = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode);
        v23 = v25;
        v24 = Node - 16;
        atomic_store(v24, (unint64_t *)&qword_1ECD7C9B8);
      }
      if ((*(_BYTE *)v24 & 1) != 0)
      {
        v27 = *(NSObject **)(v24 + 8);
        v28 = v23;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v29 = *(_BYTE *)(a1 + 32) & 1;
          *(_DWORD *)v30 = 136448002;
          *(_QWORD *)&v30[4] = v17;
          *(_WORD *)&v30[12] = 2050;
          *(_QWORD *)&v30[14] = a1;
          v31 = 1026;
          v32 = v29;
          v33 = 2082;
          v34 = Name;
          v35 = 2050;
          v36 = a2;
          v37 = 2082;
          v38 = v20;
          v39 = 2082;
          v40 = v22;
          v41 = 2082;
          v42 = v28;
          _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "Stack[%{public}s] %{public}p: Push window scene on stack affectingApplicationKeyWindow: %{public}d; %{public"
            "}s: %{public}p; scene identity: %{public}s; for evaluation strategy: %{public}s; reason: %{public}s",
            v30,
            0x4Eu);
        }
      }
    }
    if (!*(_QWORD *)(a1 + 8))
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 1);
      v10 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v9;

    }
    if (!*(_QWORD *)(a1 + 16))
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 1);
      v12 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v11;

    }
    objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (_QWORD *)v13;
      *(_QWORD *)(v13 + 24) = mach_absolute_time();
      objc_msgSend(*(id *)(a1 + 16), "removeObject:", v14);
    }
    else
    {
      v15 = [_UIWindowSceneStackRecord alloc];
      if (v15)
      {
        *(_QWORD *)v30 = v15;
        *(_QWORD *)&v30[8] = _UIWindowSceneStackRecord;
        v16 = objc_msgSendSuper2((objc_super *)v30, sel_init);
        v14 = v16;
        if (v16)
        {
          objc_storeStrong((id *)v16 + 1, a2);
          v14[2] = a3;
          v14[3] = mach_absolute_time();
        }
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v14, a2);
    }
    objc_msgSend(*(id *)(a1 + 16), "addObject:", v14);
    -[_UIKeyWindowSceneStack _sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:forReason:](a1, 0, a4);

  }
}

- (void)_sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:(void *)a3 forReason:
{
  void *v6;
  _QWORD v7[5];

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 8), "count") >= 2)
  {
    v6 = *(void **)(a1 + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __99___UIKeyWindowSceneStack__sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene_forReason___block_invoke;
    v7[3] = &unk_1E16B1F78;
    v7[4] = a1;
    objc_msgSend(v6, "sortWithOptions:usingComparator:", 16, v7);
  }
  -[_UIKeyWindowSceneStack _evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:forReason:](a1, a2, a3);
}

- (void)_evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:(void *)a3 forReason:
{
  _BYTE *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  const char *Name;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t Node;
  NSObject *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      v6 = (_BYTE *)qword_1ECD7C9E0;
      if (!qword_1ECD7C9E0)
      {
        v6 = (_BYTE *)(__UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
        atomic_store((unint64_t)v6, (unint64_t *)&qword_1ECD7C9E0);
      }
      if ((*v6 & 1) != 0)
      {
        v12 = objc_msgSend(*(id *)(a1 + 40), "UTF8String");
        v13 = *(void **)(a1 + 24);
        if (v13)
        {
          v14 = (objc_class *)objc_opt_class();
          Name = class_getName(v14);
          v13 = *(void **)(a1 + 24);
        }
        else
        {
          Name = "(nil)";
        }
        v20 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(v13);
        v21 = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
        v22 = qword_1ECD7C9E8;
        if (!qword_1ECD7C9E8)
        {
          v23 = v21;
          Node = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode);
          v21 = v23;
          v22 = Node - 16;
          atomic_store(v22, (unint64_t *)&qword_1ECD7C9E8);
        }
        if ((*(_BYTE *)v22 & 1) != 0)
        {
          v25 = *(NSObject **)(v22 + 8);
          v26 = v21;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v27 = *(_BYTE *)(a1 + 32) & 1;
            v28 = *(_QWORD *)(a1 + 24);
            *(_DWORD *)buf = 136447746;
            v43 = v12;
            v44 = 2050;
            v45 = a1;
            v46 = 1026;
            v47 = v27;
            v48 = 2082;
            v49 = Name;
            v50 = 2050;
            v51 = v28;
            v52 = 2082;
            v53 = v20;
            v54 = 2082;
            v55 = v26;
            _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Stack[%{public}s] %{public}p: Evaluating key window scene in stack affectingApplicationKeyWindow: %{public}d; current: %{public}s: %{public}p; current scene identity: %{public}s; reason: %{public}s",
              buf,
              0x44u);
          }
        }
      }
      if ((a2 & 1) != 0)
        v7 = 0;
      else
        v7 = *(void **)(a1 + 24);
      v8 = v7;
      v36 = 0;
      v37 = &v36;
      v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__4;
      v40 = __Block_byref_object_dispose__4;
      v41 = 0;
      v9 = *(void **)(a1 + 16);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __92___UIKeyWindowSceneStack__evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene_forReason___block_invoke;
      v35[3] = &unk_1E16B1FA0;
      v35[4] = &v36;
      objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, v35);
      v10 = v37[5];
      if (!v10)
        v10 = (uint64_t)v8;
      *(_QWORD *)(a1 + 24) = v10;
      v11 = (_BYTE *)qword_1ECD7C9F0;
      if (!qword_1ECD7C9F0)
      {
        v11 = (_BYTE *)(__UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
        atomic_store((unint64_t)v11, (unint64_t *)&qword_1ECD7C9F0);
      }
      if ((*v11 & 1) != 0)
      {
        v16 = objc_msgSend(*(id *)(a1 + 40), "UTF8String");
        v17 = *(void **)(a1 + 24);
        if (v17)
        {
          v18 = (objc_class *)objc_opt_class();
          v19 = class_getName(v18);
          v17 = *(void **)(a1 + 24);
        }
        else
        {
          v19 = "(nil)";
        }
        v29 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(v17);
        v30 = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
        v31 = qword_1ECD7C9F8;
        if (!qword_1ECD7C9F8)
        {
          v31 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v31, (unint64_t *)&qword_1ECD7C9F8);
        }
        if ((*(_BYTE *)v31 & 1) != 0)
        {
          v32 = *(NSObject **)(v31 + 8);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = *(_BYTE *)(a1 + 32) & 1;
            v34 = *(_QWORD *)(a1 + 24);
            *(_DWORD *)buf = 136447746;
            v43 = v16;
            v44 = 2050;
            v45 = a1;
            v46 = 1026;
            v47 = v33;
            v48 = 2082;
            v49 = v19;
            v50 = 2050;
            v51 = v34;
            v52 = 2082;
            v53 = v29;
            v54 = 2082;
            v55 = v30;
            _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "Stack[%{public}s] %{public}p: Evaluated key window scene in stack affectingApplicationKeyWindow: %{public}d; new: %{public}s: %{public}p; new scene identity: %{public}s; reason: %{public}s",
              buf,
              0x44u);
          }
        }
      }
      _Block_object_dispose(&v36, 8);

    }
    else
    {
      *(_QWORD *)(a1 + 24) = 0;
    }
  }
}

- (id)_initWithName:(char)a3 affectsApplicationKeyWindow:
{
  id *v5;
  id *v6;
  char v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)_UIKeyWindowSceneStack;
  v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong(v5 + 5, a2);
    *((_BYTE *)v6 + 32) = (_BYTE)v6[4] & 0xFE | a3;
    if (_UIApplicationMayVendViews())
      v7 = 2;
    else
      v7 = 0;
    *((_BYTE *)v6 + 32) = (_BYTE)v6[4] & 0xFD | v7;
  }
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIKeyWindowSceneStack descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _UIKeyWindowSceneStack *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", self->_name, CFSTR("name"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E16B1B50;
  v7 = v5;
  v12 = v7;
  v13 = self;
  v8 = (id)objc_msgSend(v7, "modifyBody:", v11);
  v9 = v7;

  return v9;
}

- (_UIKeyWindowSceneStack)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyWindowSceneStack.m"), 173, CFSTR("init is not allowed on _UIKeyWindowSceneStack"));

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIKeyWindowSceneStack debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIKeyWindowSceneStack succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_name, CFSTR("name"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", *(_BYTE *)&self->_sceneStackFlags & 1, CFSTR("affectsApplicationKeyWindow"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", (*(_BYTE *)&self->_sceneStackFlags >> 1) & 1, CFSTR("hasViewServiceEntitlement"));
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMapTable count](self->_recordsByWindowScene, "count"), CFSTR("windowSceneRecords.count"));
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIKeyWindowSceneStack descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)removeWindowScene:(void *)a3 forReason:
{
  void *v6;
  _BYTE *v7;
  uint64_t v8;
  objc_class *v9;
  const char *Name;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t Node;
  NSObject *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (_BYTE *)qword_1ECD7C9C0;
      if (!qword_1ECD7C9C0)
      {
        v7 = (_BYTE *)(__UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
        atomic_store((unint64_t)v7, (unint64_t *)&qword_1ECD7C9C0);
      }
      if ((*v7 & 1) != 0)
      {
        v8 = objc_msgSend(*(id *)(a1 + 40), "UTF8String");
        v9 = (objc_class *)objc_opt_class();
        Name = class_getName(v9);
        v11 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(a2);
        v12 = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
        v13 = qword_1ECD7C9C8;
        if (!qword_1ECD7C9C8)
        {
          v14 = v12;
          Node = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode);
          v12 = v14;
          v13 = Node - 16;
          atomic_store(v13, (unint64_t *)&qword_1ECD7C9C8);
        }
        if ((*(_BYTE *)v13 & 1) != 0)
        {
          v16 = *(NSObject **)(v13 + 8);
          v17 = v12;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v18 = *(_BYTE *)(a1 + 32) & 1;
            v19 = 136447746;
            v20 = v8;
            v21 = 2050;
            v22 = a1;
            v23 = 1026;
            v24 = v18;
            v25 = 2082;
            v26 = Name;
            v27 = 2050;
            v28 = a2;
            v29 = 2082;
            v30 = v11;
            v31 = 2082;
            v32 = v17;
            _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Stack[%{public}s] %{public}p: Remove window scene from stack affectingApplicationKeyWindow: %{public}d;  %"
              "{public}s: %{public}p: scene identity: %{public}s; reason: %{public}s",
              (uint8_t *)&v19,
              0x44u);
          }
        }
      }
      objc_msgSend(*(id *)(a1 + 8), "removeObjectForKey:", a2);
      objc_msgSend(*(id *)(a1 + 16), "removeObject:", v6);
      -[_UIKeyWindowSceneStack _sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:forReason:](a1, 1, a3);
    }

  }
}

- (id)keyWindowSceneInStackPassingTest:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (!a1)
    return 0;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_keyWindowSceneInStackPassingTest_, a1, CFSTR("_UIKeyWindowSceneStack.m"), 536, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("test"));

  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  v4 = *(void **)(a1 + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___UIKeyWindowSceneStack_keyWindowSceneInStackPassingTest___block_invoke;
  v8[3] = &unk_1E16B1FC8;
  v8[4] = a2;
  v8[5] = &v9;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v8);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_orderedRecords, 0);
  objc_storeStrong((id *)&self->_recordsByWindowScene, 0);
}

@end
