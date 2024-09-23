@implementation UIFocusDebugger

+ (id)help
{
  void *v2;
  id v3;
  void (**v4)(void *, const __CFString *, const __CFString *, const __CFString *, const __CFString *);
  void *v5;
  _QWORD aBlock[4];
  id v8;

  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."));
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", CFSTR("\nFocus Debugging Utilities:"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__UIFocusDebugger_help__block_invoke;
  aBlock[3] = &unk_1E16C6670;
  v8 = v2;
  v3 = v2;
  v4 = (void (**)(void *, const __CFString *, const __CFString *, const __CFString *, const __CFString *))_Block_copy(aBlock);
  v4[2](v4, CFSTR("Status"), CFSTR("po UIFocusDebugger.status()"), CFSTR("po [UIFocusDebugger status]"), CFSTR("Outputs information for the currently focused item."));
  v4[2](v4, CFSTR("Diagnosing Focusability Issues"), CFSTR("po UIFocusDebugger.checkFocusability(for: <item reference>)"), CFSTR("po [UIFocusDebugger checkFocusabilityForItem:<item reference>]"), CFSTR("Outputs a diagnosis of the specified item's focusability, including any known issues that may be preventing focusability."));
  +[_UIFocusDebuggerStringOutput outputWithString:](_UIFocusDebuggerStringOutput, "outputWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __23__UIFocusDebugger_help__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;

  v9 = *(void **)(a1 + 32);
  v12 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\n%@:"), a2);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\tSwift: %@"), v11);

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\tObjC:  %@"), v10);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\n\tOverview:\n\t%@"), v12);

}

+ (id)status
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."));
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)UIApp, "connectedScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  +[UIFocusSystem _allFocusSystems](UIFocusSystem, "_allFocusSystems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v9, "_hostFocusSystem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          +[_UIFocusSystemSceneComponent sceneComponentForFocusSystem:](_UIFocusSystemSceneComponent, "sceneComponentForFocusSystem:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_scene");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 && objc_msgSend(v3, "containsObject:", v12))
            objc_msgSend(v2, "setObject:forKey:", v12, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }
  v24 = v3;

  +[_UIDebugLogNode rootNode](_UIDebugLogNode, "rootNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v2, "count");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v2, "keyEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v2, "objectForKey:", v20, v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_statusForFocusSystem:scene:includeSceneLog:includeDeferralTarget:", v20, v21, v14 > 1, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addMessage:", v22);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

  return v13;
}

