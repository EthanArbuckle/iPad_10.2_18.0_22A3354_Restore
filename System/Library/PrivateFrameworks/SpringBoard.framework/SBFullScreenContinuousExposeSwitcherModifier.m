@implementation SBFullScreenContinuousExposeSwitcherModifier

- (SBFullScreenContinuousExposeSwitcherModifier)initWithFullScreenAppLayout:(id)a3
{
  id v6;
  SBFullScreenContinuousExposeSwitcherModifier *v7;
  SBFullScreenAppLayoutSwitcherModifier *v8;
  SBFullScreenAppLayoutSwitcherModifier *fullScreenAppLayoutModifier;
  void *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  v7 = -[SBSwitcherModifier init](&v12, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("SBFullScreenContinuousExposeSwitcherModifier.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    objc_storeStrong((id *)&v7->_fullScreenAppLayout, a3);
    -[SBFullScreenContinuousExposeSwitcherModifier _resetKeyboardNavigationZOrder](v7, "_resetKeyboardNavigationZOrder");
    v7->_handlesTapAppLayoutEvents = 1;
    v7->_handlesTapAppLayoutHeaderEvents = 1;
    v8 = -[SBFullScreenAppLayoutSwitcherModifier initWithActiveAppLayout:]([SBFullScreenAppLayoutSwitcherModifier alloc], "initWithActiveAppLayout:", v6);
    fullScreenAppLayoutModifier = v7->_fullScreenAppLayoutModifier;
    v7->_fullScreenAppLayoutModifier = v8;

    -[SBFullScreenAppLayoutSwitcherModifier setHandlesAssistantPresentationEvents:](v7->_fullScreenAppLayoutModifier, "setHandlesAssistantPresentationEvents:", 0);
    -[SBChainableModifier addChildModifier:atLevel:key:](v7, "addChildModifier:atLevel:key:", v7->_fullScreenAppLayoutModifier, 1, 0);
  }

  return v7;
}

- (id)handleEvent:(id)a3
{
  id v4;
  char v5;
  SBStripContinuousExposeSwitcherModifier *stripModifier;
  SBStripContinuousExposeSwitcherModifier *v7;
  SBStripContinuousExposeSwitcherModifier *v8;
  SBStripContinuousExposeSwitcherModifier *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v5 = -[SBFullScreenContinuousExposeSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled");
  stripModifier = self->_stripModifier;
  if ((v5 & 1) != 0)
  {
    if (stripModifier)
    {
      -[SBChainableModifier setState:](stripModifier, "setState:", 1);
      v7 = self->_stripModifier;
      self->_stripModifier = 0;

    }
  }
  else if (!stripModifier)
  {
    v8 = objc_alloc_init(SBStripContinuousExposeSwitcherModifier);
    v9 = self->_stripModifier;
    self->_stripModifier = v8;

    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_stripModifier, 0, 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v12, sel_handleEvent_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setContinuousExposeConfigurationChangeTransition:(BOOL)a3
{
  self->_continuousExposeConfigurationChangeTransition = a3;
  -[SBStripContinuousExposeSwitcherModifier setContinuousExposeConfigurationChangeTransition:](self->_stripModifier, "setContinuousExposeConfigurationChangeTransition:");
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBFullScreenContinuousExposeSwitcherModifier *v11;

  v4 = a3;
  -[SBChainableModifier succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__SBFullScreenContinuousExposeSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __86__SBFullScreenContinuousExposeSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("fullScreenAppLayout"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("handlesTapAppLayoutEvents"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 121), CFSTR("handlesTapAppLayoutHeaderEvents"));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 96);
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "succinctDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, CFSTR("stripModifier"));

    v5 = *(_QWORD *)(a1 + 40);
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(v5 + 104), "succinctDescription");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "appendObject:withName:", v12, CFSTR("fullScreenAppLayoutModifier"));

}

- (NSMutableSet)highlightedByTouchAppLayouts
{
  SBStripContinuousExposeSwitcherModifier *stripModifier;
  void *v3;

  stripModifier = self->_stripModifier;
  if (stripModifier)
  {
    -[SBStripContinuousExposeSwitcherModifier highlightedByTouchAppLayouts](stripModifier, "highlightedByTouchAppLayouts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)objc_opt_new();
  }
  return (NSMutableSet *)v3;
}

- (void)setHighlightedByTouchAppLayouts:(id)a3
{
  -[SBStripContinuousExposeSwitcherModifier setHighlightedByTouchAppLayouts:](self->_stripModifier, "setHighlightedByTouchAppLayouts:", a3);
}

- (NSMutableSet)highlightedByHoverAppLayouts
{
  SBStripContinuousExposeSwitcherModifier *stripModifier;
  void *v3;

  stripModifier = self->_stripModifier;
  if (stripModifier)
  {
    -[SBStripContinuousExposeSwitcherModifier highlightedByHoverAppLayouts](stripModifier, "highlightedByHoverAppLayouts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)objc_opt_new();
  }
  return (NSMutableSet *)v3;
}

- (void)setHighlightedByHoverAppLayouts:(id)a3
{
  -[SBStripContinuousExposeSwitcherModifier setHighlightedByHoverAppLayouts:](self->_stripModifier, "setHighlightedByHoverAppLayouts:", a3);
}

- (double)continuousExposeStripProgress
{
  double result;

  if (!-[SBFullScreenContinuousExposeSwitcherModifier _isStripStashed](self, "_isStripStashed")
    && !-[SBFullScreenContinuousExposeSwitcherModifier prefersStripHidden](self, "prefersStripHidden"))
  {
    return 1.0;
  }
  -[SBFullScreenContinuousExposeSwitcherModifier _continuousExposeStripRevealProgress](self, "_continuousExposeStripRevealProgress");
  return result;
}

- (double)_continuousExposeStripRevealProgress
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBFullScreenContinuousExposeSwitcherModifier continuousExposeStripProgress](&v3, sel_continuousExposeStripProgress);
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
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

  -[SBFullScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6))
  {
    -[SBFullScreenAppLayoutSwitcherModifier frameForIndex:](self->_fullScreenAppLayoutModifier, "frameForIndex:", a3);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier frameForIndex:](&v19, sel_frameForIndex_, a3);
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

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  -[SBFullScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.5;
  v8 = 0.5;
  if (!-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6))
  {
    v13.receiver = self;
    v13.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier anchorPointForIndex:](&v13, sel_anchorPointForIndex_, a3);
    v7 = v9;
    v8 = v10;
  }

  v11 = v7;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *fullScreenAppLayoutModifier;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  -[SBFullScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6))
  {
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("SBFullScreenContinuousExposeSwitcherModifierAssistantModifierKey"));
    fullScreenAppLayoutModifier = (void *)objc_claimAutoreleasedReturnValue();
    v8 = fullScreenAppLayoutModifier;
    if (!fullScreenAppLayoutModifier)
      fullScreenAppLayoutModifier = self->_fullScreenAppLayoutModifier;
    objc_msgSend(fullScreenAppLayoutModifier, "scaleForIndex:", a3);
    v10 = v11;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier scaleForIndex:](&v13, sel_scaleForIndex_, a3);
    v10 = v9;
  }

  return v10;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (!-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v9))
  {
    v18.receiver = self;
    v18.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v18, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    x = v10;
    y = v11;
    width = v12;
    height = v13;
  }

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v7))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v12, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    x = v8;
    y = v9;
  }

  v10 = x;
  v11 = y;
  result.y = v11;
  result.x = v10;
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
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
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
  double v40;
  double v41;
  double v42;
  int v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  objc_super v58;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v58.receiver = self;
  v58.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBFullScreenContinuousExposeSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v58, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v11)&& (-[SBFullScreenContinuousExposeSwitcherModifier _isStripStashed](self, "_isStripStashed")|| -[SBFullScreenContinuousExposeSwitcherModifier prefersStripHidden](self, "prefersStripHidden")))
  {
    -[SBFullScreenContinuousExposeSwitcherModifier _continuousExposeStripRevealProgress](self, "_continuousExposeStripRevealProgress");
    v21 = v20;
    if (BSFloatGreaterThanFloat())
    {
      -[SBFullScreenContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v23 = v22;
      -[SBFullScreenContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_fullScreenAppLayout);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "itemForLayoutRole:", a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "autoLayoutItemForDisplayItem:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "boundingBox");
      v54 = v28;
      v55 = v29;
      v56 = v30;
      v32 = v31;
      objc_msgSend(v24, "stripWidth");
      v34 = v33;
      objc_msgSend(v24, "screenEdgePadding");
      v35 = v23;
      v37 = fmin((v23 - v34 - v36) / v32, 1.0);
      v38 = (v34 + v35 - v36) * 0.5;
      if (v38 >= v34 + v32 * v37 * 0.5)
        v38 = v34 + v32 * v37 * 0.5;
      v53 = v38;
      v57 = v17;
      v39 = v21;
      v40 = v54 + v32 * 0.5;
      if (BSFloatGreaterThanFloat())
        v41 = v54 + v32 * 0.5;
      else
        v41 = v53;
      v42 = v39 * (v37 + -1.0) + 1.0;
      v43 = -[SBFullScreenContinuousExposeSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
      v44 = v39 * (v41 - v40);
      v17 = v57;
      v45 = v44 + 0.0;
      if (v43)
        v46 = -v45;
      else
        v46 = v45;
      objc_msgSend(v27, "position");
      v15 = v15 - (1.0 - v42) * (v48 - (v56 + v55 * 0.5));
      v13 = v46 + v13 - (1.0 - v42) * (v47 - v40);

    }
  }

  v49 = v13;
  v50 = v15;
  v51 = v17;
  v52 = v19;
  result.size.height = v52;
  result.size.width = v51;
  result.origin.y = v50;
  result.origin.x = v49;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  v6 = a4;
  -[SBFullScreenContinuousExposeSwitcherModifier scaleForLayoutRole:inAppLayout:](&v22, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  LODWORD(a3) = -[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6, v22.receiver, v22.super_class);

  if ((_DWORD)a3
    && (-[SBFullScreenContinuousExposeSwitcherModifier _isStripStashed](self, "_isStripStashed")
     || -[SBFullScreenContinuousExposeSwitcherModifier prefersStripHidden](self, "prefersStripHidden")))
  {
    -[SBFullScreenContinuousExposeSwitcherModifier _continuousExposeStripRevealProgress](self, "_continuousExposeStripRevealProgress");
    v10 = v9;
    if (BSFloatGreaterThanFloat())
    {
      -[SBFullScreenContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v12 = v11;
      -[SBFullScreenContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_fullScreenAppLayout);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "boundingBox");
      v16 = v15;
      objc_msgSend(v13, "stripWidth");
      v18 = v17;
      objc_msgSend(v13, "screenEdgePadding");
      v20 = fmin((v12 - v18 - v19) / v16, 1.0);
      BSFloatGreaterThanFloat();
      v8 = v8 * (v10 * (v20 + -1.0) + 1.0);

    }
  }
  return v8;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBFullScreenContinuousExposeSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_fullScreenAppLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v2;
  void *v3;

  -[SBFullScreenContinuousExposeSwitcherModifier visibleAppLayouts](self, "visibleAppLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  UIRectCornerRadii result;

  -[SBFullScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6))
  {
    if (-[SBFullScreenContinuousExposeSwitcherModifier _stageContainsFullScreenItem](self, "_stageContainsFullScreenItem"))
    {
      -[SBFullScreenContinuousExposeSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    }
    else
    {
      -[SBFullScreenContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stageCornerRadii");

    }
    -[SBFullScreenContinuousExposeSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier cornerRadiiForIndex:](&v20, sel_cornerRadiiForIndex_, a3);
  }
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v15 = v10;

  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.topRight = v19;
  result.bottomRight = v18;
  result.bottomLeft = v17;
  result.topLeft = v16;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  -[SBFullScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6))
  {
    if (-[SBFullScreenContinuousExposeSwitcherModifier _stageContainsFullScreenItem](self, "_stageContainsFullScreenItem"))
    {
      v7 = 0;
    }
    else
    {
      v7 = 15;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    v7 = -[SBFullScreenContinuousExposeSwitcherModifier maskedCornersForIndex:](&v9, sel_maskedCornersForIndex_, a3);
  }

  return v7;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  -[SBFullScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1.0;
  if (!-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v8))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v12, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4);
    v9 = v10;
  }

  return v9;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (BOOL)shouldUseWallpaperGradientTreatment
{
  return 1;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double Empty;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  SBSwitcherWallpaperGradientAttributes result;

  -[SBFullScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6))
  {
    Empty = SBSwitcherWallpaperGradientAttributesMakeEmpty();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier wallpaperGradientAttributesForIndex:](&v13, sel_wallpaperGradientAttributesForIndex_, a3);
  }
  v9 = Empty;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.trailingAlpha = v12;
  result.leadingAlpha = v11;
  return result;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBFullScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  if (!-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier titleAndIconOpacityForIndex:](&v10, sel_titleAndIconOpacityForIndex_, a3);
    v7 = v8;
  }

  return v7;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0.0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *fullScreenAppLayout;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  objc_super v12;

  fullScreenAppLayout = self->_fullScreenAppLayout;
  v7 = a4;
  objc_msgSend(v7, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(fullScreenAppLayout) = -[SBAppLayout containsItem:](fullScreenAppLayout, "containsItem:", v8);

  if ((_DWORD)fullScreenAppLayout)
  {
    v9 = -[SBFullScreenContinuousExposeSwitcherModifier isLayoutRoleOccluded:inAppLayout:](self, "isLayoutRoleOccluded:inAppLayout:", a3, v7);

    if (v9)
      return 1;
    else
      return 2;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    v10 = -[SBFullScreenContinuousExposeSwitcherModifier touchBehaviorForLayoutRole:inAppLayout:](&v12, sel_touchBehaviorForLayoutRole_inAppLayout_, a3, v7);

  }
  return (int64_t)v10;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = -[SBFullScreenContinuousExposeSwitcherModifier appLayoutContainsOnlyResizableApps:](self, "appLayoutContainsOnlyResizableApps:", v5)&& (-[SBFullScreenContinuousExposeSwitcherModifier _continuousExposeStripRevealProgress](self, "_continuousExposeStripRevealProgress"), BSFloatIsZero())&& -[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v5);

  return v6;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
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
  double v19;
  double v20;
  unint64_t v21;
  objc_super v23;

  v6 = a4;
  if (-[SBFullScreenContinuousExposeSwitcherModifier _shouldEnableItemResizeGrabbersForLayoutRole:inAppLayout:](self, "_shouldEnableItemResizeGrabbersForLayoutRole:inAppLayout:", a3, v6))
  {
    objc_msgSend(v6, "itemForLayoutRole:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "autoLayoutItemForDisplayItem:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stageArea");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v9, "position");
    v15 = v14;
    objc_msgSend(v9, "size");
    v17 = v15 - v16 * 0.5;
    objc_msgSend(v9, "position");
    v19 = v18;
    objc_msgSend(v9, "size");
    if (vabdd_f64(v17, v11) <= vabdd_f64(v11 + v13, v19 + v20 * 0.5))
      v21 = 8;
    else
      v21 = 4;

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    v21 = -[SBFullScreenContinuousExposeSwitcherModifier activeCornersForTouchResizeForLayoutRole:inAppLayout:](&v23, sel_activeCornersForTouchResizeForLayoutRole_inAppLayout_, a3, v6);
  }

  return v21;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if (-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6)&& !-[SBFullScreenContinuousExposeSwitcherModifier _isStripRevealedFromHidden](self, "_isStripRevealedFromHidden"))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    v7 = -[SBFullScreenContinuousExposeSwitcherModifier shouldAllowContentViewTouchesForLayoutRole:inAppLayout:](&v9, sel_shouldAllowContentViewTouchesForLayoutRole_inAppLayout_, a3, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  void *v9;
  objc_super v10;

  v6 = a4;
  if (!-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6)|| -[SBFullScreenContinuousExposeSwitcherModifier _isStripRevealedFromHidden](self, "_isStripRevealedFromHidden")|| (v10.receiver = self, v10.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier, -[SBFullScreenContinuousExposeSwitcherModifier isLayoutRoleSelectable:inAppLayout:](&v10, sel_isLayoutRoleSelectable_inAppLayout_, a3, v6)))
  {
    v7 = 1;
  }
  else
  {
    -[SBFullScreenContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBFullScreenContinuousExposeSwitcherModifier isLayoutRoleOccluded:inAppLayout:](self, "isLayoutRoleOccluded:inAppLayout:", a3, v9);

  }
  return v7;
}

- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a4;
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "autoLayoutItemForDisplayItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isFullyOccluded") & 1) != 0 || (objc_msgSend(v9, "isOverlapped") & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v9, "isPartiallyCoveredByPeekingItem");

  return v10;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  return !-[SBAppLayout isOrContainsAppLayout:](self->_fullScreenAppLayout, "isOrContainsAppLayout:", a3);
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return self->_zOrderedLeafAppLayoutsForKeyboardNavigation;
}

