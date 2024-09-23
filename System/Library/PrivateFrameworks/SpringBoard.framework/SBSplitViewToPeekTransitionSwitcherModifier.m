@implementation SBSplitViewToPeekTransitionSwitcherModifier

- (SBSplitViewToPeekTransitionSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4
{
  id v7;
  SBSplitViewToPeekTransitionSwitcherModifier *v8;
  SBSplitViewToPeekTransitionSwitcherModifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSplitViewToPeekTransitionSwitcherModifier;
  v8 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v11, sel_initWithTransitionID_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_fromAppLayout, a4);

  return v9;
}

- (void)didMoveToParentModifier:(id)a3
{
  SBSplitDisplayItemSwitcherModifier *v5;
  void *v6;
  void *v7;
  SBSplitDisplayItemSwitcherModifier *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSplitViewToPeekTransitionSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v9, sel_didMoveToParentModifier_);
  if (a3)
  {
    v5 = [SBSplitDisplayItemSwitcherModifier alloc];
    -[SBAppLayout zOrderedItems](self->_fromAppLayout, "zOrderedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBSplitDisplayItemSwitcherModifier initWithDisplayItem:](v5, "initWithDisplayItem:", v7);
    -[SBChainableModifier addChildModifier:](self, "addChildModifier:", v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
