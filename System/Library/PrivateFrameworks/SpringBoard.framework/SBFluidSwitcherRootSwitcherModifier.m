@implementation SBFluidSwitcherRootSwitcherModifier

void __81__SBFluidSwitcherRootSwitcherModifier_verifyInternalIntegrityAfterHandlingEvent___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "state") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("SBFluidSwitcherRootSwitcherModifier.m"), 420, CFSTR("Failed modifier stack coherency check. %@ is Complete after handling event: %@."), v8, a1[5]);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = *(_QWORD *)(a1[6] + 8);
    if (*(_BYTE *)(v3 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("SBFluidSwitcherRootSwitcherModifier.m"), 424, CFSTR("Failed modifier stack coherency check. Should have at most one gesture modifier after handling event: %@"), a1[5]);

      v3 = *(_QWORD *)(a1[6] + 8);
    }
    *(_BYTE *)(v3 + 24) = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1[7] + 8);
    if (*(_BYTE *)(v4 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("SBFluidSwitcherRootSwitcherModifier.m"), 430, CFSTR("Failed modifier stack coherency check. Should have at most one transition modifier after handling event: %@"), a1[5]);

      v4 = *(_QWORD *)(a1[7] + 8);
    }
    *(_BYTE *)(v4 + 24) = 1;
  }

}

- (void)verifyInternalIntegrityAfterHandlingEvent:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  SEL v16;
  _QWORD v17[3];
  char v18;
  _QWORD v19[3];
  char v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBChainableModifier verifyInternalIntegrityAfterHandlingEvent:](&v21, sel_verifyInternalIntegrityAfterHandlingEvent_, v5);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__SBFluidSwitcherRootSwitcherModifier_verifyInternalIntegrityAfterHandlingEvent___block_invoke;
  v12[3] = &unk_1E8EAFA68;
  v16 = a2;
  v12[4] = self;
  v6 = v5;
  v13 = v6;
  v14 = v19;
  v15 = v17;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v12);
  if (objc_msgSend(v6, "type") == 14)
  {
    v7 = v6;
    objc_msgSend(v7, "appLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherRootSwitcherModifier _swipeToKillModifierKeyForAppLayout:](self, "_swipeToKillModifierKeyForAppLayout:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherRootSwitcherModifier.m"), 439, CFSTR("Failed modifier stack coherency check. Should not have a swipe to kill modifier for this app layout at this point."));

    }
  }

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

- (id)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier _handleEvent:](&v7, sel__handleEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherRootSwitcherModifier _updateTransientlyVisibleSlideOverTongueModifierWithEvent:](self, "_updateTransientlyVisibleSlideOverTongueModifierWithEvent:", v4, v7.receiver, v7.super_class);

  return v5;
}

- (void)_updateTransientlyVisibleSlideOverTongueModifierWithEvent:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SBFluidSwitcherRootSwitcherModifier transientlyVisibleSlideOverTongueModifierForEvent:](self, "transientlyVisibleSlideOverTongueModifierForEvent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("Fluid Switcher Transiently Visible Slide Over Tongue Modifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v5);
    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v4, 3, CFSTR("Fluid Switcher Transiently Visible Slide Over Tongue Modifier"));
    SBLogAppSwitcher();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "succinctDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "[%@] Updated transiently visible slide over tongue modifier to %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (id)transientlyVisibleSlideOverTongueModifierForEvent:(id)a3
{
  return 0;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  SBConsumedPreludeAnimationTokenSwitcherEventResponse *v18;
  uint64_t v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v21, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherRootSwitcherModifier _updateMultitaskingModifierWithEvent:](self, "_updateMultitaskingModifierWithEvent:", v4);
  v6 = objc_msgSend(v4, "phase");
  if (v6 >= 2)
  {
    if (v6 != 2 && (objc_msgSend(v4, "isAnimated") & 1) != 0)
      goto LABEL_9;
LABEL_8:
    -[SBFluidSwitcherRootSwitcherModifier _updateFloorModifierWithTransitionEvent:](self, "_updateFloorModifierWithTransitionEvent:", v4);
    goto LABEL_9;
  }
  if (v6 == 1
    && ((objc_msgSend(v4, "isDragAndDropTransition") & 1) != 0
     || objc_msgSend(v4, "isAnySplitViewToOrFromSlideOverEvent")))
  {
    goto LABEL_8;
  }
