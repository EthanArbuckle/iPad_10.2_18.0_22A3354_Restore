@implementation SBSplitViewToSlideOverSwitcherModifier

- (SBSplitViewToSlideOverSwitcherModifier)initWithTransitionID:(id)a3 transitioningLayoutRole:(int64_t)a4 splitViewAppLayout:(id)a5 slideOverAppLayout:(id)a6 direction:(unint64_t)a7
{
  id v14;
  id v15;
  SBSplitViewToSlideOverSwitcherModifier *v16;
  SBAppLayout *splitViewAppLayout;
  uint64_t v18;
  id v19;
  uint64_t v20;
  SBAppLayout *fullScreenAppLayout;
  SBAppLayout *v22;
  uint64_t v23;
  SBAppLayout *fromMainAppLayoutGoingIntoSlideOver;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  objc_super v34;

  v14 = a5;
  v15 = a6;
  v34.receiver = self;
  v34.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  v16 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v34, sel_initWithTransitionID_, a3);
  if (!v16)
    goto LABEL_11;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("SBSplitViewToSlideOverSwitcherModifier.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("splitViewAppLayout"));

    if (v15)
      goto LABEL_4;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("SBSplitViewToSlideOverSwitcherModifier.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slideOverAppLayout"));

    goto LABEL_4;
  }
  if (!v15)
    goto LABEL_13;
LABEL_4:
  v16->_transitioningLayoutRole = a4;
  objc_storeStrong((id *)&v16->_splitViewAppLayout, a5);
  objc_storeStrong((id *)&v16->_slideOverAppLayout, a6);
  v16->_direction = a7;
  splitViewAppLayout = v16->_splitViewAppLayout;
  v18 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __135__SBSplitViewToSlideOverSwitcherModifier_initWithTransitionID_transitioningLayoutRole_splitViewAppLayout_slideOverAppLayout_direction___block_invoke;
  v32[3] = &unk_1E8E9DF50;
  v19 = v15;
  v33 = v19;
  -[SBAppLayout appLayoutWithItemsPassingTest:](splitViewAppLayout, "appLayoutWithItemsPassingTest:", v32);
  v20 = objc_claimAutoreleasedReturnValue();
  fullScreenAppLayout = v16->_fullScreenAppLayout;
  v16->_fullScreenAppLayout = (SBAppLayout *)v20;

  if (!v16->_fullScreenAppLayout)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("SBSplitViewToSlideOverSwitcherModifier.m"), 52, CFSTR("We expect a _fullScreenAppLayout here"));

  }
  if (!v16->_direction)
  {
    v22 = v16->_splitViewAppLayout;
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __135__SBSplitViewToSlideOverSwitcherModifier_initWithTransitionID_transitioningLayoutRole_splitViewAppLayout_slideOverAppLayout_direction___block_invoke_2;
    v30[3] = &unk_1E8E9DF50;
    v31 = v19;
    -[SBAppLayout appLayoutWithItemsPassingTest:](v22, "appLayoutWithItemsPassingTest:", v30);
    v23 = objc_claimAutoreleasedReturnValue();
    fromMainAppLayoutGoingIntoSlideOver = v16->_fromMainAppLayoutGoingIntoSlideOver;
    v16->_fromMainAppLayoutGoingIntoSlideOver = (SBAppLayout *)v23;

    if (!v16->_fromMainAppLayoutGoingIntoSlideOver)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("SBSplitViewToSlideOverSwitcherModifier.m"), 58, CFSTR("We expect a _fromMainAppLayoutGoingIntoSlideOver here"));

    }
  }

LABEL_11:
  return v16;
}

uint64_t __135__SBSplitViewToSlideOverSwitcherModifier_initWithTransitionID_transitioningLayoutRole_splitViewAppLayout_slideOverAppLayout_direction___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsItem:", a2) ^ 1;
}

uint64_t __135__SBSplitViewToSlideOverSwitcherModifier_initWithTransitionID_transitioningLayoutRole_splitViewAppLayout_slideOverAppLayout_direction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsItem:", a2);
}

- (id)handleSceneReadyEvent:(id)a3
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v7, sel_handleSceneReadyEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 12, 3);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  uint64_t (*v5)(uint64_t, void *);
  uint64_t *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  -[SBSplitViewToSlideOverSwitcherModifier visibleAppLayouts](&v11, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_direction)
  {
    objc_msgSend(v4, "addObject:", self->_splitViewAppLayout);
    v9 = MEMORY[0x1E0C809B0];
    v5 = __59__SBSplitViewToSlideOverSwitcherModifier_visibleAppLayouts__block_invoke_2;
    v6 = &v9;
  }
  else
  {
    objc_msgSend(v4, "addObject:", self->_slideOverAppLayout);
    v10 = MEMORY[0x1E0C809B0];
    v5 = __59__SBSplitViewToSlideOverSwitcherModifier_visibleAppLayouts__block_invoke;
    v6 = &v10;
  }
  v6[1] = 3221225472;
  v6[2] = (uint64_t)v5;
  v6[3] = (uint64_t)&unk_1E8E9DF78;
  v6[4] = (uint64_t)self;
  objc_msgSend(v4, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "removeObject:", v7);

  return v4;
}

uint64_t __59__SBSplitViewToSlideOverSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOrContainsAppLayout:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
}

