@implementation SBHomeScreenContinuousExposeSwitcherModifier

- (SBHomeScreenContinuousExposeSwitcherModifier)init
{
  SBHomeScreenContinuousExposeSwitcherModifier *v2;
  SBHomeScreenSwitcherModifier *v3;
  SBHomeScreenSwitcherModifier *homeScreenModifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenContinuousExposeSwitcherModifier;
  v2 = -[SBSwitcherModifier init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBHomeScreenSwitcherModifier);
    homeScreenModifier = v2->_homeScreenModifier;
    v2->_homeScreenModifier = v3;

    -[SBChainableModifier addChildModifier:](v2, "addChildModifier:", v2->_homeScreenModifier);
  }
  return v2;
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
  v5 = -[SBHomeScreenContinuousExposeSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled");
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

    -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_stripModifier);
  }
  v12.receiver = self;
  v12.super_class = (Class)SBHomeScreenContinuousExposeSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v12, sel_handleEvent_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  SBHomeScreenContinuousExposeSwitcherModifier *v15;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBHomeScreenContinuousExposeSwitcherModifier;
  -[SBChainableModifier responseForProposedChildResponse:childModifier:event:](&v16, sel_responseForProposedChildResponse_childModifier_event_, a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "type") == 1)
  {
    v10 = v8;
    if (SBPeekConfigurationIsValid(objc_msgSend(v10, "fromPeekConfiguration"))
      && !SBPeekConfigurationIsValid(objc_msgSend(v10, "toPeekConfiguration")))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __101__SBHomeScreenContinuousExposeSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
      v13[3] = &unk_1E8EA6068;
      v14 = v10;
      v15 = self;
      objc_msgSend(v9, "responseByTransformingResponseWithTransformer:", v13);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }

  }
  return v9;
}

