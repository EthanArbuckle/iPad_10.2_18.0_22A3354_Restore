@implementation _UIDeepestPreferredEnvironmentSearch

- (id)deepestPreferredFocusableItemForEnvironment:(id)a3 withRequest:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _UIFocusEnvironmentPreferenceEnumerator *v11;
  uint64_t v12;
  id v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _BOOL4 v20;
  uint64_t v21;
  id v22;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _UIDeepestPreferredEnvironmentSearch *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;
  _UIDeepestPreferredEnvironmentSearch *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v7 = a3;
  v27 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEnvironmentPreferenceEnumerator.m"), 574, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  -[_UIDeepestPreferredEnvironmentSearch _reportStartingSearch](self, "_reportStartingSearch");
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__85;
  v58 = __Block_byref_object_dispose__85;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__85;
  v52 = __Block_byref_object_dispose__85;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__85;
  v46 = __Block_byref_object_dispose__85;
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "focusSystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_deepestPreferredFocusableItemCacheForCurrentUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (dyld_program_sdk_at_least())
    v10 = objc_msgSend(v27, "isMovementRequest") ^ 1;
  else
    v10 = 0;
  v11 = -[_UIFocusEnvironmentPreferenceEnumerator initWithEnumerationMode:]([_UIFocusEnvironmentPreferenceEnumerator alloc], "initWithEnumerationMode:", v10);
  -[_UIFocusEnvironmentPreferenceEnumerator setDebugLog:](v11, "setDebugLog:", self->_debugLog);
  v12 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke;
  v37[3] = &unk_1E16C6310;
  v40 = &v48;
  v41 = &v54;
  v13 = v9;
  v38 = v13;
  v39 = self;
  -[_UIFocusEnvironmentPreferenceEnumerator setDidVisitAllPreferencesForEnvironmentHandler:](v11, "setDidVisitAllPreferencesForEnvironmentHandler:", v37);
  v36[0] = v12;
  v36[1] = 3221225472;
  v36[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_2;
  v36[3] = &unk_1E16C6338;
  v36[4] = &v54;
  -[_UIFocusEnvironmentPreferenceEnumerator setShouldInferPreferenceForEnvironmentHandler:](v11, "setShouldInferPreferenceForEnvironmentHandler:", v36);
  v14 = -[_UIDeepestPreferredEnvironmentSearch allowsOverridingPreferedFocusEnvironments](self, "allowsOverridingPreferedFocusEnvironments");
  v25 = v7;
  if (v7)
  {
    v15 = v25;
    do
    {
      v16 = (void *)v55[5];
      v55[5] = 0;

      v17 = (void *)v49[5];
      v49[5] = 0;

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_3;
      v28[3] = &unk_1E16C6360;
      v29 = v13;
      v33 = &v48;
      v18 = v15;
      v30 = v18;
      v34 = &v54;
      v19 = v27;
      v35 = &v42;
      v31 = v19;
      v32 = self;
      -[_UIFocusEnvironmentPreferenceEnumerator enumeratePreferencesForEnvironment:usingBlock:](v11, "enumeratePreferencesForEnvironment:usingBlock:", v18, v28);
      if (v43[5])
        -[_UIDeepestPreferredEnvironmentSearch _reportDidFindLockedFocusEnvironment:](self, "_reportDidFindLockedFocusEnvironment:");
      -[_UIDeepestPreferredEnvironmentSearch _reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:](self, "_reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:", v55[5]);
      if (v43[5])
        v20 = 0;
      else
        v20 = v14;
      if (v20 && (v21 = v49[5]) != 0)
      {
        -[_UIDeepestPreferredEnvironmentSearch _overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:](self, "_overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:", v21, v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }

    }
    while (v15);
  }
  v22 = (id)v55[5];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  return v22;
}

- (id)deepestPreferredFocusEnvironmentForEnvironment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _UIFocusEnvironmentPreferenceEnumerator *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEnvironmentPreferenceEnumerator.m"), 701, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__85;
  v31 = __Block_byref_object_dispose__85;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__85;
  v25 = __Block_byref_object_dispose__85;
  v26 = 0;
  v8 = -[_UIFocusEnvironmentPreferenceEnumerator initWithEnumerationMode:]([_UIFocusEnvironmentPreferenceEnumerator alloc], "initWithEnumerationMode:", 1);
  -[_UIFocusEnvironmentPreferenceEnumerator setAllowsInferringPreferences:](v8, "setAllowsInferringPreferences:", 0);
  if (v5)
  {
    v9 = v16;
    while (1)
    {
      v10 = (void *)v28[5];
      v28[5] = 0;

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __87___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusEnvironmentForEnvironment___block_invoke;
      v17[3] = &unk_1E16C6388;
      v19 = &v21;
      v18 = v6;
      v20 = &v27;
      -[_UIFocusEnvironmentPreferenceEnumerator enumeratePreferencesForEnvironment:usingBlock:](v8, "enumeratePreferencesForEnvironment:usingBlock:", v9, v17);
      if (v22[5])
      {
        -[_UIDeepestPreferredEnvironmentSearch _reportDidFindLockedFocusEnvironment:](self, "_reportDidFindLockedFocusEnvironment:");
        if (v22[5])
          break;
      }
      v11 = v28[5];
      if (!v11)
        break;
      -[_UIDeepestPreferredEnvironmentSearch _overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:](self, "_overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:", v11, v7);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
      if (!v12)
        goto LABEL_11;
    }

  }
LABEL_11:
  v13 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (id)_overridingPreferredFocusEnvironmentForPreferredEnvironment:(id)a3 visitedFocusEnvironments:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEnvironmentPreferenceEnumerator.m"), 747, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredDestinationEnvironment"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEnvironmentPreferenceEnumerator.m"), 748, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visitedFocusEnvironments"));

