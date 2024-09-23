@implementation SBSplitViewRootSwitcherModifier

- (SBSplitViewRootSwitcherModifier)init
{
  SBSplitViewRootSwitcherModifier *v2;
  SBFullScreenFluidSwitcherRootSwitcherModifier *v3;
  SBSwitcherModifier *fullScreenModifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSplitViewRootSwitcherModifier;
  v2 = -[SBSwitcherModifier init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBFullScreenFluidSwitcherRootSwitcherModifier);
    fullScreenModifier = v2->_fullScreenModifier;
    v2->_fullScreenModifier = &v3->super.super;

    -[SBChainableModifier addChildModifier:](v2, "addChildModifier:", v2->_fullScreenModifier);
  }
  return v2;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v8;
  SBSwitcherModifier *v9;
  void *v10;
  SBSwitcherModifier *fullScreenModifier;
  void *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSplitViewRootSwitcherModifier;
  v9 = (SBSwitcherModifier *)a4;
  -[SBChainableModifier responseForProposedChildResponse:childModifier:event:](&v14, sel_responseForProposedChildResponse_childModifier_event_, a3, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fullScreenModifier = self->_fullScreenModifier;

  if (fullScreenModifier == v9)
  {
    -[SBSplitViewRootSwitcherModifier _routingModifierForEvent:](self, "_routingModifierForEvent:", v8, v14.receiver, v14.super_class);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {

      v10 = 0;
    }
  }

  return v10;
}

- (id)handleEvent:(id)a3
{
  id v4;
  SBSwitcherModifier *routingModifier;
  SBSplitViewRootSwitcherModifier *v6;
  _BOOL4 v7;
  SBSwitcherModifier *v8;
  SBSplitViewRootSwitcherModifier *v9;
  _BOOL4 v10;
  id v11;
  unint64_t v12;
  SBGestureSwitcherModifier *v13;
  void *v14;
  SBGestureSwitcherModifier *v15;
  SBGestureSwitcherModifier *gestureTrackingModifier;
  SBGestureSwitcherModifier *v17;
  id v18;
  SBTransitionSwitcherModifier *v19;
  void *v20;
  SBTransitionSwitcherModifier *v21;
  SBTransitionSwitcherModifier *transitionTrackingModifier;
  BOOL v23;
  SBGestureSwitcherModifier *v24;
  uint64_t v25;
  SBTransitionSwitcherModifier *v26;
  void *v27;
  SBGestureSwitcherModifier *v28;
  SBTransitionSwitcherModifier *v29;
  SBTimerEventSwitcherEventResponse *v30;
  uint64_t v31;
  SBGestureSwitcherModifier *v32;
  SBTransitionSwitcherModifier *v33;
  uint64_t v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  _QWORD v40[5];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  objc_super v47;

  v4 = a3;
  routingModifier = self->_routingModifier;
  if (routingModifier)
  {
    -[SBChainableModifier parentModifier](routingModifier, "parentModifier");
    v6 = (SBSplitViewRootSwitcherModifier *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == self;

  }
  else
  {
    v7 = 0;
  }
  v47.receiver = self;
  v47.super_class = (Class)SBSplitViewRootSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v47, sel_handleEvent_, v4);
  v35 = objc_claimAutoreleasedReturnValue();
  v8 = self->_routingModifier;
  if (v8)
  {
    -[SBChainableModifier parentModifier](v8, "parentModifier");
    v9 = (SBSplitViewRootSwitcherModifier *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == self;

  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v4, "isGestureEvent", v35))
  {
    v11 = v4;
    v12 = objc_msgSend(v11, "type");
    if (v12 <= 5 && ((1 << v12) & 0x2C) != 0)
    {
      if (!objc_msgSend(v11, "phase"))
      {
        v13 = [SBGestureSwitcherModifier alloc];
        objc_msgSend(v11, "gestureID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[SBGestureSwitcherModifier initWithGestureID:](v13, "initWithGestureID:", v14);
        gestureTrackingModifier = self->_gestureTrackingModifier;
        self->_gestureTrackingModifier = v15;

      }
      if (v7 && !v10)
        self->_stoppedRoutingDueToArcSwipe = 1;
    }
    else
    {
      v17 = self->_gestureTrackingModifier;
      self->_gestureTrackingModifier = 0;

    }
  }
  if (objc_msgSend(v4, "isTransitionEvent"))
  {
    v18 = v4;
    if (objc_msgSend(v18, "phase") == 1)
    {
      v19 = [SBTransitionSwitcherModifier alloc];
      objc_msgSend(v18, "transitionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SBTransitionSwitcherModifier initWithTransitionID:](v19, "initWithTransitionID:", v20);
      transitionTrackingModifier = self->_transitionTrackingModifier;
      self->_transitionTrackingModifier = v21;

    }
  }
  v23 = v10;
  v24 = self->_gestureTrackingModifier;
  v25 = MEMORY[0x1E0C809B0];
  if (v24)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __47__SBSplitViewRootSwitcherModifier_handleEvent___block_invoke;
    v40[3] = &unk_1E8EA4CE8;
    v40[4] = self;
    v41 = v4;
    v42 = &v43;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v24, v40);
    -[SBChainableModifier setState:](self->_gestureTrackingModifier, "setState:", v44[3]);

    _Block_object_dispose(&v43, 8);
  }
  v26 = self->_transitionTrackingModifier;
  if (v26)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v37[0] = v25;
    v37[1] = 3221225472;
    v37[2] = __47__SBSplitViewRootSwitcherModifier_handleEvent___block_invoke_2;
    v37[3] = &unk_1E8EA4CE8;
    v37[4] = self;
    v38 = v4;
    v39 = &v43;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v26, v37);
    -[SBChainableModifier setState:](self->_transitionTrackingModifier, "setState:", v44[3]);

    _Block_object_dispose(&v43, 8);
  }
  if (-[SBGestureSwitcherModifier gesturePhase](self->_gestureTrackingModifier, "gesturePhase") == 3
    && -[SBChainableModifier state](self->_gestureTrackingModifier, "state") <= 0)
  {
    -[SBChainableModifier setState:](self->_gestureTrackingModifier, "setState:", 1);
  }
  v27 = v36;
  if (!v23 && self->_stoppedRoutingDueToArcSwipe)
  {
    v28 = self->_gestureTrackingModifier;
    if (!v28 || -[SBChainableModifier state](v28, "state") == 1)
    {
      v29 = self->_transitionTrackingModifier;
      if (!v29 || -[SBChainableModifier state](v29, "state") == 1)
      {
        v30 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("SBSplitViewRootSwitcherModifierTimerEventReason"), 0.4);
        SBAppendSwitcherModifierResponse(v30, v36);
        v31 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v31;
      }
    }
  }
  if (-[SBChainableModifier state](self->_gestureTrackingModifier, "state") == 1)
  {
    v32 = self->_gestureTrackingModifier;
    self->_gestureTrackingModifier = 0;

  }
  if (-[SBChainableModifier state](self->_transitionTrackingModifier, "state") == 1)
  {
    v33 = self->_transitionTrackingModifier;
    self->_transitionTrackingModifier = 0;

  }
  return v27;
}