LABEL_9:
  if (objc_msgSend(v4, "phase") == 2 || (objc_msgSend(v4, "isAnimated") & 1) == 0)
  {
    -[SBFluidSwitcherRootSwitcherModifier shelfModifierForTransitionEvent:](self, "shelfModifierForTransitionEvent:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "shelf");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v8, 4, v10);

    }
  }
  if (objc_msgSend(v4, "phase") == 1 && (objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    -[SBFluidSwitcherRootSwitcherModifier transitionModifierForMainTransitionEvent:](self, "transitionModifierForMainTransitionEvent:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBFluidSwitcherRootSwitcherModifier switcherModifierLevelForTransitionEvent:](self, "switcherModifierLevelForTransitionEvent:", v4);
    if (v11)
    {
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v11, v12, 0);
      SBLogAppSwitcher();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "succinctDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v15;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for transition %@.", buf, 0x16u);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "consumedPreludeToken");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = -[SBConsumedPreludeAnimationTokenSwitcherEventResponse initWithPreludeToken:]([SBConsumedPreludeAnimationTokenSwitcherEventResponse alloc], "initWithPreludeToken:", v17);
          SBAppendSwitcherModifierResponse(v18, v5);
          v19 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v19;
        }

      }
    }

  }
  return v5;
}

- (int64_t)switcherModifierLevelForTransitionEvent:(id)a3
{
  return 3;
}

- (id)handleEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  kdebug_trace();
  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v7, sel_handleEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  kdebug_trace();
  return v5;
}

- (void)_updateFloorModifierWithProposedFloorModifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 != v4)
  {
    v7 = (void *)v6;
    if (v6 && (id)v6 != v5)
      -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v6);
    v8 = v4;

    if (v5 != v8)
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v8, 6, CFSTR("Fluid Switcher Floor Modifier"));
    SBLogAppSwitcher();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "succinctDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "[%@] Updated floor modifier to %@", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (void)_updateMultitaskingModifierWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherRootSwitcherModifier multitaskingModifierForEvent:](self, "multitaskingModifierForEvent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || v6 == v5)
  {
    v7 = v5;
  }
  else
  {
    if (v5)
      -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v5);
    v7 = v6;

    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v7, 7, CFSTR("Fluid Switcher Multitasking Modifier"));
    SBLogAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "succinctDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "[%@] Updated multitasking modifier to %@", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (id)multitaskingModifier
{
  return -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("Fluid Switcher Multitasking Modifier"));
}

- (id)floorModifier
{
  void *v3;

  -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("Fluid Switcher Floor Modifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_updateFloorModifierWithTransitionEvent:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  -[SBFluidSwitcherRootSwitcherModifier floorModifierForTransitionEvent:](self, "floorModifierForTransitionEvent:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherRootSwitcherModifier.m"), 445, CFSTR("A floor modifier is required"));

    v5 = 0;
  }
  -[SBFluidSwitcherRootSwitcherModifier _updateFloorModifierWithProposedFloorModifier:](self, "_updateFloorModifierWithProposedFloorModifier:", v5);

}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v9)
  {
    -[SBFluidSwitcherRootSwitcherModifier multitaskingModifier](self, "multitaskingModifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherRootSwitcherModifier floorModifier](self, "floorModifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 != v15)
    {
      v13 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  v18.receiver = self;
  v18.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBChainableModifier responseForProposedChildResponse:childModifier:event:](&v18, sel_responseForProposedChildResponse_childModifier_event_, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__SBFluidSwitcherRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
  v17[3] = &unk_1E8EA5850;
  v17[4] = self;
  objc_msgSend(v12, "responseByTransformingResponseWithTransformer:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
}

id __92__SBFluidSwitcherRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 31)
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v5, "modifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "level");
    objc_msgSend(v5, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addChildModifier:atLevel:key:", v6, v7, v8);
    v9 = 0;
  }
  else
  {
    v9 = v3;
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBChainableModifier setDelegate:](&v5, sel_setDelegate_);
  if (a3)
  {
    if (!*(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1))
    {
      *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1) = 1;
      -[SBFluidSwitcherRootSwitcherModifier _setup](self, "_setup");
    }
  }
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!*(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1))
    {
      *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1) = 1;
      -[SBFluidSwitcherRootSwitcherModifier _setup](self, "_setup");
    }
  }
}

