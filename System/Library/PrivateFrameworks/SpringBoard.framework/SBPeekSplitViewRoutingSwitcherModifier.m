@implementation SBPeekSplitViewRoutingSwitcherModifier

- (SBPeekSplitViewRoutingSwitcherModifier)initWithPeekConfiguration:(int64_t)a3 spaceConfiguration:(int64_t)a4 peekingAppLayout:(id)a5
{
  id v10;
  SBPeekSplitViewRoutingSwitcherModifier *v11;
  uint64_t v12;
  SBAppSwitcherSettings *switcherSettings;
  SBSplitAllDisplayItemsSwitcherModifier *v14;
  SBFullScreenFluidSwitcherRootSwitcherModifier *v15;
  SBSwitcherModifier *peekingModifier;
  SBFullScreenFluidSwitcherRootSwitcherModifier *v17;
  SBSwitcherModifier *nonPeekingModifier;
  SBRoutingSwitcherModifier *v19;
  void *v20;
  uint64_t v21;
  SBRoutingSwitcherModifier *routingModifier;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  v11 = -[SBSwitcherModifier init](&v27, sel_init);
  if (v11)
  {
    if (!SBPeekConfigurationIsValid(a3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBPeekSplitViewRoutingSwitcherModifier.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBPeekConfigurationIsValid(peekConfiguration)"));

    }
    if (SBSpaceConfigurationIsValid(a4))
    {
      if (v10)
      {
LABEL_6:
        v11->_peekConfiguration = a3;
        v11->_spaceConfiguration = a4;
        objc_storeStrong((id *)&v11->_peekingAppLayout, a5);
        +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
        v12 = objc_claimAutoreleasedReturnValue();
        switcherSettings = v11->_switcherSettings;
        v11->_switcherSettings = (SBAppSwitcherSettings *)v12;

        v14 = objc_alloc_init(SBSplitAllDisplayItemsSwitcherModifier);
        -[SBChainableModifier addChildModifier:atLevel:key:](v11, "addChildModifier:atLevel:key:", v14, 1, 0);
        v15 = objc_alloc_init(SBFullScreenFluidSwitcherRootSwitcherModifier);
        peekingModifier = v11->_peekingModifier;
        v11->_peekingModifier = &v15->super.super;

        v17 = objc_alloc_init(SBFullScreenFluidSwitcherRootSwitcherModifier);
        nonPeekingModifier = v11->_nonPeekingModifier;
        v11->_nonPeekingModifier = &v17->super.super;

        v19 = [SBRoutingSwitcherModifier alloc];
        v28[0] = v11->_peekingModifier;
        v28[1] = v11->_nonPeekingModifier;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[SBRoutingSwitcherModifier initWithModifiers:delegate:](v19, "initWithModifiers:delegate:", v20, v11);
        routingModifier = v11->_routingModifier;
        v11->_routingModifier = (SBRoutingSwitcherModifier *)v21;

        -[SBChainableModifier addChildModifier:atLevel:key:](v11, "addChildModifier:atLevel:key:", v11->_routingModifier, 2, 0);
        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBPeekSplitViewRoutingSwitcherModifier.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBSpaceConfigurationIsValid(spaceConfiguration)"));

      if (v10)
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBPeekSplitViewRoutingSwitcherModifier.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peekingAppLayout"));

    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPeekConfiguration:spaceConfiguration:peekingAppLayout:", self->_peekConfiguration, self->_spaceConfiguration, self->_peekingAppLayout);
}

- (id)debugPotentialChildModifiers
{
  SBSwitcherModifier *nonPeekingModifier;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  nonPeekingModifier = self->_nonPeekingModifier;
  v4[0] = self->_peekingModifier;
  v4[1] = nonPeekingModifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)modifierForEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  SBPeekSplitViewRoutingSwitcherModifier *v6;
  SBPeekSplitViewRoutingSwitcherModifier *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = objc_opt_class();
  SBSafeCast(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && objc_msgSend(v5, "isEnteringSplitViewPeekEvent")
    && (objc_msgSend(v5, "phase") == 1 || (objc_msgSend(v5, "isAnimated") & 1) == 0))
  {
    v7 = [SBPeekSplitViewRoutingSwitcherModifier alloc];
    v8 = objc_msgSend(v5, "toPeekConfiguration");
    v9 = objc_msgSend(v5, "toSpaceConfiguration");
    objc_msgSend(v5, "toAppLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBPeekSplitViewRoutingSwitcherModifier initWithPeekConfiguration:spaceConfiguration:peekingAppLayout:](v7, "initWithPeekConfiguration:spaceConfiguration:peekingAppLayout:", v8, v9, v10);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  SBAppLayout *v4;
  uint64_t v5;
  void *v6;
  SBAppLayout *v7;
  uint64_t v8;
  SBDisplayItem *v9;
  int64_t peekConfiguration;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SBDisplayItemLayoutAttributes *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  SBDisplayItem *v20;
  SBAppLayout *v21;
  void *v23;
  SBDisplayItemLayoutAttributes *v24;
  SBAppLayout *v25;
  void *v26;
  SBDisplayItemLayoutAttributes *v27;
  objc_super v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = (SBAppLayout *)a3;
  v28.receiver = self;
  v28.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBPeekSplitViewRoutingSwitcherModifier appLayoutContainingAppLayout:](&v28, sel_appLayoutContainingAppLayout_, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_uncondtionallyAllowAppLayoutContainment)
  {
    v7 = (SBAppLayout *)v5;
  }
  else if (self->_peekingAppLayout == v4)
  {
    v7 = (SBAppLayout *)v5;
    if ((SBAppLayout *)v5 == v4)
    {
      v7 = v4;
      v6 = v4;
      if ((unint64_t)(self->_peekState - 1) <= 1)
      {
        -[SBAppLayout itemForLayoutRole:](v4, "itemForLayoutRole:", 1);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:]([SBDisplayItem alloc], "initWithType:bundleIdentifier:uniqueIdentifier:", 0, CFSTR("SBPeekSplitViewRoutingSwitcherModifier-placeholder-A"), &stru_1E8EC7EC0);
        peekConfiguration = self->_peekConfiguration;
        if (peekConfiguration == 2)
          v11 = 1;
        else
          v11 = 2;
        if (peekConfiguration == 2)
          v12 = 2;
        else
          v12 = 1;
        -[SBAppLayout layoutAttributesForItem:](self->_peekingAppLayout, "layoutAttributesForItem:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
          v15 = v13;
        else
          v15 = objc_alloc_init(SBDisplayItemLayoutAttributes);
        v27 = v15;

        v24 = objc_alloc_init(SBDisplayItemLayoutAttributes);
        v25 = [SBAppLayout alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v26;
        v32[0] = v8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v16;
        v32[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration);
        v29[0] = v8;
        v29[1] = v9;
        v30[0] = v27;
        v30[1] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)v8;
        v20 = v9;
        v7 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v25, "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v17, v18, v19, -[SBAppLayout centerConfiguration](v4, "centerConfiguration"), -[SBAppLayout environment](v4, "environment"), 0, -[SBPeekSplitViewRoutingSwitcherModifier displayOrdinal](self, "displayOrdinal"));

        v6 = v7;
      }
    }
  }
  else
  {
    v7 = v4;
  }
  v21 = v7;

  return v21;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SBPeekSplitViewRoutingSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v8[3] = &unk_1E8E9DF78;
  v8[4] = self;
  objc_msgSend(a3, "bs_filter:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBPeekSplitViewRoutingSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v7, sel_adjustedAppLayoutsForAppLayouts_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __74__SBPeekSplitViewRoutingSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "itemForLayoutRole:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "displayItemSupportsMedusa:", v3);

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect result;

  -[SBPeekSplitViewRoutingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_peekingAppLayout && (unint64_t)(self->_peekState - 1) <= 1)
  {
    -[SBPeekSplitViewRoutingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    -[SBPeekSplitViewRoutingSwitcherModifier frameForIndex:](&v19, sel_frameForIndex_, a3);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  SBAppLayout *v11;
  SBAppLayout *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  char v22;
  int64_t peekConfiguration;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  objc_super v40;
  objc_super v41;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (SBAppLayout *)a4;
  v12 = v11;
  if (self->_peekingAppLayout == v11 && (unint64_t)(self->_peekState - 1) <= 1)
  {
    -[SBAppLayout itemForLayoutRole:](v11, "itemForLayoutRole:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPeekSplitViewRoutingSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41.receiver = self;
    v41.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    -[SBPeekSplitViewRoutingSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v41, sel_frameForLayoutRole_inAppLayout_withBounds_, objc_msgSend(v14, "layoutRoleForItem:", v13), v14, x, y, width, height);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    if ((unint64_t)(self->_peekState - 1) > 1)
    {
      v30 = v15;
LABEL_13:

      goto LABEL_8;
    }
    v22 = -[SBPeekSplitViewRoutingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    peekConfiguration = self->_peekConfiguration;
    if ((v22 & 1) != 0)
    {
      if (peekConfiguration != 3)
      {
LABEL_6:
        -[SBPeekSplitViewRoutingSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v26 = v24 + v25;
        -[SBPeekSplitViewRoutingSwitcherModifier switcherSettings](self, "switcherSettings");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "peekInsetWidth");
LABEL_12:
        v30 = v26 - v28;

        goto LABEL_13;
      }
    }
    else if (peekConfiguration != 2)
    {
      goto LABEL_6;
    }
    -[SBPeekSplitViewRoutingSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v26 = v38;
    -[SBPeekSplitViewRoutingSwitcherModifier switcherSettings](self, "switcherSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "peekInsetWidth");
    v28 = v19 - v39;
    goto LABEL_12;
  }
  v40.receiver = self;
  v40.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBPeekSplitViewRoutingSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v40, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v30 = v29;
  v17 = v31;
  v19 = v32;
  v21 = v33;
LABEL_8:

  v34 = v30;
  v35 = v17;
  v36 = v19;
  v37 = v21;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *toAppLayout;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[5];
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBPeekSplitViewRoutingSwitcherModifier animationAttributesForLayoutElement:](&v17, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_OWORD *)&self->_peekingAppLayout == __PAIR128__(3, (unint64_t)v4)
    && -[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", v4))
  {
    toAppLayout = self->_toAppLayout;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__SBPeekSplitViewRoutingSwitcherModifier_animationAttributesForLayoutElement___block_invoke;
    v16[3] = &unk_1E8E9DF50;
    v16[4] = self;
    -[SBAppLayout appLayoutWithItemsPassingTest:](toAppLayout, "appLayoutWithItemsPassingTest:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v15.receiver = self;
      v15.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
      -[SBPeekSplitViewRoutingSwitcherModifier animationAttributesForLayoutElement:](&v15, sel_animationAttributesForLayoutElement_, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "positionSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(v8, "layoutSettings");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

      v13 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v13, "setOpacitySettings:", v12);

      v5 = v13;
    }

  }
  return v5;
}

uint64_t __78__SBPeekSplitViewRoutingSwitcherModifier_animationAttributesForLayoutElement___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "containsItem:", a2) ^ 1;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[7];
  uint64_t v20;
  double *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  UIRectCornerRadii result;

  -[SBPeekSplitViewRoutingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_peekingAppLayout && (unint64_t)(self->_peekState - 1) <= 1)
  {
    -[SBPeekSplitViewRoutingSwitcherModifier splitViewInnerCornerRadius](self, "splitViewInnerCornerRadius");
    SBRectCornerRadiiForRadius();
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v20 = 0;
    v21 = (double *)&v20;
    v22 = 0x4010000000;
    v23 = &unk_1D0FA064E;
    v24 = 0u;
    v25 = 0u;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__SBPeekSplitViewRoutingSwitcherModifier_cornerRadiiForIndex___block_invoke;
    v19[3] = &unk_1E8E9FD08;
    v19[5] = &v20;
    v19[6] = a3;
    v19[4] = self;
    -[SBPeekSplitViewRoutingSwitcherModifier _temporarilyAllowUnconditionaryAppLayoutContainmentWithBlock:](self, "_temporarilyAllowUnconditionaryAppLayoutContainmentWithBlock:", v19);
    v8 = v21[4];
    v10 = v21[5];
    v12 = v21[6];
    v14 = v21[7];
    _Block_object_dispose(&v20, 8);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.topRight = v18;
  result.bottomRight = v17;
  result.bottomLeft = v16;
  result.topLeft = v15;
  return result;
}

id __62__SBPeekSplitViewRoutingSwitcherModifier_cornerRadiiForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v2 = *(_QWORD *)(a1 + 48);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  result = objc_msgSendSuper2(&v9, sel_cornerRadiiForIndex_, v2);
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  SBPeekSplitViewRoutingSwitcherModifier *v23;
  uint64_t *v24;
  int64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  UIRectCornerRadii result;

  topRight = a5.topRight;
  bottomRight = a5.bottomRight;
  bottomLeft = a5.bottomLeft;
  topLeft = a5.topLeft;
  v11 = a4;
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x4010000000;
  v33 = &unk_1D0FA064E;
  v34 = 0u;
  v35 = 0u;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__SBPeekSplitViewRoutingSwitcherModifier_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii___block_invoke;
  v21[3] = &unk_1E8E9FD58;
  v24 = &v30;
  v25 = a3;
  v12 = v11;
  v26 = topLeft;
  v27 = bottomLeft;
  v28 = bottomRight;
  v29 = topRight;
  v22 = v12;
  v23 = self;
  -[SBPeekSplitViewRoutingSwitcherModifier _temporarilyAllowUnconditionaryAppLayoutContainmentWithBlock:](self, "_temporarilyAllowUnconditionaryAppLayoutContainmentWithBlock:", v21);
  v13 = v31[4];
  v14 = v31[5];
  v15 = v31[6];
  v16 = v31[7];

  _Block_object_dispose(&v30, 8);
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  result.topRight = v20;
  result.bottomRight = v19;
  result.bottomLeft = v18;
  result.topLeft = v17;
  return result;
}

id __95__SBPeekSplitViewRoutingSwitcherModifier_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id result;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v10.receiver = *(id *)(a1 + 40);
  v10.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  result = objc_msgSendSuper2(&v10, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, v2, v3, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  unint64_t v7;
  objc_super v9;

  -[SBPeekSplitViewRoutingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_peekingAppLayout)
  {
    v7 = 15;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    v7 = -[SBPeekSplitViewRoutingSwitcherModifier maskedCornersForIndex:](&v9, sel_maskedCornersForIndex_, a3);
  }

  return v7;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  SBPeekSplitViewRoutingSwitcherModifier *v5;
  id v6;
  objc_super v8;

  v5 = self;
  v8.receiver = self;
  v8.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  v6 = a4;
  LOBYTE(a3) = -[SBPeekSplitViewRoutingSwitcherModifier isLayoutRoleSelectable:inAppLayout:](&v8, sel_isLayoutRoleSelectable_inAppLayout_, a3, v6);
  LOBYTE(v5) = objc_msgSend(v6, "isEqual:", v5->_peekingAppLayout, v8.receiver, v8.super_class);

  return v5 | a3;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  BOOL v7;
  int64_t peekState;
  BOOL v9;
  objc_super v11;

  -[SBPeekSplitViewRoutingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_peekingAppLayout)
  {
    peekState = self->_peekState;
    if (peekState)
      v9 = peekState == 3;
    else
      v9 = 1;
    v7 = v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    v7 = -[SBPeekSplitViewRoutingSwitcherModifier isContentStatusBarVisibleForIndex:](&v11, sel_isContentStatusBarVisibleForIndex_, a3);
  }

  return v7;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  int64_t peekState;

  peekState = self->_peekState;
  return peekState == 3 || peekState == 0;
}

- (id)keyboardSuppressionMode
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[SBPeekSplitViewRoutingSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:](SBSwitcherKeyboardSuppressionMode, "newSuppressionModeForSwitcherScenesFromAppLayouts:", v4);

  objc_msgSend(v5, "setApplyAssertionEvenIfAppIsHostingTheKeyboard:", 1);
  return v5;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  void *v6;
  SBAppLayout *v7;
  double v8;

  -[SBPeekSplitViewRoutingSwitcherModifier appLayouts](self, "appLayouts", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  v8 = 0.0;
  if (v7 == self->_peekingAppLayout)
  {
    if ((unint64_t)(self->_peekState - 1) >= 2)
      v8 = 0.0;
    else
      v8 = 1.0;
  }

  return v8;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v5;

  if (self->_peekingAppLayout == a4)
    return 4;
  v5.receiver = self;
  v5.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  return -[SBPeekSplitViewRoutingSwitcherModifier shadowStyleForLayoutRole:inAppLayout:](&v5, sel_shadowStyleForLayoutRole_inAppLayout_, a3);
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  _BOOL4 v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  v6 = a4;
  v7 = -[SBPeekSplitViewRoutingSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v10, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  v8 = -[SBPeekSplitViewRoutingSwitcherModifier _isAppLayoutBeingResized:](self, "_isAppLayoutBeingResized:", v6, v10.receiver, v10.super_class);

  if (v8 && !self->_isRotating)
    return 1;
  return v7;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  int v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  LOBYTE(v7) = -[SBPeekSplitViewRoutingSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v9, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  if (-[SBPeekSplitViewRoutingSwitcherModifier _isAppLayoutBeingResized:](self, "_isAppLayoutBeingResized:", v6)
    && !self->_isRotating)
  {
    v7 = -[SBPeekSplitViewRoutingSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, v6) ^ 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  v6 = a4;
  -[SBPeekSplitViewRoutingSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v13, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  LODWORD(a3) = -[SBPeekSplitViewRoutingSwitcherModifier isLayoutRoleBlurred:inAppLayout:](self, "isLayoutRoleBlurred:inAppLayout:", a3, v6, v13.receiver, v13.super_class);

  if ((_DWORD)a3)
  {
    -[SBPeekSplitViewRoutingSwitcherModifier switcherSettings](self, "switcherSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resizeBlurDelay");
    v8 = v11;

  }
  return v8;
}

- (BOOL)_isAppLayoutBeingResized:(id)a3
{
  return self->_peekingAppLayout == a3 && self->_peekState < 2uLL;
}

- (BOOL)isContainerStatusBarVisible
{
  if (self->_peekState == 1)
    return -[SBSwitcherModifier isContainerStatusBarVisible](self->_nonPeekingModifier, "isContainerStatusBarVisible");
  else
    return 0;
}

- (unint64_t)hiddenContainerStatusBarParts
{
  int64_t peekConfiguration;

  peekConfiguration = self->_peekConfiguration;
  if (peekConfiguration == 3)
    return 8;
  else
    return 2 * (peekConfiguration == 2);
}

- (id)visibleHomeAffordanceLayoutElements
{
  void *v3;
  void *v4;
  SBAppLayout *splitViewAppLayout;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBPeekSplitViewRoutingSwitcherModifier visibleHomeAffordanceLayoutElements](&v16, sel_visibleHomeAffordanceLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  splitViewAppLayout = self->_splitViewAppLayout;
  if (splitViewAppLayout)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SBAppLayout leafAppLayouts](splitViewAppLayout, "leafAppLayouts", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "removeObject:", self->_splitViewAppLayout);
  }
  if (self->_peekingAppLayout)
    objc_msgSend(v4, "removeObject:");
  return v4;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  objc_super v4;

  if (self->_peekState != 3)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  return -[SBPeekSplitViewRoutingSwitcherModifier isResizeGrabberVisibleForAppLayout:](&v4, sel_isResizeGrabberVisibleForAppLayout_, a3);
}

- (double)homeScreenDimmingAlpha
{
  double result;
  objc_super v3;

  result = 1.0;
  if (self->_peekState != 3)
  {
    v3.receiver = self;
    v3.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    -[SBPeekSplitViewRoutingSwitcherModifier homeScreenDimmingAlpha](&v3, sel_homeScreenDimmingAlpha, 1.0);
  }
  return result;
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  _BOOL4 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  v7 = -[SBPeekSplitViewRoutingSwitcherModifier canPerformKeyboardShortcutAction:forBundleIdentifier:](&v9, sel_canPerformKeyboardShortcutAction_forBundleIdentifier_);
  if ((unint64_t)a3 <= 0x12 && ((1 << a3) & 0x46808) != 0 && v7)
  {
    if (a4)
      LOBYTE(v7) = !SBPeekConfigurationIsValid(self->_peekConfiguration);
    else
      LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBPeekSplitViewRoutingSwitcherModifier topMostLayoutElements](&v6, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_peekingAppLayout, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3
{
  return 0;
}

- (unint64_t)transactionCompletionOptions
{
  if (-[SBPeekSplitViewRoutingSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled"))
    return 6;
  else
    return 2;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  BOOL v7;

  -[SBPeekSplitViewRoutingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  v7 = v6 != self->_peekingAppLayout || (unint64_t)(self->_peekState - 1) >= 2;
  return v7;
}

- (id)handleEvent:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  SBAppLayout *v10;
  int64_t peekState;
  SBInvalidateSnapshotCacheSwitcherEventResponse *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  SBAppLayout *v22;
  void *v23;
  void *v24;
  void *v25;
  SBAppLayout *toAppLayout;
  SBAppLayout *v27;
  SBAppLayout **p_splitViewAppLayout;
  void *v29;
  SBAppLayout *v30;
  void *v31;
  SBAppLayout *v32;
  int64_t v33;
  void *v34;
  SBSplitDisplayItemSwitcherModifier *v35;
  SBAppLayout *v36;
  SBAppLayout *v37;
  void *v38;
  void *v39;
  void *v41;
  objc_super v42;
  _QWORD v43[5];

  v4 = a3;
  if (!objc_msgSend(v4, "isTransitionEvent"))
  {
    v12 = 0;
    goto LABEL_44;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "isEnteringSplitViewPeekEvent");
  v7 = objc_msgSend(v5, "isExitingSplitViewPeekEvent");
  v8 = objc_msgSend(v5, "fromEnvironmentMode");
  v9 = objc_msgSend(v5, "phase");
  if (!v6 || v9 != 1)
  {
    if (v9 > 1)
      v13 = v6;
    else
      v13 = 0;
    if ((v13 & 1) != 0)
      goto LABEL_11;
    if (v9 == 1)
      v16 = v7;
    else
      v16 = 0;
    if (v16 != 1)
    {
      if (v9 > 1)
        v19 = v7;
      else
        v19 = 0;
      if (v19 != 1)
        goto LABEL_29;
      objc_msgSend(v5, "toAppLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "itemForLayoutRole:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "toAppLayout");
      v22 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
      v10 = v22;
      if (v21)
        goto LABEL_14;
      -[SBAppLayout itemForLayoutRole:](v22, "itemForLayoutRole:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_5;
      objc_msgSend(v5, "toAppLayout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "itemForLayoutRole:", 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
LABEL_29:
        if (objc_msgSend(v5, "toEnvironmentMode") == 2)
        {
          v10 = 0;
          peekState = 2;
        }
        else
        {
          peekState = self->_peekState;
          v10 = self->_splitViewAppLayout;
        }
        goto LABEL_33;
      }
      goto LABEL_31;
    }
    objc_msgSend(v5, "toAppLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "itemForLayoutRole:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_11:
      v10 = 0;
    }
    else
    {
      objc_msgSend(v5, "toAppLayout");
      v10 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    }
    peekState = 1;
    goto LABEL_33;
  }
  if (v8 == 1)
  {
LABEL_5:
    v10 = 0;
    peekState = 4;
    goto LABEL_33;
  }
  objc_msgSend(v5, "fromAppLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemForLayoutRole:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v5, "fromAppLayout");
    v10 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    peekState = 3;
    goto LABEL_33;
  }
LABEL_31:
  v10 = 0;
  peekState = 0;
LABEL_33:
  if (peekState == self->_peekState
    && self->_splitViewAppLayout == v10
    && (toAppLayout = self->_toAppLayout,
        objc_msgSend(v5, "toAppLayout"),
        v27 = (SBAppLayout *)objc_claimAutoreleasedReturnValue(),
        v27,
        toAppLayout == v27))
  {
    v12 = 0;
  }
  else
  {
    v12 = -[SBInvalidateSnapshotCacheSwitcherEventResponse initWithDisplayItems:]([SBInvalidateSnapshotCacheSwitcherEventResponse alloc], "initWithDisplayItems:", 0);
  }
  p_splitViewAppLayout = &self->_splitViewAppLayout;
  if (self->_splitViewAppLayout != v10)
  {
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("SplitZoomingItemModifierKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v29);
    objc_storeStrong((id *)p_splitViewAppLayout, v10);
    v30 = *p_splitViewAppLayout;
    if (*p_splitViewAppLayout)
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __54__SBPeekSplitViewRoutingSwitcherModifier_handleEvent___block_invoke;
      v43[3] = &unk_1E8E9DF50;
      v43[4] = self;
      -[SBAppLayout appLayoutWithItemsPassingTest:](v30, "appLayoutWithItemsPassingTest:", v43);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allItems");
      v32 = v10;
      v33 = peekState;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      peekState = v33;
      v10 = v32;

      v35 = -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:]([SBSplitDisplayItemSwitcherModifier alloc], "initWithDisplayItem:", v41);
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v35, 0, CFSTR("SplitZoomingItemModifierKey"));

    }
  }
  self->_peekState = peekState;
  objc_msgSend(v5, "toAppLayout", v41);
  v36 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  v37 = self->_toAppLayout;
  self->_toAppLayout = v36;

LABEL_44:
  v42.receiver = self;
  v42.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v42, sel_handleEvent_, v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  SBAppendSwitcherModifierResponse(v12, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

uint64_t __54__SBPeekSplitViewRoutingSwitcherModifier_handleEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "containsItem:", a2) ^ 1;
}

- (id)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SBTransitionSwitcherModifier *v9;
  void *v10;
  SBTransitionSwitcherModifier *v11;
  SBTransitionSwitcherModifier *exitingTransitionTrackingModifier;
  SBTransitionSwitcherModifier *v13;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v14;
  void *v15;
  SBInvalidateSnapshotCacheSwitcherEventResponse *v16;
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
  v25.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBSwitcherModifier _handleEvent:](&v25, sel__handleEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  SBSafeCast(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "isExitingSplitViewPeekEvent"))
  {
    if (objc_msgSend(v8, "isAnimated") && objc_msgSend(v8, "phase") == 1)
    {
      v9 = [SBTransitionSwitcherModifier alloc];
      objc_msgSend(v8, "transitionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SBTransitionSwitcherModifier initWithTransitionID:](v9, "initWithTransitionID:", v10);
      exitingTransitionTrackingModifier = self->_exitingTransitionTrackingModifier;
      self->_exitingTransitionTrackingModifier = v11;

    }
    else if ((objc_msgSend(v8, "isAnimated") & 1) == 0)
    {
      -[SBChainableModifier setState:](self, "setState:", 1);
    }
  }
  v13 = self->_exitingTransitionTrackingModifier;
  if (v13)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __55__SBPeekSplitViewRoutingSwitcherModifier__handleEvent___block_invoke;
    v18[3] = &unk_1E8EA4CE8;
    v18[4] = self;
    v19 = v4;
    v20 = &v21;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v13, v18);
    -[SBChainableModifier setState:](self->_exitingTransitionTrackingModifier, "setState:", v22[3]);
    -[SBChainableModifier setState:](self, "setState:", v22[3]);

    _Block_object_dispose(&v21, 8);
  }
  if (-[SBChainableModifier state](self, "state") == 1)
  {
    v14 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v14, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[SBInvalidateSnapshotCacheSwitcherEventResponse initWithDisplayItems:]([SBInvalidateSnapshotCacheSwitcherEventResponse alloc], "initWithDisplayItems:", 0);
    SBAppendSwitcherModifierResponse(v16, v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __55__SBPeekSplitViewRoutingSwitcherModifier__handleEvent___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t result;

  v2 = (id)objc_msgSend(*(id *)(a1[4] + 160), "handleEvent:", a1[5]);
  result = objc_msgSend(*(id *)(a1[4] + 160), "state");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v9;
  uint64_t v10;
  SBUpdateLayoutSwitcherEventResponse *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v15, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEnteringSplitViewPeekEvent");
  v7 = objc_msgSend(v4, "isExitingSplitViewPeekEvent");
  v8 = objc_msgSend(v4, "phase");
  if (v6 && (v8 == 1 || (objc_msgSend(v4, "isAnimated") & 1) == 0))
  {
    v9 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  if (v7 && self->_peekState == 3 && objc_msgSend(v4, "phase") == 3 && objc_msgSend(v4, "isAnimated"))
  {
    v11 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 16, 3);
    SBAppendSwitcherModifierResponse(v11, v5);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  if (objc_msgSend(v4, "phase") == 3 || !objc_msgSend(v4, "isAnimated"))
  {
    self->_isRotating = 0;
  }
  else
  {
    v13 = objc_msgSend(v4, "fromInterfaceOrientation");
    self->_isRotating = v13 != objc_msgSend(v4, "toInterfaceOrientation");
  }
  self->_spaceConfiguration = objc_msgSend(v4, "toSpaceConfiguration");

  return v5;
}

- (id)handleSceneReadyEvent:(id)a3
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v7, sel_handleSceneReadyEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  SBPerformTransitionSwitcherEventResponse *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v12, sel_handleTapAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", self->_peekingAppLayout);

  if (v7)
  {
    +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPeekConfiguration:", 1);
    objc_msgSend(v8, "setRetainsSiri:", -[SBPeekSplitViewRoutingSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
    v9 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v8, 0);
    SBAppendSwitcherModifierResponse(v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }

  return v5;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SBMutableSwitcherTransitionRequest *v18;
  void *v19;
  SBPerformTransitionSwitcherEventResponse *v20;
  uint64_t v21;
  void *v22;
  SBMutableSwitcherTransitionRequest *v23;
  void *v24;
  SBPerformTransitionSwitcherEventResponse *v25;
  void *v26;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v27;
  id v28;
  SBMutableSwitcherTransitionRequest *v29;
  void *v30;
  SBPerformTransitionSwitcherEventResponse *v31;
  void *v32;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  _QWORD v45[6];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  objc_super v50;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v50.receiver = self;
  v50.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  v41 = v9;
  v42 = v8;
  -[SBChainableModifier responseForProposedChildResponse:childModifier:event:](&v50, sel_responseForProposedChildResponse_childModifier_event_, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  SBSafeCast(v12, v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v13;
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v11, "responseByTransformingResponseWithTransformer:", &__block_literal_global_88);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "appLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "itemForLayoutRole:", objc_msgSend(v14, "layoutRole"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    -[SBSwitcherTransitionRequest setPeekConfiguration:](v18, "setPeekConfiguration:", 1);
    -[SBPeekSplitViewRoutingSwitcherModifier _combinedResultingAppLayoutWithAppLayout:](self, "_combinedResultingAppLayoutWithAppLayout:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherTransitionRequest setAppLayout:](v18, "setAppLayout:", v19);

    -[SBSwitcherTransitionRequest setActivatingDisplayItem:](v18, "setActivatingDisplayItem:", v17);
    -[SBSwitcherTransitionRequest setRetainsSiri:](v18, "setRetainsSiri:", -[SBPeekSplitViewRoutingSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
    v20 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v18, 0);
    SBAppendSwitcherModifierResponse(v20, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21 = objc_opt_class();
  SBSafeCast(v21, v10);
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    objc_msgSend(v11, "responseByTransformingResponseWithTransformer:", &__block_literal_global_93, v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    -[SBSwitcherTransitionRequest setUnlockedEnvironmentMode:](v23, "setUnlockedEnvironmentMode:", 3);
    -[SBSwitcherTransitionRequest setPeekConfiguration:](v23, "setPeekConfiguration:", self->_peekConfiguration);
    -[SBAppLayout appLayoutByModifyingConfiguration:](self->_peekingAppLayout, "appLayoutByModifyingConfiguration:", SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherTransitionRequest setAppLayout:](v23, "setAppLayout:", v24);

    v25 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v23, 0);
    SBAppendSwitcherModifierResponse(v25, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v27, v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_3;
  v45[3] = &unk_1E8EA7DB0;
  v45[4] = self;
  v45[5] = &v46;
  v28 = (id)objc_msgSend(v11, "responseByTransformingResponseWithTransformer:", v45, v39);
  if (*((_BYTE *)v47 + 24))
  {
    v29 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    -[SBSwitcherTransitionRequest setUnlockedEnvironmentMode:](v29, "setUnlockedEnvironmentMode:", 3);
    -[SBSwitcherTransitionRequest setPeekConfiguration:](v29, "setPeekConfiguration:", self->_peekConfiguration);
    -[SBAppLayout appLayoutByModifyingConfiguration:](self->_peekingAppLayout, "appLayoutByModifyingConfiguration:", SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherTransitionRequest setAppLayout:](v29, "setAppLayout:", v30);

    v31 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v29, 1);
    SBAppendSwitcherModifierResponse(v31, v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v33, v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v34 = objc_opt_class();
  SBSafeCast(v34, v10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35 && objc_msgSend(v35, "gestureType") == 1 && objc_msgSend(v36, "phase") == 3)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_4;
    v44[3] = &unk_1E8EA5850;
    v44[4] = self;
    objc_msgSend(v11, "responseByTransformingResponseWithTransformer:", v44);
    v37 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v37;
  }

  _Block_object_dispose(&v46, 8);
  return v11;
}

id __95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 1)
  {

    v2 = 0;
  }
  return v2;
}

id __95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 1)
  {

    v2 = 0;
  }
  return v2;
}

id __95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "type") != 1 || *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) != 2)
    goto LABEL_6;
  objc_msgSend(v3, "transitionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 != 1)
  {

LABEL_6:
    v7 = v3;
    goto LABEL_7;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  v7 = 0;
LABEL_7:

  return v7;
}

SBPerformTransitionSwitcherEventResponse *__95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_4(uint64_t a1, void *a2)
{
  SBPerformTransitionSwitcherEventResponse *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SBPerformTransitionSwitcherEventResponse *v20;

  v3 = a2;
  v4 = objc_opt_class();
  SBSafeCast(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "transitionRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "unlockedEnvironmentMode") == 2)
    {
      v8 = (void *)objc_msgSend(v7, "mutableCopy");
      v9 = v8;
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
    }
    else
    {
      objc_msgSend(v7, "appLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v7, "appLayout");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_10;
        v13 = (void *)v12;
        objc_msgSend(v7, "appLayout");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v15)
          goto LABEL_10;
        v9 = (void *)objc_msgSend(v7, "mutableCopy");
        v16 = *(void **)(a1 + 32);
        objc_msgSend(v7, "appLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_combinedResultingAppLayoutWithAppLayout:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAppLayout:", v18);

        v8 = v9;
        v10 = 1;
      }
      else
      {
        v9 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "appLayoutByModifyingConfiguration:", SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136)));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAppLayout:", v19);

        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        v8 = v9;
      }
    }
    objc_msgSend(v8, "setPeekConfiguration:", v10);
    v20 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v9, objc_msgSend(v6, "isGestureInitiated"));

    v3 = v20;
LABEL_10:

  }
  return v3;
}

- (id)routingModifier:(id)a3 event:(id)a4 forModifier:(id)a5
{
  id v7;
  SBSwitcherModifier *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id *v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id *v35;
  id *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, void *);
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, void *);
  void *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;

  v7 = a4;
  v8 = (SBSwitcherModifier *)a5;
  v9 = v7;
  v10 = objc_opt_class();
  SBSafeCast(v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_msgSend(v11, "copy");
    -[SBAppLayout itemForLayoutRole:](self->_peekingAppLayout, "itemForLayoutRole:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_peekingModifier == v8)
    {
      objc_msgSend(v12, "fromAppLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke;
      v49[3] = &unk_1E8E9DF50;
      v35 = &v50;
      v23 = v14;
      v50 = v23;
      objc_msgSend(v22, "appLayoutWithItemsPassingTest:", v49);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFromAppLayout:", v24);

      objc_msgSend(v12, "toAppLayout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_2;
      v47[3] = &unk_1E8E9DF50;
      v19 = &v48;
      v48 = v23;
      v20 = v47;
    }
    else
    {
      if (self->_nonPeekingModifier != v8)
      {
LABEL_11:
        if (objc_msgSend(v12, "fromEnvironmentMode") == 3
          && (objc_msgSend(v13, "fromAppLayout"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v26,
              !v26))
        {
          v28 = 1;
        }
        else
        {
          if (objc_msgSend(v12, "fromEnvironmentMode") != 1
            || (objc_msgSend(v13, "fromAppLayout"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                v27,
                !v27))
          {
LABEL_21:
            if (objc_msgSend(v12, "toEnvironmentMode") == 3
              && (objc_msgSend(v13, "toAppLayout"),
                  v29 = (void *)objc_claimAutoreleasedReturnValue(),
                  v29,
                  !v29))
            {
              v31 = 1;
            }
            else
            {
              if (objc_msgSend(v12, "toEnvironmentMode") != 1)
                goto LABEL_28;
              objc_msgSend(v13, "toAppLayout");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v30)
                goto LABEL_28;
              v31 = 3;
            }
            objc_msgSend(v13, "setToEnvironmentMode:", v31);
LABEL_28:
            if (self->_peekingModifier == v8 && objc_msgSend(v12, "fromEnvironmentMode") == 2)
              objc_msgSend(v13, "setFromEnvironmentMode:", 3);
            if (self->_peekingModifier == v8 && objc_msgSend(v12, "toEnvironmentMode") == 2)
              objc_msgSend(v13, "setToEnvironmentMode:", 3);
            if (self->_peekingModifier == v8)
            {
              objc_msgSend(v13, "setFromWindowPickerRole:", 0);
              objc_msgSend(v13, "setToWindowPickerRole:", 0);
            }
            goto LABEL_45;
          }
          v28 = 3;
        }
        objc_msgSend(v13, "setFromEnvironmentMode:", v28);
        goto LABEL_21;
      }
      objc_msgSend(v12, "fromAppLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = MEMORY[0x1E0C809B0];
      v43 = 3221225472;
      v44 = __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_3;
      v45 = &unk_1E8E9DF50;
      v35 = &v46;
      v16 = v14;
      v46 = v16;
      objc_msgSend(v15, "appLayoutWithItemsPassingTest:", &v42);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFromAppLayout:", v17);

      objc_msgSend(v12, "toAppLayout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_4;
      v40 = &unk_1E8E9DF50;
      v19 = &v41;
      v41 = v16;
      v20 = &v37;
    }
    objc_msgSend(v18, "appLayoutWithItemsPassingTest:", v20, v35, v37, v38, v39, v40, v41, v42, v43, v44, v45);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setToAppLayout:", v25);

    goto LABEL_11;
  }
  if (objc_msgSend(v9, "type") == 17)
  {
    objc_msgSend(v9, "appLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    if (v21 && (objc_msgSend(v21, "isEqual:", self->_peekingAppLayout) & 1) != 0)
    {
LABEL_44:
      v13 = 0;
LABEL_45:

      goto LABEL_46;
    }
    goto LABEL_43;
  }
  if (objc_msgSend(v9, "type") != 16)
  {
    if (objc_msgSend(v9, "type") == 2 || objc_msgSend(v9, "type") == 5 || objc_msgSend(v9, "type") == 3)
    {
      v32 = objc_opt_class();
      SBSafeCast(v32, v9);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v33;
      if (v33
        && (objc_msgSend(v33, "gestureType") == 1 || objc_msgSend(v14, "gestureType") == 2)
        && self->_peekingModifier == v8)
      {
        goto LABEL_44;
      }
LABEL_43:
      v13 = v9;
      goto LABEL_46;
    }
    v13 = v9;
    if (objc_msgSend(v9, "type") != 14)
      goto LABEL_47;
  }
  v13 = v9;
  if (self->_peekingModifier == v8)
  {
    v13 = 0;
    v14 = v9;
LABEL_46:

  }
LABEL_47:

  return v13;
}

uint64_t __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

uint64_t __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (id)routingModifier:(id)a3 filteredAppLayouts:(id)a4 forModifier:(id)a5
{
  SBAppLayout *peekingAppLayout;
  SBSwitcherModifier *v8;
  id v9;
  void *v10;
  SBSwitcherModifier *peekingModifier;
  uint64_t (*v12)(uint64_t, void *);
  uint64_t *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;

  peekingAppLayout = self->_peekingAppLayout;
  v8 = (SBSwitcherModifier *)a5;
  v9 = a4;
  -[SBAppLayout itemForLayoutRole:](peekingAppLayout, "itemForLayoutRole:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  peekingModifier = self->_peekingModifier;

  if (peekingModifier == v8)
  {
    v18 = MEMORY[0x1E0C809B0];
    v12 = __89__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke;
    v13 = &v18;
  }
  else
  {
    v17 = MEMORY[0x1E0C809B0];
    v12 = __89__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_2;
    v13 = &v17;
  }
  v13[1] = 3221225472;
  v13[2] = (uint64_t)v12;
  v13[3] = (uint64_t)&unk_1E8E9DF78;
  v14 = v10;
  v13[4] = (uint64_t)v14;
  objc_msgSend(v9, "bs_filter:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __89__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

uint64_t __89__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (id)routingModifier:(id)a3 filteredContinuousExposeIdentifiers:(id)a4 forModifier:(id)a5
{
  SBAppLayout *peekingAppLayout;
  SBSwitcherModifier *v8;
  id v9;
  void *v10;
  SBSwitcherModifier *peekingModifier;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;

  peekingAppLayout = self->_peekingAppLayout;
  v8 = (SBSwitcherModifier *)a5;
  v9 = a4;
  -[SBAppLayout continuousExposeIdentifier](peekingAppLayout, "continuousExposeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  peekingModifier = self->_peekingModifier;

  if (peekingModifier == v8)
  {
    v18 = MEMORY[0x1E0C809B0];
    v12 = __106__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredContinuousExposeIdentifiers_forModifier___block_invoke;
    v13 = &v18;
  }
  else
  {
    v17 = MEMORY[0x1E0C809B0];
    v12 = __106__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredContinuousExposeIdentifiers_forModifier___block_invoke_2;
    v13 = &v17;
  }
  v13[1] = 3221225472;
  v13[2] = (uint64_t)v12;
  v13[3] = (uint64_t)&unk_1E8E9DE38;
  v14 = v10;
  v13[4] = (uint64_t)v14;
  objc_msgSend(v9, "bs_filter:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __106__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredContinuousExposeIdentifiers_forModifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2);
}

uint64_t __106__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredContinuousExposeIdentifiers_forModifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2) ^ 1;
}

- (id)routingModifier:(id)a3 modifierForAppLayout:(id)a4
{
  SBAppLayout *peekingAppLayout;
  id v6;
  void *v7;
  int v8;
  int *v9;
  id v10;

  peekingAppLayout = self->_peekingAppLayout;
  v6 = a4;
  -[SBAppLayout itemForLayoutRole:](peekingAppLayout, "itemForLayoutRole:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsItem:", v7);

  v9 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__nonPeekingModifier;
  if (v8)
    v9 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__peekingModifier;
  v10 = *(id *)((char *)&self->super.super.super.isa + *v9);

  return v10;
}

- (CGRect)routingModifier:(id)a3 containerViewBoundsForModifier:(id)a4
{
  id v6;
  SBSwitcherModifier *v7;
  int64_t peekState;
  int64_t v9;
  SBDisplayItem *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t peekConfiguration;
  uint64_t v14;
  SBAppLayout *v15;
  void *v16;
  void *v17;
  void *v18;
  SBAppLayout *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  SBAppLayout *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  SBDisplayItem *v40;
  void *v41;
  objc_super v42;
  objc_super v43;
  objc_super v44;
  objc_super v45;
  objc_super v46;
  objc_super v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[4];
  CGRect result;

  v51[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (SBSwitcherModifier *)a4;
  if (self->_peekingModifier == v7)
  {
    v47.receiver = self;
    v47.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    -[SBPeekSplitViewRoutingSwitcherModifier containerViewBounds](&v47, sel_containerViewBounds);
  }
  else
  {
    if (-[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", self->_peekingAppLayout))
    {
      peekState = self->_peekState;
      if (peekState == 2 || peekState == 1 && !self->_splitViewAppLayout)
      {
        v40 = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:]([SBDisplayItem alloc], "initWithType:bundleIdentifier:uniqueIdentifier:", 0, CFSTR("SBPeekSplitViewRoutingSwitcherModifier-placeholder-B"), &stru_1E8EC7EC0);
        -[SBAppLayout itemForLayoutRole:](self->_peekingAppLayout, "itemForLayoutRole:", 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = [SBAppLayout alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v33;
        v51[0] = v41;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v34;
        v51[1] = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v32, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v35, 3, -[SBAppLayout environment](self->_peekingAppLayout, "environment"), -[SBPeekSplitViewRoutingSwitcherModifier displayOrdinal](self, "displayOrdinal"));

        v46.receiver = self;
        v46.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
        -[SBPeekSplitViewRoutingSwitcherModifier containerViewBounds](&v46, sel_containerViewBounds);
        v45.receiver = self;
        v45.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
        -[SBPeekSplitViewRoutingSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v45, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v19);
LABEL_20:
        v28 = v20;
        v29 = v21;
        v30 = v22;
        v31 = v23;

        goto LABEL_21;
      }
    }
    if (-[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", self->_peekingAppLayout))
    {
      v9 = self->_peekState;
      if (v9 == 3 || v9 == 1 && self->_splitViewAppLayout)
      {
        v10 = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:]([SBDisplayItem alloc], "initWithType:bundleIdentifier:uniqueIdentifier:", 0, CFSTR("SBPeekSplitViewRoutingSwitcherModifier-placeholder-C"), &stru_1E8EC7EC0);
        v40 = v10;
        v11 = 1;
        -[SBAppLayout itemForLayoutRole:](self->_peekingAppLayout, "itemForLayoutRole:", 1);
        v12 = objc_claimAutoreleasedReturnValue();
        v41 = (void *)v12;
        peekConfiguration = self->_peekConfiguration;
        if (peekConfiguration == 2)
          v14 = 1;
        else
          v14 = 2;
        if (peekConfiguration == 2)
          v11 = 2;
        v15 = [SBAppLayout alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v16;
        v49[0] = v12;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v17;
        v49[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v15, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v18, SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration), -[SBAppLayout environment](self->_peekingAppLayout, "environment"), -[SBPeekSplitViewRoutingSwitcherModifier displayOrdinal](self, "displayOrdinal"));

        v44.receiver = self;
        v44.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
        -[SBPeekSplitViewRoutingSwitcherModifier containerViewBounds](&v44, sel_containerViewBounds);
        v43.receiver = self;
        v43.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
        -[SBPeekSplitViewRoutingSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v43, sel_frameForLayoutRole_inAppLayout_withBounds_, v11, v19);
        goto LABEL_20;
      }
    }
    v42.receiver = self;
    v42.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    -[SBPeekSplitViewRoutingSwitcherModifier containerViewBounds](&v42, sel_containerViewBounds);
  }
  v28 = v24;
  v29 = v25;
  v30 = v26;
  v31 = v27;
LABEL_21:

  v36 = v28;
  v37 = v29;
  v38 = v30;
  v39 = v31;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (CGRect)routingModifier:(id)a3 switcherViewBoundsForModifier:(id)a4
{
  id v6;
  SBSwitcherModifier *v7;
  unsigned int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t peekConfiguration;
  int v20;
  unsigned int v21;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;
  objc_super v33;
  CGRect result;

  v6 = a3;
  v7 = (SBSwitcherModifier *)a4;
  if (self->_peekingModifier == v7)
  {
    v33.receiver = self;
    v33.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    -[SBPeekSplitViewRoutingSwitcherModifier containerViewBounds](&v33, sel_containerViewBounds);
    v14 = v24;
    v16 = v25;
    v23 = v26;
    v18 = v27;
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    v8 = -[SBPeekSplitViewRoutingSwitcherModifier isRTLEnabled](&v32, sel_isRTLEnabled);
    -[SBPeekSplitViewRoutingSwitcherModifier switcherSettings](self, "switcherSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "peekInsetWidth");
    v11 = v10;

    -[SBPeekSplitViewRoutingSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v14 = v12;
    v16 = v15;
    v18 = v17;
    peekConfiguration = self->_peekConfiguration;
    if (peekConfiguration == 2)
      v20 = v8;
    else
      v20 = 1;
    if (peekConfiguration == 3)
      v21 = v8;
    else
      v21 = 0;
    if (v20 != 1 || v21 != 0)
      v14 = v11 + v12;
    v23 = v13 - v11;
  }

  v28 = v14;
  v29 = v16;
  v30 = v23;
  v31 = v18;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)scrollModifierForRoutingModifier:(id)a3
{
  return self->_nonPeekingModifier;
}

- (id)homeScreenModifierForRoutingModifier:(id)a3
{
  id v4;
  int64_t peekState;
  int *v6;
  id v7;

  v4 = a3;
  peekState = self->_peekState;
  if (peekState == 4
    || !peekState
    && -[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", self->_peekingAppLayout))
  {
    v6 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__peekingModifier;
  }
  else
  {
    v6 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__nonPeekingModifier;
  }
  v7 = *(id *)((char *)&self->super.super.super.isa + *v6);

  return v7;
}

- (id)transactionCompletionOptionsModifierForRoutingModifier:(id)a3
{
  return self->_nonPeekingModifier;
}

- (id)routingModifier:(id)a3 animationAttributesModifierForLayoutElement:(id)a4
{
  id v5;
  int64_t peekState;
  int *v7;
  int v8;
  id v9;

  v5 = a4;
  if (objc_msgSend(v5, "switcherLayoutElementType"))
  {
    peekState = self->_peekState;
    if (peekState == 4
      || !peekState
      && -[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", self->_peekingAppLayout))
    {
      v7 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__peekingModifier;
    }
    else
    {
      v7 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__nonPeekingModifier;
    }
  }
  else
  {
    v8 = objc_msgSend(v5, "isEqual:", self->_peekingAppLayout);
    v7 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__nonPeekingModifier;
    if (v8)
      v7 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__peekingModifier;
  }
  v9 = *(id *)((char *)&self->super.super.super.isa + *v7);

  return v9;
}

- (id)fallbackModifierForRoutingModifier:(id)a3
{
  return self->_nonPeekingModifier;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  const __CFString *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBChainableModifier descriptionBuilderWithMultilinePrefix:](&v18, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringForPeekConfiguration(self->_peekConfiguration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("peekConfiguration"));

  SBStringForSpaceConfiguration(self->_spaceConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("spaceConfiguration"));

  v9 = self->_peekState - 1;
  if (v9 > 3)
    v10 = CFSTR("fullScreen");
  else
    v10 = off_1E8EA7DD0[v9];
  v11 = (id)objc_msgSend(v4, "appendObject:withName:", v10, CFSTR("peekState"));
  v12 = (id)objc_msgSend(v4, "appendBool:withName:", self->_uncondtionallyAllowAppLayoutContainment, CFSTR("uncondtionallyAllowAppLayoutContainment"));
  -[SBChainableModifier succinctDescription](self->_peekingModifier, "succinctDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v4, "appendObject:withName:", v13, CFSTR("peekingAppLayout"));

  -[SBAppLayout succinctDescription](self->_splitViewAppLayout, "succinctDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v4, "appendObject:withName:", v15, CFSTR("splitViewAppLayout"));

  return v4;
}

- (id)_combinedResultingAppLayoutWithAppLayout:(id)a3
{
  SBAppLayout *peekingAppLayout;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SBAppLayout *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (self->_peekConfiguration == 2)
  {
    peekingAppLayout = self->_peekingAppLayout;
    v5 = a3;
    -[SBAppLayout allItems](peekingAppLayout, "allItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBAppLayout layoutAttributesForItem:](self->_peekingAppLayout, "layoutAttributesForItem:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "layoutAttributesForItem:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = a3;
    objc_msgSend(v12, "allItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "layoutAttributesForItem:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBAppLayout allItems](self->_peekingAppLayout, "allItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBAppLayout layoutAttributesForItem:](self->_peekingAppLayout, "layoutAttributesForItem:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v7;
  v23[1] = v10;
  v24[0] = v8;
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v17;
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v18, SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration), v15, 0, 1, 0, -[SBPeekSplitViewRoutingSwitcherModifier displayOrdinal](self, "displayOrdinal"));
  return v19;
}

- (void)_temporarilyAllowUnconditionaryAppLayoutContainmentWithBlock:(id)a3
{
  BOOL uncondtionallyAllowAppLayoutContainment;

  uncondtionallyAllowAppLayoutContainment = self->_uncondtionallyAllowAppLayoutContainment;
  self->_uncondtionallyAllowAppLayoutContainment = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_uncondtionallyAllowAppLayoutContainment = uncondtionallyAllowAppLayoutContainment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_splitViewAppLayout, 0);
  objc_storeStrong((id *)&self->_exitingTransitionTrackingModifier, 0);
  objc_storeStrong((id *)&self->_peekingAppLayout, 0);
  objc_storeStrong((id *)&self->_routingModifier, 0);
  objc_storeStrong((id *)&self->_nonPeekingModifier, 0);
  objc_storeStrong((id *)&self->_peekingModifier, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
}

@end