uint64_t __59__SBSplitViewToSlideOverSwitcherModifier_visibleAppLayouts__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOrContainsAppLayout:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
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
  void *v13;
  void *v14;
  int64_t transitioningLayoutRole;
  SBAppLayout *splitViewAppLayout;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  CGRect result;

  v25.receiver = self;
  v25.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  -[SBSplitViewToSlideOverSwitcherModifier frameForIndex:](&v25, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
  {
    -[SBSplitViewToSlideOverSwitcherModifier appLayouts](self, "appLayouts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_direction)
    {
      if (objc_msgSend(v14, "isEqual:", self->_slideOverAppLayout))
      {
        transitioningLayoutRole = self->_transitioningLayoutRole;
LABEL_9:
        splitViewAppLayout = self->_splitViewAppLayout;
        -[SBSplitViewToSlideOverSwitcherModifier containerViewBounds](self, "containerViewBounds");
        -[SBSplitViewToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", transitioningLayoutRole, splitViewAppLayout);
        v6 = v17;
        v8 = v18;
        v10 = v19;
        v12 = v20;
        goto LABEL_10;
      }
      if (objc_msgSend(v14, "isEqual:", self->_fullScreenAppLayout))
      {
        if (self->_transitioningLayoutRole == 1)
          transitioningLayoutRole = 2;
        else
          transitioningLayoutRole = 1;
        goto LABEL_9;
      }
    }
LABEL_10:

  }
  v21 = v6;
  v22 = v8;
  v23 = v10;
  v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SBAppLayout *slideOverAppLayout;
  int64_t transitioningLayoutRole;
  SBAppLayout *splitViewAppLayout;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  SBAppLayout *v28;
  SBAppLayout *fullScreenAppLayout;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  _QWORD v35[6];
  uint64_t v36;
  double *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  objc_super v43;
  objc_super v44;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v44.receiver = self;
  v44.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  -[SBSplitViewToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v44, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
  {
    if (!self->_direction)
    {
      if (objc_msgSend(v11, "isEqual:", self->_slideOverAppLayout))
      {
        transitioningLayoutRole = self->_transitioningLayoutRole;
        splitViewAppLayout = self->_splitViewAppLayout;
        -[SBSplitViewToSlideOverSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v43.receiver = self;
        v43.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
        -[SBSplitViewToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v43, sel_frameForLayoutRole_inAppLayout_withBounds_, transitioningLayoutRole, splitViewAppLayout, v34.receiver, v34.super_class);
      }
      else
      {
        if (!objc_msgSend(v11, "isEqual:", self->_fullScreenAppLayout))
          goto LABEL_15;
        if (self->_transitioningLayoutRole == 1)
          v27 = 2;
        else
          v27 = 1;
        v28 = self->_splitViewAppLayout;
        -[SBSplitViewToSlideOverSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v42.receiver = self;
        v42.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
        -[SBSplitViewToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v42, sel_frameForLayoutRole_inAppLayout_withBounds_, v27, v28, v34.receiver, v34.super_class);
      }
      goto LABEL_14;
    }
    if (objc_msgSend(v11, "isEqual:", self->_splitViewAppLayout))
    {
      if (self->_transitioningLayoutRole == a3)
      {
        v36 = 0;
        v37 = (double *)&v36;
        v38 = 0x4010000000;
        v39 = &unk_1D0FA064E;
        v40 = 0u;
        v41 = 0u;
        slideOverAppLayout = self->_slideOverAppLayout;
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __84__SBSplitViewToSlideOverSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
        v35[3] = &unk_1E8E9DFA0;
        v35[4] = self;
        v35[5] = &v36;
        -[SBSwitcherModifier performWithTemporarilyInsertedAppLayout:atIndex:block:](self, "performWithTemporarilyInsertedAppLayout:atIndex:block:", slideOverAppLayout, 0, v35);
        v13 = v37[4];
        v15 = v37[5];
        v17 = v37[6];
        v19 = v37[7];
        _Block_object_dispose(&v36, 8);
        goto LABEL_15;
      }
      fullScreenAppLayout = self->_fullScreenAppLayout;
      -[SBSplitViewToSlideOverSwitcherModifier containerViewBounds](self, "containerViewBounds");
      -[SBSplitViewToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, fullScreenAppLayout, self, SBSplitViewToSlideOverSwitcherModifier);
LABEL_14:
      v13 = v23;
      v15 = v24;
      v17 = v25;
      v19 = v26;
    }
  }
LABEL_15:

  v30 = v13;
  v31 = v15;
  v32 = v17;
  v33 = v19;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

id __84__SBSplitViewToSlideOverSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  id result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  result = objc_msgSendSuper2(&v8, sel_frameForIndex_, 0);
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  int v7;

  v6 = a4;
  if ((objc_msgSend(v6, "isEqual:", self->_slideOverAppLayout) & 1) != 0
    || (objc_msgSend(v6, "isEqual:", self->_fullScreenAppLayout) & 1) != 0
    || objc_msgSend(v6, "isEqual:", self->_splitViewAppLayout))
  {
    v7 = -[SBSplitViewToSlideOverSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, v6) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqual:", self->_slideOverAppLayout) & 1) != 0
    || (objc_msgSend(v5, "isEqual:", self->_fullScreenAppLayout) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v5, "isEqual:", self->_splitViewAppLayout);
  }

  return v6;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[SBSplitViewToSlideOverSwitcherModifier switcherSettings](self, "switcherSettings", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resizeBlurDelay");
  v7 = v6;

  return v7;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  -[SBSplitViewToSlideOverSwitcherModifier topMostLayoutRolesForAppLayout:](&v17, sel_topMostLayoutRolesForAppLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_splitViewAppLayout && objc_msgSend(v4, "isEqual:"))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v9);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "containsObject:", v10);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v12);

    }
    if (self->_transitioningLayoutRole == 1)
      v13 = 2;
    else
      v13 = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v15);

  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
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
  v10.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBSplitViewToSlideOverSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "splitViewToSlideOverSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v8);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromMainAppLayoutGoingIntoSlideOver, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_slideOverAppLayout, 0);
  objc_storeStrong((id *)&self->_splitViewAppLayout, 0);
}

@end