uint64_t __47__SBSplitViewRootSwitcherModifier_handleEvent___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t result;

  v2 = (id)objc_msgSend(*(id *)(a1[4] + 112), "handleEvent:", a1[5]);
  result = objc_msgSend(*(id *)(a1[4] + 112), "state");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __47__SBSplitViewRootSwitcherModifier_handleEvent___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t result;

  v2 = (id)objc_msgSend(*(id *)(a1[4] + 120), "handleEvent:", a1[5]);
  result = objc_msgSend(*(id *)(a1[4] + 120), "state");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBSwitcherModifier **p_routingModifier;
  SBSwitcherModifier *routingModifier;
  void *v9;
  SBSwitcherModifier *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  SBSwitcherModifier *fullScreenModifier;
  _QWORD v19[5];
  id v20;
  objc_super v21;

  v4 = a3;
  -[SBChainableModifier parentModifier](self->_fullScreenModifier, "parentModifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)SBSplitViewRootSwitcherModifier;
  -[SBSwitcherModifier _handleEvent:](&v21, sel__handleEvent_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_routingModifier = &self->_routingModifier;
  routingModifier = self->_routingModifier;
  if (!routingModifier)
    goto LABEL_5;
  -[SBChainableModifier parentModifier](routingModifier, "parentModifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SBChainableModifier setState:](self->_fullScreenModifier, "setState:", 0);
    -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_fullScreenModifier);
    v10 = *p_routingModifier;
    *p_routingModifier = 0;

  }
  if (!*p_routingModifier)
  {
LABEL_5:
    -[SBSplitViewRootSwitcherModifier _routingModifierForEvent:](self, "_routingModifierForEvent:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_storeStrong((id *)&self->_routingModifier, v11);
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", *p_routingModifier);
      -[SBChainableModifier parentModifier](self->_fullScreenModifier, "parentModifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", self->_fullScreenModifier);
      if (objc_msgSend(v4, "isTransitionEvent"))
      {
        objc_msgSend(v4, "unhandledCopy");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fromAppLayout");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setToAppLayout:", v14);

        objc_msgSend(v13, "setToEnvironmentMode:", objc_msgSend(v13, "fromEnvironmentMode"));
        objc_msgSend(v13, "setPhase:", 3);
        objc_msgSend(v13, "setAnimated:", 0);
        v15 = -[SBChainableModifier handleEvent:](*p_routingModifier, "handleEvent:", v13);

      }
      -[SBChainableModifier setState:](*p_routingModifier, "setState:", 0);
    }

  }
  if (!v5)
  {
    -[SBChainableModifier parentModifier](self->_fullScreenModifier, "parentModifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      fullScreenModifier = self->_fullScreenModifier;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __48__SBSplitViewRootSwitcherModifier__handleEvent___block_invoke;
      v19[3] = &unk_1E8E9E820;
      v19[4] = self;
      v20 = v4;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fullScreenModifier, v19);

    }
  }

  return v6;
}

id __48__SBSplitViewRootSwitcherModifier__handleEvent___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "_handleEvent:", *(_QWORD *)(a1 + 40));
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSplitViewRootSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("SBSplitViewRootSwitcherModifierTimerEventReason"));
  if ((_DWORD)v4)
  {
    self->_stoppedRoutingDueToArcSwipe = 0;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 16, 3);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)visibleHomeAffordanceLayoutElements
{
  void *v2;
  objc_super v4;

  if (self->_stoppedRoutingDueToArcSwipe)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBSplitViewRootSwitcherModifier;
    -[SBSplitViewRootSwitcherModifier visibleHomeAffordanceLayoutElements](&v4, sel_visibleHomeAffordanceLayoutElements);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_routingModifierForEvent:(id)a3
{
  return +[SBPeekSplitViewRoutingSwitcherModifier modifierForEvent:](SBPeekSplitViewRoutingSwitcherModifier, "modifierForEvent:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTrackingModifier, 0);
  objc_storeStrong((id *)&self->_gestureTrackingModifier, 0);
  objc_storeStrong((id *)&self->_routingModifier, 0);
  objc_storeStrong((id *)&self->_fullScreenModifier, 0);
}

@end
