@implementation SBActiveAppLayoutFloatingSwitcherModifier

- (SBActiveAppLayoutFloatingSwitcherModifier)initWithActiveAppLayout:(id)a3 floatingConfiguration:(int64_t)a4 environmentMode:(int64_t)a5
{
  id v8;
  SBActiveAppLayoutFloatingSwitcherModifier *v9;
  SBStackedFloatingSwitcherModifier *v10;
  SBStackedFloatingSwitcherModifier *stackedModifier;
  _SBActiveAppFloorFloatingSwitcherModifier *v12;
  _SBActiveAppFloorFloatingSwitcherModifier *floorModifier;
  SBDefaultImplementationsSwitcherModifier *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBActiveAppLayoutFloatingSwitcherModifier;
  v9 = -[SBSwitcherModifier init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(SBStackedFloatingSwitcherModifier);
    stackedModifier = v9->_stackedModifier;
    v9->_stackedModifier = v10;

    -[SBChainableModifier addChildModifier:atLevel:key:](v9, "addChildModifier:atLevel:key:", v9->_stackedModifier, 0, 0);
    v12 = -[_SBActiveAppFloorFloatingSwitcherModifier initWithActiveAppLayout:floatingConfiguration:environmentMode:]([_SBActiveAppFloorFloatingSwitcherModifier alloc], "initWithActiveAppLayout:floatingConfiguration:environmentMode:", v8, a4, a5);
    floorModifier = v9->_floorModifier;
    v9->_floorModifier = v12;

    -[SBChainableModifier addChildModifier:atLevel:key:](v9, "addChildModifier:atLevel:key:", v9->_floorModifier, 1, 0);
    v14 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    -[SBChainableModifier addChildModifier:atLevel:key:](v9, "addChildModifier:atLevel:key:", v14, 2, 0);

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorModifier, 0);
  objc_storeStrong((id *)&self->_stackedModifier, 0);
}

@end
