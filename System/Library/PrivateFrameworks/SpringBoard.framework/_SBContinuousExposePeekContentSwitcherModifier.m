@implementation _SBContinuousExposePeekContentSwitcherModifier

- (_SBContinuousExposePeekContentSwitcherModifier)initWithAppLayout:(id)a3 configuration:(int64_t)a4
{
  id v8;
  _SBContinuousExposePeekContentSwitcherModifier *v9;
  SBFullScreenContinuousExposeSwitcherModifier *v10;
  SBFullScreenContinuousExposeSwitcherModifier *fullScreenContinuousExposeAppLayoutModifier;
  SBAppSwitcherContinuousExposeSwitcherModifier *v12;
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
  void *v15;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
  v9 = -[SBSwitcherModifier init](&v16, sel_init);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBContinuousExposePeekSwitcherModifier.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    objc_storeStrong((id *)&v9->_appLayout, a3);
    v9->_configuration = a4;
    v10 = -[SBFullScreenContinuousExposeSwitcherModifier initWithFullScreenAppLayout:]([SBFullScreenContinuousExposeSwitcherModifier alloc], "initWithFullScreenAppLayout:", v9->_appLayout);
    fullScreenContinuousExposeAppLayoutModifier = v9->_fullScreenContinuousExposeAppLayoutModifier;
    v9->_fullScreenContinuousExposeAppLayoutModifier = v10;

    -[SBFullScreenContinuousExposeSwitcherModifier setHandlesTapAppLayoutEvents:](v9->_fullScreenContinuousExposeAppLayoutModifier, "setHandlesTapAppLayoutEvents:", 0);
    -[SBFullScreenContinuousExposeSwitcherModifier setHandlesTapAppLayoutHeaderEvents:](v9->_fullScreenContinuousExposeAppLayoutModifier, "setHandlesTapAppLayoutHeaderEvents:", 0);
    -[SBChainableModifier addChildModifier:atLevel:key:](v9, "addChildModifier:atLevel:key:", v9->_fullScreenContinuousExposeAppLayoutModifier, 0, 0);
    v12 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
    appSwitcherModifier = v9->_appSwitcherModifier;
    v9->_appSwitcherModifier = v12;

    -[SBAppSwitcherContinuousExposeSwitcherModifier setHandlesTapAppLayoutEvents:](v9->_appSwitcherModifier, "setHandlesTapAppLayoutEvents:", 0);
    -[SBAppSwitcherContinuousExposeSwitcherModifier setHandlesTapAppLayoutHeaderEvents:](v9->_appSwitcherModifier, "setHandlesTapAppLayoutHeaderEvents:", 0);
    -[SBChainableModifier addChildModifier:atLevel:key:](v9, "addChildModifier:atLevel:key:", v9->_appSwitcherModifier, 1, 0);
  }

  return v9;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
  -[_SBContinuousExposePeekContentSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v12, sel_adjustedAppLayoutsForAppLayouts_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82___SBContinuousExposePeekContentSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v11[3] = &unk_1E8E9DF78;
  v11[4] = self;
  objc_msgSend(v4, "bs_filter:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __82___SBContinuousExposePeekContentSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2;
  v10[3] = &unk_1E8E9DF78;
  v10[4] = self;
  objc_msgSend(v4, "bs_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
  -[_SBContinuousExposePeekContentSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v29, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (objc_msgSend(v11, "isEqual:", self->_appLayout))
  {
    objc_msgSend(v11, "itemForLayoutRole:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModifier frameForContinuousExposePeekingDisplayItem:inAppLayout:bounds:defaultFrameForLayoutRole:](self, "frameForContinuousExposePeekingDisplayItem:inAppLayout:bounds:defaultFrameForLayoutRole:", v20, v11, x, y, width, height, v13, v15, v17, v19);
    v13 = v21;
    v15 = v22;
    v17 = v23;
    v19 = v24;

  }
  v25 = v13;
  v26 = v15;
  v27 = v17;
  v28 = v19;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  objc_super v10;

  v6 = a4;
  v7 = 1.0;
  if ((objc_msgSend(v6, "isEqual:", self->_appLayout) & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
    -[_SBContinuousExposePeekContentSwitcherModifier scaleForLayoutRole:inAppLayout:](&v10, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
    v7 = v8;
  }

  return v7;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if ((objc_msgSend(v6, "isEqual:", self->_appLayout) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
    v7 = -[_SBContinuousExposePeekContentSwitcherModifier shouldAllowContentViewTouchesForLayoutRole:inAppLayout:](&v9, sel_shouldAllowContentViewTouchesForLayoutRole_inAppLayout_, a3, v6);
  }

  return v7;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 0;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBPerformTransitionSwitcherEventResponse *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v10, sel_handleTapAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4, v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPeekConfiguration:", 1);
  objc_msgSend(v6, "setRetainsSiri:", -[_SBContinuousExposePeekContentSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
  v7 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v6, 0);
  SBAppendSwitcherModifierResponse(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "handleWithReason:", CFSTR("Exiting out of peek"));
  return v8;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  SBFullScreenContinuousExposeSwitcherModifier *v8;
  id v9;
  void *v10;
  objc_super v12;

  v8 = (SBFullScreenContinuousExposeSwitcherModifier *)a4;
  v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
  -[SBChainableModifier responseForProposedChildResponse:childModifier:event:](&v12, sel_responseForProposedChildResponse_childModifier_event_, a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_fullScreenContinuousExposeAppLayoutModifier == v8 && objc_msgSend(v9, "type") == 17
    || (SBFullScreenContinuousExposeSwitcherModifier *)self->_appSwitcherModifier == v8)
  {

    v10 = 0;
  }

  return v10;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes](SBSwitcherKeyboardSuppressionMode, "suppressionModeForAllScenes");
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_appSwitcherModifier, 0);
  objc_storeStrong((id *)&self->_fullScreenContinuousExposeAppLayoutModifier, 0);
}

@end
