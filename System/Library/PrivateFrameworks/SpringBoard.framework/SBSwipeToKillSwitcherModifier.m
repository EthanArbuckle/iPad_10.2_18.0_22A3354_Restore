@implementation SBSwipeToKillSwitcherModifier

- (SBSwipeToKillSwitcherModifier)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 fadeOutSwipedItems:(BOOL)a5
{
  id v10;
  SBSwipeToKillSwitcherModifier *v11;
  uint64_t v12;
  SBAppLayout *leafAppLayout;
  SBHighlightSwitcherModifier *v14;
  SBHighlightSwitcherModifier *highlightModifier;
  void *v17;
  objc_super v18;

  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBSwipeToKillSwitcherModifier;
  v11 = -[SBSwitcherModifier init](&v18, sel_init);
  if (v11)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBSwipeToKillSwitcherModifier.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    v11->_layoutRole = a3;
    objc_storeStrong((id *)&v11->_appLayout, a4);
    objc_msgSend(v10, "leafAppLayoutForRole:", a3);
    v12 = objc_claimAutoreleasedReturnValue();
    leafAppLayout = v11->_leafAppLayout;
    v11->_leafAppLayout = (SBAppLayout *)v12;

    v11->_fadeOutSwipedItems = a5;
    v11->_hasPrepared = 0;
    v14 = -[SBHighlightSwitcherModifier initWithLayoutRole:inAppLayout:listensForHighlightEvents:]([SBHighlightSwitcherModifier alloc], "initWithLayoutRole:inAppLayout:listensForHighlightEvents:", v11->_layoutRole, v11->_appLayout, 0);
    highlightModifier = v11->_highlightModifier;
    v11->_highlightModifier = v14;

    -[SBHighlightSwitcherModifier setStylesCornerRadii:](v11->_highlightModifier, "setStylesCornerRadii:", 0);
    -[SBChainableModifier addChildModifier:](v11, "addChildModifier:", v11->_highlightModifier);
  }

  return v11;
}

- (void)_performBlockWhileSimulatingPostRemovalAppLayoutState:(id)a3
{
  id v4;
  BOOL simulatingPostRemovalState;
  id v6;
  void *v7;
  SBOverrideAppLayoutsSwitcherModifier *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  simulatingPostRemovalState = self->_simulatingPostRemovalState;
  self->_simulatingPostRemovalState = 1;
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[SBSwipeToKillSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(v10, "removeObject:", self->_appLayout);
  v8 = -[SBOverrideAppLayoutsSwitcherModifier initWithAppLayouts:]([SBOverrideAppLayoutsSwitcherModifier alloc], "initWithAppLayouts:", v10);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__SBSwipeToKillSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke;
  v11[3] = &unk_1E8E9E8D0;
  v12 = v4;
  v9 = v4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v8, v11);
  self->_simulatingPostRemovalState = simulatingPostRemovalState;

}

