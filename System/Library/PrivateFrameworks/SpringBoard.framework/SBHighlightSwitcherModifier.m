@implementation SBHighlightSwitcherModifier

- (SBHighlightSwitcherModifier)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 listensForHighlightEvents:(BOOL)a5
{
  id v9;
  SBHighlightSwitcherModifier *v10;
  SBHighlightSwitcherModifier *v11;
  uint64_t v12;
  SBAppLayout *leafAppLayout;
  objc_super v15;

  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBHighlightSwitcherModifier;
  v10 = -[SBSwitcherModifier init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_layoutRole = a3;
    objc_storeStrong((id *)&v10->_appLayout, a4);
    -[SBAppLayout leafAppLayoutForRole:](v11->_appLayout, "leafAppLayoutForRole:", v11->_layoutRole);
    v12 = objc_claimAutoreleasedReturnValue();
    leafAppLayout = v11->_leafAppLayout;
    v11->_leafAppLayout = (SBAppLayout *)v12;

    v11->_listensForHighlightEvents = a5;
    v11->_stylesCornerRadii = 1;
  }

  return v11;
}

- (id)handleHighlightEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBAppLayout *v7;
  uint64_t phase;
  SBUpdateLayoutSwitcherEventResponse *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHighlightSwitcherModifier;
  -[SBSwitcherModifier handleHighlightEvent:](&v12, sel_handleHighlightEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_listensForHighlightEvents)
  {
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leafAppLayoutForRole:", objc_msgSend(v4, "layoutRole"));
    v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

    if (v7 == self->_leafAppLayout)
    {
      phase = objc_msgSend(v4, "phase");
      self->_phase = phase;
      if (!phase)
      {
        v9 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
        SBAppendSwitcherModifierResponse(v9, v5);
        v10 = objc_claimAutoreleasedReturnValue();

        phase = self->_phase;
        v5 = (void *)v10;
      }
      if ((unint64_t)(phase - 1) <= 1)
        -[SBChainableModifier setState:](self, "setState:", 1);
    }

  }
  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  SBAppLayout *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SBAppLayout *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHighlightSwitcherModifier;
  -[SBHighlightSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (self->_appLayout == v4
    && (-[SBHighlightSwitcherModifier shouldTetherItemsAndAccessoriesInAppLayout:](self, "shouldTetherItemsAndAccessoriesInAppLayout:", v4) & 1) == 0)
  {
    objc_msgSend(v6, "setUpdateMode:", 3);
  }

  return v6;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isOrContainsAppLayout:", self->_appLayout)
    && !-[SBHighlightSwitcherModifier shouldTetherItemsAndAccessoriesInAppLayout:](self, "shouldTetherItemsAndAccessoriesInAppLayout:", self->_appLayout))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHighlightSwitcherModifier;
    v5 = -[SBHighlightSwitcherModifier shouldAccessoryDrawShadowForAppLayout:](&v7, sel_shouldAccessoryDrawShadowForAppLayout_, v4);
  }

  return v5;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  SBAppLayout *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  UIRectCornerRadii result;

  topRight = a5.topRight;
  bottomRight = a5.bottomRight;
  bottomLeft = a5.bottomLeft;
  topLeft = a5.topLeft;
  v11 = (SBAppLayout *)a4;
  v31.receiver = self;
  v31.super_class = (Class)SBHighlightSwitcherModifier;
  -[SBHighlightSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v31, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, a3, v11, topLeft, bottomLeft, bottomRight, topRight);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (self->_stylesCornerRadii && self->_appLayout == v11 && -[SBAppLayout environment](v11, "environment") == 1)
  {
    if (-[SBAppLayout isSplitConfiguration](v11, "isSplitConfiguration"))
    {
      -[SBAppLayout itemForLayoutRole:](v11, "itemForLayoutRole:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        -[SBHighlightSwitcherModifier appLayouts](self, "appLayouts");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "indexOfObject:", v11);

        -[SBHighlightSwitcherModifier cornerRadiiForIndex:](self, "cornerRadiiForIndex:", v22);
        SBRectCornerRadiiForRadius();
        v13 = v23;
        v15 = v24;
        v17 = v25;
        v19 = v26;
      }
    }
  }

  v27 = v13;
  v28 = v15;
  v29 = v17;
  v30 = v19;
  result.topRight = v30;
  result.bottomRight = v29;
  result.bottomLeft = v28;
  result.topLeft = v27;
  return result;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[SBHighlightSwitcherModifier shouldBringCardToFrontDuringInsertionOrRemoval](self, "shouldBringCardToFrontDuringInsertionOrRemoval")&& -[SBAppLayout environment](self->_appLayout, "environment") == 1)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBHighlightSwitcherModifier;
    -[SBHighlightSwitcherModifier topMostLayoutElements](&v9, sel_topMostLayoutElements);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = (void *)objc_msgSend(v3, "mutableCopy");
      v6 = objc_msgSend(v5, "indexOfObject:", self->_appLayout);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v5, "removeObjectAtIndex:", v6);
      objc_msgSend(v5, "insertObject:atIndex:", self->_appLayout, 0);
    }
    else
    {
      v10[0] = self->_appLayout;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHighlightSwitcherModifier;
    -[SBHighlightSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  SBAppLayout *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (SBAppLayout *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHighlightSwitcherModifier;
  -[SBHighlightSwitcherModifier topMostLayoutRolesForAppLayout:](&v11, sel_topMostLayoutRolesForAppLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appLayout == v4)
  {
    -[SBAppLayout itemForLayoutRole:](v4, "itemForLayoutRole:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_layoutRole);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v5)
      {
        v9 = (void *)objc_msgSend(v5, "mutableCopy");
        if (objc_msgSend(v9, "containsObject:", v8))
          objc_msgSend(v9, "removeObject:", v8);
        objc_msgSend(v9, "insertObject:atIndex:", v8, 0);

      }
      else
      {
        v12[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v5 = v9;
    }
  }

  return v5;
}

- (BOOL)stylesCornerRadii
{
  return self->_stylesCornerRadii;
}

- (void)setStylesCornerRadii:(BOOL)a3
{
  self->_stylesCornerRadii = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafAppLayout, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