- (BOOL)isScrollEnabled
{
  return 0;
}

- (BOOL)shouldScrollViewBlockTouches
{
  return 0;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 1;
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
  return 0;
}

- (double)homeScreenAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBFullScreenContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chamoisSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "blurWallpaperInApps"))
    v4 = 2;
  else
    v4 = 3;

  return v4;
}

- (double)homeScreenBackdropBlurProgress
{
  void *v2;
  void *v3;
  double v4;

  -[SBFullScreenContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chamoisSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "blurWallpaperInApps"))
    v4 = 1.0;
  else
    v4 = 0.0;

  return v4;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (BOOL)isContainerStatusBarVisible
{
  return !-[SBFullScreenContinuousExposeSwitcherModifier _stageContainsFullScreenItem](self, "_stageContainsFullScreenItem");
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  unint64_t v7;
  objc_super v9;

  v6 = a4;
  if (-[SBFullScreenContinuousExposeSwitcherModifier _isStripRevealedFromHidden](self, "_isStripRevealedFromHidden"))
  {
    v7 = 10;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    v7 = -[SBFullScreenContinuousExposeSwitcherModifier hiddenContentStatusBarPartsForLayoutRole:inAppLayout:](&v9, sel_hiddenContentStatusBarPartsForLayoutRole_inAppLayout_, a3, v6);
  }

  return v7;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;

  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_fullScreenAppLayout);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stageArea");
  v6 = v4 + v5;
  -[SBFullScreenContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v8 = v7;
  -[SBFullScreenContinuousExposeSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  v10 = v9;
  -[SBFullScreenContinuousExposeSwitcherModifier floatingDockViewTopMargin](self, "floatingDockViewTopMargin");
  v12 = v8 - (v10 + v11);
  if (!-[SBFullScreenContinuousExposeSwitcherModifier isSoftwareKeyboardVisible](self, "isSoftwareKeyboardVisible"))
  {
    if (v6 > v12)
    {
      v13 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v13 = -[SBFullScreenContinuousExposeSwitcherModifier prefersDockHidden](self, "prefersDockHidden");
    goto LABEL_8;
  }
  v13 = 1;
  if ((-[SBFullScreenContinuousExposeSwitcherModifier isMedusaHostedKeyboardVisible](self, "isMedusaHostedKeyboardVisible") & 1) == 0&& v6 <= v12)
  {
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return !-[SBFullScreenContinuousExposeSwitcherModifier shouldConfigureInAppDockHiddenAssertion](self, "shouldConfigureInAppDockHiddenAssertion");
}

- (double)dockProgress
{
  return 1.0;
}

- (int64_t)dockUpdateMode
{
  return 3;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return !-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", a4);
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v5;

  if (a3 == 4)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  return -[SBFullScreenContinuousExposeSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v5, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, a4);
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v5 = 0.0;
  if (!-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v4))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v6;
  }

  return v5;
}

- (unint64_t)footerViewIconAlignmentForAppLayout:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v4 = a3;
  -[SBFullScreenContinuousExposeSwitcherModifier perspectiveAngleForAppLayout:](self, "perspectiveAngleForAppLayout:", v4);
  if (BSFloatIsZero())
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    v5 = -[SBFullScreenContinuousExposeSwitcherModifier footerViewIconAlignmentForAppLayout:](&v7, sel_footerViewIconAlignmentForAppLayout_, v4);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBFullScreenContinuousExposeSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_fullScreenAppLayout, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFullScreenContinuousExposeSwitcherModifier continuousExposeStripTongueBackdropCaptureLayoutElement](self, "continuousExposeStripTongueBackdropCaptureLayoutElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "removeObject:", self->_fullScreenAppLayout);
    objc_msgSend(v6, "insertObject:atIndex:", v5, 0);
    objc_msgSend(v6, "insertObject:atIndex:", self->_fullScreenAppLayout, 0);

    v4 = v6;
  }

  return v4;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  void *v4;
  char v5;

  if (!objc_msgSend(a3, "isEqual:", self->_fullScreenAppLayout)
    || !-[SBFullScreenContinuousExposeSwitcherModifier _stageContainsFullScreenItem](self, "_stageContainsFullScreenItem")|| !-[SBFullScreenContinuousExposeSwitcherModifier isDisplayEmbedded](self, "isDisplayEmbedded"))
  {
    return 0;
  }
  -[SBFullScreenContinuousExposeSwitcherModifier homeGrabberSettings](self, "homeGrabberSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  return v5;
}

