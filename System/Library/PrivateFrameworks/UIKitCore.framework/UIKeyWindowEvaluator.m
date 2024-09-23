@implementation UIKeyWindowEvaluator

void __69___UIKeyWindowEvaluator_windowScene_willTransitionToActivationState___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  -[UIWindowScene _keyWindowDidBecomeApplicationKeyWithoutEvaluationRequest](a2);
}

void __69___UIKeyWindowEvaluator_windowScene_willTransitionToActivationState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;

  _NSStringFromUISceneActivationState(*(_QWORD *)(a1 + 48));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  _NSStringFromUISceneActivationState(*(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyWindowEvaluator _stackForWindowScene:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);

  if (*(_BYTE *)(a1 + 64) && v4 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: Window scene transitioned from %@ to %@"), objc_opt_class(), *(_QWORD *)(a1 + 40), v20, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_UIKeyWindowEvaluator _evaluationStrategyForScene:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
    -[UIWindowScene _keyWindow](*(id **)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 65) && !v8 && v9)
    {
      -[_UIKeyWindowSceneStack pushWindowScene:withEvaluationStrategy:forReason:](v3, *(void **)(a1 + 40), 0, v6);
    }
    else if (v3)
    {
      -[_UIKeyWindowSceneStack _evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:forReason:](v3, 0, v6);
    }
    -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v3);
    v15 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v15;
    if (!v3 || (*(_BYTE *)(v3 + 32) & 1) == 0 || (void *)v15 == v7)
      goto LABEL_23;
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(id **)(a1 + 40);
    v18 = v6;
    v6 = v18;
    if (v17)
    {
      -[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:](v17, v16, (uint64_t)&__block_literal_global_81_5, 0, 0, 0, 0, v19, v18, 0);
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (*(_BYTE *)(a1 + 66) && v4 == v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: Window scene transitioned from %@ to %@"), objc_opt_class(), *(_QWORD *)(a1 + 40), v20, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[_UIKeyWindowSceneStack keyWindowSceneInStack](0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    -[_UIKeyWindowSceneStack _evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene:forReason:](v3, 0, v6);
    -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if ((*(_BYTE *)(v3 + 32) & 1) == 0 || (void *)v10 == v7)
      goto LABEL_23;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = v6;
    v6 = v13;
    if (v12)
    {
      -[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:](v12, 0, (uint64_t)&__block_literal_global_82_4, 0, 0, 0, 0, v14, v13, 0);
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:

}

void __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int8x16_t v12;
  int8x16_t v13;
  _QWORD v14[4];
  int8x16_t v15;
  _QWORD v16[4];
  int8x16_t v17;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200), CFSTR("applicationKeyWindow"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184), CFSTR("keyWindowSceneStack"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192), CFSTR("excludedSceneStack"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "activeMultilinePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v16[3] = &unk_1E16B1B50;
  v12 = *(int8x16_t *)(a1 + 32);
  v8 = (id)v12.i64[0];
  v17 = vextq_s8(v12, v12, 8uLL);
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("countOfFBSSceneBackedScenesByIdiom"), v6, v16);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "activeMultilinePrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v14[3] = &unk_1E16B1B50;
  v13 = *(int8x16_t *)(a1 + 32);
  v11 = (id)v13.i64[0];
  v15 = vextq_s8(v13, v13, 8uLL);
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("defaultEvaluationStrategyByIdiom"), v10, v14);

}

void __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  id v9;

  for (i = 12; i != 23; ++i)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * i);
    if (v3 != -1)
    {
      v4 = *(void **)(a1 + 40);
      if (v3 == 1)
        v5 = CFSTR("SystemShellManaged");
      else
        v5 = &stru_1E16EDF20;
      if (v3)
        v6 = (__CFString *)v5;
      else
        v6 = CFSTR("LastOneWins");
      v7 = v6;
      _NSStringFromUIUserInterfaceIdiom(i - 13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v4, "appendObject:withName:", v7, v8);

    }
  }
}

void __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  for (i = 1; i != 12; ++i)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * i))
    {
      v3 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _NSStringFromUIUserInterfaceIdiom(i - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v3, "appendObject:withName:", v4, v5);

    }
  }
}

void __85___UIKeyWindowEvaluator__updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  v3 = a1[4];
  v4 = a1[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85___UIKeyWindowEvaluator__updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest___block_invoke_2;
  v5[3] = &__block_descriptor_40_e23_B16__0__UIWindowScene_8l;
  v5[4] = a1[6];
  -[_UIKeyWindowSceneStack migrateFromEvaluationStrategy:toEvaluationStrategy:windowScenesPassingTest:](a2, v3, v4, (uint64_t)v5);
}

BOOL __85___UIKeyWindowEvaluator__updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  objc_msgSend(a2, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_userInterfaceIdiom");

  return v6 == *(_QWORD *)(a1 + 32);
}

id __30___UIKeyWindowEvaluator__init__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "descriptionBuilderWithMultilinePrefix:", &stru_1E16EDF20);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __40___UIKeyWindowEvaluator_sharedEvaluator__block_invoke()
{
  _UIKeyWindowEvaluator *v0;
  _QWORD *v1;
  __int128 v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v0 = [_UIKeyWindowEvaluator alloc];
  if (v0
    && (v7.receiver = v0,
        v7.super_class = (Class)_UIKeyWindowEvaluator,
        (v1 = objc_msgSendSuper2(&v7, sel_init)) != 0))
  {
    v1[22] = -1;
    *(_QWORD *)&v2 = -1;
    *((_QWORD *)&v2 + 1) = -1;
    *((_OWORD *)v1 + 9) = v2;
    *((_OWORD *)v1 + 10) = v2;
    *((_OWORD *)v1 + 7) = v2;
    *((_OWORD *)v1 + 8) = v2;
    *((_OWORD *)v1 + 6) = v2;
    v3 = v1;
    BSLogAddStateCaptureBlockWithTitle();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v3[26];
    v3[26] = v4;

  }
  else
  {
    v3 = 0;
  }
  v6 = (void *)qword_1ECD801E0;
  qword_1ECD801E0 = (uint64_t)v3;

}

void __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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
  v6[2] = __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

BOOL __56___UIKeyWindowEvaluator_keyWindowForUserInterfaceIdiom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_userInterfaceIdiom");

  return v4 == *(_QWORD *)(a1 + 32);
}

void __69___UIKeyWindowEvaluator_windowScene_willTransitionToActivationState___block_invoke_3(uint64_t a1, uint64_t *a2)
{
  -[UIWindowScene _keyWindowDidBecomeApplicationKeyWithoutEvaluationRequest](a2);
}

void __87___UIKeyWindowEvaluator_windowSceneDidBecomeTargetOfKeyboardEventDeferringEnvironment___block_invoke(uint64_t a1, uint64_t *a2)
{
  -[UIWindowScene _keyWindowDidBecomeApplicationKeyWithoutEvaluationRequest](a2);
}

void __51___UIKeyWindowEvaluator_windowSceneWillInvalidate___block_invoke(uint64_t a1, uint64_t *a2)
{
  -[UIWindowScene _keyWindowDidBecomeApplicationKeyWithoutEvaluationRequest](a2);
}

BOOL __51___UIKeyWindowEvaluator_windowSceneWillInvalidate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

@end