+ (id)_verboseStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."));
  +[_UIDebugLogNode rootNode](_UIDebugLogNode, "rootNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[UIFocusSystem _allFocusSystems](UIFocusSystem, "_allFocusSystems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        +[_UIFocusSystemSceneComponent sceneComponentForFocusSystem:](_UIFocusSystemSceneComponent, "sceneComponentForFocusSystem:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_scene");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_statusForFocusSystem:scene:includeSceneLog:includeDeferralTarget:", v9, v11, 1, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addMessage:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)_statusForFocusSystem:(id)a3 scene:(id)a4 includeSceneLog:(BOOL)a5 includeDeferralTarget:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  objc_class *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  __CFString *v37;
  void *v38;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = a4;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."));
  objc_msgSend(v9, "focusedItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = CFSTR("(nil)");
  }

  +[_UIDebugLogMessage messageWithStyle:string:](_UIDebugLogNode, "messageWithStyle:string:", 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v12, "_isEnabled");
  v19 = CFSTR("NO");
  if (v18)
    v19 = CFSTR("YES");
  +[_UIDebugLogMessage messageWithFormat:](_UIDebugLogMessage, "messageWithFormat:", CFSTR("enabled: %@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addMessage:", v20);

  if (v10 && v7)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = v10;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p>"), v24, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIDebugLogMessage messageWithFormat:](_UIDebugLogMessage, "messageWithFormat:", CFSTR("scene: %@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addMessage:", v26);

  }
  v27 = v11;
  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p>"), v30, v27);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = CFSTR("(nil)");
  }

  +[_UIDebugLogMessage messageWithFormat:](_UIDebugLogMessage, "messageWithFormat:", CFSTR("focused item: %@"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addMessage:", v32);

  if (v6)
  {
    objc_msgSend(v12, "valueForKeyPath:", CFSTR("_deferredFocusUpdateTarget"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)MEMORY[0x1E0CB3940];
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("<%@: %p>"), v36, v33);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v37 = CFSTR("(nil)");
    }
    +[_UIDebugLogMessage messageWithFormat:](_UIDebugLogMessage, "messageWithFormat:", CFSTR("deferral target: %@"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addMessage:", v38);

  }
  return v17;
}

+ (id)_legacy_checkFocusabilityForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."));
  +[UIFocusDebugger checkFocusabilityForItem:](UIFocusDebugger, "checkFocusabilityForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)checkFocusabilityForItem:(id)item
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _UIDebugIssueReport *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int IsEligibleForFocusInteraction;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  _UIFocusMap *v24;
  _UIDebugIssueReportFormatter *v25;
  void *v26;
  void *v28;

  v5 = item;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusDebugger.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "focusedItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v5)
    {
      v9 = objc_alloc_init(_UIDebugIssueReport);
      v10 = objc_msgSend(v5, "canBecomeFocused");
      if ((v10 & 1) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_8;
        -[_UIDebugIssueReport issues](v9, "issues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        objc_msgSend(v5, "_diagnoseFocusabilityForReport:", v9);
        -[_UIDebugIssueReport issues](v9, "issues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v12 == v14)
        {
LABEL_8:
          +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", CFSTR("This item returns NO from -canBecomeFocused."));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIDebugIssueReport addIssue:](v9, "addIssue:", v15);

        }
      }
      IsEligibleForFocusInteraction = _UIFocusEnvironmentIsEligibleForFocusInteraction(v5);
      if (!IsEligibleForFocusInteraction
        || (objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v5, "_shouldAlwaysDiagnoseFocusInteractionEligibility"))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[_UIDebugIssueReport issues](v9, "issues");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          objc_msgSend(v5, "_diagnoseFocusInteractionEligibilityForReport:", v9);
          -[_UIDebugIssueReport issues](v9, "issues");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v18 != objc_msgSend(v19, "count");

        }
        else
        {
          v20 = 0;
        }
        if (((IsEligibleForFocusInteraction | v20) & 1) == 0)
        {
          +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", CFSTR("This item is not eligible for focus, but the reason is unknown."));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIDebugIssueReport addIssue:](v9, "addIssue:", v23);
          goto LABEL_24;
        }
      }
      else
      {
        v20 = 0;
      }
      if (((v20 | v10 ^ 1) & 1) != 0)
      {
LABEL_25:
        v25 = objc_alloc_init(_UIDebugIssueReportFormatter);
        -[_UIDebugIssueReportFormatter setHeader:](v25, "setHeader:", CFSTR("The following issues were found that would prevent this item from being focusable:"));
        -[_UIDebugIssueReportFormatter setNoIssuesDescription:](v25, "setNoIssuesDescription:", CFSTR("This item should be focusable.\n\nIf you are still having trouble focusing this item, consider the following:\n – This tool will not detect if this item is denied focus as the result of returning NO from -shouldUpdateFocusInContext:.\n – This tool will not detect if another item or guide is redirecting focus movement away from this item.\n – This tool may not detect if this item has dynamic conditions that affect its focusability."));
        -[_UIDebugIssueReportFormatter stringFromReport:](v25, "stringFromReport:", v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIFocusDebuggerStringOutput outputWithString:](_UIFocusDebuggerStringOutput, "outputWithString:", v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      }
      objc_msgSend(v7, "_focusMapContainer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = -[_UIFocusMap initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:]([_UIFocusMap alloc], "initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", v7, v23, 0, 0, 0);
        -[_UIFocusMap diagnoseFocusabilityForItem:report:](v24, "diagnoseFocusabilityForItem:report:", v5, v9);

      }
LABEL_24:

      goto LABEL_25;
    }
    v21 = CFSTR("This item is currently focused.");
  }
  else
  {
    v21 = CFSTR("This item is not part of any focus system, so focusability is not applicable.");
  }
  +[_UIFocusDebuggerStringOutput outputWithString:](_UIFocusDebuggerStringOutput, "outputWithString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v22;
}

+ (id)simulateFocusUpdateRequestFromEnvironment:(id)environment
{
  id v5;
  void *v6;
  id v7;
  _UIDebugLogReport *v8;
  _UIDebugIssueReport *v9;
  _UIDebugLogReport *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  _UIDebugIssueReport *v23;
  void *v24;
  uint64_t v25;
  _UIDebugIssueReportFormatter *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  objc_class *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  _UIFocusUpdateRequest *v53;
  __CFString *v54;
  void *v55;

  v5 = environment;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusDebugger.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v53 = -[_UIFocusUpdateRequest initWithFocusSystem:environment:]([_UIFocusUpdateRequest alloc], "initWithFocusSystem:environment:", v6, v5);
    v7 = -[UIFocusUpdateContext _initWithFocusUpdateRequest:]([UIFocusUpdateContext alloc], "_initWithFocusUpdateRequest:", v53);
    v8 = objc_alloc_init(_UIDebugLogReport);
    objc_msgSend(v7, "_setPreferredFocusReport:", v8);

    v9 = objc_alloc_init(_UIDebugIssueReport);
    objc_msgSend(v7, "_setValidationReport:", v9);

    v10 = objc_alloc_init(_UIDebugLogReport);
    objc_msgSend(v7, "previouslyFocusedItem");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "stringWithFormat:", CFSTR("(%@ is currently focused)"), v15);
      v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = CFSTR("(Nothing is currently focused)");
    }
    v18 = v5;
    if (v5)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v18);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = CFSTR("(nil)");
    }
    v55 = (void *)v11;

    v54 = (__CFString *)v16;
    -[_UIDebugLogReport addMessageWithFormat:](v10, "addMessageWithFormat:", CFSTR("Simulating a fake focus update request from %@... %@"), v22, v16);

    -[_UIDebugLogReport addLineBreak](v10, "addLineBreak");
    v23 = objc_alloc_init(_UIDebugIssueReport);
    objc_msgSend(v6, "_debug_isEnvironmentEligibleForFocusUpdate:debugReport:", v18, v23);
    -[_UIDebugIssueReport issues](v23, "issues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      v26 = objc_alloc_init(_UIDebugIssueReportFormatter);
      -[_UIDebugIssueReportFormatter setHeader:](v26, "setHeader:", CFSTR("The following issues were found that would normally prevent this environment's request from being accepted by the focus system (these will be ignored for the purposes of this test):"));
      -[_UIDebugIssueReportFormatter stringFromReport:](v26, "stringFromReport:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDebugLogReport addMessage:](v10, "addMessage:", v27);

      -[_UIDebugLogReport addLineBreak](v10, "addLineBreak");
    }
    objc_msgSend(v7, "nextFocusedItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebugReportFormatter defaultFormatter](_UIDebugLogReportFormatter, "defaultFormatter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_preferredFocusReport");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringFromReport:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDebugLogReport addMessage:](v10, "addMessage:", v31);

    v32 = objc_msgSend(v7, "_isValidInFocusSystem:", v6);
    objc_msgSend(v7, "_validationReport");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "issues");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      -[_UIDebugLogReport addLineBreak](v10, "addLineBreak");
      +[UIFocusUpdateContext _defaultValidationReportFormatter](UIFocusUpdateContext, "_defaultValidationReportFormatter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_validationReport");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringFromReport:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDebugLogReport addMessage:](v10, "addMessage:", v38);

    }
    -[_UIDebugLogReport resetIndentLevel](v10, "resetIndentLevel");
    -[_UIDebugLogReport addLineBreak](v10, "addLineBreak");
    if (v32)
    {
      if (v28)
      {
        v39 = (void *)MEMORY[0x1E0CB3940];
        v40 = v28;
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR("<%@: %p>"), v42, v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UIDebugLogReport addMessageWithFormat:](v10, "addMessageWithFormat:", CFSTR("Simulated Result: Successfully updated focus to %@."), v43);
LABEL_26:

LABEL_29:
        +[_UIDebugReportFormatter defaultFormatter](_UIDebugLogReportFormatter, "defaultFormatter");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringFromReport:", v10);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        +[_UIFocusDebuggerStringOutput outputWithString:](_UIFocusDebuggerStringOutput, "outputWithString:", v50);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_30;
      }
      v44 = CFSTR("Simulated Result: Successfully updated focus to nil.");
    }
    else if (v28 == v55)
    {
      if (v55)
      {
        v45 = (void *)MEMORY[0x1E0CB3940];
        v46 = v55;
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringWithFormat:", CFSTR("<%@: %p>"), v48, v46);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UIDebugLogReport addMessageWithFormat:](v10, "addMessageWithFormat:", CFSTR("Simulated Result: No change, %@ is still focused."), v43);
        goto LABEL_26;
      }
      v44 = CFSTR("Simulated Result: No change, nothing is still focused.");
    }
    else
    {
      v44 = CFSTR("Simulated Result: Failed to update focus.");
    }
    -[_UIDebugLogReport addMessage:](v10, "addMessage:", v44);
    goto LABEL_29;
  }
  +[_UIFocusDebuggerStringOutput outputWithString:](_UIFocusDebuggerStringOutput, "outputWithString:", CFSTR("This environment is not part of any focus system, and so cannot request a focus update."));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v17;
}

