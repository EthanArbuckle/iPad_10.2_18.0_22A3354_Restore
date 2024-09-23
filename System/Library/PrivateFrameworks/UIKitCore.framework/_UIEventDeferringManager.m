@implementation _UIEventDeferringManager

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (id)fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:(id *)a1
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v12;
  NSObject *v13;
  int v14;
  id *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1 || !objc_msgSend(a1[13], "shouldAllowFallbackWindowForEnvironment:", a2))
    return 0;
  objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a2, "isEqual:", v4);

  if (v5)
  {
    objc_msgSend(a1, "windowHostingScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)UIApp, "_keyWindowForScreen:", objc_msgSend(v6, "_screen"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_windowHostingScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v6)
      v9 = v7;
    else
      v9 = 0;
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }
  v12 = fallbackLocalDeferringTargetWindowIfPermittedForEnvironment____s_category;
  if (!fallbackLocalDeferringTargetWindowIfPermittedForEnvironment____s_category)
  {
    v12 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v12, (unint64_t *)&fallbackLocalDeferringTargetWindowIfPermittedForEnvironment____s_category);
  }
  if ((*(_BYTE *)v12 & 1) != 0)
  {
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 134349570;
      v15 = a1;
      v16 = 2114;
      v17 = a2;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}@] Returning fallback target window: %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  return v10;
}

- (id)currentLocalDeferringTargetWindowMatchingEnvironment:(id)a3 deferringToken:
{
  uint64_t v4;
  id *v5;
  id WeakRetained;
  id v7;
  id v8;
  void *v9;
  void *v10;

  if (a1)
  {
    -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordForEnvironment:forcePreviousHardwareIdentifier:](a1, a2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (id *)v4;
    if (v4 && (WeakRetained = objc_loadWeakRetained((id *)(v4 + 32)), WeakRetained, WeakRetained == a3))
    {
      v8 = v5[2];
      v9 = v8;
      if (v8)
        v10 = (void *)*((_QWORD *)v8 + 9);
      else
        v10 = 0;
      v7 = v10;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_localTargetWindowDidAttachContext:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  -[_UIEventDeferringManager windowHostingScene](self, "windowHostingScene");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v6, "_windowHostingScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIEventDeferringManager _environmentsForLocalTargetWindowPointer:]((uint64_t)self, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v20 = v10;
          v21 = v8;
          v12 = objc_msgSend(v6, "_contextId");
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v19 = v11;
          obj = v11;
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v24;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v24 != v15)
                  objc_enumerationMutation(obj);
                v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: recreating %@: context attached for window: %p; contextID: 0x%X"),
                  objc_opt_class(),
                  self,
                  v17,
                  v6,
                  v12);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UIEventDeferringManager _recreateEventDeferringRecordsInEnvironment:removingRecreationReason:forReason:]((uint64_t)self, v17, CFSTR("_UIEventDeferringRecreationReasonDetachedContext"), v18);

                ++v16;
              }
              while (v14 != v16);
              v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            }
            while (v14);
          }

          v10 = v20;
          v8 = v21;
          v11 = v19;
        }

      }
    }
  }

}

- (id)_currentLocalOrCompatibilityRecordForEnvironment:(int)a3 forcePreviousHardwareIdentifier:
{
  id *v3;
  void *v4;
  const __CFString *v5;

  v3 = (id *)a1;
  if (a1)
  {
    -[_UIEventDeferringManager _currentLocalRecordsMatchingEnvironment:forcePreviousHardwareIdentifier:](a1, a2, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3[13], "wantsLocalIdealRules") & 1) != 0)
    {
      v5 = CFSTR("LocalIdealRecord");
    }
    else
    {
      if (!objc_msgSend(v3[13], "wantsLocalCompatibilityRules"))
      {
        v3 = 0;
        goto LABEL_8;
      }
      v5 = CFSTR("LocalCompatibilityRecord");
    }
    objc_msgSend(v4, "objectForKey:", v5);
    v3 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  }
  return v3;
}

- (id)_currentLocalRecordsMatchingEnvironment:(int)a3 forcePreviousHardwareIdentifier:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  objc_msgSend(*(id *)(a1 + 16), "objectForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__34;
  v24 = __Block_byref_object_dispose__34;
  v25 = 0;
  if (a3)
  {
    v7 = *(id *)(a1 + 56);
  }
  else
  {
    -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)a1, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (v7)
    objc_msgSend(MEMORY[0x1E0D00CF8], "displayWithHardwareIdentifier:", v7);
  else
    objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _eventDeferringCompatibilityQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100___UIEventDeferringManager__currentLocalRecordsMatchingEnvironment_forcePreviousHardwareIdentifier___block_invoke;
  block[3] = &unk_1E16B9698;
  v19 = &v20;
  v11 = v9;
  v17 = v11;
  v18 = a2;
  dispatch_sync(v10, block);

  if (v6 || v21[5])
  {
    v12 = (void *)objc_opt_new();
    v13 = v12;
    if (v6)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("LocalIdealRecord"));
    v14 = v21[5];
    if (v14)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("LocalCompatibilityRecord"));
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)localEventDeferringTargetWindowForEnvironment:(id)a3
{
  void *v3;
  void *v4;
  id *v5;
  void *v6;

  if (self)
  {
    -[_UIEventDeferringManager windowHostingScene](self, "windowHostingScene", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  -[UIWindowScene _keyWindow](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_displayHardwareIndentifierAccountingForNotFinalizedChange:(unsigned __int8 *)a1
{
  id *v2;
  int HasNotFinalized;
  void *v5;
  id v6;
  void *v7;

  v2 = (id *)a1;
  if (a1)
  {
    HasNotFinalized = -[_UIEventDeferringManager _displayHardwareIndentifierHasNotFinalizedChange](a1);
    if (a2 && HasNotFinalized)
    {
      v2 = (id *)v2[7];
    }
    else
    {
      objc_msgSend(v2, "windowHostingScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v5, "_screen");

      objc_msgSend(v6, "displayConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "hardwareIdentifier");
      v2 = (id *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v2;
}

- (uint64_t)_displayHardwareIndentifierHasNotFinalizedChange
{
  void *v2;
  id v3;
  void *v4;
  int v5;
  unsigned int v6;

  objc_msgSend(a1, "windowHostingScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "_screen");

  objc_msgSend(v3, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isExternal");
  v6 = a1[80];
  if ((v6 & 0x10) != 0)
    return 0;
  else
    return v5 & (v6 >> 3);
}

- (_UISceneUIWindowHosting)windowHostingScene
{
  return (_UISceneUIWindowHosting *)objc_loadWeakRetained((id *)&self->_scene);
}

- (id)_descriptorForCompatibility:(void *)a3 environment:(uint64_t)a4 deferringToken:
{
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  void *v31;
  unint64_t v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _UIEventDeferringDescriptor *v38;
  void *v39;
  id *v40;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  int v45;
  NSObject *v46;
  NSObject *v47;
  int v48;
  void *v49;
  char v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return (id *)0;
  if (a4)
  {
    v8 = *(_QWORD *)(a4 + 48);
    v9 = v8 != 0;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)a1, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 1)
  {
    -[_UIEventDeferringManager _localTargetWindowForEnvironment:consultingFallbackIfPermitted:]((uint64_t)a1, a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*((id *)a1 + 13), "shouldAllowFallbackWindowForEnvironment:", a3) & 1) != 0)
    {
      -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordForEnvironment:forcePreviousHardwareIdentifier:]((uint64_t)a1, (uint64_t)a3, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11
        || ((v12 = (void *)v11, v13 = *(id *)(v11 + 16), (v14 = v13) == 0)
          ? (v15 = 0)
          : (v15 = (void *)*((_QWORD *)v13 + 9)),
            v16 = v15,
            v14,
            v12,
            !v16))
      {
        v16 = v10;
      }
      v17 = qword_1ECD7D118;
      if (!qword_1ECD7D118)
      {
        v17 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD7D118);
      }
      if ((*(_BYTE *)v17 & 1) != 0)
      {
        v18 = *(NSObject **)(v17 + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = v18;
          *(_DWORD *)buf = 134349826;
          v52 = a1;
          v53 = 2114;
          v54 = a3;
          v55 = 1026;
          v56 = objc_msgSend(v10, "_contextId");
          v57 = 2114;
          v58 = v10;
          _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}@] Returning fallback remote predicate window: contextID: 0x%{public}X; %{public}@",
            buf,
            0x26u);

        }
      }
    }
    else
    {
      v21 = qword_1ECD7D110;
      if (!qword_1ECD7D110)
      {
        v21 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&qword_1ECD7D110);
      }
      if ((*(_BYTE *)v21 & 1) != 0)
      {
        v46 = *(NSObject **)(v21 + 8);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = v46;
          *(_DWORD *)buf = 134349826;
          v52 = a1;
          v53 = 2114;
          v54 = a3;
          v55 = 1026;
          v56 = objc_msgSend(v10, "_contextId");
          v57 = 2114;
          v58 = v10;
          _os_log_impl(&dword_185066000, v47, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}@] Returning remote predicate window: contextID: 0x%{public}X; %{public}@",
            buf,
            0x26u);

        }
      }
      v16 = v10;
    }

    v20 = objc_msgSend(v16, "_contextId");
  }
  else
  {
    v16 = 0;
    v20 = 0;
  }
  v50 = a2;
  v48 = v20;
  if (((v9 | a2) & 1) != 0)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(a1, "windowHostingScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_FBSScene");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identityToken");
    v25 = a3;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    a3 = v25;
  }
  if (v8 == 1)
  {
    if (a4)
      v27 = *(void **)(a4 + 64);
    else
      v27 = 0;
    v28 = v27;
    v29 = objc_msgSend(v28, "pid");

    if (!v9)
      goto LABEL_29;
  }
  else
  {
    v29 = 0;
    if (!v9)
    {
LABEL_29:
      v30 = a3;
      -[_UIEventDeferringManager _localTargetWindowForEnvironment:consultingFallbackIfPermitted:]((uint64_t)a1, a3, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", sel__descriptorForCompatibility_environment_deferringToken_, a1, CFSTR("_UIEventDeferringManager.m"), 2978, CFSTR("[%p] [%@] %s: Missing target window for environment"), a1, v30, "-[_UIEventDeferringManager _descriptorForCompatibility:environment:deferringToken:]");

      }
      v32 = qword_1ECD7D120;
      if (!qword_1ECD7D120)
      {
        v32 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v32, (unint64_t *)&qword_1ECD7D120);
      }
      if ((*(_BYTE *)v32 & 1) != 0)
      {
        v43 = *(NSObject **)(v32 + 8);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = v43;
          v45 = objc_msgSend(v31, "_contextId");
          *(_DWORD *)buf = 134349826;
          v52 = a1;
          v53 = 2114;
          v54 = v30;
          v55 = 1026;
          v56 = v45;
          v57 = 2114;
          v58 = v31;
          _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}@] Local target window: contextID: 0x%{public}X; %{public}@",
            buf,
            0x26u);

        }
      }
      v33 = objc_msgSend(v31, "_contextId");
      v34 = 0;
      goto LABEL_45;
    }
  }
  v30 = a3;
  if (a4)
    v35 = *(void **)(a4 + 64);
  else
    v35 = 0;
  v36 = v35;
  objc_msgSend(v36, "token");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v37, "_isIdentifierOfCAContext"))
  {
    v33 = objc_msgSend(v37, "_identifierOfCAContext");
LABEL_43:
    v34 = 0;
    goto LABEL_44;
  }
  if (!objc_msgSend(v37, "_isString"))
  {
    v33 = 0;
    goto LABEL_43;
  }
  objc_msgSend(v37, "_string");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
LABEL_44:

  v31 = 0;
LABEL_45:
  v38 = [_UIEventDeferringDescriptor alloc];
  if (a4)
    v39 = *(void **)(a4 + 48);
  else
    v39 = 0;
  v40 = -[_UIEventDeferringDescriptor _initWithScope:compatibility:environment:displayHardwareIdentifier:predicateSceneIdentityString:predicateWindowPointer:predicateContextID:targetPID:targetSceneIdentityString:targetWindowPointer:targetContextID:](v38, v39, v50, v30, v49, v22, v16, v48, v29, v34, v31, v33);

  return v40;
}

- (id)internalBehavior
{
  if (a1)
    a1 = (id *)a1[13];
  return a1;
}

