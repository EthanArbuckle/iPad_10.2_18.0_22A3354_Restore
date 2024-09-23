@implementation SBGridToFullScreenSwitcherModifier

- (SBGridToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 gridModifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBGridToFullScreenSwitcherModifier *v14;
  SBGridToActiveAppLayoutsSwitcherModifier *v15;
  void *v16;
  SBGridToActiveAppLayoutsSwitcherModifier *v17;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SBGridToFullScreenSwitcherModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v21, sel_initWithTransitionID_, v11);
  if (v14)
  {
    if (v12)
    {
      if (v13)
      {
LABEL_4:
        v14->_direction = a4;
        objc_storeStrong((id *)&v14->_fullScreenAppLayout, a5);
        v15 = [SBGridToActiveAppLayoutsSwitcherModifier alloc];
        v22[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[SBGridToActiveAppLayoutsSwitcherModifier initWithTransitionID:direction:activeAppLayouts:gridModifier:](v15, "initWithTransitionID:direction:activeAppLayouts:gridModifier:", v11, a4, v16, v13);

        -[SBChainableModifier addChildModifier:](v14, "addChildModifier:", v17);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBGridToFullScreenSwitcherModifier.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullScreenAppLayout"));

      if (v13)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBGridToFullScreenSwitcherModifier.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gridModifier"));

    goto LABEL_4;
  }
LABEL_5:

  return v14;
}

- (id)transitionWillBegin
{
  void *v3;
  SBScrollToAppLayoutSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBGridToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v7, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_direction == 1)
  {
    v4 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", self->_fullScreenAppLayout, 0, 0);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  if (self->_direction)
    return 0;
  else
    return self->_fullScreenAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
}

@end