- (id)visibleHomeAffordanceLayoutElements
{
  if (-[SBFullScreenContinuousExposeSwitcherModifier isHomeAffordanceSupportedForAppLayout:](self, "isHomeAffordanceSupportedForAppLayout:", self->_fullScreenAppLayout))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_fullScreenAppLayout);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  -[SBFullScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    v7 = -[SBFullScreenContinuousExposeSwitcherModifier shouldPinLayoutRolesToSpace:](&v9, sel_shouldPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  SBFullScreenContinuousExposeSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBFullScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = !-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](v4, "_isAppLayoutEffectivelyOnStage:", v6);
  return (char)v4;
}

- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3
{
  return 1;
}

- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3
{
  return 10.0;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsContinuousExposeHoverGesture
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  v3 = -[SBFullScreenContinuousExposeSwitcherModifier wantsContinuousExposeHoverGesture](&v5, sel_wantsContinuousExposeHoverGesture);
  return v3 | -[SBFullScreenContinuousExposeSwitcherModifier _wantsContinuousExposeHoverGestureForDismissingStrip](self, "_wantsContinuousExposeHoverGestureForDismissingStrip");
}

- (BOOL)_wantsContinuousExposeHoverGestureForDismissingStrip
{
  -[SBFullScreenContinuousExposeSwitcherModifier _continuousExposeStripRevealProgress](self, "_continuousExposeStripRevealProgress");
  return BSFloatGreaterThanFloat();
}