- (id)_trackedLocalTargetWindowPointerForEnvironment:(uint64_t)a1
{
  void *v3;
  void *v4;

  if (a1)
  {
    -[_UIEventDeferringManager _trackedLocalTargetWindowPointers](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_trackedLocalTargetWindowPointers
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    v3 = objc_opt_new();
    v4 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v3;

    v2 = *(void **)(a1 + 40);
  }
  return v2;
}

- (id)_targetForDescriptor:(uint64_t)a1
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D00D90]);
    v5 = v4;
    if (a2)
    {
      if (*(int *)(a2 + 16) >= 1)
        objc_msgSend(v4, "setPid:");
      if (*(_DWORD *)(a2 + 20))
      {
        v6 = *(id *)(a2 + 64);

        if (v6)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__targetForDescriptor_, a1, CFSTR("_UIEventDeferringManager.m"), 3054, CFSTR("[%p] %s: Descriptor should not specify a target contextId and a target scene identity: %@"), a1, "-[_UIEventDeferringManager _targetForDescriptor:]", a2);

        }
        if (*(_DWORD *)(a2 + 20))
        {
          objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForIdentifierOfCAContext:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setToken:", v8);

        }
      }
      v9 = *(void **)(a2 + 64);
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0D00CB8];
      if (a2)
        v12 = *(void **)(a2 + 64);
      else
        v12 = 0;
      v13 = v12;
      objc_msgSend(v11, "tokenForString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setToken:", v14);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)_shouldDisableNewRecord:(_QWORD *)a3 outRecreationReasons:
{
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  id v16;
  uint64_t *WeakRetained;
  uint64_t *v18;
  uint64_t v19;
  id *v20;
  id v21;
  id v22;
  int v23;

  if (a1)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__shouldDisableNewRecord_outRecreationReasons_, a1, CFSTR("_UIEventDeferringManager.m"), 3067, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outRecreationReasons"));

    }
    v6 = (void *)objc_opt_new();
    if (-[_UIEventDeferringManager _displayHardwareIndentifierHasNotFinalizedChange]((unsigned __int8 *)a1))
      objc_msgSend(v6, "addObject:", CFSTR("_UIEventDeferringRecreationReasonChangingScreenIdentifier"));
    if (a2)
    {
      v7 = a2[2];
      if (v7 && (v8 = v7[3], v7, v8))
      {
        if (v8 != 1)
        {
          v12 = 0;
          goto LABEL_20;
        }
        v9 = a2[2];
        v10 = v9;
        if (v9)
          v11 = (void *)*((_QWORD *)v9 + 7);
        else
          v11 = 0;
        v8 = 1;
      }
      else
      {
        v15 = a2[2];
        v10 = v15;
        if (v15)
        {
          v8 = 0;
          v11 = (void *)*((_QWORD *)v15 + 9);
        }
        else
        {
          v11 = 0;
          v8 = 0;
        }
      }
    }
    else
    {
      v11 = 0;
      v8 = 0;
      v10 = 0;
    }
    v12 = v11;

LABEL_20:
    if (!objc_msgSend(v12, "_contextId"))
      objc_msgSend(v6, "addObject:", CFSTR("_UIEventDeferringRecreationReasonDetachedContext"));
    if (objc_msgSend(v6, "count") || v8 != 1)
      goto LABEL_31;
    v16 = *(id *)(a1 + 104);
    if (a2)
    {
      WeakRetained = (uint64_t *)objc_loadWeakRetained(a2 + 4);
      v18 = WeakRetained;
      if (WeakRetained)
        v19 = WeakRetained[5];
      else
        v19 = 0;
      v20 = (id *)a2[2];
      a2 = v20;
      if (v20)
      {
        v21 = v20[4];
        goto LABEL_29;
      }
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
    v21 = 0;
LABEL_29:
    v22 = v21;
    v23 = objc_msgSend(v16, "shouldSuppressRemoteRuleForOwningElement:inEnvironment:", v19, v22);

    if (v23)
      objc_msgSend(v6, "addObject:", CFSTR("_UIEventDeferringRecreationReasonBehaviorDelegateSuppressed"));
LABEL_31:
    *a3 = (id)objc_msgSend(v6, "copy");
    v14 = objc_msgSend(v6, "count") != 0;

    return v14;
  }
  return 0;
}

- (void)_setLocalRecord:(uint64_t)a3 forEnvironment:
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 96))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__setLocalRecord_forEnvironment_, a1, CFSTR("_UIEventDeferringManager.m"), 2384, CFSTR("[%p] %s: Invalid state. Saving records without a transaction: %@"), a1, "-[_UIEventDeferringManager _setLocalRecord:forEnvironment:]", a1);

    }
    objc_msgSend(*(id *)(a1 + 16), "objectForKey:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__setLocalRecord_forEnvironment_, a1, CFSTR("_UIEventDeferringManager.m"), 2388, CFSTR("[%p] %s: Invalid to set a new local record when one already exists for the environment: %@"), a1, "-[_UIEventDeferringManager _setLocalRecord:forEnvironment:]", a3, v11);

    }
    v6 = *(void **)(a1 + 16);
    if (!v6)
    {
      v7 = objc_opt_new();
      v8 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v7;

      v6 = *(void **)(a1 + 16);
    }
    objc_msgSend(v6, "setObject:forKey:", a2, a3);

  }
}

- (id)_predicateForDescriptor:(uint64_t)a1
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v26;

  if (!a1)
  {
    v5 = 0;
    return v5;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0D00D80]);
  v5 = v4;
  if (a2)
  {
    v6 = *(id *)(a2 + 32);
    objc_msgSend(v5, "setEnvironment:", v6);

    v7 = *(id *)(a2 + 40);
    v8 = (void *)MEMORY[0x1E0D00CF8];
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D00CF8], "displayWithHardwareIdentifier:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v4, "setEnvironment:", 0);
    v8 = (void *)MEMORY[0x1E0D00CF8];
  }
  objc_msgSend(v8, "builtinDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
LABEL_8:
  objc_msgSend(v5, "setDisplay:", v9);

  if (a2)
  {
    v10 = *(_QWORD *)(a2 + 24) == 0;
    v11 = *(void **)(a2 + 48);
    v12 = *(_QWORD *)(a2 + 56) == 0;
  }
  else
  {
    v11 = 0;
    v12 = 1;
    v10 = 1;
  }
  v13 = v11;
  v14 = v13 == 0;

  if (v12)
  {
    if (a2)
      v15 = *(void **)(a2 + 48);
    else
      v15 = 0;
    v16 = v15;
    v14 = v16 != 0;

  }
  if (v10)
  {
    if (a2)
    {
      if (*(_BYTE *)(a2 + 8))
        v14 = 0;
      v17 = *(_BYTE *)(a2 + 8) != 0;
      if (v14)
        goto LABEL_22;
    }
    else
    {
      v17 = 0;
      if (v14)
        goto LABEL_22;
    }
    if (!v17)
      goto LABEL_31;
  }
  else if (v13)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__predicateForDescriptor_, a1, CFSTR("_UIEventDeferringManager.m"), 3033, CFSTR("[%p] %s: Invalid descriptor: %@"), a1, "-[_UIEventDeferringManager _predicateForDescriptor:]", a2);

  }
LABEL_22:
  if (a2)
  {
    if (*(_DWORD *)(a2 + 12))
    {
      objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForIdentifierOfCAContext:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setToken:", v18);

    }
    v19 = *(void **)(a2 + 48);
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0D00CB8];
    if (a2)
      v22 = *(void **)(a2 + 48);
    else
      v22 = 0;
    v23 = v22;
    objc_msgSend(v21, "tokenForString:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setToken:", v24);

  }
  return v5;
}

- (void)setNeedsRemoteEventDeferringRuleComparisonInEnvironments:(id)a3 forBehaviorDelegate:(id)a4 withReason:(id)a5
{
  id v10;
  objc_class *v11;
  const char *Name;
  id v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  _BYTE *v17;
  id *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  _UIEventDeferringManager *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_deferringManagerFlags & 1) == 0)
  {
    if ((_UIEventDeferringSystemShellBehaviorIsAllowedForProcess() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringManager.m"), 3858, CFSTR("[%p] %s: System shell behavior is not allowed for this process"), self, "-[_UIEventDeferringManager setNeedsRemoteEventDeferringRuleComparisonInEnvironments:forBehaviorDelegate:withReason:]");

    }
    +[_UIEventDeferringManager systemShellBehaviorDelegate](_UIEventDeferringManager, "systemShellBehaviorDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringManager.m"), 3861, CFSTR("[%p] %s: Incoming delegate does not match existing delegate: %@"), self, "-[_UIEventDeferringManager setNeedsRemoteEventDeferringRuleComparisonInEnvironments:forBehaviorDelegate:withReason:]", a4);

    }
    v11 = (objc_class *)objc_opt_class();
    Name = class_getName(v11);
    v13 = objc_retainAutorelease(a5);
    v14 = objc_msgSend(v13, "UTF8String");
    v15 = setNeedsRemoteEventDeferringRuleComparisonInEnvironments_forBehaviorDelegate_withReason____s_category[0];
    if (!setNeedsRemoteEventDeferringRuleComparisonInEnvironments_forBehaviorDelegate_withReason____s_category[0])
    {
      v15 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, setNeedsRemoteEventDeferringRuleComparisonInEnvironments_forBehaviorDelegate_withReason____s_category);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349826;
      v37 = self;
      v38 = 2082;
      v39 = Name;
      v40 = 2050;
      v41 = a4;
      v42 = 2082;
      v43 = v14;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] Remote event deferring rule comparison requested by system shell behavior delegate: <%{public}s: %{public}p>; reason: %{public}s",
        buf,
        0x2Au);
    }
    v17 = -[_UIEventDeferringOwnershipToken _initWithOwner:scope:environments:target:reason:]([_UIEventDeferringOwnershipToken alloc], (uint64_t)self, 1, a3, 0, v13);
    v18 = (id *)v17;
    if (v17)
    {
      v19 = *((_QWORD *)v17 + 6);
      v20 = *((id *)v17 + 7);
      v21 = v18[8];
      v22 = v18[9];
    }
    else
    {
      v21 = 0;
      v19 = 0;
      v20 = 0;
      v22 = 0;
    }
    v23 = v22;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]((uint64_t)self, setNeedsRemoteEventDeferringRuleComparisonInEnvironments_forBehaviorDelegate_withReason__actions, 5, v19, v18, v20, v21, CFSTR("_UIEventDeferringRecreationReasonNoLongerTopRemoteRecord"), 0, v23);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v24 = a3;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(v24);
          if (v18)
          {
            objc_msgSend(v18[1], "removeObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
            if (!*((_BYTE *)v18 + 16) && !objc_msgSend(v18[1], "count"))
              *((_BYTE *)v18 + 16) = 1;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v26);
    }

  }
}

+ (_UIEventDeferringSystemShellBehaviorDelegate)systemShellBehaviorDelegate
{
  return (_UIEventDeferringSystemShellBehaviorDelegate *)(id)qword_1ECD7D0E8;
}

- (void)_stopObservingContextForLocalTargetWindowInEnvironment:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a2, "description");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "UTF8String");

    v6 = _stopObservingContextForLocalTargetWindowInEnvironment____s_category;
    if (!_stopObservingContextForLocalTargetWindowInEnvironment____s_category)
    {
      v6 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_stopObservingContextForLocalTargetWindowInEnvironment____s_category);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v12 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349314;
        v20 = a1;
        v21 = 2082;
        v22 = v5;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}s] Stop observing context for local target window", buf, 0x16u);
      }
    }
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __83___UIEventDeferringManager__stopObservingContextForLocalTargetWindowInEnvironment___block_invoke;
    v16 = &unk_1E16BABF0;
    v17 = a1;
    v18 = v5;
    -[_UIEventDeferringManager _trackedLocalTargetWindowPointerForEnvironment:](a1, (uint64_t)a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[_UIEventDeferringManager _trackedLocalTargetWindowPointers](a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", a2, v13, v14, v15, v16, v17, v18);

      -[_UIEventDeferringManager _localTargetWindowPointersUnderObservation](a1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v7);

      -[_UIEventDeferringManager _localTargetWindowPointersUnderObservation](a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countForObject:", v7);

      if (!v11)
        __83___UIEventDeferringManager__stopObservingContextForLocalTargetWindowInEnvironment___block_invoke((uint64_t)&v13, v7);
    }

  }
}

- (id)_localTargetWindowPointersUnderObservation
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(a1 + 48);
  if (!v2)
  {
    v3 = objc_opt_new();
    v4 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v3;

    v2 = *(void **)(a1 + 48);
  }
  return v2;
}