- (void)_setup
{
  -[SBFluidSwitcherRootSwitcherModifier _updateMultitaskingModifierWithEvent:](self, "_updateMultitaskingModifierWithEvent:", 0);
  -[SBFluidSwitcherRootSwitcherModifier _updateFloorModifierWithTransitionEvent:](self, "_updateFloorModifierWithTransitionEvent:", 0);
  -[SBFluidSwitcherRootSwitcherModifier _updateReduceMotionModifierWithReduceMotionChangedEvent:](self, "_updateReduceMotionModifierWithReduceMotionChangedEvent:", 0);
  -[SBFluidSwitcherRootSwitcherModifier _updateLowEndHardwareModifier](self, "_updateLowEndHardwareModifier");
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v12, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 1)
  {
    -[SBFluidSwitcherRootSwitcherModifier _updateFloorModifierWithGestureEvent:](self, "_updateFloorModifierWithGestureEvent:", v4);
    if ((objc_msgSend(v4, "isHandled") & 1) == 0)
    {
      -[SBFluidSwitcherRootSwitcherModifier gestureModifierForGestureEvent:](self, "gestureModifierForGestureEvent:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v6, 3, 0);
        SBLogAppSwitcher();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "succinctDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v14 = v9;
          v15 = 2112;
          v16 = v10;
          _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for gesture %@.", buf, 0x16u);

        }
      }

    }
  }
  else if (-[SBFluidSwitcherRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")&& objc_msgSend(v4, "isWindowDragGestureEvent"))
  {
    -[SBFluidSwitcherRootSwitcherModifier _updateFloorModifierWithGestureEvent:](self, "_updateFloorModifierWithGestureEvent:", v4);
  }

  return v5;
}

- (id)handleReduceMotionChangedEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleReduceMotionChangedEvent:](&v7, sel_handleReduceMotionChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherRootSwitcherModifier _updateMultitaskingModifierWithEvent:](self, "_updateMultitaskingModifierWithEvent:", v4, v7.receiver, v7.super_class);
  -[SBFluidSwitcherRootSwitcherModifier _updateReduceMotionModifierWithReduceMotionChangedEvent:](self, "_updateReduceMotionModifierWithReduceMotionChangedEvent:", v4);

  return v5;
}

- (id)handleSwipeToKillEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBSwitcherModifier handleSwipeToKillEvent:](&v14, sel_handleSwipeToKillEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SBFluidSwitcherRootSwitcherModifier _swipeToKillModifierKeyForAppLayout:](self, "_swipeToKillModifierKeyForAppLayout:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v4, "progress");
      if ((BSFloatIsZero() & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        -[SBFluidSwitcherRootSwitcherModifier swipeToKillModifierForSwipeToKillEvent:](self, "swipeToKillModifierForSwipeToKillEvent:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v8, 3, v7);
          SBLogAppSwitcher();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            v10 = (objc_class *)objc_opt_class();
            NSStringFromClass(v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "succinctDescription");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v16 = v11;
            v17 = 2112;
            v18 = v12;
            _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for swipe to kill %@.", buf, 0x16u);

          }
        }
      }
    }

  }
  return v5;
}

- (id)handleHighlightEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBSwitcherModifier handleHighlightEvent:](&v16, sel_handleHighlightEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "appLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leafAppLayoutForRole:", objc_msgSend(v4, "layoutRole"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFluidSwitcherRootSwitcherModifier _highlightModifierKeyForAppLayout:](self, "_highlightModifierKeyForAppLayout:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "phase"))
    {
      -[SBFluidSwitcherRootSwitcherModifier highlightModifierForHighlightEvent:](self, "highlightModifierForHighlightEvent:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v10, 3, v9);
        SBLogAppSwitcher();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "succinctDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v18 = v13;
          v19 = 2112;
          v20 = v14;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for highlight %@.", buf, 0x16u);

        }
      }

    }
  }

  return v5;
}

- (id)handleInsertionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBSwitcherModifier handleInsertionEvent:](&v12, sel_handleInsertionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 1)
  {
    -[SBFluidSwitcherRootSwitcherModifier insertionModifierForInsertionEvent:](self, "insertionModifierForInsertionEvent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v6, 3, 0);
      SBLogAppSwitcher();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "succinctDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for insertion %@.", buf, 0x16u);

      }
    }

  }
  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBSwitcherModifier handleRemovalEvent:](&v12, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 1)
  {
    -[SBFluidSwitcherRootSwitcherModifier removalModifierForRemovalEvent:](self, "removalModifierForRemovalEvent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v6, 3, 0);
      SBLogAppSwitcher();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "succinctDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for removal %@.", buf, 0x16u);

      }
    }

  }
  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBSwitcherModifier handleScrollEvent:](&v12, sel_handleScrollEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "phase") && objc_msgSend(v4, "isUserInitiated"))
  {
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("UserScrollingModifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[SBFluidSwitcherRootSwitcherModifier userScrollingModifierForScrollEvent:](self, "userScrollingModifierForScrollEvent:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v6, 3, CFSTR("UserScrollingModifier"));
        SBLogAppSwitcher();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "succinctDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v14 = v9;
          v15 = 2112;
          v16 = v10;
          _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for scroll %@.", buf, 0x16u);

        }
      }
    }

  }
  return v5;
}