uint64_t __87__SBSwipeToKillSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)handleSwipeToKillEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *v6;
  void *v7;
  char v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  SBUpdateLayoutSwitcherEventResponse *v13;
  void *v14;
  SBUpdateLayoutSwitcherEventResponse *v15;
  uint64_t v16;
  void *v17;
  SBBlurItemContainerSwitcherEventResponse *v18;
  uint64_t v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwitcherModifier handleSwipeToKillEvent:](&v21, sel_handleSwipeToKillEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (-[SBSwipeToKillSwitcherModifier appLayouts](self, "appLayouts"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", v6),
        v7,
        (v8 & 1) != 0))
  {
    if (-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6))
    {
      if (!self->_hasPrepared)
        -[SBSwipeToKillSwitcherModifier _calculateInterpolationDirection](self, "_calculateInterpolationDirection");
      objc_msgSend(v4, "progress");
      self->_progress = v9;
      objc_msgSend(v4, "translation");
      self->_translation.x = v10;
      self->_translation.y = v11;
      self->_isDragging = objc_msgSend(v4, "isDragging");
      objc_msgSend(v4, "decelerationTargetProgress");
      self->_decelerationTargetProgress = v12;
      v13 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v13, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (((BSFloatIsZero() & 1) != 0 || BSFloatGreaterThanOrEqualToFloat()) && !self->_isDragging)
      {
        -[SBChainableModifier setState:](self, "setState:", 1);
        if (!-[SBSwipeToKillSwitcherModifier _dragHasBeenReleasedTowardKill](self, "_dragHasBeenReleasedTowardKill"))
        {
          v15 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 3);
          SBAppendSwitcherModifierResponse(v15, v14);
          v16 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v16;
        }
      }
      self->_hasPrepared = 1;

      v5 = v14;
    }
  }
  else
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }
  if (self->_fadeOutSwipedItems && self->_appLayout == v6)
  {
    -[SBAppLayout leafAppLayoutForRole:](v6, "leafAppLayoutForRole:", self->_layoutRole);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", v17, -[SBSwipeToKillSwitcherModifier _dragHasBeenReleasedTowardKill](self, "_dragHasBeenReleasedTowardKill"), 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v18, v5);
    v19 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v19;
  }

  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSwipeToKillSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleRemovalEvent:](&v8, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "isOrContainsAppLayout:", self->_appLayout))
    -[SBChainableModifier setState:](self, "setState:", 1);

  return v5;
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
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  objc_super v23;
  CGRect result;

  v23.receiver = self;
  v23.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier frameForIndex:](&v23, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[SBSwipeToKillSwitcherModifier _interpolatingAdjacentIndexForIndex:](self, "_interpolatingAdjacentIndexForIndex:", a3);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v22.receiver = self;
    v22.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier frameForIndex:](&v22, sel_frameForIndex_, v13);
    BSRectByLinearlyInterpolatingRects();
    v6 = v14;
    v8 = v15;
    v10 = v16;
    v12 = v17;
  }
  v18 = v6;
  v19 = v8;
  v20 = v10;
  v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_);
  v6 = v5;
  v7 = -[SBSwipeToKillSwitcherModifier _interpolatingAdjacentIndexForIndex:](self, "_interpolatingAdjacentIndexForIndex:", a3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_, v7);
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  objc_super v10;

  v6 = (SBAppLayout *)a4;
  v10.receiver = self;
  v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v10, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  if (self->_appLayout == v6 && !-[SBAppLayout isCenterOverFull](v6, "isCenterOverFull"))
    v8 = v8 + (0.0 - v8) * self->_progress;

  return fmin(fmax(v8, 0.0), 1.0);
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBSwipeToKillSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6)
    || (v7 = 0.0, !self->_isDragging) && BSFloatIsZero())
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier titleAndIconOpacityForIndex:](&v10, sel_titleAndIconOpacityForIndex_, a3);
    v7 = v8;
  }

  return v7;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  objc_super v26;
  UIRectCornerRadii result;

  topRight = a5.topRight;
  bottomRight = a5.bottomRight;
  bottomLeft = a5.bottomLeft;
  topLeft = a5.topLeft;
  v11 = a4;
  if (!-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v11)
    || !self->_isDragging && (BSFloatIsZero() & 1) != 0
    || a3 == 4
    || (-[SBSwipeToKillSwitcherModifier shouldTetherItemsAndAccessoriesInAppLayout:](self, "shouldTetherItemsAndAccessoriesInAppLayout:", v11) & 1) != 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v26, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, a3, v11, topLeft, bottomLeft, bottomRight, topRight);
  }
  else
  {
    -[SBSwipeToKillSwitcherModifier appLayouts](self, "appLayouts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "indexOfObject:", v11);

    -[SBSwipeToKillSwitcherModifier cornerRadiiForIndex:](self, "cornerRadiiForIndex:", v25);
    SBRectCornerRadiiForRadius();
  }
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;

  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  result.topRight = v23;
  result.bottomRight = v22;
  result.bottomLeft = v21;
  result.topLeft = v20;
  return result;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier visibleAppLayouts](&v13, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__84;
  v11 = __Block_byref_object_dispose__84;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SBSwipeToKillSwitcherModifier_visibleAppLayouts__block_invoke;
  v6[3] = &unk_1E8E9DFA0;
  v6[4] = self;
  v6[5] = &v7;
  -[SBSwipeToKillSwitcherModifier _performBlockWhileSimulatingPostRemovalAppLayoutState:](self, "_performBlockWhileSimulatingPostRemovalAppLayoutState:", v6);
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__SBSwipeToKillSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBSwipeToKillSwitcherModifier;
  objc_msgSendSuper2(&v5, sel_visibleAppLayouts);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)animationAttributesForLayoutElement:(id)a3
{
  SBAppLayout *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = (SBAppLayout *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (-[SBAppLayout switcherLayoutElementType](v4, "switcherLayoutElementType")
    || (-[SBSwipeToKillSwitcherModifier shouldTetherItemsAndAccessoriesInAppLayout:](self, "shouldTetherItemsAndAccessoriesInAppLayout:", v4) & 1) == 0)
  {
    v7 = 5;
  }
  else
  {
    v7 = 1;
  }
  objc_msgSend(v6, "setUpdateMode:", v7);
  objc_msgSend(v6, "setCornerRadiusUpdateMode:", 3);
  if (self->_fadeOutSwipedItems && self->_appLayout == v4)
  {
    -[SBSwipeToKillSwitcherModifier switcherSettings](self, "switcherSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "swipeToKillOpacitySettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOpacitySettings:", v10);

  }
  return v6;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  SBAppLayout *v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;
  objc_super v14;

  v8 = (SBAppLayout *)a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v14, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
  v10 = v9;
  if (-[SBSwipeToKillSwitcherModifier _interpolatingAdjacentIndexForIndex:](self, "_interpolatingAdjacentIndexForIndex:", a5) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v13, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    BSFloatByLinearlyInterpolatingFloats();
    v10 = v11;
  }
  if (self->_fadeOutSwipedItems
    && self->_appLayout == v8
    && self->_layoutRole == a3
    && -[SBSwipeToKillSwitcherModifier _dragHasBeenReleasedTowardKill](self, "_dragHasBeenReleasedTowardKill"))
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier wallpaperOverlayAlphaForIndex:](&v11, sel_wallpaperOverlayAlphaForIndex_);
  v6 = v5;
  v7 = -[SBSwipeToKillSwitcherModifier _interpolatingAdjacentIndexForIndex:](self, "_interpolatingAdjacentIndexForIndex:", a3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier wallpaperOverlayAlphaForIndex:](&v10, sel_wallpaperOverlayAlphaForIndex_, v7);
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier lighteningAlphaForIndex:](&v11, sel_lighteningAlphaForIndex_);
  v6 = v5;
  v7 = -[SBSwipeToKillSwitcherModifier _interpolatingAdjacentIndexForIndex:](self, "_interpolatingAdjacentIndexForIndex:", a3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier lighteningAlphaForIndex:](&v10, sel_lighteningAlphaForIndex_, v7);
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier titleOpacityForIndex:](&v11, sel_titleOpacityForIndex_);
  v6 = v5;
  v7 = -[SBSwipeToKillSwitcherModifier _interpolatingAdjacentIndexForIndex:](self, "_interpolatingAdjacentIndexForIndex:", a3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier titleOpacityForIndex:](&v10, sel_titleOpacityForIndex_, v7);
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v7;
  double v8;
  double v9;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v12, sel_shadowOpacityForLayoutRole_atIndex_);
  v8 = v7;
  if (-[SBSwipeToKillSwitcherModifier _interpolatingAdjacentIndexForIndex:](self, "_interpolatingAdjacentIndexForIndex:", a4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v11, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4);
    BSFloatByLinearlyInterpolatingFloats();
    return v9;
  }
  return v8;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier shadowOffsetForIndex:](&v11, sel_shadowOffsetForIndex_);
  v6 = v5;
  v7 = -[SBSwipeToKillSwitcherModifier _interpolatingAdjacentIndexForIndex:](self, "_interpolatingAdjacentIndexForIndex:", a3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier shadowOffsetForIndex:](&v10, sel_shadowOffsetForIndex_, v7);
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (CGPoint)contentViewOffsetForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  v6 = (SBAppLayout *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier contentViewOffsetForLayoutRole:inAppLayout:](&v13, sel_contentViewOffsetForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  v10 = v9;
  if (self->_appLayout == v6
    && self->_layoutRole != a3
    && -[SBSwipeToKillSwitcherModifier shouldTetherItemsAndAccessoriesInAppLayout:](self, "shouldTetherItemsAndAccessoriesInAppLayout:", v6))
  {
    v8 = v8 + 0.0;
    v10 = v10 - self->_translation.y;
  }

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)contentViewOffsetForAccessoriesOfAppLayout:(id)a3
{
  SBAppLayout *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  v4 = (SBAppLayout *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier contentViewOffsetForAccessoriesOfAppLayout:](&v11, sel_contentViewOffsetForAccessoriesOfAppLayout_, v4);
  v6 = v5;
  v8 = v7;
  if (self->_appLayout == v4
    && -[SBSwipeToKillSwitcherModifier shouldTetherItemsAndAccessoriesInAppLayout:](self, "shouldTetherItemsAndAccessoriesInAppLayout:", v4))
  {
    v6 = v6 + 0.0;
    v8 = v8 - self->_translation.y;
  }

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  BOOL v7;
  objc_super v9;

  -[SBSwipeToKillSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_appLayout)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSwipeToKillSwitcherModifier;
    v7 = -[SBSwipeToKillSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (void)_calculateInterpolationDirection
{
  void *v3;
  int v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  double v11;
  double v12;
  unint64_t v13;
  _QWORD v14[7];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier scrollViewAttributes](&v21, sel_scrollViewAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interpolatesDuringSwipeToKill");

  if (v4)
  {
    -[SBSwipeToKillSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
    v6 = v5;
    -[SBSwipeToKillSwitcherModifier appLayouts](self, "appLayouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", self->_appLayout);

    v9 = -[SBSwipeToKillSwitcherModifier indexToScrollToAfterRemovingIndex:](self, "indexToScrollToAfterRemovingIndex:", v8);
    v15 = 0;
    v16 = (double *)&v15;
    v17 = 0x3010000000;
    v19 = 0;
    v20 = 0;
    v18 = &unk_1D0FA064E;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__SBSwipeToKillSwitcherModifier__calculateInterpolationDirection__block_invoke;
    v14[3] = &unk_1E8E9FD08;
    v14[5] = &v15;
    v14[6] = v9;
    v14[4] = self;
    -[SBSwipeToKillSwitcherModifier _performBlockWhileSimulatingPostRemovalAppLayoutState:](self, "_performBlockWhileSimulatingPostRemovalAppLayoutState:", v14);
    v10 = -[SBSwipeToKillSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v11 = v16[4];
    v12 = 0.0;
    if (v11 < 0.0)
      v11 = 0.0;
    if (v6 >= 0.0)
      v12 = v6;
    if ((v10 & 1) != 0)
    {
      if (v11 >= v12)
      {
LABEL_8:
        v13 = 1;
LABEL_12:
        _Block_object_dispose(&v15, 8);
        goto LABEL_13;
      }
    }
    else if (v11 < v12)
    {
      goto LABEL_8;
    }
    v13 = 2;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_13:
  self->_interpolationDirection = v13;
}

id __65__SBSwipeToKillSwitcherModifier__calculateInterpolationDirection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v2 = *(_QWORD *)(a1 + 48);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)SBSwipeToKillSwitcherModifier;
  result = objc_msgSendSuper2(&v7, sel_contentOffsetForIndex_alignment_, v2, 0);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  return result;
}

- (unint64_t)_interpolatingAdjacentIndexForIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t interpolationDirection;
  BOOL v9;
  unint64_t v10;

  if (!self->_interpolationDirection)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[SBSwipeToKillSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", self->_appLayout);
  interpolationDirection = self->_interpolationDirection;
  if (interpolationDirection != 1 || v6 >= a3)
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = interpolationDirection == 2 && v6 > a3;
    if (v9 && objc_msgSend(v5, "count") - 1 > a3)
      v10 = a3 + 1;
  }
  else
  {
    v10 = a3 - 1;
  }

  return v10;
}

- (BOOL)_dragHasBeenReleasedTowardKill
{
  return BSFloatIsZero() ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightModifier, 0);
  objc_storeStrong((id *)&self->_leafAppLayout, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