LABEL_3:
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__85;
  v31 = __Block_byref_object_dispose__85;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__85;
  v25 = __Block_byref_object_dispose__85;
  v26 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __125___UIDeepestPreferredEnvironmentSearch__overridingPreferredFocusEnvironmentForPreferredEnvironment_visitedFocusEnvironments___block_invoke;
  v17[3] = &unk_1E16C63B0;
  v10 = v9;
  v18 = v10;
  v19 = &v27;
  v20 = &v21;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(v7, v17);
  v11 = v28[5];
  if (v11)
  {
    -[_UIDeepestPreferredEnvironmentSearch _reportDidFindOverridingPreferredFocusEnvironment:source:](self, "_reportDidFindOverridingPreferredFocusEnvironment:source:", v11, v22[5]);
    v12 = (void *)v28[5];
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (void)_reportStartingSearch
{
  void *v2;
  id v3;

  -[_UIDeepestPreferredEnvironmentSearch debugLog](self, "debugLog");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIDebugLogMessage messageWithString:](_UIDebugLogMessage, "messageWithString:", CFSTR("Starting preferred focus search."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addMessage:", v2);

}

- (void)_reportFoundFocusableItem:(id)a3 inContext:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a4, "debugStack", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIDebugLogMessage messageWithStyle:string:](_UIDebugLogMessage, "messageWithStyle:string:", 2, CFSTR("It's focusable!"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMessage:", v4);

}

- (void)_reportFinishedEvaluatingAllPreferencesForEnvironmentInContext:(id)a3 result:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a3;
  objc_msgSend(v5, "debugStack");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(v5, "isPreferredByItself");

    if (a4 != 3 && (v8 & 1) == 0)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      objc_msgSend(v5, "preferredEnvironments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "environment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "indexOfObject:", v10);

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "preferredEnvironments");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        objc_msgSend(v5, "preferredEnvironments");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11 + 1, v13 - (v11 + 1));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __110___UIDeepestPreferredEnvironmentSearch__reportFinishedEvaluatingAllPreferencesForEnvironmentInContext_result___block_invoke;
        v18[3] = &unk_1E16C63D8;
        v19 = v5;
        v20 = &v21;
        objc_msgSend(v14, "enumerateObjectsAtIndexes:options:usingBlock:", v15, 0, v18);

      }
      if (*((_BYTE *)v22 + 24))
      {
        objc_msgSend(v5, "debugStack");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIDebugLogMessage messageWithStyle:string:](_UIDebugLogMessage, "messageWithStyle:string:", 3, CFSTR("Found nothing."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addMessage:", v17);

      }
      _Block_object_dispose(&v21, 8);
    }
  }

}

- (void)_reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_UIDeepestPreferredEnvironmentSearch debugLog](self, "debugLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIDeepestPreferredEnvironmentSearch debugLog](self, "debugLog");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v14;
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v7);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = CFSTR("(nil)");
    }

    objc_msgSend(v6, "stringWithFormat:", CFSTR("Finished enumerating preferred environments. Preferring %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebugLogMessage messageWithStyle:string:](_UIDebugLogMessage, "messageWithStyle:string:", 2, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addMessage:", v13);

  }
}

- (void)_reportDidFindOverridingPreferredFocusEnvironment:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[_UIDeepestPreferredEnvironmentSearch debugLog](self, "debugLog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = v6;
  v22 = v10;
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v22);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v10 = v22;
  }
  else
  {
    v14 = CFSTR("(nil)");
  }

  v15 = v7;
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v15);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = CFSTR("(nil)");
  }

  objc_msgSend(v9, "stringWithFormat:", CFSTR("Found overide to environment %@. (source: %@)"), v14, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDebugLogMessage messageWithStyle:string:](_UIDebugLogMessage, "messageWithStyle:string:", 2, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addMessage:", v21);

}

- (void)_reportDidFindLockedFocusEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[_UIDeepestPreferredEnvironmentSearch debugLog](self, "debugLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v13 = v4;
  if (v13)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v13);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("(nil)");
  }

  objc_msgSend(v6, "stringWithFormat:", CFSTR("Found locked focus environment %@."), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDebugLogMessage messageWithStyle:string:](_UIDebugLogMessage, "messageWithStyle:string:", 3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMessage:", v12);

}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return self->_allowsOverridingPreferedFocusEnvironments;
}

- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3
{
  self->_allowsOverridingPreferedFocusEnvironments = a3;
}

- (_UIDebugLogNode)debugLog
{
  return self->_debugLog;
}

- (void)setDebugLog:(id)a3
{
  objc_storeStrong((id *)&self->_debugLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLog, 0);
}

@end
