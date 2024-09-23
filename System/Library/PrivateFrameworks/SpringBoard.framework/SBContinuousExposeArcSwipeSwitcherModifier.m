@implementation SBContinuousExposeArcSwipeSwitcherModifier

- (SBContinuousExposeArcSwipeSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 selectedAppLayout:(id)a6 initialVisibleAppLayouts:(id)a7 pinSpaceCornerRadiiToDisplayCornerRadii:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SBContinuousExposeArcSwipeSwitcherModifier *v18;
  SBArcSwipeSwitcherModifier *v19;
  SBArcSwipeSwitcherModifier *arcSwipeModifier;
  uint64_t v21;
  NSArray *initialVisibleAppLayouts;
  void *v24;
  _BOOL4 v26;
  objc_super v27;

  v26 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SBContinuousExposeArcSwipeSwitcherModifier;
  v18 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v27, sel_initWithTransitionID_, v13);
  if (v18)
  {
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("SBContinuousExposeArcSwipeSwitcherModifier.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

    }
    v19 = -[SBArcSwipeSwitcherModifier initWithTransitionID:fromAppLayout:toAppLayout:pinSpaceCornerRadiiToDisplayCornerRadii:]([SBArcSwipeSwitcherModifier alloc], "initWithTransitionID:fromAppLayout:toAppLayout:pinSpaceCornerRadiiToDisplayCornerRadii:", v13, v14, v15, v26);
    arcSwipeModifier = v18->_arcSwipeModifier;
    v18->_arcSwipeModifier = v19;

    objc_storeStrong((id *)&v18->_fromAppLayout, a4);
    objc_storeStrong((id *)&v18->_toAppLayout, a5);
    objc_storeStrong((id *)&v18->_selectedAppLayout, a6);
    v21 = objc_msgSend(v17, "copy");
    initialVisibleAppLayouts = v18->_initialVisibleAppLayouts;
    v18->_initialVisibleAppLayouts = (NSArray *)v21;

  }
  return v18;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeArcSwipeSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v6, sel_didMoveToParentModifier_);
  if (a3)
  {
    -[SBChainableModifier parentModifier](self->_arcSwipeModifier, "parentModifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_arcSwipeModifier);
  }
}

- (id)handleTransitionEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeArcSwipeSwitcherModifier;
  v3 = a3;
  -[SBTransitionSwitcherModifier handleTransitionEvent:](&v9, sel_handleTransitionEvent_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "phase", v9.receiver, v9.super_class);

  if (v5 == 1)
  {
    v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 2);
    SBAppendSwitcherModifierResponse(v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[SBContinuousExposeArcSwipeSwitcherModifier _selectedAppLayout](self, "_selectedAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeArcSwipeSwitcherModifier;
  -[SBContinuousExposeArcSwipeSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 2)
  {
    objc_msgSend(v6, "removeObject:", self->_toAppLayout);
    if (v3)
    {
      objc_msgSend(v6, "removeObject:", v3);
      objc_msgSend(v6, "insertObject:atIndex:", v3, 0);
    }
    objc_msgSend(v6, "insertObject:atIndex:", self->_toAppLayout, 0);
  }

  return v6;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  NSArray *initialVisibleAppLayouts;
  id v7;
  int v8;
  void *v9;
  int v10;
  unint64_t v11;
  int v12;
  int v13;
  double result;
  objc_super v15;

  initialVisibleAppLayouts = self->_initialVisibleAppLayouts;
  v7 = a4;
  v8 = -[NSArray containsObject:](initialVisibleAppLayouts, "containsObject:", v7);
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeArcSwipeSwitcherModifier;
  -[SBContinuousExposeArcSwipeSwitcherModifier visibleAppLayouts](&v15, sel_visibleAppLayouts);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  v11 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase");
  v12 = v10 ^ 1;
  v13 = v8 ^ 1;
  if (v11 == 1)
    v12 = v10;
  else
    v13 = v8;
  result = 1.0;
  if ((v13 & v12) != 0)
    return 0.0;
  return result;
}

- (id)_selectedAppLayout
{
  SBAppLayout **p_selectedAppLayout;
  SBAppLayout *selectedAppLayout;

  p_selectedAppLayout = &self->_selectedAppLayout;
  selectedAppLayout = self->_selectedAppLayout;
  if (!selectedAppLayout || -[SBAppLayout isEqual:](selectedAppLayout, "isEqual:", self->_toAppLayout))
    p_selectedAppLayout = &self->_fromAppLayout;
  return *p_selectedAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialVisibleAppLayouts, 0);
  objc_storeStrong((id *)&self->_arcSwipeModifier, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end