- (id)handleHoverEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBUpdateContinuousExposeStripsPresentationResponse *v7;
  void *v8;
  SBUpdateLayoutSwitcherEventResponse *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleHoverEvent:](&v11, sel_handleHoverEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBFullScreenContinuousExposeSwitcherModifier _wantsContinuousExposeHoverGestureForDismissingStrip](self, "_wantsContinuousExposeHoverGestureForDismissingStrip"))
  {
    objc_msgSend(v4, "position");
    -[SBFullScreenContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stripWidth");
    if (BSFloatGreaterThanFloat())
    {
      -[SBFullScreenContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
      objc_msgSend(v6, "stripWidth");
      if (BSFloatLessThanFloat())
      {
        v7 = -[SBUpdateContinuousExposeStripsPresentationResponse initWithPresentationOptions:dismissalOptions:]([SBUpdateContinuousExposeStripsPresentationResponse alloc], "initWithPresentationOptions:dismissalOptions:", 0, 1);
        SBAppendSwitcherModifierResponse(v7, v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 12, 3);
        SBAppendSwitcherModifierResponse(v9, v8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  SBPerformTransitionSwitcherEventResponse *v5;
  void *v6;
  SBUpdateContinuousExposeStripsPresentationResponse *v7;
  void *v8;
  SBPerformTransitionSwitcherEventResponse *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v18, sel_handleTapAppLayoutEvent_, v4);
  v5 = (SBPerformTransitionSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();
  if (self->_handlesTapAppLayoutEvents && (objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6))
    {
      if (-[SBFullScreenContinuousExposeSwitcherModifier _isStripRevealedFromHidden](self, "_isStripRevealedFromHidden"))
      {
        v7 = -[SBUpdateContinuousExposeStripsPresentationResponse initWithPresentationOptions:dismissalOptions:]([SBUpdateContinuousExposeStripsPresentationResponse alloc], "initWithPresentationOptions:dismissalOptions:", 0, 1);
        SBAppendSwitcherModifierResponse(v7, v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", self->_fullScreenAppLayout);
        v9 = (SBPerformTransitionSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();
        v5 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v9, 0);
        SBAppendSwitcherModifierResponse(v5, v8);
        v10 = objc_claimAutoreleasedReturnValue();

LABEL_14:
        objc_msgSend(v4, "handleWithReason:", CFSTR("Full Screen Continuous Expose"));

        v5 = (SBPerformTransitionSwitcherEventResponse *)v10;
        goto LABEL_15;
      }
      objc_msgSend(v6, "itemForLayoutRole:", objc_msgSend(v4, "layoutRole"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBFullScreenContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFullScreenContinuousExposeSwitcherModifier appLayoutByBringingItemToFront:inAppLayout:](self, "appLayoutByBringingItemToFront:inAppLayout:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUpdateContinuousExposeStripsPresentationResponse setAppLayout:](v7, "setAppLayout:", v16);

      -[SBUpdateContinuousExposeStripsPresentationResponse setActivatingDisplayItem:](v7, "setActivatingDisplayItem:", v14);
      if (objc_msgSend(v4, "source") == 1)
        -[SBUpdateContinuousExposeStripsPresentationResponse setSource:](v7, "setSource:", 51);

    }
    else
    {
      v7 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBUpdateContinuousExposeStripsPresentationResponse setAppLayout:](v7, "setAppLayout:", v6);
      if ((objc_msgSend(v4, "modifierFlags") & 0x20000) != 0)
        -[SBUpdateContinuousExposeStripsPresentationResponse setEntityInsertionPolicy:](v7, "setEntityInsertionPolicy:", 1);
      objc_msgSend(v6, "continuousExposeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAppLayout continuousExposeIdentifier](self->_fullScreenAppLayout, "continuousExposeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
        -[SBUpdateContinuousExposeStripsPresentationResponse setSource:](v7, "setSource:", 63);
    }
    v9 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v7, 0);
    SBAppendSwitcherModifierResponse(v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (id)handleTapAppLayoutHeaderEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBMutableSwitcherTransitionRequest *v8;
  void *v9;
  SBPerformTransitionSwitcherEventResponse *v10;
  SBPerformTransitionSwitcherEventResponse *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutHeaderEvent:](&v14, sel_handleTapAppLayoutHeaderEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_handlesTapAppLayoutHeaderEvents && (objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemForLayoutRole:", objc_msgSend(v4, "layoutRole"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SBFullScreenContinuousExposeSwitcherModifier displayItemSupportsMultipleWindowsIndicator:](self, "displayItemSupportsMultipleWindowsIndicator:", v7))
    {
      v8 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBSwitcherTransitionRequest setSource:](v8, "setSource:", 3);
      objc_msgSend(v7, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherTransitionRequest setBundleIdentifierForAppExpose:](v8, "setBundleIdentifierForAppExpose:", v9);

      v10 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v8, 0);
    }
    else
    {
      v8 = -[SBPulseDisplayItemSwitcherModifier initWithDisplayItem:]([SBPulseDisplayItemSwitcherModifier alloc], "initWithDisplayItem:", v7);
      v10 = -[SBAddModifierSwitcherEventResponse initWithModifier:level:]([SBAddModifierSwitcherEventResponse alloc], "initWithModifier:level:", v8, 3);
    }
    v11 = v10;
    SBAppendSwitcherModifierResponse(v10, v5);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "handleWithReason:", CFSTR("Full Screen Continuous Expose"));
    v5 = (void *)v12;
  }

  return v5;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  SBPerformTransitionSwitcherEventResponse *v4;
  SBUpdateContinuousExposeStripsPresentationResponse *v5;
  void *v6;
  SBPerformTransitionSwitcherEventResponse *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTapOutsideToDismissEvent:](&v14, sel_handleTapOutsideToDismissEvent_, a3);
  v4 = (SBPerformTransitionSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();
  if (-[SBFullScreenContinuousExposeSwitcherModifier _isStripRevealedFromHidden](self, "_isStripRevealedFromHidden"))
  {
    v5 = -[SBUpdateContinuousExposeStripsPresentationResponse initWithPresentationOptions:dismissalOptions:]([SBUpdateContinuousExposeStripsPresentationResponse alloc], "initWithPresentationOptions:dismissalOptions:", 0, 1);
    SBAppendSwitcherModifierResponse(v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", self->_fullScreenAppLayout);
    v7 = (SBPerformTransitionSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();
    v4 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v7, 0);
    SBAppendSwitcherModifierResponse(v4, v6);
    v8 = objc_claimAutoreleasedReturnValue();

LABEL_5:
    v4 = (SBPerformTransitionSwitcherEventResponse *)v8;
    return v4;
  }
  -[SBFullScreenContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chamoisSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "tapWallpaperToGoHome");

  if (v11)
  {
    +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", v12);
    v5 = (SBUpdateContinuousExposeStripsPresentationResponse *)objc_claimAutoreleasedReturnValue();

    v7 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v5, 0);
    SBAppendSwitcherModifierResponse(v7, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *zOrderedLeafAppLayoutsForKeyboardNavigation;
  id v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  char v22;
  SBUpdateContinuousExposeStripsPresentationResponse *v23;
  uint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v34, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 2)
  {
    objc_msgSend(v7, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") <= 2)
    {

    }
    else
    {
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if (v9)
      {
        if (objc_msgSend(v4, "isKeyboardShortcutInitiated"))
        {
          objc_msgSend(v4, "fromDisplayItemLayoutAttributesMap");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "toDisplayItemLayoutAttributesMap");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v10;
          __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke((uint64_t)v11, v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke((uint64_t)v12, v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lastObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "isEqual:", v15) & 1) != 0)
          {

LABEL_12:
            goto LABEL_15;
          }
          v29 = v11;
          v30 = v15;
          v26 = v13;
          v28 = v12;
          zOrderedLeafAppLayoutsForKeyboardNavigation = self->_zOrderedLeafAppLayoutsForKeyboardNavigation;
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke_3;
          v32[3] = &unk_1E8EA4510;
          v17 = v14;
          v33 = v17;
          v18 = -[NSArray indexOfObjectPassingTest:](zOrderedLeafAppLayoutsForKeyboardNavigation, "indexOfObjectPassingTest:", v32);
          v19 = (v18 + 1) % -[NSArray count](self->_zOrderedLeafAppLayoutsForKeyboardNavigation, "count");
          if (v18 <= 0)
            v18 = -[NSArray count](self->_zOrderedLeafAppLayoutsForKeyboardNavigation, "count", v26, v12, v11);
          -[NSArray objectAtIndex:](self->_zOrderedLeafAppLayoutsForKeyboardNavigation, "objectAtIndex:", v19, v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "containsItem:", v30) & 1) != 0)
          {

            goto LABEL_12;
          }
          -[NSArray objectAtIndex:](self->_zOrderedLeafAppLayoutsForKeyboardNavigation, "objectAtIndex:", v18 - 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "containsItem:", v30);

          if ((v22 & 1) != 0)
            goto LABEL_15;
        }
        -[SBFullScreenContinuousExposeSwitcherModifier _resetKeyboardNavigationZOrder](self, "_resetKeyboardNavigationZOrder");
      }
    }
  }
LABEL_15:
  if (objc_msgSend(v4, "phase") == 2 && objc_msgSend(v4, "toEnvironmentMode") != 3)
  {
    v23 = -[SBUpdateContinuousExposeStripsPresentationResponse initWithPresentationOptions:dismissalOptions:]([SBUpdateContinuousExposeStripsPresentationResponse alloc], "initWithPresentationOptions:dismissalOptions:", 0, 1);
    SBAppendSwitcherModifierResponse(v23, v5);
    v24 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v24;
  }

  return v5;
}

id __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke_2;
  v7[3] = &unk_1E8EAC3F0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lastInteractionTime");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "lastInteractionTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  return v13;
}

uint64_t __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

- (id)handlePointerCrossedDisplayBoundaryEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handlePointerCrossedDisplayBoundaryEvent:](&v11, sel_handlePointerCrossedDisplayBoundaryEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "edge");
  if (v6 == -[SBFullScreenContinuousExposeSwitcherModifier _continuousExposeStripEdge](self, "_continuousExposeStripEdge"))
  {
    -[SBFullScreenContinuousExposeSwitcherModifier continuousExposeStripProgress](self, "continuousExposeStripProgress");
    if (BSFloatIsZero())
    {
      if (objc_msgSend(v4, "direction") == 1)
      {
        v7 = 1;
LABEL_7:
        v8 = -[SBPresentContinuousExposeStripEdgeProtectGrabberEventResponse initForInitialPresentation:]([SBPresentContinuousExposeStripEdgeProtectGrabberEventResponse alloc], "initForInitialPresentation:", v7);
        SBAppendSwitcherModifierResponse(v8, v5);
        v9 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v9;
        goto LABEL_8;
      }
      if (!objc_msgSend(v4, "direction"))
      {
        v7 = 0;
        goto LABEL_7;
      }
    }
  }
LABEL_8:

  return v5;
}