SBAddModifierSwitcherEventResponse *__101__SBHomeScreenContinuousExposeSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  SBAddModifierSwitcherEventResponse *v5;
  SBAddModifierSwitcherEventResponse *v6;
  SBAddModifierSwitcherEventResponse *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SBContinuousExposeAppToAppModifier *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  SBContinuousExposeAppToAppModifier *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  SBFullScreenToHomeIconZoomSwitcherModifier *v32;
  void *v33;
  SBContinuousExposeAppToAppModifier *v35;
  _QWORD v36[4];
  id v37;

  v3 = a2;
  v4 = objc_msgSend(v3, "type");
  v5 = (SBAddModifierSwitcherEventResponse *)v3;
  v6 = v5;
  v7 = v5;
  if (v4 == 31)
  {
    -[SBAddModifierSwitcherEventResponse modifier](v5, "modifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SBAddModifierSwitcherEventResponse modifier](v6, "modifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __101__SBHomeScreenContinuousExposeSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_2;
      v36[3] = &unk_1E8E9DF50;
      v37 = *(id *)(a1 + 32);
      objc_msgSend(v11, "appLayoutWithItemsPassingTest:", v36);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && !objc_msgSend(*(id *)(a1 + 32), "isIconZoomDisabled"))
      {
        objc_msgSend(*(id *)(a1 + 40), "homeScreenIconFrameForAppLayout:", v12);
      }
      else
      {
        v13 = *MEMORY[0x1E0C9D628];
        v14 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
        v15 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
        v16 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
      }
      if (CGRectIsNull(*(CGRect *)&v13))
      {
        v35 = [SBContinuousExposeAppToAppModifier alloc];
        objc_msgSend(v10, "transitionID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "fromAppLayout");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(*(id *)(a1 + 32), "fromInterfaceOrientation");
        objc_msgSend(*(id *)(a1 + 32), "toAppLayout");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(*(id *)(a1 + 32), "toInterfaceOrientation");
        objc_msgSend(*(id *)(a1 + 32), "fromDisplayItemLayoutAttributesMap");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "toDisplayItemLayoutAttributesMap");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[SBContinuousExposeAppToAppModifier initWithTransitionID:fromAppLayout:fromInterfaceOrientation:toAppLayout:toInterfaceOrientation:fromDisplayItemLayoutAttributesMap:toDisplayItemLayoutAttributesMap:](v35, "initWithTransitionID:fromAppLayout:fromInterfaceOrientation:toAppLayout:toInterfaceOrientation:fromDisplayItemLayoutAttributesMap:toDisplayItemLayoutAttributesMap:", v25, v26, v27, v28, v29, v30, v31);

      }
      else
      {
        v32 = [SBFullScreenToHomeIconZoomSwitcherModifier alloc];
        objc_msgSend(v10, "transitionID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:appLayout:direction:](v32, "initWithTransitionID:appLayout:direction:", v33, v12, 0);

        -[SBContinuousExposeAppToAppModifier setShouldForceDefaultAnchorPointForTransition:](v24, "setShouldForceDefaultAnchorPointForTransition:", 1);
        -[SBContinuousExposeAppToAppModifier setShouldDockOrderFrontDuringTransition:](v24, "setShouldDockOrderFrontDuringTransition:", 1);
        objc_msgSend(*(id *)(a1 + 40), "homeScreenIconLocationForAppLayout:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBContinuousExposeAppToAppModifier setShouldUpdateIconViewVisibility:](v24, "setShouldUpdateIconViewVisibility:", SBIconLocationGroupContainsLocation() ^ 1);
      }

      v18 = v37;
    }
    else
    {
      v17 = [SBContinuousExposeAppToAppModifier alloc];
      objc_msgSend(*(id *)(a1 + 32), "transitionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fromAppLayout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(*(id *)(a1 + 32), "fromInterfaceOrientation");
      objc_msgSend(*(id *)(a1 + 32), "toAppLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(*(id *)(a1 + 32), "toInterfaceOrientation");
      objc_msgSend(*(id *)(a1 + 32), "fromDisplayItemLayoutAttributesMap");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "toDisplayItemLayoutAttributesMap");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SBContinuousExposeAppToAppModifier initWithTransitionID:fromAppLayout:fromInterfaceOrientation:toAppLayout:toInterfaceOrientation:fromDisplayItemLayoutAttributesMap:toDisplayItemLayoutAttributesMap:](v17, "initWithTransitionID:fromAppLayout:fromInterfaceOrientation:toAppLayout:toInterfaceOrientation:fromDisplayItemLayoutAttributesMap:toDisplayItemLayoutAttributesMap:", v10, v18, v19, v20, v21, v22, v23);

    }
    v7 = -[SBAddModifierSwitcherEventResponse initWithModifier:level:]([SBAddModifierSwitcherEventResponse alloc], "initWithModifier:level:", v24, 3);

  }
  return v7;
}

uint64_t __101__SBHomeScreenContinuousExposeSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "fromAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsItem:", v3);

  return v5 ^ 1u;
}

- (double)continuousExposeStripProgress
{
  return 0.0;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
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
  objc_super v32;
  CGRect result;

  -[SBHomeScreenContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenContinuousExposeSwitcherModifier displayItemLayoutAttributesCalculator](self, "displayItemLayoutAttributesCalculator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBHomeScreenContinuousExposeSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBHomeScreenContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenContinuousExposeSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  v12 = v11;
  -[SBHomeScreenContinuousExposeSwitcherModifier screenScale](self, "screenScale");
  v14 = v13;
  -[SBHomeScreenContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
  objc_msgSend(v7, "autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:", v8, v9, v10, -[SBHomeScreenContinuousExposeSwitcherModifier prefersStripHidden](self, "prefersStripHidden"), -[SBHomeScreenContinuousExposeSwitcherModifier prefersDockHidden](self, "prefersDockHidden"), v12, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "boundingBox");
  v21 = v20;
  v23 = v22;
  v32.receiver = self;
  v32.super_class = (Class)SBHomeScreenContinuousExposeSwitcherModifier;
  -[SBHomeScreenContinuousExposeSwitcherModifier frameForIndex:](&v32, sel_frameForIndex_, a3);
  UIRectGetCenter();
  v25 = v24 - v21 * 0.5;
  v27 = v26 - v23 * 0.5;

  v28 = v25;
  v29 = v27;
  v30 = v21;
  v31 = v23;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (BOOL)isContainerStatusBarVisible
{
  return 1;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenModifier, 0);
  objc_storeStrong((id *)&self->_stripModifier, 0);
}

@end
