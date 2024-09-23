@implementation SBInsertionSwitcherModifier

- (SBInsertionSwitcherModifier)initWithAppLayout:(id)a3
{
  id v6;
  SBInsertionSwitcherModifier *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBInsertionSwitcherModifier;
  v7 = -[SBSwitcherModifier init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("SBInsertionSwitcherModifier.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    objc_storeStrong((id *)&v7->_appLayout, a3);
    v7->_phase = 0;
  }

  return v7;
}

- (id)handleInsertionEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *appLayout;
  void *v7;
  unint64_t v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  SBScrollToAppLayoutSwitcherEventResponse *v15;
  uint64_t v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBInsertionSwitcherModifier;
  -[SBSwitcherModifier handleInsertionEvent:](&v25, sel_handleInsertionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  appLayout = self->_appLayout;
  objc_msgSend(v4, "appLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(appLayout) = -[SBAppLayout isEqual:](appLayout, "isEqual:", v7);

  if ((_DWORD)appLayout)
  {
    v8 = objc_msgSend(v4, "phase");
    self->_phase = v8;
    switch(v8)
    {
      case 4uLL:
        -[SBChainableModifier setState:](self, "setState:", 1);
        break;
      case 2uLL:
        -[SBInsertionSwitcherModifier appLayouts](self, "appLayouts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          v21 = 0;
          v22 = &v21;
          v23 = 0x2020000000;
          v24 = 0x7FFFFFFFFFFFFFFFLL;
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __52__SBInsertionSwitcherModifier_handleInsertionEvent___block_invoke;
          v18[3] = &unk_1E8E9FD30;
          v20 = &v21;
          v18[4] = self;
          v19 = v4;
          -[SBInsertionSwitcherModifier _performBlockBySimulatingPreInsertionState:](self, "_performBlockBySimulatingPreInsertionState:", v18);
          v12 = objc_msgSend(v11, "count") - 1;
          if (v12 >= v22[3])
            v12 = v22[3];
          v22[3] = v12;
          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[SBInsertionSwitcherModifier appLayouts](self, "appLayouts");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndex:", v22[3]);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v14, 0, 0);
            +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v15, v5);
            v16 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v16;
          }

          _Block_object_dispose(&v21, 8);
        }

        break;
      case 1uLL:
        -[SBInsertionSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
        self->_contentOffsetBeforeInsertion.x = v9;
        self->_contentOffsetBeforeInsertion.y = v10;
        break;
    }
  }

  return v5;
}

uint64_t __52__SBInsertionSwitcherModifier_handleInsertionEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexToScrollToAfterInsertingAtIndex:", objc_msgSend(*(id *)(a1 + 40), "index"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (CGPoint)scrollViewContentOffset
{
  double x;
  double y;
  objc_super v4;
  CGPoint result;

  if (self->_isSimulatingPreInsertionState)
  {
    x = self->_contentOffsetBeforeInsertion.x;
    y = self->_contentOffsetBeforeInsertion.y;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBInsertionSwitcherModifier;
    -[SBInsertionSwitcherModifier scrollViewContentOffset](&v4, sel_scrollViewContentOffset);
  }
  result.y = y;
  result.x = x;
  return result;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBInsertionSwitcherModifier;
  -[SBInsertionSwitcherModifier visibleAppLayouts](&v14, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_phase > 1)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__107;
    v12 = __Block_byref_object_dispose__107;
    v13 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__SBInsertionSwitcherModifier_visibleAppLayouts__block_invoke;
    v7[3] = &unk_1E8E9DFA0;
    v7[4] = self;
    v7[5] = &v8;
    -[SBInsertionSwitcherModifier _performBlockBySimulatingPreInsertionState:](self, "_performBlockBySimulatingPreInsertionState:", v7);
    objc_msgSend(v4, "setByAddingObjectsFromSet:", v9[5]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v8, 8);

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

void __48__SBInsertionSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBInsertionSwitcherModifier;
  objc_msgSendSuper2(&v5, sel_visibleAppLayouts);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBInsertionSwitcherModifier;
  -[SBInsertionSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setUpdateMode:", 3);
  -[SBInsertionSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "opacitySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpacitySettings:", v8);

  return v5;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  objc_super v14;

  v8 = a4;
  if (self->_phase != 2
    || (-[SBInsertionSwitcherModifier appLayouts](self, "appLayouts"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "indexOfObject:", self->_appLayout),
        v9,
        v11 = 0.0,
        v10 != a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBInsertionSwitcherModifier;
    -[SBInsertionSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v14, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v11 = v12;
  }

  return v11;
}

- (void)_performBlockBySimulatingPreInsertionState:(id)a3
{
  id v4;
  BOOL isSimulatingPreInsertionState;
  id v6;
  void *v7;
  SBOverrideAppLayoutsSwitcherModifier *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  isSimulatingPreInsertionState = self->_isSimulatingPreInsertionState;
  self->_isSimulatingPreInsertionState = 1;
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[SBInsertionSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(v10, "removeObject:", self->_appLayout);
  v8 = -[SBOverrideAppLayoutsSwitcherModifier initWithAppLayouts:]([SBOverrideAppLayoutsSwitcherModifier alloc], "initWithAppLayouts:", v10);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__SBInsertionSwitcherModifier__performBlockBySimulatingPreInsertionState___block_invoke;
  v11[3] = &unk_1E8E9E8D0;
  v12 = v4;
  v9 = v4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v8, v11);
  self->_isSimulatingPreInsertionState = isSimulatingPreInsertionState;

}

uint64_t __74__SBInsertionSwitcherModifier__performBlockBySimulatingPreInsertionState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