- (id)handleUpdateFocusedAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBSwitcherModifier handleUpdateFocusedAppLayoutEvent:](&v14, sel_handleUpdateFocusedAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FocusedAppModifier-%p"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (objc_msgSend(v4, "isFocused"))
      {
        -[SBFluidSwitcherRootSwitcherModifier focusedAppModifierForUpdateFocusedAppLayoutEvent:](self, "focusedAppModifierForUpdateFocusedAppLayoutEvent:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v8, 3, v7);
          SBLogAppSwitcher();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = (objc_class *)objc_opt_class();
            NSStringFromClass(v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "succinctDescription");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v16 = v11;
            v17 = 2112;
            v18 = v12;
            _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Adding child modifier for focusedApp %@.", buf, 0x16u);

          }
        }
      }
      else
      {
        v8 = 0;
      }
    }

  }
  return v5;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  return 0;
}

- (id)floorModifierForGestureEvent:(id)a3
{
  return 0;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  return 0;
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  return 0;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  return 0;
}

- (id)transitionModifierForInlineTransitionEvent:(id)a3
{
  return 0;
}

- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3
{
  return 0;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  return 0;
}

- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3
{
  return 0;
}

- (id)highlightModifierForHighlightEvent:(id)a3
{
  return 0;
}

- (id)removalModifierForRemovalEvent:(id)a3
{
  return 0;
}

- (id)lowEndHardwareModifier
{
  return 0;
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  return 0;
}

- (id)shelfModifierForTransitionEvent:(id)a3
{
  return 0;
}

- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3
{
  return 0;
}

- (id)transientlyVisibleSlideOverTongueModifier
{
  return -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("Fluid Switcher Transiently Visible Slide Over Tongue Modifier"));
}

- (void)_updateFloorModifierWithGestureEvent:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  -[SBFluidSwitcherRootSwitcherModifier floorModifierForGestureEvent:](self, "floorModifierForGestureEvent:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherRootSwitcherModifier.m"), 451, CFSTR("A floor modifier is required"));

    v5 = 0;
  }
  -[SBFluidSwitcherRootSwitcherModifier _updateFloorModifierWithProposedFloorModifier:](self, "_updateFloorModifierWithProposedFloorModifier:", v5);

}

- (void)_updateReduceMotionModifierWithReduceMotionChangedEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFluidSwitcherRootSwitcherModifier _reduceMotionModifier](self, "_reduceMotionModifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherRootSwitcherModifier reduceMotionModifierForReduceMotionChangedEvent:](self, "reduceMotionModifierForReduceMotionChangedEvent:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6 && v5 != (void *)v6)
  {
    -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v5);
    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v7, 1, CFSTR("Fluid Switcher Reduce Motion Modifier"));
    SBLogAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "succinctDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "[Fluid Switcher Root] Handled reduce motion changed event %@ by adding child modifier %@.", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)_updateLowEndHardwareModifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[SBFluidSwitcherRootSwitcherModifier lowEndHardwareModifier](self, "lowEndHardwareModifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("Fluid Switcher Low End Hardware Modifier"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4 && (void *)v4 != v3)
    {
      -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v4);
      SBLogAppSwitcher();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "succinctDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "[Fluid Switcher Root] Removed low end hardware modifier: %@.", (uint8_t *)&v10, 0xCu);

      }
    }
    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v3, 0, CFSTR("Fluid Switcher Low End Hardware Modifier"));
    SBLogAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "succinctDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "[Fluid Switcher Root] Added low end hardware modifier: %@.", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (id)_swipeToKillModifierKeyForAppLayout:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SwipeToKill-%p"), a3);
}

- (id)_highlightModifierKeyForAppLayout:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Highlight-%p"), a3);
}

- (id)_reduceMotionModifier
{
  return -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("Fluid Switcher Reduce Motion Modifier"));
}

@end