- (BOOL)_isStripStashed
{
  void *v3;
  void *v4;

  -[SBFullScreenContinuousExposeSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isStripVisible") ^ 1;
  return (char)v3;
}

- (BOOL)_shouldEnableItemResizeGrabbersForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  _BOOL4 v7;

  v6 = a4;
  -[SBFullScreenContinuousExposeSwitcherModifier _continuousExposeStripRevealProgress](self, "_continuousExposeStripRevealProgress");
  if (((BSFloatIsZero() & 1) != 0
     || !-[SBFullScreenContinuousExposeSwitcherModifier _isStripStashed](self, "_isStripStashed"))
    && -[SBFullScreenContinuousExposeSwitcherModifier isDisplayEmbedded](self, "isDisplayEmbedded")
    && -[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6)&& -[SBFullScreenContinuousExposeSwitcherModifier appLayoutContainsOnlyResizableApps:](self, "appLayoutContainsOnlyResizableApps:", v6)&& SBLayoutRoleIsValidForSplitView(a3))
  {
    v7 = !-[SBFullScreenContinuousExposeSwitcherModifier isLayoutRoleOccluded:inAppLayout:](self, "isLayoutRoleOccluded:inAppLayout:", a3, v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_isAppLayoutEffectivelyOnStage:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[SBAppLayout containsAllItemsFromAppLayout:](self->_fullScreenAppLayout, "containsAllItemsFromAppLayout:", v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "containsAllItemsFromAppLayout:", self->_fullScreenAppLayout);

  return v5;
}

- (BOOL)_stageContainsFullScreenItem
{
  return -[SBSwitcherModifier appLayoutContainsFullScreenDisplayItem:](self, "appLayoutContainsFullScreenDisplayItem:", self->_fullScreenAppLayout);
}

- (BOOL)_isStripRevealedFromHidden
{
  int v3;

  if (-[SBFullScreenContinuousExposeSwitcherModifier _isStripStashed](self, "_isStripStashed")
    || (v3 = -[SBFullScreenContinuousExposeSwitcherModifier prefersStripHidden](self, "prefersStripHidden")) != 0)
  {
    -[SBFullScreenContinuousExposeSwitcherModifier _continuousExposeStripRevealProgress](self, "_continuousExposeStripRevealProgress");
    LOBYTE(v3) = BSFloatGreaterThanFloat();
  }
  return v3;
}

- (unsigned)_continuousExposeStripEdge
{
  return 2 * (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1);
}

- (void)_resetKeyboardNavigationZOrder
{
  NSArray *v3;
  NSArray *zOrderedLeafAppLayoutsForKeyboardNavigation;

  -[SBAppLayout zOrderedLeafAppLayouts](self->_fullScreenAppLayout, "zOrderedLeafAppLayouts");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  zOrderedLeafAppLayoutsForKeyboardNavigation = self->_zOrderedLeafAppLayoutsForKeyboardNavigation;
  self->_zOrderedLeafAppLayoutsForKeyboardNavigation = v3;

}

- (SBAppLayout)fullScreenAppLayout
{
  return self->_fullScreenAppLayout;
}

- (BOOL)handlesTapAppLayoutEvents
{
  return self->_handlesTapAppLayoutEvents;
}

- (void)setHandlesTapAppLayoutEvents:(BOOL)a3
{
  self->_handlesTapAppLayoutEvents = a3;
}

- (BOOL)handlesTapAppLayoutHeaderEvents
{
  return self->_handlesTapAppLayoutHeaderEvents;
}

- (void)setHandlesTapAppLayoutHeaderEvents:(BOOL)a3
{
  self->_handlesTapAppLayoutHeaderEvents = a3;
}

- (BOOL)isContinuousExposeConfigurationChangeTransition
{
  return self->_continuousExposeConfigurationChangeTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_zOrderedLeafAppLayoutsForKeyboardNavigation, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayoutModifier, 0);
  objc_storeStrong((id *)&self->_stripModifier, 0);
}

@end