+ (id)_ancestryForEnvironment:(id)a3
{
  id v5;
  _UIDebugLogReport *v6;
  id v7;
  _UIDebugLogReport *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  _UIDebugLogReport *v15;
  id v16;

  v5 = a3;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusDebugger.m"), 368, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v6 = objc_alloc_init(_UIDebugLogReport);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__UIFocusDebugger__ancestryForEnvironment___block_invoke;
  v14[3] = &unk_1E16C6698;
  v15 = v6;
  v16 = v5;
  v7 = v5;
  v8 = v6;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(v7, v14);
  +[_UIDebugReportFormatter defaultFormatter](_UIDebugLogReportFormatter, "defaultFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromReport:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIFocusDebuggerStringOutput outputWithString:](_UIFocusDebuggerStringOutput, "outputWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __43__UIFocusDebugger__ancestryForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v10);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }
  objc_msgSend(v4, "addMessage:", v8);

  v9 = v10;
  if (*(id *)(a1 + 40) == v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "incrementIndentLevel");
    v9 = v10;
  }

}

+ (id)focusGroupsForEnvironment:(id)environment
{
  id v3;
  void *v4;
  _UIFocusMovementRequest *v5;
  _UIFocusMovementInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = environment;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."));
  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v4);
  v6 = -[_UIFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", 16, 0, 1, 0, 1, 2, 5);
  -[_UIFocusMovementRequest setMovementInfo:](v5, "setMovementInfo:", v6);

  objc_msgSend(v4, "_movementPerformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextForFocusMovement:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  +[_UIDebugLogMessage messageWithStyle:string:](_UIDebugLogMessage, "messageWithStyle:string:", 1, CFSTR("Focus Group Hierarchy:"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addMessage:", v10);

  objc_msgSend(v8, "_focusMapSearchInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusGroupMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "focusGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __45__UIFocusDebugger_focusGroupsForEnvironment___block_invoke;
  v20[3] = &unk_1E16C66C0;
  v21 = v9;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __45__UIFocusDebugger_focusGroupsForEnvironment___block_invoke_2;
  v18[3] = &unk_1E16C66E8;
  v19 = v21;
  v15 = v21;
  __recursePreOrderDepthFirstTraversal(v13, sel_childGroups, 0, v20, v18);
  objc_msgSend(v15, "rootNode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __45__UIFocusDebugger_focusGroupsForEnvironment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = v5;
  if (a3
    || (objc_msgSend(v5, "parentGroup"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDebugLogMessage messageWithString:](_UIDebugLogNode, "messageWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "pushNode:", v8);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id *__45__UIFocusDebugger_focusGroupsForEnvironment___block_invoke_2(id *result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
    return (id *)(id)objc_msgSend(result[4], "popNode");
  return result;
}

+ (id)preferredFocusEnvironmentsForEnvironment:(id)environment
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _UIFocusEnvironmentPreferenceEnumerator *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = environment;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."));
  +[_UIDebugLogNode rootNode](_UIDebugLogNode, "rootNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[_UIDebugLogMessage messageWithStyle:string:](_UIDebugLogMessage, "messageWithStyle:string:", 1, CFSTR("Preferred focus environments:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addMessage:", v6);

    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIFocusEnvironmentPreferenceEnumerator initWithEnumerationMode:]([_UIFocusEnvironmentPreferenceEnumerator alloc], "initWithEnumerationMode:", 1);
    -[_UIFocusEnvironmentPreferenceEnumerator setAllowsInferringPreferences:](v9, "setAllowsInferringPreferences:", 0);
    -[_UIFocusEnvironmentPreferenceEnumerator setDebugLog:](v9, "setDebugLog:", v4);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__UIFocusDebugger_preferredFocusEnvironmentsForEnvironment___block_invoke;
    v12[3] = &unk_1E16C6710;
    v13 = v7;
    v14 = v5;
    v10 = v7;
    -[_UIFocusEnvironmentPreferenceEnumerator enumeratePreferencesForEnvironment:usingBlock:](v9, "enumeratePreferencesForEnvironment:usingBlock:", v3, v12);

  }
  else
  {
    +[_UIDebugLogMessage messageWithStyle:string:](_UIDebugLogMessage, "messageWithStyle:string:", 4, CFSTR("The environment is not connected to a focus system."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addMessage:", v8);
  }

  return v4;
}

void __60__UIFocusDebugger_preferredFocusEnvironmentsForEnvironment___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(v14, "isPreferredByItself"))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v14, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
    _UIFocusItemSafeCast(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      +[UIColor systemYellowColor](UIColor, "systemYellowColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("Environment seen previously. Skipping.");
      v11 = CFSTR("!");
    }
    else if (v7 && _UIFocusItemIsFocusedOrFocusableInFocusSystem(v7, *(void **)(a1 + 40)))
    {
      +[UIColor systemBlueColor](UIColor, "systemBlueColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("Environment is focusable.");
      v11 = CFSTR("*");
    }
    else
    {
      v9 = 0;
      v10 = 0;
      v11 = &stru_1E16EDF20;
    }
    if (-[__CFString length](v10, "length"))
    {
      +[_UIDebugLogMessage messageWithPrefix:color:string:](_UIDebugLogMessage, "messageWithPrefix:color:string:", v11, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "debugStack");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addMessage:", v12);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    *a3 = v6;

  }
}

@end