- (id)beginAndEndLocalEventDeferringForToken:(void *)a3 withReason:
{
  id v3;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *i;
  id v17;
  uint64_t v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *k;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v3 = a1;
  v70 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((a1[80] & 1) != 0)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      if (a2)
        v14 = *(void **)(a2 + 56);
      else
        v14 = 0;
      v9 = v14;
      v3 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
      if (v3)
      {
        v15 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v3; i = (char *)i + 1)
          {
            if (*(_QWORD *)v55 != v15)
              objc_enumerationMutation(v9);
            if (a2)
            {
              objc_msgSend(*(id *)(a2 + 8), "removeObject:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i));
              if (!*(_BYTE *)(a2 + 16) && !objc_msgSend(*(id *)(a2 + 8), "count"))
                *(_BYTE *)(a2 + 16) = 1;
            }
          }
          v3 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
        }
        while (v3);
      }
    }
    else
    {
      v41 = a3;
      if (a2)
      {
        if (*(_QWORD *)(a2 + 48))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", sel_beginAndEndLocalEventDeferringForToken_withReason_, v3, CFSTR("_UIEventDeferringManager.m"), 3677, CFSTR("[%p] %s: Attempting to begin and end local event deferring for a non-local token: %@"), v3, "-[_UIEventDeferringManager beginAndEndLocalEventDeferringForToken:withReason:]", a2, v41);

        }
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v5 = *(void **)(a2 + 56);
      }
      else
      {
        v5 = 0;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
      }
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v8; ++j)
          {
            if (*(_QWORD *)v51 != v10)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
            -[_UIEventDeferringManager _localTargetWindowForEnvironment:consultingFallbackIfPermitted:]((uint64_t)v3, v12, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
            {
              if (!v9)
                v9 = (id)objc_opt_new();
              objc_msgSend(v9, "addObject:", v12);
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
        }
        while (v8);
      }
      else
      {
        v9 = 0;
      }

      v17 = objc_retainAutorelease(v41);
      v18 = objc_msgSend(v17, "UTF8String");
      if (v9 && objc_msgSend(v9, "count"))
      {
        v19 = qword_1ECD7D198;
        if (!qword_1ECD7D198)
        {
          v19 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v19, (unint64_t *)&qword_1ECD7D198);
        }
        v20 = *(NSObject **)(v19 + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349570;
          v60 = v3;
          v61 = 2114;
          v62 = (uint64_t)v9;
          v63 = 2082;
          v64 = v18;
          _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "[%{public}p] Exiting request to begin and end local event deferring as environments are missing local target windows: %{public}@; request reason: %{public}s",
            buf,
            0x20u);
        }
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        if (a2)
          v21 = *(void **)(a2 + 56);
        else
          v21 = 0;
        v22 = v21;
        v3 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v67, 16);
        if (v3)
        {
          v23 = *(_QWORD *)v47;
          do
          {
            for (k = 0; k != v3; k = (char *)k + 1)
            {
              if (*(_QWORD *)v47 != v23)
                objc_enumerationMutation(v22);
              if (a2)
              {
                objc_msgSend(*(id *)(a2 + 8), "removeObject:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)k));
                if (!*(_BYTE *)(a2 + 16) && !objc_msgSend(*(id *)(a2 + 8), "count"))
                  *(_BYTE *)(a2 + 16) = 1;
              }
            }
            v3 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v67, 16);
          }
          while (v3);
        }
      }
      else
      {
        v25 = qword_1ECD7D1A0;
        if (!qword_1ECD7D1A0)
        {
          v25 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v25, (unint64_t *)&qword_1ECD7D1A0);
        }
        v26 = *(NSObject **)(v25 + 8);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          if (a2)
            v28 = *(void **)(a2 + 56);
          else
            v28 = 0;
          v29 = v28;
          v30 = objc_msgSend(v29, "count");
          *(_DWORD *)buf = 134349826;
          v60 = v3;
          v61 = 2050;
          v62 = a2;
          v63 = 2048;
          v64 = v30;
          v65 = 2082;
          v66 = v18;
          _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}p] Beginning and ending local event deferring requested for token: %{public}p; environments: %lu; "
            "reason: %{public}s",
            buf,
            0x2Au);

        }
        if (a2)
        {
          v22 = *(id *)(a2 + 40);
          v31 = *(void **)(a2 + 56);
        }
        else
        {
          v22 = 0;
          v31 = 0;
        }
        v32 = v31;
        -[_UIEventDeferringManager beginLocalEventDeferringInEnvironments:forOwningInterfaceElement:withReason:]((uint64_t)v3, v32, v22, v17);
        v3 = (id)objc_claimAutoreleasedReturnValue();

        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        if (a2)
          v33 = *(void **)(a2 + 56);
        else
          v33 = 0;
        v34 = v33;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v43;
          do
          {
            for (m = 0; m != v36; ++m)
            {
              if (*(_QWORD *)v43 != v37)
                objc_enumerationMutation(v34);
              if (a2)
              {
                objc_msgSend(*(id *)(a2 + 8), "removeObject:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * m));
                if (!*(_BYTE *)(a2 + 16) && !objc_msgSend(*(id *)(a2 + 8), "count"))
                  *(_BYTE *)(a2 + 16) = 1;
              }
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
          }
          while (v36);
        }

      }
    }

  }
  return v3;
}

- (_BYTE)beginLocalEventDeferringInEnvironments:(void *)a3 forOwningInterfaceElement:(void *)a4 withReason:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  _BYTE *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  _BYTE *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1 || (*(_BYTE *)(a1 + 80) & 1) != 0)
    return 0;
  _UIEventDeferringAssertForInvalidOwningInterfaceElement(a3);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = a2;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[_UIEventDeferringManager _localTargetWindowForEnvironment:consultingFallbackIfPermitted:](a1, v13, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          if (!v10)
            v10 = (void *)objc_opt_new();
          objc_msgSend(v10, "addObject:", v13);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v16 = objc_retainAutorelease(a4);
  v17 = objc_msgSend(v16, "UTF8String");
  if (v10 && objc_msgSend(v10, "count"))
  {
    v18 = qword_1ECD7D188;
    if (!qword_1ECD7D188)
    {
      v18 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&qword_1ECD7D188);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349570;
      v38 = a1;
      v39 = 2114;
      v40 = v10;
      v41 = 2082;
      v42 = v17;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "[%{public}p] Exiting request to begin local event deferring as environments are missing local target windows: %{public}@; request reason: %{public}s",
        buf,
        0x20u);
    }
    v20 = 0;
  }
  else
  {
    v20 = -[_UIEventDeferringOwnershipToken _initWithOwner:scope:environments:target:reason:]([_UIEventDeferringOwnershipToken alloc], (uint64_t)a3, 0, v7, 0, v16);
    v21 = qword_1ECD7D190;
    if (!qword_1ECD7D190)
    {
      v21 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&qword_1ECD7D190);
    }
    v22 = *(NSObject **)(v21 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      if (v20)
        v24 = (void *)*((_QWORD *)v20 + 7);
      else
        v24 = 0;
      v25 = v24;
      v26 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 134349826;
      v38 = a1;
      v39 = 2050;
      v40 = v20;
      v41 = 2048;
      v42 = v26;
      v43 = 2082;
      v44 = v17;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}p] Begin local event deferring requested for token: %{public}p; environments: %lu; reason: %{public}s",
        buf,
        0x2Au);

    }
    if (v20)
    {
      v27 = *((_QWORD *)v20 + 6);
      v28 = *((id *)v20 + 7);
      v29 = *((id *)v20 + 8);
      v30 = (void *)*((_QWORD *)v20 + 9);
    }
    else
    {
      v29 = 0;
      v27 = 0;
      v28 = 0;
      v30 = 0;
    }
    v31 = v30;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:](a1, beginLocalEventDeferringInEnvironments_forOwningInterfaceElement_withReason__actions, 5, v27, v20, v28, v29, CFSTR("_UIEventDeferringRecreationReasonTopRemoteElementNotVisible"), 0, v31);

  }
  return v20;
}

- (void)_processEventDeferringActions:(uint64_t)a3 actionsCount:(uint64_t)a4 inScope:(_QWORD *)a5 forDeferringToken:(void *)a6 environments:(void *)a7 target:(void *)a8 addingRecreationReason:(void *)a9 removingRecreationReason:(void *)a10 forReason:
{
  uint64_t v15;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  id v32;
  uint64_t *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void (*v51)(_QWORD *, const __CFString *);
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  BOOL v60;
  _QWORD *v61;
  id v62;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD aBlock[11];
  uint8_t v70[4];
  uint64_t v71;
  __int16 v72;
  void *v73;
  uint8_t v74[128];
  _BYTE buf[24];
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v15 = a3;
  if (!objc_msgSend(a6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, CFSTR("_UIEventDeferringManager.m"), 3209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environments.count > 0"));

    v15 = a3;
  }
  if (!objc_msgSend(a10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, CFSTR("_UIEventDeferringManager.m"), 3210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason.length > 0"));

    v15 = a3;
  }
  v17 = 0;
  v18 = 0;
  do
    v18 |= 1 << LODWORD(a2[v17++]);
  while (v15 != v17);
  if ((*(_QWORD *)&v18 & 0x28003) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]");

  }
  if (a5)
    v20 = a5[5];
  else
    v20 = 0;
  v22 = (v18 & 0x24) == 0x20 || (v18 & 0x480) == 1024;
  v23 = v20 != a1 && (v18 & 0x84) != 0;
  v24 = v20 != a1 && v22;
  v59 = v24;
  v60 = v23;
  if (a4 && (v18 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]");

  }
  if (a4 != 1 && (v18 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]");

    if (a4)
      goto LABEL_31;
  }
  else if (a4)
  {
    goto LABEL_31;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)a1;
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, CFSTR("_UIEventDeferringManager.m"), 3259, CFSTR("[%p] %s: It is invalid to specify a target when deferring events locally"), a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]");

    goto LABEL_32;
  }
LABEL_31:
  v25 = (void *)a1;
  if (!a7)
    goto LABEL_34;
LABEL_32:
  if ((int)objc_msgSend(a7, "pid") >= 1)
  {
    v26 = objc_msgSend(a7, "pid");
    if (v26 != getpid())
    {
LABEL_34:
      if (a8)
        goto LABEL_35;
      goto LABEL_37;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)a1;
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, CFSTR("_UIEventDeferringManager.m"), 3260, CFSTR("[%p] %s: Remote event deferring cannot be pointed at the originating process"), a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]");

  if (a8)
  {
LABEL_35:
    if (a9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)a1;
      objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, CFSTR("_UIEventDeferringManager.m"), 3267, CFSTR("[%p] %s: Invalid combination of recreation reasons: add: %@; remove: %@"),
        a1,
        "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:tar"
        "get:addingRecreationReason:removingRecreationReason:forReason:]",
        a8,
        a9);

    }
  }
LABEL_37:
  objc_msgSend(v25, "windowHostingScene");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, CFSTR("_UIEventDeferringManager.m"), 3270, CFSTR("[%p] %s: Invalid %@ object. There is no scene"), a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]", objc_opt_class());

  }
  v28 = a1;
  -[_UIEventDeferringManager _transactionAssertion]((id *)a1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = a1;
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", sel__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason_, a1, CFSTR("_UIEventDeferringManager.m"), 3273, CFSTR("[%p] %s: Invalid state. Processing actions with an existing transaction: %@"), a1, "-[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]", a1);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke;
  aBlock[3] = &unk_1E16BAC90;
  aBlock[9] = a2;
  aBlock[10] = a3;
  aBlock[4] = v28;
  aBlock[5] = a5;
  aBlock[6] = a6;
  aBlock[7] = a7;
  aBlock[8] = a10;
  v61 = _Block_copy(aBlock);
  v30 = qword_1ECD7D128;
  if (!qword_1ECD7D128)
  {
    v30 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v30, (unint64_t *)&qword_1ECD7D128);
  }
  if ((*(_BYTE *)v30 & 1) != 0)
  {
    v50 = *(NSObject **)(v30 + 8);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = (void (*)(_QWORD *, const __CFString *))v61[2];
      v52 = v50;
      v51(v61, CFSTR("Processing actions"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "build");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v54;
      _os_log_impl(&dword_185066000, v52, OS_LOG_TYPE_ERROR, "[%{public}p] State before processing actions:\n%{public}@", buf, 0x16u);

    }
  }
  if ((*(_BYTE *)(a1 + 80) & 0x10) != 0)
    v31 = *(void **)(a1 + 56);
  else
    v31 = 0;
  v32 = v31;
  v79 = 0;
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = a5;
  *(_QWORD *)&buf[16] = 0;
  v76 = a8;
  v77 = a9;
  v78 = a10;
  LOBYTE(v79) = v59;
  BYTE1(v79) = v60;
  BYTE2(v79) = (*(_BYTE *)(a1 + 80) & 0x10) != 0;
  v62 = v32;
  v80 = v62;
  v33 = (uint64_t *)(a1 + 8);
  handleEvent(stateMachineSpec, *(_QWORD *)(a1 + 8), 0, (uint64_t)buf, (uint64_t *)(a1 + 8));
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v34 = a6;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v66 != v36)
          objc_enumerationMutation(v34);
        objc_storeStrong((id *)&buf[16], *(id *)(*((_QWORD *)&v65 + 1) + 8 * i));
        handleEvent(stateMachineSpec, *v33, 1, (uint64_t)buf, v33);
        v38 = a2;
        v39 = a3;
        do
        {
          v40 = *v38++;
          handleEvent(stateMachineSpec, *v33, v40, (uint64_t)buf, v33);
          --v39;
        }
        while (v39);
        handleEvent(stateMachineSpec, *v33, 15, (uint64_t)buf, v33);
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    }
    while (v35);
  }

  handleEvent(stateMachineSpec, *v33, 17, (uint64_t)buf, v33);
  v41 = qword_1ECD7D130;
  if (!qword_1ECD7D130)
  {
    v41 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v41, (unint64_t *)&qword_1ECD7D130);
  }
  if ((*(_BYTE *)v41 & 1) != 0)
  {
    v55 = *(id *)(v41 + 8);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      ((void (*)(_QWORD *, const __CFString *))v61[2])(v61, CFSTR("Processed actions"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "build");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v70 = 134349314;
      v71 = a1;
      v72 = 2114;
      v73 = v57;
      _os_log_impl(&dword_185066000, v55, OS_LOG_TYPE_ERROR, "[%{public}p] State after processing actions:\n%{public}@", v70, 0x16u);

    }
  }
  __destructor_8_s8_s16_s24_s32_s40_s56((id *)buf);

}

