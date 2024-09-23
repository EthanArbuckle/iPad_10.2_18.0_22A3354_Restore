@implementation SBFullScreenAppLayoutSwitcherModifier

- (SBFullScreenAppLayoutSwitcherModifier)initWithActiveAppLayout:(id)a3 homeAffordanceReuseIdentifier:(id)a4
{
  id v8;
  id v9;
  SBFullScreenAppLayoutSwitcherModifier *v10;
  void *v11;
  SBCoplanarSwitcherModifier *v12;
  SBCoplanarSwitcherModifier *coplanarModifier;
  _SBFullScreenAppFloorSwitcherModifier *v14;
  _SBFullScreenAppFloorSwitcherModifier *floorModifier;
  SBDefaultImplementationsSwitcherModifier *v16;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBFullScreenAppLayoutSwitcherModifier;
  v10 = -[SBSwitcherModifier init](&v19, sel_init);
  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("SBFullScreenAppLayoutSwitcherModifier.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    v11 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v10->_homeAffordanceReuseIdentifier, v11);
    if (!v9)

    v10->_handlesAssistantPresentationEvents = 1;
    objc_storeStrong((id *)&v10->_appLayout, a3);
    v12 = -[SBCoplanarSwitcherModifier initWithActiveAppLayout:]([SBCoplanarSwitcherModifier alloc], "initWithActiveAppLayout:", v8);
    coplanarModifier = v10->_coplanarModifier;
    v10->_coplanarModifier = v12;

    -[SBChainableModifier addChildModifier:atLevel:key:](v10, "addChildModifier:atLevel:key:", v10->_coplanarModifier, 0, 0);
    v14 = -[_SBFullScreenAppFloorSwitcherModifier initWithActiveAppLayout:homeAffordanceReuseIdentifier:]([_SBFullScreenAppFloorSwitcherModifier alloc], "initWithActiveAppLayout:homeAffordanceReuseIdentifier:", v8, v10->_homeAffordanceReuseIdentifier);
    floorModifier = v10->_floorModifier;
    v10->_floorModifier = v14;

    -[SBChainableModifier addChildModifier:atLevel:key:](v10, "addChildModifier:atLevel:key:", v10->_floorModifier, 2, 0);
    v16 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    -[SBChainableModifier addChildModifier:atLevel:key:](v10, "addChildModifier:atLevel:key:", v16, 3, 0);

  }
  return v10;
}

- (SBFullScreenAppLayoutSwitcherModifier)initWithActiveAppLayout:(id)a3
{
  return -[SBFullScreenAppLayoutSwitcherModifier initWithActiveAppLayout:homeAffordanceReuseIdentifier:](self, "initWithActiveAppLayout:homeAffordanceReuseIdentifier:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_floorModifier, 0);
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

- (CGRect)fullScreenFrameForAppLayout:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_SBFullScreenAppFloorSwitcherModifier frameForAppLayout:](self->_floorModifier, "frameForAppLayout:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenAppLayoutSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
    -[SBFullScreenAppLayoutSwitcherModifier _addAssistantModifierIfNeededForInterfaceOrientation:](self, "_addAssistantModifierIfNeededForInterfaceOrientation:", -[SBFullScreenAppLayoutSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
}

- (id)handleAssistantPresentationChangedEvent:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenAppLayoutSwitcherModifier;
  -[SBSwitcherModifier handleAssistantPresentationChangedEvent:](&v6, sel_handleAssistantPresentationChangedEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFullScreenAppLayoutSwitcherModifier _addAssistantModifierIfNeededForInterfaceOrientation:](self, "_addAssistantModifierIfNeededForInterfaceOrientation:", -[SBFullScreenAppLayoutSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenAppLayoutSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTransitionEvent:](&v9, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fromInterfaceOrientation", v9.receiver, v9.super_class);
  v7 = objc_msgSend(v4, "toInterfaceOrientation");

  if (v7 != v6 && (unint64_t)(v7 - 1) <= 1)
    -[SBFullScreenAppLayoutSwitcherModifier _addAssistantModifierIfNeededForInterfaceOrientation:](self, "_addAssistantModifierIfNeededForInterfaceOrientation:", v7);
  return v5;
}

- (void)_addAssistantModifierIfNeededForInterfaceOrientation:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *v8;
  id v9;

  if (-[SBFullScreenAppLayoutSwitcherModifier handlesAssistantPresentationEvents](self, "handlesAssistantPresentationEvents"))
  {
    if ((-[SBFullScreenAppLayoutSwitcherModifier isDevicePad](self, "isDevicePad") & 1) == 0)
    {
      v5 = -[SBSwitcherModifier isAssistantEffectivelyPresentedForSAETypeToSiri](self, "isAssistantEffectivelyPresentedForSAETypeToSiri");
      -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("SBFullScreenAppLayoutSwitcherModifierAssistantModifierKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)(a3 - 1) <= 1 && v5 && !v6)
      {
        -[SBFullScreenAppLayoutSwitcherModifier switcherSettings](self, "switcherSettings");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "effectiveSwitcherStyle");

        -[SBFullScreenAppLayoutSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled");
        v9 = objc_alloc_init((Class)objc_opt_class());
        v8 = -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier initWithAppLayout:interfaceOrientation:multitaskingModifier:]([SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier alloc], "initWithAppLayout:interfaceOrientation:multitaskingModifier:", self->_appLayout, a3, v9);
        -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v8, 1, CFSTR("SBFullScreenAppLayoutSwitcherModifierAssistantModifierKey"));

      }
    }
  }
}

- (NSUUID)homeAffordanceReuseIdentifier
{
  return self->_homeAffordanceReuseIdentifier;
}

- (void)setHomeAffordanceReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceReuseIdentifier, a3);
}

- (BOOL)handlesAssistantPresentationEvents
{
  return self->_handlesAssistantPresentationEvents;
}

- (void)setHandlesAssistantPresentationEvents:(BOOL)a3
{
  self->_handlesAssistantPresentationEvents = a3;
}

@end
