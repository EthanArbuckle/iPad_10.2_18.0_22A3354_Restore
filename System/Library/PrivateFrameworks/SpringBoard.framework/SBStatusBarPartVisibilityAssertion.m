@implementation SBStatusBarPartVisibilityAssertion

- (SBStatusBarPartVisibilityAssertion)initWithIdentifier:(id)a3 statusBar:(id)a4 forReason:(id)a5
{
  id v9;
  SBStatusBarPartVisibilityAssertion *v10;
  SBStatusBarPartVisibilityAssertion *v11;
  uint64_t v12;
  NSMutableSet *hiddenParts;
  objc_super v15;

  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBStatusBarPartVisibilityAssertion;
  v10 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](&v15, sel_initWithIdentifier_forReason_invalidationBlock_, a3, a5, &__block_literal_global_76);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_statusBar, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    hiddenParts = v11->_hiddenParts;
    v11->_hiddenParts = (NSMutableSet *)v12;

  }
  return v11;
}

void __77__SBStatusBarPartVisibilityAssertion_initWithIdentifier_statusBar_forReason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_class();
  SBSafeCast(v3, v2);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4[7];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "_setStatusBarPartWithIdentifier:hidden:animatedWithDuration:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0, 0.0, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isHidingStatusBarPartWithIdentifier:(id)a3
{
  return -[NSMutableSet containsObject:](self->_hiddenParts, "containsObject:", a3);
}

- (void)setStatusBarPartWithIdentifier:(id)a3 hidden:(BOOL)a4 animated:(BOOL)a5
{
  double v5;

  v5 = 0.35;
  if (!a5)
    v5 = 0.0;
  -[SBStatusBarPartVisibilityAssertion setStatusBarPartWithIdentifier:hidden:animatedWithDuration:](self, "setStatusBarPartWithIdentifier:hidden:animatedWithDuration:", a3, a4, v5);
}

- (void)setStatusBarPartWithIdentifier:(id)a3 hidden:(BOOL)a4 animatedWithDuration:(double)a5
{
  _BOOL8 v6;
  NSMutableSet *hiddenParts;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if (-[SBStatusBarPartVisibilityAssertion isHidingStatusBarPartWithIdentifier:](self, "isHidingStatusBarPartWithIdentifier:") != v6)
  {
    hiddenParts = self->_hiddenParts;
    if (v6)
    {
      v9 = (void *)objc_msgSend(v10, "copy");
      -[NSMutableSet addObject:](hiddenParts, "addObject:", v9);

    }
    else
    {
      -[NSMutableSet removeObject:](self->_hiddenParts, "removeObject:", v10);
    }
    -[SBStatusBarPartVisibilityAssertion _setStatusBarPartWithIdentifier:hidden:animatedWithDuration:](self, "_setStatusBarPartWithIdentifier:hidden:animatedWithDuration:", v10, v6, a5);
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBStatusBarPartVisibilityAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet allObjects](self->_hiddenParts, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v5, CFSTR("hiddenParts"), 1);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBStatusBarPartVisibilityAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBStatusBarPartVisibilityAssertion *v11;

  v4 = a3;
  -[SBStatusBarPartVisibilityAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__SBStatusBarPartVisibilityAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __76__SBStatusBarPartVisibilityAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("statusBar"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "reason");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("reason"));

}

- (void)_setStatusBarPartWithIdentifier:(id)a3 hidden:(BOOL)a4 animatedWithDuration:(double)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (a5 <= 0.0)
  {
    __98__SBStatusBarPartVisibilityAssertion__setStatusBarPartWithIdentifier_hidden_animatedWithDuration___block_invoke((uint64_t)v8, self->_statusBar, v8, v6);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CEABB0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __98__SBStatusBarPartVisibilityAssertion__setStatusBarPartWithIdentifier_hidden_animatedWithDuration___block_invoke_2;
    v11[3] = &unk_1E8EA7038;
    v13 = &__block_literal_global_14;
    v11[4] = self;
    v12 = v8;
    v14 = v6;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v11, 0, a5);

  }
}

void __98__SBStatusBarPartVisibilityAssertion__setStatusBarPartWithIdentifier_hidden_animatedWithDuration___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = a3;
  objc_msgSend(v14, "disabledPartIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = objc_msgSend(v10, "containsObject:", v6);
  if (a4)
  {
    if ((v11 & 1) == 0)
    {
      objc_msgSend(v10, "arrayByAddingObject:", v6);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v13 = (void *)v12;
      objc_msgSend(v14, "setDisabledPartIdentifiers:", v12);

    }
  }
  else if (v11)
  {
    objc_msgSend(v10, "sb_arrayByRemovingObject:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

}

uint64_t __98__SBStatusBarPartVisibilityAssertion__setStatusBarPartWithIdentifier_hidden_animatedWithDuration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenParts, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
}

@end
