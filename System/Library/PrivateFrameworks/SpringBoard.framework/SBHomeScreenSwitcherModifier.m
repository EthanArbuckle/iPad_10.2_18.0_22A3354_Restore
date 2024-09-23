@implementation SBHomeScreenSwitcherModifier

- (SBHomeScreenSwitcherModifier)init
{
  SBHomeScreenSwitcherModifier *v2;
  SBCoplanarSwitcherModifier *v3;
  SBCoplanarSwitcherModifier *coplanarModifier;
  _SBHomeScreenFloorSwitcherModifier *v5;
  _SBHomeScreenFloorSwitcherModifier *homeScreenFloorModifier;
  SBDefaultImplementationsSwitcherModifier *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHomeScreenSwitcherModifier;
  v2 = -[SBSwitcherModifier init](&v9, sel_init);
  if (v2)
  {
    v3 = -[SBCoplanarSwitcherModifier initWithActiveAppLayout:]([SBCoplanarSwitcherModifier alloc], "initWithActiveAppLayout:", 0);
    coplanarModifier = v2->_coplanarModifier;
    v2->_coplanarModifier = v3;

    -[SBChainableModifier addChildModifier:atLevel:key:](v2, "addChildModifier:atLevel:key:", v2->_coplanarModifier, 0, 0);
    v5 = objc_alloc_init(_SBHomeScreenFloorSwitcherModifier);
    homeScreenFloorModifier = v2->_homeScreenFloorModifier;
    v2->_homeScreenFloorModifier = v5;

    -[SBChainableModifier addChildModifier:atLevel:key:](v2, "addChildModifier:atLevel:key:", v2->_homeScreenFloorModifier, 1, 0);
    v7 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    -[SBChainableModifier addChildModifier:atLevel:key:](v2, "addChildModifier:atLevel:key:", v7, 2, 0);

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
  objc_storeStrong((id *)&self->_homeScreenFloorModifier, 0);
}

@end
