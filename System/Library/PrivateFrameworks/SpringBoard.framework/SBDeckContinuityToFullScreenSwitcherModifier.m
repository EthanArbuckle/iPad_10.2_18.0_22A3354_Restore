@implementation SBDeckContinuityToFullScreenSwitcherModifier

- (SBDeckContinuityToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 deckModifier:(id)a5 fullscreenModifier:(id)a6
{
  id v12;
  id v13;
  id v14;
  SBDeckContinuityToFullScreenSwitcherModifier *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
  v15 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v20, sel_initWithTransitionID_, a3);
  if (v15)
  {
    if (v12)
    {
      if (v13)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBDeckContinuityToFullScreenSwitcherModifier.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

      if (v13)
      {
LABEL_4:
        if (v14)
        {
LABEL_5:
          objc_storeStrong((id *)&v15->_appLayout, a4);
          objc_storeStrong((id *)&v15->_fullscreenModifier, a6);
          -[SBChainableModifier addChildModifier:](v15, "addChildModifier:", v13);
          goto LABEL_6;
        }
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBDeckContinuityToFullScreenSwitcherModifier.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullscreenModifier"));

        goto LABEL_5;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBDeckContinuityToFullScreenSwitcherModifier.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deckModifier"));

    if (v14)
      goto LABEL_5;
    goto LABEL_9;
  }
LABEL_6:

  return v15;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 6, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
  -[SBDeckContinuityToFullScreenSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_appLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "switcherLayoutElementType", v12.receiver, v12.super_class);

  if (!v6)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    -[SBDeckContinuityToFullScreenSwitcherModifier switcherSettings](self, "switcherSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "continuityBannerSlideUpSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLayoutSettings:", v10);

    v5 = v7;
  }
  return v5;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  UIRectCornerRadii result;

  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:"))
  {
    SBScreenDisplayCornerRadius();
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    -[SBDeckContinuityToFullScreenSwitcherModifier cornerRadiiForIndex:](&v9, sel_cornerRadiiForIndex_, a3);
  }
  result.topRight = v8;
  result.bottomRight = v7;
  result.bottomLeft = v6;
  result.topLeft = v5;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double *v13;
  SBSwitcherModifier *fullscreenModifier;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  _QWORD v20[7];
  uint64_t v21;
  double *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  CGRect result;

  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x4010000000;
  v24 = &unk_1D0FA064E;
  v25 = 0u;
  v26 = 0u;
  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:"))
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") != 1)
    {
      fullscreenModifier = self->_fullscreenModifier;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __62__SBDeckContinuityToFullScreenSwitcherModifier_frameForIndex___block_invoke;
      v20[3] = &unk_1E8E9FD08;
      v20[4] = self;
      v20[5] = &v21;
      v20[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fullscreenModifier, v20);
      v9 = v22[4];
      v10 = v22[5];
      v11 = v22[6];
      v12 = v22[7];
      goto LABEL_7;
    }
    -[SBDeckContinuityToFullScreenSwitcherModifier _initialFrameForContinuityAppLayout](self, "_initialFrameForContinuityAppLayout");
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    -[SBDeckContinuityToFullScreenSwitcherModifier frameForIndex:](&v19, sel_frameForIndex_, a3);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v22;
  v22[4] = v5;
  v13[5] = v6;
  v13[6] = v7;
  v13[7] = v8;
LABEL_7:
  _Block_object_dispose(&v21, 8);
  v15 = v9;
  v16 = v10;
  v17 = v11;
  v18 = v12;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

uint64_t __62__SBDeckContinuityToFullScreenSwitcherModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 144), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  SBSwitcherModifier *fullscreenModifier;
  objc_super v9;
  _QWORD v10[7];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:"))
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
    {
      v12[3] = 1.0;
      v5 = 1.0;
    }
    else
    {
      fullscreenModifier = self->_fullscreenModifier;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __62__SBDeckContinuityToFullScreenSwitcherModifier_scaleForIndex___block_invoke;
      v10[3] = &unk_1E8E9FD08;
      v10[4] = self;
      v10[5] = &v11;
      v10[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fullscreenModifier, v10);
      v5 = v12[3];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    -[SBDeckContinuityToFullScreenSwitcherModifier scaleForIndex:](&v9, sel_scaleForIndex_, a3);
    v5 = v6;
    v12[3] = v6;
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __62__SBDeckContinuityToFullScreenSwitcherModifier_scaleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  SBSwitcherModifier *fullscreenModifier;
  objc_super v9;
  _QWORD v10[7];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:"))
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
    {
      v12[3] = 0.0;
      v5 = 0.0;
    }
    else
    {
      fullscreenModifier = self->_fullscreenModifier;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __69__SBDeckContinuityToFullScreenSwitcherModifier_titleOpacityForIndex___block_invoke;
      v10[3] = &unk_1E8E9FD08;
      v10[4] = self;
      v10[5] = &v11;
      v10[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fullscreenModifier, v10);
      v5 = v12[3];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    -[SBDeckContinuityToFullScreenSwitcherModifier titleOpacityForIndex:](&v9, sel_titleOpacityForIndex_, a3);
    v5 = v6;
    v12[3] = v6;
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __69__SBDeckContinuityToFullScreenSwitcherModifier_titleOpacityForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "titleOpacityForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  SBSwitcherModifier *fullscreenModifier;
  objc_super v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a4;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:", a5))
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
    {
      v20[3] = 1.0;
      v9 = 1.0;
    }
    else
    {
      fullscreenModifier = self->_fullscreenModifier;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __89__SBDeckContinuityToFullScreenSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
      v14[3] = &unk_1E8E9FDA8;
      v16 = &v19;
      v17 = a3;
      v14[4] = self;
      v15 = v8;
      v18 = a5;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fullscreenModifier, v14);

      v9 = v20[3];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    -[SBDeckContinuityToFullScreenSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v13, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
    v20[3] = v10;
  }
  _Block_object_dispose(&v19, 8);

  return v9;
}

uint64_t __89__SBDeckContinuityToFullScreenSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "opacityForLayoutRole:inAppLayout:atIndex:", a1[7], a1[5], a1[8]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  SBSwitcherModifier *fullscreenModifier;
  objc_super v9;
  _QWORD v10[7];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:"))
  {
    if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
    {
      v12[3] = 1.0;
      v5 = 1.0;
    }
    else
    {
      fullscreenModifier = self->_fullscreenModifier;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __76__SBDeckContinuityToFullScreenSwitcherModifier_titleAndIconOpacityForIndex___block_invoke;
      v10[3] = &unk_1E8E9FD08;
      v10[4] = self;
      v10[5] = &v11;
      v10[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fullscreenModifier, v10);
      v5 = v12[3];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    -[SBDeckContinuityToFullScreenSwitcherModifier titleAndIconOpacityForIndex:](&v9, sel_titleAndIconOpacityForIndex_, a3);
    v5 = v6;
    v12[3] = v6;
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __76__SBDeckContinuityToFullScreenSwitcherModifier_titleAndIconOpacityForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 144), "titleAndIconOpacityForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (BOOL)_isInsertingIndex:(unint64_t)a3
{
  SBDeckContinuityToFullScreenSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBDeckContinuityToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = -[SBAppLayout isEqual:](v4->_appLayout, "isEqual:", v6);
  return (char)v4;
}

- (CGRect)_initialFrameForContinuityAppLayout
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
  -[SBDeckContinuityToFullScreenSwitcherModifier containerViewBounds](&v6, sel_containerViewBounds);
  v5 = v4;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v5;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullscreenModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