- (id)_topRemoteRecordInStackForEnvironment:(uint64_t)a1
{
  void *v2;
  void *v3;

  if (a1)
  {
    -[_UIEventDeferringManager _remoteDeferringRecordStackForEnvironment:](a1, a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(v2, "lastObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_remoteDeferringRecordStackForEnvironment:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    if (!v4)
    {
      v5 = objc_opt_new();
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "objectForKey:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v7, a2);
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_setTransactionAssertion:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    if (obj)
    {
      if (*(_QWORD *)(a1 + 96))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setTransactionAssertion_, a1, CFSTR("_UIEventDeferringManager.m"), 2122, CFSTR("[%p] %s: Invalid to set a transaction assertion with one already present"), a1, "-[_UIEventDeferringManager _setTransactionAssertion:]");

      }
    }
    objc_storeStrong((id *)(a1 + 96), obj);
  }
}

- (id)_transactionAssertion
{
  if (a1)
    a1 = (id *)a1[12];
  return a1;
}

- (id)_localRecordForEnvironment:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[2], "objectForKey:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)_removeLocalRecordForEnvironment:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    if (!*(_QWORD *)(result + 96))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeLocalRecordForEnvironment_, v3, CFSTR("_UIEventDeferringManager.m"), 2397, CFSTR("[%p] %s: Invalid state. Removing records without a transaction: %@"), v3, "-[_UIEventDeferringManager _removeLocalRecordForEnvironment:]", v3);

    }
    return objc_msgSend(*(id *)(v3 + 16), "removeObjectForKey:", a2);
  }
  return result;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", _NSStringFromUIDeferringState[self->_currentState], CFSTR("currentState"));
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_transactionAssertion, CFSTR("transactionAssertion"));
  -[_UIEventDeferringManager internalBehavior]((id *)&self->super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "succinctDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("behavior"));

  return v3;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIEventDeferringManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_UIEventDeferringManager)initWithScene:(id)a3
{
  _UIEventDeferringManager *v5;
  uint64_t v6;
  _UIEventDeferringBehavior *behavior;
  id WeakRetained;
  objc_class *v9;
  const char *Name;
  objc_class *v11;
  const char *v12;
  id v13;
  int v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _UIEventDeferringBehavior *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  _UIEventDeferringBehavior *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  BSInvalidatable *stateCaptureToken;
  id v40;
  void *v41;
  void *v43;
  _QWORD block[4];
  id v45[5];
  id v46;
  objc_super v47;
  uint8_t buf[4];
  _UIEventDeferringManager *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  _UIEventDeferringBehavior *v57;
  __int16 v58;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)_UIEventDeferringManager;
  v5 = -[_UIEventDeferringManager init](&v47, sel_init);
  if (v5)
  {
    if ((objc_msgSend(a3, "_hostsWindows") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("_UIEventDeferringManager.m"), 1886, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[scene _hostsWindows]"));

    }
    objc_storeWeak((id *)&v5->_scene, a3);
    v5->_currentState = 1;
    _UIEventDeferringBehaviorForManager(v5);
    v6 = objc_claimAutoreleasedReturnValue();
    behavior = v5->_behavior;
    v5->_behavior = (_UIEventDeferringBehavior *)v6;

    atomic_store(0, (unint64_t *)&v5->_bufferingAssertionCount);
    WeakRetained = objc_loadWeakRetained((id *)&v5->_scene);
    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);

    v11 = (objc_class *)objc_opt_class();
    v12 = class_getName(v11);
    v13 = objc_loadWeakRetained((id *)&v5->_scene);
    v14 = _UISceneSystemShellManagesKeyboardFocusForScene(v13);

    v15 = initWithScene____s_category_0;
    if (!initWithScene____s_category_0)
    {
      v15 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&initWithScene____s_category_0);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_loadWeakRetained((id *)&v5->_scene);
      v19 = v5->_behavior;
      *(_DWORD *)buf = 134350338;
      v49 = v5;
      v50 = 2082;
      v51 = Name;
      v52 = 2050;
      v53 = v18;
      v54 = 2082;
      v55 = v12;
      v56 = 2050;
      v57 = v19;
      v58 = 1026;
      v59 = v14;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}p] Initialized with scene: <%{public}s: %{public}p>; behavior: <%{public}s: %{public}p>; systemShellMa"
        "nagesKeyboardFocus: %{public}d",
        buf,
        0x3Au);

    }
    if ((*(_BYTE *)&v5->_deferringManagerFlags & 2) == 0)
    {
      *(_BYTE *)&v5->_deferringManagerFlags |= 2u;
      -[_UIEventDeferringManager windowHostingScene](v5, "windowHostingScene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v20, "_screen");

      objc_msgSend(v21, "displayConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v22, "isExternal");
      -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)v5, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        v25 = 0;
      else
        v25 = v23;
      if (v25 == 1)
        *(_BYTE *)&v5->_deferringManagerFlags |= 8u;

    }
    objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEventDeferringManager registerTargetProvider:forEnvironment:](v5, (uint64_t)v5, (uint64_t)v26);

    v27 = v5->_behavior;
    LODWORD(v26) = -[_UIEventDeferringBehavior wantsSystemKeyCommandOverlayRules](v27, "wantsSystemKeyCommandOverlayRules");

    if ((_DWORD)v26)
    {
      objc_msgSend(MEMORY[0x1E0D00CA8], "ui_systemKeyCommandOverlayEnvironment");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEventDeferringManager registerTargetProvider:forEnvironment:](v5, (uint64_t)v5, (uint64_t)v28);

    }
    -[_UIEventDeferringManager windowHostingScene](v5, "windowHostingScene");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v29, "_screen");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v5, sel__screenUniqueIdWillChange_, CFSTR("_UIScreenUniqueIdWillChangeNotification"), v30);
    objc_msgSend(v31, "addObserver:selector:name:object:", v5, sel__screenUniqueIdDidChange_, CFSTR("_UIScreenUniqueIdDidChangeNotification"), v30);

    objc_initWeak((id *)buf, v5);
    v32 = (void *)MEMORY[0x1E0CB3940];
    -[_UIEventDeferringManager windowHostingScene](v5, "windowHostingScene");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_sceneIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("UIKit - EventDeferringState - %@"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = MEMORY[0x1E0C80D38];
    v37 = MEMORY[0x1E0C809B0];
    v45[1] = (id)MEMORY[0x1E0C809B0];
    v45[2] = (id)3221225472;
    v45[3] = __42___UIEventDeferringManager_initWithScene___block_invoke;
    v45[4] = &unk_1E16B4DD0;
    objc_copyWeak(&v46, (id *)buf);
    BSLogAddStateCaptureBlockWithTitle();
    v38 = objc_claimAutoreleasedReturnValue();
    stateCaptureToken = v5->_stateCaptureToken;
    v5->_stateCaptureToken = (BSInvalidatable *)v38;

    v40 = objc_loadWeakRetained((id *)&v5->_scene);
    LODWORD(v34) = objc_msgSend(v40, "_isTargetOfKeyboardEventDeferringEnvironment");

    if ((_DWORD)v34)
    {
      block[0] = v37;
      block[1] = 3221225472;
      block[2] = __42___UIEventDeferringManager_initWithScene___block_invoke_2;
      block[3] = &unk_1E16B3F40;
      objc_copyWeak(v45, (id *)buf);
      v41 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(v45);
    }
    objc_destroyWeak(&v46);

    objc_destroyWeak((id *)buf);
  }
  return v5;
}

+ (void)targetOfEventDeferringEnvironmentsDidUpdateForScene:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  _QWORD *WeakRetained;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _BYTE v62[128];
  uint8_t v63[128];
  _BYTE buf[24];
  __int128 v65;
  void *v66;
  uint64_t *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v40 = objc_opt_self();
  if (objc_msgSend(a2, "_isTargetOfKeyboardEventDeferringEnvironment"))
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    if (v43)
    {
      v44 = 0;
      v42 = *(_QWORD *)v53;
      do
      {
        v3 = 0;
        do
        {
          if (*(_QWORD *)v53 != v42)
          {
            v4 = v3;
            objc_enumerationMutation(obj);
            v3 = v4;
          }
          v45 = v3;
          v5 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v3);
          objc_msgSend(v5, "_eventDeferringManager");
          v6 = (id *)objc_claimAutoreleasedReturnValue();
          if (v6 && (objc_msgSend(v44, "containsObject:", v6) & 1) == 0)
          {
            v7 = v44;
            if (!v44)
              v7 = (void *)objc_opt_new();
            v44 = v7;
            objc_msgSend(v7, "addObject:", v6);
            v8 = objc_msgSend(v6[13], "systemShellManagesKeyboardFocus");
            v9 = _UISceneSystemShellManagesKeyboardFocusForScene(v5);
            v10 = objc_msgSend(v6[13], "eligibleForLocalCompatibilityRuleRemoval");
            v11 = qword_1ECD7D0F8;
            if (!qword_1ECD7D0F8)
            {
              v11 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v11, (unint64_t *)&qword_1ECD7D0F8);
            }
            v12 = *(NSObject **)(v11 + 8);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v13 = v12;
              objc_msgSend(v6, "windowHostingScene");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134350080;
              *(_QWORD *)&buf[4] = v6;
              *(_WORD *)&buf[12] = 2050;
              *(_QWORD *)&buf[14] = v14;
              *(_WORD *)&buf[22] = 1026;
              LODWORD(v65) = v8;
              WORD2(v65) = 1026;
              *(_DWORD *)((char *)&v65 + 6) = v9;
              WORD5(v65) = 1026;
              HIDWORD(v65) = v10;
              _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}p] Scene target of event deferring environments did update: scene: %{public}p; current systemS"
                "hellManagesKeyboardFocus: %{public}d; systemShellManagesKeyboardFocusForScene: %{public}d; eligibleForRe"
                "cordRemoval: %{public}d;",
                buf,
                0x28u);

            }
            if (((v8 | v9 ^ 1) & 1) == 0 && ((v10 ^ 1) & 1) == 0)
            {
              v15 = qword_1ECD7D100;
              if (!qword_1ECD7D100)
              {
                v15 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v15, (unint64_t *)&qword_1ECD7D100);
              }
              v16 = *(NSObject **)(v15 + 8);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134349312;
                *(_QWORD *)&buf[4] = v40;
                *(_WORD *)&buf[12] = 1026;
                *(_DWORD *)&buf[14] = 1;
                _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] Updating system shell management of keyboard focus to: %{public}d", buf, 0x12u);
              }
              objc_msgSend(v6[13], "setSystemShellManagesKeyboardFocus:", 1);
              v50 = 0u;
              v51 = 0u;
              v48 = 0u;
              v49 = 0u;
              -[_UIEventDeferringManager _allEnvironments](v6);
              v46 = (id)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
              if (v17)
              {
                v47 = *(_QWORD *)v49;
                do
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v49 != v47)
                      objc_enumerationMutation(v46);
                    v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v18);
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: Removing local compatibility record for system shell managing keyboard focus in %@"), objc_opt_class(), v6, v19);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v6[13], "eligibleForLocalCompatibilityRuleRemoval") & 1) == 0)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "windowHostingScene");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeLocalCompatibilityEventDeferringForSystemShellKeyboardFocusInEnvironment_withReason_, v6, CFSTR("_UIEventDeferringManager.m"), 3428, CFSTR("[%p] %s: Invalid to request compatibility record removal on this scene: %@"), v6, "-[_UIEventDeferringManager _removeLocalCompatibilityEventDeferringForSystemShellKeyboardFocusInEnvironment:withReason:]", v38);

                    }
                    objc_msgSend(v19, "description");
                    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v22 = objc_msgSend(v21, "UTF8String");

                    v23 = objc_retainAutorelease(v20);
                    v24 = objc_msgSend(v23, "UTF8String");
                    v25 = qword_1ECD7D158;
                    if (!qword_1ECD7D158)
                    {
                      v25 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                      atomic_store(v25, (unint64_t *)&qword_1ECD7D158);
                    }
                    v26 = *(NSObject **)(v25 + 8);
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134349570;
                      *(_QWORD *)&buf[4] = v6;
                      *(_WORD *)&buf[12] = 2082;
                      *(_QWORD *)&buf[14] = v22;
                      *(_WORD *)&buf[22] = 2082;
                      *(_QWORD *)&v65 = v24;
                      _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] Removing all local compatibility event deferring rules for reason: %{public}s", buf, 0x20u);
                    }
                    -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)v6, 1);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v27)
                      objc_msgSend(MEMORY[0x1E0D00CF8], "displayWithHardwareIdentifier:", v27);
                    else
                      objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v56 = 0;
                    v57 = &v56;
                    v58 = 0x3032000000;
                    v59 = __Block_byref_object_copy__34;
                    v60 = __Block_byref_object_dispose__34;
                    v61 = 0;
                    _eventDeferringCompatibilityQueue();
                    v29 = objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                    *(_QWORD *)&buf[8] = 3221225472;
                    *(_QWORD *)&buf[16] = __119___UIEventDeferringManager__removeLocalCompatibilityEventDeferringForSystemShellKeyboardFocusInEnvironment_withReason___block_invoke;
                    *(_QWORD *)&v65 = &unk_1E16B9698;
                    v67 = &v56;
                    v30 = v28;
                    *((_QWORD *)&v65 + 1) = v30;
                    v66 = v19;
                    dispatch_sync(v29, buf);

                    v31 = v57[5];
                    if (v31)
                    {
                      WeakRetained = objc_loadWeakRetained((id *)(v31 + 32));
                      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v19);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      if (WeakRetained)
                      {
                        v34 = WeakRetained[6];
                        v35 = (void *)WeakRetained[8];
                      }
                      else
                      {
                        v34 = 0;
                        v35 = 0;
                      }
                      v36 = v35;
                      -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]((uint64_t)v6, (uint64_t *)&_removeLocalCompatibilityEventDeferringForSystemShellKeyboardFocusInEnvironment_withReason__actions, 2, v34, WeakRetained, v33, v36, 0, 0, v23);

                    }
                    _Block_object_dispose(&v56, 8);

                    ++v18;
                  }
                  while (v17 != v18);
                  v39 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
                  v17 = v39;
                }
                while (v39);
              }

            }
          }

          v3 = v45 + 1;
        }
        while (v45 + 1 != v43);
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      }
      while (v43);
    }
    else
    {
      v44 = 0;
    }

  }
}

