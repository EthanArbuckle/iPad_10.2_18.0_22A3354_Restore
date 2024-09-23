@implementation UIEventDeferringBehavior

void __65___UIEventDeferringBehavior_Default_wantsLocalCompatibilityRules__block_invoke()
{
  int v0;
  BOOL v1;
  char v2;
  int v3;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v3 = _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses))
  {
    v1 = 1;
  }
  else
  {
    do
    {
      v1 = v0 >= v3;
      if (v0 < v3)
        break;
      _UIInternalPreferenceSync(v0, &_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses, (uint64_t)CFSTR("ShouldWriteCompatibilityEventDeferringRulesForAllProcesses"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v3 = _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses;
    }
    while (v0 != _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses);
  }
  if (byte_1ECD75E94)
    v2 = 1;
  else
    v2 = v1;
  wantsLocalCompatibilityRules_defaultWantsCompatRules = v2;
}

void __79___UIEventDeferringBehavior_SystemShell_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79___UIEventDeferringBehavior_SystemShell_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __79___UIEventDeferringBehavior_SystemShell_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  __CFString *v11;
  id v12;
  id v13;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) & 1, CFSTR("hasSystemShellBehaviorDelegate"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 32) >> 1) & 1, CFSTR("delegateWantsLocalCompatibilityRules"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 32) >> 2) & 1, CFSTR("delegateShouldSuppressRemoteRule"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 32) >> 3) & 1, CFSTR("delegateCompareRemoteRules"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));

  if (WeakRetained)
  {
    v7 = *(void **)(a1 + 32);
    v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    if (v13)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v13);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = CFSTR("(nil)");
    }

    v12 = (id)objc_msgSend(v7, "appendObject:withName:", v11, CFSTR("systemShellBehaviorDelegate"));
  }
}

@end