- (void)registerTargetProvider:(uint64_t)a3 forEnvironment:
{
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    -[_UIEventDeferringManager _targetProvidersByEnvironment](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[_UIEventDeferringManager _targetProvidersByEnvironment](a1);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", a2, a3);

    }
  }
}

- (id)_localTargetWindowForEnvironment:(int)a3 consultingFallbackIfPermitted:
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[_UIEventDeferringManager _targetProvidersByEnvironment]((_QWORD *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__targetProviderForEnvironment_, a1, CFSTR("_UIEventDeferringManager.m"), 2787, CFSTR("[%p] [%@] %s: No registered target provider for this environment"), a1, a2, "-[_UIEventDeferringManager _targetProviderForEnvironment:]");

  }
  objc_msgSend(v7, "localEventDeferringTargetWindowForEnvironment:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _localTargetWindowForEnvironment_consultingFallbackIfPermitted____s_category;
  if (!_localTargetWindowForEnvironment_consultingFallbackIfPermitted____s_category)
  {
    v9 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&_localTargetWindowForEnvironment_consultingFallbackIfPermitted____s_category);
  }
  if ((*(_BYTE *)v9 & 1) != 0)
  {
    v12 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      *(_DWORD *)buf = 134350082;
      v16 = a1;
      v17 = 2114;
      v18 = a2;
      v19 = 2114;
      v20 = (id)objc_opt_class();
      v21 = 2050;
      v22 = v7;
      v23 = 2114;
      v24 = v8;
      v14 = v20;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}@] Target provider: <%{public}@: %{public}p>; returned local target window: %{public}@",
        buf,
        0x34u);

    }
  }
  if (!v8 && a3)
  {
    if (objc_msgSend(*(id *)(a1 + 104), "shouldAllowFallbackWindowForEnvironment:", a2))
    {
      -[_UIEventDeferringManager fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:]((id *)a1, a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (_QWORD)_targetProvidersByEnvironment
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[4];
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v1[4];
      v1[4] = v3;

      v2 = (void *)v1[4];
    }
    a1 = v2;
  }
  return a1;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  unint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _UIEventDeferringManager *v20;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  objc_msgSend(v5, "appendString:withName:", _NSStringFromUIDeferringState[self->_currentState], CFSTR("currentState"));
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", self->_transactionAssertion, CFSTR("transactionAssertion"));
  v7 = atomic_load((unint64_t *)&self->_bufferingAssertionCount);
  v8 = (id)objc_msgSend(v5, "appendInteger:withName:", v7, CFSTR("bufferingAssertionCount"));
  v9 = (id)objc_msgSend(v5, "appendBool:withName:", *(_BYTE *)&self->_deferringManagerFlags & 1, CFSTR("hasInvalidated"));
  v10 = (id)objc_msgSend(v5, "appendBool:withName:", (*(_BYTE *)&self->_deferringManagerFlags >> 1) & 1, CFSTR("evaluatedInitialExternalScreenDisconnection"));
  v11 = (id)objc_msgSend(v5, "appendBool:withName:", (*(_BYTE *)&self->_deferringManagerFlags >> 2) & 1, CFSTR("processingScreenIdentifierWillChange"));
  v12 = (id)objc_msgSend(v5, "appendBool:withName:", (*(_BYTE *)&self->_deferringManagerFlags >> 3) & 1, CFSTR("processedScreenIdentifierWillChange"));
  v13 = (id)objc_msgSend(v5, "appendBool:withName:", (*(_BYTE *)&self->_deferringManagerFlags >> 4) & 1, CFSTR("processingScreenIdentifierDidChange"));
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v18[3] = &unk_1E16B1B50;
  v14 = v5;
  v19 = v14;
  v20 = self;
  v15 = (id)objc_msgSend(v14, "modifyBody:", v18);
  v16 = v14;

  return v16;
}

- (void)removeEventDeferringRulesIfNeededForDeallocatingWindow:(_QWORD *)a1
{
  objc_class *v4;
  const char *Name;
  void *v6;
  objc_class *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  id WeakRetained;
  void *v27;
  void *v28;
  id v29;
  unint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _BYTE *v41;
  unint64_t v42;
  NSObject *v43;
  NSObject *v44;
  int v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  NSObject *v65;
  uint64_t v66;
  unint64_t v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  unint64_t v71;
  NSObject *v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id obj;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  _QWORD *v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  objc_msgSend(a2, "_windowHostingScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  v8 = class_getName(v7);

  if (os_variant_has_internal_diagnostics())
  {
    v67 = qword_1ECD7D160;
    if (!qword_1ECD7D160)
    {
      v67 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v67, (unint64_t *)&qword_1ECD7D160);
    }
    v68 = *(NSObject **)(v67 + 8);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = v68;
      objc_msgSend(a2, "_windowHostingScene");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134350082;
      v98 = a1;
      v99 = 2082;
      v100 = (uint64_t)Name;
      v101 = 2050;
      v102 = (uint64_t)a2;
      v103 = 2082;
      v104 = (uint64_t)v8;
      v105 = 2050;
      v106 = v70;
      _os_log_impl(&dword_185066000, v69, OS_LOG_TYPE_DEFAULT, "[%{public}p] Removing all event deferring rules (if needed) for deallocating window: <%{public}s: %{public}p>; s"
        "cene: <%{public}s: %{public}p>",
        buf,
        0x34u);

    }
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  -[_UIEventDeferringManager _allEnvironments](a1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v111, 16);
  if (!v81)
  {
    v77 = 0;
    v79 = 0;
    goto LABEL_50;
  }
  v77 = 0;
  v79 = 0;
  v80 = *(_QWORD *)v92;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v92 != v80)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v9);
      -[_UIEventDeferringManager _trackedLocalTargetWindowPointerForEnvironment:]((uint64_t)a1, (uint64_t)v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && (id)objc_msgSend(v11, "pointerValue") == a2)
      {
        v13 = v77;
        if (!v77)
          v13 = (void *)objc_opt_new();
        v77 = v13;
        objc_msgSend(v13, "addObject:", v10);
      }
      -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordMatchingEnvironment:recordingManagerPointer:forcePreviousHardwareIdentifier:]((uint64_t)a1, (uint64_t)v10, (uint64_t)a1, 0);
      v14 = (id *)objc_claimAutoreleasedReturnValue();
      -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordForEnvironment:forcePreviousHardwareIdentifier:]((uint64_t)a1, (uint64_t)v10, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_variant_has_internal_diagnostics())
      {
        objc_msgSend(v10, "description");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v25 = objc_msgSend(v24, "UTF8String");

        if (v15)
        {
          WeakRetained = objc_loadWeakRetained((id *)(v15 + 32));
          v27 = WeakRetained;
          if (WeakRetained)
          {
            v28 = (void *)*((_QWORD *)WeakRetained + 9);
LABEL_28:
            v29 = objc_retainAutorelease(v28);
            v76 = objc_msgSend(v29, "UTF8String");

            v30 = qword_1ECD7D168;
            if (!qword_1ECD7D168)
            {
              v30 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v30, (unint64_t *)&qword_1ECD7D168);
            }
            v31 = *(NSObject **)(v30 + 8);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = v31;
              if (v15)
                v33 = *(void **)(v15 + 40);
              else
                v33 = 0;
              v34 = objc_msgSend(v12, "pointerValue");
              *(_DWORD *)buf = 134350594;
              v98 = a1;
              v99 = 2082;
              v100 = v25;
              v101 = 2050;
              v102 = (uint64_t)v14;
              v103 = 2050;
              v104 = v15;
              v105 = 2050;
              v106 = v33;
              v107 = 2082;
              v108 = v76;
              v109 = 2050;
              v110 = v34;
              _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] Record matching manager: %{public}p; wild card match: %{public}p; wild card ma"
                "tch recording manager: %{public}p; wild card match reason: %{public}s; target window for environment: %{public}p",
                buf,
                0x48u);

            }
            goto LABEL_14;
          }
        }
        else
        {
          v27 = 0;
        }
        v28 = 0;
        goto LABEL_28;
      }
LABEL_14:
      if (v14)
      {
        v16 = objc_loadWeakRetained(v14 + 4);
        v17 = v16 ? (id)v16[5] : 0;

        if (v17 == a2)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeEventDeferringRulesIfNeededForDeallocatingWindow_, a1, CFSTR("_UIEventDeferringManager.m"), 3497, CFSTR("[%p] %s: Bug in event deferring client: owning interface element is deallocating before deferring has ended: %@"), a1, "-[_UIEventDeferringManager removeEventDeferringRulesIfNeededForDeallocatingWindow:]", v14);

        }
      }
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __83___UIEventDeferringManager_removeEventDeferringRulesIfNeededForDeallocatingWindow___block_invoke;
      v90[3] = &unk_1E16BABA0;
      v90[4] = a2;
      -[_UIEventDeferringManager _remoteRecordsInStackMatchingEnvironment:passingTest:]((uint64_t)a1, (uint64_t)v10, (uint64_t)v90);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 && objc_msgSend(v18, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeEventDeferringRulesIfNeededForDeallocatingWindow_, a1, CFSTR("_UIEventDeferringManager.m"), 3504, CFSTR("[%p] %s: Bug in event deferring client: owning interface element is deallocating before deferring has ended: %@"), a1, "-[_UIEventDeferringManager removeEventDeferringRulesIfNeededForDeallocatingWindow:]", v19);

        if (!v14)
        {
LABEL_35:
          v23 = 0;
          goto LABEL_36;
        }
      }
      else if (!v14)
      {
        goto LABEL_35;
      }
      v20 = v14[2];
      v21 = v20;
      if (v20)
        v22 = (void *)*((_QWORD *)v20 + 9);
      else
        v22 = 0;
      v23 = v22;

LABEL_36:
      if (v23 == a2)
      {
        v37 = v79;
        if (!v79)
          v37 = (void *)objc_opt_new();
        v79 = v37;
        objc_msgSend(v37, "addObject:", v10);
      }

      ++v9;
    }
    while (v81 != v9);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v111, 16);
    v81 = v38;
  }
  while (v38);
LABEL_50:

  v39 = v79;
  objc_msgSend(v77, "minusSet:", v79);
  if (os_variant_has_internal_diagnostics())
  {
    v71 = qword_1ECD7D170;
    if (!qword_1ECD7D170)
    {
      v71 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v71, (unint64_t *)&qword_1ECD7D170);
    }
    v72 = *(NSObject **)(v71 + 8);
    v39 = v79;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v73 = v72;
      v74 = objc_msgSend(v79, "count");
      v75 = objc_msgSend(v77, "count");
      *(_DWORD *)buf = 134349568;
      v98 = a1;
      v99 = 2050;
      v100 = v74;
      v101 = 2050;
      v102 = v75;
      _os_log_impl(&dword_185066000, v73, OS_LOG_TYPE_DEFAULT, "[%{public}p] Environments to remove for deallocating window: %{public}lu; separate environments to end observati"
        "on for deallocating window: %{public}lu",
        buf,
        0x20u);

    }
  }
  if (v39)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: removing deferring rules for deallocating window: %p"), objc_opt_class(), a1, a2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[_UIEventDeferringOwnershipToken _initWithOwner:scope:environments:target:reason:]([_UIEventDeferringOwnershipToken alloc], (uint64_t)a1, 0, v79, 0, v40);
    v42 = qword_1ECD7D178;
    if (!qword_1ECD7D178)
    {
      v42 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v42, (unint64_t *)&qword_1ECD7D178);
    }
    v43 = *(NSObject **)(v42 + 8);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = v43;
      v45 = objc_msgSend(a2, "_contextId");
      *(_DWORD *)buf = 134349568;
      v98 = a1;
      v99 = 2050;
      v100 = (uint64_t)a2;
      v101 = 1026;
      LODWORD(v102) = v45;
      _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_DEFAULT, "[%{public}p] Removing all event deferring rules for deallocating window: %{public}p; contextId: 0x%{public}X",
        buf,
        0x1Cu);

    }
    if (v41)
    {
      v46 = *((_QWORD *)v41 + 6);
      v47 = *((id *)v41 + 7);
      v48 = (void *)*((_QWORD *)v41 + 8);
    }
    else
    {
      v47 = 0;
      v46 = 0;
      v48 = 0;
    }
    v49 = v48;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]((uint64_t)a1, (uint64_t *)&removeEventDeferringRulesIfNeededForDeallocatingWindow__actions, 2, v46, v41, v47, v49, 0, 0, v40);

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v50 = v79;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v87 != v53)
            objc_enumerationMutation(v50);
          if (v41)
          {
            objc_msgSend(*((id *)v41 + 1), "removeObject:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i));
            if (!v41[16] && !objc_msgSend(*((id *)v41 + 1), "count"))
              v41[16] = 1;
          }
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
      }
      while (v52);
    }

  }
  v55 = v77;
  if (v77)
  {
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v56 = v77;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v83;
      do
      {
        v60 = 0;
        do
        {
          if (*(_QWORD *)v83 != v59)
            objc_enumerationMutation(v56);
          v61 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v60);
          objc_msgSend(v61, "description");
          v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v63 = objc_msgSend(v62, "UTF8String");

          if (os_variant_has_internal_diagnostics())
          {
            v64 = qword_1ECD7D180;
            if (!qword_1ECD7D180)
            {
              v64 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v64, (unint64_t *)&qword_1ECD7D180);
            }
            v65 = *(NSObject **)(v64 + 8);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134349570;
              v98 = a1;
              v99 = 2082;
              v100 = v63;
              v101 = 2050;
              v102 = (uint64_t)a2;
              _os_log_impl(&dword_185066000, v65, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] Ending observation of deallocating window: [%{public}p", buf, 0x20u);
            }
          }
          -[_UIEventDeferringManager _stopObservingContextForLocalTargetWindowInEnvironment:]((uint64_t)a1, v61);
          ++v60;
        }
        while (v58 != v60);
        v66 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
        v58 = v66;
      }
      while (v66);
    }

    v55 = v77;
  }

}

- (id)_remoteRecordsInStackMatchingEnvironment:(uint64_t)a3 passingTest:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_UIEventDeferringManager _remoteDeferringRecordStackForEnvironment:](a1, a2);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v4);
      v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
      v12 = 0;
      if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(a3 + 16))(a3, v10, &v12))
      {
        if (!v7)
          v7 = (void *)objc_opt_new();
        objc_msgSend(v7, "addObject:", v10);
        if (v12)
          break;
      }
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_recreateEventDeferringRecordsInEnvironment:(void *)a3 removingRecreationReason:(void *)a4 forReason:
{
  id v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  id *v17;
  id *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  _QWORD *WeakRetained;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  unint64_t v28;
  NSObject *v29;
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
    objc_msgSend(a2, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "UTF8String");

    if (a3)
    {
      _UIEventDeferringShorterRecreationReasonStringForReason(a3);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("(nil)");
    }
    v11 = objc_retainAutorelease(v10);
    v12 = -[__CFString UTF8String](v11, "UTF8String");
    v13 = objc_retainAutorelease(a4);
    v14 = objc_msgSend(v13, "UTF8String");
    v15 = qword_1ECD7D138;
    if (!qword_1ECD7D138)
    {
      v15 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&qword_1ECD7D138);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349826;
      v31 = a1;
      v32 = 2082;
      v33 = v9;
      v34 = 2082;
      v35 = v12;
      v36 = 2082;
      v37 = v14;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] Recreation of event deferring records requested: removing recreation reason: %{public}s; for reason: %{public}s",
        buf,
        0x2Au);
    }
    -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordMatchingEnvironment:recordingManagerPointer:forcePreviousHardwareIdentifier:](a1, (uint64_t)a2, a1, (*(unsigned __int8 *)(a1 + 80) >> 4) & 1);
    v17 = (id *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a3 && v17)
    {
      -[_UIEventDeferringRecord recreationReasons](v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsObject:", a3);

      if ((v20 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIEventDeferringRecord recreationReasons](v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__recreateEventDeferringRecordsInEnvironment_removingRecreationReason_forReason_, a1, CFSTR("_UIEventDeferringManager.m"), 3351, CFSTR("[%p] %s: Invalid state for recreating record. Recreation reason should be present but is not: %@; reasons: %@; record: %@"),
          a1,
          "-[_UIEventDeferringManager _recreateEventDeferringRecordsInEnvironment:removingRecreationReason:forReason:]",
          a3,
          v22,
          v18);

      }
    }
    else if (!v17)
    {
      v28 = qword_1ECD7D140;
      if (!qword_1ECD7D140)
      {
        v28 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v28, (unint64_t *)&qword_1ECD7D140);
      }
      v29 = *(NSObject **)(v28 + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        v31 = a1;
        v32 = 2082;
        v33 = v9;
        _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] No records. Exiting event deferring records recreation request.", buf, 0x16u);
      }
      goto LABEL_17;
    }
    WeakRetained = objc_loadWeakRetained(v18 + 4);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
    {
      v25 = WeakRetained[6];
      v26 = (void *)WeakRetained[8];
    }
    else
    {
      v25 = 0;
      v26 = 0;
    }
    v27 = v26;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:](a1, _recreateEventDeferringRecordsInEnvironment_removingRecreationReason_forReason__actions, 3, v25, WeakRetained, v24, v27, 0, a3, v13);

LABEL_17:
  }
}

- (id)_environmentsForLocalTargetWindowPointer:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[_UIEventDeferringManager _trackedLocalTargetWindowPointers](a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(a2, "isEqualToValue:", v10);

        if (v11)
        {
          if (!v6)
            v6 = (void *)objc_opt_new();
          objc_msgSend(v6, "addObject:", v9);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_QWORD)_currentLocalOrCompatibilityRecordMatchingEnvironment:(uint64_t)a3 recordingManagerPointer:(int)a4 forcePreviousHardwareIdentifier:
{
  _QWORD *v5;
  void *v6;
  _QWORD *v7;

  -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordForEnvironment:forcePreviousHardwareIdentifier:](a1, a2, a4);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && v5[5] != a3)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (_QWORD)_allEnvironments
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v1 = a1;
  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)objc_opt_new();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[_UIEventDeferringManager _targetProvidersByEnvironment](v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    v1 = (_QWORD *)objc_msgSend(v2, "copy");
  }
  return v1;
}

- (void)_removeRemoteRecord:(uint64_t)a3 forEnvironment:
{
  void *v6;
  id v7;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 96))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeRemoteRecord_forEnvironment_, a1, CFSTR("_UIEventDeferringManager.m"), 2465, CFSTR("[%p] %s: Invalid state. Removing records without a transaction: %@"), a1, "-[_UIEventDeferringManager _removeRemoteRecord:forEnvironment:]", a1);

    }
    -[_UIEventDeferringManager _remoteDeferringRecordStackForEnvironment:](a1, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectIdenticalTo:", a2);

  }
}

- (uint64_t)_isRemoteRuleOwningElement:(id)a3 visibleForLocalTargetWindow:
{
  uint64_t v3;
  uint64_t IsElementOccludedByWindow;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v3 = a1;
  if (a1)
  {
    if (a2)
    {
      if (a3)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__isRemoteRuleOwningElement_visibleForLocalTargetWindow_, v3, CFSTR("_UIEventDeferringManager.m"), 3115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteRuleElement"));

      if (a3)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__isRemoteRuleOwningElement_visibleForLocalTargetWindow_, v3, CFSTR("_UIEventDeferringManager.m"), 3116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localTargetWindow"));

LABEL_4:
    IsElementOccludedByWindow = _UIEventDeferringBehaviorIsElementOccludedByWindow(a2, a3);
    if (IsElementOccludedByWindow == -1)
      return 0;
    v7 = IsElementOccludedByWindow;
    if (IsElementOccludedByWindow == 1)
      return 1;
    v8 = objc_msgSend(a2, "interfaceElementCategory");
    if (!v7 && (v8 & 0xFFFFFFFFFFFFFFFELL) != 2)
      return 1;
    if (v8 == 3)
    {
      objc_msgSend(a2, "_existingView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_15;
    }
    else
    {
      if (v8 == 2)
      {
        v9 = a2;
        if (!v9)
          goto LABEL_20;
LABEL_15:
        if (v9 == a3)
        {
          v3 = 1;
          v9 = a3;
        }
        else
        {
          v11 = *(id *)(v3 + 104);
          if ((objc_msgSend(v11, "wantsLocalIdealRules") & 1) != 0
            || (objc_msgSend(v11, "wantsLocalCompatibilityRules") & 1) == 0)
          {
            objc_msgSend((id)v3, "windowHostingScene");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v18[0] = MEMORY[0x1E0C809B0];
            v18[1] = 3221225472;
            v18[2] = __83___UIEventDeferringManager__isRemoteRuleOwningElement_visibleForLocalTargetWindow___block_invoke;
            v18[3] = &unk_1E16BAC18;
            v18[4] = a3;
            v19 = v9;
            objc_msgSend(v12, "_topVisibleWindowPassingTest:", v18);
            v13 = (id)objc_claimAutoreleasedReturnValue();

            if (v13)
              v14 = v13 == a3;
            else
              v14 = 0;
            v3 = !v14;

          }
          else
          {
            v3 = 0;
          }

        }
        goto LABEL_30;
      }
      v9 = 0;
    }
LABEL_20:
    v3 = 1;
LABEL_30:

  }
  return v3;
}

- (void)_pushRemoteRecordOnStack:(uint64_t)a3 forEnvironment:
{
  void *v6;
  id v7;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 96))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__pushRemoteRecordOnStack_forEnvironment_, a1, CFSTR("_UIEventDeferringManager.m"), 2459, CFSTR("[%p] %s: Invalid state. Saving records without a transaction: %@"), a1, "-[_UIEventDeferringManager _pushRemoteRecordOnStack:forEnvironment:]", a1);

    }
    -[_UIEventDeferringManager _remoteDeferringRecordStackForEnvironment:](a1, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", a2);

  }
}

- (void)_sceneWillInvalidate:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  _UIEventDeferringBehavior *v23;
  void *v24;
  _UIEventDeferringBehavior *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  _UIEventDeferringManager *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[_UIEventDeferringManager windowHostingScene](self, "windowHostingScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_hasInvalidated");

  if (v6 && (*(_BYTE *)&self->_deferringManagerFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: removing all deferring rules due to scene invalidation: %p"), objc_opt_class(), self, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEventDeferringManager _allEnvironments](self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIEventDeferringOwnershipToken _initWithOwner:scope:environments:target:reason:]([_UIEventDeferringOwnershipToken alloc], (uint64_t)self, 1, v8, 0, v7);
    v26 = objc_retainAutorelease(v7);
    v10 = objc_msgSend(v26, "UTF8String");
    v11 = _removeEventDeferringRecordsForAllEnvironmentsWithOwningElement_withReason____s_category;
    if (!_removeEventDeferringRecordsForAllEnvironmentsWithOwningElement_withReason____s_category)
    {
      v11 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_removeEventDeferringRecordsForAllEnvironmentsWithOwningElement_withReason____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v32 = self;
      v33 = 2082;
      v34 = v10;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}p] Removing all event deferring rules for reason: %{public}s", buf, 0x16u);
    }
    if (v9)
    {
      v13 = *((_QWORD *)v9 + 6);
      v14 = *((id *)v9 + 7);
      v15 = (void *)*((_QWORD *)v9 + 8);
    }
    else
    {
      v14 = 0;
      v13 = 0;
      v15 = 0;
    }
    v16 = v15;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:]((uint64_t)self, _removeEventDeferringRecordsForAllEnvironmentsWithOwningElement_withReason__actions, 3, v13, v9, v14, v16, 0, 0, v26);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, buf, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          if (v9)
          {
            objc_msgSend(*((id *)v9 + 1), "removeObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
            if (!v9[16] && !objc_msgSend(*((id *)v9 + 1), "count"))
              v9[16] = 1;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, buf, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObserver:", self);

    v23 = self->_behavior;
    -[_UIEventDeferringBehavior systemShellBehaviorDelegate](v23, "systemShellBehaviorDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = self->_behavior;
      -[_UIEventDeferringBehavior setSystemShellBehaviorDelegate:](v25, "setSystemShellBehaviorDelegate:", 0);

    }
    *(_BYTE *)&self->_deferringManagerFlags |= 1u;

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("_UIScreenUniqueIdWillChangeNotification");
  v6[1] = CFSTR("_UIScreenUniqueIdDidChangeNotification");
  v6[2] = _UIWindowDidAttachContextNotification;
  v6[3] = _UIWindowDidDetachContextNotification;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIEventDeferringManager;
  -[_UIEventDeferringManager dealloc](&v5, sel_dealloc);
}

+ (void)setSystemShellBehaviorDelegate:(id)a3
{
  id v6;
  void *v7;
  objc_class *v8;
  const char *Name;
  objc_class *v10;
  const char *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  id *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((_UIEventDeferringSystemShellBehaviorIsAllowedForProcess() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIEventDeferringManager.m"), 2140, CFSTR("%s: A system shell behavior delegate is not allowed for this process"), "+[_UIEventDeferringManager setSystemShellBehaviorDelegate:]");

  }
  v6 = (id)qword_1ECD7D0E8;
  v7 = v6;
  if (a3 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIEventDeferringManager.m"), 2143, CFSTR("%s: Invalid to set a system shell behavior delegate with one already present"), "+[_UIEventDeferringManager setSystemShellBehaviorDelegate:]");

  }
  v8 = (objc_class *)objc_opt_class();
  Name = class_getName(v8);
  v10 = (objc_class *)objc_opt_class();
  v11 = class_getName(v10);
  v12 = qword_1ECD7D0F0;
  if (!qword_1ECD7D0F0)
  {
    v12 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v12, (unint64_t *)&qword_1ECD7D0F0);
  }
  v13 = *(NSObject **)(v12 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v29 = Name;
    v30 = 2082;
    v31 = v11;
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Setting system shell behavior delegate: existing: %{public}s; new: %{public}s",
      buf,
      0x16u);
  }
  objc_storeStrong((id *)&qword_1ECD7D0E8, a3);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "_eventDeferringManager");
        v20 = (id *)objc_claimAutoreleasedReturnValue();
        if (v20 && (objc_msgSend(v17, "containsObject:", v20) & 1) == 0)
        {
          if (!v17)
            v17 = (void *)objc_opt_new();
          objc_msgSend(v17, "addObject:", v20);
          objc_msgSend(v20[13], "setSystemShellBehaviorDelegate:", qword_1ECD7D0E8);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

}

- (void)eventDeferringManager:(id)a3 didRemoveLocalCompatibilityRecordForDescriptor:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (a4)
    v6 = (void *)*((_QWORD *)a4 + 4);
  else
    v6 = 0;
  v11 = v6;
  -[_UIEventDeferringManager _trackedLocalTargetWindowPointerForEnvironment:]((uint64_t)self, (uint64_t)v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "pointerValue");
    if (a4)
      v10 = *((_QWORD *)a4 + 9);
    else
      v10 = 0;
    if (v9 == v10)
      -[_UIEventDeferringManager _stopObservingContextForLocalTargetWindowInEnvironment:]((uint64_t)self, v11);
  }

}

- (NSString)debugDescription
{
  return (NSString *)-[_UIEventDeferringManager debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_localTargetWindowDidDetachContext:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  if (objc_msgSend(v6, sel_allowsWeakReference))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  -[_UIEventDeferringManager windowHostingScene](self, "windowHostingScene");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(v8, "_windowHostingScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEventDeferringManager _environmentsForLocalTargetWindowPointer:]((uint64_t)self, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v25 = v13;
        v26 = v10;
        v27 = v6;
        objc_msgSend(a3, "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("contextId"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedIntValue");

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v24 = v14;
        obj = v14;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v30;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v30 != v20)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v21);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: disabling %@: context detached for window: %p; contextID: 0x%X"),
                objc_opt_class(),
                self,
                v22,
                v8,
                v17);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UIEventDeferringManager _disableEventDeferringRecordsInEnvironment:addingRecreationReason:forReason:]((uint64_t)self, v22, CFSTR("_UIEventDeferringRecreationReasonDetachedContext"), v23);

              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          }
          while (v19);
        }

        v10 = v26;
        v6 = v27;
        v14 = v24;
        v13 = v25;
      }

    }
  }

}

- (void)_disableEventDeferringRecordsInEnvironment:(void *)a3 addingRecreationReason:(void *)a4 forReason:
{
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  id *v16;
  id *v17;
  void *v18;
  int v19;
  _QWORD *WeakRetained;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a2, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "UTF8String");

    _UIEventDeferringShorterRecreationReasonStringForReason(a3);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "UTF8String");

    v12 = objc_retainAutorelease(a4);
    v13 = objc_msgSend(v12, "UTF8String");
    v14 = qword_1ECD7D148;
    if (!qword_1ECD7D148)
    {
      v14 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&qword_1ECD7D148);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349826;
      v30 = a1;
      v31 = 2082;
      v32 = v9;
      v33 = 2082;
      v34 = v11;
      v35 = 2082;
      v36 = v13;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] Disabling event deferring records requested: adding recreation reason: %{public}s; for"
        " reason: %{public}s",
        buf,
        0x2Au);
    }
    -[_UIEventDeferringManager _currentLocalOrCompatibilityRecordMatchingEnvironment:recordingManagerPointer:forcePreviousHardwareIdentifier:](a1, (uint64_t)a2, a1, 0);
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      -[_UIEventDeferringRecord recreationReasons](v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsObject:", a3);

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIEventDeferringRecord recreationReasons](v17);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__disableEventDeferringRecordsInEnvironment_addingRecreationReason_forReason_, a1, CFSTR("_UIEventDeferringManager.m"), 3396, CFSTR("[%p] %s: Invalid state for disabling. Recreation reason should not be present but is: %@; reasons: %@; record: %@"),
          a1,
          "-[_UIEventDeferringManager _disableEventDeferringRecordsInEnvironment:addingRecreationReason:forReason:]",
          a3,
          v28,
          v17);

      }
      WeakRetained = objc_loadWeakRetained(v17 + 4);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (WeakRetained)
      {
        v22 = WeakRetained[6];
        v23 = (void *)WeakRetained[8];
      }
      else
      {
        v22 = 0;
        v23 = 0;
      }
      v24 = v23;
      -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:](a1, _disableEventDeferringRecordsInEnvironment_addingRecreationReason_forReason__actions, 3, v22, WeakRetained, v21, v24, a3, 0, v12);

    }
    else
    {
      v25 = qword_1ECD7D150;
      if (!qword_1ECD7D150)
      {
        v25 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v25, (unint64_t *)&qword_1ECD7D150);
      }
      v26 = *(NSObject **)(v25 + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        v30 = a1;
        v31 = 2082;
        v32 = v9;
        _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}p] [%{public}s] No records. Exiting event deferring records disable request.", buf, 0x16u);
      }
    }

  }
}

- (void)_screenUniqueIdWillChange:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSString *v12;
  NSString *previousExternalScreenIdentifier;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  -[_UIEventDeferringManager windowHostingScene](self, "windowHostingScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = objc_msgSend(v7, "_screen");
      objc_msgSend(v6, "displayConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isExternal");

      if ((void *)v9 == v6 && v11 && (*(_BYTE *)&self->_deferringManagerFlags & 8) == 0)
      {
        v31 = v8;
        v33 = v6;
        *(_BYTE *)&self->_deferringManagerFlags |= 4u;
        -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)self, 0);
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        previousExternalScreenIdentifier = self->_previousExternalScreenIdentifier;
        self->_previousExternalScreenIdentifier = v12;

        v14 = (__CFString *)self->_previousExternalScreenIdentifier;
        if (!v14)
          v14 = CFSTR("(nil)");
        v15 = v14;
        objc_msgSend(a3, "userInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("_UIScreenNewUniqueIdUserInfoKey"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
          v19 = (__CFString *)v17;
        else
          v19 = CFSTR("(nil)");
        v20 = v19;

        v30 = objc_retainAutorelease(v15);
        v21 = -[__CFString UTF8String](v30, "UTF8String");
        v29 = objc_retainAutorelease(v20);
        v22 = -[__CFString UTF8String](v29, "UTF8String");
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        -[_UIEventDeferringManager _allEnvironments](self);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v35 != v25)
                objc_enumerationMutation(obj);
              v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: disabling %@: screen identifier will change for screen: %p; current: %s; new: %s"),
                objc_opt_class(),
                self,
                v27,
                v33,
                v21,
                v22);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UIEventDeferringManager _disableEventDeferringRecordsInEnvironment:addingRecreationReason:forReason:]((uint64_t)self, v27, CFSTR("_UIEventDeferringRecreationReasonChangingScreenIdentifier"), v28);

            }
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v24);
        }

        *(_BYTE *)&self->_deferringManagerFlags = *(_BYTE *)&self->_deferringManagerFlags & 0xF3 | 8;
        v6 = v33;
        v8 = v31;
      }
    }
  }

}

- (void)_screenUniqueIdDidChange:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  char deferringManagerFlags;
  void *v11;
  __CFString *previousExternalScreenIdentifier;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  -[_UIEventDeferringManager windowHostingScene](self, "windowHostingScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (id)objc_msgSend(v7, "_screen");
    if (v9 == v6)
    {
      deferringManagerFlags = (char)self->_deferringManagerFlags;

      if ((deferringManagerFlags & 8) != 0)
      {
        -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)self, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v24 = v8;
          *(_BYTE *)&self->_deferringManagerFlags |= 0x10u;
          previousExternalScreenIdentifier = (__CFString *)self->_previousExternalScreenIdentifier;
          if (!previousExternalScreenIdentifier)
            previousExternalScreenIdentifier = CFSTR("(nil)");
          v22 = objc_retainAutorelease(previousExternalScreenIdentifier);
          v13 = -[__CFString UTF8String](v22, "UTF8String");
          v23 = v11;
          v14 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          -[_UIEventDeferringManager _allEnvironments](self);
          obj = (id)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v27;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v27 != v17)
                  objc_enumerationMutation(obj);
                v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v18);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: recreating %@: screen identifier changed for screen: %p; current: %s; new: %s"),
                  objc_opt_class(),
                  self,
                  v19,
                  v6,
                  v13,
                  v14);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UIEventDeferringManager _recreateEventDeferringRecordsInEnvironment:removingRecreationReason:forReason:]((uint64_t)self, v19, CFSTR("_UIEventDeferringRecreationReasonChangingScreenIdentifier"), v20);

                ++v18;
              }
              while (v16 != v18);
              v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            }
            while (v16);
          }

          *(_BYTE *)&self->_deferringManagerFlags &= 0xE3u;
          v21 = self->_previousExternalScreenIdentifier;
          self->_previousExternalScreenIdentifier = 0;

          v11 = v23;
          v8 = v24;
        }

      }
    }
    else
    {

    }
  }

}

- (void)_windowHostingScene:(id)a3 didMoveFromScreen:(id)a4 toScreen:(id)a5
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  objc_class *v27;
  const char *Name;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[_UIEventDeferringManager windowHostingScene](self, "windowHostingScene");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == a3)
  {
    -[_UIEventDeferringManager windowHostingScene](self, "windowHostingScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "_screen");

    if (v12 == a5)
    {
      if ((*(_BYTE *)&self->_deferringManagerFlags & 8) != 0)
      {
        objc_msgSend(a4, "displayConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hardwareIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (__CFString *)v14;
        else
          v16 = CFSTR("(nil)");
        v17 = v16;

        objc_msgSend(a5, "displayConfiguration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "hardwareIdentifier");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          v21 = (__CFString *)v19;
        else
          v21 = CFSTR("(nil)");
        v22 = v21;

        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringManager.m"), 2758, CFSTR("Invalid state: window hosting scene moved screens while a screen hardware identifier change is in process: previousExternalScreenIdentifier: %@; oldScreenHardwareIdentifier: %@; newScreenHardwareIdentifier: %@; self: %@"),
          self->_previousExternalScreenIdentifier,
          v17,
          v22,
          self);

      }
      v24 = a4;
      v25 = a5;
      v26 = a3;
      v27 = (objc_class *)objc_opt_class();
      Name = class_getName(v27);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      -[_UIEventDeferringManager _allEnvironments](self);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v37 != v31)
              objc_enumerationMutation(obj);
            v33 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: recreating %@: window hosting scene moved screens: scene: <%s: %p>; oldScreen: %p; newScreen: %p"),
              objc_opt_class(),
              self,
              v33,
              Name,
              v26,
              v24,
              v25);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIEventDeferringManager _recreateEventDeferringRecordsInEnvironment:removingRecreationReason:forReason:]((uint64_t)self, v33, 0, v34);

          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v30);
      }

    }
  }
  else
  {

  }
}

- (int64_t)interfaceElementCategory
{
  return 1;
}

- (_BYTE)beginRemoteEventDeferringInEnvironments:(void *)a3 forOwningInterfaceElement:(void *)a4 toTarget:(void *)a5 withReason:
{
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  _BYTE *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1 || (*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    _UIEventDeferringAssertForInvalidOwningInterfaceElement(a3);
    v10 = -[_UIEventDeferringOwnershipToken _initWithOwner:scope:environments:target:reason:]([_UIEventDeferringOwnershipToken alloc], (uint64_t)a3, 1, a2, a4, a5);
    v11 = objc_msgSend(objc_retainAutorelease(a5), "UTF8String");
    v12 = beginRemoteEventDeferringInEnvironments_forOwningInterfaceElement_toTarget_withReason____s_category[0];
    if (!beginRemoteEventDeferringInEnvironments_forOwningInterfaceElement_toTarget_withReason____s_category[0])
    {
      v12 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, beginRemoteEventDeferringInEnvironments_forOwningInterfaceElement_toTarget_withReason____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      if (v10)
        v15 = (void *)*((_QWORD *)v10 + 7);
      else
        v15 = 0;
      v16 = v15;
      *(_DWORD *)buf = 134349826;
      v24 = a1;
      v25 = 2050;
      v26 = v10;
      v27 = 2048;
      v28 = objc_msgSend(v16, "count");
      v29 = 2082;
      v30 = v11;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}p] Begin remote event deferring requested for token: %{public}p; environments: %lu; reason: %{public}s",
        buf,
        0x2Au);

    }
    if (v10)
    {
      v17 = *((_QWORD *)v10 + 6);
      v18 = *((id *)v10 + 7);
      v19 = *((id *)v10 + 8);
      v20 = (void *)*((_QWORD *)v10 + 9);
    }
    else
    {
      v19 = 0;
      v17 = 0;
      v18 = 0;
      v20 = 0;
    }
    v21 = v20;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:](a1, beginRemoteEventDeferringInEnvironments_forOwningInterfaceElement_toTarget_withReason__actions, 5, v17, v10, v18, v19, CFSTR("_UIEventDeferringRecreationReasonNoLongerTopRemoteRecord"), 0, v21);

  }
  return v10;
}

- (void)endLocalEventDeferringForToken:(id)a3 withReason:
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id WeakRetained;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  id v31;
  BOOL v32;
  uint64_t v33;
  unint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v5 = a1;
  if (a2 && *(_QWORD *)(a2 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel_endLocalEventDeferringForToken_withReason_, v5, CFSTR("_UIEventDeferringManager.m"), 3762, CFSTR("[%p] %s: Wrong method for deferring token: %@"), v5, "-[_UIEventDeferringManager endLocalEventDeferringForToken:withReason:]", a2);

  }
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "UTF8String");
  v8 = qword_1ECD7D1A8;
  if (!qword_1ECD7D1A8)
  {
    v8 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&qword_1ECD7D1A8);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    if (a2)
      v11 = *(void **)(a2 + 56);
    else
      v11 = 0;
    v12 = v11;
    *(_DWORD *)buf = 134349826;
    v61 = v5;
    v62 = 2050;
    v63 = a2;
    v64 = 2048;
    v65 = objc_msgSend(v12, "count");
    v66 = 2082;
    v67 = v7;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}p] End local event deferring requested for token: %{public}p; environments: %lu; reason: %{public}s",
      buf,
      0x2Au);

  }
  if (a2)
  {
    if (*(_BYTE *)(a2 + 16))
    {
      v13 = qword_1ECD7D1B0;
      if (!qword_1ECD7D1B0)
      {
        v13 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&qword_1ECD7D1B0);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349312;
        v61 = v5;
        v62 = 2050;
        v63 = a2;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}p] Performing no actions as deferring token has already been invalidated: %{public}p", buf, 0x16u);
      }
      return;
    }
    v47 = v6;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v15 = *(void **)(a2 + 56);
  }
  else
  {
    v47 = v6;
    v15 = 0;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
  }
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v55;
    v19 = CFSTR("LocalIdealRecord");
    while (2)
    {
      v20 = 0;
      v48 = v17;
      do
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(obj);
        -[_UIEventDeferringManager _currentLocalRecordsMatchingEnvironment:forcePreviousHardwareIdentifier:](v5, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v20), 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count"))
        {
          v22 = (id)objc_opt_new();
          objc_msgSend(v21, "objectForKeyedSubscript:", v19);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          if (v23)
          {
            WeakRetained = objc_loadWeakRetained((id *)(v23 + 32));

            if (WeakRetained == (id)a2)
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, v19);
          }
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("LocalCompatibilityRecord"));
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v26)
          {
            v28 = v18;
            v29 = v19;
            v30 = v5;
            v31 = objc_loadWeakRetained((id *)(v26 + 32));

            v32 = v31 == (id)a2;
            v5 = v30;
            v19 = v29;
            v18 = v28;
            v17 = v48;
            if (v32)
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, CFSTR("LocalCompatibilityRecord"));
          }

        }
        else
        {
          v22 = v21;
        }

        v33 = objc_msgSend(v22, "count");
        if (v33)
        {

          if (a2)
          {
            v42 = *(_QWORD *)(a2 + 48);
            v43 = *(id *)(a2 + 56);
            v44 = *(void **)(a2 + 64);
          }
          else
          {
            v43 = 0;
            v42 = 0;
            v44 = 0;
          }
          v45 = v44;
          -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:](v5, (uint64_t *)&endLocalEventDeferringForToken_withReason__actions, 2, v42, (_QWORD *)a2, v43, v45, 0, 0, v47);

          return;
        }
        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v17)
        continue;
      break;
    }
  }

  v34 = qword_1ECD7D1B8;
  if (!qword_1ECD7D1B8)
  {
    v34 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v34, (unint64_t *)&qword_1ECD7D1B8);
  }
  v35 = *(NSObject **)(v34 + 8);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    v61 = v5;
    v62 = 2050;
    v63 = a2;
    _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}p] No existing records found, invalidating token for all environments: %{public}p", buf, 0x16u);
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  if (a2)
    v36 = *(void **)(a2 + 56);
  else
    v36 = 0;
  v37 = v36;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v51 != v40)
          objc_enumerationMutation(v37);
        if (a2)
        {
          objc_msgSend(*(id *)(a2 + 8), "removeObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
          if (!*(_BYTE *)(a2 + 16) && !objc_msgSend(*(id *)(a2 + 8), "count"))
            *(_BYTE *)(a2 + 16) = 1;
        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v39);
  }

}

- (void)endRemoteEventDeferringForToken:(id)a3 withReason:
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (!a2 || *(_QWORD *)(a2 + 48) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel_endRemoteEventDeferringForToken_withReason_, a1, CFSTR("_UIEventDeferringManager.m"), 3817, CFSTR("[%p] %s: Wrong method for deferring token: %@"), a1, "-[_UIEventDeferringManager endRemoteEventDeferringForToken:withReason:]", a2);

  }
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "UTF8String");
  v8 = qword_1ECD7D1C0;
  if (!qword_1ECD7D1C0)
  {
    v8 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&qword_1ECD7D1C0);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    if (a2)
      v11 = *(void **)(a2 + 56);
    else
      v11 = 0;
    v12 = v11;
    *(_DWORD *)buf = 134349826;
    v21 = a1;
    v22 = 2050;
    v23 = a2;
    v24 = 2048;
    v25 = objc_msgSend(v12, "count");
    v26 = 2082;
    v27 = v7;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}p] End remote event deferring requested for token: %{public}p; environments: %lu; reason: %{public}s",
      buf,
      0x2Au);

  }
  if (!a2)
  {
    v16 = 0;
    v15 = 0;
    v17 = 0;
    goto LABEL_17;
  }
  if (!*(_BYTE *)(a2 + 16))
  {
    v15 = *(_QWORD *)(a2 + 48);
    v16 = *(id *)(a2 + 56);
    v17 = *(void **)(a2 + 64);
LABEL_17:
    v18 = v17;
    -[_UIEventDeferringManager _processEventDeferringActions:actionsCount:inScope:forDeferringToken:environments:target:addingRecreationReason:removingRecreationReason:forReason:](a1, endRemoteEventDeferringForToken_withReason__actions, 3, v15, (_QWORD *)a2, v16, v18, 0, 0, v6);

    return;
  }
  v13 = qword_1ECD7D1C8;
  if (!qword_1ECD7D1C8)
  {
    v13 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v13, (unint64_t *)&qword_1ECD7D1C8);
  }
  v14 = *(NSObject **)(v13 + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    v21 = a1;
    v22 = 2050;
    v23 = a2;
    _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}p] Performing no actions as deferring token has already been invalidated: %{public}p", buf, 0x16u);
  }
}

- (uint64_t)compareRemoteRuleOwningElement:(uint64_t)a3 toTopElementInEnvironment:
{
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  if (!a1 || (*(_BYTE *)(a1 + 80) & 1) != 0)
    return 0;
  -[_UIEventDeferringManager _topRemoteRecordInStackForEnvironment:](a1, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 32));
    v9 = WeakRetained;
    if (WeakRetained)
      v10 = (void *)*((_QWORD *)WeakRetained + 5);
    else
      v10 = 0;
    v11 = v10;

    if (v11 == a2)
      v12 = -1;
    else
      v12 = objc_msgSend(*(id *)(a1 + 104), "compareRemoteRuleOwningElement:toElement:inEnvironment:", v11, a2, a3);

  }
  else
  {
    v12 = -1;
  }

  return v12;
}

+ (uint64_t)isAnySceneBufferingEvents
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  unint64_t *v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v1)
  {
    v2 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v1; ++i)
      {
        if (*(_QWORD *)v8 != v2)
          objc_enumerationMutation(v0);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "_eventDeferringManager");
        v4 = (unint64_t *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v5 = atomic_load(v4 + 9);

          if (v5 > 0)
          {
            v1 = 1;
            goto LABEL_12;
          }
        }
      }
      v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v1)
        continue;
      break;
    }
  }
LABEL_12:

  return v1;
}

- (id)bufferKeyboardFocusEnvironmentEventsWithReason:(uint64_t)a1
{
  void *v4;
  int v5;
  id WeakRetained;
  objc_class *v7;
  const char *Name;
  id v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
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
  id v28;
  id v29;
  void *v30;
  unint64_t *v31;
  unint64_t v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
    return 0;
  objc_msgSend((id)a1, "_scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _UISceneSystemShellManagesKeyboardFocusForScene(v4);

  if (!v5)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v7 = (objc_class *)objc_opt_class();
  Name = class_getName(v7);

  v9 = objc_retainAutorelease(a2);
  v10 = objc_msgSend(v9, "UTF8String");
  v11 = bufferKeyboardFocusEnvironmentEventsWithReason____s_category;
  if (!bufferKeyboardFocusEnvironmentEventsWithReason____s_category)
  {
    v11 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&bufferKeyboardFocusEnvironmentEventsWithReason____s_category);
  }
  v12 = *(NSObject **)(v11 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = objc_loadWeakRetained((id *)(a1 + 88));
    *(_DWORD *)buf = 134349826;
    v37 = a1;
    v38 = 2082;
    v39 = Name;
    v40 = 2050;
    v41 = v14;
    v42 = 2082;
    v43 = v10;
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}p] Buffer events for keyboard focus environment in scene: <%{public}s: %{public}p>; reason: %{public}s",
      buf,
      0x2Au);

  }
  v15 = objc_alloc_init(MEMORY[0x1E0D00D80]);
  -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:]((unsigned __int8 *)a1, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(MEMORY[0x1E0D00CF8], "displayWithHardwareIdentifier:", v16);
  else
    objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDisplay:", v18);
  objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnvironment:", v19);

  objc_msgSend((id)a1, "windowHostingScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_FBSScene");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "identityToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToken:", v24);

  objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bufferEventsMatchingPredicate:withReason:", v15, v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p> - Wrapper"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc(MEMORY[0x1E0D01868]);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __75___UIEventDeferringManager_bufferKeyboardFocusEnvironmentEventsWithReason___block_invoke;
  v33[3] = &unk_1E16BACB8;
  v34 = v26;
  v35 = a1;
  v29 = v26;
  v30 = (void *)objc_msgSend(v28, "initWithIdentifier:forReason:invalidationBlock:", v27, v9, v33);
  v31 = (unint64_t *)(a1 + 72);
  do
    v32 = __ldaxr(v31);
  while (__stlxr(v32 + 1, v31));

  return v30;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (_UIEventDeferringBehavior)behavior
{
  return self->_behavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_transactionAssertion, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_previousExternalScreenIdentifier, 0);
  objc_storeStrong((id *)&self->_localTargetWindowPointersUnderObservation, 0);
  objc_storeStrong((id *)&self->_trackedLocalTargetWindowPointersByEnvironment, 0);
  objc_storeStrong((id *)&self->_targetWindowProvidersByEnvironment, 0);
  objc_storeStrong((id *)&self->_remoteDeferringRecordStacksByEnvironment, 0);
  objc_storeStrong((id *)&self->_localDeferringRecordsByEnvironment, 0);
}

@end
